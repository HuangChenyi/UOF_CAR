angular.module('MobileForm')
    .directive('uofUsersetJobtitleCheckbox', function () {
    return {
        restrict: 'E',
        replace: true,
        // template: '<div ng-click="toogle()"><i ng-class="icon" class="fa fa-lg fa-fw"></i>{{text}}</div>',
        template: '<div ng-click="toogle()"><span ng-class="icon"></span>{{text}}</div>',
        scope: {
            key: '=',
            text: '=',
            'onToogle': '&',
            'onLoaded': '&'
        },
        link: function (scope, elem, attrs) {
            //var iconDefault = "fa-square-o";
            //var iconCheck = "fa-check-square-o";
            //var iconPlus = "fa-plus-square-o";
            var iconDefault = "choice-jobtitle-default";
            var iconCheck = "choice-jobtitle-check";
            scope.icon = iconDefault;
            scope.state = "none";
            var init = function () {
                var state = scope.onLoaded({ key: scope.key });
                console.log("init:" + state);
                if (state == 'check') {
                    scope.icon = iconCheck;
                    scope.state = "check";
                }
                else {
                    scope.icon = iconDefault;
                    scope.state = "none";
                }
            };
            scope.toogle = function () {
                if (scope.state == 'none' || !scope.state) {
                    scope.icon = iconCheck;
                    scope.state = "check";
                    scope.onToogle({ state: scope.state, prevState: "default", key: scope.key, text: scope.text });
                }
                else {
                    scope.icon = iconDefault;
                    scope.state = "none";
                    scope.onToogle({ state: scope.state, prevState: "check", key: scope.key, text: scope.text });
                }
            };
            init();
        }
    };
});
