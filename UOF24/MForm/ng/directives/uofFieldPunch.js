'use strict';
angular.module('MobileForm')
    .directive('uofFieldPunch', function ($timeout) {
    var uniqueId = 1;
    return {
        restrict: 'E',
        transclude: true,
        require: '?ngModel',
        replace: true,
        scope: {
            ngModel: '=',
            //ngChange: '&',
            //"require": '='
        },
        controller: function ($scope, $element, $attrs) {
            $scope.getDateString = function () {
                var d = new Date();
                var mm = (d.getMonth() + 1);
                var dd = d.getDate();
                var month = mm < 10 ? '0' + mm : mm;
                var day = dd < 10 ? '0' + dd : dd;
                return d.getFullYear() + "/" + month + '/' + day;
            };

            $scope.getDateTimeString = function () {
                var d = new Date();
                var h = d.getHours();
                var date = $scope.getDateString();
                var hours = h < 10 ? '0' + h : h;
                var time = hours + ':00';
                return date + ' ' + time;
            };

           
            $scope.setModelValue = function () {

                var type = $scope.clearChecked ? "Clear" : "Renew";
                var workClockDate = "";
                var workClockTime = "";
                var offClockDate = "";
                var offClockTime = "";
                var belongDate = "";
                if (type == "Renew") {

                    if ($scope.workTime == "") {
                        workClockDate = "";
                        workClockTime = "";
                    }
                    else {
                        var wt = $scope.workTime.split(' ');
                        workClockDate = wt[0];
                        workClockTime = wt[1];
                    }

                    if ($scope.offTime == "") {
                        offClockDate = "";
                        offClockTime = "";
                    }
                    else {
                        var ot = $scope.offTime.split(' ');
                        offClockDate = ot[0];
                        offClockTime = ot[1];
                    }                    
                }

                $scope.ngModel = {
                    id: "PunchInfo",
                    fieldType: "optionalField",
                    value: "",
                    fields: {
                        type: {
                            id: "Type",
                            fieldType: "",
                            value: type
                        },
                        workClockDate: {
                            id: "WorkClockDate",
                            fieldType: "",
                            value: workClockDate,
                        },
                        workClockTime: {
                            id: "WorkClockTime",
                            fieldType: "",
                            value: workClockTime,
                        },
                        offClockDate: {
                            id: "OffClockDate",
                            fieldType: "",
                            value: offClockDate,
                        },
                        offClockTime: {
                            id: "OffClockTime",
                            fieldType: "",
                            value: offClockTime,
                        },
                        belongDate: {
                            id: "BelongDate",
                            fieldType: "",
                            value: $scope.belongDate,
                        },
                    }
                }
            }
        },
        link: function (scope, element, attrs, ctrl, transclude) {
                       
            scope.isDirty = false;
            
            scope.validate = function () {
                if (!scope.workTimeChecked && !scope.offTimeChecked && !scope.clearChecked) {
                    ctrl.$setValidity("punchInfo", false);
                    scope.hasError = "error";
                }
                else {
                    ctrl.$setValidity("punchInfo", true);
                    scope.hasError = "";
                }
                scope.invalid = ctrl.$invalid;

            };

            scope.invalid = ctrl.$invalid;
            scope.hasError = "";
            
            scope.workTime = "";
            scope.workTimeChecked = false;
            scope.workTimeChanged = function () {
                if (scope.workTimeChecked) {
                    scope.workTime = scope.getDateTimeString();
                    scope.clearChecked = false;
                }
                else {
                    scope.workTime = '';
                }
                scope.setModelValue();
                scope.isDirty = true;
                scope.validate();
            };

            scope.offTime = "";
            scope.offTimeChecked = false;
            scope.offTimeChanged = function () {
                if (scope.offTimeChecked) {
                    scope.offTime = scope.getDateTimeString();
                    scope.clearChecked = false;
                }
                else {
                    scope.offTime = '';
                }
                scope.setModelValue();
                scope.isDirty = true;
                scope.validate();
            };                     

            scope.clearChecked = false;            
            scope.clearChanged = function () {
                if (scope.clearChecked) {
                    scope.workTimeChecked = false;
                    scope.workTime = "";
                    scope.offTimeChecked = false;
                    scope.offTime = "";                    
                }
                scope.setModelValue();
                scope.isDirty = true;
                scope.validate();
            };
           

            var eleBelongDate = element.find('input.belongDate');
            scope.belongDate = scope.getDateString();
            $(eleBelongDate).datepicker({
                afterDone: function (context) {
                    scope.setModelValue();
                },
            });
            
            element.find('.menu .item').tab();
            
            if (!ctrl) {
                throw new Error('uof-Field-Punch: The \'uofFieldPunch\' directive requires a \'ng-model\' value');
            }

            ctrl.$render = function () {

            };

            scope.$on('validate', function (event, data) {
                scope.validate();
            });
            
            scope.setModelValue();
        },
       
        templateUrl: '../Fields/Punch'
    };
});
