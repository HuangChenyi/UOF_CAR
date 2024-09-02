'use strict';
angular.module('MobileForm')
  
//.directive('uofCheckbox', function ($timeout) {
//    var uniqueId = 1;
//    return {
//        restrict: 'E',
//        replace: true,
//        transclude: true,
//        require: 'ngModel',
//        scope: {
//            ngChange: '&',
//            ngModel: '=ngModel'
//        },
//        controller: function ($scope, $element, $attrs) {
//            $scope.uniqueId = uniqueId++;
//            $timeout(function () {
//                $timeout(function () {
//                    var chk=$("#uofCheckbox" + $scope.uniqueId).checkbox();
//                    if ($scope.ngModel) {
//                        chk.checkbox('set checked');
//                    }

//                    chk.checkbox({ 
//                        onChecked: function () {
//                            $scope.$apply(function () {
//                                $scope.ngModel = true;                               
//                            });
//                            if ($attrs.ngChange) {
//                                $scope.ngChange();
//                            }
//                        },
//                        onUnchecked: function () {
//                            $scope.$apply(function () {
//                                $scope.ngModel = false;                               
//                            });
//                            if ($attrs.ngChange) {
//                                $scope.ngChange();
//                            }
//                        },
//                    });
//                }, 0);
//            }, 0);
//        },
      
        
//        template: '<div class="ui checkbox" id="uofCheckbox{{::uniqueId}}"><input type="checkbox"><label ng-transclude></label></div>',
       
//    };

//})
 .directive('uofCheckbox', function () {
    return {
        restrict: 'E',
        require: '?ngModel',
        transclude: true,
        replace: true,
        template: '<div class="ui checkbox">' +
                    '<input type="checkbox">' +
                    '<label></label>' +
                  '</div>',

        link: function (scope, element, attrs, ngModel, transclude) {

            var checked = false;
            var disabled = false;
            var input = element.find('input');

            transclude(scope, function (nodes) {
                element.find('label').append(nodes);
            });

           element.on('click', toggleFn);

            if (!ngModel) {
                throw new Error('Semantic-UI-Angular: The \'smCheckbox\' directive requires a \'ng-model\' value');
            }

            ngModel.$render = function () {
                checked = ngModel.$viewValue;
                input.prop('checked', checked);     
            };
           
            
            scope.$watch(attrs.ngDisabled, function (val) {
                disabled = val || false;
                input.attr('disabled', disabled);
            });


            if (attrs.toggle !== void 0) {
                element.addClass('toggle');
            }
            else if (attrs.slider !== void 0) {
                element.addClass('slider');
            }

            if (attrs.ariaLabel === void 0) {
                element.attr('aria-label', element[0].textContent.trim());
            }

            function toggleFn() {

                if (disabled) { return; }

                checked = !checked;
                input.prop('checked', checked);
                ngModel.$setViewValue(checked);
                
                scope.$apply();
            }
        }
    };

});

