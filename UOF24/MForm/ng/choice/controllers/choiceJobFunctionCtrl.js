angular.module('MobileForm').controller("choiceJobFunctionCtrl", [
    "$scope", "$state", "$stateParams", "choiceService",
    function ($scope, $state, $stateParams, choiceService) {
        $scope.pool.viewTitle = "選取職級";
        $scope.jobfunctions = [];
        $scope.onToogle = function (state, prevState, key, text) {
            choiceService.userSet.jobFunction.remove(key);
            if (state == "check") {
                choiceService.userSet.jobFunction.add(key, text);
            }
            console.log(state + '' + prevState + '' + key);
        };
        $scope.onLoaded = function (key) {
            var index = choiceService.userSet.jobFunction.indexOf(key);
            if (index == -1) {
                return 'none';
            }
            else {
                return 'check';
            }
        };
        var init = function () {
            var promise = choiceService.getJobFunction();
            promise.then(function (data) {
                $scope.jobfunctions = data;
            }, function (data) {
                $scope.error = { message: 'get data error' };
            });
        };
        init();
    }
]);
