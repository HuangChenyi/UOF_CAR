angular.module('MobileForm').factory('dataService', function ($rootScope, $http, $q, $filter) {
    var dataService = {};
    dataService.hostUrl = uofScript.setting.serverRoot + "api/form/";
    dataService.userId = uofScript.setting.userId;
    dataService.formData = {
        formID: "LeaveFormV2",
        formFiles: [],
        personalFiles: [],
        comment: "",
        aplicantInfo: {
            applicantGroupID: "company",
            applicantGUID: dataService.userId,
            urgentLevel: "2",
            applyDate: $filter('date')(new Date(), 'yyyy/MM/dd')
        },
        fields: {
            docNbr: {
                id: "DocNbr",
                fieldType: "autoNumber",
                value: "11"
            },
            applicant: {
                id: "Applicant",
                fieldType: "userProposer",
                value: dataService.userId
            },
            applicantDept: {
                id: "applicantDept",
                fieldType: "userDept",
                value: "Company"
            },
            leaInfoV2: {
                id: "LeaInfoV2",
                fieldType: "optionalField",
                value: "",
                fields: {
                    leaCodeName: {
                        id: "leaCodeName",
                        fieldType: "",
                        value: "病假"
                    },
                    startTime: {
                        id: "startTime",
                        fieldType: "",
                        value: $filter('date')(new Date(), 'yyyy/MM/dd'),
                    },
                    endTime: {
                        id: "endTime",
                        fieldType: "",
                        value: $filter('date')(new Date(), 'yyyy/MM/dd'),
                    },
                    actualDate: {
                        id: "actualDate",
                        fieldType: "",
                        value: $filter('date')(new Date(), 'yyyy/MM/dd'),
                    },
                    leaHours: {
                        id: "leaHours",
                        value: "8",
                        fieldType: "",
                    },
                    timeUnit: {
                        id: "timeUnit",
                        value: "Hour",
                        fieldType: "",
                    },
                    leaCode: {
                        id: "leaCode",
                        value: "SickLeave",
                        fieldType: "",
                    },
                    leaDays: {
                        id: "leaDays",
                        value: "0",
                        fieldType: ""
                    },
                    applicantUser: {
                        id: "applicantUser",
                        value: "",
                        fieldType: ""
                    },
                    agentUser: {
                        id: "agentUser",
                        value: "",
                        fieldType: ""
                    },
                    usedYear: {
                        id: "usedYear",
                        value: "",
                        fieldType: ""
                    },
                    usedExtend: {
                        id: "usedExtend",
                        value: "",
                        fieldType: ""
                    }
                }
            },
            remark: {
                id: "Remark",
                fieldType: "",
                value: ""
            },
            attach: {
                id: "Attach",
                fieldType: "fileButton",
                value: []
            },
            agent: {
                id: "Agent",
                fieldType: "allUser",
                value: {}
            },
            dottedManager: {
                id: "DottedManager",
                fieldType: "allUser",
                value: {}
            }
        }
    };
    var form = {
        formID: "",
        applicantGroupID: "",
        applicantGUID: "",
        urgentLevel: "",
        formAttachFiles: [],
        personalAttachFiles: [],
        Fields: [
            {
                id: "",
                value: "",
                DetailFields: []
            }
        ]
    };
    dataService.initialData = {
        name: "",
        departments: []
    };
    dataService.calculateLeave = function (startTime, endTime, userId, leaveCode) {
        var deferred = $q.defer();
        var request = $http({
            method: 'POST',
            url: dataService.hostUrl + 'calculateLeave',
            params: {},
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            data: { "startTime": startTime, "endTime": endTime, "userId": userId, "leaveCode": leaveCode }
        })
            .success(function (data, status, headers, config) {
            deferred.resolve(data);
        })
            .error(function (data, status, headers, config) {
            deferred.reject(data);
        });
        return deferred.promise;
    };
    dataService.getYearLeaves = function (startDate) {
        var deferred = $q.defer();
        var request = $http({
            method: 'POST',
            url: dataService.hostUrl + 'yearLeaves',
            params: {},
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            data: { userId: dataService.userId, date: startDate }
        })
            .success(function (data, status, headers, config) {
            deferred.resolve(data);
        })
            .error(function (data, status, headers, config) {
            deferred.reject(data);
        });
        deferred.promise.then(function (dates) {
            if (dates.length == 0) {
                dataService.initialData.yearLeaves = [{ Key: "", Value: "沒有可用年休" }];
            }
            else {
                dataService.initialData.yearLeaves = dates;
            }
        }, function (data) {
        });
    };
    dataService.initFormData = function () {
        var deferred = $q.defer();
        var request = $http({
            method: 'GET',
            url: dataService.hostUrl + 'userInfo/' + dataService.userId,
            params: {},
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .success(function (data, status, headers, config) {
            deferred.resolve(data);
        })
            .error(function (data, status, headers, config) {
            deferred.reject(data);
        });
        deferred.promise.then(function (info) {
            dataService.initialData.name = info.UserName;
            dataService.initialData.departments = info.Departments;
            dataService.initialData.yearLeaves = info.YearLeaves;
            if (info.Departments && info.Departments.length > 0) {
                dataService.formData.aplicantInfo.applicantGroupID = info.Departments[0].Id;
            }
            dataService.initialData.leaves = info.Leaves;
        }, function (data) {
        });
    };
    dataService.submitData = function () {
        var deferred = $q.defer();
        var request = $http({
            method: 'POST',
            url: dataService.hostUrl + 'submit',
            params: {},
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            data: { temp: angular.toJson(dataService.formData) }
        })
            .success(function (data, status, headers, config) {
            if (data !== null && typeof data === "object") {
                deferred.resolve(data);
            }
            else {
                deferred.reject(data);
            }
        })
            .error(function (data, status, headers, config) {
            deferred.reject(data);
        });
        return deferred.promise;
    };
    /*** detail  */
    dataService.detailIndex = 0;
    dataService.detailItem = {};
    dataService.detailMode = '';
    dataService.detailChangeMode = function (mode, index) {
        dataService.detailMode = mode;
        if (dataService.detailMode == "add") {
            dataService.detailItem = {};
        }
        else {
            dataService.detailIndex = index;
            dataService.detailItem = angular.copy(dataService.formData.detailList[index]);
        }
    };
    dataService.detailRemove = function () {
        dataService.formData.detailList.splice(dataService.detailIndex, 1);
    };
    dataService.detailSave = function () {
        if (dataService.detailMode == "add") {
            var item = angular.copy(dataService.detailItem);
            dataService.formData.detailList.push(item);
        }
        else {
            dataService.detailItem.amount = dataService.detailItem.qty * dataService.detailItem.price;
            var item = angular.copy(dataService.detailItem);
            dataService.formData.detailList[dataService.detailIndex] = item;
        }
    };
    dataService.itemAdd = function (item) {
        dataService.formData.detailList.push(item);
    };
    dataService.itemUpdate = function (item) {
        dataService.formData.detailList[dataService.detailIndex] = item;
    };
    dataService.itemDelete = function () {
        dataService.formData.detailList.splice(dataService.detailIndex, 1);
    };
    /*** file detail  */
    dataService.fileFieldId = '';
    dataService.setFileFieldId = function (fieldId) {
        dataService.fileFieldId = fieldId;
    };
    dataService.fileAdd = function (field, fieldType, id, name) {
        if (fieldType == "default") {
            dataService.formData[field].push({ "id": id, name: name });
        }
        else {
            dataService.formData.fields[field].value.push({ "id": id, name: name });
        }
    };
    dataService.fileDelete = function (field, fieldType, id) {
        if (fieldType == "default") {
            var length = dataService.formData[field].length;
            for (var i = 0; i < length; i++) {
                var file = dataService.formData[field][i];
                if (file.id == id) {
                    dataService.formData[field].splice(i, 1);
                    break;
                }
            }
        }
        else {
            var length = dataService.formData.fields[field].length;
            for (var i = 0; i < length; i++) {
                var file = dataService.formData.fields[field][i];
                if (file.id == id) {
                    dataService.formData.fields[field].value.splice(i, 1);
                    break;
                }
            }
        }
    };
    return dataService;
});
