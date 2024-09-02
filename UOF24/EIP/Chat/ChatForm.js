



//===== Ajax 物件 =====

var PT_Ajax = function () {
    /// <summary>
    /// Ajax 物件, 用來呼叫 Server 端的 Method
    /// </summary>

    var post;
};

PT_Ajax.post = function (
    url,
    send_data,
    success_callback,
    failure_callback) {    
    /// <summary>
    /// 發送 POST 到 Server 端
    /// </summary>
    /// <param name="url" type="String">容器 DOM 物件的 id</param>
    /// <param name="send_data" type="Object">POST 的欄位值物件</param>
    /// <param name="success_callback" type="Function">成功後呼叫</param>
    /// <param name="failure_callback" type="Function">失敗後呼叫</param>    
    var data = {};
    if (typeof (send_data) != undefined && send_data != null)
        data = send_data;

    var request = $.ajax({
        url: url,
        type: "POST",
        data: data,
        dataType: "json",
        cache: false,
        error: function (xhr, ajaxOptions, thrownError) {
            if (typeof (failure_callback) != undefined && failure_callback != null) {
                failure_callback(xhr, ajaxOptions, thrownError);
            }
            else {
                alert("Ajax Error !\r\n" +
                        "readyState: " + xhr.readyState + "\r\n" +
                        "status: " + xhr.status + "\r\n" +
                        "statusText: " + xhr.statusText + "\r\n" +
                        "responseText:\r\n" + xhr.responseText);
            }
        },
        success: function (response, textStatus, xhr) {                                    
            var o = response;
            success_callback(o);
        }
    });

    return request;
};



//===== ImageTab 物件 =====

function ImageTab(id, tab_items, item_click, item_cancel) {
    /// <summary>
    /// ImageTab 用來產生, 操作 Image 的 Tab Control
    /// </summary>
    /// <param name="id" type="String">容器 DOM 物件的 id</param>
    /// <param name="tabItems" type="Object">Table 的內容物件</param>
    /// <param name="itemClick" type="Function">Item 點擊後觸發</param>
    /// <param name="itemCancel" type="Function">點擊後沒有選取 Item 後觸發</param>

    this.containerId = id;
    this.container = $('#' + this.containerId);
    this.tabItems = tab_items;
    this.itemClick = item_click;    // function(imageTab, key, tag){}
    this.itemCancel = item_cancel;  // 沒有選取時觸發

    // tab_item 範例 :
    // var tab_value = {
    //     tab: { url: '1.png', key: 'emoticon', tag: '', title: '' },
    //     items: [
    //         { url: '1.png', key: 'emoticon', tag: '1.png', title: '' },
    //         { url: '2.png', key: 'emoticon', tag: '1.png', title: '' }
    //     ]
    // };
    //
    //var tab_items = [tab_item];

    // 執行初始化
    if (true) {
        var html = '';

        // 產生 Tab Control
        html += "<div class=\"height_50\" style=\"border:1px solid black; width:100%; overflow:auto; background-color:white\">\r\n";
        for (var i = 0 ; i < tab_items.length ; i++) {
            html += "<img src=\"" + tab_items[i].tab.url + "\"  class=\"height_42\" style=\"margin-top:2px\" />\r\n";
        }
        html += "</div>";

        // 產生 Tab Container
        html += "<div class=\"height_150\" style=\"border:solid 1px gray; width:100%; overflow:scroll; background-color:white\"></div>";

        // 產生放大效果用的隱藏圖片
        html += "<img class=\"height_50\" style=\"background:white;position:absolute;display:block;border:1px solid gray;\" />";

        this.container.css("display", "none");  // 一開始先隱藏
        this.container.width("100%");
        this.container.css("position", "fixed");
        this.container.html(html);

        for (var i = 0 ; i < tab_items.length ; i++) {
            var tab_img = this.container.children().eq(0).children().eq(i);

            // 因為要儲存 index 到 function, 所以使用閉包技巧
            var make_click_func = function (imageTab, index) {
                return function () {
                    imageTab.switchByIndex(index);
                };
            };
            var click_func = make_click_func(this, i);            
            tab_img.click(click_func);
        }

        var tab_container = this.container.children().eq(1);
        tab_container.scroll(function (sender) {
            return function () {                
                // 隱藏 float image
                var float_img = sender.container.children().eq(2);
                float_img.css("display", "none");
            }
        }(this));

        // 設定 float_img click 事件
        var float_img = this.container.children().eq(2);

        var make_float_img_click = function (imageTab) {
            return function () {
                // 關閉 mask, 隱藏 Tab
                var mask_id = "_JT_ImageTabMaskDiv";
                $('#' + mask_id).remove();
                imageTab.container.css("display", "none");
                var key = $(this).data("key");
                var tag = $(this).data("tag");

                if (typeof (imageTab.itemClick) != 'undefined')
                    imageTab.itemClick(imageTab, key, tag); // 執行 Callback
            }
        };
        float_img.click(make_float_img_click(this));
    }

    // 切到預設值
    if (this.tabItems.length > 0)
        this.switchByIndex(0);
}

ImageTab.prototype.show = function () {
    /// <summary>
    /// 顯示 TabControl
    /// </summary>    

    // 加上 Mask 功能
    var mask_id = "_JT_ImageTabMaskDiv";
    if (document.getElementById(mask_id) == null) {
        var html = "";
        html += "<div id='" + mask_id + "' class=\"alpha_30\" ";
        html += "style=\"width:100%; height:100%; position:fixed; top:0px; left:0px; background-color:gray;\" ></div>";
        document.body.insertAdjacentHTML('beforeEnd', html);

        var make_close_func = function (sender, mask_id) {
            return function () {
                $('#' + mask_id).remove();
                sender.container.css("display", "none");
                if (typeof (sender.itemCancel) != 'undefined' && sender.itemCancel != null)
                    sender.itemCancel();                
            }
        };
        var func = make_close_func(this, mask_id);
        $('#' + mask_id).click(func);
    }

    $('#' + mask_id).css("zIndex", "998");    
    this.container.css("display", "");    
    this.container.css("zIndex", "999");

    // 隱藏 float image
    var float_img = this.container.children().eq(2);
    float_img.css("display", "none");    
}

ImageTab.prototype.switchByKey = function (key) {
    /// <summary>
    /// 根據 Tab Key 作切換
    /// </summary>
    /// <param name="key" type="String">Tab 的 key 值</param>
    
    // find tab_index from key
    var tab_index = -1;
    for (var i = 0 ; i < this.tabItems.length ; i++) {
        if (this.tabItems[i].tab.key == key)
            tab_index = i;
    }

    this.switchByIndex(tab_index);    
}

ImageTab.prototype.switchByIndex = function (index) {
    /// <summary>
    /// 根據 Tab Index 作切換
    /// </summary>
    /// <param name="index" type="Integer">Tab 的索引值</param>

    if (index < 0 || index >= this.tabItems.length)
        return;

    var tab_index = index;

    // 重建所有 items
    if (tab_index != -1) {
        // 畫 Tab 外框
        for (var i = 0 ; i < this.tabItems.length ; i++) {
            var tab_img = this.container.children().eq(0).children().eq(i);
            if (i == tab_index)
                tab_img.css("border", "1px solid black");   // 畫 Tab Selected 外框
            else
                tab_img.css("border", "");  // 清除外框
        }

        var items_area = this.container.children().eq(1);
        items_area.html("");    // 清除 Items 

        // 重建所有 items
        var html = "";
        for (var i = 0 ; i < this.tabItems[tab_index].items.length ; i++) {
            var item = this.tabItems[tab_index].items[i];
            html += "<img src=\"" + item.url + "\" class=\"height_48\" >";
        }

        items_area.html(html);

        // 設定 item 的 click event 與 title
        for (var i = 0 ; i < this.tabItems[tab_index].items.length ; i++) {
            var item_img = items_area.children().eq(i);
            var key = this.tabItems[tab_index].items[i].key;
            var tag = this.tabItems[tab_index].items[i].tag;
            var title = this.tabItems[tab_index].items[i].title;


            // 閉包 function, 因為要保存參數
            var make_click_func = function (imageTab, key, tag) {
                return function () {                    
                    //===== 顯示點擊後的浮動 Image =====
                    // 計算浮動 Image 的 Style
                    var left = $(this).position().left;
                    var top = $(this).position().top;
                    var width = $(this).width();
                    var height = $(this).height();

                    var new_width = width * 150 / 100;
                    var new_height = height * 150 / 100;
                    left = left - (new_width - width) / 2;
                    top = top - (new_height - height) / 2;

                    var float_img = imageTab.container.children().eq(2);    // 取出 float iamge
                    float_img.data("key", key); // 將 key 存到 image
                    float_img.data("tag", tag); // 將 tag 存到 image

                    // 設定浮動 Image 的 Style
                    float_img.css("position", "absolute");
                    float_img.css("display", "block");
                    float_img.css("left", left);
                    float_img.css("top", top);
                    float_img.css("width", new_width);
                    float_img.css("height", new_height);
                    float_img.attr("src", $(this).attr("src"));

                }
            }
            var click_func = make_click_func(this, key, tag);

            item_img.click(click_func);
            if (typeof (title) != 'undefined' && title != '')
                item_img.prop("title", title);
        }
    }

    // 隱藏 float image
    var float_img = this.container.children().eq(2);
    float_img.css("display", "none");
};


//===== PopupMenu 物件 =====

function PopupMenu(args) {
    /// <summary>
    /// PopupMenu 用來產生彈出選單, 點擊以執行自定 Script 的物件
    /// </summary>
    /// <param name="args" type="Object">初始化參數, Ex:
    /// var args = {
    ///     containerId: "module_div",
    ///     itemClick: module_click,
    ///     items: [
    ///         { title: "Add Devolve", key: "Devolve", tag: "" }
    ///     ]
    /// };
    /// </param>
    
    this.containerId = args.containerId;
    this.container = $('#' + args.containerId);
    this.itemClick = args.itemClick;
    this.items = args.items;    // title, key, tag

    //參數範例 :
    //var args = {
    //    containerId: "module_div",
    //    itemClick: module_click,
    //    items: [
    //        { title: "新增交辦", key: "Devolve", tag: "" }
    //    ]
    //};

    // 初始化
    if (true) {
        // 建立 UI HTML
        var html = "";
        html += "<table class=\"normal_label\" cellpadding=\"10\" style=\"background-color:white; border:1px solid black\">";
        html += "<tbody>";

        for (var i = 0 ; i < this.items.length ; i++) {
            var item = this.items[i];
            html += "<tr style=\"border-bottom: 1px solid #fff0d5; background-color: #666666;\" >";
            html += "<td>";
            html += "<label style=\"cursor:pointer; color:white\">" + PT_HtmlEncode(item.title) + "</label>";
            html += "</td>";
            html += "</tr>";
        }

        html += "<tbody>";
        html += "</table>";

        this.container.html(html);

        // 設定 Item Click 事件            
        var make_click_func = function (sender, item) {
            return function (key, tag) {
                var mask_id = "_JT_PopupMaskDiv";
                $('#' + mask_id).remove();
                sender.container.css("display", "none");
                sender.itemClick(item.key, item.tag);
            }
        }

        var tbody = this.container.children("table").eq(0).children("tbody").eq(0);
        var tr_list = tbody.children("tr");
        for (var i = 0 ; i < tr_list.length ; i++) {
            var func = make_click_func(this, this.items[i]);
            tr_list.eq(i).click(func);
        }

        this.container.css("position", "fixed");
        this.container.css("display", "none");
    }

}

// 彈出選單
PopupMenu.prototype.popup = function () {
    /// <summary>
    /// 彈出選單
    /// </summary>
    
    // 加上 Mask 功能
    var mask_id = "_JT_PopupMaskDiv";
    if (document.getElementById(mask_id) == null) {
        var html = "";
        html += "<div id='" + mask_id + "' class=\"alpha_30\" ";
        html += "style=\"width:100%; height:100%; position:fixed; top:0px; left:0px; background-color:gray;\" ></div>";
        document.body.insertAdjacentHTML('beforeEnd', html);

        var make_close_func = function (sender, mask_id) {
            return function () {
                $('#' + mask_id).remove();
                sender.container.css("display", "none");
            }
        };
        var func = make_close_func(this, mask_id);
        $('#' + mask_id).click(func);

    }

    $('#' + mask_id).css("zIndex", "998");
    this.container.css("display", "");
    this.container.css("zIndex", "999");
};



//===== MainMenu 物件 =====

function MainMenu(args) {
    /// <summary>
    /// MainMenu 用來彈出主選單, 點擊 Item 以執行自定 Script 的物件
    /// </summary>
    /// <param name="args" type="Object">初始化參數, Ex:
    /// var args = {
    ///     containerId: "main_menu_div",
    ///     itemClick: function(key, tag) { alert('key=' + key); },
    ///     items: [
    ///         { title: "邀請成員", key: "Invite", tag: "" }
    ///      ]
    /// };
    /// </param>

    this._containerId = args.containerId;
    this._container = $('#' + args.containerId);
    this._itemClick = args.itemClick;
    this._items = args.items;    // title, key, tag

    //參數範例 :
    //var args = {
    //    containerId: "module_div",
    //     itemClick: function(key, tag) { alert('key=' + key); },
    //    items: [
    //        { title: "邀請成員", key: "Invite", tag: "" }
    //    ]
    //};

    // 初始化
    if (true) {

        //.menu_item {
        //    margin:0; 
        //    padding:0; 
        //    border-bottom: 1px solid #fff0d5; 
        //    background-color: #666666;
        //}       
        var menu_item_style = "margin:0; padding:0; border-bottom: 1px solid #fff0d5; background-color: #666666;";

        // 建立 Items 的 UI
        var html = "";
        for (var i = 0 ; i < this._items.length; i++) {
            html += "\r\n<div style=\"" + menu_item_style + "\">";
            html += "<label style=\"color:White;margin:0; padding: 10pt; display: block; text-decoration: none;\">" + PT_HtmlEncode(this._items[i].title) + "</label>";
            html += "</div>";
        }

        // 改造 DIV 成為 "<div class=\"normal_label\" style=\"position:fixed; margin:0px; list-style: none; width:100%; display:none;\">";
        this._container.addClass("normal_label");
        this._container.css("position", "fixed");
        this._container.css("margin", 0);
        this._container.css("listStyle", "none");
        this._container.width("100%");
        this._container.css("display", "none");

        // 存入 Items
        this._container.html(html);

        // 設定 Item Click 事件            
        var make_click_func = function (sender, index) {
            return function (key, tag) {
                sender._mask.remove();   // 移除 Mask
                sender._container.css("display", "none");    // 隱藏 MainMenu

                // 呼叫 Callback
                if (typeof (sender._itemClick) != 'undefined') {
                    var key = sender._items[index].key;
                    var tag = sender._items[index].tag;
                    sender._itemClick(key, tag);
                }
            }
        }

        var item_div_list = this._container.children();
        for (var i = 0 ; i < item_div_list.length ; i++) {
            var func = make_click_func(this, i);
            item_div_list.eq(i).click(func);
        }
    }
}

MainMenu.prototype.setItemVisible = function (key, tag, visible) {
    /// <summary>
    /// 根據 key, tag 的值, 指定選項是否可以顯示
    /// </summary>
    /// <param name="key" type="String">Item 的 Key 值</param>
    /// <param name="tag" type="String">Item 的 Tag 值</param>
    /// <param name="visible" type="Boolean">是否顯示 Item</param>

    var index = -1;
    for (var i = 0 ; i < this._items.length; i++) {
        var item = this._items[i];
        if (item.key == key && item.tag == tag) {
            index = i;
            break;
        }
    }
    if (index != null) {
        if (visible == true)
            this._container.children().eq(i).css("display", "block");
        else
            this._container.children().eq(i).css("display", "none");
    }

}

MainMenu.prototype.popup = function () {
    /// <summary>
    /// 彈出選單
    /// </summary>
    
    // 建立 Mask
    var mask_html = "";
    mask_html += "<div class=\"alpha_30\" ";
    mask_html += "style=\"width:100%; height:100%; position:fixed; top:0px; left:0px; background-color:gray;\" ></div>";
    var mask = $(mask_html);
    $(document.body).append(mask);  // Mask 加到 body

    this._mask = mask;   // 儲存 Mask 到 this

    // 設定 Mask Click Event
    var make_close_func = function (sender) {
        return function () {
            sender._mask.remove();   // 移除 Mask
            sender._container.css("display", "none");    // 隱藏 MainMenu
        }
    };
    var func = make_close_func(this);
    mask.click(func);

    this._mask.css("zIndex", "998");
    this._container.css("display", "");     // 顯示 MainMenu
    this._container.css("zIndex", "999");
};



//===== ScrollHandler 物件 =====

function ScrollHandler(args) {
    /// <summary>
    /// ScrollHandler 物件, 用來處理視窗捲動的上下讀取觸發物件
    /// </summary>
    /// <param name="args" type="Object">初始化參數, Ex:
    /// var args = { 
    ///     topHit: function() {},
    ///     bottomHit: function() {}
    /// };
    /// </param>

    // args 參數格式 :
    // var args = { 
    //     topHit: function() {},
    //     bottomHit: function() {}
    // };
    
    // 內部參數        
    this._topHit = args.topHit;
    this._topHitEnabled = true;
    this._bottomHit = args.bottomHit;
    this._bottomHitEnabled = true;

    this._timer = null;
    this._topTouchTime = null;      // Top 碰觸的計時器
    this._bottomTouchTime = null;   // Bottom 碰觸的計時器

    this._dectectEnabled = true;    // 用來作內部偵測 Event 的開關

    var make_timer_func = function (sender) {
        return function () {
            sender._timer_func(sender);
        }
    };
    this._timer = window.setInterval(make_timer_func(this), 200);

    var make_scroll_func = function (sender) {
        return function () {
            sender._scroll_func(sender);
        }
    }
    $(window).bind("scroll", make_scroll_func(this));
}


ScrollHandler.prototype._scroll_func = function (sender) {            
    
    if (this._dectectEnabled == false)
        return;

    // 設定上方接觸偵測 Timer
    if (this._topHitEnabled == true && this.isTop() == true) {
        sender._topTouchTime = new Date();
    }
    else {
        sender._topTouchTime = null;
    }

    // 設定下方接觸偵測 Timer            
    if (this._bottomHitEnabled == true && this.isBottom() == true) {
        sender._bottomTouchTime = new Date();
    }
    else {
        sender._bottomTouchTime = null;
    }
}

ScrollHandler.prototype._timer_func = function (sender) {

    if (sender._detectEnabled == false)
        return;

    // 偵測上方讀取事件
    if (sender._topTouchTime != null && sender._topHitEnabled == true) {
        var ts = ((new Date()).getTime() - sender._topTouchTime.getTime()) / 1000;
        if (ts > 0.3) {
            // 接觸超過 0.3 秒, 則觸發事件
            sender._topTouchTime = null;

            // 觸發上方碰觸事件
            if (typeof (sender._topHit) != "undefined" && sender._topHit != null) {
                this._dectectEnabled = false;   // callback 執行中, 不能偵測事件

                sender._topHit();  // 執行 callback

                // 為避免重覆觸發, 開啟 detect 必需要錯開一點點時間, 讓 scroll event 可以先 run
                var make_func = function (sender) {
                    return function () {
                        sender._dectectEnabled = true;
                    }
                }
                setTimeout(make_func(this), 200);                
            }
        }
    }

    // 偵測下方讀取事件
    if (sender._bottomTouchTime != null && sender._bottomHitEnabled == true) {
        var ts = ((new Date()).getTime() - sender._bottomTouchTime.getTime()) / 1000;
        if (ts > 0.3) {
            // 接觸超過 0.3 秒, 則觸發事件
            sender._bottomTouchTime = null;

            // 觸發下方碰觸事件
            if (typeof (sender._bottomHit) != "undefined" && sender._bottomHit != null) {
                this._dectectEnabled = false;   // callback 執行中, 不能偵測事件

                sender._bottomHit();    // 執行 callback

                // 未避免重覆觸發, 開啟 detect 必需要錯開一點點時間, 讓 scroll event 可以先 run
                var make_func = function (sender) {
                    return function () {
                        sender._dectectEnabled = true;
                    }
                }
                setTimeout(make_func(this), 200);
            }
        }
    }
}

ScrollHandler.prototype.topHitEnabled = function (v) {
    /// <summary>
    /// 取得或設定 topHit 是否觸發
    /// </summary>
    /// <param name="v" type="Boolean">是否觸發 topHit</param>
    
    if (typeof (v) == "undefined")
        return this._topHitEnabled;    

    this._topHitEnabled = v;

    if (v == false)
        this._topTouchTime = null;

    if (this._topHitEnabled == false && v == true)
        this._topTouchTime = null;

    this._topHitEnabled = v;
}

ScrollHandler.prototype.bottomHitEnabled = function (v) {
    /// <summary>
    /// 取得或設定 bottomHit 是否觸發
    /// </summary>
    /// <param name="v" type="Boolean">是否觸發 bottomHit</param>

    if (typeof (v) == "undefined")
        return this._bottomHitEnabled;

    
    if (v == false)
        this._bottomTouchTime = null;
    
    if (this._bottomHitEnabled == false && v == true)
        this._bottomTouchTime = null;
    
    this._bottomHitEnabled = v;
}

ScrollHandler.prototype.scrollTo = function (y, ms) {
    /// <summary>
    /// 捲動到 y 位置
    /// </summary>
    /// <param name="y" type="Integer">Y 軸位置</param>
    
    var make_func = function (y) {
        return function () {                        
            $("html,body").scrollTop(y);
        };
    }

    if (typeof (ms) != "undefined") {
        setTimeout(make_func(y), ms);
    }
    else {
        make_func(y)();
    }
}

ScrollHandler.prototype.scrollToTop = function (ms) {
    /// <summary>
    /// 捲動畫面到最上方
    /// </summary>
    /// <param name="ms" type="Integer">延遲執行的毫秒數</param>
    
    var func = function () {
        $("html,body").scrollTop(0);
    }

    if (typeof (ms) != 'undefined') {
        setTimeout(ms, func);
    } else {
        func();
    }

}

ScrollHandler.prototype.scrollToBottom = function (ms) {
    /// <summary>
    /// 捲動畫面到最下方
    /// </summary>
    /// <param name="ms" type="Integer">延遲執行的毫秒數</param>

    var func = function () {
        var y = $(document).height() - $(window).height();        
        $("html,body").scrollTop(y);
    }

    if (typeof (ms) != 'undefined') {
        setTimeout(func, ms);
    }
    else {
        func();
    }
}

ScrollHandler.prototype.scrollToOffset = function (dy, ms) {
    /// <summary>
    /// 依目前位置, 捲動到 Y 軸的 offset 的位移處
    /// </summary>
    /// <param name="dy" type="Integer">Y 軸的偏移值, 可以為負數</param>
    /// <param name="ms" type="Integer">延遲執行的毫秒數 (非必要)</param>

    var make_func = function (dy) {
        return function () {
            var y = $("html,body").scrollTop();
            y += dy;
            $("html,body").scrollTop(y);
        };
    }

    if (typeof (ms) != "undefined") {
        setTimeout(make_func(dy), ms);
    }
    else {
        make_func(dy)();
    }
}

ScrollHandler.prototype.isTop = function () {
    /// <summary>
    /// 捲軸是否捲到最上方
    /// </summary>

    if ($(window).scrollTop() == 0)
        return true;
    else
        return false;
}

ScrollHandler.prototype.isBottom = function () {
    /// <summary>
    /// 捲軸是否捲到最下方    
    /// </summary>

    var bottom_y = $(document).height() - $(window).height();   // 計算底部應該有的 scrollTop
    var dy = Math.abs($(window).scrollTop() - bottom_y);

    var height_offset = 3;
    if (this._isMobileBrowser() == true)    // 如果是一般的 Mobile 瀏覽器, 則因為 Title 會跑的關係, 偏移值要加到到 56 以上
        height_offset = 60;

    if (dy < height_offset)
        return true;

    return false;
}


ScrollHandler.prototype._isMobileBrowser = function () {
    var agent = navigator.userAgent || navigator.vendor || window.opera;   

    var func = function (a) {
        if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4)))
            return true;
        return false;
    }
    var result = func(agent);

    return result;
}




//===== HintBar 物件 =====

function HintBar(args) {
    /// <summary>
    /// HintBar 物件, 用來顯示提示的文字, 例如 : 被隱藏, 但已經接收到的訊息
    /// </summary>
    /// <param name="args" type="Object">
    /// {
    ///     containerId: "div1",
    //      textClick: function() {}
    /// }
    /// </param>

    this._containerId = args.containerId;
    this._container = $("#" + this._containerId);
    this._textClick = args.textClick;

    //===== init =====
    var html = "";

    // background
    html += "<div class=\"alpha_70 height_50 hint_bg\" ";
    html += "style=\"width:100%; background-color:#E0E0E0;border-top: 1px solid black;border-bottom: 1px solid black;\" ";
    html += ">&nbsp;</div>";

    // textbar
    html += "<table ";
    html += "width=\"100%\" class=\"height_50\" cellpadding=\"0\" cellspacing=\"0\" ";
    html += "style=\"position:absolute; top:0px\" ";
    html += ">";
    html += "<tr>";
    html += "<td ";
    html += "valign=\"middle\" class=\"large_label width_50 hint_down\" style=\"cursor:pointer;\" ";
    html += ">&nbsp;&nbsp;▼&nbsp;&nbsp;</td>";
    html += "<td ";
    html += "valign=\"middle\" nowrap ";
    html += "class=\"normal_label normal_height hint_text\" ";
    html += "style=\"color:black; width:100%;\" >&nbsp;";
    html += "</td>";
    html += "</tr></table>";

    // 設定 containter 的屬性
    // style="position:fixed; width:100%;"
    this._container.css("position", "fixed");
    this._container.css("width", "100%");
    this._container.css("display", "none");
    this._container.html(html);

    // 設定 down 的 click
    this._downContainer = this._container.find(".hint_down");
    var make_down_click_func = function (sender) {
        return function () {
            sender._hintDownClick();
        };
    }
    this._downContainer.click(make_down_click_func(this));

    this._textContainer = this._container.find(".hint_text");    // 取出 text container 物件      
    
    // 建立 text click click
    var make_text_click_func = function (sender) {
        return function () {
            sender._container.css("display", "none");   // 隱鑶 container

            // 執行 callback
            if (typeof (sender._textClick) != 'undefined' && sender._textClick != null) {                
                sender._textClick();                 
            }
        };
    }
    this._textContainer.click(make_text_click_func(this));

}

HintBar.prototype._hintDownClick = function () {
    this.hide();
}

HintBar.prototype.show = function (text) {
    /// <summary>
    /// 顯示 HintBar 與訊息
    /// </summary>
    /// <param name="text" type="String">要顯示的文字訊息</param>

    this._textContainer.text(text);
    if (this._container.css("display") != "none") {
        // 如果已經顯示, 則直接顯示
        this._container.css("display", "");     
    }
    else {
        // 如果隱藏, 則漸層顯示
        this._container.css("display", "none");
        this._container.fadeIn(500);
    }
}

HintBar.prototype.showHtml = function (html) {
    /// <summary>
    /// 顯示 HintBar 與 HTML 訊息
    /// </summary>
    /// <param name="text" type="String">要顯示的 HTML 內容</param>

    this._textContainer.html(html);

    if (this._container.css("display") != "none") {
        // 如果已經顯示, 則直接顯示
        this._container.css("display", "");
    }
    else {
        // 如果隱藏, 則漸層顯示
        this._container.css("display", "none");
        this._container.fadeIn(500);
    }
}

HintBar.prototype.hide = function () {
    /// <summary>
    /// 隱藏 HintBar
    /// </summary>

    if (this._container.css("display") == "none")
        return;

    this._container.fadeOut(200);
}


//===== ScreenMask 物件 =====

function ScreenMask(containerId) {
    /// <summary>
    /// ScreenMask 物件, 用來產生畫面遮罩, 鎖住 UI 無法點擊, 直到呼叫 hide() 為止
    /// </summary>
    /// <param name="containerId" type="String">遮罩物件的 id</param>

    this._containerId = containerId;
    this._container = $("#" + this._containerId);
    this._container.css("display", "none");

    this._running = false;
}

ScreenMask.prototype.show = function (label, ms) {
    /// <summary>
    /// 顯示遮罩, 鎖住 UI
    /// ps. 一旦此 method 被呼叫, 不論畫面有無改變, 畫面都會被鎖死無法操作, 直到呼叫 hide() 為止        
    /// </summary>
    /// <param name="label" type="String">顯示在遮罩上面的文字</param>
    /// <param name="ms" type="Integer">延遲畫面效果的毫秒數 (非必要)</param>

    if (typeof (label) == "undefined")
        label = "Loading...";

    var delay_ms = 0;
    if (typeof (ms) != "undefined")
        delay_ms = ms;

    this._container.html("");   // 清除原內容

    this._running = true;

    // 建立 Mask
    var mask_html = "";
    mask_html += "<div class=\"alpha_30\" ";
    mask_html += "style=\"width:100%; height:100%; position:fixed; top:0px; left:0px;\" ></div>";
    var mask = $(mask_html);

    // 建立 Label
    var label_html = "";
    label_html += "<div class=\"normal_label\" ";
    label_html += "style=\"width:100%; position:fixed; text-align:center; display:none;\" ";
    label_html += "><span style=\"background-color: #F0F0FF; border:1px solid black\">&nbsp;";
    label_html += label;
    label_html += "&nbsp;</span></div>";
    var label = $(label_html);

    var y = $(window).height();
    y = (y - $(label).height()) / 2;
    label.css("top", y);

    this._container.append(mask);
    this._container.append(label);

    // 以遮罩鎖住 UI
    mask.css("zIndex", "997");
    label.css("zIndex", "998");
    this._container.css("zIndex", "999");
    this._container.css("display", "");

    var make_time_func = function (sender) {
        return function () {
            sender._timeShow();
        }
    }

    setTimeout(make_time_func(this), delay_ms); // 如果超過 ms , 則開始畫面效果
}

ScreenMask.prototype._timeShow = function () {
    // 如果已經結束, 則不設定畫面效果
    if (this._running == false)
        return;

    // 產生畫面效果
    var mask = this._container.children().eq(0);
    var label = this._container.children().eq(1);

    mask.css("background-color", "gray");   // 設定 Mask 顏色
    label.css("display", "");   // 顯示 Label        
}

ScreenMask.prototype.hide = function () {
    /// <summary>
    /// 隱藏遮罩, 解除 UI 鎖定        
    /// </summary>

    // 清除 mask 與 label, 解除遮罩
    this._container.html("");

    this._running = false;
}


//===== BlockRender 物件 =====

function BlockRender(containerId) {
    /// <summary>
    /// 用來 Render Block 的物件, 在隱藏的地方把元素 Render 出來, 以取得正確的尺寸
    /// </summary>        
    /// <param name="o" type="Object">JQuery Element 或 HTML Code</param>        

    this._containerId = containerId;
    this._container = $('#' + this._containerId);

    // 將 container 設定在看不到的地方
    this._container.css("width", "100%");
    this._container.css("position", "fixed");
    this._container.css("display", "");
    this._container.css("right", "-4000px");

    this._timer = null;
    this._startTime = null;
    this._endTime = null;
    this._timeoutMs = 0;
    this._renderDone = null;
    this._unavailableList = [];
}

BlockRender.prototype.clear = function () {
    /// <summary>
    /// 將元素全部清空
    /// </summary>            

    if (this._timer != null) {
        console.log("[BlockRender]: renderForDone() is running !");
        return;
    }  

    if (this._timer != null)
        clearTimeout(this._timer);
    this._timer = null;
    this._unavailableList = [];
    this._container.html("");    
}


BlockRender.prototype.add = function (o) {
    /// <summary>
    /// 將元素, 或是 HTML 放到容器中        
    /// </summary>        
    /// <param name="o" type="Object">JQuery Element 或 HTML Code</param>        

    if (this._timer != null) {
        console.log("[BlockRender]: renderForDone() is running !");
        return;
    }

    this._container.append(o);
}

BlockRender.prototype.renderForDone = function (timeoutMs, renderDone) {
    /// <summary>
    /// 開始 Render, 直到 Timeout 或是所有子元素都 Render 結束,
    /// 子元素必需要在 Render 結束後, 寫入 data-render-done 在 DOM 的 Attribute, 才會被視為完成
    /// </summary>
    /// <param name="timeoutMs" type="Integer">超過此 ms 數, 則視為 Timeout</param>
    /// <param name="renderDone" type="Function">Render 結束或是 Timeout 會被呼叫</param>            

    try{

        if (this._timer != null) {
            this._log("renderForDone() : running !");
            return;
        }
        
        var imgList = this._container.find("img");
        for (var i = 0  ; i < imgList.length ; i++)
            this._unavailableList.push(imgList.eq(i));

        // 如果沒有任何元素, 直接 Callback
        if (this._unavailableList.length <= 0) {
            if (typeof (renderDone) != "undefined")
                renderDone(true);
            return;
        }        

        this._timeoutMs = timeoutMs;
        this._renderDone = renderDone;
        this._startTime = new Date();
    
        // 檢查所有圖片是否 Render 完畢
        this._timer_proc();        
    } catch (e) {
        this._log("renderForDone() exception !\r\n" + e);
    }
}

BlockRender.prototype._timer_proc = function () {

    // 忙碌檢查
    if (this._endTime != null) {
        var ds = (new Date()).getTime() - this._endTime.getTime();

        // 如果兩次執行檢查時間低於 250ms, 則不執行檢查, 以免太多時間花在檢查上, 而使得圖片一直無法載入
        if (ds < 250) {
            var make_timer_func = function (sender) {
                return function () {
                    sender._timer_proc();
                }
            }

            this._timer = setTimeout(make_timer_func(this), 250);
            return;
        }
    }


    // 檢查是否所有圖片子元素都 Render 完畢       
    var index = 0;
    while (index < this._unavailableList.length) {
        var img = this._unavailableList[index];

        if (img.data("render-done") == true) {
            this._unavailableList.splice(index, 1);
        }
        else {
            //console.log("IMG is loading ... IMG.src=" + img.attr("src"));
            index++;
        }
    }

    // 如果全部都 Render 結束
    if (this._unavailableList.length <= 0) {
        
        // 清除 Timer
        if (this._timer != null)
            clearTimeout(this._timer);
        this._timer = null;

        if (typeof (this._renderDone) != "undefined") {
            try{
                this._renderDone(true);
            } catch (e) {
                this._log("_timer_proc() : callback this._renderDone(true) exception !\r\n" + e);
            }
        }
                
        return;
    }

    // 檢查是否 Timeout
    var ts = (new Date().getTime() - this._startTime.getTime());

    // 如果 Timeout
    if (ts > this._timeoutMs) {

        for (var i = 0 ; i < this._unavailableList.length; i++) {
            console.log("[BlockRender] _timer_proc() : timeout, IMG.src=" + this._unavailableList[i].attr("src"));
        }

        // 清除 Timer
        if (this._timer != null)
            clearTimeout(this._timer);
        this._timer = null;

        if (typeof (this._renderDone) != "undefined") {
            try{
                this._renderDone(false);
            } catch (e) {
                this._log("_timer_proc() : callback exception !\r\n" + e);
            }
        }
        return;
    }

    // 繼續使用 Timeout 檢查所有 Block 是否 Render 完畢 (0.25 秒一次)
    var make_timer_func = function (sender) {
        return function () {
            sender._timer_proc();
        }
    }

    this._endTime = new Date(); // Timer 紀錄最後執行時間
    this._timer = setTimeout(make_timer_func(this), 250);
}

// 寫入 console log
BlockRender.prototype._log = function (msg) {
    var time = new Date();
    var hh = time.getHours(); if (hh < 10) hh = "0" + hh;
    var mm = time.getMinutes(); if (mm < 10) mm = "0" + mm;
    var ss = time.getSeconds(); if (ss < 10) ss = "0" + ss;
    var time_str = hh + ":" + mm + ":" + ss;
    try {
        console.log(time_str + " [BlockRender]: " + msg);
    } catch (e) { }  
}




//===== AttachUploader 物件 =====

function AttachUploader(args) {
    /// <summary>
    /// 檔案上傳物件
    /// </summary>
    /// <param name="args" type="Object">
    /// 格式 :
    /// {
    ///     containerId: "div1",
    ///     uploadType: "all", // 上傳格式 : all, select_image, take_image, take_video
    ///     fileSelected: function(sender, fileName, fileLength, contentType) { },     // 檔案選取完的 callback
    ///     fileUploaded: function(sender, fileGroupId, callId) { }                    // 檔案上傳後的 callback
    /// }
    /// </param>


    // 初始化參數格式
    // {
    //     containerId: "div1",
    //     uploadType: "all", // 上傳格式 : all, select_image, take_image, take_video
    //     fileSelected: function(sender, fileName, fileLength, contentType) { },     // 檔案選取完的 callback
    //     fileUploaded: function(sender, fileGroupId, callId) { }                    // 檔案上傳後的 callback
    // }

    // 設定參數
    this._containerId = args.containerId;
    this._container = $('#' + this._containerId);
    this._fileSelected = args.fileSelected;
    this._fileUploaded = args.fileUploaded;

    this._androidFileList = [];  // Android 的檔案選取清單

    //===== android 選完檔案的 callback =====
    this._androidSelectfileCallbackId = "selectFileCallback_" + (new Date()).getTime();

    // 建立 fileSelected callback 的閉包 function
    var make_fileselected_callback_func = function (sender) {
        return function (filesJson, key, tag) {
            sender._androidFileList = [];    // 清除 android 選取清單
            var files = jQuery.parseJSON(filesJson);
            if (files.length <= 0)
                return;

            var file = files[0];
            sender._androidFileList.push(file);  // 設定選取的檔案

            if (typeof (sender._fileSelected) != 'undefined' && sender._fileSelected != null) {
                sender._fileSelected(sender, file.name, file.size, file.type);
            }
        };
    };
    var func = make_fileselected_callback_func(this);

    window[this._androidSelectfileCallbackId] = func;   // 向 window 註冊 android select file callback function


    //===== android 上傳完檔案的 callback =====
    this._androidUploadfileCallbackId = "uploadFileCallback_" + (new Date()).getTime();

    // 建立 fileUploaded callback 的閉包 function
    var make_fileuploaded_callback_func = function (sender) {
        return function (fileGroupId, key, tag) {

            if (typeof (sender._fileUploaded) != 'undefined' && sender._fileUploaded != null) {
                var callId = key;
                sender._fileUploaded(sender, fileGroupId, callId);
            }
        };
    };
    var func = make_fileuploaded_callback_func(this);

    window[this._androidUploadfileCallbackId] = func;   // 向 window 註冊 android upload file callback function
}

AttachUploader.prototype.selectFile = function () {
    /// <summary>
    /// 執行選取上傳檔案
    /// ps. 使用 App (Android) 或 Web 執行
    /// </summary>

    //===== Android APP 的檔案上傳 =====
    if (PT_AndroidExist() == true) {
        // 沒有 jQuery 則無法正常運行
        if (typeof (jQuery) == 'undefined') {
            alert("Page without include jQuery, upload can not process !\r\nPlease contact your system designer.");
            return;
        }

        // 清除上傳暫存區
        uofapp_android.upload_init();   // Initial upload api

        var key = "";
        var tag = "";
        uofapp_android.upload_select_file(this._androidSelectfileCallbackId, key, tag); // 執行 App Function
        return;
    }

    //===== Web 版的檔案上傳 =====

    // 清除 內部 HTML Code
    this._container.html();

    // 建立新的 File
    var file_id = "F" + (new Date()).getTime();
    var html = "<INPUT TYPE=FILE id=\"" + file_id + "\" name=\"" + file_id + "\" />";

    this._container.html(html);

    var file = $('#' + file_id);

    // 建立 callback 的閉包 function
    var make_callback_func = function (sender) {
        return function () {
            var file_input = sender._container.find("input").eq(0);
            var file_id = file_input[0].id;
            var blob = file_input[0].files[0];

            var file_size = 0;
            if (typeof (blob.size) != 'undefined')
                file_size = blob.size;
            else if (typeof (blob.fileSize) != 'undefined')
                file_size = blob.fileSize;

            var file_name = blob.name;
            var content_type = blob.type;

            if (typeof (sender._fileSelected) != 'undefined' && sender._fileUploaded != null) {
                sender._fileSelected(sender, file_name, file_size, content_type);
            }
        };
    };
    var func = make_callback_func(this);

    file.change(func);      // 設定 file.onchange()

    // Click file 選檔案
    file.click();
};

AttachUploader.prototype.doUpload = function (callId) {
    /// <summary>
    /// 執行上傳檔案
    /// ps. 使用 App (Android) 或 Web 執行
    /// </summary>
    /// <param name="callId" type="String">呼叫的 ID (一般用來傳遞 DOM 物件的 id)</param>

    //===== Android 使用 App 上傳=====
    if (PT_AndroidExist() == true) {

        var id_list = [];
        for (var i = 0 ; i < this._androidFileList.length ; i++) {
            var local_id = this._androidFileList[i].local_id;
            id_list.push(local_id);
        }

        var jstr = JSON.stringify(id_list);    // 取出將上傳的檔案 JSON 清單
        var file_target = "UChat";
        var is_anonymous = "false";
        var is_image_hidden = "false";
        var callback_func_name = this._androidUploadfileCallbackId;
        var key = callId;
        var tag = "";

        try {
            uofapp_android.upload_execute(jstr, file_target, is_anonymous, is_image_hidden, callback_func_name, key, tag);
        } catch (ex) {
            alert("Android upload failure !\r\n" + ex);
        }

        return;
    }


    //===== 使用 Ajax 上傳檔案 =====
    var file = this._container.find("input").eq(0);
    var file_id = file[0].id;
    var blob = file[0].files[0];

    // 0 size 檔案無法上傳 (檔案真的是 0 byte, 或是無法讀取檔案)
    if (typeof (blob.size) != 'undefined') {
        var len = blob.size;
        if (len == 0) {
            var file_str = "";
            if (typeof (blob.name) != "undefined");
            file_str = "\r\nfile: " + blob.name;
            alert("0 size error !" + file_str);
            return;
        }
    }

    // 建立 Form 資料
    var formData = new FormData();
    formData.append(file_id, blob);

    // 建立 callback 的閉包 function
    var make_callback_func = function (sender, callId) {
        return function (response) {
            var rows = response;
            if (rows.length <= 0)
                return;

            var row = rows[0];

            var FILE_GROUP_ID = row["FILE_GROUP_ID"];

            if (typeof (sender._fileUploaded) != 'undefined' && sender._fileUploaded != null) {
                sender._fileUploaded(sender, FILE_GROUP_ID, callId);
            }
        };
    };
    var success_func = make_callback_func(this, callId);

    // 執行 Ajax 檔案上傳
    var args = {
        url: 'UChatAjax.aspx?method=AddFile',
        type: 'POST',
        data: formData,
        processData: false,  // tell jQuery not to process the data
        contentType: false,  // tell jQuery not to set contentType
        success: success_func,
        error: function (xhr, textStatus, errorThrown) {
            alert("UChatAjax.aspx : AddFile() error !\r\nStatus:" + xhr.status + "\r\n" + xhr.responseText);
        }
    };

    $.ajax(args);
}



//===== DebugConsole 物件 =====

function DebugConsole(containerId, dispatcherList, triggerId) {
    /// <summary>
    /// DebugConsole 用來顯示其他物件產生的 log 與狀態
    /// </summary>
    /// <param name="containerId" type="String">容器物件 id</param>
    /// <param name="dispatcherList" type="Object">    
    /// 產生 log 的物件清單
    /// [
    ///     { name: 'ChatLink', title: 'ChatLink' },
    ///     { name: 'BlockViewer', title: 'BlockViewer' }
    /// ]
    /// </param>
    /// <param name="triggerId" type="String">用來產生觸發用的 object</param>

    this._containerId = containerId;
    this._container = $("#" + this._containerId);

    this._triggerId = triggerId;
    this._trigger = $("#" + this._triggerId);
    this._triggerCount = 0;
    this._triggerTime = null;

    this._currentTab = "All";
    this._dispatcherList = [];

    // 加入 All item
    var all_tab = {
        name: "All",
        title: "All",
        status: "N/a",
        logList: []
    };
    this._dispatcherList.push(all_tab);

    // 加入 other item
    for (var i = 0 ; i < dispatcherList.length ; i++) {
        var o = {};
        o.name = dispatcherList[i].name;    // 名稱        
        o.title = dispatcherList[i].title;  // 顯示名稱
        o.status = "N/a";                   // 狀態內容
        o.logList = [];                     // 建立空的 buffer
        this._dispatcherList.push(o);
    }

    // 初始化 UI
    if (true) {
        var html = "";
        html += "<div class=\"alpha_70\" ";
        html += "style=\"position:fixed;top:100px; width:100%; border:1px solid black;\" ";
        html += " >";

        // tab bar
        html += "<table style=\"background-color:white;\">";
        html += "<tr>";
        for (var i = 0 ; i < this._dispatcherList.length ; i++) {
            var o = this._dispatcherList[i];
            html += "<td class=\"tab\" ";
            html += "style=\"border:1px solid gray;cursor:pointer;\" ";
            html += "data-name=\"" + this._htmlEncode(o.name) + "\" ";
            html += ">";
            html += "&nbsp;" + this._htmlEncode(o.title) + "&nbsp;";
            html += "</td>";
        }

        html += "</tr>";
        html += "</table>";

        // status bar
        html += "<div class=\"status\" ";
        html += "style=\";border:1px solid black;background-color:blue;color:white;font-size:12px;\" ";
        html += " >";
        html += "N/a";
        html += "</div>";

        // log bar
        html += "<div class=\"log\" ";
        html += "style=\";border:1px solid black;background-color:black;color:#FFFF00;font-size:12px;height:100%;overflow:scroll;\" ";
        html += " >";
        html += "N/a";
        html += "</div>";

        html += "</div>";
    }

    this._container.html(html);

    // 設定高度
    var main = this._container.children().eq(0);
    main.css("height", $(window).height() * 5 / 10);
    main.css("top", $(window).height() * 1 / 10);

    // 設定 tab item 事件
    var items = main.find(".tab");
    for (var i = 0; i < items.length ; i++) {
        var item = items.eq(i);

        var make_func = function (sender, name) {
            return function () {
                sender._tabClick(name);
            }
        }
        var func = make_func(this, item.data("name"));
        item.click(func);
    }

    // 設定預設 Tab
    this._currentTab = "All";
    this.selectTab("All");

    // 設定 trigger event
    var make_trigger_click = function (sender) {
        return function () {
            sender._triggerClick();
        }
    }

    this._trigger.click(make_trigger_click(this));

    // 一開始隱藏 Console log
    this.visible(false);
}

DebugConsole.prototype._triggerClick = function () {
    if (this._triggerTime == null) {
        this._triggerTime = new Date();
        this._triggerCount = 0;
        return;
    }

    var ts = (new Date().getTime() - this._triggerTime.getTime()) / 1000;
    if (ts > 2.0) {
        this._triggerTime = new Date();
        this._triggerCount = 0;
        return;
    }

    // 一秒內按下一次
    this._triggerTime = new Date();
    this._triggerCount++;
    if (this._triggerCount >= 5) {
        this.visible(!this.visible());
        this._triggerCount = 0;
    }
}

DebugConsole.prototype.visible = function (value) {
    /// <summary>
    /// 取得或設定顯示或隱藏物件
    /// </summary>
    /// <param name="value" type="Boolean">是否顯示 (非必要)</param>
    
    var main = this._container.children().eq(0);
    var v = true;
    if (main.css("display") == "none")
        v = false;

    if (typeof (value) == "undefined")
        return v;

    if (value == true) {
        // 產生 log html
        if (v == false) {
            this.selectTab(this._currentTab);
        }

        main.css("display", "");
    }
    else {
        main.css("display", "none");
    }
}

// 設定 status
DebugConsole.prototype.status = function (name, status) {
    var dispatcher = this._dispatcherByName(name);
    if (dispatcher == null)
        return;

    // 設定 status 內容
    dispatcher.status = status;

    // 更新 status UI
    var status_bar = this._container.find(".status").eq(0);
    var html = "";
    html += this._htmlEncode(status);
    status_bar.html(html);
}

// 寫入 log
DebugConsole.prototype.log = function (name, msg) {
    /// <summary>
    /// 寫入 log
    /// </summary>
    /// <param name="name" type="String">Dispatcher name</param>
    /// <param name="msg" type="String">訊息內容</param>

    var dispatcher = this._dispatcherByName(name);
    if (dispatcher == null)
        return;

    var console_line = { date: new Date(), message: msg };
    dispatcher.logList.push(console_line);

    // 超過 200 個 log 則移除
    if (dispatcher.logList.length > 200)
        dispatcher.logList.shift();

    // 寫入到 All
    var all_dispatcher = this._dispatcherList[0];
    all_dispatcher.logList.push(console_line);

    if (all_dispatcher.logList.length > 200 * this._dispatcherList.length)
        all_dispatcher.logList.shift();

    // 寫入到 Log 區 (可見才需要寫入)
    if (this.visible() == true) {
        if (this._currentTab == "All" || this._currentTab == name) {
            var log_area = this._container.find(".log").eq(0);
            var html = this._makeLogHtml(console_line);
            log_area.prepend(html);

            if (log_area.children().length > 200) {
                log_area.children().eq(log_area.children().length - 1).remove();
            }
        }
    }

}

DebugConsole.prototype._dispatcherByName = function (name) {
    for (var i = 0 ; i < this._dispatcherList.length ; i++) {
        var d = this._dispatcherList[i];
        if (d.name == name)
            return d;
    }
    return null;
}

DebugConsole.prototype._indexOfName = function (name) {
    for (var i = 0 ; i < this._dispatcherList.length ; i++) {
        var o = this._dispatcherList[i];
        if (o.name == name)
            return i;
    }
    return -1;
}

DebugConsole.prototype._tabClick = function (name) {
    this.selectTab(name);
}

// 選取 Tab
DebugConsole.prototype.selectTab = function (name) {
    /// <summary>
    /// 選取 Tab
    /// </summary>
    /// <param name="name" type="String">Dispatcher name</param>    

    var dispatcher = this._dispatcherByName(name);
    var index = this._indexOfName(name);
    var tabs = this._container.find(".tab");

    // 設定 tab high light
    for (var i = 0 ; i < tabs.length ; i++) {
        var tab = tabs.eq(i);
        tab.css("background-color", "white");

        if (i == index)
            tab.css("background-color", "yellow");
    }

    // 設定 status
    var status_bar = this._container.find(".status").eq(0);
    status_bar.html(this._htmlEncode(dispatcher.status));

    // 設定 log
    var log_area = this._container.find(".log").eq(0);
    var html = "";
    for (var i = dispatcher.logList.length - 1 ; i >= 0; i--) {
        html += this._makeLogHtml(dispatcher.logList[i]);
    }

    log_area.html(html);

    this._currentTab = name;
}

DebugConsole.prototype._makeLogHtml = function (consoleLine) {
    var time = consoleLine.date;
    var hh = time.getHours(); if (hh < 10) hh = "0" + hh;
    var mm = time.getMinutes(); if (mm < 10) mm = "0" + mm;
    var ss = time.getSeconds(); if (ss < 10) ss = "0" + ss;

    var time_str = hh + ":" + mm + ":" + ss;
    var str = "[" + time_str + "] " + consoleLine.message;
    str = this._htmlEncode(str);
    var html = "<div>";    
    html += str;    
    html += "</div>";    
    return html;
}

DebugConsole.prototype._htmlEncode = function (value) {    
    var html = $('<div/>').text(value).html();
    html = html.replace(/\r/g, "");
    html = html.replace(/\n/g, "<BR>");    
    return html;
}



function AppSuspendDetector(callback, second) {
    this._callback = callback;
    this._suspendSecond = second;
    this._lastSuspendTime = null;

    var v = PT_AndroidGetFrontActive();

    if (v == '')
        return; // 不支援

    var make_func = function (sender) {
        return function () {
            sender._timeProc();
        }
    };

    this._timer_id = setInterval(make_func(this), 1000);
}

AppSuspendDetector.prototype._timeProc = function () {
    var v = PT_AndroidGetFrontActive();

    try {
        if (v == "false") {
            // suspend 中...
            if (this._lastSuspendTime == null)
                this._lastSuspendTime = new Date().getTime();

            var ts = (new Date()).getTime() - this._lastSuspendTime;
            ts = ts / 1000;
            if (ts > this._suspendSecond) {
                this._lastSuspendTime = null;   // 清除計數器
                clearInterval(this._timer_id);
                this._callback();
            }
        }
        if (v == "true")
            this._lastSuspendTime = null;   // 作用中
    } catch (e) {
        alert('[AppSuspendDetector] _timeProc() : Exception !\r\n' + e);
    }
}
