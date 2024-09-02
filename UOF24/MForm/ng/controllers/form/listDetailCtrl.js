angular.module('MobileForm').controller("listDetailCtrl", [
    "$scope", "$state", "dataService", function ($scope, $state, dataService) {
        $scope.pool.viewTitle = "明細";
        $scope.goBack = function () {
            $state.go('home');
        };
        $scope.item = dataService.detailItem;
        $scope.mode = dataService.detailMode;
        $scope.amount = function () {
            return $scope.price * $scope.qty;
        };
        $scope.confirm = function () {
            $('.small.confirm.modal').modal('show');
        };
        $scope.remove = function () {
            dataService.detailRemove();
            $state.go('home');
        };
        $scope.save = function () {
            if (!$scope.item.subject) {
                $scope.item.subject.$error.required = true;
            }
            else {
                dataService.detailSave();
                $state.go('home');
            }
        };
        $scope.submit = function () {
            if ($(".ui.form").form('validate form')) {
                dataService.detailSave();
                $state.go('home');
            }
        };
        var init = function () {
            if (!$scope.mode) {
                $state.go('home');
            }
            $('.small.confirm.modal')
                .modal({
                detachable: false
            });
            init();
        };
    }
]);
