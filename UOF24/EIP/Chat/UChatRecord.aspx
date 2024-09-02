<%@ Page Title="聊天室對話記錄" Language="C#" AutoEventWireup="true" CodeBehind="UChatRecord.aspx.cs" Inherits="Ede.Uof.Web.EIP.Chat.UChatRecord" meta:resourcekey="PageResource1" culture="auto" uiculture="auto" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <title></title>    
    <style type="text/css">        

        html, body {
            height: 100vh;
        }
     
        .circle_angle {
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }

        .other_content {
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            background-color: #E0E0E0;
            word-wrap: break-word;
            word-break: break-all;    
        }

        .self_content {
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            background-color: #bef18c;
            word-wrap: break-word;
            word-break: break-all;
        }

        .unselectable {
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        table {
            border-collapse:separate !important;
        }

    </style>   

    <script type="text/javascript" src="ChatForm.js?_20151216001"></script>
    <script type="text/javascript" src="BlockViewer.js?_20151216001"></script>    
    <script src="pagetool.js"></script>    
    <script src="../../Common/javascript/jQuery/jquery.js?v=19.50"></script>
    <link href="layout_320.css" rel="stylesheet" />    
</head>
<body>
    <form id="form1" runat="server">
         
    <!-- Page 變數 -->
    <script type="text/javascript">
        var m_ServerId = "<%=m_ServerId%>";
        var m_LinkId = "<%=m_LinkId%>";
        var m_UserGuid = "<%=m_UserGuid%>";
        var m_RoomId = "<%=m_RoomId%>";
        var m_RoomType = "<%=m_RoomType%>";
        var m_NotifyEnabled = "<%=m_NotifyEnabled%>";
        var m_PartnerUserGuid = "<%=m_PartnerUserGuid%>";
        var m_PartnerUserName = "<%=m_PartnerUserName%>";
        var m_EnterTime = "<%=m_EnterTime%>";
        var m_StartPointTime = "<%=m_PointTime%>";
        var m_PointTime = "<%=m_PointTime%>";
        var m_PointLogId = "<%=m_PointLogId%>";
        var m_EmoticonList = "<%=m_EmoticonList%>";
        var m_StickerList = "<%=m_StickerList%>";
        var m_ReadList = "<%=m_ReadList%>";
        var m_MainMenuItems = "<%=m_MainMenuItems%>";
        var m_LogId = "<%=m_LogId%>";
    </script>

    <div id="body_div">

    <!-- Title Bar -->
    
        
    <!-- 主選單 Main Menu -->    
        
    <!-- LOG 區 -->
    <div id="top_padding_div" class="normal_label">&nbsp;</div>  
      
    <div id="log_div" style="" ></div>        

    <div id="bottom_padding_div" class="normal_label">&nbsp;</div>
            

    <!-- 輸入區 -->
    
    <!-- Layout 寬度 -->
    <div id="width_50p_div" class="width_50p"></div>

    <!-- Screen Mask 遮罩 -->
    <div id="mask_div"></div>

    <!-- log render 成 block 的容器 -->
    <div id="log_render_div"></div>

</div>

<asp:Label ID="msg_SystemLogInvite" runat="server" Text="{{USER1}} 邀請 {{USER2}} 加入聊天室" Visible="False" meta:resourcekey="msg_SystemLogInviteResource1"></asp:Label>
<asp:Label ID="msg_SystemLogAccept" runat="server" Text="{{USER1}} 加入聊天室" Visible="False" meta:resourcekey="msg_SystemLogAcceptResource1"></asp:Label>
<asp:Label ID="msg_SystemLogReject" runat="server" Text="{{USER1}} 已取消 {{USER2}} 的邀請" Visible="False" meta:resourcekey="msg_SystemLogRejectResource1"></asp:Label>
<asp:Label ID="msg_SystemLogExit" runat="server" Text="{{USER1}} 已退出聊天室" Visible="False" meta:resourcekey="msg_SystemLogExitResource1"></asp:Label>
<asp:Label ID="msg_SystemKickout" runat="server" Text="{{USER1}} 已讓 {{USER2}} 退出聊天室" Visible="False" meta:resourcekey="msg_SystemKickoutResource1"></asp:Label>

<asp:Label ID="msg_DevolveUnknow" runat="server" Text="未確認" Visible="False" meta:resourcekey="msg_DevolveUnknowResource1"></asp:Label>
<asp:Label ID="msg_DevolveAccept" runat="server" Text="同意" Visible="False" meta:resourcekey="msg_DevolveAcceptResource1"></asp:Label>
<asp:Label ID="msg_DevolveReject" runat="server" Text="否決" Visible="False" meta:resourcekey="msg_DevolveRejectResource1"></asp:Label>

<asp:Label ID="msg_WeekSunday" runat="server" Text="日" Visible="False" meta:resourcekey="msg_WeekSundayResource1"></asp:Label>
<asp:Label ID="msg_WeekMonday" runat="server" Text="一" Visible="False" meta:resourcekey="msg_WeekMondayResource1"></asp:Label>
<asp:Label ID="msg_WeekTuesday" runat="server" Text="二" Visible="False" meta:resourcekey="msg_WeekTuesdayResource1"></asp:Label>
<asp:Label ID="msg_WeekWednesay" runat="server" Text="三" Visible="False" meta:resourcekey="msg_WeekWednesayResource1"></asp:Label>
<asp:Label ID="msg_WeekThursday" runat="server" Text="四" Visible="False" meta:resourcekey="msg_WeekThursdayResource1"></asp:Label>
<asp:Label ID="msg_WeekFriday" runat="server" Text="五" Visible="False" meta:resourcekey="msg_WeekFridayResource1"></asp:Label>
<asp:Label ID="msg_WeekSaturday" runat="server" Text="六" Visible="False" meta:resourcekey="msg_WeekSaturdayResource1"></asp:Label>

<asp:Label ID="msg_Read" runat="server" Text="已讀" Visible="False" meta:resourcekey="msg_ReadResource1"></asp:Label>
<asp:Label ID="msg_BelowUnread" runat="server" Text="以下為尚未閱讀訊息" Visible="False" meta:resourcekey="msg_BelowUnreadResource1"></asp:Label>
<asp:Label ID="msg_DevolveAssignTo" runat="server" Text="交辦給" Visible="False" meta:resourcekey="msg_DevolveAssignToResource1"></asp:Label>
<asp:Label ID="msg_DevolveStatus" runat="server" Text="狀態" Visible="False" meta:resourcekey="msg_DevolveStatusResource1"></asp:Label>


<script language="javascript" type="text/javascript">    
    //"M", "H", "P"
    var layout_type = "M";
    PT_ResizeAllImageByScreenType(layout_type);    // Resize All Image for ScreenType
</script>

<!-- ========== Page Script ========== -->        
<script language="javascript" type="text/javascript">

    // 處理 bookmark 的轉變 (頁面內的跳轉)
    $(window).on("hashchange", function () {
        var hash = location.hash.substring(1);
        if (hash == "") // 回到主頁, 關閉 PopupForm
            PT_ClosePopupForm();    // Back 回到主頁        
    });
       
    
    function title_popup_member() {
            
        //m_ChatLink.notifyLoad(10 * 60 * 1000);    // 通知 ChatLink , 此工作將要使用連線 (較長的脫離畫面操作, 要給久一點的時間, 10 分鐘)
        body_scroll_visible(false); // 關閉主畫面捲動        
                       
        var url = "MemberForm.aspx?ROOM_ID=" + m_RoomId;
        PT_PopupForm(url, "100%", "100%",
            function (args) {
        
                // 回傳 args 代表需要啟動一對一聊天
                if (typeof (args) != "undefined") {
                    // 轉頁到一對一聊天室
                    var chat_url = "ChatForm.aspx?PARTNER_USER_GUID=" + args;
                    location.href = chat_url;
                    return;
                }

                body_scroll_visible(true);
                //m_ChatLink.notifyResume();      // 通知 ChatLink 要立刻恢復連線                
            });

        // 轉頁到虛擬的 bookmark, 以便 back 可以關閉開啟的視窗
        var url = location.href;
        var s0 = url.lastIndexOf("#");
        if (s0 != -1)
            url = url.substr(0, s0);

        location.href = url + "#popupform";        
    }
    

    // 切換主頁面 scrollbar 開關, 用來確保捲軸唯一性
    var m_BodyScrollTop = -1;
    function body_scroll_visible(visible) {
        if (visible == true) {
            // 顯示 Log, 還原 scroll 位置
            
            $("#title_bar_div").css("display", "");
            $("#top_padding_div").css("display", "");
            $("#log_div").css("display", "");
            $("#bottom_padding_div").css("display", "");
            $("#input_div").css("display", "");
                        

            $("html,body").scrollTop(m_BodyScrollTop)
                        
            // 延遲啟動 scroll 偵測物件, 以免觸發 reload
            setTimeout(function () {
                m_ScrollHandler.topHitEnabled(true);
                m_ScrollHandler.bottomHitEnabled(true);
            }, 100);
        }
        else {
            // 關閉 scroll 偵測, 以免觸發 reload event
            m_ScrollHandler.topHitEnabled(false);
            m_ScrollHandler.bottomHitEnabled(false);
            
            // 隱藏 Log, 保存 Scroll 位置
            m_BodyScrollTop = $(window).scrollTop();
            
            $("#title_bar_div").css("display", "none");
            $("#top_padding_div").css("display", "none");
            $("#log_div").css("display", "none");
            $("#bottom_padding_div").css("display", "none");
            $("#input_div").css("display", "none");            
        }
    }
</script>


<!-- Page 初始化, 與事件處理的 Script -->
<script language="javascript" type="text/javascript">

    // Page Global 物件宣告
    var m_MainMenu = null;      // 主選單 (上方的 MainMenu)
    var m_DebugConsole = null;  // Debug Console
    //var m_ChatLink = null;      // 與 SignalR 通訊用的物件
    var m_BlockViewer = null;   // 顯示訊息與讀取訊息用的物件
    var m_ScrollHandler = null;     // 捲動偵測物件

    var m_EmoticonTab = null;       // 貼圖物件    
    var m_AttachUploader = null;    // 上傳檔案物件
    var m_ModulePopupMenu = null;   // 模組選單 (Devolve)
    var m_LogQueue = null;          // 發送訊息物件

    var m_HintBar = null;
    var m_ScreenMask = null;
    var m_AppSuspendDector = null;  // 休眠偵測

    function initial_form_nodelay() {
        //===== Page UI 邏輯初始化 =====
        if (m_RoomType != "Pair")
            $('#module_button').css("display", "none");  // 只有 PairRoom 才能顯示 Module Button (先執行以免有畫面殘留)
    }

    function initial_form() {        
        // 如果檢查失敗, 則不執行 Client 端初始化
        if (m_LinkId == '')
            return;
        
        //===== 初始化配置 =====        
        $('#top_padding_div').height($('#title_bar_div').height()); // 設定 Top 的 Padding 空間        
        $('#bottom_padding_div').height($('#input_div').height());  // 設定 Button 的 Padding 空間

        $(window).bind("scroll", body_scroll);        
        
        //===== 物件初始化 =====

        // 初始化 MainMenu 主選單
        //m_MainMenu_init();

        // 初始化 DebugConsole
        //m_DebugConsole_init();

        // 初始化捲動偵測        
        m_ScrollHandler_init();

        // 初始化 ChatLink
        //m_ChatLink_init();

        // 初始化 Block Viewer
        m_BlockViewer_init();

        // 初始化 HintBar 物件
        //m_HintBar_init();

        // 初始化 Log Queue        
        //m_LogQueue_init();

        // 初始化文字輸入
        //context_initial();

        // 初始化檔案上傳物件 
        //m_AttachUploader_init();

        // 設定表情符號位置        
        //m_EmoticonTab_init(); // 初始化

        // 初始化模組上傳選單
        //m_ModulePopupMenu_init();

        // 螢幕遮罩
        m_ScreenMask = new ScreenMask("mask_div");

      
        //===== 啟動 ChatLink =====
        //m_ChatLink.enable();
        //m_DebugConsole.log("ChatLink", "ChatLink enabled.");

        //m_ChatLink.notifyLoad(5 * 1000);    // 通知 ChatLink , 此工作將要使用連線 (保留 5 秒的初始化時間, 第一次可能比較久)

        //===== 初始化 LOG 資料 =====        
        m_ScreenMask.show("Initial ...", 1000);  // 使用 UI Mask

        // 載入 20 筆以上才有辦法產生捲軸效果
        m_BlockViewer.reload(50, m_LogId, function (unreadBlock) {
            console.log("Chat room initial done.");
            m_ScreenMask.hide();    // 解除 UI Mask
            
            // 設定捲動位置
            if (m_LogId == '') {
                // 初始化載入
                if (unreadBlock != null) {
                    // 如果有未讀的訊息 Block
                    var y = unreadBlock.position().top; // 計算 Block 的 Y 
                    y = y - $(window).height() / 2;     // 計算捲動到畫面中間的 Y 值
                    m_ScrollHandler.scrollTo(y);
                }
                else {
                    // 如果沒有未讀訊息, 則捲動到最下方
                    m_ScrollHandler.scrollToBottom(100);    // 捲動到最下方            
                }
            }
            else {
                // 中間點定位
                var middle_item = null;
                for (var i = 0 ; i < $('#log_div').children().length ; i++) {
                    var item = $('#log_div').children().eq(i);
                    if (m_LogId == item.data("log-id")) {
                        middle_item = item;                        
                        break;
                    }
                }

                if (middle_item == null)
                    return;

                // 捲動畫面中間到 LOG_ID 的位置
                var y = middle_item.position().top - $(window).height() / 2;
                m_ScrollHandler.scrollTo(y);                                
            }
        },
        function (xhr, ajaxOptions, thrownError) {
            alert("m_BlockViewer.reload() call failure, maybe logout, redirect to UChatForm.aspx\r\nResponseText:\r\n" + xhr.responseText);
            location.href = "UChatForm.aspx";
        });
    }

       


    $(document.body).ready(        
        function () {
            // 執行不 delay 的 init
            initial_form_nodelay();

            // delay 一下, 讓 layout 正常
            setTimeout(initial_form, 250);
        });

    function body_scroll() {

        // 移到最底端, 則隱藏 HintBar
        if (m_ScrollHandler.isBottom() == true) {
            //m_HintBar.hide();
        }
    }
</script>

<!-- ScrollHandler 初始化, 與事件處理的 Script -->
<script language="javascript" type="text/javascript">

    // ScrollHandler 初始化, 與事件處理
    function m_ScrollHandler_init() {

        m_ScrollHandler = new ScrollHandler({            
            topHit: m_ScrollHandler_topHit,

            // 碰觸 Bottom
            bottomHit: m_ScrollHandler_bottomHit
        });                
    }

    // 碰觸 Top 事件處理
    function m_ScrollHandler_topHit() {        
        m_ScreenMask.show("Loading...", 1000);  // 顯示 Mask
        //body_scroll_visible(false); // 關閉捲軸

        // 載入上方 20 筆
        m_BlockViewer.loadBeforeStart(20, true, function () {
            m_ScreenMask.hide();    // 隱藏 Mask
            //body_scroll_visible(true); // 打開捲軸            
        },
        function (xhr, ajaxOptions, thrownError) {
            alert("m_BlockViewer.loadBeforeStart() call failure, maybe logout, redirect to UChatForm.aspx\r\nResponseText:\r\n" + xhr.responseText);
            location.href = "UChatForm.aspx";
        });
    }

    // 碰觸 Bottom 事件處理
    function m_ScrollHandler_bottomHit() {        
        //m_ScrollHandler.bottomHitEnabled(false);    // 關閉 bottomHit, 以免連續觸發向下捲的事件                                                
        m_ScreenMask.show("Loading...", 1000);  // 顯示 Mask
        //body_scroll_visible(false); // 關閉捲軸                               

        // 載入下方 20 筆
        m_BlockViewer.loadAfterEnd(20, true, function () {
            //m_ScrollHandler.bottomHitEnabled(true);                    
            m_ScreenMask.hide();    // 隱藏 Mask
            //body_scroll_visible(true); // 打開捲軸

            //m_DebugConsole.log("ScrollHandler", "Bottom load done.");
        },
        function (xhr, ajaxOptions, thrownError) {
            alert("m_BlockViewer.loadAfterEnd() call failure, maybe logout, redirect to UChatForm.aspx\r\nResponseText:\r\n" + xhr.responseText);            
            location.href = "UChatForm.aspx";
        });
    }

</script>
      
<!-- BlockViewer 初始化, 與事件處理的 Script -->
<script language="javascript" type="text/javascript">
    function m_BlockViewer_init() {

        // 將讀取時間切割成 USER_GUID, ENTER_TIME, READ_TIME 對
        // 存入以下格式的 Array :
        //     {userGuid: [USER_GUID], enterTime: [ENTER_TIME], readTime: [READ_TIME]}
        var read_list = [];
        var items = m_ReadList.split(",");
        for (var i = 0 ; i < items.length / 3 ; i++) {
            var user_guid = items[i * 3 + 0];
            var enter_time = items[i * 3 + 1];
            var read_time = items[i * 3 + 2];
            read_list[user_guid] = { userGuid: user_guid, enterTime: enter_time, readTime: read_time };
        }

        // 設定 system log template
        var textSystemLogTemplate = {
            //Invite: "{{USER1}} 邀請 {{USER2}} 加入聊天室",
            //Accept: "{{USER1}} 加入聊天室",
            //Reject: "{{USER1}} 已取消 {{USER2}} 的邀請",
            //Exit: "{{USER1}} 已退出聊天室",
            //Kickout: "{{USER1}} 已讓 {{USER2}} 退出聊天室"
            Invite: "<%=msg_SystemLogInvite.Text%>",
            Accept: "<%=msg_SystemLogAccept.Text%>",
            Reject: "<%=msg_SystemLogReject.Text%>",
            Exit: "<%=msg_SystemLogExit.Text%>",
            Kickout: "<%=msg_SystemKickout.Text%>"
        };

        var textDevolveResult = {
            //Unknow: "未確認", Accept: "同意", Reject: "否決"
            Unknow: "<%=msg_DevolveUnknow.Text%>",
            Accept: "<%=msg_DevolveAccept.Text%>",
            Reject: "<%=msg_DevolveReject.Text%>"
        };

        // 初始化 BlockViewer
        var args = {
            userGuid: m_UserGuid,
            roomId: m_RoomId,
            containerId: "log_div",
            renderContainerId: "log_render_div",
            userGuid: m_UserGuid,
            bufferSize: 150,    // 最大 Buffer 量
            readList: read_list,
            imageRootPath: "../../Common/Images/UChat",

            // 多國語言
            //textWeekList: ["日", "一", "二", "三", "四", "五", "六"],
            textWeekList: ["<%=msg_WeekSunday.Text%>",
                "<%=msg_WeekMonday.Text%>","<%=msg_WeekTuesday.Text%>","<%=msg_WeekWednesay.Text%>",
                "<%=msg_WeekThursday.Text%>", "<%=msg_WeekFriday.Text%>", "<%=msg_WeekSaturday.Text%>"],
            //textRead: "已讀",
            textRead: "<%=msg_Read.Text%>",
            //textBelowUnread: "以下為尚未閱讀訊息",            
            textBelowUnread: "<%=msg_BelowUnread.Text%>",
            textSystemLogTemplate: textSystemLogTemplate,
            textDevolveResult: textDevolveResult,
            //textDevolveAssignTo: "交辦給",
            textDevolveAssignTo: "<%=msg_DevolveAssignTo.Text%>",
            //textDevolveStatus: "狀態",
            textDevolveStatus: "<%=msg_DevolveStatus.Text%>",

            // Block click event
            logFunc: m_BlockViewer_logFunc,
            photoClick: m_BlockViewer_photoClick,
            devolveClick: m_BlockViewer_devolveClick,
            fileImageClick: m_BlockViewer_fileImageClick,
            fileAudioClick: m_BlockViewer_fileAudioClick,
            fileVideoClick: m_BlockViewer_fileAudioClick,
            fileMiscClick: m_BlockViewer_fileMiscClick
        };
        
        m_BlockViewer = new BlockViewer(args);        
    }

    // 將 log 訊息轉向
    function m_BlockViewer_logFunc(msg) {
        
    }

    // 點擊 Photo Icon
    function m_BlockViewer_photoClick(user_guid) {
        
    }

    // 點擊交辦 Block
    function m_BlockViewer_devolveClick(logId) {       
        var url = "DevolveEditForm.aspx?mode=edit&LOG_ID=" + logId +  "&_=" + (new Date()).getTime();

        //m_ChatLink.notifyLoad(10 * 60 * 1000);    // 通知 ChatLink , 此工作將要使用連線 (較長的脫離畫面操作, 要給久一點的時間, 10 分鐘)

        PT_PopupForm(url, "100%", "100%", function () {
            body_scroll_visible(true);
            //m_ChatLink.notifyResume();  // 通知 ChatLink 應該要馬上恢復連線
        });  // 彈出視窗

        // 轉頁到虛擬的 bookmark, 以便 back 可以關閉開啟的視窗
        var url = location.href;
        var s0 = url.lastIndexOf("#");
        if (s0 != -1)
            url = url.substr(0, s0);

        location.href = url + "#popupform";

        body_scroll_visible(false);  // 關閉主視窗捲軸
    }

    // 點擊 Image Block
    function m_BlockViewer_fileImageClick(logId, fileId, previewFileId) {
        // 轉頁到顯示圖片的網頁
        //var url = "ImagePlayer.aspx?LOG_ID=" + logId + "&BackUrl=" + escape(location.href);
        //location.href = url;
    }

    // 點擊 File 的 Audio/Video Block
    function m_BlockViewer_fileAudioClick(logId, fileId) {

    }

    // 點擊其他 File Block
    function m_BlockViewer_fileMiscClick(logId, fileId, fileName) {

    }


</script>        

    </form>
</body>
</html>
