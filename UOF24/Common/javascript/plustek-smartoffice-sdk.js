
var PlustekScannerSdk = PlustekScannerSdk || {};
PlustekScannerSdk.IP = "127.0.0.1";                 // Scanner installed
PlustekScannerSdk.FileTransferServicePort = 17776;
PlustekScannerSdk.ScanServicePort = 17777;
PlustekScannerSdk.Protocol = "webfxscan";

// Command list
PlustekScannerSdk.GetDevicesListCommand = "GetDevicesList";
PlustekScannerSdk.GetPreviewCommand = "GetPreview";
PlustekScannerSdk.GetImageListCommand = "GetImageList";
PlustekScannerSdk.GetFileListCommand = "GetFileList";
PlustekScannerSdk.RmFilesCommand = "RmFiles";
PlustekScannerSdk.GetFileDataCommand = "GetFileData"; 
PlustekScannerSdk.GetOcrDataCommand = "GetOCRData";
PlustekScannerSdk.GetOcrRecognizedDataCommand = "GetRecognizeData";

// Resource string
PlustekScannerSdk.ResourceTemporarilyUnavailableText = "Error:Resource Temporarily Unavailable...";
PlustekScannerSdk.CannotConnectToServerText = "Error:Cannot Connect to Server, Event code:";
PlustekScannerSdk.ScannerNotFoundText = "Scanner Not Found";
PlustekScannerSdk.ConnectingText = "連接中";
PlustekScannerSdk.ScanningText = "正在掃描第";
PlustekScannerSdk.PageText = "頁";
PlustekScannerSdk.FileNotFoundText = "File not found";

// if true, means processing scan now
PlustekScannerSdk.Scanning = false;

// if true, means get file now
PlustekScannerSdk.Getting = false;

// detected scanner id
PlustekScannerSdk.ScannerId = "";



PlustekScannerSdk.Connecting = function (command, callbackFunc, requestStr) {
    if (PlustekScannerSdk.Scanning === true) {
        // if scanner working now, do not thing
        //alert(PlustekScannerSdk.ResourceTemporarilyUnavailableText); 
        return;
    }

    PlustekScannerSdk.Scanning = true;
    if (!requestStr) {
        requestStr = command;
    }


    var previewObj = new PreviewImg();
    var obj = new Object();
    var socket;

    try {
        var port = PlustekScannerSdk.ScanServicePort;
        socket = new WebSocket("ws://" + PlustekScannerSdk.IP + ":" + port + "/" + requestStr, PlustekScannerSdk.Protocol);

        if (command === PlustekScannerSdk.GetPreviewCommand) {
            socket.binaryType = "arraybuffer";
        }
        obj.command = command;

    } catch (e) {
        obj.ret = -1;
        obj.data = command + " : WebSocket error";
        obj.status = 0;
        callbackFunc(obj);
        PlustekScannerSdk.Scanning = false;
        return;
    }

    socket.onclose = function (event) {
        socket.close();
        PlustekScannerSdk.Scanning = false;
        
        if ((event.code != "1000") && (event.code != "1005")) {
            obj.ret = -1;
            obj.data = PlustekScannerSdk.CannotConnectToServerText + event.code;
            obj.status = 0;
            callbackFunc(obj);
        }
    };

    socket.onerror = function () {
        obj.ret = -1;
        obj.data = "error:Connection Errror";
        obj.status = 0;
        callbackFunc(obj);
        delete socket;
        PlustekScannerSdk.Scanning = false;
    };

    socket.onmessage = function (event) {
        switch (command) {
            case PlustekScannerSdk.GetDevicesListCommand:
                RecvDeviceList(obj, callbackFunc, event.data);
                PlustekScannerSdk.Scanning = false;
                break;


            case PlustekScannerSdk.GetImageListCommand:
                RecvImageList(obj, callbackFunc, event.data);
                PlustekScannerSdk.Scanning = false;
                break;


            case PlustekScannerSdk.GetOcrDataCommand:
                RecvImageList(obj, callbackFunc, event.data);
                PlustekScannerSdk.Scanning = false;
                break;


            case PlustekScannerSdk.GetFileListCommand:
                RecvFileList(obj, callbackFunc, event.data);
                PlustekScannerSdk.Scanning = false;
                break;


            case PlustekScannerSdk.RmFilesCommand:
                RecvRmFilesResult(obj, callbackFunc, event.data);
                PlustekScannerSdk.Scanning = false;
                break;
        }
    };
};


PlustekScannerSdk.ConnectingForGetFile = function (command, callbackFunc, requestStr) {
    if (PlustekScannerSdk.Getting === true) {
        return;
    }

    PlustekScannerSdk.Getting = true;
    if (!requestStr) {
        requestStr = command;
    }
    
    var obj = new Object();
    var socket;

    try {
        var port = PlustekScannerSdk.FileTransferServicePort;
        socket = new WebSocket("ws://" + PlustekScannerSdk.IP + ":" + port + "/" + requestStr, PlustekScannerSdk.Protocol);

        if (command === PlustekScannerSdk.GetFileDataCommand) {
            socket.binaryType = "arraybuffer";
        }

        obj.command = command;

    } catch (e) {
        obj.ret = -1;
        obj.data = command + " : WebSocket error";
        obj.status = 0;
        callbackFunc(obj);
        PlustekScannerSdk.Getting = false;
        return;
    }

    socket.onclose = function (event) {
        socket.close();
        PlustekScannerSdk.Getting = false;

        if ((event.code != "1000") && (event.code != "1005")) {
            obj.ret = -1;
            obj.data = PlustekScannerSdk.CannotConnectToServerText + event.code;
            obj.status = 0;
            callbackFunc(obj);
        }
    };

    socket.onmessage = function (event) {
        switch (command) {
            case PlustekScannerSdk.GetFileDataCommand:
                var jpegBase64Str;
                if (event.data instanceof ArrayBuffer) {
                    var bytes = new Uint8Array(event.data);
                    var previewObj = new PreviewImg();
                    jpegBase64Str = previewObj.Encode(bytes);
                } else {
                    if (event.data.toString() === "error:file not found") {
                        alert(PlustekScannerSdk.FileNotFoundText);
                    } else {
                        alert(event.data);
                    }
                }
                obj.data = jpegBase64Str;
                obj.ret = 0;
                PlustekScannerSdk.Getting = false;
                callbackFunc(obj);
                break;


            case PlustekScannerSdk.GetOcrRecognizedDataCommand:
                obj.data = event.data;
                obj.ret = 0;
                PlustekScannerSdk.Getting = false;
                callbackFunc(obj);
                break;

        }
    };

    socket.onerror = function () {
        obj.ret = -1;
        obj.data = "error:Connection Errror";
        obj.status = 0;
        callbackFunc(obj);
        delete socket;
        PlustekScannerSdk.Getting = false;
    };
}



function RecvImageList(obj, func, data) {

    var dataStr = data.toString();
    if (dataStr.startsWith("data:")) {              // recv data
        obj.ret = 0;
        obj.data = data.substring(5, data.length);
        func(obj);
        return;
    }

    if (dataStr.startsWith("status:")) {            // scanning , recv status
        var strData = data.split(",");
        obj.ret = 1;
        obj.status = strData[0];
        if (strData.length > 1) {
            //alert("obj.filename : " +strData[1]);
            obj.filename = strData[1];
        }
        else {
            delete obj.filename;
        }
        func(obj);
        return;
    }

    if (dataStr.startsWith("finish")) {
        //delete socket;
        PlustekScannerSdk.Scanning = false;
        return;
    }

    // recv error
    obj.ret = -1;
    obj.data = "發生Exception, 辨識失敗,  data: " + data;
    obj.status = 0;
    func(obj);
}


function RecvFileList(obj, func, data) {

    var dataStr = data.toString();
    if (dataStr.startsWith("data:")) {
        obj.ret = 0;
        var str = dataStr.substring(5, data.length).split(",");
        if (str[0] === 1) {
            obj.data = "";
            obj.data = str[1];
        }
        else {
            obj.data = obj.data + "," + str[1];
        }
        return;
    }

    if (dataStr.startsWith("finish")) {
        obj.ret = 0;
        func(obj);
        return;
    }

    // recv error
    obj.ret = -1;
    obj.data = data;
    func(obj);

}



function RecvRmFilesResult(obj, func, data) {

    var dataStr = data.toString();
    if (dataStr.startsWith("data:ok")) {
        obj.ret = 0;
        obj.data = "";
    } else {
        obj.ret = -1;
        obj.data = data;
    }
    func(obj);
}



function RecvDeviceList(obj, func, data) {
    // scanner not found
    if (data.toString().substring(0, 10) === "error:None") {
        obj.ret = -1;
        obj.data = PlustekScannerSdk.ScannerNotFoundText;
        obj.status = 0;
        func(obj);
        return;
    }

    // error
    if (data.substring(0, 5) === "error:") {
        obj.ret = -1;
        obj.data = data;
        obj.status = 0;
        func(obj);
        return;
    }

    var arr = data.split(",");
    for (var i = 0; i < arr.length; i++) {
        if (arr[i] !== "") {
            var str = arr[i].split(" ");
            PlustekScannerSdk.ScannerId = str[1];
            obj.ret = 0;
            obj.data = data;
            func(obj);
            break;
        }
    }
}







//=======================================================
//Preview Object
//=======================================================

PreviewImg = function () {
    this.format = "";
    this.JpegBase64StringArray = [];

    bin2txt = function (buffer) {
        return String.fromCharCode.apply(null, buffer);
    };

    this.CheckFormat = function (bytearray) {
        if (bin2txt(bytearray.subarray(0, 2)) === "P4") {
            this.format = "P4";
        }
        else if (bin2txt(bytearray.subarray(0, 2)) === "P5") {
            this.format = "P5";
        }
        else if (bin2txt(bytearray.subarray(0, 2)) === "P6") {
            this.format = "P6";
        }
        else {
            this.format = "jpeg";
        }
    };

    this.Encode = function (input) {
        var keyStr = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
        var output = "";
        var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
        var i = 0;

        while (i < input.length) {
            chr1 = input[i++];
            chr2 = i < input.length ? input[i++] : Number.NaN; // Not sure if the index 
            chr3 = i < input.length ? input[i++] : Number.NaN; // checks are needed here

            enc1 = chr1 >> 2;
            enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
            enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
            enc4 = chr3 & 63;

            if (isNaN(chr2)) {
                enc3 = enc4 = 64;
            } else if (isNaN(chr3)) {
                enc4 = 64;
            }
            output += keyStr.charAt(enc1) + keyStr.charAt(enc2) +
               keyStr.charAt(enc3) + keyStr.charAt(enc4);
        }
        return output;
    };
};