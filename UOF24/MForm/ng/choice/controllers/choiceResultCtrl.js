angular.module('MobileForm').controller("choiceResultCtrl", [
    "$scope", "$state", "$stateParams", "choiceService", "dataService",
    function ($scope, $state, $stateParams, choiceService) {
        $scope.pool.viewTitle = "選取結果";
        $scope.goBack = function () {
            $state.go('^');
        };
        $scope.results = choiceService.userSet.getElements();
        $scope.setImage = function (element) {
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
        $scope.remove = function (element) {
            var key = choiceService.userSet.getKeyByElement(element);
            choiceService.userSet.removeByKey(key);
        };
        $scope.save = function () {
            $scope.saveToFrom();
            $scope.gotoCaller();
        };
        function init() {
        }
        init();
    }
]);
