
var Choice = function () { };

Choice.ChoiceType = Object.freeze({
    ContactUse: 0,
    ContactClass: 1,
    ContactIndustry: 2,
    ContactArea: 3,
    Class: 4,
    Industry:5,
    Area: 6
});

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
            case "contact":
                key = type + "|" + item["contactId"];
                break;
            case "area":
                key = type + "|" + item["areaId"];
                break;
            case "class":
                key = type + "|" + item["classId"];
                break;
            case "industry":
                key = type + "|" + item["industryId"];
                break;
        }

        return key;
    };

    this.count = function () {
        return elements.length;
    };

    this.exists = function (type, id, isDepth) {

        if (type == "Area") {
            return self.Area.exists(id, isDepth);
        } else {
            return self[type].exists(id);
        }
    };

    this.removeByKey = function (key) {

        var para = key.split("|");
        var type = para[0];

        switch (type) {
            case "contact":
                self.contact.remove(para[1]);
                break;
            case "area":
                self.area.remove(para[1], para[2] == "True");
                break;
            case "class":
                self.class.remove(para[1]);
                break;
            case "industry":
                self.industry.remove(para[1]);
                break;
        }
    };

    this.fromString = function (json) {
        if (json != "") {
            var obj = JSON.parse(json);
            if (obj["CustomerSet"] != null) {
                elements.push.apply(elements, obj["CustomerSet"]["Element"]);
            }
        }
    };

    this.toSring = function () {
        return JSON.stringify(
            {
                "CustomerSet": {
                    "Element": elements
                }
            });
    };
    this.contact = {
        add: function (name, id, image) {
            var index = elements.push({
                "@type": "contact",
                "text": name,
                "image": image,
                "contactId": id
            });
            return index - 1;
        },
        exists: function (id) {
            return (self.contact.indexOf(id) > -1);
        },
        indexOf: function (id) {
            var index;
            for (index = elements.length - 1; index >= 0; --index) {
                var obj = elements[index];
                if (obj["@type"] == "contact" && obj["contactId"] == id) {
                    return index;
                }
            }
            return -1;

        },
        remove: function (id) {
            var index = self.contact.indexOf(id);
            if (index > -1) {
                elements.remove(index);
            }
        }
    };

    this.area = {
        add: function (name, id, image, isDepth) {
            var index = elements.push({
                "@type": "area",
                "text": name,
                "areaId": id,
                "image": image,
                "@isDepth": isDepth ? "True" : "False"
            });
            return index - 1;
        },
        exists: function (id, isDepth) {
            return (self.area.indexOf(id, isDepth) > -1);
        },
        indexOf: function (id, isDepth) {
            var index;
            var strIsDepth = isDepth ? "True" : "False";
            for (index = elements.length - 1; index >= 0; --index) {
                var obj = elements[index];
                if (obj["@type"] == "area" && obj["areaId"] == id && obj["@isDepth"] == strIsDepth) {
                    return index;
                }
            }
            return -1;
        },
        remove: function (id, isDepth) {
            var index = self.area.indexOf(id, isDepth);
            if (index > -1) {
                elements.remove(index);
            }
        }
    };

    this.class = {
        add: function (name, id, image) {
            var index = elements.push({
                "@type": "class",
                "text": name,
                "classId": id,
                "image": image
            });
            return index - 1;
        },
        exists: function (id) {
            return (self.class.indexOf(id) > -1);
        },
        indexOf: function (id) {
            var index;
            for (index = elements.length - 1; index >= 0; --index) {
                var obj = elements[index];
                if (obj["@type"] == "class" && obj["classId"] == id) {
                    return index;
                }
            }
            return -1;

        },
        remove: function (id) {
            var index = self.class.indexOf(id);
            if (index > -1) {
                elements.remove(index);
            }
        }
    };

    this.industry = {
        add: function (name, id, image) {
            var index = elements.push({
                "@type": "industry",
                "text": name,
                "industryId": id,
                "image": image
            });
            return index - 1;
        },
        exists: function (id) {
            return (self.industry.indexOf(id) > -1);
        },
        indexOf: function (id) {
            var index;
            for (index = elements.length - 1; index >= 0; --index) {
                var obj = elements[index];
                if (obj["@type"] == "industry" && obj["industryId"] == id) {
                    return index;
                }
            }
            return -1;

        },
        remove: function (id) {
            var index = self.industry.indexOf(id);
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
    "contactUseCache": null,
    "contactUseIndex": 0,
    "contactClassCache": null,
    "contactClassIndex": 0,
    "contactIndustryCache": null,
    "contactIndustryIndex": 0,
    "contactAreaCache": null,
    "contactAreaIndex": 0,
    "currentMode": Choice.ChoiceType.ContactUse,
    "resultPageSize": 20,
    "resultPageIndex": 1,
    "resultMaxPageIndex": 1,
    "resultUserSet": null,
};

//#regio utility

Choice.getTypeImage = function getTypeImage(type, isDepth) {

    var image = "";
    var rootPath = $uof.tool.getRootPath() + "/Common/Images/Icon/";

    switch (type) {
        case Choice.ChoiceType.ContactUse:
        case Choice.ChoiceType.ContactClass:
        case Choice.ChoiceType.ContactIndustry:
        case Choice.ChoiceType.ContactArea:
            image = rootPath + "icon_c02.gif";
            break;
        case Choice.ChoiceType.Class:
            image = rootPath + "icon_c07.gif";
            break;
        case Choice.ChoiceType.Industry:
            image = rootPath + "icon_c03.gif";
            break;
        case Choice.ChoiceType.Area:
            image = rootPath + "icon_c04.gif";
            break;
    }

    return image;
};

Choice.switchMode = function switchMode(type) {
    if (type == Choice.ChoiceType.ContactUse) {
        $("#divCommonUse").show();
        $('#divCommonUse').css({ 'background-color': '#d9d9d9' });
        $("#divCustomer").show();
    } else if (type == Choice.ChoiceType.ContactClass) {
        $("#divClass").show();
        $('#divClass').css({ 'background-color': '#d9d9d9' });
        $("#divCustomer").show();
    } else if (type == Choice.ChoiceType.ContactIndustry) {
        $("#divIndustry").show();
        $('#divIndustry').css({ 'background-color': '#d9d9d9' });
        $("#divCustomer").show();
    } else if (type == Choice.ChoiceType.ContactArea) {
        $("#divArea").show();
        $('#divArea').css({ 'background-color': '#d9d9d9' });
        $("#divCustomer").show();
        $("#divPanelAllowSubArea").hide();
    } else if (type == Choice.ChoiceType.Industry) {
        $("#divIndustry").show();
        $("#divCustomer").hide();
    } else if (type == Choice.ChoiceType.Class) {
        $("#divClass").show();
        $("#divCustomer").hide();
    } else if (type == Choice.ChoiceType.Area) {
        $("#divArea").show();
        $("#divCustomer").hide();
        $("#divPanelAllowSubArea").show();
    }
};

Choice.addToResult = function addToResult(type, name, id, isDepth) {

    var exists = false;
    var text = "";
    var image = "";
    var index;
    switch (type) {
        case Choice.ChoiceType.ContactIndustry:
        case Choice.ChoiceType.ContactArea:
        case Choice.ChoiceType.ContactClass:
        case Choice.ChoiceType.ContactUse:
            text = name;
            image = Choice.getTypeImage(type);
            exists = Choice.Config.resultUserSet.contact.exists(id);
            if (!exists) {
                index = Choice.Config.resultUserSet.contact.add(name, id, image);
            }
            break;
        case Choice.ChoiceType.Class:
            text = name;
            image = Choice.getTypeImage(type);
            exists = Choice.Config.resultUserSet.class.exists(id);
            if (!exists) {
                index = Choice.Config.resultUserSet.class.add(name, id, image);
            }
            break;
        case Choice.ChoiceType.Industry:
            text = name;
            image = Choice.getTypeImage(type);
            exists = Choice.Config.resultUserSet.industry.exists(id);
            if (!exists) {
                index = Choice.Config.resultUserSet.industry.add(name, id, image);
            }
            break;
        case Choice.ChoiceType.Area:
            text = name;
            image = Choice.getTypeImage(type);
            exists = Choice.Config.resultUserSet.area.exists(id, isDepth);
            if (!exists) {
                index = Choice.Config.resultUserSet.area.add(name, id, image, isDepth);
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
};

//#endregion Result 

Choice.submitSearchUser = function submitSearchUser(parameter) {
    /// <summary>
    /// 送出ajax要求
    /// </summary>
    /// <param name="parameter">送出時的參數</param>
    $.ajax({
        url: "ChoiceHandler.ashx",
        type: "POST",
        dataType: "json",
        data: parameter
    }).done(function (response, textStatus, jqXHR) {
        Choice.Config.userCache = response;
        Choice.Config.userPageIndex = 1;
        Choice.Config.userMaxPageIndex = Math.ceil(Choice.Config.userCache.length / Choice.Config.userPageSize);
        Choice.setUserSearchPagingInfo();
        Choice.Config.Trees.User.bulkUpdateWith(Choice.buildUserTree);

    }).fail(function (jqXHR, textStatus, errorThrown) {
        console.error(
            "The following error occured: " +
                textStatus, errorThrown
        );
    });
};

Choice.submitResult = function submitSearchUser(parameter, type, isDepth) {
    /// <summary>
    /// 送出ajax要求
    /// </summary>
    /// <param name="parameter">送出時的參數</param>
    $.ajax({
        url: "ChoiceHandler.ashx",
        type: "POST",
        dataType: "json",
        data: parameter
    }).done(function (response, textStatus, jqXHR) {       

        for (var i = 0; i < response.length; i++) {
            var exists = false;
            var item = response[i];
            var image = Choice.getTypeImage(item.type);
            
            switch (type) {
                case Choice.ChoiceType.ContactIndustry:
                case Choice.ChoiceType.ContactArea:
                case Choice.ChoiceType.ContactClass:
                case Choice.ChoiceType.ContactUse:
                    text = name;
                    image = Choice.getTypeImage(type);
                    exists = Choice.Config.resultUserSet.contact.exists(item.ContactID);
                    if (!exists) {
                        index = Choice.Config.resultUserSet.contact.add(item.ContactName, item.ContactID, image);
                    }
                    break;
                case Choice.ChoiceType.Class:
                    text = name;
                    image = Choice.getTypeImage(type);
                    exists = Choice.Config.resultUserSet.class.exists(id);
                    if (!exists) {
                        index = Choice.Config.resultUserSet.class.add(name, id, image);
                    }
                    break;
                case Choice.ChoiceType.Industry:
                    text = name;
                    image = Choice.getTypeImage(type);
                    exists = Choice.Config.resultUserSet.industry.exists(id);
                    if (!exists) {
                        index = Choice.Config.resultUserSet.industry.add(name, id, image);
                    }
                    break;
                case Choice.ChoiceType.Area:
                    alert(image);
                    text = name;
                    image = Choice.getTypeImage(type);
                    exists = Choice.Config.resultUserSet.area.exists(id,isDepth);
                    if (!exists) {
                        index = Choice.Config.resultUserSet.area.add(name, id, image, isDepth);
                    }
                    break;
            }

            if (!exists) {
                Choice.setResultPaging(true);
            } else {
                $("#flashMessage").fadeIn(200).fadeOut(100).fadeIn(200).fadeOut(100);
            }
        }

    }).fail(function (jqXHR, textStatus, errorThrown) {
        console.error(
            "The following error occured: " +
                textStatus, errorThrown
        );
    });
};

Choice.buildUserTree = function buildUserTree() {
    /// <summary>
    /// 建立使用者樹
    /// </summary>
    //UserTree.trackChanges();

    Choice.Config.Trees.User.get_nodes().clear();

    var imagePath = Choice.getTypeImage(Choice.Config.currentMode);

    var start = Choice.Config.userPageSize * (Choice.Config.userPageIndex - 1);
    var end = Choice.Config.userPageSize + start > Choice.Config.userCache.length ? Choice.Config.userCache.length : Choice.Config.userPageSize + start;

    for (var i = start; i < end; i++) {

        var node = new Telerik.Web.UI.RadTreeNode();
        var user = Choice.Config.userCache[i];
        var rootPath = $uof.tool.getRootPath() + "/Common/Images/Icon/";
        if (user.Type != "undefined" && user.Type == "ClassContact") {
            if (user.HaveChild != "Y") {
                node.set_text(user.CoustomerName);
                node.set_value(user.CoustomerID);
                node.set_imageUrl(rootPath + "icon_c06.gif");
                node.expand();
                Choice.Config.Trees.User.get_nodes().add(node);
            }
            else {
                var parentNode = Choice.Config.Trees.User.findNodeByValue(user.CoustomerID);
                if (parentNode != null)
                {
                    var childNode = new Telerik.Web.UI.RadTreeNode();
                    childNode.set_text(user.ContactName);
                    childNode.set_value(user.ContactID);
                    childNode.set_imageUrl(rootPath + "icon_c02.gif");
                    childNode.expand();
                    parentNode.get_nodes().add(childNode);
                }
            }
        }
        else {

            node.set_text(user.ContactName);
            node.set_value(user.ContactID);
            node.set_imageUrl(imagePath);
            Choice.Config.Trees.User.get_nodes().add(node);
        }
    }

    //UserTree.commitChanges();
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