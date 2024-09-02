(function (angular) {
    "use strict";

    angular.module("MobileForm", ["ui.router", "angularFileUpload", "ngSanitize"])
        .config(function ($stateProvider, $urlRouterProvider, uofRouterProvider) {
            $urlRouterProvider.otherwise("/");

            $stateProvider
                
                .state('index', {
                    url: "/",
                    templateUrl: "indexContent",
                    controller: "indexCtrl"
                })
                .state('leave', {
                    url: "/leave",
                    templateUrl: "leaveContent",
                    controller: "leaveCtrl"
                })
                .state('punch', {
                    url: "/punch",
                    templateUrl: "punchContent",
                    controller: "punchCtrl"
                })
                .state('fileDetail', {
                    url: "/fileDetail/:fieldType?field&form",
                    templateUrl: "FileDetail",
                    controller: "fileCtrl"
                })
                .state('listDetail', {
                    url: "/listDetail",
                    templateUrl: "ListDetail",
                    controller: "listDetailCtrl"
                })
                .state('choice', {
                    url: "/choice/:type?init&form&field",
                    templateUrl: "../choice/index",
                    controller: "choiceCtrl"
                })
                .state('choice.result', {
                    url: "/result/",
                    templateUrl: "../choice/result",
                    controller: "choiceResultCtrl"
                })
                .state('choice.department', {
                    url: "/department/:groupId",
                    templateUrl: "../choice/department",
                    controller: "choiceDepartmentCtrl"
                })
                .state('choice.employee', {
                    url: "/employee/:groupId",
                    templateUrl: "../choice/employee",
                    controller: "choiceEmployeeCtrl"
                })
                .state('choice.jobtitle', {
                    url: "/jobtitle",
                    templateUrl: "../choice/jobtitle",
                    controller: "choiceJobTitleCtrl"
                })
                .state('choice.jobfunction', {
                    url: "/jobfunction",
                    templateUrl: "../choice/jobfunction",
                    controller: "choiceJobFunctionCtrl"
                })
                .state('choice.search', {
                    url: "/search",
                    templateUrl: "../choice/search",
                    controller: "choiceSearchCtrl"
                })
                .state('choiceOne', {
                    url: "/one/choice",
                    templateUrl: "../choiceOne/index",
                    controller: "choiceOneCtrl"
                })
                .state('choiceOne.department', {
                    url: "/department/:groupId",
                    templateUrl: "../choiceOne/department",
                    controller: "choiceOneDepartmentCtrl"
                })
                .state('choiceOne.employee', {
                    url: "/employee/:groupId",
                    templateUrl: "../choiceOne/employee",
                    controller: "choiceOneEmployeeCtrl"
                })
                .state('choiceOne.jobtitle', {
                    url: "/jobtitle",
                    templateUrl: "../choiceOne/jobtitle",
                    controller: "choiceOneJobTitleCtrl"
                })
                .state('choiceOne.jobfunction', {
                    url: "/jobfunction",
                    templateUrl: "../choiceOne/jobfunction",
                    controller: "choiceOneJobFunctionCtrl"
                });

            //uofRouterProvider.setCollectionUrl('../poc/route.js');
            //../poc/route.js 的內容
            //{
            //    "propertyList": {
            //        "url": "/propertyList",
            //        "templateUrl": "../poc/propertyList",
            //        "controller": "propertyListCtrl"
            //    },
            //    "history": {
            //        "url": "/history",
            //        "templateUrl": "../poc/history",
            //        "controller": "historyCtrl"
            //    }
            //}
        })
        .config(function ($httpProvider) {
            $httpProvider.defaults.transformRequest = function (data) {
                if (data === undefined) {
                    return data;
                }
                return $.param(data);
            }
        });

})(window.angular);