angular.module('MobileForm').controller("rootCtrl", [
    "$scope", "$state", "$timeout", function ($scope, $state, $timeout) {
        $scope.pool = {};
        $scope.scrollPos = {};
        $scope.$on('$stateChangeStart', function (event, toState, toParams, fromState, fromParams) {
            $scope.scrollPos[$state.current.name] = $(window).scrollTop();
            console.log($scope.scrollPos);
        });
        $scope.$on('$viewContentLoaded', function () {
            $timeout(function () {
                $(window).scrollTop($scope.scrollPos[$state.current.name] ? $scope.scrollPos[$state.current.name] : 0);
                $scope.scrollPos[$state.current.name] = 0;
            }, 0);
        });
    }
]);
