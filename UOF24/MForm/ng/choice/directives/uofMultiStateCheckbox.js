angular.module('MobileForm')
    .directive('uofMultiStateCheckbox', function () {
    return {
        restrict: 'E',
        replace: true,
        template: '<div ng-click="toogle()"><span ng-class="icon"></span>{{text}}</div>',
        scope: {
            key: '=',
            text: '=',
            selectedKey: '=',
            'onToogle': '&',
            'onLoaded': '&'
        },
        link: function (scope, elem, attrs) {
            scope.icon = attrs.defaultIcon;
            scope.currentState = "none";
            scope.$watch('selectedKey', function (newValue, oldValue) {
                if (scope.selectedKey) {
                    if (scope.key != newValue) {
                        scope.icon = attrs.defaultIcon;
                        scope.currentState = "none";
                    }
                }
            });
            var init = function () {
                var state = scope.onLoaded({ key: attrs.key });
                console.log("init:" + state);
                if (state == 'check') {
                    scope.icon = attrs.checkIcon;
                    scope.currentState = "check";
                }
                else if (state == 'plus') {
                    scope.icon = attrs.plusIcon;
                    scope.currentState = "plus";
                }
                else {
                    scope.icon = attrs.defaultIcon;
                    scope.currentState = "none";
                }
            };
            scope.toogle = function () {
                if (attrs.status == '3') {
                    if (scope.currentState == 'none' || !scope.currentState) {
                        scope.icon = attrs.checkIcon;
                        scope.currentState = "check";
                        scope.onToogle({ state: scope.currentState, prevState: "plus", key: scope.key, text: scope.text });
                    }
                    else if (scope.currentState == 'check') {
                        scope.icon = attrs.plusIcon;
                        scope.currentState = "plus";
                        scope.onToogle({ state: scope.currentState, prevState: "none", key: scope.key, text: scope.text });
                    }
                    else {
                        scope.icon = attrs.defaultIcon;
                        scope.currentState = "none";
                        scope.onToogle({ state: scope.currentState, prevState: "check", key: scope.key, text: scope.text });
                    }
                }
                else {
                    if (scope.currentState == 'none' || !scope.currentState) {
                        scope.icon = attrs.checkIcon;
                        scope.currentState = "check";
                        scope.onToogle({ state: scope.currentState, prevState: "none", key: scope.key, text: scope.text });
                    }
                    else if (scope.currentState == 'check') {
                        scope.icon = attrs.defaultIcon;
                        scope.currentState = "none";
                        scope.onToogle({ state: scope.currentState, prevState: "check", key: scope.key, text: scope.text });
                    }
                }
            };
            init();
        }
    };
});
