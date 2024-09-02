// FaceGateHelper (For Mobile Package)
//     save at /assets/scripts/
// usage :
//     var url = "https://demo.uof.tw/demo"
//     var accessToken = "123456";
//     var cb = function(result) {
//         var o = { employeeNo: "EMP001", fullName: "JOHN", cardNo: "C001", departmentId: "DEP001", departmentName: "RD" };
//         o = result;
//         alert(JSON.stringify(o));
//     };
//     var fb = function(error) {
//         var e = { code: "API_TIMEOUT", message: "Call api timeout",  description: ""};
//         e = error;
//         alert(JSON.stringify(e));
//         // code: "USER_ABORT", message: "使用者取消"
//         // code: "OPERATION_TIMEOUT", message: "操作逾時"
//         // code: "VERIFY_FAILED", message: "驗證失敗"
//         // code: "API_TIMEOUT ", message: "API 呼叫逾時"
//         // code: "OTHER_ERROR", message: "其他錯誤"
//     }
//     var runType = "ONCE";       // "ONCE", "NINE_BLOCK" (預設值 ONCE)
//
//     mcore.helper.FaceGateHelper.startVerify(url, accessToken, cb, fb, runType);
//

var mcore = mcore || {};
mcore.helper = mcore.helper || {};

// Camera 控制物件
mcore.helper.CameraHelper = {
    start: null,
    _startCallback: null,
    _startFailback: null
};


// 啟動攝影機
mcore.helper.CameraHelper.start = function (width, height, callback, failback) {
    // 刪除舊的 video
    var video = document.getElementById("__CAMERA_HELPER_VIDEO");
    if (video != null)
        video.remove();

    // 建立 video
    video = document.createElement("video");
    video.setAttribute("id", "__CAMERA_HELPER_VIDEO");
    video.style.display = "none";
    video.width = 400;
    video.height = 400;
    document.body.append(video);

    // 閉包 callback function
    var onVideoSuccess = (function (cb) {
        var inner_cb = cb;
        return function (stream) {
            var v = document.getElementById("__CAMERA_HELPER_VIDEO");
            v.srcObject = null;
            v.srcObject = stream;
            v.setAttribute("playsinline", true); // required to tell iOS safari we don't want fullscreen
            v.play();

            inner_cb(cb);
        }
    })(callback);

    var onVideoFail = (function (fb) {
        var inner_fb = fb;
        return function (error) {
            var err = {
                code: "", message: "", description: ""
            };

            // 編碼錯誤訊息
            switch (error.name) {
                case "AbortError": err.code = "CAMERA_ABORT_ERROR"; err.message = "Camera can not use."; break;
                case "NotAllowedError": err.code = "CAMERA_NOT_ALLOWED"; err.message = "Not allowed to user camera"; break;
                case "NotFoundError": err.code = "CAMERA_NOT_FOUND"; err.message = "Camera not found"; break;
                case "NotReadableError": err.code = "CAMERA_NOT_READABLE"; err.message = "Camera not readable"; break;
                case "OverconstrainedError": err.code = "CAMERA_PARAMETER_ERROR"; err.message = "Start camera with incorrect parameter"; break;
                case "SecurityError": error.code = "CAMERA_SECURITY_ERROR"; err.message = "Security Error"; break;
                case "TypeError": err.code = "CAMERA_PARAMETER_TYPE_ERROR"; err.message = "Parameter type error"; break;
                default:
                    err.code = "CAMERA_UNKNOW_ERROR"; err.message = error.name + " " + error.message + " " + error; break;
                    break;
            }

            inner_fb(err);
        }
    })(failback);

    if (width <= 0 && height <= 0)
        width = 480;

    // 強迫指定前鏡頭(自拍)    
    var option = {
        audio: false,
        video: {
            facingMode: "user"
        }
    };
    if (width > 0) option.video.width = { ideal: width };
    if (height > 0) option.video.height = { ideal: height };


    // 啟動攝影機
    if (device.platform !== "iOS") {
        // if Android (Not iOS)      
        navigator.getUserMedia(option, onVideoSuccess, onVideoFail);
    } else {
        // if iOS        
        var promise = navigator.mediaDevices.getUserMedia(option);
        promise.then(onVideoSuccess).catch(onVideoFail);
    }
}

// 關閉攝影機
mcore.helper.CameraHelper.stop = function () {

    var video = document.getElementById("__CAMERA_HELPER_VIDEO");

    // 關閉播放中的 video    
    if (video != null && video.srcObject != null) {
        var stream = video.srcObject;
        if (stream != null) {
            stream.getTracks().forEach(function (track) {
                track.stop();
            });
        }

    }

    // 刪除舊的 video
    if (video != null)
        video.remove();
}

// 取得攝影機的 Video (需要在呼叫 start 之後, 否則回取得 null)
mcore.helper.CameraHelper.getVideo = function () {
    var video = document.getElementById("__CAMERA_HELPER_VIDEO");
    return video;
}

// 取得攝影機的即時畫面
mcore.helper.CameraHelper.getVideoCanvas = function (isFlip) {

    if (typeof (isFlip) != "boolean")
        isFlip = false;

    var video = mcore.helper.CameraHelper.getVideo();
    if (video == null || video.videoWidth <= 0)
        return null;

    var canvas = document.createElement("CANVAS");
    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;

    var g = canvas.getContext("2d");

    // 翻轉 Video 貼到 CANVAS    
    if (isFlip == true) {
        g.beginPath();
        g.translate(canvas.width, 0);       // 以右上為中心,向右翻轉畫布
        g.scale(-1, 1);
        g.drawImage(video, 0, 0);
        g.setTransform(1, 0, 0, 1, 0, 0);
        g.stroke();
    } else {
        g.beginPath();
        g.drawImage(video, 0, 0);
        g.stroke();
    }

    return canvas;
}




// FaceGateHelper 防偽面部辨識物件
mcore.helper.FaceGateHelper = {

    startVerify: null,

    _serverUrl: null,
    _accessToken: null,
    _callback: null,
    _failback: null,
    _runType: null,

    _startVerify_Callback: null,
    _inAppBrowser: null,
    _inAppBrowser_OnMessage: null,
    _inAppBrowser_OnExit: null,

    _result: null,
    _error: null
};


// 開始面部辨識
mcore.helper.FaceGateHelper.startVerify = function (serverUrl, accessToken, callback, failback, runType) {

    var helper = mcore.helper.FaceGateHelper;
    helper._serverUrl = serverUrl;
    helper._accessToken = accessToken;
    helper._callback = callback;
    helper._failback = failback;
    helper._runType = runType;

    helper._result = null;
    helper._error = null;

    var onVideoFail = (function (fb) {
        var inner_fb = fb;
        return function (error) {
            inner_fb(error);
        };
    })(failback);


    var width = 480;
    var height = 0;
    mcore.helper.CameraHelper.start(width, height, mcore.helper.FaceGateHelper._startVerify_Callback, onVideoFail);
}

// 攝影機啟動之後, 開啟 InAppBrowser 載入相關商業邏輯
mcore.helper.FaceGateHelper._startVerify_Callback = function (stream) {

    // 人臉辨識 runType 
    //     NINE_BLOCK => FaceGateHost.aspx
    //     ONCE => FaceGateHost2.aspx    

    var url = mcore.helper.FaceGateHelper._serverUrl + "/Basic/FaceGate/FaceGateHost2.aspx?_=" + new Date().getTime();
    //var url = "http://172.16.3.19/FaceWatcher/Tester/faceoffset_host.html?_=" + new Date().getTime();    
    //var url = "https://demo.edetw.com/FaceWatcher/Tester/faceoffset_host.html?_=" + new Date().getTime();

    // 如果使用九宮格
    if (mcore.helper.FaceGateHelper._runType == "NINE_BLOCK") {
        url = mcore.helper.FaceGateHelper._serverUrl + "/Basic/FaceGate/FaceGateHost.aspx?_=" + new Date().getTime();
    }
    
    // 需要從 accessToken 取得 Page 的登入憑證
    var proxyUrl = mcore.helper.FaceGateHelper._serverUrl + "/Login/BackendLoginRedirect.aspx?accessToken=" + escape(mcore.helper.FaceGateHelper._accessToken) + "&url=" + escape(url);
    
    mcore.helper.FaceGateHelper._inAppBrowser = cordova.InAppBrowser.open(proxyUrl, "_blank", "location=no");

    mcore.helper.FaceGateHelper._inAppBrowser.addEventListener("message", mcore.helper.FaceGateHelper._inAppBrowser_OnMessage);
    mcore.helper.FaceGateHelper._inAppBrowser.addEventListener('exit', mcore.helper.FaceGateHelper._inAppBrowser_OnExit);
}

mcore.helper.FaceGateHelper._inAppBrowser_OnMessage = function (event) {
    var data = {
        command: "CAMERA_TAKE_SNAPSHOT",
        isFlip: true,
        callbackName: "onCameraSnapshot"
    };

    data = event.data;

    // 如果 InAppBrowser 要求取得一張 Video 畫面
    if (data.command == "CAMERA_TAKE_SNAPSHOT") {
        var canvas = mcore.helper.CameraHelper.getVideoCanvas(data.isFlip);

        // 如果 video 為空, 則產生一個 1X1 的 Canvas
        if (canvas == null) {
            canvas = document.createElement("CANVAS");
            canvas.width = 1;
            canvas.height = 1;
        }

        // CANVAS 序列化成 JPEG 的 DataURL 字串
        var dataUrl = canvas.toDataURL("image/jpeg", 0.5);

        var s = "";
        s += data.callbackName + "('" + dataUrl + "');";

        mcore.helper.FaceGateHelper._inAppBrowser.executeScript({ code: s });
    }

    // 如果被 InAppBrowser 取消
    if (data.command == "CANCEL") {
        mcore.helper.FaceGateHelper._result = null;
        mcore.helper.FaceGateHelper._error = null;
        mcore.helper.FaceGateHelper._inAppBrowser.close();
    }

    // 如果驗證成功
    if (data.command == "FACE_GATE_SUCCESS") {
        mcore.helper.FaceGateHelper._inAppBrowser.close();

        //result: {
        //    fullName: "JOHN",
        //    employeeNo: "E0001",
        //    cardNo: "C0001",
        //    departmentId: "000001",
        //    departmentName: "R&D"
        //};

        var result = data.result;
        mcore.helper.FaceGateHelper._result = result;
        mcore.helper.FaceGateHelper._error = null;

        // 使用 Timeout 來做 callback, 以確保 InAppBrowser 被關閉才呼叫
        setTimeout(function () {
            mcore.helper.FaceGateHelper._callback(mcore.helper.FaceGateHelper._result);
        }, 200);
    }


    // 如果驗證失敗
    if (data.command == "FACE_GATE_FAILED") {
        mcore.helper.FaceGateHelper._inAppBrowser.close();

        //error: {
        //    code: "API_TIMEOUT",
        //    message: "Call api timeout",
        //    description: ""
        //};

        var error = data.error;
        mcore.helper.FaceGateHelper._error = error;

        // 使用 Timeout 來做 failback, 以確保 InAppBrowser 被關閉才呼叫
        setTimeout(function () {
            mcore.helper.FaceGateHelper._failback(mcore.helper.FaceGateHelper._error);
        }, 200);
    }



}

mcore.helper.FaceGateHelper._inAppBrowser_OnExit = function () {
    mcore.helper.CameraHelper.stop();

    if (mcore.helper.FaceGateHelper._result == null && mcore.helper.FaceGateHelper._error == null) {

        setTimeout(function () {
            var err = {
                code: "USER_ABORT",
                message: "User abort",
                description: ""
            }
            mcore.helper.FaceGateHelper._failback(err);
        }, 100);

    }

}








