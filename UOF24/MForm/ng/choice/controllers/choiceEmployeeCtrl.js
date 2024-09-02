angular.module('MobileForm').controller("choiceEmployeeCtrl", [
    "$scope", "$state", "$stateParams", "choiceService",
    function ($scope, $state, $stateParams, choiceService) {
        $scope.pool.viewTitle = "選取員工";
        $scope.groups = [];
        $scope.users = [];
        $scope.parent = {};
        $scope.goToDepartment = function (groupId) {
            $state.go('choice.employee', { "groupId": groupId });
        };
        $scope.setImage = function (element) {
            return "choice-group-default";
        };
        $scope.goBack = function () {
            //window.history.back();
            //var parentId = choiceService.departmentRelation.getParent($stateParams.parentId);
            $state.go('choice.employee', { "groupId": $scope.parent.GroupId });
        };
        $scope.showBack = function () {
            if ($scope.parent.GroupId) {
                return true;
            }
            return false;
        };
        $scope.onToogle = function (state, prevState, key, text) {
            choiceService.userSet.user.remove(key);
            if (state == "check") {
                choiceService.userSet.user.add(key, text);
            }
            console.log(state + '' + prevState + '' + key);
        };
        $scope.onLoaded = function (key) {
            var index = choiceService.userSet.user.indexOf(key);
            if (index == -1) {
                return 'none';
            }
            else {
                return 'check';
            }
        };
        //$scope.$on('$stateChangeStart',
        //    function (event, toState, toParams, fromState, fromParams) {
        //        choiceService.departmentRelation.add($stateParams.groupId, $stateParams.parentId);
        //    });
        var init = function () {
            var promise = choiceService.getDepartmentWithUser($stateParams.groupId);
            promise.then(function (data) {
                $scope.groups = data.departments;
                $scope.parent = data.parent;
                $scope.users = data.users;
            }, function (data) {
                $scope.error = { message: 'get group data error' };
            });
        };
        init();
    }
]);
