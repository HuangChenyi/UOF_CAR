<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FaceGateHost2.aspx.cs" Inherits="Ede.Uof.Web.Basic.FaceGate.FaceGateHost2" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes" />
    <meta name="google" content="notranslate" />
    <title>FaceSelfie Host</title>   

    <script>
        window.onerror = function (errorMessage, scriptURI, lineNumber, columnNumber, errorObj) {
            var str = "Error: " + errorMessage + "\n";
            str += "URI: " + scriptURI + "\n";
            str += "Line:" + lineNumber + "\n";
            str += "Column:" + columnNumber + "\n";
            str += "Detail:" + errorObj;
            alert(str);
        }
    </script>


    <style>
        .noselect {
            -webkit-touch-callout: none; /* iOS Safari */
            -webkit-user-select: none; /* Safari */
            -khtml-user-select: none; /* Konqueror HTML */
            -moz-user-select: none; /* Firefox */
            -ms-user-select: none; /* Internet Explorer/Edge */
            user-select: none; /* Non-prefixed version, currently supported by Chrome and Opera */
        }
        
        .normal_button {
            margin: 1.0vw;
            font-size: 4.0vw;
            border-radius: 1.0vw;
        }
        
    </style>

    <script src="../../Common/javascript/jQuery/jquery.js"></script>    

    <script src="Scripts/app_helper.js"></script>
    <script src="Scripts/gdiHelper.js?_=20220830001"></script>
</head>
<body>
    <canvas id="mainCanvas" width="400" height="400" style="position:fixed; left:0px; top:0px; border: 1px solid black; background-color: rgba(50,50,100, 0.3);"></canvas>

    <!-- Button Bar -->
    <div id="toolbarDiv" style="position:fixed; bottom: 1.5rem; width:100%;">
        <table>
            <tr>
                <td style="width:1.0vw;">&nbsp;</td>
                <td>
                    <button class="normal_button" style="background-color:blue; color:white;" onclick="flipButton_Click();">                        
                        <asp:Label ID="txtFlipLabel" runat="server" Text="翻轉" meta:resourcekey="txtFlipLabelResource1" ></asp:Label>
                    </button>
                </td>           
                <td style="width:2.0vw;">&nbsp;</td>
                <td>
                    <button class="normal_button" style="background-color:white; color:black;" onclick="cancelButton_Click();">
                        <asp:Label ID="txtCancelLabel" runat="server" Text="取消" meta:resourcekey="txtCancelLabelResource1"></asp:Label>
                    </button>                    
                </td>                           
            </tr>
        </table>
    </div>    
    
    <div id="statusDiv" style="width: 100%; background-color: rgba(100,0,0,0.5); position: fixed; bottom: 1px; height: 1.5em; overflow: hidden;display:none;">
        <label id="statusLabel" style="color: rgba(0,255,0,1.0); font-size: 1.0em; white-space: nowrap;">N/a</label>
    </div>  

    <asp:Label ID="txtRemoveMaskLabel1" runat="server" Text="請摘下口罩" Visible="False" meta:resourcekey="txtRemoveMaskLabel1Resource1" ></asp:Label>            
    <asp:Label ID="txtRemoveMaskLabel2" runat="server" Text="對準畫面正中間" Visible="False" meta:resourcekey="txtRemoveMaskLabel2Resource1" ></asp:Label>            


    <form id="form1" runat="server">
        <div>
        </div>
    </form>



    
    <script>
        var m_Perform_TickList = [];
        var m_Perform_FPS = 0;

        var m_IsFlip = true;
        var m_PostCanvas = null;
        
        var m_FaceSelfie = null;

        function initialForm() {

            resizeWindow();
            window.onresize = resizeWindow;


            // 初始化自拍物件
            m_FaceSelfie = new FaceSelfie("mainCanvas", m_FaceSelfie_Callback, m_FaceSelfie_Failback);

            // 開始取得攝影機影像
            setTimeout(function () {
                takeSnapshot();
            }, 100);

            // 開始繪圖
            repaint();

            //setStatus("Initial done.");
        }
        $(document.body).ready(initialForm);

        function resizeWindow() {
            var mainCanvas = document.getElementById("mainCanvas");
            mainCanvas.width = window.innerWidth;
            mainCanvas.height = window.innerHeight;
        }


        function setStatus(txt) {
            $("#statusDiv").css("display", "");     // 如果有訊息, 則顯示狀態列
            $("#statusLabel").text(txt);
        }


        function flipButton_Click() {

            m_IsFlip = !m_IsFlip;

            //setStatus("FLIP: " + m_IsFlip);
        }


        function cancelButton_Click() {
            var dataObject = {
                command: "CANCEL"
            };
            
            postObjectToCaller(dataObject);

            setStatus("SEND Command [CANCEL] done.");
        }




        function takeSnapshot() {

            var dataObject = {
                command: "CAMERA_TAKE_SNAPSHOT",
                isFlip: m_IsFlip,
                callbackName: "onCameraSnapshot"
            };

            postObjectToCaller(dataObject);
        }





        function onCameraSnapshot(dataUrl) {


            var img = document.createElement("IMG");
            img.onload = function () {

                if (m_FaceSelfie._enabled == false) {
                    m_FaceSelfie.start();
                }


                performTick();      // 計算效能

                // 將相機原始 Image 存成 Canvas 格式, 保存下來
                m_PostCanvas = gdiHelper.copyCanvas(img, img.naturalWidth, img.naturalHeight, false);

                // 將 Canvas 送到 FaceSelfie 執行評估
                if (m_FaceSelfie != null)
                    m_FaceSelfie.estimate(m_PostCanvas);

                // 繼續呼叫軟體包, 以取得攝影機影像
                setTimeout(function () {
                    takeSnapshot();
                }, 30);

            };
            img.src = dataUrl;
        }

        function m_FaceSelfie_Callback(result) {

            var returnResult = {
                fullName: result.FullName,
                employeeNo: result.EmployeeNo,
                cardNo: result.CardNo,
                departmentId: result.DepartmentId,
                departmentName: result.DepartmentName
            };

            var dataObject = {
                command: "FACE_GATE_SUCCESS",
                result: returnResult
            };

            // 停止 2000ms 再 callback, 讓最後畫面可以被看見
            var timeProc = (function (data) {
                var inner_data = data;
                return function () {
                    postObjectToCaller(inner_data);                    
                }
            })(dataObject);

            setTimeout(timeProc, 2000);

        }

        function m_FaceSelfie_Failback(error) {

            //var str = "Face Identity failed !\n";
            //str += "error:" + error.code + "\n"
            //str += "message:" + error.message + "\n";            
            //str += "description:" + error.description + "\n";
            //str += "terminal:" + error.terminal;
            //alert(str);

            // 如果是必須中止流程的錯誤, 則不自動關閉視窗
            if (error.terminal == true) {
                //var str = "Face Identity error !\n";
                //str += "error:" + error.code + "\n"
                //str += "message:" + error.message + "\n";            
                //str += "description:" + error.description;                
                //alert(str);
                setStatus("ERR:" + error.message + "(" + error.code + ") " + error.description);
                return;
            }

            var dataObject = {
                command: "FACE_GATE_FAILED",
                error: error
            };

            // 停止 2000ms 再 failback, 讓最後畫面可以被看見
            var timeProc = (function (data) {
                var inner_data = data;
                return function () {
                    postObjectToCaller(inner_data);                    
                }
            })(dataObject);

            setTimeout(timeProc, 2000);
        }



        function repaint() {

            var mainCanvas = document.getElementById("mainCanvas");

            var g = mainCanvas.getContext("2d");

            g.clearRect(0, 0, mainCanvas.width, mainCanvas.height);

            //// 直接畫出 APP Post 過來的內容
            //if (m_PostCanvas != null) {
            //    gdiHelper.drawZoomImage(mainCanvas, 0, 0, mainCanvas.width, mainCanvas.height,
            //        m_PostCanvas, m_PostCanvas.width, m_PostCanvas.height, true);
            //}

            // 更新 FaceSelfie (由 FaceSelfie 繪製攝影機的畫面)
            if (m_FaceSelfie != null)
                m_FaceSelfie.repaint();


            //var str = "";
            //if (m_PostCanvas != null)
            //    str += "Source: " + m_PostCanvas.width + "X" + m_PostCanvas.height;
            //str += " FPS: " + m_Perform_FPS.toFixed(2)
            //str += ",SIZE:" + $(document.body).width() + "X" + $(document.body).height();
            //setStatus(str);

            //if (true) {
            //    var str = "Frame Rate: " + m_Perform_FPS.toFixed(2) + " Frame/Sec";
            //    setStatus(str);
            //}


            appHelper.requestAnimationFrame(repaint);
        }



        function performTick() {
            var o = {
                tick: new Date().getTime()
            };

            m_Perform_TickList.push(o);

            // 計算 FPS
            var fps = 0;
            if (m_Perform_TickList.length >= 2) {
                var t0 = m_Perform_TickList[0].tick;
                var tn = m_Perform_TickList[m_Perform_TickList.length - 1].tick;
                var dt = tn - t0;
                fps = (m_Perform_TickList.length - 1) / dt * 1000;
            }
            m_Perform_FPS = fps;

            // 清除超過 3 秒的 tick
            var index = 0;
            while (index < m_Perform_TickList.length) {
                var tick = m_Perform_TickList[index].tick;
                var dt = (new Date()).getTime() - tick;
                if (dt > 3000) {
                    m_Perform_TickList.splice(index, 1);
                    continue;
                }
                index++;
            }
        }


        function postObjectToCaller(dataObject) {

            // 如果 window.webkit 還沒有 ready 則使用 timeout 等待之
            if (typeof (window.webkit) == "undefined" || window.webkit == null) {
                console.log("window.webkit is empty, wait for ready.");
                var cb = (function (data) {
                    var inner_dataObject = data;
                    return function () {
                        postObjectToCaller(inner_dataObject);
                    }
                })(dataObject);

                setTimeout(cb, 1000);
                return;
            }

            // 一般情況的呼叫
            window.webkit.messageHandlers.cordova_iab.postMessage(JSON.stringify(dataObject));
        }

    </script>




    <!-- FaceSelfie 用來執行自拍與辨識的物件  -->
    <script>
        function FaceSelfie(canvasId, successCallback, failCallback) {
            this._canvasId = canvasId;
            this._canvas = document.getElementById(canvasId);
            this._successCallback = successCallback;
            this._failCallback = failCallback;

            this._enabled = false;      // 被設定成 true, 代表已經開始運行 (為 true 之後, 其值不會再變成 false)
            this._trackList = [];
            this._startTick = null;     // 倒數計時的計時器
            this._completed = false;    // 被設定 true, 代表比對已經結束 (為 true 之後其值不會再變成 false)

            this._performTickList = [];
            this._performFPS = 0;

            this._estimateCanvas = null;    // 評估中的畫面                                    
        }

        FaceSelfie.prototype.start = function () {
            this._trackList = this._buildTrackList(1);
            this._startTick = new Date().getTime();

            // 開始進行評估 Video
            this._enabled = true;
        }

        FaceSelfie.prototype.stop = function () {
            //this._enabled = false;        // 不能重新開始
        }


        FaceSelfie.prototype.estimate = function (canvas) {

            // Check 是否繼續評估
            if (this._enabled == false)
                return;

            // 儲存評估用的 Canvas, 用來 Render 或者辨識
            this._estimateCanvas = canvas;
        }



        FaceSelfie.prototype.getFPS = function () {
            return this._performFPS;
        }


        FaceSelfie.prototype.repaint = function () {

            var g = this._canvas.getContext("2d");

            if (this._estimateCanvas == null)
                return;

            var baseWidth = this._getBaseWidth();

            var cx = this._canvas.width / 2;
            var cy = this._canvas.height / 2;

            //========== 處理追蹤辨識邏輯 ==========


            // 超過 3.0 秒,  則送攝影機畫面執行人臉辨識
            if (this._trackList.length > 0 && this._estimateCanvas != null && this._startTick != null) {

                var dt = ((new Date()).getTime() - this._startTick) / 1000;

                if (dt > 3.0) {
                    // 清除倒數計時器, 以停止倒數
                    this._startTick = null;

                    // 紀錄當時的畫面, 用來做辨識
                    var item = this._trackList[0];
                    item.canvas = gdiHelper.copyCanvas(this._estimateCanvas, this._estimateCanvas.width, this._estimateCanvas.height);
                 
                    // 開始發出辨識 API
                    this._startVerifyTask(item);                    
                }
            }


            //========== 處理 Block 繪製 ==========
            var tempCanvas = this._estimateCanvas;


            // 畫攝影機的畫面 (如果還沒有送出影像去做臉孔辨識, 才需要畫出攝影機即時畫面)
            if (this._trackList.length > 0 && this._trackList[0].canvas == null) {
                gdiHelper.drawZoomImage(this._canvas, 0, 0, this._canvas.width, this._canvas.height,
                    tempCanvas, tempCanvas.width, tempCanvas.height, true);
            }


            // 如果已經開始, 尚未結束, 繪製 3 2 1           
            if (this._startTick != null) {

                var dt = ((new Date()).getTime() - this._startTick) / 1000;

                // 如果等待拍照中
                if (dt < 3.0) {

                    // 繪製 3, 2, 1
                    var fontSize = this._getBaseWidth() * 0.25;
                    var fillStyle = "rgba(255,255,255, 0.6)";
                    var strokeStyle = "rgba(0,0,0, 1.0)";

                    var str = Math.floor(4 - dt);
                    gdiHelper.fillShadowText(g, str, cx, cy, fontSize, fillStyle, strokeStyle, "center", "middle");

                    // 畫倒數計時圈圈
                    var theta = (3 - dt) / 3 * 2 * Math.PI;

                    var dTheta = theta;
                    var start_theta = (270 * Math.PI / 180);
                    var end_theta = start_theta + (-dTheta);

                    var radius = baseWidth * 0.20;
                    g.save();
                    g.beginPath();
                    g.lineWidth = baseWidth * 0.05;
                    g.strokeStyle = "rgba(255, 255, 255, 0.7)";
                    g.arc(cx, cy, radius, start_theta, end_theta, true);
                    g.stroke();

                    g.restore();
                }
            }


            var fillStyle = "rgba(50,50,255,0.2)";  // 預設區塊顏色
            var blockWidth = this._canvas.width / 3;
            var blockHeight = this._canvas.height / 3;

            // 繪製井字線
            for (var i = 0; i < 3; i++) {
                for (var j = 0; j < 3; j++) {
                    var x = j * blockWidth;
                    var y = i * blockHeight;
                    var lineWidth = 2;
                    gdiHelper.drawRectangle(g, x, y, blockWidth, blockHeight, "rgba(50,50,50,0.3)", lineWidth);
                }
            }

            // 繪製提示文字於畫面中央
            if (true) {
                var fontSize = this._getBaseWidth() * 0.05;
                var fillStyle = "white";
                var strokeStyle = "black";

                var baseY = cy + baseWidth * 0.27;

                var text1 = '<%=txtRemoveMaskLabel1.Text%>';      // 直接使用 Label 文字
                var text2 = '<%=txtRemoveMaskLabel2.Text%>';      // 直接使用 Label 文字
                gdiHelper.fillShadowText(g, text1, cx, baseY, fontSize, fillStyle, strokeStyle, "center", "middle");
                gdiHelper.fillShadowText(g, text2, cx, baseY + 20, fontSize, fillStyle, strokeStyle, "center", "middle");
            }

            // 將送出辨認的畫面, 印在中央 (填滿畫面, 跟顯示的內容相同)
            if (this._trackList.length > 0) {
                var item = this._trackList[0];

                if (item.canvas != null) {
                    var w = this._canvas.width;
                    var h = this._canvas.height;
                    gdiHelper.drawZoomImage(this._canvas, 0, 0, w, h,
                        item.canvas, item.canvas.width, item.canvas.height, true);
                }
            }


            // 繪製已經送出的 block 狀態
            if (this._trackList.length > 0) {

                var item = this._trackList[0];
                var x = 0;
                var y = 0;
                var fillStyle = "rgba(50,50,255,0.2)";  // 預設區塊顏色
                var lineWidth = 8;


                // 如果 block 是處理中
                if (item.canvas != null)
                    fillStyle = "rgba(255, 255, 200, 0.5)";

                // 如果 block 已經處理完畢
                if (item.completedTick != null) {

                    //var txt = item.error;
                    var txt = "airaFace connect failed !";

                    // 如果只是低分, 則顯示原先的訊息
                    if (item.terminalTick == null)
                        txt = item.error;

                    fillStyle = "rgba(255,0,0,0.5)";    // 失敗的顏色

                    if (item.result != null) {
                        fillStyle = "rgba(0,0,255, 0.5)";   // 成功的顏色

                        // Block 中央畫出, 辨識的人名
                        txt = item.result.FullName;
                        txt += "\r\n(" + (item.result.Score * 100).toFixed(1) + "%)";
                    }

                    // 畫出成功或是失敗的文字
                    var cx = this._canvas.width / 2;
                    var cy = this._canvas.height / 2;
                    var fontSize = this._getBaseWidth() * 0.06;
                    gdiHelper.fillShadowText(g, txt, cx, cy, fontSize, "rgba(255,255,255,1.0)", "black", "center", "middle");
                }

                gdiHelper.fillRectangle(g, x, y, this._canvas.width, this._canvas.height, fillStyle);   // 設定 Track Block 狀態顏色


                // 繪製指定的 Block 外框
                g.lineJoin = "round";
                gdiHelper.drawRectangle(g, x, y, this._canvas.width, this._canvas.height, "yellow", lineWidth);
            }

        }




        FaceSelfie.prototype._getBaseWidth = function () {
            // 取螢幕尺寸短邊當作基準
            var w = this._canvas.width;
            if (w > this._canvas.height)
                w = this._canvas.height;
            return w;
        }

        // 建立新的 Block 追蹤清單
        FaceSelfie.prototype._buildTrackList = function (count) {

            //一次辨識的資料
            //{ 
            //    blockIndex: 0, 
            //    canvas: null, 
            //    result: null, 
            //    error: null,             
            //    startTick: null, 
            //    completedTick: null,
            //    terminalTick: null
            //}            
            // 成功 : result 非 null
            // 失敗 : error 非 null
            // terminalTick 被設定時, 代表發生嚴重錯誤, 必須要中止程序, 停住畫面, 讓使用者截圖

            var list = [];
            while (list.length < count) {
                var blockIndex = Math.floor(Math.random() * 9);     // 0 ~ 9
                var found = false;
                for (var i = 0; i < list.length; i++) {
                    if (blockIndex == list[i].blockIndex)
                        found = true;
                }

                // 如果沒有重複, 則建立 item
                if (found == false) {
                    var o = {
                        blockIndex: blockIndex,
                        canvas: null,
                        result: null,
                        error: null,
                        startTick: null,
                        completedTick: null,
                        terminalTick: null
                    }
                    list.push(o);
                }
            }

            return list;
        }


        // 發出人臉辨識要求
        FaceSelfie.prototype._startVerifyTask = function (item) {

            // 將 canvas 轉成 base64  (最大的邊長為 480, 以最佳化辨識的傳輸大小, 與伺服器的負擔)
            var sourceCanvas = item.canvas;
            var canvas = document.createElement("CANVAS");
            var newWidth = 480;
            var newHeight = sourceCanvas.height * (480 / sourceCanvas.width);
            if (newHeight > 480) {
                newHeight = 480;
                newWidth = sourceCanvas.width * (480 / sourceCanvas.height);
            }

            canvas.width = newWidth;
            canvas.height = newHeight;
            var g = canvas.getContext("2d");
            g.drawImage(sourceCanvas, 0, 0, newWidth, newHeight);


            // 準備參數
            var b64 = canvas.toDataURL("image/jpeg", 0.5);
            var image = b64.split(';base64,')[1];

            var data = {
                method: "verifyImage",
                image: image
            };

            // result
            //{
            //  "TargetScrore": 0.85,
            //  "Score": 0.991398,
            //  "VerifyFaceId": "6254d528a0d3c10b3b94a2e5",
            //  "PersonId": "62427e0e59acc80ae6339af7",
            //  "FullName": "sinhom",
            //  "EmployeeNo": "E006",
            //  "EmailAddress": "sinhom@edetw.com",
            //  "CardNo": "CARD006",
            //  "DepartmentId": "hVOlFctT4E",
            //  "DepartmentName": "研發處"
            //}

            var callback = (function (sender, item) {
                var that = sender;
                var inner_item = item;
                return function (result) {
                    that._verifyTaskCallback(inner_item, result);
                }
            })(this, item);

            var failback = (function (sender, item) {
                var that = sender;
                var inner_item = item;
                return function (xhr, status, error) {                   
                    that._verifyTaskFailback(inner_item, xhr, status, error);
                }
            })(this, item);

            // timeout 設定 15 秒
            var args = {
                url: "./FaceGateAPI.aspx",
                type: "POST",
                timeout: 15000,
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(data),
                crossDomain: true,
                success: callback,
                error: failback
            };

            $.ajax(args);

            console.log("Verify image ...");
        }

        FaceSelfie.prototype._verifyTaskCallback = function (item, result) {

            item.completedTick = new Date().getTime();  // 標示為已完成
            
            var isFail = true;

            // 如果處理 API 失敗
            if (result != null && result.ResultType == "ERROR") {

                // 設定錯誤訊息
                item.error = result.ReturnMessage;
                console.log("[FaceSelfie] _verifyTaskCallback() : ResultType=ERROR !");
                console.log(result);

                // 可能有 { message: "Not found" }, { message: "License Expired." } 的錯誤訊息
                if (result.ReturnValue != null) {
                    item.error = result.ReturnValue;

                    try {
                        var jo = JSON.parse(result.ReturnValue);
                        if (jo["message"] != null) {
                            item.error = jo["message"];
                        }
                    } catch (e) { }
                }

                item.terminalTick = new Date().getTime();   // 設定發生必須終止流程的時間

                isFail = true;
            }


            // 如果 API 成功
            if (result != null && result.ResultType == "SUCCESS") {

                var returnValue = result.ReturnValue;

                // 如果分數太低
                if (returnValue.Score != null && returnValue.FullName != null && returnValue.Score < returnValue.TargetScore) {
                    item.error = "Failed: " + (returnValue.Score * 100).toFixed(1) + "%";
                }

                // 如果呼叫 API 錯誤
                if (returnValue.Score != null && returnValue.Score == 0) {
                    item.error = returnValue;

                    // 可能有 { message: "Not found" }, { message: "License Expired." } 的錯誤訊息
                    try {
                        var jo = JSON.parse(returnValue);
                        if (jo["message"] != null) {
                            item.error = jo["message"];
                        }
                    } catch (e) { }
                }

                // 合法的驗證通過狀態, 儲存 returnValue
                if (returnValue.Score > 0 && returnValue.Score > returnValue.TargetScore && returnValue.FullName != null) {
                    item.result = result.ReturnValue;

                    isFail = false;
                }                                
            }

            if (isFail == true) {
                // 如果驗證失敗
                console.log("FaceSelfie failed !")
                var desc = "";
                if (item.error != null) {
                    desc = item.error;
                }

                if (typeof (this._failCallback) == "function") {
                    var err = {
                        code: "VERIFY_FAILED",
                        message: "Face verify failed",
                        description: desc,
                        terminal: false
                    };

                    // 如果必須中止流程
                    if (item.terminalTick != null)
                        err.terminal = true;

                    this._failCallback(err);
                }
            } else {

                // 如果驗證成功
                if (typeof (this._successCallback) == "function") {
                    this._successCallback(item.result);
                }
            }


            this._completed = true; // 圖片辨識已完成

            console.log("Verify image done. ");
            console.log(result);
        }

        FaceSelfie.prototype._verifyTaskFailback = function (item, xhr, status, error) {

            item.completedTick = new Date().getTime();
            item.error = "ERR:" + status + "(" + error + ")";

            console.log("Verify image failed, blockIndex: " + item.blockIndex);
            console.log("STATUS: " + status);
            console.log("ERROR: " + error);
                                    
            if (typeof (this._failCallback) == "function") {
                
                var err = {
                    code: "UNKNOW",
                    message: "Unknow Error",
                    description: "",
                    terminal: true
                };
                // ps. 在此 method 中, 都必須停止流程

                if (status == "timeout") {
                    err.code = "API_TIMEOUT";
                    err.message = "Call API timeout";
                    err.description = "";
                } else {
                    err.code = "OTHER_ERROR";
                    err.message = "Other error: " + status + " " + error;
                    if (typeof (xhr.status) != "undefined") {
                        err.message += "\nstatus: " + xhr.status;
                    }

                    // 如果找不到 API
                    if (error == "Not Found") {
                        err.code = "NOT_FOUND";
                        err.message = "API not found !";
                    }
                    
                    if (typeof (xhr.responseText) != "undefined" && xhr.responseText != null)
                        err.description = xhr.responseText;

                    // 設定 Item Error
                    item.error = "ERR:" + err.message + "\n(" + err.code + ")";
                }
                                
                this._failCallback(err);
            }

            this._completed = true; // 圖片辨識已完成 (API 呼叫失敗)
        }


        FaceSelfie.prototype._performTick = function () {
            var o = {
                tick: new Date().getTime()
            };

            this._performTickList.push(o);

            // 計算 FPS
            var fps = 0;
            if (this._performTickList.length >= 2) {
                var t0 = this._performTickList[0].tick;
                var tn = this._performTickList[this._performTickList.length - 1].tick;
                var dt = tn - t0;
                fps = (this._performTickList.length - 1) / dt * 1000;
            }
            this._performFPS = fps;

            // 清除超過 3 秒的 tick
            var index = 0;
            while (index < this._performTickList.length) {
                var tick = this._performTickList[index].tick;
                var dt = (new Date()).getTime() - tick;
                if (dt > 3000) {
                    this._performTickList.splice(index, 1);
                    continue;
                }
                index++;
            }
        }


    </script>



</body>
</html>
