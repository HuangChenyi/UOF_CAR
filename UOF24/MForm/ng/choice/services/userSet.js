var userSet = function () {
    var self = this;
    var elements = [];
    this.getObject = function () {
        return {
            "UserSet": {
                "Element": elements
            }
        };
    };
    this.setObject = function (userSet) {
        if (userSet["UserSet"] != null) {
            elements.push.apply(elements, userSet["UserSet"]["Element"]);
        }
    };
    this.clear = function () {
        elements.remove(0, elements.length);
    };
    this.getElements = function () {
        return elements;
    };
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
        return computeKey(item);
    };
    this.getKeyByElement = function (element) {
        return computeKey(element);
    };
    this.count = function () {
        return elements.length;
    };
    this.exists = function (type, id, groupId, isDepth) {
        if (type == "user") {
            return self.user.exists(id);
        }
        else if (type == "group") {
            return self.group.exists(groupId, isDepth);
        }
        else {
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
        return JSON.stringify({
            "UserSet": {
                "Element": elements
            }
        });
    };
    this.user = {
        add: function (userId, text) {
            /// <summary>
            /// 新增使用者
            /// </summary>
            /// <param name="userId">代碼</param>
            /// <param name="name">名稱</param>
            /// <param name="userType">類型</param>
            var index = elements.push({
                "@type": "user",
                "text": text,
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
        add: function (groupId, isDepth, text) {
            var index = elements.push({
                "@type": "group",
                "text": text,
                "groupId": groupId,
                "@isDepth": isDepth ? "True" : "False"
            });
            return index - 1;
        },
        exists: function (groupId, isDepth) {
            return (self.group.indexOf(groupId, isDepth) > -1);
        },
        indexOf: function (groupId, isDepth) {
            var index;
            if (isDepth) {
                var strIsDepth = isDepth ? "True" : "False";
                for (index = elements.length - 1; index >= 0; --index) {
                    var obj = elements[index];
                    if (obj["@type"] == "group" && obj["groupId"] == groupId && obj["@isDepth"] == strIsDepth) {
                        return index;
                    }
                }
            }
            else {
                for (index = elements.length - 1; index >= 0; --index) {
                    var obj = elements[index];
                    if (obj["@type"] == "group" && obj["groupId"] == groupId) {
                        return index;
                    }
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
        add: function (jobTitleId, text, groupId, isDepth) {
            var index;
            if (groupId == undefined) {
                index = elements.push({
                    "@type": "jobTitle",
                    "text": text,
                    "jobTitleId": jobTitleId
                });
            }
            else {
                index = elements.push({
                    "@type": "jobTitleOfGroup",
                    "text": text,
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
            }
            else {
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
        add: function (jobFunctionId, text, groupId, isDepth) {
            var index;
            if (groupId == undefined) {
                index = elements.push({
                    "@type": "jobFunction",
                    "text": text,
                    "jobFunctionId": jobFunctionId
                });
            }
            else {
                index = elements.push({
                    "@type": "jobFunctionOfGroup",
                    "text": text,
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
            }
            else {
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
        add: function (membClassId, text, groupId, isDepth) {
            var index;
            if (groupId == undefined) {
                index = elements.push({
                    "@type": "membClass",
                    "text": text,
                    "membClassId": membClassId
                });
            }
            else {
                index = elements.push({
                    "@type": "membClassOfGroup",
                    "text": text,
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
            }
            else {
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
    function computeKey(item) {
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
                key = type + "|" + item["contactId"];
                break;
        }
        return key;
    }
};
