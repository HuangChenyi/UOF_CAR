angular.module('MobileForm').controller("choiceSearchCtrl", [
    "$scope", "$state", "$timeout", "choiceService",
    function ($scope, $state, $timeout, choiceService) {
        $scope.pool.viewTitle = "搜尋";
        $scope.goBack = function () {
            $state.go('^');
        };
        $scope.type = "employee";
        $scope.keyword = "";
        $scope.wait = false;
        $scope.selected = function (key) {
            if (key == "employee") {
                $scope.type = "employee";
                $scope.groups = [];
            }
            else {
                $scope.type = "department";
                $scope.users = [];
            }
            doSearch();
        };
        $scope.groups = [];
        $scope.users = [];
        $scope.keyup = function () {
            doSearch();
        };
        function doSearch() {
            if (!$scope.wait) {
                $scope.wait = true;
                $timeout(function () {
                    var promise = {};
                    if ($scope.type == "employee") {
                        promise = choiceService.searchEmployees($scope.keyword);
                    }
                    else {
                        promise = choiceService.searchDepartments($scope.keyword);
                    }
                    promise.then(function (data) {
                        if ($scope.type == "employee") {
                            $scope.users = data;
                        }
                        else {
                            $scope.groups = data;
                        }
                    }, function (data) {
                        $scope.error = { message: 'get group data error' };
                    });
                    $scope.wait = false;
                }, 1000);
            }
        }
        $scope.onGroupToogle = function (state, prevState, key, text) {
            choiceService.userSet.group.remove(key, prevState == "plus");
            if (state == "check" || state == "plus") {
                choiceService.userSet.group.add(key, state == "plus", text);
            }
            console.log(state + '' + prevState + '' + key);
        };
        $scope.onGroupLoaded = function (key) {
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
        $scope.onUserToogle = function (state, prevState, key, text) {
            choiceService.userSet.user.remove(key);
            if (state == "check") {
                choiceService.userSet.user.add(key, text);
            }
            console.log(state + '' + prevState + '' + key);
        };
        $scope.onUserLoaded = function (key) {
            var index = choiceService.userSet.user.indexOf(key);
            if (index == -1) {
                return 'none';
            }
            else {
                return 'check';
            }
        };
        function init() {
        }
        init();
    }
]);
