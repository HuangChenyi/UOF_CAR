angular.module('MobileForm').controller("leaveCtrl", [
    "$scope", "$state", "$timeout", "dataService", function ($scope, $state, $timeout, dataService) {
        "use strict";
        $scope.pool.viewTitle = "請假單";
        $scope.formNbr = "";
        $scope.message = {
            show: false,
            header: "",
            content: "",
            icon: "frown",
            type: "positive"
        };
        $scope.calculateMessage = {
            show: false,
            content: ""
        };
        $scope.displayCalculateResult = "";
        $scope.formData = dataService.formData;
        $scope.initialData = dataService.initialData;
        $scope.submit = function () {
            var isValid = false;
            if ($scope.displayCalculateResult == "") {
                isValid = false;
                $scope.calculateMessage.show = true;
                $scope.calculateMessage.content = "請輸入請假時(天)數";
                $timeout(function () {
                    $("input[name$='number']").focus();
                });
            }
            else {
                isValid = true;
            }
            if (isValid) {
                var promise = dataService.submitData();
                promise.then(function (data) {
                    if (data.Result) {
                        $scope.message = {
                            show: true,
                            header: "送出成功",
                            content: "表單單號 : " + data.Message,
                            icon: "smile",
                            type: "positive"
                        };
                    }
                    else {
                        $scope.message = {
                            show: true,
                            header: "送出失敗",
                            content: data.Message,
                            icon: "frown",
                            type: "negative"
                        };
                    }
                    $('.ui.modal.submit')
                        .modal({})
                        .modal('show');
                }, function () {
                    //$scope.error = { message: 'get group data error' };
                    $scope.message = {
                        show: true,
                        header: "",
                        content: "表單送出失敗",
                        type: "negative"
                    };
                });
            }
        };
        $scope.calculateLeave = function () {
            var s = Date.parse($scope.formData.fields.leaInfoV2.fields.startTime.value);
            var e = Date.parse($scope.formData.fields.leaInfoV2.fields.endTime.value);
            if (s > e) {
                $scope.calculateMessage.show = true;
                $scope.calculateMessage.content = "請假時間(起)不可大於請假時間(迄)";
            }
            else {
                $("#btnCalculateLeave").addClass("disabled loading");
                var promise = dataService.calculateLeave($scope.formData.fields.leaInfoV2.fields.startTime.value, $scope.formData.fields.leaInfoV2.fields.endTime.value, "admin", $scope.formData.fields.leaInfoV2.fields.leaCode.value);
                promise.then(function (data) {
                    $("#btnCalculateLeave").removeClass("disabled loading");
                    if (data.ErrorMessage) {
                        $scope.calculateMessage.show = true;
                        $scope.calculateMessage.content = data.ErrorMessage;
                    }
                    else {
                        $scope.calculateMessage.show = false;
                        $scope.formData.fields.leaInfoV2.fields.timeUnit.value = data.Unit;
                        if (data.Unit == "Hour") {
                            $scope.formData.fields.leaInfoV2.fields.leaHours.value = data.Value;
                            $scope.displayCalculateResult = data.Value + "時";
                        }
                        else {
                            $scope.formData.fields.leaInfoV2.fields.leaDays.value = data.Value;
                            $scope.displayCalculateResult = data.Value + "天";
                        }
                    }
                }, function (data) {
                    $("#btnCalculateLeave").removeClass("disabled loading");
                    $scope.calculateMessage.show = true;
                    $scope.calculateMessage.content = "計算送出失敗." + data.Message;
                });
            }
        };
        $scope.changeStartTime = function () {
            dataService.getYearLeaves($scope.formData.fields.leaInfoV2.fields.startTime.value);
            $scope.displayCalculateResult = "";
            $scope.calculateMessage.show = false;
        };
        $scope.changeEndTime = function () {
            //$scope.$apply(function () {
                $scope.displayCalculateResult = "";
                $scope.calculateMessage.show = false;
            //});
        };
        $scope.leaveCodeChange = function () {
            angular.forEach($scope.initialData.leaves, function (item) {
                if ($scope.formData.fields.leaInfoV2.fields.leaCode.value === item.Code) {
                    $scope.formData.fields.leaInfoV2.fields.leaCodeName.value = item.Name;
                }
            });
            // dataService.formData.fields.leaInfoV2.fields.leaCodeName.value = item.Name;
        };
        $scope.detailEdit = function (index) {
            dataService.detailChangeMode('edit', index);
            $state.go('listDetail');
        };
        $scope.detailAdd = function () {
            dataService.detailChangeMode('add');
            $state.go('listDetail');
        };
        $scope.fileDetail = function (field, fieldType) {
            $state.go('fileDetail', { "field": field, "fieldType": fieldType, "form": "leave" });
        };
        $scope.selectUser = function (field) {      
            $state.go('choice', { "type": "employee", "init": "true", "field": field, "form": "leave" });
        };
        $scope.showUsedYear = function () {
            return ($scope.formData.fields.leaInfoV2.fields.leaCode.value == "YearLeave");
        };
        $scope.fileRemove = function (field, fieldType, fileId) {
            dataService.fileDelete(field, fieldType, fileId);
        };
        $scope.isImage = function (fileName) {
            var type = '|' + fileName.toLowerCase().slice(fileName.lastIndexOf('.') + 1) + '|';
            return '|jpg|png|jpeg|bmp|gif|'.indexOf(type) !== -1;
        };
        $scope.load = function () {
            $('.right.menu.open').on("click", function (e) {
                e.preventDefault();
                $('.ui.vertical.menu').toggle();
            });
            $timeout(function () {
                $('.ui.dropdown').dropdown();
                $('.ui.radio.checkbox').checkbox();
                $('.ui.toggle.checkbox').checkbox();
            }, 500);
            dataService.initFormData();
        };
        $scope.setChoiceImage = function (element) {
            if (element["@type"] == "group") {
                if (element["@isDepth"] == "True") {
                    return "choice-group-plus";
                }
                else {
                    return "choice-group-check";
                }
            }
            else if (element["@type"] == "user") {
                return "choice-employee-check";
            }
            else if (element["@type"] == "jobTitle") {
                return "choice-jobtitle-check";
            }
            else if (element["@type"] == "jobFunction") {
                return "choice-jobfunction-check";
            }
        };
        $scope.closeForm = function () {
        };
        angular.element(document).ready(function () {
            ////$("input[name$='start']").datetimepicker({ lang: 'zh-TW' });
            ////$("input[name$='end']").datetimepicker({ lang: 'zh-TW' });
            ////$("input[name$='act']").datetimepicker({ lang: 'zh-TW', timepicker: false });
            //$("input[name$='start']").pickadate({ format: 'yyyy/mm/dd'});
            //$("input[name$='end']").pickadate({ format: 'yyyy/mm/dd' });
            $("input[name$='act']").datepicker();
        });
        $scope.load();
    }
]);
