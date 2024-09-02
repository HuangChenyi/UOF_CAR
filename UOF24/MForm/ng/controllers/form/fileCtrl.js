angular.module('MobileForm').controller("fileCtrl", [
    "$scope", "$state", "$stateParams", "FileUploader", "dataService",
    function ($scope, $state, $stateParams, fileUploader, dataService) {
        $scope.hostUrl = "http://172.16.3.85/UOF11.42/api/files/upload";
        $scope.pool.viewTitle = "附件";
        $scope.field = "";
        $scope.fieldType = "";
        $scope.goBack = function () {
            $scope.gotoCaller();
        };
        //$scope.fieldId = dataService.fileFieldId;
        var uploader = $scope.uploader = new fileUploader({
            scope: $scope,
            url: $scope.hostUrl,
            autoUpload: true,
        });
        // ADDING FILTERS
        uploader.filters.push({
            name: 'customFilter',
            fn: function (item /*{File|FileLikeObject}*/, options) {
                return this.queue.length < 10;
            }
        });
        // REGISTER HANDLERS
        //uploader.bind('afteraddingfile', function (event, item) {
        //    console.info('After adding a file', item);
        //});
        //uploader.bind('whenaddingfilefailed', function (event, item) {
        //    console.info('When adding a file failed', item);
        //});
        //uploader.bind('afteraddingall', function (event, items) {
        //    console.info('After adding all files', items);
        //});
        //uploader.bind('beforeupload', function (event, item) {
        //    console.info('Before upload', item);
        //});
        //uploader.bind('progress', function (event, item, progress) {
        //    console.info('Progress: ' + progress, item);
        //});
        //uploader.bind('afterremovingfile', function (event, item) {
        //    //console.info('afterremovingfile', item);
        //    console.info('afterremovingfile', item.formData[0]);
        //    if (item._xhr.response) {
        //        var file = angular.fromJson(angular.fromJson(item._xhr.response).data);
        //        dataService.fileDelete(file.id);
        //    }
        //});
        uploader.onSuccessItem = function (fileItem, response, status, headers) {
            console.info('onSuccessItem', fileItem, response, status, headers);
            if (response.data) {
                var file = angular.fromJson(response.data);
                dataService.fileAdd($scope.field, $scope.fieldType, file.id, file.name);
            }
        };
        uploader.onCancelItem = function (fileItem, response, status, headers) {
            console.info('onCancelItem', fileItem, response, status, headers);
            if (response) {
                var file = angular.fromJson(angular.fromJson(response).data);
                dataService.fileDelete(file.id);
            }
        };
        uploader.onErrorItem = function (fileItem, response, status, headers) {
            console.info('onErrorItem', fileItem, response, status, headers);
        };
        //uploader.bind('cancel', function (event, xhr, item) {
        //    console.info('Cancel', xhr, item);
        //});
        $scope.removeFile = function (item) {
            item.remove();
            var file = angular.fromJson(angular.fromJson(item._xhr.response).data);
            dataService.fileDelete(file.id);
        };
        $scope.isImage = function (item) {
            var type = '|' + item.type.slice(item.type.lastIndexOf('/') + 1) + '|';
            return '|jpg|png|jpeg|bmp|gif|'.indexOf(type) !== -1;
        };
        $scope.load = function () {
            $scope.fieldType = $stateParams.fieldType;
            $scope.field = $stateParams.field;
            $scope.form = $stateParams.form;
            //if (!$scope.fieldId) {
            //    $state.go('home');
            //}           
            $('.right.menu.open').on("click", function (e) {
                e.preventDefault();
                $('.ui.vertical.menu').toggle();
            });
            $('.ui.dropdown').dropdown();
            $('.ui.radio.checkbox').checkbox();
            $('.ui.toggle.checkbox').checkbox();
        };

        $scope.gotoCaller = function () {
            $state.go($scope.form);
        };

        $scope.load();
    }
]);
