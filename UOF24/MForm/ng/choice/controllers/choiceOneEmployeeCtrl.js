angular.module('MobileForm').controller("choiceOneEmployeeCtrl", [
    "$scope", "$state", "$stateParams", "choiceService", "pocDataService",
    function ($scope, $state, $stateParams, choiceService, pocDataService) {
        $scope.pool.viewTitle = "選取員工";
        $scope.groups = [];
        $scope.users = [];
        $scope.parent = {};
        $scope.current = {};
        $scope.goToDepartment = function (groupId) {
            $state.go('choiceOne.employee', { "groupId": groupId });
        };
        $scope.setImage = function (element) {
            return "choice-group-default";
        };
        $scope.goBack = function () {
            $state.go('choiceOne.employee', { "groupId": $scope.parent.GroupId });
        };
        $scope.showBack = function () {
            if ($scope.parent.GroupId) {
                return true;
            }
            return false;
        };
        $scope.onToogle = function (state, prevState, key, text) {
            pocDataService.formData.oneEmployee.name = text;
            pocDataService.formData.oneEmployee.jobTitle = "員工";
            pocDataService.formData.oneEmployee.department = $scope.current.Name;
            pocDataService.formData.oneEmployee.key = key;
            $state.go('home');
        };
        $scope.onLoaded = function (key) {
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
                $scope.current = data.current;
                $scope.users = data.users;
            }, function (data) {
                $scope.error = { message: 'get group data error' };
            });
        };
        init();
    }
]);
