var appHelper = function appHelper() {
       

}





/* 
播放聲音
*/
appHelper.playSound = function (url) {
var audio = new Audio(url);
audio.play();
}


/*
將時間差轉成 00:00:21 的顯示格式
*/
appHelper.timeToHHMMSS = function (ts) {
    ts = ts / 1000;
    var h = Math.round(ts / 60 / 60);
    if (h < 10) h = "0" + h;
    var m = Math.round(ts / 60) % 60;
    if (m < 10) m = "0" + m;
    var s = Math.round(ts) % 60;
    if (s < 10) s = "0" + s;
    return h + ":" + m + ":" + s;
};

/*
將時間轉成 09:42:51.482 的顯示格式
*/
appHelper.dateTimeToHHMMSSFFF = function (d) {
    
    var h = d.getHours();
    if (h < 10) h = "0" + h;

    var m = d.getMinutes();
    if (m < 10) m = "0" + m;

    var s = d.getMinutes();
    if (s < 10) s = "0" + s;    

    var f = (d.getMilliseconds() / 1000).toFixed(3);
    f = f.substr(f.indexOf('.'));
    
    return h + ":" + m + ":" + s + f;
};

/*
將時間轉成不同時間部分的補零字串物件, 欄位: year, month, day, hour, minute, second, millisecond
*/
appHelper.dateTimeToPaddingObject = function (d) {
    
    var YYYY = d.getFullYear();

    var MM = d.getMonth() + 1;
    if (MM < 10) MM = "0" + MM;

    var DD = d.getDate();
    if (DD < 10) DD = "0" + DD;

    var hh = d.getHours();
    if (hh < 10) hh = "0" + hh;

    var mm = d.getMinutes();
    if (mm < 10) mm = "0" + mm;

    var ss = d.getSeconds();
    if (ss < 10) ss = "0" + ss;

    var fff = d.getMilliseconds;
    if (fff < 10) {
        fff = "00" + fff;
    } else if (fff < 100) {
        fff = "0" + fff;
    }

    var o = {
        year: YYYY.toString(),
        month: MM.toString(),
        day: DD.toString(),
        hour: hh.toString(),
        minute: mm.toString(),
        second: ss.toString(),
        millisecond: fff.toString()
    };

    return o;
}


/*
 取亂數 min 到 max
*/
appHelper.getRnd = function (min, max) {
    var v = Math.floor(Math.random() * (max - min + 1)) + min;
    return v;
}

/*
 取亂數 min 到 max
*/
appHelper.getRndFloat = function (min, max) {
    var v = Math.random() * (max - min) + min;
    return v;
}

/*
 產生一個根據高精度時間產生的隨機 GUID
*/
appHelper.createGuid = function () {
    var d = Date.now();
    if (typeof performance !== 'undefined' && typeof performance.now === 'function') {
        d += performance.now(); //use high-precision timer if available
    }
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = (d + Math.random() * 16) % 16 | 0;
        d = Math.floor(d / 16);
        return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
    });
}


/*
HTML5 Canvas 的 requestAnimationFrame 相容多瀏覽器版
*/
appHelper.requestAnimationFrame = function (cb) {
    var func = window.requestAnimationFrame ||
                window.webkitRequestAnimationFrame ||
                window.mozRequestAnimationFrame ||
                window.oRequestAnimationFrame ||
    // if all else fails, use setTimeout
                function (callback) {
                    return window.setTimeout(callback, 1000 / 60); // shoot for 60 fps
                };
    return func(cb)
};

/*
HTML5 Canvas 的 cancelAnimationFrame 相容多瀏覽器版
*/
appHelper.cancelAnimationFrame = function (handlerId) {
    var func = window.cancelAnimationFrame ||
                window.webkitCancelAnimationFrame ||
                window.mozCancelAnimationFrame ||
                window.oCancelAnimationFrame ||
                function (id) {
                    window.clearTimeout(id);
                };
    func(handlerId);
};

appHelper.enabledFullScreen = function (enabled) {

    var isFullScreen = window.innerHeight == screen.height;
    if (typeof (enabled) == "undefined") {                                
        return isFullScreen;
    }

    if (enabled) {
        // Enabled FullScreen
        var doc = window.document;
        var docEl = doc.documentElement;
        var requestFullScreen = docEl.requestFullscreen || docEl.mozRequestFullScreen || docEl.webkitRequestFullScreen || docEl.msRequestFullscreen;

        if (!doc.fullscreenElement && !doc.mozFullScreenElement && !doc.webkitFullscreenElement && !doc.msFullscreenElement) {
            requestFullScreen.call(docEl);
        }
    }
    else {
        // Cancel FullScreen
        var doc = window.document;
        var cancelFullScreen = doc.exitFullscreen || doc.mozCancelFullScreen || doc.webkitExitFullscreen || doc.msExitFullscreen;

        cancelFullScreen.call(doc);                
    }

    return isFullScreen;
}

// 將 Image 轉成 DataURL
// outputFormat 預設 : image/jpeg (選項)
// level 為圖片品質, 其值為 : 0.00 ~ 1.00 (選項)
// targetWidth 轉換後的圖片寬度 (選項)
// targetHeight 轉換後的圖片高度 (選項)
// isZoom 是否使用 Zoom 功能, 設定為 true 時, targetWidth 與 targetHeight 必須要指定, 此時圖片寬高不一定填滿 targetWidth 或 targetHeight
appHelper.imageToDataUrl = function (image, outputFormat, level, targetWidth, targetHeight, isZoom) {

    if (typeof (outputFormat) == "undefined")
        outputFormat = "image/jpeg";

    var canvas = document.createElement('CANVAS');
    var g = canvas.getContext('2d');
    var dataUrl = null;

    var w = image.naturalWidth;
    var h = image.naturalHeight;
    if (typeof (targetWidth) != "undefined") {
        w = targetWidth;
        h = image.naturalHeight * targetWidth / image.naturalWidth;
    }

    if (typeof(targetHeight) != "undefined") {
        h = targetHeight;
        w = image.naturalWidth * targetHeight / image.naturalHeight;
    }

    if (typeof (targetWidth) != "undefined" && typeof (targetHeight) != "undefined") {
        w = targetWidth;
        h = targetHeight;
    }

    if (isZoom == true && typeof (targetWidth) != "undefined" && typeof (targetHeight) != "undefined") {
        w = targetWidth;
        h = image.naturalHeight * targetWidth / image.naturalWidth;
        if (h > targetHeight) {
            h = targetHeight;
            w = image.naturalWidth * targetHeight / image.naturalHeight;
        }
    }
    
    canvas.width = w;
    canvas.height = h;    
    g.drawImage(image, 0, 0, w, h);

    if (typeof (level) == "undefined") {
        dataUrl = canvas.toDataURL(outputFormat);
    } else {
        dataUrl = canvas.toDataURL(outputFormat, level);
    }

    return dataUrl;
}

// 將 DataUrl 轉成 Image
appHelper.dataUrlToImage = function(dataUrl, callback) {
    var img = document.createElement("IMG");

    var imgOnLoad = (function (img, cb) {
        var inner_callback = cb;
        var inner_img = img;
        return function () {
            inner_callback(inner_img);
        }
    })(img, callback);

    img.onload = imgOnLoad;
    img.src = dataUrl;
}

appHelper.numberToSizeString = function (size) {

    if (size < 1024) {
        return size + " B";
    }

    if (size >= 1024 && size < 1024 * 1024) {
        var s = size / 1024;
        return s.toFixed(2)  + " KB";
    }
    
    var str = (size / 1024 / 1024).toFixed(2) + " MB";
    return str;
}

 
appHelper.showToast = function (msg, delay) {

    if (typeof (delay) == "undefined")
        delay = 1500;

    $("<div class='ui-loader ui-overlay-shadow ui-body-e ui-corner-all'><h3>" + msg + "</h3></div>")
    .css({
        display: "block",
        opacity: 0.90,
        position: "fixed",
        padding: "7px",
        "text-align": "center",
        width: "270px",
        left: ($(window).width() - 284) / 2,
        top: $(window).height() / 2
    })
    .appendTo($.mobile.pageContainer).delay(delay)
    .fadeOut(400, function () {
        $(this).remove();
    });
}

appHelper.htmlEncode = function htmlEncode(value) {
    //create a in-memory div, set it's inner text(which jQuery automatically encodes)
    //then grab the encoded contents back out.  The div never exists on the page.
    return $('<div/>').text(value).html();
}

appHelper.htmlDecode = function htmlDecode(value) {
    return $('<div/>').html(value).text();
}

// 從目前 window 的 URL 取出參數值
appHelper.getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    var sParameterName;
    var i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            // Some iOS not support decodeURIComponent() in CHINESE WORD
            //return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
            return sParameterName[1] === undefined ? true : unescape(sParameterName[1]);
        }
    }
};

/*
檢查目前瀏覽器是否為 FireFox
*/
appHelper.isFireFox = function () {
    var isFireFox = navigator.userAgent.toLowerCase().indexOf('firefox') > -1;
    return isFireFox;
}

/*
檢查目前裝置是否為 iOS
*/
appHelper.isIOS = function () {

    return [
      'iPad Simulator',
      'iPhone Simulator',
      'iPod Simulator',
      'iPad',
      'iPhone',
      'iPod'
    ].includes(navigator.platform)
    // iPad on iOS 13 detection
    || (navigator.userAgent.includes("Mac") && "ontouchend" in document);
}

/*
比對來源字串, 前面是否有某個字串
*/
appHelper.stringStartsWith = function (source, startWith) {

    if (source.substring(startWith, startWith.length) === startWith) {
        return true;
    }

    return false;
}

/*
使用空白字元, 切割出多個 token
*/
appHelper.stringSpaceSplit = function (data) {
    var str = data.trim();                  // 截掉頭尾空白
    var str = str.replace(/\s\s+/g, ' ');   // 將多個空白併成一個
    var tokenList = str.split(' ');
    return tokenList;
}

/*
使用空白字元, 切割出多個 token, 並且支援雙引號    
*/
appHelper.parseToken = function (content) {
    // Ex:
    // FUNC 速度 " $$距離$$ / $$時間$$ "
    // => ["FUNC", "速度", " $$距離$$ / $$時間$$ "]

    var list = [];
    var index = 0;
    var begin = false;
    var quoteChar = "";
    var token = "";
    while (index < content.length) {
        var ch = content[index];

        // 如果還沒有 capture token
        if (begin == false) {
            if (ch != ' ' && ch != '\t' && ch != '\"') {
                begin = true;
                quoteChar = "";
                token = ch;
            }

            if (ch == ' ' || ch == '\t') {
            }

            if (ch == "\"") {
                begin = true;
                quoteChar = '\"';
            }

            index++;
            continue;
        }

        // 如果已經開始 capture token
        if (begin == true) {

            // 雙引號擷取
            if (quoteChar == '\"') {
                if (ch != '\"') {
                    token += ch;
                }

                // 碰到 ["] 結束擷取
                if (ch == '\"') {
                    list.push(token);
                    begin = false;
                    quoteChar = "";
                    token = "";
                }
                index++;
                continue;
            }

            // 一般擷取
            if (quoteChar == "") {
                if (ch != ' ' && ch != '\t' && ch != '\"') {
                    token += ch;
                }

                // 碰到空白 結束擷取
                if (ch == ' ' || ch == '\t') {
                    list.push(token);
                    begin = false;
                    token = "";
                }

                // 碰到 ["] 結束擷取, 並開始新的擷取
                if (ch == '\"') {
                    list.push(token);
                    token = "";
                    begin = true;
                    quoteChar = '\"';
                }

                index++;
                continue;
            }
        }
    }

    // 如果是最後的 Token
    if (token != "")
        list.push(token);

    return list;
}


