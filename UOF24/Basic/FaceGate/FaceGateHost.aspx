<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FaceGateHost.aspx.cs" Inherits="Ede.Uof.Web.Basic.FaceGate.FaceGateHost" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>FaceGate Host</title>

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
            font-size: 5.0vw;
            border-radius: 1.0vw;
        }
        
    </style>

    <style>
        .meter {
            box-sizing: content-box;
            height: 10px; /* Can be anything */
            position: relative;
            margin: 0px 0 0px 0; /* Just for demo spacing */
            background: #555;
            border-radius: 25px;
            padding: 10px;
            box-shadow: inset 0 -1px 1px rgba(255, 255, 255, 0.3);
        }

        .meter > span {
            display: block;
            height: 100%;
            border-top-right-radius: 8px;
            border-bottom-right-radius: 8px;
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
            background-color: rgb(43, 194, 83);
            background-image: linear-gradient( center bottom, rgb(43, 194, 83) 37%, rgb(84, 240, 84) 69% );
            box-shadow: inset 0 2px 9px rgba(255, 255, 255, 0.3), inset 0 -2px 6px rgba(0, 0, 0, 0.4);
            position: relative;
            overflow: hidden;
        }

        .meter > span:after,
        .animate > span > span {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            background-image: linear-gradient( -45deg, rgba(255, 255, 255, 0.2) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.2) 50%, rgba(255, 255, 255, 0.2) 75%, transparent 75%, transparent );
            z-index: 1;
            background-size: 50px 50px;
            animation: move 2s linear infinite;
            border-top-right-radius: 8px;
            border-bottom-right-radius: 8px;
            border-top-left-radius: 20px;
            border-bottom-left-radius: 20px;
            overflow: hidden;
        }

        .animate > span:after {
            display: none;
        }

        @keyframes move {
            0% {
                background-position: 0 0;
            }

            100% {
                background-position: 50px 50px;
            }
        }

        .orange > span {
            background-image: linear-gradient(#f1a165, #f36d0a);
        }

        .red > span {
            background-image: linear-gradient(#f0a3a3, #f42323);
        }

        .nostripes > span > span,
        .nostripes > span::after {
            background-image: none;
        }
    </style>

    <script src="../../Common/javascript/jQuery/jquery.js"></script>    

    <script src="Scripts/app_helper.js"></script>
    <script src="Scripts/gdiHelper.js"></script>

    <script src="Facemesh/tfjs-core.js"></script>
    <script src="Facemesh/tfjs-converter.js"></script>
    <script src="Facemesh/tfjs-backend-webgl.js"></script>
    <script src="Facemesh/face_mesh.js"></script>    
    <script src="FacemeshExModel/FacemeshEx.js"></script>

</head>
<body>

    <canvas id="mainCanvas" width="400" height="400" style="position:fixed; left:0px; top:0px; border: 1px solid black; background-color: rgba(50,50,100, 0.3);"></canvas>
    
    <div id="tipDiv" style="position:fixed; top:40%; left: 0px; text-align:center; width:100%;">
        <div style="white-space:nowrap; text-align:center; font-size:5.0vw;">
            <asp:Label ID="txtDataLoadingLabel" runat="server" Text="資料載入中..." meta:resourcekey="txtDataLoadingLabelResource1"></asp:Label><img src="Images/WAITING.gif?_=001" style="width:5.0vw; " />
        </div>
    </div>

    <!-- Button Bar -->
    <div id="toolbarDiv" style="position:fixed; bottom: 1.5rem; width:100%; display:none;">
        <table align="center">
            <tr>
                <td style="width:1.0vw;">&nbsp;</td>
                <td>
                    <button class="normal_button" style="background-color:blue; color:white;" onclick="flipButton_Click();">                        
                        <asp:Label ID="txtFlipLabel" runat="server" Text="翻轉" meta:resourcekey="txtFlipLabelResource1"></asp:Label>
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

    <!-- 操作時間 Bar -->
    <div id="timeRemainDiv" style="position:fixed; top:0.0rem; left:0.0rem;width:100%; display:none;">        
        <div class="meter orange nostripes">
            <span id="timeRemainSpan" style="width: 0.0%"></span>
        </div>
        <label style="font-size: 5.0vw;">            
            <asp:Label ID="txtOperationTimeLabel" runat="server" Text="操作時間" meta:resourcekey="txtOperationTimeLabelResource1"></asp:Label>
        </label>
    </div>

    <!-- 狀態列 -->
    <div id="statusDiv" style="width: 100%; background-color: rgba(100,0,0,0.5); position: fixed; bottom: 1px; height: 1.5rem;">
        <label id="statusLabel" style="color: rgba(0,255,0,1.0); font-size: 1.0em; white-space: nowrap;">N/a</label>
    </div>  

    <!-- Resource Label -->
    <asp:Label ID="txtMoveNoseLabel" runat="server" Text="請移動鼻尖，對準黃色方框" Visible="False" meta:resourcekey="txtMoveNoseLabelResource1"></asp:Label>
    <asp:Label ID="txtRemoveMaskLabel" runat="server" Text="(須摘下口罩)" Visible="False" meta:resourcekey="txtRemoveMaskLabelResource1"></asp:Label>            


    <form id="form1" runat="server">
        <div>
        </div>
    </form>

    <!-- 主要邏輯 -->
    <script>
        var m_Perform_TickList = [];
        var m_Perform_FPS = 0;

        var m_IsFlip = true;
        var m_PostCanvas = null;

        var m_Model = null;

        var m_FaceTracker = null;

        function initialForm() {

            resizeWindow();
            window.onresize = resizeWindow;

            setStatus("Load model ...");

            // 載入 FACE-MESH 的 Model
            var modelTask = facemesh.load();
            modelTask.then(function (result) {
                m_Model = result;

                // "請移動鼻尖, 對準黃色方框.\n(須摘下口罩)"
                var centerMessage = '<%=txtMoveNoseLabel.Text%>' + '\n' + '<%=txtRemoveMaskLabel.Text %>';

                var apiUrl = "./FaceGateAPI.aspx";
                m_FaceTracker = new FaceTracker("mainCanvas", m_Model, apiUrl,
                    m_FaceTracker_Callback, m_FaceTracker_Failback, centerMessage);

                var showMesh = false;
                var verifyCount = 2;
                m_FaceTracker.start(showMesh, verifyCount);

                console.log("Load facemesh model done.");
                setStatus("Load model done, initial OK.");

                // 開始辨識人臉網格 (等 100ms)
                setTimeout(function () {
                    takeSnapshot();
                }, 100);

            }, function (error) {
                console.log("Load facemesh error ! " + error);
                setStatus("Load facemesh error ! " + error);
            });


            repaint();
        }
        $(document.body).ready(initialForm);



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

                // 開始取得攝影機畫面之後, 關閉提示, 並顯示總體進度
                if ($("#tipDiv").css("display") != "none") {
                    $("#tipDiv").css("display", "none");
                    $("#timeRemainDiv").css("display", "");
                    $("#toolbarDiv").css("display", "");
                }

                performTick();

                // 將 Image 存成 Canvas 格式, 保存下來
                m_PostCanvas = gdiHelper.copyCanvas(img, img.naturalWidth, img.naturalHeight, false);

                // 將 Canvas 送到 FaceTracker 執行評估
                if (m_FaceTracker != null)
                    m_FaceTracker.estimate(m_PostCanvas);

                setTimeout(function () {
                    takeSnapshot();
                }, 30);

            };
            img.src = dataUrl;
        }


        function m_FaceTracker_Callback(result) {

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
                    window.webkit.messageHandlers.cordova_iab.postMessage(JSON.stringify(inner_data));
                }
            })(dataObject);

            setTimeout(timeProc, 2000);

        }

        function m_FaceTracker_Failback(error) {

            //var str = "Face Identity failed !\n";
            //str += "error:" + error.code + "\n"
            //str += "message:" + error.message + "\n";            
            //str += "description:" + error.description;
            //alert(str);


            var dataObject = {
                command: "FACE_GATE_FAILED",
                error: error
            };

            // 停止 1000ms 再 failback, 讓最後畫面可以被看見
            var timeProc = (function (data) {
                var inner_data = data;
                return function () {
                    postObjectToCaller(inner_data);
                }
            })(dataObject);

            setTimeout(timeProc, 1000);
        }


        function repaint() {

            var mainCanvas = document.getElementById("mainCanvas");

            var g = mainCanvas.getContext("2d");

            g.clearRect(0, 0, mainCanvas.width, mainCanvas.height);

            // 直接畫出 APP Post 過來的內容
            if (m_PostCanvas != null) {
                gdiHelper.drawZoomImage(mainCanvas, 0, 0, mainCanvas.width, mainCanvas.height,
                    m_PostCanvas, m_PostCanvas.width, m_PostCanvas.height, true);
            }

            // 更新 FaceTracker
            if (m_FaceTracker != null)
                m_FaceTracker.repaint();


            //var str = "";
            //if (m_PostCanvas != null)
            //    str += "Source: " + m_PostCanvas.width + "X" + m_PostCanvas.height;
            //str += " FPS: " + m_Perform_FPS.toFixed(2)
            //str += ",SIZE:" + $(document.body).width() + "X" + $(document.body).height();
            //setStatus(str);

            if (true) {
                var str = "Frame Rate: " + m_Perform_FPS.toFixed(2) + " Frame/Sec";
                setStatus(str);
            }


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






        function resizeWindow() {
            var mainCanvas = document.getElementById("mainCanvas");
            mainCanvas.width = $(document.body).width();
            mainCanvas.height = $(document.body).height();
        }

        function setStatus(txt) {
            $("#statusLabel").text(txt);
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

    <!-- FaceTracker 用來執行面部追蹤與辨識的物件  -->
    <script>
        function FaceTracker(canvasId, faceModel, apiUrl, successCallback, failCallback, centerMessage) {
            this._canvasId = canvasId;
            this._canvas = document.getElementById(canvasId);
            this._faceModel = faceModel;
            this._apiUrl = apiUrl;
            this._successCallback = successCallback;
            this._failCallback = failCallback;
            this._centerMessage = centerMessage;

            this._enabled = false;
            this._showFaceMesh = false;
            this._verifyTimes = 0;
            this._trackList = [];
            this._startTick = null;

            this._performTickList = [];
            this._performFPS = 0;

            this._estimateCanvas = null;    // 評估中的畫面
            this._faceCanvas = null;        // 有結果後的評估畫面
            this._faceResult = null;        // 評估後的結果

            this._aimPosition = null;
        }

        FaceTracker.prototype.start = function (showFaceMesh, verifyTimes) {
            this._showFaceMesh = showFaceMesh;
            this._verifyTimes = verifyTimes;
            this._trackList = this._buildTrackList(verifyTimes);
            this._startTick = new Date().getTime();

            // 開始進行評估 Video
            this._enabled = true;
        }

        FaceTracker.prototype.stop = function () {
            this._enabled = false;
        }

        FaceTracker.prototype.getFPS = function () {
            return this._performFPS;
        }


        FaceTracker.prototype.repaint = function () {

            var g = this._canvas.getContext("2d");

            if (this._estimateCanvas == null)
                return;

            var baseWidth = this._getBaseWidth();

            //========== 處理追蹤辨識邏輯 ==========
            var aimRate = 0.0;  // 目標指向率 100% 時, 發出 API 辨識

            if (this._trackList.length > 0 && this._estimateCanvas != null && this._aimPosition != null) {

                // 取得鼻尖目前的 blockIndex
                var aimIndex = this._getBlockIndex(this._aimPosition.x, this._aimPosition.y);

                for (var i = 0; i < this._trackList.length; i++) {
                    var item = this._trackList[i];

                    // 如果尚未辨識的 Block, 鼻尖移出 block, 則時間重設
                    if (item.canvas == null) {
                        if (item.blockIndex != aimIndex)
                            item.startTick = null;
                    }


                    // 如果尚未辨識的 Block, 鼻尖在 block 中, 並且超過某個 threshold 值,
                    // 則判定 PASS FaceMesh, 開始送出辨識 API Task
                    if (item.canvas == null && item.blockIndex == aimIndex) {

                        if (item.startTick == null)
                            item.startTick = new Date().getTime();

                        var dt = new Date().getTime() - item.startTick;
                        if (dt <= 1500) {
                            aimRate = dt / 1500;
                        }

                        // 如果在正確的 Block 超過 PASS 時間 (儲存影像, 送出辨識要求, 重設開始時間)
                        if (dt >= 1500) {
                            item.canvas = gdiHelper.copyCanvas(this._estimateCanvas, this._estimateCanvas.width, this._estimateCanvas.height);

                            // 開始發出辨識 API
                            this._startVerifyTask(item);

                            // 重設開始時間
                            this._startTick = (new Date()).getTime();
                        }
                    }
                }

            }


            //========== 處理 Block 繪製 ==========
            var tempCanvas = this._estimateCanvas;

            // 如果需要繪製 FaceMesh
            if (this._showFaceMesh == true)
                tempCanvas = this._drawFaceResultToCanvas(this._estimateCanvas, this._faceResult);


            // 畫攝影機的畫面
            gdiHelper.drawZoomImage(this._canvas, 0, 0, this._canvas.width, this._canvas.height,
                tempCanvas, tempCanvas.width, tempCanvas.height, true);

            var fillStyle = "rgba(50,50,255,0.2)";  // 預設區塊顏色
            var blockWidth = this._canvas.width / 3;
            var blockHeight = this._canvas.height / 3;

            // 繪製九宮格
            for (var i = 0; i < 3; i++) {
                for (var j = 0; j < 3; j++) {
                    var x = j * blockWidth;
                    var y = i * blockHeight;
                    gdiHelper.fillRectangle(g, x, y, blockWidth, blockHeight, fillStyle, "rgba(0,0,100,0.5)");
                }
            }

            // 將送出辨認的畫面, 印在 Block 裏
            for (var i = 0; i < this._trackList.length; i++) {
                var item = this._trackList[i];
                var x = (item.blockIndex % 3) * blockWidth;
                var y = parseInt(item.blockIndex / 3, 10) * blockHeight;

                if (item.canvas == null)
                    continue;

                gdiHelper.drawZoomImage(this._canvas, x, y, blockWidth, blockHeight,
                    item.canvas, item.canvas.width, item.canvas.height);
            }

            // 繪製提示文字於畫面中央
            if (true) {
                var cx = this._canvas.width / 2;
                var cy = this._canvas.height / 2;
                var fontSize = this._getBaseWidth() * 0.05;
                var fillStyle = "white";
                var strokeStyle = "black";
                // Sample: 請移動鼻尖, 對準黃色方框.
                //         (需摘下口罩)
                //var text1 = "請移動鼻尖, 對準黃色方框.\n(須摘下口罩)";
                var text1 = this._centerMessage;
                var lines = text1.split('\n');

                for (var i = 0; i < lines.length; i++) {
                    var line = lines[i];
                    var offsetY = i * fontSize * 1.2;
                    gdiHelper.fillShadowText(g, line, cx, cy + offsetY, fontSize, fillStyle, strokeStyle, "center", "middle");
                }
            }




            // 繪製每一個 block 狀態
            for (var i = 0; i < this._trackList.length; i++) {

                var item = this._trackList[i];
                var x = (item.blockIndex % 3) * blockWidth;
                var y = parseInt(item.blockIndex / 3, 10) * blockHeight;
                var fillStyle = "rgba(50,50,255,0.2)";  // 預設區塊顏色
                var lineWidth = 8;

                // 如果 block 是處理中
                if (item.canvas != null)
                    fillStyle = "rgba(255, 255, 200, 0.5)";

                // 如果 block 已經處理完畢
                if (item.completedTick != null) {

                    var txt = item.error;
                    fillStyle = "rgba(255,0,0,0.5)";    // 失敗的顏色

                    if (item.result != null) {
                        fillStyle = "rgba(0,0,255, 0.5)";   // 成功的顏色

                        // Block 中央畫出, 辨識的人名
                        txt = item.result.FullName;
                    }

                    // 畫出成功或是失敗的文字
                    var cx = x + blockWidth / 2;
                    var cy = y + blockHeight / 2;
                    var fontSize = this._getBaseWidth() * 0.05;
                    gdiHelper.fillShadowText(g, txt, cx, cy, fontSize, "rgba(255,255,255,1.0)", "black", "center", "middle");
                }

                gdiHelper.fillRectangle(g, x, y, blockWidth, blockHeight, fillStyle);   // 設定 Track Block 狀態顏色


                // 繪製指定的 Block 外框
                g.lineJoin = "round";
                gdiHelper.drawRectangle(g, x, y, blockWidth, blockHeight, "yellow", lineWidth);
            }

            // 繪製鼻尖位置
            if (this._aimPosition != null) {
                var r = baseWidth * 0.03;
                gdiHelper.fillCircle(g, this._aimPosition.x, this._aimPosition.y, r, "rgba(255,255,255,0.5)", "rgba(0,0,0,0.8)", 3);

                // 繪出指向完成度
                if (aimRate > 0.1) {
                    var radius = baseWidth * 0.06;

                    g.save();
                    g.beginPath();
                    g.lineWidth = baseWidth * 0.02;
                    g.strokeStyle = "rgba(255, 200, 50, 0.7)";
                    g.arc(this._aimPosition.x, this._aimPosition.y, radius, 0, aimRate * 2 * Math.PI);
                    g.stroke();

                    g.restore();
                }
            }

            //========== 繪製時間 BAR ==========
            if (this._startTick != null) {
                var dt = new Date().getTime() - this._startTick;
                var p_rate = 1.0 - dt / 20000;
                if (p_rate <= 0)
                    p_rate = 0;
                var str = (p_rate * 100).toFixed(3) + "%";

                $("#timeRemainSpan").css("width", str);     // 更新倒數時間 BAR (此處不合物件導向, 須修正....)

                // 如果作業逾時                
                if (p_rate <= 0 && this._enabled == true) {
                    this._enabled = false;  // 停止運作

                    // call failback
                    this._failCallback({
                        code: "OPERATION_TIMEOUT",
                        message: "Operation timeout"
                    });
                }
            }


        }





        FaceTracker.prototype.estimate = function (canvas) {

            // Check 是否繼續評估
            if (this._enabled == false)
                return;

            // 評估 Canvas
            this._estimateCanvas = canvas;  // 備份評估中的 Canvas

            var callback = (function (sender) {
                var that = sender;
                return function (result) {
                    that._estimateCallback(result);
                }
            })(this);

            var failback = (function (sender) {
                var that = sender;
                return function (err) {
                    that._estimateFailback(err);
                };
            })(this);


            var task = this._faceModel.estimateFaces(canvas);
            task.then(callback, failback);
        }


        FaceTracker.prototype._estimateCallback = function (result) {

            this._performTick(); // 計算 FPS

            // 有結果才能保存, 避免閃爍
            if (result != null && result.length > 0) {
                this._faceCanvas = this._estimateCanvas;    // 保存評估畫面
                this._faceResult = result;        // 保存評估結果



                // 取得鼻尖轉換到螢幕的座標
                var np = this._getNosePosition();
                if (this._aimPosition == null)
                    this._aimPosition = np;

                // 慣性處理
                if (np != null && this._aimPosition != null) {
                    var dx = np.x - this._aimPosition.x;
                    var dy = np.y - this._aimPosition.y;
                    var dr = Math.sqrt(dx * dx + dy * dy);
                    // threshold 螢幕的 10% (避免抖動太嚴重)
                    var threshold = this._getBaseWidth() * 0.10;
                    var rate = 1.0;
                    if (dr < threshold) {
                        rate = dr / threshold;
                    }

                    this._aimPosition.x = this._aimPosition.x + dx * rate;
                    this._aimPosition.y = this._aimPosition.y + dy * rate;
                }

            }
        }

        FaceTracker.prototype._estimateFailback = function (err) {
            console.log("face estimateFaces() failed ! " + err);
        }



        FaceTracker.prototype._drawFaceResultToCanvas = function (sourceCanvas, result) {
            if (sourceCanvas == null || result == null || result.length <= 0) {
                return sourceCanvas;
            }

            var tempCanvas = gdiHelper.copyCanvas(sourceCanvas, sourceCanvas.width, sourceCanvas.height);

            var g = tempCanvas.getContext("2d");


            var mesh = result[0].scaledMesh;

            // 畫出 FACE 多邊形 (在圖片上面)
            var lineList = FACEMESH_TESSELATION;

            g.strokeStyle = "rgba(255,255,255,0.07)";
            for (var i = 0; i < lineList.length / 3; i++) {
                var pIndex = i * 3 + 0;

                // 取出三角形的三個點
                var triHash = {};
                for (var j = 0; j < 3; j++) {
                    triHash[lineList[pIndex + j][0]] = 1;
                    triHash[lineList[pIndex + j][1]] = 1;
                }

                g.beginPath();
                var tp = null;
                for (var key in triHash) {
                    if (tp == null) {
                        tp = mesh[key];
                        g.moveTo(tp[0], tp[1]);
                    } else {
                        tp = mesh[key];
                        g.lineTo(tp[0], tp[1]);
                    }
                }

                g.closePath();
                g.stroke();
            }

            return tempCanvas;
        }

        FaceTracker.prototype._getBaseWidth = function () {
            // 取螢幕尺寸短邊當作基準
            var w = this._canvas.width;
            if (w > this._canvas.height)
                w = this._canvas.height;
            return w;
        }

        // 建立新的 Block 追蹤清單
        FaceTracker.prototype._buildTrackList = function (count) {

            // { blockIndex: 0, canvas: null, result: null, error: null, startTick: null, completedTick: null}
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
                    var o = { blockIndex: blockIndex, canvas: null, result: null, error: null, startTick: null, completedTick: null }
                    list.push(o);
                }
            }

            return list;
        }


        // 從辨識結果取得鼻尖位置
        FaceTracker.prototype._getNosePosition = function () {

            if (this._faceResult == null || this._faceResult.length <= 0)
                return { x: 0, y: 0 };

            var mesh = this._faceResult[0].scaledMesh;

            // 兩頰之間 (Base 點)
            var pL = mesh[323];
            var pR = mesh[93];
            var len = Math.sqrt((pL[0] - pR[0]) * (pL[0] - pR[0]) + (pL[1] - pR[1]) * (pL[1] - pR[1]));     // 計算兩頰長度

            var p0 = [
                (pL[0] + pR[0]) / 2,
                (pL[1] + pR[1]) / 2,
            ];
            var p1 = mesh[1];       // 鼻尖

            var dx = (p1[0] - p0[0]) / len;
            var dy = (p1[1] - p0[1]) / len;

            var mainCanvas = this._canvas;

            var cx = mainCanvas.width / 2;
            var cy = mainCanvas.height / 2;
            var x = cx + (dx / 0.25) * (mainCanvas.width / 2);
            var y = cy + (dy / 0.25) * (mainCanvas.height / 2);

            if (x < 0) x = 0;
            if (x > mainCanvas.width) x = mainCanvas.width;
            if (y < 0) y = 0;
            if (y > mainCanvas.height) y = mainCanvas.height;

            var o = { x: x, y: y };

            return o;
        }

        FaceTracker.prototype._getBlockIndex = function (x, y) {
            var mainCanvas = this._canvas;

            // 取得鼻尖目前的 blockIndex
            var blockWidth = mainCanvas.width / 3;
            var blockHeight = mainCanvas.height / 3;
            var bx = parseInt(x / blockWidth, 10);
            var by = parseInt(y / blockHeight, 10);
            if (bx >= 3) bx = 2;
            if (by >= 3) by = 2;
            var index = by * 3 + bx;

            return index;
        }


        // 發出人臉辨識要求
        FaceTracker.prototype._startVerifyTask = function (item) {

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

            // Ex:
            //     FaceGateApi.aspx
            var url = this._apiUrl;

            // timeout 設定 15 秒
            var args = {
                url: url,
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

        FaceTracker.prototype._verifyTaskCallback = function (item, result) {

            item.completedTick = new Date().getTime();

            // 如果處理 API 失敗
            if (result != null && result.ResultType == "ERROR") {

                item.error = result.ReturnMessage;
                console.log("[FaceTracker] _verifyTaskCallback() : ResultType=ERROR !");
                console.log(result);

                alert(JSON.stringify(result));

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


            }

            // 如果 API 成功
            if (result != null && result.ResultType == "SUCCESS") {

                var returnValue = result.ReturnValue;

                // 如果分數太低
                if (returnValue.Score != null && returnValue.FullName != null && returnValue.Score < returnValue.TargetScore) {
                    item.error = "低分:" + returnValue.Score.toFixed(3) + "(" + returnValue.FullName + ")";
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
                }
            }
            // 檢查是否有一個失敗
            var isFail = false;
            for (var i = 0; i < this._trackList.length; i++) {
                if (this._trackList[i].completedTick != null && this._trackList[i].result == null)
                    isFail = true;
            }

            // 如果失敗
            if (isFail == true) {
                console.log("FaceTracker failed !")

                if (typeof (this._failCallback) == "function") {
                    var err = {
                        code: "VERIFY_FAILED",
                        message: "Face verify failed",
                        description: ""
                    };
                    this._failCallback(err);
                }

                this._enabled = false;      //  停止運作
                return;
            }


            // 檢查所有 Block 是否完成
            var isCompleted = true;
            for (var i = 0; i < this._trackList.length; i++) {
                if (this._trackList[i].completedTick == null)
                    isCompleted = false;
            }

            // 如果還沒有全部完成
            if (isCompleted == false) {
                console.log("Verify image done, blockIndex:" + item.blockIndex);
                return;
            }

            // 檢查完成的 FullName 是否 Match
            var isMatch = true;
            var matchName = "";

            for (var i = 0; i < this._trackList.length; i++) {

                if (matchName == '')
                    matchName = this._trackList[i].result.FullName;

                if (matchName != this._trackList[i].result.FullName)
                    isMatch = false;
            }

            if (isMatch == true) {
                console.log("Verify success, FullName:" + matchName);

                // 成功
                if (typeof (this._successCallback) == "function") {
                    this._successCallback(item.result);
                    this._enabled = false;      //  停止運作
                }
            } else {
                // 如果名稱不一致, 驗證失敗
                if (typeof (this._failCallback) == "function") {
                    item.error = "Face not match !";
                    var err = {
                        code: "NOT_MATCH",
                        message: "Face was not match",
                        description: ""
                    };
                    this._failCallback(err);
                }

                this._enabled = false;      //  停止運作
            }

            console.log("Verify image done. blockIndex:" + item.blockIndex);
            console.log(result);
        }

        FaceTracker.prototype._verifyTaskFailback = function (item, xhr, status, error) {

            // 檢查是否有一個失敗
            var isFail = false;
            for (var i = 0; i < this._trackList.length; i++) {
                if (this._trackList[i].completedTick != null && this._trackList[i].result == null)
                    isFail = true;
            }

            // 如果已經有 item 失敗, 則忽略這個失敗
            if (isFail == true)
                return;


            item.completedTick = new Date().getTime();
            item.error = "ERR:" + status;

            console.log("Verify image failed, blockIndex: " + item.blockIndex);
            console.log("STATUS: " + status);
            console.log("ERROR: " + error);

            if (typeof (this._failCallback) == "function") {
                var err = {
                    code: "UNKNOW",
                    message: "Unknow Error",
                    description: ""
                };

                if (status == "timeout") {
                    err.code = "API_TIMEOUT";
                    err.message = "Call api timeout";
                    err.description = "";
                } else {
                    err.code = "OTHER_ERROR";
                    err.message = "Other error: " + status + " " + error;
                    if (typeof (xhr.responseText) != "undefined" && xhr.responseText != null)
                        err.description = xhr.responseText;
                }

                this._failCallback(err);
            }

            this._enabled = false;      //  停止運作
        }


        FaceTracker.prototype._performTick = function () {
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
