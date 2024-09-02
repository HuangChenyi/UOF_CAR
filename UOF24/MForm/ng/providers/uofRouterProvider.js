
angular.module('MobileForm')
    .provider("uofRouter", function($stateProvider) {
        var urlCollection;

        this.$get = function($http, $state) {
            return {
                setUpRoutes: function() {
                    $http.get(
                        urlCollection, {
                            method: 'GET',
                            headers: {
                                'Content-type': 'application/json'
                            }
                        })
                        .success(function (jsonStr) {
                            var routers = angular.fromJson(jsonStr);
                            for (var routeName in routers) {
                                if (!$state.get(routeName)) {
                                    $stateProvider.state(routeName, routers[routeName]);
                                }
                            }
                        });
                }
            }
        };

        this.setCollectionUrl = function(url) {
            urlCollection = url;
        }
    })
    .run(function (uofRouter) {
        uofRouter.setUpRoutes();
    });


    