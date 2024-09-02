angular.module('MobileForm').controller("punchCtrl", [
    "$scope", "$state", "$timeout", "dataService", function ($scope, $state, $timeout, dataService) {
        "use strict";
        $scope.pool.viewTitle = "補刷卡單";
        $scope.formNbr = "";
        $scope.message = {
            show: false,
            header: "",
            content: "",
            icon: "frown",
            type: "positive"
        };
        

        $scope.checkValid = function () {
            $scope.$broadcast('validate');           
        }

       
        $scope.formData = dataService.formData;
        $scope.initialData = dataService.initialData;
        $scope.submit = function () {
            var isValid = false;
            
            $scope.$broadcast('validate');  

            //if($scope.uofForm.$valid){

            //}

            //$scope.message.content = angular.toJson($scope.formData);

            if ($scope.uofForm.$valid) {
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
        $scope.detailEdit = function (index) {
            dataService.detailChangeMode('edit', index);
            $state.go('listDetail');
        };
        $scope.detailAdd = function () {
            dataService.detailChangeMode('add');
            $state.go('listDetail');
        };
        $scope.fileDetail = function (field, fieldType) {
            //dataService.setFileFieldId(fieldId);
            $state.go('fileDetail', { "field": field, "fieldType": fieldType });
        };
        $scope.selectUser = function (field) {
            //$state.go('choice.result',{"init":"true"});           
            $state.go('choice', { "type": "employee", "init": "true", "field": field });
        };
        $scope.showUsedYear = function () {
            return ($scope.formData.fields.leaInfoV2.fields.leaCode.value == "YearLeave");
        };
        $scope.fileRemove = function (field, fieldType, fileId) {
            //dataService.setFileFieldId(fieldId);
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
               // $('.ui.checkbox').checkbox();
                //$('.ui.radio.checkbox').checkbox();
                //$('.ui.toggle.checkbox').checkbox();
                //$('.ui.accordion').accordion();
                //$('.menu .item').tab();
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
       
        $scope.load();
    }
]);
