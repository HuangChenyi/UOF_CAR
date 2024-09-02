angular.module('MobileForm').factory('choiceService', function ($http, $q) {
    var service = {};
    service.hostUrl = "http://172.16.3.85/Uof11.42/api/choice/";
    service.userSet = new userSet();
    service.getDepartments = function (parent) {
        var deferred = $q.defer();
        var request = $http({
            method: 'GET',
            url: service.hostUrl + 'department/' + parent,
            params: {},
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .success(function (data, status, headers, config) {
            deferred.resolve(data);
        })
            .error(function (data, status, headers, config) {
            deferred.reject(data);
        });
        return deferred.promise;
    };
    service.getDepartmentWithUser = function (parent) {
        var deferred = $q.defer();
        var request = $http({
            method: 'GET',
            url: service.hostUrl + 'departmentwithuser/' + parent,
            params: {},
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .success(function (data, status, headers, config) {
            deferred.resolve(data);
        })
            .error(function (data, status, headers, config) {
            deferred.reject(data);
        });
        return deferred.promise;
    };
    service.getJobTitle = function () {
        var deferred = $q.defer();
        var request = $http({
            method: 'GET',
            url: service.hostUrl + 'jobTitle',
            params: {},
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .success(function (data, status, headers, config) {
            deferred.resolve(data);
        })
            .error(function (data, status, headers, config) {
            deferred.reject(data);
        });
        return deferred.promise;
    };
    service.getJobFunction = function () {
        var deferred = $q.defer();
        var request = $http({
            method: 'GET',
            url: service.hostUrl + 'jobFunction',
            params: {},
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
        })
            .success(function (data, status, headers, config) {
            deferred.resolve(data);
        })
            .error(function (data, status, headers, config) {
            deferred.reject(data);
        });
        return deferred.promise;
    };
    service.searchDepartments = function (keyword) {
        var deferred = $q.defer();
        var request = $http({
            method: 'GET',
            url: service.hostUrl + 'searchDepartment/' + keyword,
            params: {},
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        })
            .success(function (data, status, headers, config) {
            deferred.resolve(data);
        })
            .error(function (data, status, headers, config) {
            deferred.reject(data);
        });
        return deferred.promise;
    };
    service.searchEmployees = function (keyword) {
        var deferred = $q.defer();
        var request = $http({
            method: 'GET',
            url: service.hostUrl + 'searchUser/' + keyword,
            params: {},
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        })
            .success(function (data, status, headers, config) {
            deferred.resolve(data);
        })
            .error(function (data, status, headers, config) {
            deferred.reject(data);
        });
        return deferred.promise;
    };
    return service;
});
