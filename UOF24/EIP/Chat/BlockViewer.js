

// BlockViewer BlockViewer 物件, 用來管理畫面上的 LOG (Block), 處理新增, 載入, 刪除等事宜
function BlockViewer(args) {

    // 參數格式 :
    // var args = {        
    //     containerId: "log_div",
    //     roomId: [ROOM_ID],        
    //     userGuid: [USER_GUID],
    //     bufferSize: [buffer size],
    //     readList: [USER_GUID + READ_LOG_TIME],
    //
    //     // 多國語言
    //     textRead: "已讀",   
    //     textBelowUnread: "以下尚未閱讀",
    //     textWeekList : ["日", "一", "二", "三", "四", "五", "六"],
    //     textSystemLogTemplate: {
    //         Invite: "{{USER1}} invited {{USER2}} to the chatroom",
    //         Accept: "{{USER1}} joined the chatroom",
    //         Reject: "{{USER1}} cancelled {{USER2}} invitation to the chatroom",
    //         Exit: "{{USER1}} left the chatroom",
    //         Kickout: "{{USER1}} deleted USER2 from the chatroom"
    //     },
    //     textDevolveResult : {
    //         Unknow: "未確認", Accept: "同意", Reject: "否決"
    //     },
    //     textDevolveAssignTo: "交辦給",
    //     textDevolveStatus: "狀態",
    //
    //     // 事件處理
    //     logFunc: function(msg) {},
    //     photoClick: function(userGuid) {},
    //     devolveClick: function(logId) {},
    //     fileImageClick: function(logId) {},
    //     fileAudioClick: function(logId, fileId) {},
    //     fileVideoClick: function(logId, fileId) {},
    //     fileMiscClick: function(logId, fileId, fileName) {}    
    // };

    // 定義參數        
    this._containerId = args.containerId;
    this._container = $('#' + this._containerId);
    this._renderContainerId = args.renderContainerId;
    this._renderContainer = $("#" + this._renderContainerId);
    this._roomId = args.roomId;
    this._userGuid = args.userGuid;
    this._bufferSize = args.bufferSize; // 用來指定畫面上最多可放的筆數, 避免 Mobile 記憶體耗盡(當載入超過此容量時, 就會開始刪除畫面資料)
    this._readList = args.readList;     // Room 裏成員的已讀指標

    
    this._imageRootPath = "../Images"; // 圖片的 Root 位置
    if (typeof (args.imageRootPath) != "undefined")
        this._imageRootPath = args.imageRootPath;

    this._logFunc = args.logFunc;   // 用來轉向 log 輸出用

    // Block 的 Click 事件
    this._photoClick = args.photoClick;
    this._devolveClick = args.devolveClick;
    this._fileImageClick = args.fileImageClick;
    this._fileAudioClick = args.fileAudioClick;
    this._fileVideoClick = args.fileVideoClick;
    this._fileMiscClick = args.fileMiscClick;

    //===== 多國語言支援 =====
    this._textWeekList = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];    // 星期的文字清單 (多國語言用)
    if (typeof (args.textWeekList) != "undefined")
        this._textWeekList = args.textWeekList;

    this._textRead = "Read"; // 已讀文字 (多國語言用)
    if (typeof (args.textRead) != "undefined")
        this._textRead = args.textRead;

    this._textBelowUnread = "Unread messages below";    // 以下未讀字元
    if (typeof (args.textBelowUnread) != "undefined")
        this._textBelowUnread = args.textBelowUnread;

    // 系統 Log 訊息
    this._textSystemLogTemplate = {
        Invite: "{{USER1}} invited {{USER2}} to the chatroom",
        Accept: "{{USER1}} joined the chatroom",
        Reject: "{{USER1}} cancelled {{USER2}} invitation to the chatroom",
        Exit: "{{USER1}} left the chatroom",
        Kickout: "{{USER1}} deleted {{USER2}} from the chatroom"
    };    
    if (typeof (args.textSystemLogTemplate) != "undefined")
        this._textSystemLogTemplate = args.textSystemLogTemplate;       

    // 交辦結果: "未確認", "同意", "否決"
    this._textDevolveResult = {
        Unknow: "Unknow", Accept: "Accept", Reject: "Reject"
    };
    if (typeof (args.textDevolveResult) != "undefined")
        this._textDevolveResult = args.textDevolveResult;

    // "交辦給"    
    this._textDevolveAssignTo = "Assign to";
    if (typeof (args.textDevolveAssignTo) != "undefined")
        this._textDevolveAssignTo = args.textDevolveAssignTo;

    // "狀態"
    this._textDevolveStatus = "Status";
    if (typeof (args.textDevolveStatus) != "undefined")
        this._textDevolveStatus = args.textDevolveStatus;

    // item 格式 :
    // {
    //     id: [id],        // Block 的 DOM id (用來定位, 通常只有 pending 才有)
    //     type:[type],     // Block 的型式 : 
    //                      //     pending  (送出時暫時的 Block)
    //                      //     entity   (從 DB 載入的 Block)
    //                      //     console  (偵錯用的訊息)
    //                      //     date     (日期分隔符)
    //                      //     unread   (以下為未讀訊息)
    //     row: [row]       // 對應的 LOG DataRow, 只有 pending, entity 才有此資料, date, unread 則儲存 Date 物件
    // }
    this._buffer = [];      // 儲存每一個 log_item 的資料

    // 建立 BlockRender 物件, 用來取得正確的 Block 高度
    this._blockRender = new BlockRender(this._renderContainerId);


    //===== 載入所有 Template =====
    var ver = "20151006005";
    this._template_other_devolve = this._loadTemplate("ChatTemplate/template_other_devolve.html?_=" + ver);
    this._template_other_emoticon = this._loadTemplate("ChatTemplate/template_other_emoticon.html?_=" + ver);
    this._template_other_file_audio = this._loadTemplate("ChatTemplate/template_other_file_audio.html?_=" + ver);
    this._template_other_file_image = this._loadTemplate("ChatTemplate/template_other_file_image.html?_=" + ver);
    this._template_other_file_misc = this._loadTemplate("ChatTemplate/template_other_file_misc.html?_=" + ver);
    this._template_other_file_video = this._loadTemplate("ChatTemplate/template_other_file_video.html?_=" + ver);
    this._template_other_text = this._loadTemplate("ChatTemplate/template_other_text.html?_=" + ver);

    this._template_pending_devolve = this._loadTemplate("ChatTemplate/template_pending_devolve.html?_=" + ver);
    this._template_pending_emoticon = this._loadTemplate("ChatTemplate/template_pending_emoticon.html?_=" + ver);
    this._template_pending_file = this._loadTemplate("ChatTemplate/template_pending_file.html?_=" + ver);
    this._template_pending_text = this._loadTemplate("ChatTemplate/template_pending_text.html?_=" + ver);

    this._template_self_devolve = this._loadTemplate("ChatTemplate/template_self_devolve.html?_=" + ver);
    this._template_self_emoticon = this._loadTemplate("ChatTemplate/template_self_emoticon.html?_=" + ver);
    this._template_self_file_audio = this._loadTemplate("ChatTemplate/template_self_file_audio.html?_=" + ver);
    this._template_self_file_image = this._loadTemplate("ChatTemplate/template_self_file_image.html?_=" + ver);
    this._template_self_file_misc = this._loadTemplate("ChatTemplate/template_self_file_misc.html?_=" + ver);
    this._template_self_file_video = this._loadTemplate("ChatTemplate/template_self_file_video.html?_=" + ver);
    this._template_self_text = this._loadTemplate("ChatTemplate/template_self_text.html");

    this._template_system = this._loadTemplate("ChatTemplate/template_system.html");
}

// 使用同步方式載入 template 檔案
BlockViewer.prototype._loadTemplate = function (url) {
    var str = $.ajax({
        type: "GET",
        url: url,
        async: false,
        cache: true,
        dataType: "text"
    }).responseText;
    return str;
}


// 清除並載入 LOG 資料, 轉成 Block 顯示出來
BlockViewer.prototype.reload = function (maxRowCount, logId, callback, failureCallback) {    
    this._container.html(""); // 清除 Block 內容
    this._buffer = [];      // 清除 Log Buffer

    // Ajax 讀取最新 LOG
    var url = 'UChatAjax.aspx';
    var call_id = (new Date()).getTime();
    var data = {
        method: "QueryLatestLog",
        roomId: this._roomId,
        maxRowCount: maxRowCount + 1,   // 多載入一筆, 做為頂端偵測
        callId: call_id
    };


    if (logId != null && logId != '') {
        // 如果是從 LOG_ID 上下展開
        data = {
            method: "QueryLogByMiddle",
            maxRowCount: maxRowCount + 1,   // 多載入一筆, 做為頂端偵測
            logId: logId,
            callId: call_id
        };
    }

    // 呼叫 Ajax function 讀取 LOG Rows 資料
    var make_reload_callback = function (sender, callback, rowCount) {
        return function (ds) {
            sender._reload_success_callback(sender, callback, ds, rowCount);
        };
    };

    PT_Ajax.post(url, data, make_reload_callback(this, callback, maxRowCount), failureCallback);
}

BlockViewer.prototype._reload_success_callback = function (sender, callback, ds, rowCount) {    
    var call_id = ds.CallResult[0].CALL_ID;
    var rows = ds.Log;

    // 如果沒有資料, 直接執行 callback
    if (rows.length <= 0) {
        // 執行 callback
        if (typeof (callback) != "undefined")
            callback();
        return;
    }

    // Check 是否 ChatRoom 內容不足一頁
    var index = 1;
    var is_top = false;
    if (rows.length < rowCount) {
        is_top = true;
        index = 0;
    }

    // 建立 Render Rows 清單, 準備 Hidden Render
    var create_rows = [];
    for (var i = index; i < rows.length; i++) {
        var row = rows[i];
        create_rows.push(row);
    }

    //m_ChatLink.notifyLoad(5000);    // 通知 ChatLink 將要使用連線(讓 BlockRender 正常)

    // 使用 BlockRender 來 Render HTML Code 以取得正確的 Height
    this._blockRender.clear();

    var create_items = this._rowsToItems("init", create_rows, is_top);  // 產生將要 Render 出來的 Item 清單
    for (var i = 0 ; i < create_items.length ; i++) {
        var item = create_items[i];
        var html = this._itemToBlockHtml(item);
        this._blockRender.add(html);
    }

    // Render 結束後的處理
    var make_renderForDone_func = function (sender, callback, create_items, is_top) {
        return function (success) {

            // 如果 Timeout
            if (success == false)
                sender._log("BlockRender.renderForDone() timeout !");

            // 把 Block 搬到 containter
            var blocks = sender._renderContainer.children();
            var index = 0;
            while (index < blocks.length) {
                var block = blocks.eq(index);
                sender._container.append(block);
                index++;
            }

            // 把 create_items 加到 buffer
            for (var i = 0 ; i < create_items.length ; i++) {
                var item = create_items[i];
                sender._buffer.push(item);
            }

            sender.updateRead();  // 更新畫面 Block 的已讀字樣              

            sender.checkPointTime();    // 更新已讀指標 READ_LOG_TIME 到最新的 LOG

            if (typeof (callback) != "undefined") {

                // 尋找 Unread Block, 給 callback 作 scroll 控制用
                var unread_block = null;
                for (var i = 0 ; i < sender._buffer.length ; i++) {
                    var item = sender._buffer[i];
                    if (item.type == 'unread') {
                        unread_block = sender._container.children().eq(i);
                    }
                }

                callback(unread_block);
            }
        }
    }


    // 等待 Render 結束 (或 Timeout)
    this._blockRender.renderForDone(4000, make_renderForDone_func(this, callback, create_items, is_top));

}

// 載入上方(較舊)的 LOG 資料, 需先呼叫 reload() 定位上下邊界
BlockViewer.prototype.loadBeforeStart = function (rowCount, keepScrollSpace, callback, failureCallback) {
    /// <summary>
    /// 載入上方(較舊)的 LOG 資料, 需先呼叫 reload() 定位上下邊界
    /// </summary>
    /// <param name="rowCount" type="Number">一次載入的筆數</param>
    /// <param name="keepScrollSpace" type="Boolean">是否保留一行用來做捲動控制</param>
    /// <param name="callback">執行結束後呼叫</param>

    // 尋找最上方時間點        
    var point_time = '';
    for (var i = 0 ; i < this._buffer.length ; i++) {
        if (this._buffer[i].type == 'entity') {
            var CREATE_DATE = PT_ParseNetTimeOffset(this._buffer[i].row["CREATE_DATE"]);
            point_time = CREATE_DATE.getTime();
            break;
        }
    }

    if (point_time == '') {
        this._log("loadBeforeStart() : Without andy data in buffer, please run reload() !");

        // 如果沒有資料, 直接執行 callback            
        if (typeof (callback) != "undefined")
            callback();

        return;
    }

    this._clearRedundant(false);    // 清除尾端無用資料

    // Ajax 讀取 LOG
    var url = 'UChatAjax.aspx';
    var call_id = (new Date()).getTime();
    var data = {
        method: "QueryLogByPoint",
        roomId: this._roomId,
        pointTime: point_time,
        includePointTime: "false",
        maxRowCount: rowCount + 1,
        pointToNew: false,
        callId: call_id
    };

    // 建立 Callback function
    var make_loadBeforeStart_callback = function (sender, rowCount, keepScrollSpace, callback) {
        return function (o) {
            sender._loadBeforeStart_success_callback(sender, o, rowCount, keepScrollSpace, callback);
        };
    };

    PT_Ajax.post(url, data, make_loadBeforeStart_callback(this, rowCount, keepScrollSpace, callback), failureCallback);
}

BlockViewer.prototype._loadBeforeStart_success_callback = function (sender, o, rowCount, keepScrollSpace, callback) {
    var rows = o.Log;

    // 如果沒有資料, 直接執行 callback
    if (rows.length <= 0) {
        if (typeof (callback) != "undefined") {
            callback();
        }
        return;
    }

    // 檢查是否已經到頂 (要產生 Date Block)
    var is_top = false;
    if (rows.length < rowCount) {
        is_top = true;
    }

    // 建立 Render Rows        
    var create_rows = [];

    var len = rowCount - 1;
    if (rows.length < rowCount)
        len = rows.length;

    for (var i = 0; i < len; i++) {
        var row = rows[i];
        create_rows.push(row);
    }

    // 計算將要 Render 的 Item 清單
    var create_items = this._rowsToItems("beforeStart", create_rows, is_top);

    // 使用 BlockRender Render Item 清單
    this._blockRender.clear();

    for (var i = 0 ; i < create_items.length ; i++) {
        var item = create_items[i];
        var html = this._itemToBlockHtml(item);
        this._blockRender.add(html);
    }

    var make_renderForDone_func = function (sender, callback, create_items, is_top) {
        return function (success) {

            // 如果 Timeout
            if (success == false)
                sender._log("BlockRender.renderForDone() timeout !");

            var h = sender._renderContainer.height();

            // 把 Block 搬到 containter (從 Tail 到 Head)
            var blocks = sender._renderContainer.children();
            var index = blocks.length - 1;
            while (index >= 0) {
                var block = blocks.eq(index);
                sender._container.prepend(block);
                index--;
            }

            // 把 row 轉成 item 加到 buffer
            for (var i = create_items.length - 1 ; i >= 0  ; i--) {
                var item = create_items[i];
                sender._buffer.unshift(item);
            }

            sender.updateRead();  // 更新畫面 Block 的已讀字樣

            m_ScrollHandler.scrollToOffset(h);  // 捲動回到原來的位置

            if (typeof (callback) != "undefined")
                callback();
        }
    }


    // 等待 Render 結束
    this._blockRender.renderForDone(4000, make_renderForDone_func(this, callback, create_items, is_top));
}

// 載入下方(較新)的資料, 要先呼叫 reload 定位上下邊界
BlockViewer.prototype.loadAfterEnd = function (rowCount, keepScrollSpace, callback, failureCallback) {
    /// <summary>
    /// 載入下方(較新)的資料, 要先呼叫 reload 定位上下邊界
    /// </summary>
    /// <param name="rowCount" type="Number">一次載入的筆數</param>
    /// <param name="keepScrollSpace" type="Boolean">是否保留一行用來做捲動控制</param>
    /// <param name="callback">執行結束後呼叫</param>

    // 尋找最下方時間點        
    var point_time = '';
    for (var i = this._buffer.length - 1 ; i >= 0 ; i--) {
        if (this._buffer[i].type == 'entity') {
            var CREATE_DATE = PT_ParseNetTimeOffset(this._buffer[i].row["CREATE_DATE"]);
            point_time = CREATE_DATE.getTime();
            break;
        }
    }

    if (point_time == '') {
        this._log("loadAfterEnd() : Without andy data in buffer, please run reload() !");

        // 如果沒有資料, 直接執行 callback            
        if (typeof (callback) != "undefined")
            callback(false);
        return;
    }

    this._clearRedundant(true);    // 清除頂端無用資料

    // Ajax 讀取 LOG
    var url = 'UChatAjax.aspx';
    var call_id = (new Date()).getTime();
    var data = {
        method: "QueryLogByPoint",
        roomId: this._roomId,
        pointTime: point_time,
        includePointTime: "false",
        maxRowCount: rowCount,
        pointToNew: true,
        callId: call_id
    };

    // 建立 Callback function
    var make_loadAfterEnd_callback = function (sender, keepScrollSpace, callback) {
        return function (o) {
            sender._loadAfterEnd_success_callback(sender, o, keepScrollSpace, callback);
        };
    };

    PT_Ajax.post(url, data, make_loadAfterEnd_callback(this, keepScrollSpace, callback), failureCallback);
}

BlockViewer.prototype._loadAfterEnd_success_callback = function (sender, o, keepScrollSpace, callback) {
    var rows = o.Log;

    // 如果沒有資料, 直接執行 callback
    if (rows.length <= 0) {
        if (typeof (callback) != "undefined")
            callback(false);
        return;
    }

    // 產生將要 Render 的 item 清單
    var create_items = this._rowsToItems("afterEnd", rows, false);

    // 使用 Block Render 計算 block 高度
    this._blockRender.clear();

    for (var i = 0 ; i < create_items.length ; i++) {
        var item = create_items[i];
        var html = this._itemToBlockHtml(item);
        this._blockRender.add(html);
    }

    var make_renderForDone_func = function (sender, callback, create_items) {
        return function (success) {

            // 如果 Timeout
            if (success == false)
                sender._log("BlockRender.renderForDone() timeout !");

            // 把 Block 搬到 containter (從 Head 到 Tail)
            var blocks = sender._renderContainer.children();

            // 如果 Block 數量, 與 Items 數量不一致, 那是不可能發生的事, 是嚴重的 Bug
            if (blocks.length != create_items.length)
            {
                sender._log("BlockRender.renderForDone() : Oh ~ My GOD !!!\r\nblocks.length=" + blocks.length + ",create_items.length=" + create_items);
                return;
            }

            var index = 0;
            while (index < blocks.length) {
                var block = blocks.eq(index);
                
                // 如果 LOG_ID 已經存在則不能新增
                if (sender._findBlockByLogId(block.data("log-id"))) {
                    index++;
                    continue;
                }
                
                // block 加到 container
                sender._container.append(block);
                index++;            

                // 把 item 加到 buffer            
                var item = create_items[index];
                sender._buffer.push(item);
            }

            sender.updateRead();  // 更新畫面 Block 的已讀字樣                                

            if (typeof (callback) != "undefined") {
                callback();
            }
        }
    }


    // 等待 Render 結束
    this._blockRender.renderForDone(4000, make_renderForDone_func(this, callback, create_items));
}


// 將 rows 轉成 item 清單
BlockViewer.prototype._rowsToItems = function (mode, renderRows, isTop) {
    // mode = init, beforeStart, afterEnd
    // is_top = 是否已經到頂 (init, beforeStart 用)

    var buffer_top_date = this._findBoundDate(true, null, this._buffer);        // 找出 Buffer 頂端的 Date               
    var buffer_bottom_date = this._findBoundDate(false, null, this._buffer);    // 找出 Buffer 底端的 Date

    var rows_top_date = this._findBoundDate(true, renderRows, null);            // 找出 RenderRows 頂端的 Date  
    var rows_bottom_date = this._findBoundDate(false, renderRows, null);        // 找出 RenderRows 底端的 Date

    var index_date = null;
    var render_buffer = [];

    if (renderRows.length == 0)
        return [];

    // 如果 RenderRows 有頂端的資料, 則加上最上面的日期分隔符 (產生 Top Date Item)
    if (isTop == true) {
        var item = { type: "date", id: null, row: rows_top_date };
        render_buffer.push(item);
    }

    // 如果 afterEnd 則一開始就要從 Buffer 底部開始比日期
    if (mode == "afterEnd" && buffer_bottom_date != null) {
        index_date = buffer_bottom_date;
    }

    // 產生 RenderRows 的 Item  
    var unread = false;
    for (var i = 0 ; i < renderRows.length ; i++) {
        var row = renderRows[i];
        //var date = PT_ParseNetTimeOffset(row["CREATE_DATE"]);
        //date.setHours(0, 0, 0, 0);
        var date = row.CREATE_DATE_DISPLAY_DATE;

        if (index_date == null)
            index_date = date;

        // 如果新的 Log 比已經閱讀的最後一筆 Log 還新, 則產生 Unread Item (只有 init 才需要建立 unread 標簽)
        if (mode == "init" &&
            unread == false &&
            m_StartPointTime != "" &&
            parseInt(m_StartPointTime, 10) < PT_ParseNetTimeOffset(row["CREATE_DATE"]).getTime()) {
            var item = { type: "unread", id: null, row: date };
            render_buffer.push(item);
            unread = true;
        }

        // 如果與 date 日期不一樣, 則產生 (Date Item)
        if (date != index_date) {
            var item = { type: "date", id: null, row: date };
            render_buffer.push(item);
        }

        // 產生 Entity Item
        if (true) {
            var item = { type: "entity", id: null, row: row };
            render_buffer.push(item);
        }

        index_date = date;
    }

    // 如果是 beforeStart, 則最後要比 Buffer 的頂端, 是否要加入 Date Item
    if (mode == "beforeEnd" && index_date != buffer_top_date) {
        var item = { type: "date", id: null, row: buffer_top_date };
        render_buffer.push(item);
    }

    return render_buffer;   // 返回需要被 Render 的 Buffer
}

// 尋找 rows 或是 buffer 的日期邊界
BlockViewer.prototype._findBoundDate = function (fromTop, rows, items) {
    var list = null;
    if (rows != null)
        list = rows;
    else
        list = items;

    if (rows == null || rows.length <= 0)
        return null;

    var index = 0;
    var dx = 1;
    if (fromTop == false) {
        index = list.length - 1;
        dx = -1;
    }

    var find_date = null;
    while (true) {
        var item = list[index];
        var date = null;
        if (rows != null) {
            //date = PT_ParseNetTimeOffset(item["CREATE_DATE"]);
            //date.setHours(0, 0, 0, 0);
            date = item.CREATE_DATE_DISPLAY_DATE;
        }
        else {
            if (item.type == "entity") {
                //date = PT_ParseNetTimeOffset(item.row["CREATE_DATE"]);
                //date.setHours(0, 0, 0, 0);
                date = item.row.CREATE_DATE_DISPLAY_DATE;
            }
            if (item.type == "date")
                date = item.row;
        }

        if (date != null) {
            find_date = date;
            break;
        }

        index += dx;
        if (fromTop == true) {
            if (index > list.length)
                break;
        }
        else {
            if (index < 0)
                break;
        }
    }

    return find_date;
}

// 將 buffer 的 item 轉成 block html
BlockViewer.prototype._itemToBlockHtml = function (item) {

    // 日期分隔符
    if (item.type == "date") {
        var date = item.row;
        var jsDate = new Date(date);
        var date_str = date + " (" + this._textWeekList[jsDate.getDay()] + ")";

        // 建立 Block
        var txt = PT_HtmlEncode(date_str);
        var html = "";
        html += "<div style='word-wrap: break-word;word-break: break-all;text-align:center;margin:2px;' class='normal_height' >";
        html += "<label class=\"normal_label circle_angle\" style=\"background-color:#505050; color:#FFFFFF;\" >&nbsp;" + txt + "&nbsp;</label>";
        html += "</div>\r\n";
        return html;
    }

    // 尚未閱讀分隔符
    if (item.type == "unread") {

        // 建立 Block
        var txt = this._textBelowUnread;    // 以下為尚未閱讀訊息
        var html = "";
        html += "<div style='word-wrap: break-word;word-break: break-all;text-align:center;margin:2px;width:95%; background-color:#808080;margin: 0 auto;display;table-layout;' class='normal_height circle_angle' >";
        html += "<label class=\"normal_label\" style=\"color:#FFFFFF;\" >&nbsp;" + txt + "&nbsp;</label>";
        html += "</div>\r\n";
        return html;
    }


    if (item.type == "entity") {
        var row = item.row;

        var is_self = false;
        if (row["CREATE_USER"] == m_UserGuid)
            is_self = true;

        var html = this._createBlock(row, "", false, is_self);
        return html;
    }
}


// 同步下方的 LOG 資料
BlockViewer.prototype.syncAfterEnd = function (rowCount, callback) {
    /// <summary>
    /// 同步下方的 LOG 資料
    /// </summary>
    /// <param name="rowCount" type="Integer">一次載入的筆數</param>
    /// <param name="callback" type="Function">載入後呼叫</param>        

    // Ajax 讀取最新 LOG
    var url = 'UChatAjax.aspx';
    var call_id = (new Date()).getTime();
    var data = {
        method: "QueryLatestLog",
        roomId: this._roomId,
        maxRowCount: rowCount,
        callId: call_id
    };

    // 建立 Callback function
    var make_syncafterend_callback = function (sender, callback) {
        return function (o) {
            sender._syncAfterEnd_success_callback(sender, o, callback);
        };
    };

    PT_Ajax.post(url, data, make_syncafterend_callback(this, callback));
}

BlockViewer.prototype._syncAfterEnd_success_callback = function (sender, o, callback) {
    var rows = o.Log;

    // 比對是否同步
    var is_sync = this._checkSyncByRows(rows);

    if (is_sync == false)   // 不同步則不自動 load
    {
        this._log("syncAfterEnd() : Block UI was not sync, do not update UI.");

        // 執行 callback
        if (typeof (callback) != "undefined")
            callback(is_sync);
        return;
    }

    // 將同步取得的 Block 新增
    for (var i = 0; i < rows.length ; i++) {
        var row = rows[i];
        this._addEntityBlock(row, true, true);   // 新增 Block           
    }

    this.updateRead();  // 更新畫面 Block 的已讀字樣

    // 執行 callback
    if (typeof (callback) != "undefined")
        callback(is_sync);
}


// 增加 Console Block
BlockViewer.prototype.addConsoleBlock = function (msg) {

    // 建立 Block
    var txt = PT_HtmlEncode(msg);
    txt = txt.replace(/\r?\n/g, "<BR>");
    var html = "";
    html += "<div style='word-wrap: break-word;word-break: break-all;text-align:left;margin:5px;' >";
    html += "<label class=\"half_label\" style=\"background-color:#505050; color:#FFFFFF;\" >" + txt + "</label>";
    html += "</div>\r\n";

    // 加到 UI
    this._container.append(html);

    // 加到 Buffer
    var item = { id: null, type: "console", row: null };
    this._buffer.push(item);

    // 移除上方多餘資料
    this._clearRedundant(true);
}

// 檢查是否要新增 Date Block (日期分隔符)
BlockViewer.prototype._checkAddDateBlock = function (row, mode) {

    var is_scroll_bottom = m_ScrollHandler.isBottom(); // 保存目前是否為 Bottom 的位置

    // 取出要的 LOG Date (將要新增, 或將要定位)
    //var log_time = PT_ParseNetTimeOffset(row["CREATE_DATE"]);
    //var log_date = new Date(log_time.getTime());
    //log_date.setHours(0, 0, 0, 0);

    var log_date = row.CREATE_DATE_DISPLAY_DATE;

    // 如果是 ROW 對應的 Block 之上要加時間分隔符
    if (mode == "locationUp") {
        var location_item = null;
        var location_index = -1;
        var location_item_date = null;

        // 往上比對是否有不一樣日期的 Entity Block
        var is_date_different = false;
        for (var i = this._buffer.length - 1 ; i >= 0 ; i--) {
            var item = this._buffer[i];

            // find location item
            if (location_item == null) {
                if (item.row["LOG_ID"] == row["LOG_ID"]) {
                    location_item = item;
                    location_index = i;
                }
                continue;
            }

            // 往上找 Entity Item         
            if (item.type != "entity")
                continue;

            // 如果找到 Entity Item
            //var item_date = PT_ParseNetTimeOffset(item.row["CREATE_DATE"]);
            //item_date.setHours(0, 0, 0, 0);
            var item_date = item.CREATE_DATE_DISPLAY_DATE;

            //location_item_date = PT_ParseNetTimeOffset(location_item.row["CREATE_DATE"]);
            //location_item_date.setHours(0, 0, 0, 0);
            location_item_date = row.CREATE_DATE_DISPLAY_DATE;


            // 如果日期不一樣
            if (item_date != location_item_date) {
                is_date_different = true;
            }

            break;  // 只找一個 Entity Item
        }

        if (is_date_different) {
            // 新增 DateBlock
            this._addDateBlock(location_index, location_item_date);

            // 移除上方多餘資料
            this._clearRedundant(true);
        }
    }


    // 如果是加在最上面, 或是最下面
    if (mode == 'top' || mode == 'bottom') {

        // 搜尋原有的 Entity Block 是否與要新增的 row 日期不一樣
        var is_date_diffent = false;
        var is_bottom = false;
        if (mode == "bottom")
            is_bottom = true;
        var first_item_index = this._findFirstEntityIndex(is_bottom);
        if (first_item_index == -1) // 如果沒有 Entity 則不需要加上 DateBlock
            return;

        var first_item = this._buffer[first_item_index];
        var first_item_date = null;
        if (first_item != null) {
            // 取出 Item 的 Date
            //first_item_date = PT_ParseNetTimeOffset(first_item.row["CREATE_DATE"]);
            //first_item_date.setHours(0, 0, 0, 0);
            first_item_date = row.CREATE_DATE_DISPLAY_DATE;


            if (log_date != first_item_date) {
                is_date_diffent = true;
            }
        }

        // 如果需要印出日期分隔符
        if (is_date_diffent == true) {

            if (mode == "top") {
                this._addDateBlock(first_item_index, first_item_date);  // 加在第一個 Entity Block 前面

                // 移除下方多餘資料
                this._clearRedundant(false);
            }

            if (mode == "bottom") {
                this._addDateBlock(this._buffer.length, log_date);  // 加在最後面

                // 移除上方多餘資料
                this._clearRedundant(true);
            }
        }
    }

    // 還原 Bottom 屬性
    if (is_scroll_bottom == true)
        m_ScrollHandler.scrollToBottom(200);
}

// 增加 DateBlock 到 BlockViewer 與 buffer
BlockViewer.prototype._addDateBlock = function (index, date) {

    // 如果超過索引值
    if (index > this._buffer.length) {
        this._log("_addDateBlock() : index out of range !\r\nindex=" + index + "\r\ndate=" + date);
        return;
    }

    // 檢查日期分隔符是否存在
    var is_exist = false;
    for (var i = 0 ; i < this._buffer.length; i++) {
        var item = this._buffer[i];
        if (item.type == "date" && item.row == date) {
            is_exist = true;
            break;
        }
    }

    if (is_exist == true)   // 已經存在, 不需 Add Block
        return;

    var item = { id: null, type: "date", row: date };           // 建立 Date Item
    var html = this._checkAddDateBlock_getDateBlockHtml(date);  // 建立 Date Block Html

    // 插入到 buffer 的 index 位置
    this._buffer.splice(index, 0, item);

    if (index < this._container.children().length) {
        // 如果插入到 0 ~ End 之間
        var location_block = this._container.children().eq(index);
        location_block.before(html);
    } else if (index == this._container.children().length) {
        // 如果插入最後之後
        var location_block = this._container.children().eq(index - 1);
        location_block.after(html);
    }
}

// 產生日期分隔符的 Html 
BlockViewer.prototype._checkAddDateBlock_getDateBlockHtml = function (date) {

    var jsDate = new Date(date);    // 2016/07/28 => Date
    date_str = date + " (" + this._textWeekList[jsDate.getDay()] + ")";

    // 建立 Block
    var txt = PT_HtmlEncode(date_str);
    var html = "";
    html += "<div style='word-wrap: break-word;word-break: break-all;text-align:center;margin:2px;' class='normal_height' >";
    html += "<label class=\"normal_label circle_angle\" style=\"background-color:#505050; color:#FFFFFF;\" >&nbsp;" + txt + "&nbsp;</label>";
    html += "</div>\r\n";

    return html;
}


// 最下方建立一個 Text 版的 Pending Block, 用來等待傳送完成
BlockViewer.prototype.addPendingTextBlock = function (id, context) {
    /// <summary>
    /// 最下方建立一個 Text 版的 Pending Block, 用來等待傳送完成
    /// </summary>
    /// <param name="id" type="String">PendingBlock 的 DOM id</param>
    /// <param name="context" type="String">Text 訊息內容</param>

    var is_scroll_bottom = m_ScrollHandler.isBottom(); // 保存 Bottom 屬性

    // 建立 Row
    var row = {};
    row.LOG_TYPE = "Text";
    row.CONTEXT = context;

    // 加到 UI
    var html = this._createBlock(row, id, true, true);
    this._container.append(html);

    // 加到 Buffer
    var item = { id: id, type: "pending", row: row };
    this._buffer.push(item);

    // 移除上方多餘資料
    this._clearRedundant(true);

    // 還原 Bottom 屬性
    if (is_scroll_bottom == true)
        m_ScrollHandler.scrollToBottom(200);
}


// 最下方建立一個 Emoticon 版的 Pending Block, 用來等待傳送完成
BlockViewer.prototype.addPendingEmoticonBlock = function (id, emoticonType, emoticonName) {
    /// <summary>
    /// 最下方建立一個 Emoticon 版的 Pending Block, 用來等待傳送完成
    /// </summary>
    /// <param name="id" type="String">PendingBlock 的 DOM id</param>
    /// <param name="emoticonType" type="String">表情的類型</param>
    /// <param name="emoticonName" type="String">表情的名稱</param>        

    var is_scroll_bottom = m_ScrollHandler.isBottom(); // 保存 Bottom 屬性

    // 建立 Row
    var row = {};
    row.LOG_TYPE = "Emoticon";
    row.EMOTICON_TYPE = emoticonType;
    row.EMOTICON_NAME = emoticonName;

    // 加到 UI
    var html = this._createBlock(row, id, true, true);
    this._container.append(html);

    // 加到 Buffer
    var item = { id: id, type: "pending", row: row };
    this._buffer.push(item);

    // 移除上方多餘資料
    this._clearRedundant(true);

    // 還原 Bottom 屬性
    if (is_scroll_bottom == true)
        m_ScrollHandler.scrollToBottom(200);
}

// 最下方建立一個 File 版的 Pending Block, 用來等待傳送完成
BlockViewer.prototype.addPendingFileBlock = function (id) {
    /// <summary>
    /// 最下方建立一個 File 版的 Pending Block, 用來等待傳送完成
    /// </summary>
    /// <param name="id" type="String">PendingBlock 的 DOM id</param>
    /// <param name="context" type="String">Text 訊息內容</param>

    var is_scroll_bottom = m_ScrollHandler.isBottom(); // 保存 Bottom 屬性

    // 建立 Row                
    var row = {};
    row.LOG_TYPE = "File";

    // 加到 UI
    var html = this._createBlock(row, id, true, true);
    this._container.append(html);

    // 加到 Buffer
    var item = { id: id, type: "pending", row: row };
    this._buffer.push(item);

    // 移除上方多餘資料
    this._clearRedundant(true);

    // 還原 Bottom 屬性
    if (is_scroll_bottom == true)
        m_ScrollHandler.scrollToBottom(200);
}

// 最下方建立一個 Devolve 版的 Pending Block, 用來等待傳送完成
BlockViewer.prototype.addPendingDevolveBlock = function (id, targetUser, targetName, context, complexData) {
    /// <summary>
    /// 最下方建立一個 Devolve 版的 Pending Block, 用來等待傳送完成
    /// </summary>
    /// <param name="id" type="String">PendingBlock 的 DOM id</param>
    /// <param name="context" type="String">Text 訊息內容</param>

    var is_scroll_bottom = m_ScrollHandler.isBottom(); // 保存 Bottom 屬性

    // 建立 Row
    var row = {};
    row.LOG_TYPE = "Devolve";
    row.CONTEXT = context;
    row.TARGET_USER = targetUser;
    row.TARGET_NAME = targetName;
    row.COMPLEX_DATA = complexData;

    // 加到 UI
    var html = this._createBlock(row, id, true, true);
    this._container.append(html);

    // 加到 Buffer
    var item = { id: id, type: "pending", row: row };
    this._buffer.push(item);

    // 移除上方多餘資料
    this._clearRedundant(true);

    // 還原 Bottom 屬性
    if (is_scroll_bottom == true)
        m_ScrollHandler.scrollToBottom(200);
}

// 取得 LOG_ID 後, 需設定 Block 的 LOG_ID, 以免資料重覆新增
BlockViewer.prototype.replacePendingLogId = function (id, logId) {
    /// <summary>
    /// 取得 LOG_ID 後, 需設定 Block 的 LOG_ID, 以免資料重覆新增
    /// </summary>
    /// <param name="id" type="String">PendingBlock 的 DOM id</param>
    /// <param name="logId" type="String">從 Server 端取得的 LOG_ID (GUID 格式)</param>

    // 根據 id 尋找 Pending Block
    var blocks = $.find('#' + id);    

    if (blocks.length <= 0) {        
        this._log("replacePendingLogId() : id=[" + id + "] not found !");
        return;
    }        

    var block = $('#' + id);        // 取出 Block                
           
    block.attr("data-log-id", logId);   // 設定 Block 的 LOG_ID 屬性, 用來做重覆性判斷 (使用 attr 才能修改 data 屬性)        
}

// 取得 entiry block 後, 替換原先的 pending block (新增 LOG 的 Ajax 呼叫完成後, 需執行此 method)
BlockViewer.prototype.replacePendingBlock = function (id, row) {
    /// <summary>
    /// 取得 entiry block 後, 替換原先的 pending block (新增 LOG 的 Ajax 呼叫完成後, 需執行此 method)
    /// </summary>
    /// <param name="id" type="String">PendingBlock 的 DOM id</param>
    /// <param name="row" type="Object">完成新增 LOG 之後取得的 Log DataRow 資料</param>

    var is_scroll_bottom = m_ScrollHandler.isBottom(); // 保存 Bottom 屬性

    // 根據 id 尋找 Pending Block
    var blocks = $.find('#' + id);
    if (blocks.length <= 0) {
        this._log("replacePendingBlock() : id=[" + id + "] not found !");
        return;
    }

    var block = $('#' + id);   // 取出 Block
    var index = this._container.children().index(block);   // 計算 index     

    // 檢查是否已經存在 Entity Block, 如果存在, 則刪除此多餘的 Block (可能是因為 Event 先觸發, 而產生)
    var entity_exist = false;
    for (var i = 0 ; i < this._container.children().length ; i++) {
        var b = this._container.children().eq(i);
        var item = this._buffer[i];
        if (b.data("log-id") == row["LOG_ID"] && item.type == "entity") {
            entity_exist = true;
        }
    }

    if (entity_exist == true) {
        // LOG Block 已經存在
        block.remove();                 // 移除 DOM Block
        this._buffer.splice(index, 1);  // 移除 buffer            
        return;
    }

    var html = this._createBlock(row, "", false, true);

    // 替換原先 block (新增後刪除)        
    block.after(html);  // 新增新 Block            
    block.remove();     // 刪除舊 Block            

    // 替換 Buffer
    var item = { id: null, type: "entity", row: row };
    this._buffer[index] = item;

    this.checkPointTime();  // 更新已讀指標

    // 加入 item 之後, 檢查並加入日期分隔符 (必需要在 pending 被替換成 entity 之後, 才可以做日期分隔符的運算)
    this._checkAddDateBlock(row, "locationUp");

    // 還原 Bottom 屬性
    if (is_scroll_bottom == true)
        m_ScrollHandler.scrollToBottom(200);
}

// 取得 entiry block 後, 替換原先的 pending block (Devolve 被更新之後, 需執行此 method)
BlockViewer.prototype.replaceExistBlock = function (row) {
    /// <summary>
    /// 取得 entiry block 後, 替換原先的 pending block (Devolve 被更新之後, 需執行此 method)
    /// </summary>        
    /// <param name="row" type="Object">Log 的 DataRow 資料</param>

    var is_scroll_bottom = m_ScrollHandler.isBottom(); // 保存 Bottom 屬性

    var log_id = row.LOG_ID;
    var index = -1;
    var block = null;
    for (var i = 0 ; i < this._buffer.length ; i++) {
        var item = this._buffer[i];
        if (item.type == "entity" && item.row.LOG_ID == log_id) {
            index = i;
            block = this._container.children().eq(i);
            break;
        }
    }

    // 根據 id 尋找 Pending Block        
    if (block == null) {
        this._log("replaceExistBlock() : LOG_ID=[" + log_id + "] not found !");
        return;
    }

    // 建立 Block 新增到畫面
    var is_self = false;
    if (row["CREATE_USER"] == this._userGuid)
        is_self = true;

    var html = this._createBlock(row, "", false, is_self);

    // 替換原先 block (新增後刪除)        
    block.after(html);  // 新增新 Block            
    block.remove();     // 刪除舊 Block            

    // 替換 Buffer
    var item = { id: null, type: "entity", row: row };
    this._buffer[index] = item;

    this.updateRead();  // 更新畫面上的已讀指標

    // 還原 Bottom 屬性
    if (is_scroll_bottom == true)
        m_ScrollHandler.scrollToBottom(200);
}

// 新增 entity block (收到 event 後, 產生 block 用)
BlockViewer.prototype.addEntityBlock = function (row) {
    /// <summary>
    /// 新增 entity block (收到 event 後, 產生 block 用)
    /// </summary>        
    /// <param name="row" type="Object">Log 的 DataRow 資料</param>

    var html = this._addEntityBlock(row, true, true);

    this.updateRead();  // 更新畫面 Block 的已讀字樣

    return html;
}

// 用來給事件觸發用的新增 Block 功能 (失去同步則無法新增)
BlockViewer.prototype.addEntityBlockForEvent = function (rows) {
    /// <summary>
    /// 用來給事件觸發用的新增 Block 功能 (失去同步則無法新增)
    /// </summary>        
    /// <param name="rows" type="Object">多筆 Log DataRow 資料</param>

    // 比對畫面資料是否同步 (UI 是否有 Match 的 ROW)
    if (this._buffer.length > 0) {  // 筆數大於 0 才有同步的意義
        if (this._checkSyncByRows(rows) == false) {
            this._log("addEntityBlockForEvent() : BlockView not synchronous, can not add Block !");
            return null; // 非同步時, 不能直接新增
        }
    }

    var all_html = "";
    for (var i = 0; i < rows.length; i++) {
        var row = rows[i];
        all_html += this._addEntityBlock(row, true, true);   // 新增 Block           
    }

    this.updateRead();  // 更新畫面 Block 的已讀字樣

    return all_html;
}

// 檢查更新 Point LogId & Time (更新自己在頁面上的 PointTime 與 PointLogId)
BlockViewer.prototype.checkPointTime = function () {
    /// <summary>
    /// 檢查更新 Point LogId 和 Time (更新自己在頁面上的 PointTime 與 PointLogId)
    /// </summary>                    
    if (this._buffer.length <= 0)
        return;

    var item = this._buffer[this._buffer.length - 1];    // 使用最後一筆資料來比對 (資料要 Show 出來才算已讀)
    if (item.type != 'entity')
        return;

    var row = item.row;

    var log_id = row["LOG_ID"];
    var point_time = PT_ParseNetTimeOffset(row["CREATE_DATE"]).getTime();

    // 如果 row 的資料, 比先前的還新, 或是根本進來過聊天室, 則更新 Point LogId & Time
    if (m_PointTime == "" || point_time > parseInt(m_PointTime, 10)) {
        //m_ChatLink.updatePointTime(this._roomId, log_id, point_time);   // 使用 ChatLink 更新已讀指標

        //this._log("checkPointTime() : found new row, do ChatLink.updatePointTime() ...");

        // 更新 Point LogId 與 Time
        m_PointTime = point_time;
        m_PointLogId = log_id;
    }
}

// 更新畫面上 Block 的 已讀文字, Ex: 已讀 5 
BlockViewer.prototype.updateRead = function () {
    /// <summary>
    /// 更新畫面上 Block 的 已讀文字, Ex: 已讀 5 
    /// ps. 一對一聊天室沒有數量
    /// </summary>    

    var children = this._container.children();

    for (var i = 0 ; i < this._buffer.length ; i++) {
        var item = this._buffer[i];
        if (item.type != 'entity')
            continue;

        var row = item.row;
        var USER_GUID = row["USER_GUID"];
        if (USER_GUID != this._userGuid)  // 非自己發的 Block 則不須設定
            continue;

        var CREATE_DATE = row["CREATE_DATE"];
        var log_time = PT_ParseNetTimeOffset(CREATE_DATE).getTime();
        //var log_time_str = PT_GetYYYYMMDDHHMMSSFFF(log_time);

        // 計算已讀數量
        var read_count = 0;
        for (var key in this._readList) {
            if (key == this._userGuid)
                continue;

            var enter_time = this._readList[key].enterTime;
            var read_time = this._readList[key].readTime;
            if (log_time >= enter_time && log_time <= read_time)    // LOG 要在 ENTER_TIME 與 READ_TIME 之間才能 +1                
                read_count++;
        }

        var read_str = "";
        if (read_count > 0) {
            read_str = this._textRead + " ";
            if (m_RoomType != "Pair")   // 非 Pair Room 才能顯示數字
                read_str += read_count;
        }

        // 設定 Block 的已讀
        children.eq(i).find(".block_read").each(function () {
            $(this).html(read_str);
        });
    }
}

// 收到更新已讀的事件後, 更新畫面上 Block 的已讀文字, 與 ReadList 資訊 (MEMBER 資訊)
BlockViewer.prototype.updateReadByRows = function (rows) {
    /// <summary>
    /// 收到更新已讀的事件後, 更新畫面上 Block 的已讀文字, 與 ReadList 資訊 (MEMBER 資訊)
    /// </summary>    
    /// <param name="rows" type="Object">多筆 Member 的 DataRow 資料</param>

    for (var i = 0 ; i < rows.length; i++) {
        var row = rows[i];
        var USER_GUID = row["USER_GUID"];
        var ENTER_TIME = row["ENTER_TIME"];
        var READ_LOG_TIME = row["READ_LOG_TIME"];

        if (READ_LOG_TIME == null)  // 一開始 ChatRoom 不會有 READ_LOG_TIME
            continue;

        var read_time = PT_ParseNetTimeOffset(READ_LOG_TIME).getTime();

        // 如果沒有已讀資料, 則建立之
        if (this._readList[USER_GUID] == null) {
            var enter_time = PT_ParseNetTimeOffset(ENTER_TIME).getTime();
            this._readList[USER_GUID] = { userGuid: USER_GUID, enterTime: enter_time, readTime: read_time };
        }

        var old_time = this._readList[USER_GUID].readTime;
        if (old_time == null) {
            this._readList[USER_GUID].readTime = read_time;  // 如果不存在, 則建立新的資料
        }
        else {
            if (read_time > old_time)
                this._readList[USER_GUID].readTime = read_time;  // 如果 row 的資料比較大, 則替換之
        }

        this._log("updateReadByRows() : [" + USER_GUID + "]=[" + read_time + "]");
    }

    this.updateRead();  // 更新 UI
}

// 將 LOG Row 轉成新增到 BlockViewer
BlockViewer.prototype._addEntityBlock = function (row, isBottom, checkExist) {

    // 尋找是否已經存在 Block (由 Pending 產生的)
    if (checkExist == true) {
        if (this._findBlockByLogId(row["LOG_ID"]) == true) {
            this._log("_addEntityBlock() : LOG_ID[" + row["LOG_ID"] + "] already exist at UI !");
            return ""; // 已經存在則不能新增
        }
    }

    // 比對 Block 是否小於 EnterTime (Event 一次發三筆, 可能會收到進入聊天室前的資料)
    var enter_time = parseInt(m_EnterTime, 10);
    var log_time = PT_ParseNetTimeOffset(row["CREATE_DATE"]).getTime();
    if (log_time < enter_time)
        return "";

    var is_scroll_bottom = m_ScrollHandler.isBottom();     // 讀取是否捲動到最下面        

    // 建立 Block 新增到畫面
    var is_self = false;
    if (row["CREATE_USER"] == this._userGuid)
        is_self = true;

    //===== 產生日期分隔符 =====

    if (isBottom == true)
        this._checkAddDateBlock(row, "bottom");
    else
        this._checkAddDateBlock(row, "top");

    //===== 建立 Entity Block =====
    var html = this._createBlock(row, "", false, is_self);

    if (isBottom == true) {
        this._container.append(html);   // 加在下面
    } else {
        this._container.prepend(html);  // 加到頂端
    }

    // 新增 Buffer
    var item = { id: null, type: "entity", row: row };
    if (isBottom == true) {
        this._buffer.push(item);    // 把 row 資料存到 Log Buffer 的後面            
        this._clearRedundant(true); // 移除上方多餘資料
    } else {
        this._buffer.unshift(item);   // 把 row 資料存到 Log Buffer 的開頭            
        this._clearRedundant(false);    // 移除下方多餘資料
    }

    this.checkPointTime();  // 更新已讀指標          

    // 如果新增前是在最下方, 則新增後也要捲到最下方
    if (is_scroll_bottom == true)
        m_ScrollHandler.scrollToBottom(200);

    return html;
}

// 從上方, 或下方, 尋找第一筆 Entity Item 的 Index
BlockViewer.prototype._findFirstEntityIndex = function (fromBottom) {

    var dx = 1;
    var index = 0;
    if (fromBottom == true) {
        index = this._buffer.length - 1;
        dx = -1;
    }

    while (index >= 0 && index < this._buffer.length) {
        var item = this._buffer[index];

        if (item.type == "entity") {
            return index;
        }

        index += dx;
    }

    return -1;
}


// 檢查 rows 內是否與目前 UI 同步
BlockViewer.prototype._checkSyncByRows = function (rows) {
    var is_sync = false;

    // 檢查 buffer 是否沒有 LOG 資料
    var is_null = true;
    for (var i = 0 ; i < this._buffer.length ; i++) {
        var item = this._buffer[i];
        if (item.type == "entity") {
            is_null = false;
            break;
        }
    }

    // 沒有 entity 資料, 就視為同步, 因為聊天室是空的
    if (is_null) {
        return true;
    }

    // 如果有 LOG 資料, 則比對資料的同步性
    for (var i = 0 ; i < rows.length; i++) {
        var LOG_ID = rows[i]["LOG_ID"];
        if (this._findBlockByLogId(LOG_ID) == true) {
            is_sync = true;
            break;
        }
    }

    if (is_sync == false) {
        this._log("_checkSyncByRows() : is_sync = " + is_sync);
        for (var i = 0 ; i < rows.length ; i++) {
            this._log("\t " + rows[i]["LOG_ID"] + "," + rows[i]["CREATE_DATE"]);
        }
    }
    return is_sync;
}

// 根據 LOG_ID 尋找 Block 是否已經存在
BlockViewer.prototype._findBlockByLogId = function (logId) {
    var children = this._container.children();
    for (var i = 0 ; i < children.length ; i++) {
        var block = children.eq(i);
        if (typeof (block.data("log-id")) != "undefined" &&
            block.data("log-id") == logId) {
            return true;
        }
    }
    return false;
}


// 清除多餘的 Buffer 資料
BlockViewer.prototype._clearRedundant = function (isClearTop) {

    var count = this._buffer.length - this._bufferSize;
    if (count <= 0)
        return;

    // 移除上方資料
    if (isClearTop == true) {
        for (var i = 0 ; i < count ; i++) {
            // 移除最上方的 DOM
            var child = this._container.children().first();
            child.remove();

            // 移除 Log Buffer 最前面的 item
            this._buffer.shift();
        }
    }

    if (isClearTop == false) {
        for (var i = 0 ; i < count ; i++) {
            // 移除最下方的 DOM
            var child = this._container.children().last();
            child.remove();

            // 移除 Log Buffer 最下方的 item
            this._buffer.pop();
        }
    }

    $("html,body").height(0);   // for Safari, 讓 document.body 高度正常
}

// 寫入 console log
BlockViewer.prototype._log = function (msg) {
    var time = new Date();
    var hh = time.getHours(); if (hh < 10) hh = "0" + hh;
    var mm = time.getMinutes(); if (mm < 10) mm = "0" + mm;
    var ss = time.getSeconds(); if (ss < 10) ss = "0" + ss;
    var time_str = hh + ":" + mm + ":" + ss;
    try {
        console.log(time_str + " [BlockViewer]: " + msg);
    } catch (e) { }

    if (typeof (this._logFunc) != "undefined") {
        this._logFunc(msg);
    }
}

//========== Block 建立 ==========

BlockViewer.prototype._createBlock = function (log_data, block_id, is_pending, is_self) {    
    // 如果是系統 LOG
    if (log_data.LOG_TYPE == "System") {
        return this._createSystemBlock(log_data);
    }

    var self_align = "left";
    //if (is_self)
    //    self_align = "right";

    // 計算顯示時間 (.NET 日期轉成 String) (Self, Other)
    //var date_str = "";
    var time_str = "";
    if (typeof (log_data.CREATE_DATE) != 'undefined' && log_data.CREATE_DATE != null) {
        //var log_datetime = PT_ParseNetTimeOffset(log_data.CREATE_DATE);
        //date_str = PT_GetYYYYMMDD(log_datetime);
        //time_str = PT_GetHHMMSS(log_datetime);
        time_str = log_data.CREATE_DATE_DISPLAY_TIME;
    }

    // 判斷附件型式 (Self, Other)
    var file_type = "";
    if (log_data.LOG_TYPE == "File") {
        if (typeof (log_data.FILE_CONTENT_TYPE) != 'undefined') {
            if (log_data.FILE_CONTENT_TYPE.toLowerCase().indexOf("image/") == 0) {
                file_type = "image";
            }
            if (log_data.FILE_CONTENT_TYPE.toLowerCase().indexOf("video/") == 0) {
                file_type = "video";
            }
            if (log_data.FILE_CONTENT_TYPE.toLowerCase().indexOf("audio/") == 0) {
                file_type = "audio";
            }
        }
    }

    var content_html = "";
    //===== 如果是傳送中的 Block =====
    if (is_pending == true) {

        // 文字類型
        if (log_data.LOG_TYPE == 'Text') {
            var data = { context: this._blockTextToUrl(log_data.CONTEXT) };
            content_html = PT_HtmlRender(this._template_pending_text, data);
        }

        // 貼圖類型
        if (log_data.LOG_TYPE == 'Emoticon') {
            var data = { emoticon_type: log_data.EMOTICON_TYPE, emoticon_name: log_data.EMOTICON_NAME };
            content_html = PT_HtmlRender(this._template_pending_emoticon, data);
        }

        // 檔案類型
        if (log_data.LOG_TYPE == 'File') {
            var icon_url = this._imageRootPath + "/P_UChat_Loading.gif";
            var new_url = PT_GetResizeUrl(icon_url, layout_type);
            if (new_url != '')
                icon_url = new_url;
            var data = { icon_url: icon_url };

            content_html = PT_HtmlRender(this._template_pending_file, data);
        }

        // 交辦類型
        if (log_data.LOG_TYPE == 'Devolve') {
            var icon_url = this._imageRootPath + "/M_UChat_ModuleDevolve.png";
            var new_url = PT_GetResizeUrl(icon_url, layout_type);
            if (new_url != '')
                icon_url = new_url;
            var data = {
                icon_url: icon_url,
                target_name: log_data.TARGET_NAME,
                context: log_data.CONTEXT,
                text_assign_to: this._textDevolveAssignTo,
                text_status: this._textDevolveStatus,
                text_unknow: this._textDevolveResult.Unknow
            };

            content_html = PT_HtmlRender(this._template_pending_devolve, data);
        }
    }

    //===== 如果是自己發送過的 Block =====
    if (is_pending == false && is_self == true) {

        // 文字類型
        if (log_data.LOG_TYPE == 'Text') {
            var data = {
                time: time_str,
                context: this._blockTextToUrl(log_data.CONTEXT)
            };
            content_html = PT_HtmlRender(this._template_self_text, data);
        }

        // 貼圖類型
        if (log_data.LOG_TYPE == 'Emoticon') {
            var data = {
                time: time_str,
                emoticon_type: log_data.EMOTICON_TYPE, emoticon_name: log_data.EMOTICON_NAME
            };
            content_html = PT_HtmlRender(this._template_self_emoticon, data);
        }

        // 檔案類型
        if (log_data.LOG_TYPE == 'File') {

            // 圖片
            if (file_type == "image") {
                var data = {
                    log_id: log_data.LOG_ID,
                    time: time_str,
                    file_id: log_data.FILE_ID, preview_file_id: log_data.PREVIEW_FILE_ID
                };
                content_html = PT_HtmlRender(this._template_self_file_image, data);
            }

            // 影片
            if (file_type == "video") {
                var icon_url = this._imageRootPath + "/M_UChat_FileVideo.png";
                var new_url = PT_GetResizeUrl(icon_url, layout_type);
                if (new_url != '')
                    icon_url = new_url;
                var data = {
                    time: time_str,
                    file_id: log_data.FILE_ID,
                    file_name: log_data.FILE_NAME,
                    file_length: PT_SizeToString(log_data.FILE_LENGTH),
                    icon_url: icon_url
                };
                content_html = PT_HtmlRender(this._template_self_file_video, data);
            }

            // 聲音
            if (file_type == "audio") {
                var icon_url = this._imageRootPath + "/M_UChat_FileAudio.png";
                var new_url = PT_GetResizeUrl(icon_url, layout_type);
                if (new_url != '')
                    icon_url = new_url;
                var data = {
                    time: time_str,
                    file_id: log_data.FILE_ID,
                    file_name: log_data.FILE_NAME,
                    file_length: PT_SizeToString(log_data.FILE_LENGTH),
                    icon_url: icon_url
                };
                content_html = PT_HtmlRender(this._template_self_file_audio, data);
            }

            // 其他
            if (file_type == "") {
                var icon_url = this._imageRootPath + "/M_UChat_FileMisc.png";
                var new_url = PT_GetResizeUrl(icon_url, layout_type);
                if (new_url != '')
                    icon_url = new_url;
                var data = {
                    time: time_str,
                    file_id: log_data.FILE_ID,
                    file_name: log_data.FILE_NAME,
                    file_length: PT_SizeToString(log_data.FILE_LENGTH),
                    icon_url: icon_url
                };
                content_html = PT_HtmlRender(this._template_self_file_misc, data);
            }
        }

        // 交辦類型
        if (log_data.LOG_TYPE == 'Devolve') {
            var icon_url = this._imageRootPath + "/M_UChat_ModuleDevolve.png";
            var new_url = PT_GetResizeUrl(icon_url, layout_type);
            if (new_url != '')
                icon_url = new_url;

            var confirm_result = this._textDevolveResult.Unknow;
            if (log_data.CONFIRM_RESULT == "Accept")
                confirm_result = this._textDevolveResult.Accept;
            if (log_data.CONFIRM_RESULT == "Reject")
                confirm_result = this._textDevolveResult.Reject;

            var data = {
                time: time_str,
                log_id: log_data.LOG_ID, icon_url: icon_url,
                target_name: log_data.TARGET_NAME,
                context: PT_HtmlEncode(log_data.CONTEXT),
                confirm_result: confirm_result,
                text_assign_to: this._textDevolveAssignTo,
                text_status: this._textDevolveStatus
            };
            content_html = PT_HtmlRender(this._template_self_devolve, data);
        }
    }

    //===== 如果是別人發送過的 Block =====
    if (is_pending == false && is_self == false) {

        // 文字類型
        if (log_data.LOG_TYPE == 'Text') {
            var data = {
                user_guid: log_data.USER_GUID, user_name: log_data.USER_NAME,
                time: time_str, context: this._blockTextToUrl(log_data.CONTEXT)
            };
            content_html = PT_HtmlRender(this._template_other_text, data);
        }

        // 貼圖類型
        if (log_data.LOG_TYPE == 'Emoticon') {
            var data = {
                user_guid: log_data.USER_GUID, user_name: log_data.USER_NAME,
                time: time_str, emoticon_type: log_data.EMOTICON_TYPE, emoticon_name: log_data.EMOTICON_NAME
            };
            content_html = PT_HtmlRender(this._template_other_emoticon, data);
        }

        // 檔案類型
        if (log_data.LOG_TYPE == 'File') {

            // 圖片
            if (file_type == "image") {
                var data = {
                    log_id: log_data.LOG_ID,
                    user_guid: log_data.USER_GUID, user_name: log_data.USER_NAME,
                    time: time_str,
                    file_id: log_data.FILE_ID,
                    preview_file_id: log_data.PREVIEW_FILE_ID
                };
                content_html = PT_HtmlRender(this._template_other_file_image, data);
            }

            // 影片
            if (file_type == "video") {
                var icon_url = this._imageRootPath + "/M_UChat_FileVideo.png";
                var new_url = PT_GetResizeUrl(icon_url, layout_type);
                if (new_url != '')
                    icon_url = new_url;
                var data = {
                    user_guid: log_data.USER_GUID, user_name: log_data.USER_NAME,
                    time: time_str,
                    file_id: log_data.FILE_ID,
                    file_name: log_data.FILE_NAME,
                    file_length: PT_SizeToString(log_data.FILE_LENGTH),
                    icon_url: icon_url
                };
                content_html = PT_HtmlRender(this._template_other_file_video, data);
            }

            // 聲音
            if (file_type == "audio") {
                var icon_url = this._imageRootPath + "/M_UChat_FileAudio.png";
                var new_url = PT_GetResizeUrl(icon_url, layout_type);
                if (new_url != '')
                    icon_url = new_url;
                var data = {
                    user_guid: log_data.USER_GUID, user_name: log_data.USER_NAME,
                    time: time_str,
                    file_id: log_data.FILE_ID,
                    file_name: log_data.FILE_NAME,
                    file_length: PT_SizeToString(log_data.FILE_LENGTH),
                    icon_url: icon_url
                };
                content_html = PT_HtmlRender(this._template_other_file_audio, data);
            }

            // 其他
            if (file_type == "") {
                var icon_url = this._imageRootPath + "/M_UChat_FileMisc.png";
                var new_url = PT_GetResizeUrl(icon_url, layout_type);
                if (new_url != '')
                    icon_url = new_url;
                var data = {
                    user_guid: log_data.USER_GUID, user_name: log_data.USER_NAME,
                    time: time_str,
                    file_id: log_data.FILE_ID,
                    file_name: log_data.FILE_NAME,
                    file_length: PT_SizeToString(log_data.FILE_LENGTH),
                    icon_url: icon_url
                };
                content_html = PT_HtmlRender(this._template_other_file_misc, data);
            }
        }

        // 交辦類型
        if (log_data.LOG_TYPE == 'Devolve') {

            var icon_url = this._imageRootPath + "/M_UChat_ModuleDevolve.png";
            var new_url = PT_GetResizeUrl(icon_url, layout_type);
            if (new_url != '')
                icon_url = new_url;

            var confirm_result = this._textDevolveResult.Unknow;
            if (log_data.CONFIRM_RESULT == "Accept")
                confirm_result = this._textDevolveResult.Accept;
            if (log_data.CONFIRM_RESULT == "Reject")
                confirm_result = this._textDevolveResult.Reject;

            var data = {
                user_guid: log_data.USER_GUID,
                user_name: log_data.USER_NAME,
                time: time_str,
                log_id: log_data.LOG_ID, icon_url: icon_url,
                target_name: log_data.TARGET_NAME,
                context: PT_HtmlEncode(log_data.CONTEXT),
                confirm_result: confirm_result,
                text_assign_to: this._textDevolveAssignTo,
                text_status: this._textDevolveStatus
            };
            content_html = PT_HtmlRender(this._template_other_devolve, data);
        }
    }

    var html = '';
    html += "<table padding=\"0\" class=\"log_item\" width='100%' data-log-id='" + log_data.LOG_ID + "' ";
    if (block_id != "")
        html += "id=\"" + block_id + "\" ";
    html += "><tr><td style='width:100%' align='" + self_align + "'>\r\n";
    html += content_html;
    html += "</td></tr></table>";

    var block = $(html);

    //===== 設定 block 的 photo load 事件 (other block 需顯示對方照片)==========
    if (block.find(".block_photo").length > 0) {
        var img = block.find(".block_photo").eq(0);
        var make_load_func = function (sender, img) {
            return function () {
                sender._blockPhotoLoad(img);
            }
        }
        img.load(make_load_func(this, img));

        var make_click_func = function (sender, img) {
            return function () {
                sender._blockPhotoClick(img);
            }
        }
        img.click(make_click_func(this, img));
        img.attr("src", this._imageRootPath + "/M_UChat_DefaultPhoto.png");        
    }

    //===== 設定 block 的 icon load 事件 =====
    if (block.find(".block_icon").length > 0) {
        var img = block.find(".block_icon").eq(0);
        var make_load_func = function (sender, img) {
            return function () {
                sender._blockIconLoad(img);
            }
        }
        img.load(make_load_func(this, img));
    }

    //===== 設定 block 的 emoticon onload 事件 (如果是 Emoticon)=====
    if (block.find(".block_emoticon").length > 0) {
        var img = block.find(".block_emoticon").eq(0);
        var make_load_func = function (sender, img) {
            return function () {
                sender._blockEmoticonLoad(img);
            }
        }

        img.load(make_load_func(this, img));
    }

    //===== 設定 block 的 file image load, error, click 事件 (如果是 File Image)==========
    if (block.find(".block_file_image").length > 0) {
        var img = block.find(".block_file_image").eq(0);
        var make_load_func = function (sender, img) {
            return function () {
                sender._blockFileImageLoad(img);
            }
        }

        var make_error_func = function (sender, img) {
            return function () {
                sender._blockFileImageError(img);
            }
        }

        var make_click_func = function (sender, logId, fileId, previewFileId) {
            return function () {
                sender._blockFileImageClick(logId, fileId, previewFileId);
            }
        }

        img.load(make_load_func(this, img));
        img.error(make_error_func(this, img));
        img.click(make_click_func(this, log_data.LOG_ID, log_data.FILE_ID, log_data.PREVIEW_FILE_ID));
    }

    //===== 設定 devolve block 的 click 事件 =====
    if (block.find(".block_devolve").length > 0) {
        var elm = block.find(".block_devolve").eq(0);
        var make_click_func = function (sender, logId) {
            return function () {
                sender._blockDevolveClick(logId);
            }
        }

        elm.click(make_click_func(this, log_data.LOG_ID));
    }

    //===== 設定 file audio block 的 click 事件 =====
    if (block.find(".block_file_audio").length > 0) {
        var elm = block.find(".block_file_audio").eq(0);
        var make_click_func = function (sender, logId, fileId) {
            return function () {
                sender._blockFileAudioClick(logId, fileId);
            }
        }

        elm.click(make_click_func(this, log_data.LOG_ID, log_data.FILE_ID));
    }

    //===== 設定 file video block 的 click 事件 =====
    if (block.find(".block_file_video").length > 0) {
        var elm = block.find(".block_file_video").eq(0);
        var make_click_func = function (sender, logId, fileId) {
            return function () {
                sender._blockFileVideoClick(logId, fileId);
            }
        }

        elm.click(make_click_func(this, log_data.LOG_ID, log_data.FILE_ID));
    }

    //===== 設定 file misc block 的 click 事件 =====
    if (block.find(".block_file_misc").length > 0) {
        var elm = block.find(".block_file_misc").eq(0);
        var make_click_func = function (sender, logId, fileId, fileName) {
            return function () {
                sender._blockFileMiscClick(logId, fileId, fileName);
            }
        }

        elm.click(make_click_func(this, log_data.LOG_ID, log_data.FILE_ID, log_data.FILE_NAME));
    }


    return block;
}


BlockViewer.prototype._createSystemBlock = function (log_data) {
    var CREATE_DATE = log_data["CREATE_DATE"];
    var create_date = PT_ParseNetTimeOffset(CREATE_DATE);
    var create_date_str = log_data["CREATE_DATE_DISPLAY_TIME"];
    var COMPLEX_DATA = log_data["COMPLEX_DATA"];
    var items = COMPLEX_DATA.split(',');

    //"USER1 邀請 USER2 加入聊天室" => Invite,[USER1_USER_GUID],[USER1_USER_NAME],[USER2_USER_GUID],[USER2_USER_NAME]
    //"USER1 加入聊天室" => Accept,[USER1_USER_GUID],[USER1_USER_NAME]
    //"USER1 已取消 USER2 的邀請" => Reject,[USER1_USER_GUID],[USER1_USER_NAME],[USER2_USER_GUID],[USER2_USER_NAME]
    //"USER1 已退出聊天室" => Exit,[USER1_USER_GUID],[USER1_USER_NAME]
    //"USER1 已讓 USER2 退出聊天室" => Kickout,[USER1_USER_GUID],[USER1_USER_NAME],[USER2_USER_GUID],[USER2_USER_NAME]

    var context = "";
    context += create_date_str + "<BR>\r\n";

    switch (items[0]) {
        case "Invite":
            context += PT_HtmlRender(this._textSystemLogTemplate.Invite, { USER1: items[2], USER2: items[4] });
            break;
        case "Accept":
            context += PT_HtmlRender(this._textSystemLogTemplate.Accept, { USER1: items[2] });
            break;
        case "Reject":
            context += PT_HtmlRender(this._textSystemLogTemplate.Reject, { USER1: items[2], USER2: items[4] });
            break;
        case "Exit":
            context += PT_HtmlRender(this._textSystemLogTemplate.Exit, { USER1: items[2] });
            break;
        case "Kickout":
            context += PT_HtmlRender(this._textSystemLogTemplate.Kickout, { USER1: items[2], USER2: items[4] });
            break;
        default:
            context += "Not implement system log !\r\n" + COMPLEX_DATA;
            break;
    }

    var data = { log_id: log_data["LOG_ID"], context: context };
    var html = PT_HtmlRender(this._template_system, data);
    return html;
}

// block 的 photo.load 事件處理
BlockViewer.prototype._blockPhotoLoad = function (img) {

    if (typeof (img.data("load-done")) != 'undefined') {
        this._log("img.url[" + img.prop("src") + "] load done !");
        return;
    }

    // 清除 onload, onerror event
    img.unbind("load");
    img.unbind("error");

    img.bind("load", function () {
        // 清除 onload, onerror event
        $(this).unbind("load");
        $(this).unbind("error");

        // 設定圖片載入結束 (for BlockRender)
        $(this).data("render-done", true);
    });

    var make_error_func = function (sender, img) {
        return function () {
            // 清除 onload, onerror event
            img.unbind("load");
            img.unbind("error");

            img.prop("src", sender._imageRootPath + "/M_UChat_DefaultPhoto.png");

            // 設定圖片載入結束 (for BlockRender)
            img.data("render-done", true);
        }
    };

    img.bind("error", make_error_func(this, img));

    //m_ChatLink.notifyLoad();    // 通知 ChatLink 將要使網路連線 (讀取圖片)
    var url = "UserPhoto.aspx?id=" + img.data("user-guid");
    img.prop("src", url);
}

BlockViewer.prototype._blockPhotoClick = function (img) {

    if (typeof (this._photoClick) != "undefined") {
        var user_guid = img.data("user-guid");
        try {
            this._photoClick(user_guid);
        } catch (e) {
            this._log("_blockPhotoClick() exception !\r\nimg.src=[" + img.prop("src") + "]\r\n" + e);
        }
    }
}

// block 的 icon.load 事件處理
BlockViewer.prototype._blockIconLoad = function (img) {
    // 設定圖片載入結束 (for BlockRender)
    $(img).data("render-done", true);
}

// block 的 emoticon.load 事件處理
BlockViewer.prototype._blockEmoticonLoad = function (img) {

    var org_size = PT_GetImageNaturalSize(img[0]);

    var width_50p = $('#width_50p_div').width();    // 此處需要再重構...????

    // 圖片寬度調整
    if (org_size.width > width_50p)
        $(img).width(width_50p);    // 不能超過 layout 50%
    else
        $(img).width(org_size.width);   // 未超過者以原尺寸顯示

    // 設定圖片載入結束
    $(img).data("render-done", true);
}

// block 的 fileImage.load 事件處理
BlockViewer.prototype._blockFileImageLoad = function (img) {

    var org_size = PT_GetImageNaturalSize(img[0]);
    var width_50p = $('#width_50p_div').width();

    // 圖片寬度調整
    if (org_size.width > width_50p)
        $(img).width(width_50p);    // 不能超過 layout 50%
    else
        $(img).width(org_size.width);   // 未超過者以原尺寸顯示

    // 設定圖片載入結束 (for BlockRender)
    $(img).data("render-done", true);
}

// block 的 fileImage.error 事件處理
BlockViewer.prototype._blockFileImageError = function (img) {
    // 找不到圖片
    img[0].width = null;
    var url = this._imageRootPath + "/M_UChat_NotFound.png";
    var new_url = PT_GetResizeUrl(url, layout_type);
    if (new_url != '' && new_url != url)
        url = new_url;
    img.src = url;

    // 設定圖片載入結束 (for BlockRender)
    $(img).data("render-done", true);
}

// devolve Block 的 click 事件處理
BlockViewer.prototype._blockFileImageClick = function (logId, fileId, previewFileId) {
    if (typeof (this._fileImageClick) != "undefined") {
        try {
            this._fileImageClick(logId, fileId, previewFileId);
        } catch (e) {
            this._log("_blockFileImageClick() exception !\r\nlogId=[" + logId + "]\r\n" + e);
        }
    }
}

// devolve Block 的 click 事件處理
BlockViewer.prototype._blockDevolveClick = function (logId) {
    if (typeof (this._devolveClick) != "undefined") {
        try {
            this._devolveClick(logId);
        } catch (e) {
            this._log("_blockDevolveClick() exception !\r\nlogId=[" + logId + "]\r\n" + e);
        }
    }
}

// file audio Block 的 click 事件處理
BlockViewer.prototype._blockFileAudioClick = function (logId, fileId) {
    if (typeof (this._fileAudioClick) != "undefined") {
        try {
            this._fileAudioClick(logId, fileId);
        } catch (e) {
            this._log("_blockFileAudioClick() exception !\r\nfileId=[" + fileId + "]\r\n" + e);
        }
    }
}

// file video Block 的 click 事件處理
BlockViewer.prototype._blockFileVideoClick = function (logId, fileId) {
    if (typeof (this._fileVideoClick) != "undefined") {
        try {
            this._fileVideoClick(logId, fileId);
        } catch (e) {
            this._log("_blockFileVideoClick() exception !\r\nfileId=[" + fileId + "]\r\n" + e);
        }
    }
}

// file misc Block 的 click 事件處理
BlockViewer.prototype._blockFileMiscClick = function (logId, fileId, fileName) {
    if (typeof (this._fileMiscClick) != "undefined") {
        try {
            this._fileMiscClick(logId, fileId, fileName);
        } catch (e) {
            this._log("_blockFileMiscClick() exception !\r\nfileId=[" + fileId + "]\r\nfileName=[" + fileName + "]\r\n" + e);
        }
    }
}

// 將 Block 的 Context 有 URL 部份轉成 URL
BlockViewer.prototype._blockTextToUrl = function (context) {

    var html = PT_HtmlEncode(context);

    var regex = new RegExp("https?:\/\/[^\\s]+", "ig");

    // 將 URL 取出加上 A Tag
    var html = html.replace(regex, function (match) {
        var url = "<a href=\"" + match + "\" target=\"_blank\" >" + PT_HtmlEncode(match) + "</a>";
        return url;
    });

    html = html.replace("\r\n", "<BR>\r\n");
    return html;
}
