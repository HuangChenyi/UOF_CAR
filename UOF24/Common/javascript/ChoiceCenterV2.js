
var Choice = function () { };

Choice.ChoiceType = Object.freeze({
    Department: 0,
    DepartmentUser: 1,
    DepartmentJobTitle: 2,
    DepartmentJobFunction: 3,
    JobTitle: 4,
    JobFunction: 5,
    Group: 6,
    MemberClass: 7,
    GroupUser: 8,
    GroupMemberClass: 9,
    Favorite: 10,
    Employee: 11,
    UserDept: 12,
    Contact: 13
});
//限定選人需要
//Employee顯示員工
//UserDept顯示使用者部門
//#region userSet

Choice.UserSet = function () {
    var self = this;

    var elements = [];

    elements.remove = function (from, to) {
        var rest = this.slice((to || from) + 1 || this.length);
        this.length = from < 0 ? this.length + from : from;
        return this.push.apply(this, rest);
    };

    this.get = function (index) {
        return elements[index];
    };

    this.getKey = function (index) {
        var item = elements[index];
        var type = item["@type"];
        var key = "";

        switch (type) {
            case "group":
                key = type + "|" + item["groupId"] + "|" + item["@isDepth"];
                break;
            case "user":
                key = type + "|" + item["userId"];
                break;
            case "jobTitle":
                key = type + "|" + item["jobTitleId"];
                break;
            case "jobTitleOfGroup":
                key = type + "|" + item["jobTitleId"] + "|" + item["groupId"] + "|" + item["@isDepth"];
                break;
            case "jobFunction":
                key = type + "|" + item["jobFunctionId"];
                break;
            case "jobFunctionOfGroup":
                key = type + "|" + item["jobFunctionId"] + "|" + item["groupId"] + "|" + item["@isDepth"];
                break;
            case "membClass":
                key = type + "|" + item["membClassId"];
                break;
            case "membClassOfGroup":
                key = type + "|" + item["membClassId"] + "|" + item["groupId"] + "|" + item["@isDepth"];
                break;
            case "class":
                key = type + "|" + item["classId"];
                break;
            case "contact":
                key = type + "|" + item["contactId"] ;
                break;
        }

        return key;
    };

    this.count = function () {
        return elements.length;
    };

    this.exists = function (type, id, groupId, isDepth) {

        if (type == "user") {
            return self.user.exists(id);
        } else if (type == "group") {
            return self.group.exists(groupId, isDepth);
        } else {
            return self[type].exists(id, groupId, isDepth);
        }

    };

    this.removeByKey = function (key) {

        var para = key.split("|");
        var type = para[0];

        switch (type) {
            case "group":
                self.group.remove(para[1], para[2] == "True");
                break;
            case "user":
                self.user.remove(para[1]);
                break;
            case "jobTitle":
                self.jobTitle.remove(para[1]);
                break;
            case "jobTitleOfGroup":
                self.jobTitle.remove(para[1], para[2], para[3] == "True");
                break;
            case "jobFunction":
                self.jobFunction.remove(para[1]);
                break;
            case "jobFunctionOfGroup":
                self.jobFunction.remove(para[1], para[2], para[3] == "True");
                break;
            case "membClass":
                self.membClass.remove(para[1]);
                break;
            case "membClassOfGroup":
                self.membClass.remove(para[1], para[2], para[3] == "True");
                break;
            case "class":
                self.addressBookClass.remove(para[1]);
                break;
            case "contact":
                self.addressBookContact.remove(para[1]);
                break;
        }



    };


    this.fromString = function (json) {
        if (json != "") {
            var obj = JSON.parse(json);
            if (obj["UserSet"] != null) {
                elements.push.apply(elements, obj["UserSet"]["Element"]);
            }
        }
    };

    this.toSring = function () {
        return JSON.stringify(
            {
                "UserSet": {
                    "Element": elements
                }
            });
    };
    this.user = {
        add: function (userId, text, image) {
            /// <summary>
            /// 新增使用者
            /// </summary>
            /// <param name="userId">代碼</param>
            /// <param name="name">名稱</param>
            /// <param name="userType">類型</param>
            var index = elements.push({
                "@type": "user",
                "text": text,
                "image": image,
                "userId": userId
            });
            return index - 1;
        },
        exists: function (userId) {
            /// <summary>
            /// 使用者是否存在
            /// </summary>
            /// <param name="userId"></param>
            /// <returns type=""></returns>
            return (self.user.indexOf(userId) > -1);
        },
        indexOf: function (userId) {
            /// <summary>
            /// 搜尋使用者
            /// </summary>
            /// <param name="userId">代碼</param>
            /// <returns type="">索引,找不到時回傳-1</returns>
            var index;
            for (index = elements.length - 1; index >= 0; --index) {
                var obj = elements[index];
                if (obj["@type"] == "user" && obj["userId"] == userId) {
                    return index;
                }
            }
            return -1;

        },
        remove: function (userId) {
            /// <summary>
            /// 移除使用者
            /// </summary>
            /// <param name="userId">使用者代碼</param>
            var index = self.user.indexOf(userId);
            if (index > -1) {
                elements.remove(index);
            }
        }
    };

    this.group = {
        add: function (groupId, isDepth, text, image) {
            var index = elements.push({
                "@type": "group",
                "text": text,
                "groupId": groupId,
                "image": image,
                "@isDepth": isDepth ? "True" : "False"
            });
            return index - 1;
        },
        exists: function (groupId, isDepth) {
            return (self.group.indexOf(groupId, isDepth) > -1);
        },
        indexOf: function (groupId, isDepth) {

            var index;
            var strIsDepth = isDepth ? "True" : "False";
            for (index = elements.length - 1; index >= 0; --index) {
                var obj = elements[index];
                if (obj["@type"] == "group" && obj["groupId"] == groupId && obj["@isDepth"] == strIsDepth) {
                    return index;
                }
            }
            return -1;

        },
        remove: function (groupId, isDepth) {
            var index = self.group.indexOf(groupId, isDepth);
            if (index > -1) {
                elements.remove(index);
            }

        }
    };

    this.jobTitle = {
        add: function (jobTitleId, text, image, groupId, isDepth) {
            var index;
            if (groupId == undefined) {
                index = elements.push({
                    "@type": "jobTitle",
                    "text": text,
                    "image": image,
                    "jobTitleId": jobTitleId
                });
            } else {
                index = elements.push({
                    "@type": "jobTitleOfGroup",
                    "text": text,
                    "image": image,
                    "jobTitleId": jobTitleId,
                    "groupId": groupId,
                    "@isDepth": isDepth ? "True" : "False"
                });
            }
            return index - 1;
        },
        exists: function (jobTitleId, groupId, isDepth) {
            return (self.jobTitle.indexOf(jobTitleId, groupId, isDepth) > -1);
        },
        indexOf: function (jobTitleId, groupId, isDepth) {

            var index;
            if (groupId == undefined) {
                for (index = elements.length - 1; index >= 0; --index) {
                    var obj = elements[index];
                    if (obj["@type"] == "jobTitle" && obj["jobTitleId"] == jobTitleId) {
                        return index;
                    }
                }
            } else {
                for (index = elements.length - 1; index >= 0; --index) {
                    var obj = elements[index];
                    var strIsDepth = isDepth ? "True" : "False";
                    if (obj["@type"] == "jobTitleOfGroup" && obj["jobTitleId"] == jobTitleId && obj["groupId"] == groupId && obj["@isDepth"] == strIsDepth) {
                        return index;
                    }
                }
            }
            return -1;

        },
        remove: function (jobTitleId, groupId, isDepth) {
            var index = self.jobTitle.indexOf(jobTitleId, groupId, isDepth);
            if (index > -1) {
                elements.remove(index);
            }
        }
    };

    this.jobFunction = {
        add: function (jobFunctionId, text, image, groupId, isDepth) {
            var index;
            if (groupId == undefined) {
                index = elements.push({
                    "@type": "jobFunction",
                    "text": text,
                    "image": Choice.getTypeImage(Choice.ChoiceType.JobFunction),
                    "jobFunctionId": jobFunctionId
                });
            } else {
                index = elements.push({
                    "@type": "jobFunctionOfGroup",
                    "text": text,
                    "image": image,
                    "jobFunctionId": jobFunctionId,
                    "groupId": groupId,
                    "@isDepth": isDepth ? "True" : "False"
                });
            }
            return index - 1;
        },
        exists: function (jobFunctionId, groupId, isDepth) {
            return (self.jobFunction.indexOf(jobFunctionId, groupId, isDepth) > -1);
        },
        indexOf: function (jobFunctionId, groupId, isDepth) {

            var index;
            if (groupId == undefined) {
                for (index = elements.length - 1; index >= 0; --index) {
                    var obj = elements[index];
                    if (obj["@type"] == "jobFunction" && obj["jobFunctionId"] == jobFunctionId) {
                        return index;
                    }
                }
            } else {
                for (index = elements.length - 1; index >= 0; --index) {
                    var obj = elements[index];
                    var strIsDepth = isDepth ? "True" : "False";
                    if (obj["@type"] == "jobFunctionOfGroup" && obj["jobFunctionId"] == jobFunctionId && obj["groupId"] == groupId && obj["@isDepth"] == strIsDepth) {
                        return index;
                    }
                }
            }
            return -1;

        },
        remove: function (jobFunctionId, groupId, isDepth) {
            var index = self.jobFunction.indexOf(jobFunctionId, groupId, isDepth);
            if (index > -1) {
                elements.remove(index);
            }
        }
    };

    this.membClass = {
        add: function (membClassId, text, image, groupId, isDepth) {
            var index;
            if (groupId == undefined) {
                index = elements.push({
                    "@type": "membClass",
                    "text": text,
                    "image": image,
                    "membClassId": membClassId
                });
            } else {
                index = elements.push({
                    "@type": "membClassOfGroup",
                    "text": text,
                    "image": image,
                    "membClassId": membClassId,
                    "groupId": groupId,
                    "@isDepth": isDepth ? "True" : "False"
                });
            }
            return index - 1;
        },
        exists: function (membClassId, groupId, isDepth) {
            return (self.membClass.indexOf(membClassId, groupId, isDepth) > -1);
        },
        indexOf: function (membClassId, groupId, isDepth) {

            var index;
            if (groupId == undefined) {
                for (index = elements.length - 1; index >= 0; --index) {
                    var obj = elements[index];
                    if (obj["@type"] == "membClass" && obj["membClassId"] == membClassId) {
                        return index;
                    }
                }
            } else {
                for (index = elements.length - 1; index >= 0; --index) {
                    var obj = elements[index];
                    var strIsDepth = isDepth ? "True" : "False";
                    if (obj["@type"] == "membClassOfGroup" && obj["membClassId"] == membClassId && obj["groupId"] == groupId && obj["@isDepth"] == strIsDepth) {
                        return index;
                    }
                }
            }
            return -1;

        },
        remove: function (membClassId, groupId, isDepth) {
            var index = self.membClass.indexOf(membClassId, groupId, isDepth);
            if (index > -1) {
                elements.remove(index);
            }
        }
    };
    //for 通訊錄聯絡人類別
    this.addressBookClass = {
        add: function (classId, text, image)
        {
            var index = elements.push({
                "@type": "class",
                "text": text,
                "image": image,
                "classId": classId
            });
            return index - 1;
        },
        exists: function (classId) {
            return (self.addressBookClass.indexOf(classId) > -1);
        },
        indexOf: function (classId) {
            var index;
            for (index = elements.length - 1; index >= 0; --index) {
                var obj = elements[index];
                if (obj["@type"] == "class" && obj["classId"] == classId) {
                    return index;
                }
            }
            return -1;

        },
        remove: function (classId) {
            var index = self.addressBookClass.indexOf(classId);
            if (index > -1) {
                elements.remove(index);
            }
        }
    };
    //for 通訊錄聯絡人
    this.addressBookContact = {
        add: function (contactId, text, image) {
            var index = elements.push({
                "@type": "contact",
                "text": text,
                "image": image,
                "contactId": contactId
            });
            return index - 1;
        },
        exists: function (contactId) {
            return (self.addressBookContact.indexOf(contactId) > -1);
        },
        indexOf: function (contactId) {
            var index;
            for (index = elements.length - 1; index >= 0; --index) {
                var obj = elements[index];
                if (obj["@type"] == "contact" && obj["contactId"] == contactId) {
                    return index;
                }
            }
            return -1;

        },
        remove: function (contactId) {
            var index = self.addressBookContact.indexOf(contactId);
            if (index > -1) {
                elements.remove(index);
            }
        }
    };

};

//#endregion userSet
            

Choice.Config = {
    "userCache": null,
    "userPageSize": 20,
    "userPageIndex": 1,
    "userMaxPageIndex": 1,
    "departmentCache": null,
    "departmentIndex": 0,
    "groupCache": null,
    "groupIndex": 0,
    "currentMode": Choice.ChoiceType.Department,
    "resultPageSize": 20,
    "resultPageIndex": 1,
    "resultMaxPageIndex": 1,
    "resultUserSet": null,
    "onlyAvailable": 1, //是否顯示可用帳號（排除已停用、過期）
    "displayAllDept": 0 //是否包含已停用部門資料(預設:不含停用部門)
};
        
            

//#regio utility


Choice.getTypeImage = function getTypeImage(type, isDepth) {

    var image = "";
    var rootPath = $uof.tool.getRootPath() + "Common/Images/Icon/";

    switch (type) {
        case Choice.ChoiceType.UserDept:
        case Choice.ChoiceType.DepartmentUser:
            image = rootPath + "icon_m17.png";
            break;
        case Choice.ChoiceType.Department:
            if (isDepth != undefined && isDepth) {
                image = rootPath + "icon_m22.png";
            } else {
                image = rootPath + "icon_m01.png";
            }
            break;
        case Choice.ChoiceType.JobTitle:
            image = rootPath + "icon_m18.png";
            break;
        case Choice.ChoiceType.DepartmentJobTitle:
            if (isDepth != undefined && isDepth) {
                image = rootPath + "icon_m23.png";
            } else {
                image = rootPath + "icon_m20.png";
            }
            break;
        case Choice.ChoiceType.JobFunction:
            image = rootPath + "icon_m19.png";
            break;
        case Choice.ChoiceType.DepartmentJobFunction:
            if (isDepth != undefined && isDepth) {
                image = rootPath + "icon_m24.png";
            } else {
                image = rootPath + "icon_m21.png";
            }
            break;
        case Choice.ChoiceType.MemberClass:
            image = rootPath + "icon_m138.png";
            break;
        case Choice.ChoiceType.GroupUser:
            image = rootPath + "icon_m30.png";
            break;
        case Choice.ChoiceType.Group:
            if (isDepth != undefined && isDepth) {
                image = rootPath + "icon_m137.png";
            } else {
                image = rootPath + "icon_m05.png";
            }
            break;
        case Choice.ChoiceType.GroupMemberClass:
            if (isDepth != undefined && isDepth) {
                image = rootPath + "icon_m140.png";
            } else {
                image = rootPath + "icon_m139.png";
            }
            break;
        case Choice.ChoiceType.Employee:
            image = rootPath + "icon_m17.png";
            break;
        case Choice.ChoiceType.Contact:
            image = rootPath + "icon_c08.gif";
            break;
        case Choice.ChoiceType.Favorite:
            image = rootPath + "icon_m192.png";
            break;
    }

    return image;

};

Choice.switchMode = function switchMode(type) {
    if (type == Choice.ChoiceType.Department) {
        $("#divDepartment").show();
        $('#divDepartment').css({ 'background-color': '' });
    } else if (type == Choice.ChoiceType.DepartmentUser) {
        $('#txbKeyWordUser').val("");
        $("#divDepartment").show();
        $('#divDepartment').css({ 'background-color': '#d9d9d9' });
        $("#divUser").show();
        $("#divAllowSubDept").hide();
        var node = Choice.Config.Trees.Department.get_selectedNode();
        Choice.submitSearchUser({ "action": "GetDepartmentUser", "id": node.get_value(), "onlyAvailable": Choice.Config.onlyAvailable, "displayAllDept": Choice.Config.displayAllDept });
    } else if (type == Choice.ChoiceType.JobTitle) {
        $("#divJobTitle").show();
    } else if (type == Choice.ChoiceType.DepartmentJobTitle) {
        $("#divDepartment").show();
        $('#divDepartment').css({ 'background-color': '#d9d9d9' });
        $("#divJobTitle").show();
    } else if (type == Choice.ChoiceType.JobFunction) {
        $("#divJobFunction").show();
    } else if (type == Choice.ChoiceType.DepartmentJobFunction) {
        $("#divDepartment").show();
        $('#divDepartment').css({ 'background-color': '#d9d9d9' });
        $("#divJobFunction").show();
    } else if (type == Choice.ChoiceType.Group) {
        $("#divGroup").show();
        $('#divGroup').css({ 'background-color': '' });
    } else if (type == Choice.ChoiceType.GroupUser) {
        $('#txbKeyWordUser').val("");
        $("#divGroup").show();
        $('#divGroup').css({ 'background-color': '#d9d9d9' });
        $("#divUser").show();
        $("#divAllowSubGroup").hide();
        var node = Choice.Config.Trees.Group.get_selectedNode();
        if (node != null) {
            Choice.submitSearchUser({ "action": "GetGroupUser", "id": node.get_value(),"onlyAvailable":Choice.Config.onlyAvailable });
        }
        else {
            Choice.submitSearchUser({ "action": "GetGroupUser", "id": "","onlyAvailable":Choice.Config.onlyAvailable });
        }
    } else if (type == Choice.ChoiceType.MemberClass) {
        $("#divMemberClass").show();
    } else if (type == Choice.ChoiceType.GroupMemberClass) {
        $("#divGroup").show();
        $('#divGroup').css({ 'background-color': '#d9d9d9' });
        $("#divMemberClass").show();
    } else if (type == Choice.ChoiceType.Favorite) {
        $("#divFavorite").show();
    }
    else if (type == Choice.ChoiceType.Employee)
    {
        $("#divEmployee").show();
        $("#divUser").hide();
    }
    else if (type == Choice.ChoiceType.UserDept)
    {
        $("#divUserDpt").show();
        $("#divUserDpt").css({ 'background-color': '#d9d9d9' });
        $("#divUser").show();
    }
};

//#endregion utility




            

            
//#region Result 

Choice.setExpendToUser = function setExpendToUser(type, id, groupId, isDepth, displayAllDept, specifiedSort) {

    var strType;
    for (var key in Choice.ChoiceType) {
        if (Choice.ChoiceType[key] == type) {
            strType = key;
        }
    }

    $.ajax({
        url: "../../Common/ChoiceCenter/ChoiceHandler.ashx",
        type: "POST",
        dataType: "json",
        data: { "action": "GetExpendToUser", "type": strType, "id": id, "groupId": groupId, "isDepth": isDepth, "displayAllDept": displayAllDept, "specifiedSort": specifiedSort }
    }).done(function(response, textStatus, jqXHR) {

        for (var i = 0; i < response.length; i++) {
            var item = response[i];
            var image = Choice.getTypeImage(item.type);
            var exists = Choice.Config.resultUserSet.user.exists(item.id);
            if (!exists) {
                Choice.Config.resultUserSet.user.add(item.id, item.name, image);
            }
        }
        Choice.setResultPaging(true);

    }).fail(function(jqXHR, textStatus, errorThrown) {
        console.error(
            "The following error occured: " +
                textStatus, errorThrown
        );
    });
};

Choice.getResultUserSet = function getResultUserSet(displayAllDept) {
    
    $.ajax({
        url: "../../Common/ChoiceCenter/ChoiceHandler.ashx",
        type: "POST",
        dataType: "json",
        data: { "action": "ArrangeResultUserSet", "data": Choice.Config.resultUserSet.toSring(), "displayAllDept": displayAllDept },
        async: false
    }).done(function (response, textStatus, jqXHR) {
        if (response !== null && response !== '' && response !== undefined) {
            var resultCcount = response.UserSet.Element.length;
            if (resultCcount > 0) {
                Choice.Config.resultUserSet = new Choice.UserSet;

                for (var i = 0; i < resultCcount; i++) {
                    var item = response.UserSet.Element[i];
                    var name = item['text'];
                    var userId = item['userId'];

                    Choice.addToResult(Choice.ChoiceType.Employee, name, userId);
                }
            }
        }
        }).fail(function (jqXHR, textStatus, errorThrown) {
        console.error(
            "The following error occured: " +
            textStatus, errorThrown
        );
    });
};

Choice.addToResult = function addToResult(type, name, id, groupName, groupId, isDepth, isFavorite) {

    var exists = false;
    var text = "";
    var image = "";
    var index;

    switch (type) {
        case Choice.ChoiceType.Department:
        case Choice.ChoiceType.Group:
            text = groupName;
            image = Choice.getTypeImage(type, isDepth);
            exists = Choice.Config.resultUserSet.group.exists(groupId, isDepth);
            if (!exists) {
                index = Choice.Config.resultUserSet.group.add(groupId, isDepth, text, image);
            }
            break;
        case Choice.ChoiceType.DepartmentUser:
        case Choice.ChoiceType.Employee:
        case Choice.ChoiceType.UserDept:
        case Choice.ChoiceType.GroupUser:
            text = name;
            image = Choice.getTypeImage(type);
            exists = Choice.Config.resultUserSet.user.exists(id);
            if (!exists) {
                index = Choice.Config.resultUserSet.user.add(id, text, image);
            }
            break;
        case Choice.ChoiceType.JobTitle:
            text = name;
            image = Choice.getTypeImage(type);
            exists = Choice.Config.resultUserSet.jobTitle.exists(id);
            if (!exists) {
                index = Choice.Config.resultUserSet.jobTitle.add(id, text, image);
            }
            break;
        case Choice.ChoiceType.DepartmentJobTitle:
            if (isFavorite) {
                text = name;
            }
            else {
                if (groupName === null)
                    text = name;
                else
                    text = groupName + "-" + name;
            }
            image = Choice.getTypeImage(type, isDepth);
            exists = Choice.Config.resultUserSet.jobTitle.exists(id, groupId, isDepth);
            if (!exists) {
                index = Choice.Config.resultUserSet.jobTitle.add(id, text, image, groupId, isDepth);
            }
            break;
        case Choice.ChoiceType.JobFunction:
            text = name;
            image = Choice.getTypeImage(type);
            exists = Choice.Config.resultUserSet.jobFunction.exists(id);
            if (!exists) {
                index = Choice.Config.resultUserSet.jobFunction.add(id, text, image);
            }
            break;
        case Choice.ChoiceType.DepartmentJobFunction:
            if (isFavorite) {
                text = name;
            }
            else {
                if (groupName === null)
                    text = name;
                else
                    text = groupName + "-" + name;
            }
            image = Choice.getTypeImage(type, isDepth);
            exists = Choice.Config.resultUserSet.jobFunction.exists(id, groupId, isDepth);
            if (!exists) {
                index = Choice.Config.resultUserSet.jobFunction.add(id, text, image, groupId, isDepth);
            }
            break;
        case Choice.ChoiceType.MemberClass:
            text = name;
            image = Choice.getTypeImage(type);
            exists = Choice.Config.resultUserSet.membClass.exists(id);
            if (!exists) {
                index = Choice.Config.resultUserSet.membClass.add(id, text, image);
            }
            break;
        case Choice.ChoiceType.GroupMemberClass:
            if (isFavorite) {
                text = name;
            }
            else {
                text = groupName + "-" + name;
            }
            image = Choice.getTypeImage(type, isDepth);
            exists = Choice.Config.resultUserSet.membClass.exists(id, groupId, isDepth);
            if (!exists) {
                index = Choice.Config.resultUserSet.membClass.add(id, text, image, groupId, isDepth);
            }
            break;
    }

    if (!exists) {
        Choice.setResultPaging(true);
    } else {
        $("#flashMessage").fadeIn(200).fadeOut(100).fadeIn(200).fadeOut(100);
    }

};

Choice.setResultPaging = function setResultPaging(scroll) {

    var length = Choice.Config.resultUserSet.count();
    if (length > 0) {
        Choice.Config.resultMaxPageIndex = Math.ceil(length / Choice.Config.resultPageSize);
        if (scroll || Choice.Config.resultPageIndex > Choice.Config.resultMaxPageIndex) {
            Choice.Config.resultPageIndex = Choice.Config.resultMaxPageIndex;
        }
    } else {
        Choice.Config.resultPageIndex = 0;
        Choice.Config.resultMaxPageIndex = 0;
    }

    Choice.Config.Trees.Result.bulkUpdateWith(Choice.buildResultTree);
    Choice.setResultPagingInfo();
};

Choice.moveResultToNextPage = function moveResultToNextPage(e) {
    /// <summary>
    /// 將結果移到下一頁
    /// </summary>
    /// <param name="e"></param>
    if (Choice.Config.resultPageIndex < Choice.Config.resultMaxPageIndex) {
        Choice.Config.resultPageIndex++;
        Choice.setResultPagingInfo();
        Choice.Config.Trees.Result.bulkUpdateWith(Choice.buildResultTree);
    }
    e.preventDefault();
};

Choice.moveResultToPrevPage = function moveResultToPrevPage(e) {
    /// <summary>
    /// 將結果移到下一頁
    /// </summary>
    /// <param name="e"></param>
    if (Choice.Config.resultPageIndex > 1) {
        Choice.Config.resultPageIndex--;
        Choice.setResultPagingInfo();
        Choice.Config.Trees.Result.bulkUpdateWith(Choice.buildResultTree);
    }
    e.preventDefault();
};

Choice.setResultPagingInfo = function setResultPagingInfo() {
    /// <summary>
    /// 設定結果的分頁資訊
    /// </summary>
    var currentSize = Choice.Config.resultUserSet.count();
    $("#ResultPageSize").text(
        String.format("{0}/{1}",
            currentSize == 0 ? 0 : Choice.Config.resultPageIndex,
            Choice.Config.resultMaxPageIndex
        )
    );
    $("#ResultCount").text(currentSize);
};

Choice.buildResultTree = function buildResultTree() {
    /// <summary>
    /// 建立結果樹
    /// </summary>

    //UserTree.trackChanges();

    Choice.Config.Trees.Result.get_nodes().clear();

    var length = Choice.Config.resultUserSet.count();
    var start = Choice.Config.resultPageSize * (Choice.Config.resultPageIndex - 1);
    var end = Choice.Config.resultPageSize + start > length ? length : Choice.Config.resultPageSize + start;

    if (length == 0) return;

    for (var i = start; i < end; i++) {
        var item = Choice.Config.resultUserSet.get(i);
        var node = new Telerik.Web.UI.RadTreeNode();
        node.set_text(item["text"]);
        node.set_imageUrl(item["image"]);
        var attributes = node.get_attributes();

        var key = Choice.Config.resultUserSet.getKey(i);
        attributes.setAttribute("key", key);

        Choice.Config.Trees.Result.get_nodes().add(node);
    }

    //UserTree.commitChanges();
};

//#endregion Result 
            
            

//#region 搜尋
Choice.searchDepartment = function searchDepartment(displayAllDept) {
    $.ajax({
        url: "../../Common/ChoiceCenter/ChoiceHandler.ashx",
        type: "POST",
        dataType: "json",
        data: { "action": "SearchDepartment", "keyword": $("#txbKeyWordDept").val(), "displayAllDept": displayAllDept }
    }).done(function (response, textStatus, jqXHR) {
                Choice.Config.departmentCache = response;
        if (Choice.Config.departmentCache.length > 0) {
            Choice.Config.departmentIndex = 0;
            var node = Choice.Config.Trees.Department.findNodeByValue(Choice.Config.departmentCache[0].Value);
            if (node != null) {
                Choice.submitSearchUser({ "action": "GetDepartmentUser", "id": node.get_value(), "onlyAvailable": Choice.Config.onlyAvailable, "displayAllDept": Choice.Config.displayAllDept });
                node.select();
                node.scrollIntoView();
            }
        }

    }).fail(function (jqXHR, textStatus, errorThrown) {
        alert(errorThrown);
        console.error(
            "The following error occured: " +
                textStatus, errorThrown
        );
    });

};

Choice.searchDepartmentByLimit = function searchDepartmentByLimit(userGuid, displayAllDept) {
    $.ajax({
        url: "../../Common/ChoiceCenter/ChoiceHandler.ashx",
        type: "POST",
        dataType: "json",
        data: { "action": "SearchDepartmentByLimit", "keyword": $("#txbKeyWordDept").val(), "userGuid": userGuid, "displayAllDept": displayAllDept }
    }).done(function (response, textStatus, jqXHR) {
        Choice.Config.departmentCache = response;
        if (Choice.Config.departmentCache.length > 0) {
            Choice.Config.departmentIndex = 0;
            var node = Choice.Config.Trees.Department.findNodeByValue(Choice.Config.departmentCache[0].Value);
            Choice.submitSearchUser({ "action": "GetDepartmentUser", "id": node.get_value(), "onlyAvailable": Choice.Config.onlyAvailable, "displayAllDept": Choice.Config.displayAllDept });
            node.select();
            node.scrollIntoView();
        }

    }).fail(function (jqXHR, textStatus, errorThrown) {
        alert(errorThrown);
        console.error(
            "The following error occured: " +
                textStatus, errorThrown
        );
    });

};

Choice.searchDepartmentByGroupID = function searchDepartment(parameter) {
    $.ajax({
        url: "../../Common/ChoiceCenter/ChoiceHandler.ashx",
        type: "POST",
        dataType: "json",
        data: parameter
    }).done(function (response, textStatus, jqXHR) {
        Choice.Config.departmentCache = response;
        if (Choice.Config.departmentCache.length > 0) {
            Choice.Config.departmentIndex = 0;
            var node = Choice.Config.Trees.Department.findNodeByValue(Choice.Config.departmentCache[0].Value);
            Choice.submitSearchUser({ "action": "GetDepartmentUser", "id": node.get_value(), "onlyAvailable": Choice.Config.onlyAvailable, "displayAllDept": Choice.Config.displayAllDept });
            node.select();
            node.scrollIntoView();
        }

    }).fail(function (jqXHR, textStatus, errorThrown) {
        alert(errorThrown);
        console.error(
            "The following error occured: " +
                textStatus, errorThrown
        );
    });

};

Choice.searchGroup = function searchGroup() {
    $.ajax({
        url: "../../Common/ChoiceCenter/ChoiceHandler.ashx",
        type: "POST",
        dataType: "json",
        data: { "action": "SearchGroup", "keyword": $("#txbKeyWordGroup").val() }
    }).done(function (response, textStatus, jqXHR) {
        Choice.Config.groupCache = response;
        if (Choice.Config.groupCache.length > 0) {
            Choice.Config.groupIndex = 0;
            var node = Choice.Config.Trees.Group.findNodeByValue(Choice.Config.groupCache[0].Value);
            Choice.submitSearchUser({ "action": "GetGroupUser", "id": node.get_value() });
            node.select();
            node.scrollIntoView();
        }

    }).fail(function (jqXHR, textStatus, errorThrown) {
        console.error(
            "The following error occured: " +
                textStatus, errorThrown
        );
    });

};

Choice.searchUser = function searchUser(parameter, displayAllDept) {
    var userType;
    if (Choice.Config.currentMode === Choice.ChoiceType.DepartmentUser) {
        userType = "Employee";
    } else {
        userType = "Member";
    }
    Choice.submitSearchUser({ "action": "SearchUser", "userType": userType, "keyword": $("#txbKeyWordUser").val(), "userGuid": parameter, "onlyAvailable": Choice.Config.onlyAvailable, "displayAllDept": displayAllDept });
};

Choice.searchLimitUser = function searchLimitUser(userGuid, limitData, isLimit, displayAllDept, isDepth) {
    $.ajax({
        url: "../../Common/ChoiceCenter/ChoiceHandler.ashx",
        type: "POST",
        dataType: "json",
        data: { "action": "SearchLimitUser", "choiceType": Choice.Config.currentMode, "keyword": $("#txbKeyWordUser").val(), "userGuid": userGuid, "limitData": limitData, "displayAllDept": displayAllDept, "isDepth": isDepth }
    }).done(function (response, textStatus, jqXHR) {
        Choice.Config.userCache = response;
        Choice.Config.userMaxPageIndex = Math.ceil(Choice.Config.userCache.length / Choice.Config.userPageSize);
        Choice.setUserSearchPagingInfo();
        Choice.Config.Trees.User.bulkUpdateWith(Choice.buildUserTree(isLimit));

    }).fail(function (jqXHR, textStatus, errorThrown) {
        alert(errorThrown);
        console.error(
            "The following error occured: " +
            textStatus, errorThrown
        );
    });
};

Choice.searchUserByDeptLimit = function searchUserByDeptLimit(userGuid, isLimit, displayAllDept) {
    $.ajax({
        url: "../../Common/ChoiceCenter/ChoiceHandler.ashx",
        type: "POST",
        dataType: "json",
        data: { "action": "SearchUserByDeptLimit", "choiceType": Choice.Config.currentMode, "keyword": $("#txbKeyWordUser").val(), "userGuid": userGuid, "displayAllDept": displayAllDept }
    }).done(function (response, textStatus, jqXHR) {
        Choice.Config.userCache = response;
        Choice.Config.userMaxPageIndex = Math.ceil(Choice.Config.userCache.length / Choice.Config.userPageSize);
        Choice.setUserSearchPagingInfo();
        Choice.Config.Trees.User.bulkUpdateWith(Choice.buildUserTree(isLimit));

    }).fail(function (jqXHR, textStatus, errorThrown) {
        alert(errorThrown);
        console.error(
            "The following error occured: " +
                textStatus, errorThrown
        );
    });
};
var request;
Choice.submitSearchUser = function submitSearchUser(parameter, isLimit) {
    /// <summary>
    /// 送出ajax要求
    /// </summary>
    /// <param name="parameter">送出時的參數</param>
    if (request !== undefined && request !== null) {
        request.abort();
    }

    request = $.ajax({
        url: "../../Common/ChoiceCenter/ChoiceHandler.ashx",
        type: "POST",
        dataType: "json",
        data: parameter
    }).done(function (response, textStatus, jqXHR) {
        Choice.Config.userCache = response;
        Choice.Config.userPageIndex = 1;
        Choice.Config.userMaxPageIndex = Math.ceil(Choice.Config.userCache.length / Choice.Config.userPageSize);
        Choice.setUserSearchPagingInfo();
        Choice.Config.Trees.User.bulkUpdateWith(Choice.buildUserTree(isLimit));
        request = null;
    }).fail(function (jqXHR, textStatus, errorThrown) {
        request = null;
        if (textStatus !== 'abort') {
            console.error(
                "The following error occured: " +
                textStatus, errorThrown
            );
        }
    });
};

Choice.buildUserTree = function buildUserTree(isLimit) {
    /// <summary>
    /// 建立使用者樹
    /// </summary>
    Choice.Config.Trees.User.trackChanges();
    Choice.Config.Trees.User.get_nodes().clear();
    var orgMode = Choice.Config.currentMode;
    if (isLimit) { Choice.Config.currentMode = 1;}
    var imagePath = Choice.getTypeImage(Choice.Config.currentMode);
    Choice.Config.currentMode = orgMode;
    var start = Choice.Config.userPageSize * (Choice.Config.userPageIndex - 1);
    var end = Choice.Config.userPageSize + start > Choice.Config.userCache.length ? Choice.Config.userCache.length : Choice.Config.userPageSize + start;

    for (var i = start; i < end; i++) {

        var node = new Telerik.Web.UI.RadTreeNode();
        var user = Choice.Config.userCache[i];
        node.set_text(user.Name);
        node.set_value(user.UserGuid);
        node.set_imageUrl(imagePath);
        Choice.Config.Trees.User.get_nodes().add(node);
    }
    Choice.Config.Trees.User.commitChanges();
};

Choice.moveUserToNextPage = function moveUserToNextPage(e) {
    /// <summary>
    /// 將搜尋結果移到下一頁
    /// </summary>
    /// <param name="e"></param>
    if (Choice.Config.userPageIndex < Choice.Config.userMaxPageIndex) {
        Choice.Config.userPageIndex++;
        Choice.setUserSearchPagingInfo();
        Choice.Config.Trees.User.bulkUpdateWith(Choice.buildUserTree);
    }
    e.preventDefault();
};

Choice.moveUserToPrevPage = function moveUserToPrevPage(e) {
    /// <summary>
    /// 將搜尋結果移到下一頁
    /// </summary>
    /// <param name="e"></param>

    if (Choice.Config.userPageIndex > 1) {
        Choice.Config.userPageIndex--;
        Choice.setUserSearchPagingInfo();
        Choice.Config.Trees.User.bulkUpdateWith(Choice.buildUserTree);
    }
    e.preventDefault();
};

Choice.setUserSearchPagingInfo = function setUserSearchPagingInfo() {
    /// <summary>
    /// 設定搜尋結果的分頁資訊
    /// </summary>
    var currentSize = Choice.Config.userCache.length;
    $("#SearchUserPageSize").text(
        String.format("{0}/{1}",
            currentSize == 0 ? 0 : Choice.Config.userPageIndex,
            Choice.Config.userMaxPageIndex
        )
    );
    $("#SearchUserCount").text(currentSize);
};
//#endregion 搜尋
            
//#region Favorite

Choice.addFavorite = function addFavorite(name, id) {
    /// <summary>
    /// 加到常用組合
    /// </summary>

    var node = new Telerik.Web.UI.RadTreeNode();
    var image = Choice.getTypeImage(Choice.ChoiceType.Favorite, false);
    node.set_text(name);
    node.set_imageUrl(image);
    node.set_value(id);
    Choice.Config.Trees.Favorite.get_nodes().add(node);


};

//#endregion Favorite