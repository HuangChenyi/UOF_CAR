angular.module('MobileForm').controller("indexCtrl", [
    "$scope", "$state", "$window", "$http",'$q', function ($scope, $state, $window, $http,$q) {
        $scope.pool = {};
        $scope.scrollPos = {};
        $scope.pool.viewTitle = "表單";
        $scope.leaveShow = true;
        $scope.punchShow = true;

        $scope.load = function () {
            var deferred = $q.defer();
            var request = $http({
                method: 'GET',
                url: uofScript.setting.serverRoot + 'api/form/formList/' + uofScript.setting.userId,
                params: {},

            })
                .success(function (data, status, headers, config) {
                    deferred.resolve(data);
                })
                .error(function (data, status, headers, config) {
                    deferred.reject(data);
                });


            var promise = deferred.promise;
            promise.then(function (data) {
                $scope.leaveShow = data.Leave;
                $scope.punchShow = data.Punch;
            }, function (data) {
                $scope.error = { message: 'get group data error' };
            });
        }

        $scope.apply = function (formName) {
            //$window.location.href = uofScript.setting.serverRoot + "form/" + formName;
            $state.go(formName);
        };

        $scope.load();
    }
     ]);