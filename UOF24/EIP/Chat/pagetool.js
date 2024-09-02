// Display wait slash
function PT_DisplayWait() 
{                  
    if (PT_IsOpera()) 
    {
        PT_DirectDisplayWait();
    }
    else 
    {
        setTimeout("PT_DirectDisplayWait()", 500);
    }
}

function PT_DirectDisplayWait() {
    var scrollTop = document.documentElement.scrollTop + document.body.scrollTop;

    var tab = document.getElementById('WaitBlock');

    if (tab == null || typeof (tab) == "undefined")
        return;

    tab.style.top = scrollTop + "px";

    // Get Small for Height
    var h = screen.height;
    if (screen.height < h)
        h = screen.height;

    tab.style.height = h + "px";
    //tab.style.height = "100%";        // if use 100% then be compress with image height

    tab.style.display = "";
}


// Display wait slash
/*
function PT_DirectDisplayWait() 
{

    var scrollTop = document.documentElement.scrollTop + document.body.scrollTop;
    
    var html = "<table id=\"WaitBlock\" style=\"";
    html += "width:" + (screen.availWidth * 0.95) + "px;";
    html += "height:" + (screen.availWidth * 0.8) + "px;";
    html += "position:absolute;left:0px;";
    html += "top:" + scrollTop + "px;";
    html += "border:black solid 0px;\" >";
    html += "<tr><td align=\"center\" valign=\"center\">";
    html += "<table><tr><td bgcolor='#0000E0' style=\"color:#F0F0F0;border:black solid 1px\">";
    html += "<h2>&nbsp;&nbsp;Process...&nbsp;&nbsp;</h2>";
    html += "</td></tr></table>";
    html += "</td></tr>";
    html += "</table>";
    
    document.body.insertAdjacentHTML('beforeEnd', html);

}
*/



/*
function PT_WaitClick(obj_id) {

    alert(event.srcElement.outerHTML + "\r\nobj_id=" + obj_id);    
    event.srcElement.onclick = function() {}; 
    PT_DisplayWait();
    setTimeout(function() { document.getElementById(obj_id).click(); }, 100);
}
*/


function PT_IsOpera()
{
    if (navigator.appVersion.indexOf("Opera") != -1) 
    {
        return true;
    }
    return false;
}

function PT_AndroidExist() {
    
    if (typeof (uofapp_android) == 'undefined') {
        return false;
    }
    return true;
}

function PT_GoBack() {    
    if (PT_AndroidExist() == true && typeof (uofapp_android.web_go_back) != 'undefined') {
        try {            
            uofapp_android.web_go_back();
        } catch (e) {
            alert('PT_GoBack Exception !\r\n' + e);
        }
        return;
    }
        
    history.go(-1);
}

// 取得 App 畫面是否作用中, 如果沒有支援, 則回傳空字串, 否則為 "true" 或 "false"
function PT_AndroidGetFrontActive() {
    if (PT_AndroidExist() == false || typeof (uofapp_android.get_front_active) == "undefined") {
        return "";
    }

    var v = "";
    try {
        v = uofapp_android.get_front_active();
    } catch (e) {
        alert('PT_AndroidGetFontActive Exception !\r\n' + e);
        return "";
    }

    return v;
}


function PT_ClickReturnButton(url) {
    
    var list = document.getElementsByTagName("input");    
    try{
        for (var i = 0 ; i < list.length ; i++)
        {
            var o = list[i];            
            if (typeof (o.type) != 'undefined' && o.type.toLowerCase() == "submit" && typeof (o.name) != 'undefined') {                
                var name = o.name;                
                if (name.indexOf("returnButton") != -1) {                    
                    o.click();
                    return;
                }            
            }
        }
    } catch (ce) {
        alert('PT_ClickReturnButton() exception !\r\n' + ce);
        return;
    }

    //location.href = url;
}


function PT_SizeToString(size) {
    var size_str = parseInt(size / 1024 / 1024, 10) + " MB";
    if (size < 1024)
        size_str = size + " B";
    if (size >= 1024 && size < 1024 * 1024)
        size_str = parseInt(size / 1024, 10) + " KB";
    return size_str;
}

function PT_IsSafari() {

    var is_chrome = /chrome/.test(navigator.userAgent.toLowerCase());
    var is_safari = /safari/.test(navigator.userAgent.toLowerCase());
    var is_iphone = /iphone/.test(navigator.userAgent.toLowerCase());

    if (is_iphone)
        return true;

    if (is_chrome == false && is_safari == true)
        return true;
    return false;
}

function PT_IsIos8() {    
    var deviceAgent = navigator.userAgent.toLowerCase();
    var b = /(iphone|ipod|ipad).* os 8_/.test(deviceAgent);
    return b;
}

function PT_IsOldIe() {
    var version = navigator.appVersion;
    if (version.indexOf("MSIE 6") != -1 || version.indexOf("MSIE 7") != -1 ||
        version.indexOf("MSIE 8") != -1 || version.indexOf("MSIE 9") != -1) {
        return true;
    }
    return false;
}

// 閃動工作列 for EM
function PT_EmWindowFlash(isIdle) {
    if (typeof (uofapp_em_window_flash) != "undefined")
        window.uofapp_em_window_flash(isIdle);
}

// 設定 Window Title for EM
function PT_EmWindowSetTitle(title) {
    if (typeof (uofapp_em_window_set_title) != "undefined") {
        setTimeout(function () { window.uofapp_em_window_set_title(title); },
            500);
    }
}


// 開啟 Popup Form (用於主視窗)
function PT_PopupForm(url, width, height, callback) {

    if (PT_IsSafari() == true) {
        PT_PopupFormForSafari(url, width, height, callback);
        return;
    }

    var mask_div_id = "_PT_PopupMaskDiv";
    var main_div_id = "_PT_PopupMainDiv";
    
    var width_str = "100%";
    var height_padding_str = "0%";
    var height_str = "100%";
    var frameborder_str = "0";
    if (typeof (width) != "undefined" && width != null)
        width_str = width;

    if (typeof (height) != "undefined" && height != null && height.indexOf("%") != -1 && height != "100%") {
        var h = parseInt(height);
        height_str = h + "%";
        height_padding_str = Math.floor((100 - h) / 2) + "%";
    }

    if (width_str != "100%" && height_str != "100%")
        frameborder_str = "1";    

    var html = "";
    // Mask Div
    html += "<div id='" + mask_div_id + "' class=\"alpha_30\" ";
    html += "style=\"width:100%; height:100%; position:fixed; top:0px; left:0px; background-color:gray;\" >";
    html += "</div>";

    html += "<div id='" + main_div_id + "' ";
    html += "style=\"position:fixed; top:0px; left:0px; text-align:center;";
    html += "width:100%; height: 100%\" onclick=\"PT_ClosePopupForm(window);\" >";

    // Height Padding (for valign=middle)
    if( height_padding_str != "0%" )
        html += "<div style=\"height:" + height_padding_str + "\" >&nbsp;</div>";   // height padding div

    // IFRAME Content
    html += "<iframe src=\"" + url + "\" ";
    html += "width='" + width_str + "' height='" + height_str + "' ";
    html += "style=\"background-color:white;";
    if (frameborder_str != "0")
        html += "border:1px solid black;";
    html+= "\" frameborder=0 ";
    html+= "></iframe>";
    
    html += "</table>";    

    html += "</div>";

    // 設定 callback
    if (typeof (callback) == 'undefined')
        callback = null;
    window._PT_PopupForm_Callback = callback;        

    document.body.insertAdjacentHTML('beforeEnd', html);
    document.getElementById(mask_div_id).style.zIndex = 998;
    document.getElementById(main_div_id).style.zIndex = 999;    
}

// 開啟 Popup Form (用於主視窗, Mobile Safari 版)
function PT_PopupFormForSafari(url, width, height, callback) {
    var mask_div_id = "_PT_PopupMaskDiv";
    var main_div_id = "_PT_PopupMainDiv";

    var width_padding_str = "0%";
    var width_str = "100%";
    var height_padding_str = "0%";
    var height_str = "100%";
    var frameborder_str = "0";
    if (typeof (width) != "undefined" && width != null)
        width_str = width;

    if (typeof (width) != "undefined" && width != null && width.indexOf("%") != -1 && width != "100%") {
        var w = parseInt(width);
        width_str = w + "%";
        width_padding_str = Math.floor((100 - w) / 2) + "%";
    }

    if (typeof (height) != "undefined" && height != null && height.indexOf("%") != -1 && height != "100%") {
        var h = parseInt(height);
        height_str = h + "%";
        height_padding_str = Math.floor((100 - h) / 2) + "%";
    }

    if (width_str != "100%" && height_str != "100%")
        frameborder_str = "1";

    //===== Make HTML =====                
    var html = "";
    // Mask Div
    html += "<div id='" + mask_div_id + "' class=\"alpha_30\" ";
    html += "style=\"width:100%; height:100%; position:fixed; top:0px; left:0px; background-color:gray;\" >";
    html += "</div>";

    // Content Table
    html += "<table id=\"" + main_div_id + "\" ";
    html += "border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=100% height=100%  ";
    html += "style=\"position:fixed; top:0;\" ";
    html += "onclick=\"PT_ClosePopupForm(window);\" ";
    html += ">";

    // Height Padding Tr
    if (height_padding_str != "0%") {
        html += "<tr style=\"height:" + height_padding_str + "\"><td><td><td></tr>";
    }

    // Content Tr
    html += "<tr>";

    // Left Width Padding Td
    html += "<td style=\"width:" + width_padding_str + "\" >";
    if (width_padding_str != "0%")
        html += "&nbsp";
    html += "</td>";

    // Content Td                
    html += "<td id=\"_PT_PopupFormContainer\" ";    
    html += "style=\"";
    html += "position:fixed; overflow: auto; -webkit-overflow-scrolling: touch; text-align:center; background-color:white;";    
    html += "width:" + width_str + ";";
    html += "height:" + height_str + ";";
    if (frameborder_str == "1")
        html += "border:1px solid black;"
    html += "\" ";    
    html += " >";

    // IFRAME Content
    html += "<iframe id=\"_PT_PopupFormFrame\" src=\"" + url + "\" frameborder=\"0\" ";
    html += "style=\"width:100%; height: 100%;\" ";        
    html += "></iframe>";

    html += "</td>";

    // Tail Td
    html += "<td style=\"width:" + width_padding_str + "\" >";
    if (width_padding_str != "0%")
        html += "&nbsp";
    html += "</td>";
    html += "</tr>";

    html += "</table>";   

    // 設定 callback
    if (typeof (callback) == 'undefined')
        callback = null;
    window._PT_PopupForm_Callback = callback;

    document.body.insertAdjacentHTML('beforeEnd', html);

    document.getElementById(mask_div_id).style.zIndex = 998;
    document.getElementById(main_div_id).style.zIndex = 999;


    // 調整初始化大小        
    try {
        if (window.frameElement.ownerDocument != null) {
            var parent_height = window.frameElement.ownerDocument.getElementById("_PT_PopupMainDiv").offsetHeight;
            var parent_container_height = window.frameElement.ownerDocument.getElementById("_PT_PopupFormContainer").offsetHeight;
            var self_height = document.getElementById("_PT_PopupMainDiv").offsetHeight;

            if (self_height > parent_height) {

                document.getElementById("_PT_PopupFormContainer").style.height = parent_container_height * parseInt(height_str) / 100 + "px";
                document.getElementById("_PT_PopupMainDiv").style.height = parent_container_height + "px";
            }
        }
    } catch (e) { }

    // 捲動時, 調整 Child Container ScrollTop (第二層 PopupForm 才有需要)
    var scroll_func = function () {
        try {
            var iframe = this.childNodes[0];
            var doc = iframe.contentWindow.document;
            var inner_content = doc.getElementById("_PT_PopupMainDiv");
            if (inner_content != null) {
                inner_content.style.top = this.scrollTop + "px";
            }

        } catch (e) { }
    };
    document.getElementById("_PT_PopupFormContainer").onscroll = scroll_func;
            

    // 初始化 PopupForm Y 軸位置
    if (window.frameElement != null) {
        var parent_container = window.frameElement.ownerDocument.getElementById("_PT_PopupFormContainer");
        var scroll_top = parent_container.scrollTop;
        document.getElementById("_PT_PopupMainDiv").style.top = scroll_top + "px";
    }  
}

// 將 Bar (div)設定為固定位置的形式, 此 Method 呼叫後, 會在原 DOM 物件下方產生一個 Padding 物件(通常用於 Titlebar)
function PT_SetFixedBar(id) {

    // 建立 padding div
    var padding_div = document.createElement("DIV");
    padding_div.innerHTML = "&nbsp;";

    var fixed_bar = document.getElementById(id);
    //fixed_bar.insertAdjacentElement("afterEnd", padding_div);    
    fixed_bar.parentNode.insertBefore(padding_div, fixed_bar.nextSibling);

    padding_div.style.height = fixed_bar.offsetHeight + "px";
    fixed_bar.style.position = "fixed";

    // 檢查是否為 Safari 被開啟的 PopupForm, 如果是, 則使用變更位置的方式來固定 FixedBar
    if (window.parent != null &&
       window.parent.document != null &&
       window.parent.document.getElementById("_PT_PopupFormContainer") != null) {
        fixed_bar.style.position = "absolute";

        var make_scroll_func = function (barId) {
            return function () {
                var container = window.parent.document.getElementById("_PT_PopupFormContainer");
                var fixed_bar = document.getElementById(barId);
                fixed_bar.style.top = container.scrollTop + "px";
            }
        };

        window.parent.document.getElementById("_PT_PopupFormContainer").onscroll = make_scroll_func(id);
    }
}

// 關閉 Popup Form (用於 Popup Form 內部或外部皆可)
// Argument :
//     openerWindow 開啟 PopupForm 的 window 物件
//     args         傳送給 callback 的物件參數
function PT_ClosePopupForm(openerWindow, args) {
    var mask_div_id = "_PT_PopupMaskDiv";
    var main_div_id = "_PT_PopupMainDiv";

    if (typeof(openerWindow) == 'undefined')
        openerWindow = window;
  
    // 呼叫 callback (要先 Run, 否則被移除後就不能執行了)
    if (typeof (openerWindow._PT_PopupForm_Callback) != "undefined" && openerWindow._PT_PopupForm_Callback != null) {
        if (typeof (args) != 'undefined')
            openerWindow._PT_PopupForm_Callback(args);
        else
            openerWindow._PT_PopupForm_Callback();
    }

    // 移除 Popup Form       
    if (typeof (openerWindow) != "undefined" && typeof (openerWindow.document) != "undefined" && openerWindow.document.getElementById(mask_div_id) != null)
        openerWindow.document.body.removeChild(openerWindow.document.getElementById(mask_div_id));

    if (typeof (openerWindow) != "undefined" && typeof (openerWindow.document) != "undefined" && openerWindow.document.getElementById(main_div_id) != null)
        openerWindow.document.body.removeChild(openerWindow.document.getElementById(main_div_id));
}


function PT_PopupImageForm(img_url, width, height, callback) {
    var mask_div_id = "_PT_PopupMaskDiv";
    var main_div_id = "_PT_PopupMainDiv";

    var width_str = "";
    var height_padding_str = "0%";
    var height_str = "100%";
    if (typeof (width) != "undefined" && width != null)
        width_str = "width='" + width + "' ";

    if (typeof (height) != "undefined" && height != null && height.indexOf("%") != -1 && height != "100%") {
        var h = parseInt(height);
        height_str = h + "%";
        height_padding_str = Math.floor((100 - h) / 2) + "%";
    }
    
    var html = "";
    // BORDER Html    
    html += "<div id='" + mask_div_id + "' class=\"alpha_30\" ";
    html += "style=\"width:100%; height:100%; position:fixed; top:0px; left:0px; background-color:gray;\" >";
    html += "</div>";

    html += "<div id='" + main_div_id + "' ";
    html += "style=\"position:fixed; top:0px; left:0px; text-align:center;";
    html += "width:100%; height: 100%\" >";

    // Height Padding (for valign=middle)
    if (height_padding_str != "0%")
        html += "<div style=\"height:" + height_padding_str + "\" >&nbsp;</div>";   // height padding div

    // IMG Content
    html += "<img src=\"" + img_url + "\" ";
    html +=  width_str + " height='" + height_str + "' ";
    html += "style=\"background-color:white;";    
    html += "\"";
    html += "/>";

    html += "</table>";

    html += "</div>";

    // 設定 callback
    if (typeof (callback) == 'undefined')
        callback = null;
    window._PT_PopupForm_Callback = callback;

    document.body.insertAdjacentHTML('beforeEnd', html);
    document.getElementById(mask_div_id).style.zIndex = 998;
    document.getElementById(main_div_id).style.zIndex = 999;
}


function PT_FindZIndexRange() {
    var highestZ = null;
    var lowestZ = null;
    var onefound = false;
    var divs = document.getElementsByTagName('*');
    if (!divs.length) { return Array(highestZ, lowestZ); }
    
    for (var i = 0; i < divs.length; i++) {
        if (divs[i].style.position && divs[i].style.zIndex) {
            if (!onefound) {                
                highestZ = lowestZ = parseInt(divs[i].style.zIndex);                
                onefound = true;
            }
            else {
                var ii = parseInt(divs[i].style.zIndex);
                if (ii > highestZ) { highestZ = ii; }
                if (ii < lowestZ) { lowestZ = ii; }
            }
        }
    }
    return Array(highestZ, lowestZ);
}


// Detect Screen Width
// LayoutType :
// L: 240
// M: 320
// H: 480
// P: 768
function PT_DetectScreenType() 
{
    var x = screen.width;

    if (x <= 240)
        return "L";

    if (x > 240 && x <= 320)
        return "M";

    if (x > 320 && x <= 480)
        return "H";


    if (x > 480 && x <= 768)
        return "P";

    return "P";
}

function PT_GetScreenWidth() {
    var w = window.innerWidth;
    return w;
}

function PT_GetScreenHeight() {
    var h = window.innerHeight;
    return h;
}

// Resize Image Url for Detect Screen Width
function PT_ResizeImageByScreenType(img) 
{
    var img_url = img.src;
    var new_url = PT_GetResizeUrl(img_url);
    if (new_url != "") 
    {
        img.src = new_url;
    }
}

function PT_IsImageLoaded(img) {
    if (!img.complete) {
        return false;
    }
 
    if (typeof(img.naturalWidth) !== "undefined" && img.naturalWidth === 0) {
        return false;
    }

    return true;
}

function PT_GetImageNaturalSize(srcImg) {
    if (typeof (srcImg.naturalWidth) == 'undefined') {
        var img = new Image();
        img.src = srcImg.src;
        return { width: img.width, height: img.height };
    }

    return { width: srcImg.naturalWidth, height: srcImg.naturalHeight };
}

// Initial All Container Image in Screen
function PT_InitialImageInScreen(container) {

    try{
        var img_list = container.getElementsByTagName("IMG");
    
        for (var i = 0 ; i < img_list.length; i++) {
            var img = img_list[i];            

            if (PT_IsImageLoaded(img) == true) {
                var sw = PT_GetScreenWidth();
                if (sw > PT_GetScreenHeight())
                    sw = PT_GetScreenHeight();
                                
                if (img.offsetWidth > sw) {
                    img.style.height = parseInt(img.offsetHeight * sw / img.offsetWidth) + "px";
                    img.style.width = sw + "px";
                }                
            } else {                
                img.style.visibility = "hidden";

                // image resize fill in screen then visible
                img.onload = (function (o) {
                    return function () {
                        var sw = PT_GetScreenWidth();
                        if (sw > PT_GetScreenHeight())
                            sw = PT_GetScreenHeight();                        
                                                                        
                        if (o.offsetWidth > sw) {
                            o.style.height = parseInt(o.offsetHeight * sw / o.offsetWidth) + "px";
                            o.style.width = sw + "px";
                        }                        
                        o.style.visibility = "visible";
                    };
                })(img);

                img.onerror = (function (o) {
                    return function () {
                        o.style.visibility = "visible";
                    }
                })(img);
            }
        }
    } catch (e) {
        alert('PT_InitialImageInScreen() Exception !\r\n' + e);
    }
}

// Get Resize Url for Detect Screen Width
// 如果返回空字串, 代表 url 不需修改
function PT_GetResizeUrl(img_url, layout_type) 
{
    // Get Screen Type
    var pt_type = PT_DetectScreenType();    
    if (typeof (layout_type) != "undefined")
        pt_type = layout_type;

    // Detect Image Type
    var s0 = img_url.lastIndexOf('/');
    var file_name = img_url.substr(s0 + 1);
    var url = "";

    var img_type = "";
    if (file_name.indexOf("M_") == 0)
        img_type = "M";
    if (file_name.indexOf("H_") == 0)
        img_type = "H";
    if (file_name.indexOf("P_") == 0)
        img_type = "P";
    

    if (img_type != "" && pt_type != img_type) 
    {
        var left_str = img_url.substr(0, s0 + 1);
        var right_str = img_url.substr(s0 + 2);
        url = left_str + pt_type + right_str;
    }    

    return url;
}


function PT_ResizeAllImageByScreenType(layout_type) 
{
    var pt_type = PT_DetectScreenType();
    if (typeof (layout_type) != "undefined")
        pt_type = layout_type;

    var array = PT_GetAllElements();
    for (var i = 0; i < array.length; i++) 
    {
        var o = array[i];
        
        if (typeof (o.tagName) == 'undefined')
            continue;
        
        // Replace Image Src
        if (o.tagName == 'IMG' || (o.tagName == "INPUT" && o.type == "image")) 
        {
            var new_url = PT_GetResizeUrl(o.src, pt_type);
            if (new_url != "")
                o.src = new_url;                    
        }

        // Replace style background
        if (o.style.backgroundImage != "") 
        {
            var new_url = PT_GetResizeUrl(o.style.backgroundImage, pt_type);
            if (new_url != "")
                o.style.backgroundImage = new_url;            
        }
    }
}


function PT_GetAllElements() 
{    
    var array = document.all ? document.all : document.getElementsByTagName("*");
    return array;
}


function PT_HiddenClientControl(objs) {
    var al = new Array();
    if (typeof (objs) == 'object') {
        for (var i = 0; i < objs.length; i++) {
            al[i] = objs[i];
        }
    }
    else {
        al[0] = objs;
    }

    for (var i = 0; i < al.length; i++) {
        var o = document.getElementById(al[i]);
        if (o == null || typeof (o) == 'undefined')
            continue;
        o.style.visibility = 'hidden';
    }
}

function PT_GetScrollTop() 
{
    var scrY = 0;
    if (typeof (window.pageYOffset) == 'number') {
        // Netscape
        scrY = window.pageYOffset;
    }
    else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
        // DOM
        scrY = document.body.scrollTop;
    }
    else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
        // IE6
        scrY = document.documentElement.scrollTop;
    }
    return scrY;
}

function PT_SetScrollTop(y) 
{
    window.scrollTo(0, y);
}


// Usage :
//     deleteButton.OnClientClick = "return PT_ConfirmThenWait('Delete this data ?');";            
function PT_ConfirmThenWait(msg) 
{
    if (confirm(msg)) 
    {
        PT_DisplayWait();
        return true;
    }

    return false;
}

function PT_NoBack() 
{
    window.history.forward();
}

// Avoid history back
function PT_RegisterNoBack() 
{
    PT_NoBack();
    window.onload = PT_NoBack;        
    window.onunload = function () { void (0); }
}
        

// Get DOM Object absolute Y
function PT_GetObjectTop(obj) {
    if (obj == null)
        return null;

    if (obj.style.position == 'absolute')
        return parseInt(obj.style.top);

    var y = 0;
    var src_obj = obj;
    while (obj.offsetParent != null) {
        y = y + obj.offsetTop;
        if (src_obj != obj)
            y = y - obj.scrollTop;
        obj = obj.offsetParent;
    }

    return y;
}

// Get DOM Object absolute X
function PT_GetObjectLeft(obj) {
    if (obj == null)
        return null;

    if (obj.style.position == 'absolute')
        return parseInt(obj.style.left);

    var x = 0;
    var src_obj = obj;
    while (obj.offsetParent != null) {
        x = x + obj.offsetLeft;
        if (src_obj != obj)
            x = x - obj.scrollLeft;
        obj = obj.offsetParent;
    }

    return x;
}


function PT_HtmlEncode(txt) {
    var temp = document.createElement("div");
    (temp.textContent != null) ? (temp.textContent = txt) : (temp.innerText = txt);
    var output = temp.innerHTML;
    temp = null;
    return output;
}

function PT_HtmlDecode(html) {
    var temp = document.createElement("div");
    temp.innerHTML = html;
    var output = temp.innerText || temp.textContent;
    temp = null;
    return output;
}

// parse .NET DateTime to javascript Date
function PT_ParseNetTime(str) {    
    if (str.indexOf("T") != 'T') {
        str = str.replace("T", " ");
    }

    // 將 - 換成 /
    str = str.replace(/[-]/g, '/');

    // 取出小數點以後的秒數, 因為 JavaScript 無法 Parse ms
    var ms = 0;
    var s0 = str.indexOf('.');
    if (s0 != -1) {
        ms = str.substring(s0 + 1);
        if (ms.length == 1)
            ms = ms + "00";
        if (ms.length == 2)
            ms = ms + "0";
        if (ms.length >= 3)
            ms = ms.substring(0, 3);

        str = str.substring(0, s0);
    }


    var d0 = new Date(str); // Parse Date + Time
    var d1 = new Date();
    d1.setTime(d0.getTime() + parseInt(ms));    // 加上 ms

    return d1;
}

// parse .NET DateTimeOffset to javascript Date (多時區環境下只有 getTime() 是正確值)
// 格式 : 
//      "2016-07-28T17:22:33.5748518+09:00"
//      "2016-07-28T17:22:33.574+09:00"
function PT_ParseNetTimeOffset(str) {

    //var str = "";
    // 取出時區
    var offset = 0;
    if (str.indexOf("+", 19) != -1 || str.indexOf("-", 19) != -1) {
        var sign = 1;

        var sign_index = -1;
        sign = -1;
        if (str.indexOf("-", 19) != -1) {
            sign_index = str.indexOf("-", 19);
            sign = -1;
        }
        else {
            sign_index = str.indexOf("+", 19);
            sign = +1;
        }
        var zone = str.substr(sign_index);      // "+08:00"

        var h = zone.substr(1, 2);  // 取出 Hour
        var m = zone.substr(4, 2);  // 取出 Minute
        var offset = sign * parseInt(h, 10) * 3600 + parseInt(m, 10) * 60;    // 計算 Zone 偏移值(秒)

        //console.log("zone=" + zone + ",h=" + h + ",m=" + m);

        str = str.substr(0, sign_index);    // 切掉時區部     

        //console.log("str1=" + str);
    }

    if (str.indexOf("T") != 'T') {
        str = str.replace("T", " ");

        //console.log("str2=" + str);
    }

    // 將 - 換成 /
    str = str.replace(/[-]/g, '/');

    // 取出小數點以後的秒數, 因為 JavaScript 無法 Parse ms
    var ms = 0;
    var s0 = str.indexOf('.');
    if (s0 != -1) {
        ms = str.substring(s0 + 1);
        if (ms.length == 1)
            ms = ms + "00";
        if (ms.length == 2)
            ms = ms + "0";
        if (ms.length >= 3)
            ms = ms.substring(0, 3);

        str = str.substring(0, s0);
    }

    //console.log("str3=" + str);

    var d0 = new Date(str); // Parse Date + Time

    // 填入 UTC 時間
    var d1 = new Date();

    d1.setTime(0);
    d1.setUTCFullYear(d0.getFullYear());
    d1.setUTCMonth(d0.getMonth());
    d1.setUTCDate(d0.getDate());
    d1.setUTCHours(d0.getHours());
    d1.setUTCMinutes(d0.getMinutes());
    d1.setUTCSeconds(d0.getSeconds());
    d1.setUTCMilliseconds(parseInt(ms, 10));


    //console.log("d0=" + d0);

    //console.log("d1=" + d1);

    var d2 = new Date();
    d2.setTime(d1.getTime() - offset * 1000);   // 加上 offset

    //console.log("d2=" + d2);

    return d2;
}

function PT_GetYYYYMMDD(date) {
    var yyyy = date.getFullYear();
    var MM = date.getMonth() + 1;
    if (MM < 10)
        MM = "0" + MM;
    var dd = date.getDate();
    if (dd < 10)
        dd = "0" + dd;
    var str = yyyy + "/" + MM + "/" + dd;
    return str;
}

function PT_GetHHMMSS(date) {
    var HH = date.getHours();
    if (HH < 10)
        HH = "0" + HH;
    var MM = date.getMinutes();
    if (MM < 10)
        MM = "0" + MM;
    var SS = date.getSeconds();
    if (SS < 10)
        SS = "0" + SS;
    var str = HH + ":" + MM + ":" + SS;
    return str;
}

function PT_GetYYYYMMDDHHMMSS(date) {
    var yyyy = date.getFullYear();
    var MM = date.getMonth() + 1;
    if (MM < 10)
        MM = "0" + MM;
    var dd = date.getDate();
    if (dd < 10)
        dd = "0" + dd;
    var date_str = yyyy + "/" + MM + "/" + dd;

    var HH = date.getHours();
    if (HH < 10)
        HH = "0" + HH;
    var MM = date.getMinutes();
    if (MM < 10)
        MM = "0" + MM;
    var SS = date.getSeconds();
    if (SS < 10)
        SS = "0" + SS;
    
    var time_str = HH + ":" + MM + ":" + SS;

    return date_str + " " + time_str;
}

function PT_GetYYYYMMDDHHMMSSFFF(date) {
    var yyyy = date.getFullYear();
    var MM = date.getMonth() + 1;
    if (MM < 10)
        MM = "0" + MM;
    var dd = date.getDate();
    if (dd < 10)
        dd = "0" + dd;
    var date_str = yyyy + "/" + MM + "/" + dd;

    var HH = date.getHours();
    if (HH < 10)
        HH = "0" + HH;
    var MM = date.getMinutes();
    if (MM < 10)
        MM = "0" + MM;
    var SS = date.getSeconds();
    if (SS < 10)
        SS = "0" + SS;

    var FFF = date.getTime() % 1000;
    if (FFF < 10) {
        FFF = "00" + FFF;
    }
    else if (FFF < 100) {
        FFF = "0" + FFF;
    }

    var time_str = HH + ":" + MM + ":" + SS + "." + FFF;

    return date_str + " " + time_str;
}

function PT_JSFilterDecode(str) {    
    var s = str;
    s = s.replace(/\\\\/g, "\\");   // [\\] => [/]
    s = s.replace(/\\"/g, "\"");    // [\\"] => ["]
    s = s.replace(/\\'/g, "\'");    // [\\'] => ['] 
    s = s.replace(/\\r/g, "\r");    // [\\r] => [\r]
    s = s.replace(/\\n/g, "\n");    // [\\n] => [\n]
    s = s.replace(/\\\//g, "\/");   // [\/] => [/]
    return s;
}

function PT_SubmitConfirm(event, msg, click_client_id) {
    // ps. 若是需要直接檔住 button 需要寫 button1.click = "return PT_SubmitConfirm(event, 'delete ?');"

    var v = confirm(msg);
    if (v == false) {
        event.returnValue = false;
        event.cancelBubble = true;
        return false;
    }

    // click click element
    if (typeof (click_client_id) != "undefined") {
        document.getElementById(click_client_id).click();
    }
}

// Render 樣版, 取得 HTML 內容, 使用 {{ }} 作為 render 的變數值
function PT_TemplateRender(template_id, data) {

    var html = document.getElementById(template_id).innerHTML;

    html = PT_HtmlRender(html, data);    
    return html;
}

// Render Html 樣版, 使用 {{ }} 作為 render 的變數值
function PT_HtmlRender(html, data) {

    // 建立 replaceAll() 的 method
    var replace_all = function (str, key, val) {
        var s = "";

        var s0 = 0;
        while (true) {
            var f0 = str.indexOf(key, s0);
            if (f0 != -1) {
                var left = str.substr(s0, f0 - s0);
                s += left + val;
                s0 = f0 + key.length;
            }
            else {
                s += str.substr(s0, str.length - s0);
                break;
            }
        }
        return s;
    };

    // 填入樣版值
    if (typeof (data) != 'undefine' && data != null) {
        for (var key in data) {
            var val = data[key];
            html = replace_all(html, "{{" + key + "}}", val);
        }
    }

    return html;
}


// 根據 Event 物件, 取得 mobile 或是 mouse 觸發的座標
function PT_GetPositionFromEvent(e) {
    var out = { x: 0, y: 0 };
    if (e.type == 'touchstart' || e.type == 'touchmove' || e.type == 'touchend' || e.type == 'touchcancel') {
        var touch = e.originalEvent.touches[0] || e.originalEvent.changedTouches[0];
        out.x = touch.pageX;
        out.y = touch.pageY;
    } else if (e.type == 'mousedown' || e.type == 'mouseup' || e.type == 'mousemove' || e.type == 'mouseover' || e.type == 'mouseout' || e.type == 'mouseenter' || e.type == 'mouseleave') {
        out.x = e.pageX;
        out.y = e.pageY;
    }
    return out;
}