angular.module('MobileForm').factory('dataService', function ($rootScope, $http, $q, $filter) {
    var dataService = {};
    dataService.hostUrl = uofScript.setting.serverRoot + "api/form/";
    dataService.userId = uofScript.setting.userId;
    dataService.formData = {
        formID: "PunchFormV2",
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
                id: "docNbr",
                fieldType: "autoNumber",
                value: "11"
            },
            applicant: {
                id: "applicant",
                fieldType: "userProposer",
                value: dataService.userId
            },
            applicantDept: {
                id: "applicantDept",
                fieldType: "userDept",
                value: "Company"
            },
            punchInfo: {},
        //{
        //    id: "punchInfo",
        //    fieldType: "optionalField",
        //    value: "",
        //    fields: {
        //        type: {
        //            id: "type",
        //            fieldType: "",
        //            value: "Renew"
        //        },
        //        workClockDate: {
        //            id: "workClockDate",
        //            fieldType: "",
        //            value: "",
        //        },
        //        workClockTime: {
        //            id: "workClockTime",
        //            fieldType: "",
        //            value: "",
        //        },
        //        offClockDate: {
        //            id: "offClockDate",
        //            fieldType: "",
        //            value: "",
        //        },
        //        offClockTime: {
        //            id: "offClockTime",
        //            fieldType: "",
        //            value: "",
        //        },
        //        belongDate: {
        //            id: "belongDate",
        //            fieldType: "",
        //            value: $filter('date')(new Date(), 'yyyy/MM/dd'),
        //        },
        //    }
        //}
            reason: {
                id: "reason",
                fieldType: "",
                value: ""
            },
        }
    };
    dataService.initialData = {
        name: "",
        departments: []
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
