angular.module('MobileForm').controller("choiceJobTitleCtrl", [
    "$scope", "$state", "$stateParams", "choiceService",
    function ($scope, $state, $stateParams, choiceService) {
        $scope.pool.viewTitle = "選取職級";
        $scope.jobtitles = [];
        $scope.onToogle = function (state, prevState, key, text) {
            choiceService.userSet.jobTitle.remove(key);
            if (state == "check") {
                choiceService.userSet.jobTitle.add(key, text);
            }
            console.log(state + '' + prevState + '' + key);
        };
        $scope.onLoaded = function (key) {
            var index = choiceService.userSet.jobTitle.indexOf(key);
            if (index == -1) {
                return 'none';
            }
            else {
                return 'check';
            }
        };
        var init = function () {
            var promise = choiceService.getJobTitle();
            promise.then(function (data) {
                $scope.jobtitles = data;
            }, function (data) {
                $scope.error = { message: 'get group data error' };
            });
        };
        init();
    }
]);
