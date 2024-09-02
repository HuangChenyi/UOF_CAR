angular.module('MobileForm').controller("choiceOneCtrl", [
    "$scope", "$state", "choiceService",
    function ($scope, $state, choiceService) {
        $scope.pool.viewTitle = "選取人員";
        $scope.goBack = function () {
            $state.go('home');
        };
        $scope.load = function () {
            //if ($state.is("choiceOne", { "type": "employee" })) {
            //    $state.go('choiceOne.employee');
            //}
        };
        $scope.load();
    }
]);
