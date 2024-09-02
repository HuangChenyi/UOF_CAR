angular.module('MobileForm').controller("choiceDepartmentCtrl", [
    "$scope", "$state", "$stateParams", "choiceService",
    function ($scope, $state, $stateParams, choiceService) {
        $scope.pool.viewTitle = "選取部門";
        $scope.groups = [];
        $scope.parent = {};
        $scope.goToDepartment = function (groupId) {
            console.log("groupId:" + groupId);
            $state.go('choice.department', { "groupId": groupId });
        };
        $scope.goBack = function () {
            $state.go('choice.department', { "groupId": $scope.parent.GroupId });
        };
        $scope.showBack = function () {
            if ($stateParams.groupId) {
                return true;
            }
            return false;
        };
        $scope.onToogle = function (state, prevState, key, text) {
            choiceService.userSet.group.remove(key, prevState == "plus");
            if (state == "check" || state == "plus") {
                choiceService.userSet.group.add(key, state == "plus", text);
            }
            console.log(state + '' + prevState + '' + key);
        };
        $scope.onLoaded = function (key) {
            var index = choiceService.userSet.group.indexOf(key);
            if (index == -1) {
                return 'none';
            }
            else {
                var element = choiceService.userSet.get(index);
                if (element["@isDepth"] == "True") {
                    return 'plus';
                }
                else {
                    return 'check';
                }
            }
        };
        var init = function () {
            var promise = choiceService.getDepartments($stateParams.groupId);
            promise.then(function (data) {
                $scope.groups = data.departments;
                $scope.parent = data.parent;
                //$scope.parentId = $stateParams.parentId;
            }, function (data) {
                $scope.error = { message: 'get group data error' };
            });
        };
        init();
    }
]);
