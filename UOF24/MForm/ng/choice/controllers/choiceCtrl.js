angular.module('MobileForm').controller("choiceCtrl", [
    "$scope", "$state", "$stateParams", "choiceService", "dataService",
    function ($scope, $state, $stateParams, choiceService, dataService) {
        $scope.pool.viewTitle = "選取人員";
        $scope.field = "";
        $scope.goBack = function () {
            if (choiceService.userSet.count() > 0) {
                $('.confirmChoice').modal('show');
            }
            else {
                $scope.gotoCaller();
            }
        };
        $scope.goHome = function () {
            $scope.gotoCaller();
        };
        $scope.goResult = function () {
            $state.go("choice.result");
        };
        $scope.show = function () {
            $(".ui.sidebar").sidebar("hide");
        };
        $scope.load = function () {
            $scope.field = $stateParams.field;
            $scope.form = $stateParams.form;
            var type = $stateParams.type;
            choiceService.userSet = new userSet();
            choiceService.userSet.setObject(dataService.formData.fields[$scope.field].value);
            if (type == "all") {
                $(".ui.sidebar")
                    .sidebar({
                    context: $(".sidebarContext")
                })
                    .sidebar("attach events", ".sidebarMenu")
                    .sidebar("show");
                $state.go('choice.result');
            }
            else {
                $(".menu .sidebarMenu").hide();
                $state.go('choice.' + type);
            }
        };
        $scope.saveToFrom = function () {
            dataService.formData.fields[$scope.field].value = choiceService.userSet.getObject();
        };
        $scope.gotoCaller = function () {
            $state.go($scope.form);
        };
        
        $scope.load();
    }
]);
