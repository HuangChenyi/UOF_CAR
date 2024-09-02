var $eDoc = {
    modal: {
        getContainerTemplateHtml: function () {
            return '\
            <div id="uofModalContainer" class="uof-modal-container"> \
                <div class="uof-modal uof-fade" id="uofModal" style="pointer-events: none"> \
                    <div class="uof-modal-dialog"> \
                        <div class="uof-modal-content"> \
                            <div class="uof-modal-header"> \
                                <h4 class="uof-modal-title"><span id="eDocTitle"></span></h4> \
                                <button id="eDocClose" type="button" class="uof-close" style="color: red; opacity: inherit">&times;</button> \
                            </div> \
                            <div class="uof-modal-body"></div> \
                            <div class="uof-modal-footer"> \
                                <button type="button" class="btn btn-primary"><span id="eDocSubmit"></span></button> \
                            </div> \
                        </div> \
                    </div> \
                </div> \
            </div>';
        },
        resize: function () {
            if ($("#uofModalContainer") !== undefined) {
                $("#uofModalContainer").css("top", $(window).height() / 2 - $("#uofModalContainer").height() / 2);
            }
        },
        hide: function () {
            if ($("#uofModal") !== undefined) $("#uofModal").modal("hide");
            if ($("#uofModalContainer") !== undefined) $("#uofModalContainer").remove();
        },
        alert: {
            show: function (sender) {
                $(window).resize(function () {
                    $eDoc.modal.resize();
                });

                var alertHtml = '<span id="eDocAlert" style="white-space:pre-wrap;"></span>';

                if (sender.isDialog) {
                    $("#ContentDIV").append($eDoc.modal.getContainerTemplateHtml());
                }
                else {
                    $("#MasterContent > div").append($eDoc.modal.getContainerTemplateHtml());
                }
                $(".uof-modal-body").append(alertHtml);
                $("#eDocAlert").text(sender.message);
                $("#eDocTitle").text(sender.title);
                $("#eDocSubmit").text(sender.button);
                $("#uofModal").modal("show");
                $("#uofModal  .uof-modal-footer > button").attr("onclick", "$eDoc.modal.alert.hide();");
                $("#eDocClose").css("display", "none");

                $eDoc.modal.resize();
            },
            hide: function () {
                $eDoc.modal.hide();
            }
        },
        confirm: {
            show: function (sender) {
                $(window).resize(function () {
                    $eDoc.modal.resize();
                });

                var confirmHtml = '<span id="eDocComfirm"></span>';

                var redMessageListHtml = '';

                if (sender.isNeedRedMessage) {
                    redMessageListHtml = '<br /><span id="eDocMessageList" style="color: red;white-space: pre;"></span>';
                }

                var secondBtnHtml = '<button id="second" type="button" class="btn btn-default"><span id="eDocSecond"></span></button>';

                $eDoc.modal.confirm.confirmValue = null;

                $("#MasterContent > div").append($eDoc.modal.getContainerTemplateHtml());
                $("#ContentDIV").append($eDoc.modal.getContainerTemplateHtml());

                $("#uofModal .uof-modal-footer > button").attr("id", "first");

                $(".uof-modal-body").append(confirmHtml);
                $(".uof-modal-body").append(redMessageListHtml);
                $(".uof-modal-footer").append(secondBtnHtml);

                $("#eDocComfirm").text(sender.message);
                $("#eDocTitle").text(sender.title);
                $("#eDocSubmit").text(sender.button);
                $("#eDocSecond").text(sender.cancelBtn);
                $("#eDocMessageList").text(sender.redMessageList);
                $("#uofModal").modal("show");

                $("#uofModal .uof-modal-footer #first").attr("onclick", "$eDoc.modal.confirm.ok('" + sender.submitFucName + "', '" + sender.submitParam + "');");
                $("#uofModal .uof-modal-footer #second").attr("onclick", "$eDoc.modal.confirm.hide();");
                $("#eDocClose").css("display", "none");

                $eDoc.modal.resize();
            },
            ok: function (funcName, funcParam) {

                $eDoc.modal.hide();

                if (funcParam != null && funcParam != '') {
                    window[funcName](funcParam);
                }
                else {
                    window[funcName]();
                }
            },
            hide: function () {
                $eDoc.modal.hide();
            }
        },
        progress: {
            setCurrentValue: function (currentVal) {
                var total = $("#uof-progressbar").attr("aria-valuemax");
                if (currentVal > total) {
                    currentVal = total;
                }

                $("#uof-progressbar").attr("aria-valuenow", currentVal);
                $("#uof-progressbar").css("width", currentVal * 100 / total + "%");
                $("#eDocProgressText").text("(" + currentVal + "/" + total + ")");
            },
            setTotalValue: function (totalVal) {
                $("#uof-progressbar").attr("aria-valuemax", totalVal);
            },
            setStatusText: function (type, textStr) {
                $("#eDocStatus").text(textStr);

                if (type === 1) {
                    $("#eDocStatus").css("color", "red");
                }
            },
            setButton: function (buttonName, callbackName) {
                $("#eDocSubmit").text(buttonName);
                if (callbackName !== '') {
                    $("#uofModal .uof-modal-footer #first").attr("onclick", callbackName + "();");
                }
                else {
                    $("#uofModal .uof-modal-footer #first").attr("onclick", "$eDoc.modal.hide();");
                }
            },
            setProgressColor: function (color) {
                $('#uof-progressbar').css('background-color', color);
            },
            setProgressActive: function (isActive) {
                if (isActive === false) {
                    $('#uof-progress').removeClass('active');
                }
                else {
                    $('#uof-progress').addClass('active');
                }
            },
            setActionIcon: function (iconPath) {
                $('#eDocIcon').attr("src", iconPath);
            },
            show: function (sender) {
                $(window).resize(function () {
                    $eDoc.modal.resize();
                });

                var receiveHtml = '\
                <div style="position: relative;"> \
                    <img id="eDocIcon" src="" aria-hidden="true" style="color: #2185d0;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -10%);"> \
                </div> \
                <div id="uof-progress" class="uof-progress uof-progress-striped active"> \
                    <div id="uof-progressbar" class="uof-progress-bar uof-progress-bar-info" role="progressbar" \
                        aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%"> \
                        <span id="eDocProgressText"></span> \
                    </div> \
                </div> \
                <div style="position: relative;"> \
                    <span id="eDocStatus" style="position: absolute;top: 50%;left: 50%;transform: translate(-50%, -60%); color:gray;"></span> \
                </div>';

                var secondBtnHtml = '<button id="second" type="button" class="btn btn-default"><span id="eDocSecond"></span></button>';

                if (sender.isDialog) {
                    $("#ContentDIV").append($eDoc.modal.getContainerTemplateHtml());
                }
                else {
                    $("#MasterContent > div").append($eDoc.modal.getContainerTemplateHtml());
                }

                $("#uofModal .uof-modal-footer > button").attr("id", "first");

                $(".uof-modal-body").append(receiveHtml);
                $(".uof-modal-footer").append(secondBtnHtml);

                $("#uofModal").modal("show");

                $('#eDocIcon').attr("src", sender.initIconPath);

                $("#eDocTitle").text(sender.title);
                $("#eDocSubmit").text(sender.firstBtn);
                $("#eDocSecond").text(sender.secondBtn);
                $("#eDocProgressText").text("(" + sender.current + "/" + sender.total + ")");
                $("#uof-progressbar").css("width", sender.current * 100 / sender.total + "%");
                $("#uof-progressbar").attr("aria-valuemax", sender.total);
                $("#uof-progressbar").attr("aria-valuenow", sender.current);

                $("#eDocStatus").text(sender.handleText);

                $("#eDocClose").css("display", "none");

                $("#uofModal .uof-modal-footer #second").attr("onclick", "$eDoc.modal.hide();");
                $("#uofModal .uof-modal-footer #first").removeClass();
                $("#uofModal .uof-modal-footer #first").attr("class", "btn btn-default");
                $("#uofModal .uof-modal-footer #second").attr("class", "btn btn-primary");

                if (sender.callback !== undefined) {
                    $("#uofModal .uof-modal-footer #first").attr("onclick", sender.callback.name + "();");
                }
                else {
                    $("#uofModal .uof-modal-footer #first").attr("onclick", "$eDoc.modal.hide();");
                }

                $eDoc.modal.resize();
            },
            hide: function () {
                $eDoc.modal.hide();
            }
        },
        check: {
            setRegister: function (status) {
                if (status === true) {
                    $("#eDocRegisterIcon").removeAttr("class");
                    $("#eDocRegisterIcon").addClass("fa fa-check fa-2x");
                    $("#eDocRegisterIcon").css("color", "green");
                }
                else if (status === false) {
                    $("#eDocRegisterIcon").removeAttr("class");
                    $("#eDocRegisterIcon").addClass("fa fa-times fa-2x");
                    $("#eDocRegisterIcon").css("color", "red");
                }
                else if (status === 'none') {
                    $("#eDocRegisterIcon").removeAttr("class");
                    $("#eDocRegisterIcon").addClass("fa fa-times fa-2x");
                    $("#eDocRegisterIcon").css("color", "white");
                }
            },
            setUClient: function (status) {
                if (status === true) {
                    $("#eDocUClientIcon").removeAttr("class");
                    $("#eDocUClientIcon").addClass("fa fa-check fa-2x");
                    $("#eDocUClientIcon").css("color", "green");
                }
                else if (status === false) {
                    $("#eDocUClientIcon").removeAttr("class");
                    $("#eDocUClientIcon").addClass("fa fa-times fa-2x");
                    $("#eDocUClientIcon").css("color", "red");
                }
                else if (status === 'none') {
                    $("#eDocUClientIcon").removeAttr("class");
                    $("#eDocUClientIcon").addClass("fa fa-times fa-2x");
                    $("#eDocUClientIcon").css("color", "white");
                }
            },
            setLicense: function (status) {
                if (status === true) {
                    $("#eDocLicenseIcon").removeAttr("class");
                    $("#eDocLicenseIcon").addClass("fa fa-check fa-2x");
                    $("#eDocLicenseIcon").css("color", "green");
                }
                else if (status === false) {
                    $("#eDocLicenseIcon").removeAttr("class");
                    $("#eDocLicenseIcon").addClass("fa fa-times fa-2x");
                    $("#eDocLicenseIcon").css("color", "red");
                }
                else if (status === 'none') {
                    $("#eDocLicenseIcon").removeAttr("class");
                    $("#eDocLicenseIcon").addClass("fa fa-times fa-2x");
                    $("#eDocLicenseIcon").css("color", "white");
                }
            },
            setCardId: function (status) {
                if (status === true) {
                    $("#eDocCardIdIcon").removeAttr("class");
                    $("#eDocCardIdIcon").addClass("fa fa-check fa-2x");
                    $("#eDocCardIdIcon").css("color", "green");
                }
                else if (status === false) {
                    $("#eDocCardIdIcon").removeAttr("class");
                    $("#eDocCardIdIcon").addClass("fa fa-times fa-2x");
                    $("#eDocCardIdIcon").css("color", "red");
                }
                else if (status === 'none') {
                    $("#eDocCardIdIcon").removeAttr("class");
                    $("#eDocCardIdIcon").addClass("fa fa-times fa-2x");
                    $("#eDocCardIdIcon").css("color", "white");
                }
            },
            show: function (sender) {
                $(window).resize(function () {
                    $eDoc.modal.resize();
                });
                var checkHtml = '\
                <div style="display: inline-block; padding-left: 7em;"> \
                    <i id="eDocRegisterIcon" aria-hidden="true" style="width: 40px;"></i> \
                    <span id="eDocRegister" style="height: 32px;vertical-align: middle;display: inline-block;"></span> \
                </div> \
                <br> \
                <div style="width: 100%; display: inline-block; padding-left: 7em;"> \
                    <i id="eDocUClientIcon" aria-hidden="true" style="width: 40px;"></i> \
                    <span id="eDocUClient" style="height: 32px;vertical-align: middle;display: inline-block;"></span> \
                </div> \
                <br> \
                <div style="display: inline-block; padding-left: 7em;"> \
                    <i id="eDocLicenseIcon" aria-hidden="true" style="width: 40px;"></i> \
                    <span id="eDocLicense" style="height: 32px;vertical-align: middle;display: inline-block;"></span> \
                </div> \
                <br> \
                <div style="padding-left: 7em;"> \
                    <i id="eDocCardIdIcon" aria-hidden="true" style="width: 40px;"></i> \
                    <span id="eDocCardId" style="height: 32px;vertical-align: middle;display: inline-block;"></span> \
                </div>';

                if (sender.isDialog) {
                    $("#ContentDIV").append($eDoc.modal.getContainerTemplateHtml());
                }
                else {
                    $("#MasterContent > div").append($eDoc.modal.getContainerTemplateHtml());
                }

                $(".uof-modal-body").append(checkHtml);
                $("#uofModal").modal("show");
                
                $("#eDocTitle").text(sender.title);
                $("#eDocSubmit").text(sender.button);
                $("#eDocRegister").text(sender.register.text);
                $("#eDocUClient").text(sender.uClient.text);
                $("#eDocLicense").text(sender.license.text);
                $("#eDocCardId").text(sender.cardId.text);
                $("#eDocClose").attr("onclick", "$eDoc.modal.check.hide()");

                //fa fa-check fa-2x
                //fa fa-times fa-2x
                $eDoc.modal.check.setRegister(sender.register.status);
                $eDoc.modal.check.setUClient(sender.uClient.status);
                $eDoc.modal.check.setLicense(sender.license.status);
                $eDoc.modal.check.setCardId(sender.cardId.status);

                if (sender.callback !== undefined) {
                    $("#uofModal  .uof-modal-footer > button").attr("onclick", sender.callback.name + "('" + sender.callbackParam + "');");
                }
                else {
                    $("#uofModal  .uof-modal-footer > button").attr("onclick", "$eDoc.modal.check.hide();");
                }
                $eDoc.modal.resize();
            },
            hide: function () {
                $eDoc.modal.hide();
            }
        },
        login: {
            getPin: function () {
                return $("#eDocPin").val();
            },
            showError: function (show, msg) {
                if (show) { $("#eDocError").show(); $("#eDocError").val(msg);}
                else { $("#eDocError").hide();} 
            },
            show: function (sender) {

                $(window).resize(function () {
                    $eDoc.modal.resize();
                });

                var loginHtml = '\
                <div class="input-group"> \
                    <span class="input-group-addon"><img src="../../Common/Images/Edoc/icon_m242.png"></span> \
                    <input id="eDocUnitCode" type="text" class="form-control" style="pointer-events: none"> \
                </div> \
                <div class="input-group"> \
                    <span class="input-group-addon"><img src="../../Common/Images/Edoc/icon_m243.png"></span> \
                    <input id="eDocPin" type="password" class="form-control" placeholder="Pin"> \
                </div> \
                <div style="padding-top:20px;"> \
                    <input id="eDocError" type="text" style="display:none;" \
                           class="form-control uof-modal-errorMsg" readonly="readonly"> \
                </div>';
                if (sender.isDialog) {
                    $("#ContentDIV").append($eDoc.modal.getContainerTemplateHtml());
                }
                else {
                    $("#MasterContent > div").append($eDoc.modal.getContainerTemplateHtml());
                }
                $(".uof-modal-body").append(loginHtml);
                $("#eDocTitle").text(sender.title);
                $("#eDocSubmit").text(sender.button);
                $("#eDocUnitCode").val(sender.unitId);
                $("#eDocClose").attr("onclick", "$eDoc.modal.login.hide()");
               
                if (sender.callback.call !== undefined) {
                    $("#uofModal  .uof-modal-footer > button").attr("onclick", sender.callback.name + "($eDoc.modal.login.getPin());");
                }
                else {
                    $("#uofModal  .uof-modal-footer > button").attr("onclick", "$eDoc.modal.login.hide();");
                }

                $("#uofModal").modal("show");

                $eDoc.modal.resize();
            },
            hide: function () {
                $eDoc.modal.hide();
            }
        },
        message: {
            show: function (sender) {
                $(window).resize(function () {
                    $eDoc.modal.resize();
                });

                var messageHtml = '<span id="eDocMessage"></span>';

                if (sender.isDialog) {
                    $("#ContentDIV").append($eDoc.modal.getContainerTemplateHtml());
                }
                else {
                    $("#MasterContent > div").append($eDoc.modal.getContainerTemplateHtml());
                }
                $(".uof-modal-body").append(messageHtml);
                $("#eDocMessage").text(sender.message);
                $("#eDocTitle").text(sender.title);
                $(".uof-modal-footer").css('display', 'none');
                $("#eDocClose").css('display', 'none');
                $("#uofModal").modal("show");

                $eDoc.modal.resize();
            },
            hide: function () {
                $eDoc.modal.hide();
            }
        }
    },

    msgObj: {
        getCommonMsg: function () {
            var obj = {
                PIN_NULL: $("[ClientID='lblPinNull']").text(),
                WITHOUT_CARD_READER: $("[ClientID='lblNoCardReader']").text(),
                CARD_NOT_INSERT: $("[ClientID='lblNoInsert']").text(),
                PIN_ERROR_2: $("[ClientID='lblPinError2']").text(),
                PIN_ERROR_1: $("[ClientID='lblPinError1']").text(),
                CARD_LOCKED: $("[ClientID='lblLocked']").text(),
                CARD_ERROR: $("[ClientID='lblCardError']").text(),
                SMARTCARD_DRIVER_NOT_EXIST: $("[ClientID='lblNoDriver']").text(),
                ENGINE_BUSY: $("[ClientID='lblEngineBusy']").text(),
                WITHOUT_UOF_ARGUMENT: $("[ClientID='lblNoUofArg']").text(),
                WEB_SERVICE_ERROR: $("[ClientID='lblServiceError']").text(),
                ODA_SIGNIN_INVALID: $("[ClientID='lblODA']").text(),
                UNHANDLE_EXCEPTION: $("[ClientID='lblException']").text(),
                ARGUMENT_EMPTY: $("[ClientID='lblArgumentEmpty']").text(),
                PROCESS_TIMEOUT: $("[ClientID='lblProcessTimeout']").text(),
                WITHOUT_LICENSE: $("[ClientID='lblNoLicense']").text(),
                WEBAPI_ERROR: $("[ClientID='lblWebApiError']").text()
            }
            return obj;
        },
    },

    taskState: {
        FAIL: 'FAILED',
        RUN: 'RUNNING',
        COMPLETE: 'COMPLETED'
    }
};