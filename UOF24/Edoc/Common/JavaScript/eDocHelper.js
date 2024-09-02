function EdocHelper() {
}

EdocHelper.callWebApiError = {};
EdocHelper.callWebApiError.WEBAPI_ERROR = "WEBAPI_ERROR";   // 呼叫 WebAPI 出現錯誤
EdocHelper.callWebApiError.ENGINE_BUSY = "ENGINE_BUSY"; // EdocAgent 正在執行工作, 忙碌中.
EdocHelper.callWebApiError.WITHOUT_UOF_ARGUMENT = "WITHOUT_UOF_ARGUMENT";   // 沒有 UOF 參數, 需要初始化
EdocHelper.callWebApiError.WITHOUT_CARD_INFO = "WITHOUT_CARD_INFO";         // 沒有卡片資訊, 需要使用者輸入
EdocHelper.callWebApiError.WEB_SERVICE_ERROR = "WEB_SERVICE_ERROR";         // 連線 UOF 失敗

// 卡片相關錯誤訊息
EdocHelper.callWebApiError.SMARTCARD_DRIVER_NOT_EXIST = "SMARTCARD_DRIVER_NOT_EXIST";   // SmartCard Driver 不存在(未安裝 Driver)
EdocHelper.callWebApiError.WITHOUT_CARD_READER = "WITHOUT_CARD_READER"; // 沒有讀卡機
EdocHelper.callWebApiError.CARD_NOT_INSERT = "CARD_NOT_INSERT"; // 卡片未插入
EdocHelper.callWebApiError.PIN_ERROR_2 = "PIN_ERROR_2"; // PIN 碼錯誤, 剩下 2 次機會
EdocHelper.callWebApiError.PIN_ERROR_1 = "PIN_ERROR_1"; // PIN 碼錯誤, 剩下 1 次機會
EdocHelper.callWebApiError.CARD_LOCKED = "CARD_LOCKED"; // 卡片已鎖定
EdocHelper.callWebApiError.CARD_ERROR = "CARD_ERROR";   // 卡片錯誤

EdocHelper.callWebApi = function (url, send_data, success_callback, error_callback) {
    EdocHelper._callWebApi(url, "GET", "application/json; charset=utf-8", send_data, success_callback, error_callback);
}

EdocHelper.postWebApi = function (url, send_data, success_callback, error_callback) {
    EdocHelper._callWebApi(url, "POST", "application/json; charset=utf-8", JSON.stringify(send_data), success_callback, error_callback);
}

EdocHelper._callWebApi = function (url, method, contentType, send_data, success_callback, error_callback) {

    var option = {
        url: url,
        type: method,
        contentType: contentType,
        data: send_data,
        cache: false,
        //timeout: 5000,
        success: function (response) {
            //debugger;
            var o = response;
            if (typeof (success_callback) != "undefined" && success_callback != null) {
                success_callback(o);
            }
        },
        error: function (xhr, ajaxOptions, thrownError) {
            var messageStr = "EdocHelper.callWebApi() error !\r\n";
            messageStr += "readyState: " + xhr.readyState + "\r\n";
            messageStr += "status: " + xhr.status + "\r\n";
            messageStr += "statusText: " + xhr.statusText + "\r\n";
            messageStr += "responseText:\r\n" + xhr.responseText;
            //debugger;
            if (typeof (error_callback) != "undefined" && error_callback != null) {

                // 建立返回值                                             
                var retObject = {
                    errorCode: "WEBAPI_ERROR",
                    message: messageStr,
                    content: xhr.responseText
                };

                // 如果 EdocAgent 可能沒有啟動的話
                if (xhr.readyState == "0" && xhr.status == "0") {
                    if (xhr.statusText == "timeout") {
                        retObject.errorCode = "AJAX_TIMEOUT";
                        retObject.message = "ajax timeout !";
                    } else {
                        retObject.message = "Check your EdocAgent launch or not !";
                    }
                }

                // 如果是商業邏輯錯誤
                if (xhr.status == "400") {
                    if (typeof (xhr.responseText) != "undefined" && xhr.responseText != "") {
                        var o = JSON.parse(xhr.responseText);
                        retObject.errorCode = o.errorCode;
                        retObject.message = o.message;
                        retObject.content = o.content;
                    }
                }

                try {
                    console.log(xhr.status);
                    error_callback(retObject);
                } catch (e) {
                    alert("EdocHelper.callWebApi() callback error !\r\nexception:" + e + "\r\noriginal error:" + messageStr);
                }
                return;
            }

            // 沒有 ErrorHandler 則直接顯示 alert
            alert(messageStr);
        }
    };

    $.ajax(option);
}