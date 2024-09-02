var webcache = function () {
    ///<summary>Web 的 Cache 物件, 用來給需要快取功能, 與單一下載工作的程式使用</summary>

    //===== define private property =====
    var _this = this;
    _this._ajax = null;
    _this._load_list = [];
    _this._wait_list = [];

    _this._load_callback = null;
    _this._error_callback = null;

    // initial    
    _this.init = function (all_item_list, load_callback, error_callback) {
        ///<summary>初始化物件</summary>
        ///<param name="all_item_list">全部可能載入的 URL 物件清單, item 需要有 url 屬性, Ex: [{url:'a.gif',id:1},{url:'b.png',id:2}</param>
        ///<param name="load_callback">載入單一 URL 後觸發的處理函式, Ex: function(item, response, statusText, xhr){}</param>
        ///<param name="error_callback">載入單一 URL 失敗時的處理函式, Ex: function(item, xhr, statusText, throwError){}</param>
        ///<returns>N/a</returns>

        // initial load_list
        for (var i = 0 ; i < all_item_list.length ; i++) {
            var item = all_item_list[i];
            _this._load_list.push([item, false]);
        }

        if (typeof (load_callback) == 'function')
            _this._load_callback = load_callback;

        if (typeof (error_callback) == 'function')
            _this._error_callback = error_callback;
    };

    //===== public method =====    

    // request
    _this.request = function (item_list) {
        ///<summary>執行 URL 清單載入</summary>
        ///<param name="item_list">立刻執行載入的 URL 物件清單, Ex: [{url:'a.gif',id:1},{url:'b.png',id:2}</param>        
        ///<returns>N/a</returns>

        // 強迫中止 ajax 執行, 避免 Request 卡住
        if (_this._ajax != null) {
            //_this._ajax.abort();
            _this._ajax = null;
        }

        // 重建 wait_list
        _this._wait_list = [];

        // 檢查 URL 是否已經載入
        for (var i = 0 ; i < item_list.length ; i++) {
            var item = item_list[i];
            var url = item.url;

            // 比對 URL 是否載入
            var found_item = null;
            for (var j = 0 ; j < _this._load_list.length ; j++) {
                var state = _this._load_list[j];
                if (state[0].url == item.url && state[1] == true) {
                    found_item = state[0];
                    break;
                }
            }

            if (found_item != null)
                _this._load_callback(found_item, null, null, null);   // 已經載入者, 執行 callback
            else
                _this._wait_list.push(item_list[i]);    // 未載入者, 加入等待載入清單
        }


        // 如果有尚未讀入的 URL 則繼續載入
        if (_this._wait_list.length > 0)
            _this._continue_load();
    };

    // 載入等待中的 URL Item 清單
    _this._continue_load = function () {

        var item = _this._wait_list.shift();
        if (typeof (item) == 'undefined')
            return; // 全部載入完畢               

        _this._ajax = $.ajax({
            url: item.url,
            ajax: true,
            async: true,
            cache: true,
            error: _this._ajax_item_error(item),
            success: _this._ajax_item_load(item)
        });
    };

    _this._ajax_item_error = function (item) {
        return function (xhr, statusText, throwError) {
            if (xhr.status == 0)
                return null;

            if (_this._error_callback == null) {
                // 未使用 callback 則顯示預設的錯誤訊息
                var errstr = "URL load error !\r\n";
                errstr += "url: [" + item.url + "]\r\n";
                errstr += "readyState: " + xhr.readyState + "\r\n";
                errstr += "status: " + xhr.status + "\r\n";
                errstr += "statusText: " + xhr.statusText + "\r\n";
                errstr += "responseText:\r\n" + xhr.responseText;
                alert(errstr);
            }
            else {
                _this._error_callback(item, xhr, statusText, throwError);
            }

            _this._ajax = null; // reset ajax

            // 繼續處理未讀完的圖片
            _this._continue_load();
        };
    }

    _this._ajax_item_load = function (item) {
        return function (response, statusText, xhr) {

            // 設定 Item 為已經載入
            for (var i = 0 ; i < _this._load_list.length; i++) {
                var state = _this._load_list[i];
                if (state[0].url == item.url)
                    state[1] = true;
            }

            // 執行 Callback
            if (_this._load_callback != null)
                _this._load_callback(item, response, statusText, xhr);

            _this._ajax = null; // reset ajax

            // 繼續處理未讀完的圖片
            _this._continue_load();
        };
    };

}

