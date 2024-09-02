var uofFile = function () {
    this.name = "";
    this.fileId = "";
    this.size = "";
    this.type = "";
    this.path = "";
    this.fileLink = "";
    this.IsInLocal = true;
};

var _uofUploader = _uofUploader || [];
//異地上傳需要用需要用 未來有修正再拿掉
var _uofFileCenterSource = _uofFileCenterSource || {}; // key:ClientID, value:$find(ClientID)
var $uof = {
    fixWkWebView: true, // 支援 18.5 之前的版本 iOS WebView 向下相容用註記
    //fileCenter 異地上傳需要用 未來有修正再拿掉
    fileCenter: {
        getUploadedFiles: function (name) {
            /// <summary>取得已上傳檔案屬性</summary>
            /// <param name="name" optional="false" type="string">
            ///     上傳 user control 的 client id
            /// </param>
            /// <returns type="uofFile[]">上傳的檔案內容</returns>
            var files = [];
            $("#" + name + "_tbFileList tr").each(function () {
                var file = new uofFile();
                file.fileId = $(this).attr('fileId');
                file.type = $(this).attr('type');
                file.fileLink = $(this).find("a").attr("href");
                file.name = $(this).find("a").text();
                file.size = $(this).find("td")[1].innerHTML;
                file.path = $(this).attr('path');

                files[files.length] = file;

            });
            return files;
        },
        getUploadedFilesLength: function (name) {
            /// <summary>取得已上傳檔案的數量</summary>
            /// <param name="name" optional="false" type="string">
            ///     上傳 user control 的 client id
            /// </param>
            /// <returns type="int">上傳的檔案數量</returns>
            return $("#" + name + "_tbFileList tr").length;
        },
        getUploader: function (id) {
            return _uofUploader[id];
        },
        setUploader: function (id, obj) {
            _uofUploader[id] = obj;
        },
        disable: function (name, disable) {
            /// <summary>停用上傳元件</summary>
            /// <param name="name" optional="false" type="string">
            ///     上傳 user control 的 client id
            /// </param>
            /// <param name="disable" optional="false" type="bool">
            ///     false:停用,ture:啟用
            /// </param>
            var id = name + "_AnsycFileUpload1";
            if ($("#" + id).length > 0) {
                var up = this.getUploader(id);
                var length = this.getUploadedFilesLength(name);
                //如果只能上傳1個檔案,而且已經有檔案
                if (up != undefined && up.settings.multi_selection == 'false' && length > 0) {
                    var disabled = $("#" + id).disable();
                    if (!disabled) { // 如果原本是enable的狀態就改成disable, 如果原本已經是disable就略過
                        $("#" + id).disable(true);
                    }
                } else {
                    $("#" + id).disable(disable);
                }
            }
        }
    },
    application: {
        showPersonalDetail: function (userGuid) {
            /// <summary>
            /// 顯示個人資訊的頁面
            /// </summary>
            /// <param name="userGuid"></param>
            $uof.dialog.open2("~/Basic/Personal/PersonalDetailInformation.aspx", "", "", 750, 700, function (returnValue) { return false; }, { "userid": userGuid });
            return false;
        },
    },
    fastGrid: {
        hasChecked: function (gridViewClientId) {
            /// <summary>
            /// 是否有勾選項目
            /// </summary>
            /// <param name="gridViewClientId"></param>
            var gridObj = document.getElementById(gridViewClientId);
            var checkboxs = gridObj.getElementsByTagName('INPUT');
            var i;
            for (i = 1; i < checkboxs.length; i++) {
                if (checkboxs[i].checked) {
                    return true;
                }
            }

            return false;
        },
        getChecked: function (gridViewClientId) {
            /// <summary>
            /// 取得所有勾選的項目
            /// </summary>
            /// <param name="gridViewClientId"></param>
            var checkedString = "";
            $('#' + gridViewClientId + ' input[type=checkbox][purpose=autocheck]')
                .each(function () {
                    if ($(this).prop("checked")) {
                        checkedString += "," + $(this).attr("DataKey");
                    }
                });
            return checkedString.substring(1);
        }
    },
    uDocViewer: {
        open: function (sJson) {
            //先檢查有沒有安裝UDocViewer
            var httpsApiUrl = 'https://localhost:24117/protocol';
            var httpsUdocUrl = 'https://localhost:24117/meta';

            var httpApiUrl = 'http://localhost:24117/protocol';
            var httpUdocUrl = 'http://localhost:24117/meta';

            var dataType = 'application/json; charset=utf-8';
            let parseJson = JSON.parse(sJson);
            let isApiUrlExist = false;

            //判斷內部網址是否有s
            if (parseJson != null &&
                parseJson.UofUrl != null &&
                parseJson.UofUrl.indexOf('https') === -1 &&
                parseJson.UofUrl.indexOf('http') === 0) { }

            CheckApiUrlExist(httpsApiUrl, httpsUdocUrl, 0);

            if (!isApiUrlExist)
                CheckApiUrlExist(httpApiUrl, httpUdocUrl, 1);

            function CheckApiUrlExist(_apiurl, _udocurl, _tryCount) {

                $.ajax({
                    url: _apiurl,
                    type: 'GET',
                    async: false,
                    success: function (p) {
                        //p有值就是有安裝UDocViewer
                        if (p) {
                            $.ajax({
                                url: _udocurl,
                                type: 'POST',
                                async: false,
                                dataType: 'json',
                                contentType: dataType,
                                data: sJson,
                                success: function (id) {
                                    isApiUrlExist = true;
                                    $("#atag").attr("href", p + ':' + id);
                                    $("#atag")[0].click();
                                },
                                error: function (e) {
                                    console.dir(e);
                                    alert("Meta error please try again");
                                }
                            });
                        }
                        else {
                            alert("Protocol error please try again");
                        }
                    },
                    error: function (e) {

                        if (_tryCount === 0) {
                            isApiUrlExist = false;
                        }
                        else {
                            console.dir(e);
                            alert("你已被設定為UDoc Viewer的使用人員，請先下載並安裝UDoc Viewer才可觀看文件。\r\nYou have been set as a user of UDoc Viewer, Please install UDoc Viewer.");
                        }
                    }
                });
            }
        }
    },
    fileCenterV3: {
        add_source: function (id, source) { _uofFileCenterSource[id] = source; },
        get_source: function (id) { return _uofFileCenterSource[id]; }
    },
    dialog: {
        isInRadWindow: function () {
            /// <summary>
            /// 是否為rad window
            /// </summary>
            var val = false;
            if (window.radWindow) {
                return true;
            } else if (window.frameElement && window.frameElement.radWindow) {
                return true;
            }

            var n = window.name;
            var isChildWindow = n.indexOf("RadWindowManager") >= 0 || n === "dialog2FrameContent";
            if (isChildWindow) {
                if (window.parent.frameElement && window.parent.frameElement.radWindow) return true;
            }

            return val;
        },
        getCurrentWindow: function () {
            /// <summary>
            /// 取得目前的rad window
            /// </summary>
            var oWindow = window;
            if (window.radWindow) {
                oWindow = window.radWindow;
            } else if (window.frameElement && window.frameElement.radWindow) {
                oWindow = window.frameElement.radWindow;
            }

            var n = window.name;
            var isChildWindow = n.indexOf("RadWindowManager") >= 0 || n === "dialog2FrameContent";
            if (isChildWindow) {
                if (window.parent.frameElement && window.parent.frameElement.radWindow) oWindow = window.parent.frameElement.radWindow;
            }

            return oWindow;
        },
        getRadWindowManager: function () {
            /// <summary>
            /// 取得 RadWindowMamager
            /// </summary>
            var oManager = null;
            var cw = $uof.dialog.getCurrentWindow();
            if (cw) {
                var name = Object.getTypeName(cw);
                if (name == "Object") {
                    oManager = cw.GetRadWindowManager();
                } else if (name == "Telerik.Web.UI.RadWindow") {
                    oManager = cw.BrowserWindow.GetRadWindowManager();
                }
            }
            return oManager;
        },
        getRootWindow: function () {
            /// <summary>
            /// 取得最外層的rad window
            /// </summary>
            var cw = $uof.dialog.getCurrentWindow();
            if (cw) {
                var name = Object.getTypeName(cw);
                if (name == "Object") {
                    return cw;
                } else if (name == "Telerik.Web.UI.RadWindow") {
                    return cw.BrowserWindow;
                }
            }
            return cw;
        },
        getOpener: function () {
            /// <summary>
            /// 取得開啟目前rad window的window
            /// </summary>
            if ($uof.dialog.isInRadWindow()) {

                var oManager = $uof.dialog.getRadWindowManager();
                var ws = oManager.get_windows();
                var pl = window.parent.location.href;
                var index = pl.search("&_o=") + 4;
                var ok = pl.substr(index, 16);
                if ($.isNumeric(ok)) {
                    for (var i = 0; i < ws.length; i++) {
                        var ul = ws[i].get_contentFrame().contentWindow.location.href;
                        var openerKey = ul.substr(ul.length - 16);
                        if (openerKey == ok) {
                            return ws[i].get_contentFrame().contentWindow.frames[0];
                        }
                    }
                } else {
                    return window.parent.parent;
                }
            }

            return null;
        },
        set_returnValue: function (returnValue) {
            /// <summary>
            /// 設定rad window 傳回值
            /// </summary>
            /// <param name="returnValue"></param>
            $('#TempReturnValue').attr("content", returnValue);
        },
        get_returnValue: function () {
            /// <summary>
            /// 取得rad window的傳回值
            /// </summary>
            return $('#TempReturnValue').attr("content");
        },
        close: function () {
            /// <summary>
            /// 關閉視窗
            /// </summary>
            window.setTimeout(function () {
                if ($uof.dialog.isInRadWindow()) {
                    var oWnd = $uof.dialog.getCurrentWindow();
                    oWnd.argument = $uof.dialog.get_returnValue();
                    oWnd.close();
                } else {
                    // if dialog not in RadWindow
                    top.close();
                }
            }, 0);
        },

        open2: function (url, sender, title, width, height, fun, param) {
            /// <summary>
            /// 開啟dialog 
            /// </summary>
            /// <param name="url">網址</param>
            /// <param name="sender">觸發開啟這個動作的物件</param>
            /// <param name="title">視窗標題</param>
            /// <param name="width">寬度</param>
            /// <param name="height">高度</param>
            /// <param name="fun">dialog關閉時callback的function</param>
            /// <param name="param">參數</param>
            var oManager = $uof.dialog.getRadWindowManager();
            var url2;
            if (url.indexOf("~") == 0) {
                url2 = $uof.tool.getRootPath() + url.substring(2);
            } else {
                url2 = url;
            }
            if (param) {
                var paraKeys = Object.keys(param);
                var parastr = "";
                for (var i = 0; i < paraKeys.length; i++) {
                    var key = paraKeys[i];
                    parastr += "&" + key + "=" + encodeURIComponent(param[key]);
                }

                if (url2.indexOf("?") > 0) {
                    url2 += parastr;
                } else if (parastr) {
                    url2 += "?" + parastr.substring(1);
                }
            }

            var openerKey = '';
            if ($uof.dialog.isInRadWindow()) {
                var pu = window.parent.location.href;
                openerKey = pu.substr(pu.length - 16);
            }

            var rurl = $uof.tool.getRootPath() + 'Common/dialog2.aspx?url=' + encodeURIComponent(url2) + '&title=' + title + '&_o=' + openerKey;// + '&k=' + windowKey;
            if (oManager) {
                // silverlight set hidden
                $(".silverlightControlHost").css("visibility", "hidden");

                var oWnd = oManager.open(rurl);


                if (title) {
                    oWnd.set_title(title);
                }
                var win = $uof.dialog.getRootWindow();

                if ($uof.tool.browser.mobile_safari) {
                    oWnd.set_width(500);
                    oWnd.set_height(500);
                    oWnd.maximize();

                    try {
                        oWnd.set_behaviors(Telerik.Web.UI.WindowBehaviors.Close);
                    } catch (e) {
                        // ignore
                    }
                    oWnd.center();
                }
                else if ($uof.tool.browser.isMobile) {
                    oWnd.set_width(500);
                    oWnd.set_height(500);
                    oWnd.maximize();
                    try {
                        oWnd.set_behaviors(Telerik.Web.UI.WindowBehaviors.Close);
                    } catch (e) {
                        // ignore
                    }
                    oWnd.center();

                } else {
                    if (height > $(win).height() || width > $(win).width() || height == 0 || width == 0) {
                        oWnd.set_width(500);
                        oWnd.set_height(500);
                        oWnd.maximize();
                    } else {
                        var h = $uof.tool.computeScreenSize('h', height);
                        var w = $uof.tool.computeScreenSize('w', width);
                        oWnd.set_width(w);
                        oWnd.set_height(h);
                        oWnd.center();
                    }
                }
                oWnd.add_beforeClose(function (s, args) {
                    var f = s.get_contentFrame();

                    var inputTemp = $($(f).contents()[0].getElementById("content")).contents()[0].getElementById("TempReturnValue");
                    if (inputTemp && inputTemp.attributes.getNamedItem("content")) {
                        s.argument = inputTemp.attributes.getNamedItem("content").value;
                    } else {
                        s.argument = undefined;
                    }


                    $(".silverlightControlHost").css("visibility", "visible");
                });

                oWnd.add_close(function (s, a) {


                    var returnValue = s.argument;
                    if (fun.call != undefined) {

                        var isPostback = fun.call(null, returnValue);
                        var name = Object.getTypeName(sender);

                        if (isPostback) {
                            if ($("#DialogReturnValue").length) {
                                $("#DialogReturnValue").val(returnValue);
                            } else {
                                var $hiddenInput = $('<input/>', { id: 'DialogReturnValue', type: 'hidden', name: 'DialogReturnValue', value: returnValue });
                                $hiddenInput.appendTo("form");
                            }

                            if (name == "Telerik.Web.UI.RadButton") {
                                setTimeout(function () {
                                    eval(sender._postBackReference);
                                }, 0);
                            } else if (name == "Telerik.Web.UI.RadToolBarButton") {
                                setTimeout(function () {
                                    var toolbar = sender.get_toolBar();
                                    var para = sender._getHierarchicalIndex();
                                    if (toolbar._rawPostBackReference) {
                                        if (sender._requiresPageValidation()) {
                                            eval(String.format(toolbar._rawPostBackReference, para, ""));
                                        } else {
                                            var d = eval(String.format(toolbar._getPostBackOptionsReference(), para, "", ""));
                                            d.validation = false;
                                            eval(toolbar._getPostBackReference())(d);
                                        }
                                    } else {
                                        eval(String.format(toolbar._postBackReference, para));
                                    }
                                }, 0);
                            } else if (name == "Object") {
                                setTimeout(function () {
                                    if (sender.href) {
                                        var script = sender.href.replace(/\%20/g, ' ').replace('javascript:', '') + ";";
                                        eval(script);
                                    } else {
                                        __doPostBack(sender.name, '');
                                    }
                                }, 0);
                            }
                        }
                    }



                });



            } else {
                alert("Can't find RadWindowManager");
            }


        },

        open: function (url, title, width, height) {
            /// <summary>
            /// 已過時,請勿使用
            /// </summary>
            /// <param name="url"></param>
            /// <param name="title"></param>
            /// <param name="width"></param>
            /// <param name="height"></param>
            var rurl = $uof.tool.getRootPath() + 'Common/dialog.aspx?url=' + url + '&title=' + title + '&' + Math.round(Math.random() * 999999) + '';
            var dh = 'dialogHeight:' + $uof.tool.computeScreenSize('h', height) + 'px;';
            var dw = ' dialogWidth:' + $uof.tool.computeScreenSize('w', width) + 'px;';

            $.blockUI({
                message: null,
                overlayCSS: { backgroundColor: '#000', opacity: 0.5, cursor: 'no-drop' },
                baseZ: 10000,
                fadeIn: 0,
                fadeOut: 0,
            });

            // silverlight set hidden
            $(".silverlightControlHost").css("visibility", "hidden");

            var returnvalue = undefined;
            if ($uof.tool.browser.chrome || $uof.tool.browser.safari || $uof.tool.browser.firefox) {
                var date1 = new Date();
                returnvalue = showModalDialog(rurl, window, dh + dw + ' edge: Sunken; scroll: 0; center: 0; help: 0; resizable: 1; status: 0;');
                var date2 = new Date();
                var diff = date2 - date1;
                if (diff < 500) {
                    alert("請停用視窗封鎖,以進行下一個動作!!\r\nPlease disable your popup blocker to continue.");
                }
            } else {

                try {
                    returnvalue = showModalDialog(rurl, window, dh + dw + ' edge: Sunken; scroll: 0; center: 0; help: 0; resizable: 1; status: 0;');
                } catch (e) {
                    alert("請停用視窗封鎖,以進行下一個動作!!\r\nPlease disable your popup blocker to continue.");
                }
            }

            $.unblockUI();
            $(".silverlightControlHost").css("visibility", "visible");
            return returnvalue;
        }
    },
    window: {
        open: function (url, width, height, scrollbars) {
            /// <summary>
            /// 開啟新視窗
            /// </summary>
            /// <param name="url">網址</param>
            /// <param name="width">寬度</param>
            /// <param name="height">高度</param>
            /// <param name="scrollbars">是否啟用scrollbar true||false</param>
            url += '&' + Math.round(Math.random() * 999999);
            var scroll = 'no';
            if (scrollbars !== 'undefined' && scrollbars !== null && scrollbars === true)
                scroll = 'yes';

            var popWin = window.open("", "_blank", "height=" + height + ",width=" + width + ",status=no,toolbar=no,menubar=no,location=no,resizable=yes,scrollbars=" + scroll);

            setTimeout(function () {
                if (!popWin || popWin.closed) {
                    alert("請停用視窗封鎖,以進行下一個動作!!\r\nPlease disable your popup blocker to continue.");
                }
                else {
                    popWin.location = url;
                    popWin.focus();
                }
            }, 500);
            return popWin;
        }
    },
    download: function (url, proxy) {
        /// <summary>
        /// 下載
        /// </summary>
        /// <param name="url">網址</param>
        /// <param name="proxy">proxy</param>
        if (proxy === undefined || proxy === null) {
            proxy = 0;
        }

        var exist = true;
        $.ajax({
            url: url + '&exists=1',
            async: false,
            statusCode: { 404: function () { exist = false; } }
        });

        if (!exist || (proxy !== 0 && $uof.tool.browser.ie)) {
            // if IE and download from Proxy use iframe, will trigger beforeunload event (client side)
            var guid = $uof.tool.getNewGuid().replace("-", "");
            $("body").append("<a href='" + url + "&inline=0' target='_blank' style='display: none;' id='" + guid + "'></a>");
            document.getElementById(guid).click();
        } else {
            $("body").append("<iframe src='" + url + "&inline=0' style='display: none;' ></iframe>");
        }
    },
    tool:
    {
        base64: {
            // private property
            _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",

            // public method for encoding
            encode: function (input) {
                var output = "";
                var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
                var i = 0;

                input = $uof.tool.base64._utf8_encode(input);

                while (i < input.length) {

                    chr1 = input.charCodeAt(i++);
                    chr2 = input.charCodeAt(i++);
                    chr3 = input.charCodeAt(i++);

                    enc1 = chr1 >> 2;
                    enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
                    enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
                    enc4 = chr3 & 63;

                    if (isNaN(chr2)) {
                        enc3 = enc4 = 64;
                    } else if (isNaN(chr3)) {
                        enc4 = 64;
                    }

                    output = output +
                        this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) +
                        this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);

                }

                return output;
            },

            // public method for decoding
            decode: function (input) {
                var output = "";
                var chr1, chr2, chr3;
                var enc1, enc2, enc3, enc4;
                var i = 0;

                input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");

                while (i < input.length) {

                    enc1 = this._keyStr.indexOf(input.charAt(i++));
                    enc2 = this._keyStr.indexOf(input.charAt(i++));
                    enc3 = this._keyStr.indexOf(input.charAt(i++));
                    enc4 = this._keyStr.indexOf(input.charAt(i++));

                    chr1 = (enc1 << 2) | (enc2 >> 4);
                    chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
                    chr3 = ((enc3 & 3) << 6) | enc4;

                    output = output + String.fromCharCode(chr1);

                    if (enc3 != 64) {
                        output = output + String.fromCharCode(chr2);
                    }
                    if (enc4 != 64) {
                        output = output + String.fromCharCode(chr3);
                    }

                }

                output = $uof.tool.base64._utf8_decode(output);

                return output;

            },

            // private method for UTF-8 encoding
            _utf8_encode: function (string) {
                string = string.replace(/\r\n/g, "\n");
                var utftext = "";

                for (var n = 0; n < string.length; n++) {

                    var c = string.charCodeAt(n);

                    if (c < 128) {
                        utftext += String.fromCharCode(c);
                    }
                    else if ((c > 127) && (c < 2048)) {
                        utftext += String.fromCharCode((c >> 6) | 192);
                        utftext += String.fromCharCode((c & 63) | 128);
                    }
                    else {
                        utftext += String.fromCharCode((c >> 12) | 224);
                        utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                        utftext += String.fromCharCode((c & 63) | 128);
                    }

                }

                return utftext;
            },

            // private method for UTF-8 decoding
            _utf8_decode: function (utftext) {
                var string = "";
                var i = 0;
                var c = c1 = c2 = 0;

                while (i < utftext.length) {

                    c = utftext.charCodeAt(i);

                    if (c < 128) {
                        string += String.fromCharCode(c);
                        i++;
                    }
                    else if ((c > 191) && (c < 224)) {
                        c2 = utftext.charCodeAt(i + 1);
                        string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
                        i += 2;
                    }
                    else {
                        c2 = utftext.charCodeAt(i + 1);
                        c3 = utftext.charCodeAt(i + 2);
                        string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
                        i += 3;
                    }

                }

                return string;
            }
        },
        computeScreenSize: function (t, size) {
            /// <summary>
            /// 比對畫面的大小,如果畫面比較大,傳回畫面的大小,反之傳回size
            /// </summary>
            /// <param name="t">類型, h:高度,w:寬度</param>
            /// <param name="size"></param>
            if (t == "h") {
                var height = ($uof.tool.browser.ie || $uof.tool.browser.firefox || $uof.tool.browser.safari) ? screen.availHeight : screen.availHeight - 65;

                if (size == 0 || size > height) {
                    return height;
                } else {
                    return size;
                }
            } else if (t == "w") {
                if (size == 0 || size > screen.availWidth) {
                    return screen.availWidth;
                } else {
                    return size;
                }
            }
            return null;
        },
        getScreenHeight: function () {
            /// <summary>
            /// 取得畫面高度
            /// </summary>
            var height = ($uof.tool.browser.ie || $uof.tool.browser.firefox || $uof.tool.browser.safari) ? screen.availHeight : screen.availHeight - 65;

            return height;
        },
        getScreenWidth: function () {
            /// <summary>
            /// 取得畫面寬度
            /// </summary>
            return screen.availWidth;

        },
        getRootPath: function () {
            /// <summary>
            /// 取得uof站台的root網址
            /// </summary>
            return $("#ApplicationRoot").attr("href");
        },
        browser: {
            ie: (navigator.userAgent.toString().toLowerCase().indexOf('trident') != -1),
            safari: (navigator.userAgent.toString().toLowerCase().indexOf("safari") != -1) && (navigator.userAgent.toString().toLowerCase().indexOf("chrome") == -1),
            firefox: (navigator.userAgent.toString().toLowerCase().indexOf("firefox") != -1),
            chrome: (navigator.userAgent.toString().toLowerCase().indexOf("chrome") != -1),
            mobile_safari: ((navigator.userAgent.toString().toLowerCase().indexOf("iphone") != -1) || (navigator.userAgent.toString().toLowerCase().indexOf("ipod") != -1) || (navigator.userAgent.toString().toLowerCase().indexOf("ipad") != -1)) ? true : false,
            isMobile: (navigator.userAgent.match(/Android/i) || navigator.userAgent.match(/BlackBerry/i) || navigator.userAgent.match(/Opera Mini/i) || navigator.userAgent.match(/IEMobile/i)),
        },
        platform: {
            mac: (navigator.userAgent.toString().toLowerCase().indexOf("mac") != -1) ? true : false,
            windows: (navigator.appVersion.indexOf("Win") != -1) ? true : false,
            linux: (navigator.appVersion.indexOf("Linux") != -1) ? true : false,
            unix: (navigator.appVersion.indexOf("X11") != -1) ? true : false
        },
        sleep: function (milliseconds) {
            var start = new Date().getTime();
            for (var i = 0; i < 1e7; i++) {
                if ((new Date().getTime() - start) > milliseconds) {
                    break;
                }
            }
        },
        printScreenSize: function (t, size) {

            if (t == "h") {
                if (size == 0 || size >= screen.availHeight) {
                    return screen.availHeight - 45;
                } else {
                    return size;
                }
            } else if (t == "w") {
                if (size == 0 || size >= screen.availWidth) {
                    return screen.availWidth;
                } else {
                    return size;
                }
            }
            return null;
        },
        _blockUIShowing: false,
        showBlockLoading: function () {
            /// <summary>
            /// 顯示畫面遮罩
            /// </summary>
            $uof.tool._blockUIShowing = true;
            setTimeout(function () {
                if ($uof.tool._blockUIShowing) {
                    $.blockUI({
                        message: '<div class="LoadingText" style="height:20px;">Loading...</div><div id="loadingAnimation" style="margin-left: auto;margin-right: auto"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>',
                        overlayCSS: { backgroundColor: '#000', opacity: 0.5, cursor: 'wait' },
                        css: { color: '#FFF', backgroundColor: '#999', border: '3px solid #ccc' },
                        baseZ: 10000,
                        fadeIn: 1000,
                    });
                }
            }, 1500);

            $.blockUI({
                message: null,
                overlayCSS: { backgroundColor: '#000', opacity: 0, cursor: 'default' },
                baseZ: 10000
            });
        },
        hidnBlockLoading: function () {
            /// <summary>
            /// 隠藏畫面遮罩
            /// </summary>
            $.unblockUI();
            $uof.tool._blockUIShowing = false;
        },
        getNewGuid: function () {
            /// <summary>
            /// 產生新的Guid
            /// </summary>
            var guid = "";
            for (var i = 1; i <= 32; i++) {
                var n = Math.floor(Math.random() * 16.0).toString(16);
                guid += n;
                if ((i == 8) || (i == 12) || (i == 16) || (i == 20))
                    guid += "-";
            }
            return guid;
        },
        formatFileSize: function (bytecount) {
            /// <summary>
            /// 取得格式化後的檔案大小字串
            /// </summary>
            /// <param name="bytecount">檔案大小</param>
            var str = bytecount + ' B';
            if (Number(bytecount) > 1024) {
                str = (bytecount / 1024).toFixed(1) + ' KB';
            }
            if (Number(bytecount) > 1048576) {
                str = (bytecount / 1048576).toFixed(1) + ' MB';
            }
            if (Number(bytecount) > 1073741824) {
                str = (bytecount / 1073741824).toFixed(1) + ' GB';
            }
            return str;
        },
        htmlDecode: function (text) {
            return $('<textarea />').html(text).text();
        }
    },
    cookie: {
        get: function (key) {
            /// <summary>
            /// 取得cookie
            /// </summary>
            /// <param name="key"></param>
            /// <returns type=""></returns>
            var val = $.cookie("UOFSettings");

            if (val == "") {
                return null;
            } else {
                var obj = JSON.parse(val);
                return obj[key];
            }
        },
        set: function (key, value) {
            /// <summary>
            /// 設定cookie
            /// </summary>
            /// <param name="key"></param>
            /// <param name="value"></param>
            var cookieStr = $.cookie("UOFSettings");
            var obj;
            if (cookieStr == "") {
                obj = {};
            } else {
                obj = JSON.parse(cookieStr);
            }

            obj[key] = value;

            $.cookie("UOFSettings", JSON.stringify(obj), { expires: 30, path: '/', domain: '' });
        },
        remove: function (key) {
            /// <summary>
            /// 移除
            /// </summary>
            /// <param name="key"></param>
            var cookieStr = $.cookie("UOFSettings");
            var obj;
            if (cookieStr != "") {
                obj = JSON.parse(cookieStr);
                delete obj[key];
                $.cookie("UOFSettings", JSON.stringify(obj), { expires: 30, path: '/', domain: '' });
            }
        }
    },
    pageMethod: {
        sync: function (method, data) {
            /// <summary>
            /// 同步呼叫
            /// </summary>
            /// <param name="method">method名稱</param>
            /// <param name="data">資料(json格式)</param>
            /// <returns type="">回傳值,如果呼叫時發生錯誤會回傳null</returns>
            var val = null;
            var realData = {
                "type": "page",
                "method": method,
                "path": "",
                "para": data === [] ? [] : data
            };
            $.ajax({
                type: "POST",
                url: $(location).attr('pathname') + '/PageMethodProxy',
                data: JSON.stringify(realData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
            }).done(function (result) {
                val = result.d;
            }).fail(function (jqXhr, textStatus, errorThrown) {
                try {
                    if (textStatus !== "error" && errorThrown !== "Unauthorized") {
                        var response = JSON.parse(jqXhr.responseText);
                        alert(response.Message);
                    }
                } catch (e) {
                    alert(jqXhr.responseText);
                }
            });
            return val;
        },
        async: function (method, data, onSuccess) {
            /// <summary>
            /// 非同步呼叫
            /// </summary>
            /// <param name="method">method名稱</param>
            /// <param name="data">資料(json格式)</param>
            /// <param name="onSuccess">當非同步呼叫完成時呼叫的function</param>

            var realData = {
                "type": "page",
                "method": method,
                "path": "",
                "para": data === [] ? [] : data
            };

            $.ajax({
                type: "POST",
                url: $(location).attr('pathname') + '/PageMethodProxy',
                data: JSON.stringify(realData),
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            }).done(function (response) {
                onSuccess(response.d);
            }).fail(function (jqXhr, textStatus, errorThrown) {
                try {
                    if (textStatus !== "error" && errorThrown !== "Unauthorized") {
                        var response = JSON.parse(jqXhr.responseText);
                        alert(response.Message);
                    }
                } catch (e) {
                    alert(jqXhr.responseText);
                }
            });
        },
        syncUc: function (path, method, data) {
            /// <summary>
            /// 同步呼叫
            /// </summary>
            /// <param name="method">method名稱</param>
            /// <param name="method">method名稱</param>
            /// <param name="data">資料(json格式)</param>
            /// <returns type="">回傳值,如果呼叫時發生錯誤會回傳null</returns>
            var val = null;

            var realData = {
                "type": "userControl",
                "method": method,
                "path": path,
                "para": data == "" ? [] : data
            };
            $.ajax({
                type: "POST",
                url: $(location).attr('pathname') + '/PageMethodProxy',
                data: JSON.stringify(realData),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
            }).done(function (result) {
                val = result.d;
            }).fail(function (jqXhr, textStatus, errorThrown) {
                try {
                    if (textStatus !== "error" && errorThrown !== "Unauthorized") {
                        var response = JSON.parse(jqXhr.responseText);
                        alert(response.Message);
                    }
                } catch (e) {
                    alert(jqXhr.responseText);
                }
            });
            return val;
        },
        asyncUc: function (path, method, data, onSuccess) {
            /// <summary>
            /// 非同步呼叫
            /// </summary>
            /// <param name="method">method名稱</param>
            /// <param name="data">資料(json格式)</param>
            /// <param name="onSuccess">當非同步呼叫完成時呼叫的function</param>

            var realData = {
                "type": "userControl",
                "method": method,
                "path": path,
                "para": data == "" ? [] : data
            };

            $.ajax({
                type: "POST",
                url: $(location).attr('pathname') + '/PageMethodProxy',
                data: JSON.stringify(realData),
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            }).done(function (response) {
                onSuccess(response.d);
            }).fail(function (jqXhr, textStatus, errorThrown) {
                try {
                    if (textStatus !== "error" && errorThrown !== "Unauthorized") {
                        var response = JSON.parse(jqXhr.responseText);
                        alert(response.Message);
                    }
                } catch (e) {
                    alert(jqXhr.responseText);
                }
            });
        }
    },
    json: {
        toString: function (obj) {
            /// <summary>
            /// 物件轉成json字串
            /// </summary>
            /// <param name="obj">物件</param>
            /// <returns type="">json字串,如果無法轉換會回傳null</returns>
            try {
                return JSON.stringify(obj);
            } catch (e) {
                return null;
            }

        },
        toObject: function (str) {
            /// <summary>
            /// json字串轉成物件
            /// </summary>
            /// <param name="str">json字串</param>
            /// <returns type="">物件,如果無法轉換會回傳null</returns>
            try {
                return JSON.parse(str, $uof.json._dateReviver);
            } catch (e) {
                return null;
            }
        },
        isJson: function (str) {
            /// <summary>
            /// 是否為合法的json字串
            /// </summary>
            /// <param name="str">字串</param>
            /// <returns type=""></returns>
            try {
                JSON.parse(str);
            } catch (e) {
                return false;
            }
            return true;
        },
        _dateReviver: function (key, value) {
            if (typeof value === 'string') {
                var rx = /^(\d{4}\-\d\d\-\d\d([tT][\d:\.]*)?)([zZ]|([+\-])(\d\d):(\d\d))?$/,
                    p = rx.exec(value) || [];
                if (p[1]) {
                    return new Date(value);
                }
            }
            return value;
        }
    },
    telerikFix: {
        menu: {
            closeAfterClick: function (event) {
                var menu = $find(event.data.menuId);
                menu.close();
                if (event.data.block) {
                    $uof.tool.showBlockLoading();
                }
            },
            itemClicking: function (sender, eventArgs) {

                var item = eventArgs.get_item();
                var menuId = item.get_menu().get_element().id;
                var navigateUrl = item.get_navigateUrl();
                if (navigateUrl && navigateUrl != "#") {
                    var event = { data: { "menuId": menuId, block: $(item.get_linkElement()).hasClass("blockUI") } };
                    $uof.telerikFix.menu.closeAfterClick(event);
                    if (item.get_target() != "_blank") {
                        window.location.href = navigateUrl.replace("~", $uof.tool.getRootPath());
                    }
                }
            },
            itemClosed: function (sender, eventArgs) {
                $(eventArgs.get_item().get_linkElement()).removeClass("rmExpanded");
            }
        },
        datePicker: {
            goToToday: function (obj) {
                var calendar = $find($(obj).parents(".RadCalendar").attr("id"));
                var todaysDate = new Date();
                var todayTriplet = [todaysDate.getFullYear(), todaysDate.getMonth() + 1, todaysDate.getDate()];
                calendar.selectDate(todayTriplet, true);
            },
            mustInput: function (sender, args) {
                if (args.get_newValue() == "") {
                    if (args.get_oldValue() == "") {
                        args.set_newValue(new Date());
                    } else {
                        args.set_newValue(args.get_oldValue());
                    }
                }
            },
            onError: function (sender, args) {
                args.set_cancel(true);
            }
        },
        editor: {
            changePopTable: function (editor, args) {
                if (editor.get_toolAdapter().getToolByName("InsertTable") != null) {
                    var toolsElem = editor.get_toolAdapter().getToolByName("InsertTable").get_element();
                    $(toolsElem).on("click", function () {
                        setTimeout(function () {
                            $("a[title='Table Wizard']").hide();
                            $("a[title='Table Properties']").hide();

                            $("td.reAllPropertiesLight").hide();
                            $("span.reNoAlignment").hide();
                            // $("span.split_arrow").hide();
                            // $("div.Silk.reDropDownBody.reInsertTable div.reTlbVertical").hide();
                            $("a[title='AlignmentSelector']").hide();
                            $("div.lightTable table tbody tr:eq(2) td:eq(0)").css('visibility', 'hidden');
                        }, 0);
                    });
                }
                if (editor.get_toolAdapter().getToolByName("InsertLink") != null) {
                    var toolsElem2 = editor.get_toolAdapter().getToolByName("InsertLink").get_element();
                    $(toolsElem2).on("click", function () {
                        setTimeout(function () {
                            $("div.reInsertLinkWrapper table.reControlsLayout tbody tr:eq(3) td:eq(0) table.reConfirmCancelButtonsTblLight tbody tr:eq(0) td.reAllPropertiesLight").remove();
                        }, 0);
                    });
                }
            },
            clientCommandExecuting: function (editor, args) {
                var name = args.get_name(); //The command name
                var val = args.get_value(); //The tool that initiated the command

                if (name == "Emoticons") {

                    //Set the background image to the head of the tool depending on the selected toolstrip item
                    var tool = args.get_tool();
                    var span = tool.get_element().getElementsByTagName("SPAN")[0];
                    span.style.backgroundImage = "url(" + val + ")";

                    //Paste the selected in the dropdown emoticon    
                    editor.pasteHtml("<img src='" + val + "'>");

                    //Cancel the further execution of the command
                    args.set_cancel(true);
                }
            },
            clientSelectionChanged: function (editor, args) {
                var images = editor.get_document().images;
                if (images.length == 0) {
                    return false;
                }
                var limitedWidth = 640;
                setTimeout(function () {
                    $(images).each(function () {
                        var iw = this.naturalWidth;
                        var ih = this.naturalHeight;
                        //如果圖片寬度超過640, 則只放大到寬度640
                        if (iw > limitedWidth) {
                            var ww = limitedWidth / iw;
                            iw = limitedWidth;
                            ih = ih * ww;
                        }
                        $(this).mousedown(function (e) {
                            switch (e.which) {
                                case 3:
                                    $(this).width(iw);
                                    $(this).height(ih);
                                    e.preventDefault();
                                    break;
                            }
                        });
                    });
                }, 100);
            }
        },
        dock: {
            resizeTitleText: function () {
                var titleBar = $(".rdTitleBar").first();
                if (titleBar.length > 0) {
                    var w = titleBar.width();
                    $(".rdTitleBar em").width(w - 27);
                    $(".TitleBarText").width(w - 108);
                }
            }
        },
        windowManager: {
            onClientCommand: function (sender, args) {
                if ($telerik.isIE && window.event) {
                    $telerik.cancelRawEvent(window.event);
                }
            },

        }
    }
};

// Telerik workaround for fix "System.FormatException: Input string was not in a correct format." in 2013.3.1114
// RadTreeView
$(function () {
    if ($telerik.isChrome) {
        if (Telerik.Web.UI.RadTreeView) {
            Telerik.Web.UI.RadTreeView.prototype.saveClientState = function () {
                return "{\"expandedNodes\":" + this._expandedNodesJson +
                    ",\"collapsedNodes\":" + this._collapsedNodesJson +
                    ",\"logEntries\":" + this._logEntriesJson +
                    ",\"selectedNodes\":" + this._selectedNodesJson +
                    ",\"checkedNodes\":" + this._checkedNodesJson +
                    ",\"scrollPosition\":" + Math.round(this._scrollPosition) + "}";
            }
        }

        //RadListBox
        if (Telerik.Web.UI.RadListBox) {
            Telerik.Web.UI.RadListBox.prototype.saveClientState = function () {
                return "{" +
                    "\"isEnabled\":" + this._enabled +
                    ",\"logEntries\":" + this._logEntriesJson +
                    ",\"selectedIndices\":" + this._selectedIndicesJson +
                    ",\"checkedIndices\":" + this._checkedIndicesJson +
                    ",\"scrollPosition\":" + Math.round(this._scrollPosition) +
                    "}";
            }
        }
        //RadScheduler
        if (Telerik.Web.UI.RadScheduler) {
            Telerik.Web.UI.RadScheduler.prototype.saveClientState = function () {
                return '{"scrollTop":' + Math.round(this._scrollTop) + ',"scrollLeft":' + Math.round(this._scrollLeft) + ',"isDirty":' + this._isDirty + '}';
            }
        }
    }
});