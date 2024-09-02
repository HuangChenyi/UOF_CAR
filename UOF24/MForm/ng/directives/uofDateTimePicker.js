'use strict';
angular.module('MobileForm')
    .directive('uofDateTimePicker', function ($timeout) {
    var uniqueId = 1;
    return {
        restrict: 'E',
        transclude: true,      
        require: '?ngModel',
        replace: true,
        scope: {},
        link: function (scope, element, attrs, ngModel, transclude) {

            scope.date = '';
            scope.time = '';
            var eleDate = element.find('.date input');
            var eleTime = element.find('.time input');

            $(eleDate).datepicker({               
                afterDone: function (context) {
                    scope.$apply(function () {
                        if (attrs.ngChange) {
                            scope.$eval(attrs.ngChange);
                        }
                        ngModel.$setViewValue(scope.date + ' ' + scope.time);
                    });
                },
            });

            $(eleTime).clockpicker({
                autoclose: true,
                afterDone: function () {
                    scope.$apply(function () {
                        if (attrs.ngChange) {
                            scope.$eval(attrs.ngChange);
                        }                   
                        ngModel.$setViewValue(scope.date + ' ' + scope.time);
                    });
                }
            });

            
                   

            if (!ngModel) {
                throw new Error('uof-DateTime-Picker: The \'uofDateTimePicker\' directive requires a \'ng-model\' value');
            }

            ngModel.$render = function () {                  
                var datetime = ngModel.$modelValue;
                if (datetime == '') {
                    if (attrs.required) {
                        var d = new Date();
                        var h = d.getHours();
                        var mm = (d.getMonth() + 1);
                        var dd = d.getDate();
                        var month = mm < 10 ? '0' + mm : mm;
                        var day = dd < 10 ? '0' + dd : dd;
                        scope.date = d.getFullYear() + "/" + month + '/' + day;
                        var hours = h < 10 ? '0' + h : h;
                        scope.time = hours + ':00';
                    }
                    else {
                        scope.date = '';
                        scope.time = '';
                    }                 
                }
                else {
                    if (datetime) {
                        var splitdate = datetime.split(" ");
                        scope.date = splitdate[0];
                        scope.time = splitdate.length > 1 ? splitdate[1] : new Date().getHours() + ":00";
                    }
                }
                
              
            };
         
         
        },
        template: '<div class="two fields">' +
            '<div class="field" >' +
            '<div class="ui icon input date">' +
            '<input type="text" ng-model="date" readonly></input>' +
            '<i class="calendar icon"></i>' +
            '</div></div>' +
            '<div class="field" >' +
            '<div class="ui icon input time">' +
            '<input type="text" ng-model="time" readonly></input>' +
            '<i class="clock icon"></i>' +
            '</div></div></div>'
    };
});
