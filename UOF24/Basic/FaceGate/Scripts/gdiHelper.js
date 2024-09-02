var gdiHelper = function gdiHelper() {

}

// 畫線
gdiHelper.drawLine = function (g, x0, y0, x1, y1, color, lineWidth, lineDash) {
    g.save();
    g.beginPath();

    if (typeof (color) != "undefined")
        g.strokeStyle = color;

    if (typeof (lineWidth) != "undefined")
        g.lineWidth = lineWidth;

    if (typeof (lineDash) != "undefined")
        g.setLineDash(lineDash);

    g.beginPath();
    g.moveTo(x0, y0);
    g.lineTo(x1, y1);
    g.stroke();
    g.restore();
}

gdiHelper.drawPath = function (g, path, color, lineWidth, lineDash) {
    g.save();
    g.beginPath();

    if (typeof (color) != "undefined")
        g.strokeStyle = color;

    if (typeof (lineWidth) != "undefined")
        g.lineWidth = lineWidth;

    if (typeof (lineDash) != "undefined")
        g.setLineDash(lineDash);

    for (var i = 0; i < path.length; i++) {
        var p = path[i];
        if (i == 0) {
            g.moveTo(p.x, p.y);
            continue;
        }
        g.lineTo(p.x, p.y);
    }

    g.stroke();
    g.restore();
}


// 畫矩形
gdiHelper.drawRectangle = function (g, x, y, width, height, color, lineWidth, lineDash) {

    g.save();
    g.beginPath();

    if (typeof (color) != "undefined")
        g.strokeStyle = color;

    if (typeof (lineWidth) != "undefined")
        g.lineWidth = lineWidth;

    if (typeof (lineDash) != "undefined")
        g.setLineDash(lineDash);

    g.rect(x, y, width, height);
    g.stroke();
    g.restore();
}

// 填滿矩形
gdiHelper.fillRectangle = function (g, x, y, width, height, fillStyle, strokeStyle, lineWidth, lineDash) {

    g.save();
    g.beginPath();

    if (typeof (fillStyle) != "undefined")
        g.fillStyle = fillStyle;

    if (typeof (strokeStyle) != "undefined")
        g.strokeStyle = strokeStyle;

    if (typeof (lineWidth) != "undefined")
        g.lineWidth = lineWidth;

    if (typeof (lineDash) != "undefined")
        g.setLineDash(lineDash);

    g.rect(x, y, width, height);
    g.fill();

    if (typeof (strokeStyle) != "undefined")
        g.stroke();

    g.restore();
}

// 畫圓形
gdiHelper.drawCircle = function (g, cx, cy, radius, color, lineWidth, lineDash) {

    g.save();
    g.beginPath();

    if (typeof (color) != "undefined")
        g.strokeStyle = color;

    if (typeof (lineWidth) != "undefined")
        g.lineWidth = lineWidth;

    if (typeof (lineDash) != "undefined")
        g.setLineDash(lineDash);

    g.arc(cx, cy, radius, 0, 2 * Math.PI);
    g.stroke();
    g.restore();
}

// 填滿圓形
gdiHelper.fillCircle = function (g, cx, cy, radius, fillStyle, strokeStyle, lineWidth, lineDash) {

    g.save();
    g.beginPath();

    if (typeof (fillStyle) != "undefined")
        g.fillStyle = fillStyle;

    if (typeof (strokeStyle) != "undefined")
        g.strokeStyle = strokeStyle;

    if (typeof (lineWidth) != "undefined")
        g.lineWidth = lineWidth;

    if (typeof (lineDash) != "undefined")
        g.setLineDash(lineDash);

    g.arc(cx, cy, radius, 0, 2 * Math.PI);
    g.fill();

    if (typeof (strokeStyle) != "undefined")
        g.stroke();

    g.restore();
}

// 畫簍空文字
gdiHelper.drawText = function (g, text, x, y, fontSize, color, align, baseline) {
    g.save();

    g.beginPath();

    g.font = fontSize.toFixed(2) + "px Arial";

    if (typeof (color) != "undefined")
        g.strokeStyle = color;

    g.textAlign = "left";
    if (typeof (align) != "undefined")
        g.textAlign = align;

    g.textBaseline = "top";
    if (typeof (baseline) != "undefined")
        g.textBaseline = baseline;

    g.strokeText(text, x, y);

    g.restore();
}

gdiHelper.fillText = function (g, text, x, y, fontSize, fillStyle, strokeStyle, align, baseline) {

    var textX = x;
    var textY = y;
    var lines = ("" + text).split(/\r?\n/);
    for (var i = 0; i < lines.length; i++) {
        var line = lines[i];
        gdiHelper._fillText(g, line, textX, textY, fontSize, fillStyle, strokeStyle, align, baseline);
        textY += fontSize * 1.2;
    }
}


// 填滿文字
gdiHelper._fillText = function (g, text, x, y, fontSize, fillStyle, strokeStyle, align, baseline) {

    g.save();

    g.beginPath();

    g.font = fontSize.toFixed(2) + "px Arial";

    if (typeof (fillStyle) != "undefined")
        g.fillStyle = fillStyle;

    if (typeof (strokeStyle) != "undefined")
        g.strokeStyle = strokeStyle;

    g.textAlign = "left";
    if (typeof (align) != "undefined")
        g.textAlign = align;

    g.textBaseline = "top";
    if (typeof (baseline) != "undefined")
        g.textBaseline = baseline;

    g.fillText(text, x, y);

    if (typeof (strokeStyle) != "undefined") {
        var lineWidth = fontSize * 0.03;
        if (lineWidth < 1)
            lineWidth = 1;

        g.lineWidth = lineWidth;
        g.strokeText(text, x, y);
    }

    g.restore();
}

gdiHelper.fillShadowText = function (g, text, x, y, fontSize, fillStyle, shadowColor, align, baseline) {

    var textX = x;
    var textY = y;
    var lines = ("" + text).split(/\r?\n/);
    for (var i = 0; i < lines.length; i++) {
        var line = lines[i];
        gdiHelper._fillShadowText(g, line, textX, textY, fontSize, fillStyle, shadowColor, align, baseline);
        textY += fontSize * 1.2;
    }
}

// 填滿陰影文字
gdiHelper._fillShadowText = function (g, text, x, y, fontSize, fillStyle, shadowColor, align, baseline) {

    g.save();

    g.beginPath();

    g.font = fontSize.toFixed(2) + "px Arial";


    g.fillStyle = "white";
    if (typeof (fillStyle) != "undefined")
        g.fillStyle = fillStyle;

    g.shadowColor = "black";
    if (typeof (shadowColor) != "undefined")
        g.shadowColor = shadowColor;

    g.shadowBlur = parseInt(fontSize * 0.5, 10);    // 外援擴散的點數範圍

    g.textAlign = "left";
    if (typeof (align) != "undefined")
        g.textAlign = align;

    g.textBaseline = "top";
    if (typeof (baseline) != "undefined")
        g.textBaseline = baseline;

    g.fillText(text, x, y);

    g.restore();
}

gdiHelper.fillOffsetText = function (g, line, textX, textY, fontSize, fillStyle, offsetStyle, align, baseline) {

    var textX = x;
    var textY = y;
    var lines = ("" + text).split(/\r?\n/);
    for (var i = 0; i < lines.length; i++) {
        var line = lines[i];
        gdiHelper._fillOffsetText(g, line, textX, textY, fontSize, fillStyle, offsetStyle, align, baseline);
        textY += fontSize * 1.2;
    }
}

// 填滿文字與偏移文字
gdiHelper._fillOffsetText = function (g, text, x, y, fontSize, fillStyle, offsetStyle, align, baseline) {

    g.save();

    g.beginPath();

    g.font = fontSize.toFixed(2) + "px Arial";

    g.textAlign = "left";
    if (typeof (align) != "undefined")
        g.textAlign = align;

    g.textBaseline = "top";
    if (typeof (baseline) != "undefined")
        g.textBaseline = baseline;

    var offset = fontSize * 0.05;

    // draw offset text
    g.fillStyle = "black";
    if (typeof (offsetStyle) != "undefined")
        g.fillStyle = offsetStyle;

    g.fillText(text, x + offset, y + offset);

    // draw main text
    g.fillStyle = "white";
    if (typeof (offsetStyle) != "undefined")
        g.fillStyle = fillStyle;

    g.fillText(text, x, y);

    g.restore();
}


// 畫十字
gdiHelper.drawCross = function (g, x, y, length, color, shadowColor, lineWidth) {

    g.save();
    g.beginPath();

    g.strokeStyle = "white";
    if (typeof (color) != "undefined")
        g.strokeStyle = color;

    g.shadowColor = "black";
    if (typeof (shadowColor) != "undefined")
        g.shadowColor = "black";

    g.shadowBlur = length * 0.2;

    g.lineWidth = length * 0.08;
    if (typeof (lineWidth) != "undefined")
        g.lineWidth = lineWidth;

    g.moveTo(x - length / 2, y);
    g.lineTo(x + length / 2, y);

    g.moveTo(x, y - length / 2);
    g.lineTo(x, y + length / 2);
    g.stroke();

    g.restore();
}


// 畫矩形(根據對角線兩點)
gdiHelper.drawRectangleBy2P = function (g, x0, y0, x1, y1, color, lineWidth, lineDash) {
    var x = Math.min(x0, x1);
    var y = Math.min(y0, y1);
    var w = Math.abs(x0 - x1 + 1);
    var h = Math.abs(y0 - y1 + 1);

    gdiHelper.drawRectangle(g, x, y, w, h, color, lineWidth, lineDash);
}

// 填滿矩形(根據對角線兩點)
gdiHelper.fillRectangleBy2P = function (g, x0, y0, x1, y1, fillStyle, strokeStyle, lineWidth, lineDash) {
    var x = Math.min(x0, x1);
    var y = Math.min(y0, y1);
    var w = Math.abs(x0 - x1 + 1);
    var h = Math.abs(y0 - y1 + 1);

    gdiHelper.fillRectangle(g, x, y, w, h, fillStyle, strokeStyle, lineWidth, lineDash);
}

// 畫出圓形(根據對角線兩點)
gdiHelper.drawCircleBy2P = function (g, x0, y0, x1, y1, color, lineWidth, lineDash) {
    var cx = (x0 + x1) / 2;
    var cy = (y0 + y1) / 2;
    var radius = Math.sqrt((x0 - x1) * (x0 - x1) + (y0 - y1) * (y0 - y1)) / 2;

    gdiHelper.drawCircle(g, cx, cy, radius, color, lineWidth, lineDash);
}

// 填滿圓形(根據對角線兩點)
gdiHelper.fillCircleBy2P = function (g, x0, y0, x1, y1, fillStyle, strokeStyle, lineWidth, lineDash) {
    var cx = (x0 + x1) / 2;
    var cy = (y0 + y1) / 2;
    var radius = Math.sqrt((x0 - x1) * (x0 - x1) + (y0 - y1) * (y0 - y1)) / 2;

    gdiHelper.fillCircle(g, cx, cy, radius, fillStyle, strokeStyle, lineWidth, lineDash);
}

// 將圖片或者是 Video, 繪製到 Canvas 的某個區塊 (overFill 為 true, 代表繪製的區域, 會過度放大, 而不會產生黑邊)
gdiHelper.drawZoomImage = function (canvas, x, y, width, height, img, imgWidth, imgHeight, overFill) {
    var g = canvas.getContext("2d");

    // 計算 img 執行 zoom 運算到 canvas 的大小
    var destWidth = width;
    var destHeight = width / imgWidth * imgHeight;
    if (typeof (overFill) == "boolean" && overFill == true) {
        // 影像填滿螢幕
        if (destHeight < height) {
            destHeight = height;
            destWidth = height / imgHeight * imgWidth;
        }
    }
    else {
        // 影像完全顯示
        if (destHeight > height) {
            destHeight = height;
            destWidth = height / imgHeight * imgWidth;
        }
    }

    var destX = x + (width - destWidth) / 2;
    var destY = y + (height - destHeight) / 2;

    g.drawImage(img, destX, destY, destWidth, destHeight);

    var o = {
        x: destX,
        y: destY,
        width: destWidth,
        height: destHeight
    };
    return o;
}


// 複製一份只有規格的 Canvas
gdiHelper.cloneCanvas = function (canvas) {

    var tempCanvas = document.createElement("CANVAS");
    tempCanvas.setAttribute("width", canvas.width);
    tempCanvas.setAttribute("height", canvas.height);

    return tempCanvas;
}

// 複製一份包含圖像內容的 Canvas
gdiHelper.copyCanvas = function (canvas, width, height, isFlip) {
    var tempCanvas = document.createElement("CANVAS");

    if (typeof (width) == "undefined") width = canvas.width;
    if (typeof (height) == "undefined") height = canvas.height;

    tempCanvas.setAttribute("width", width);
    tempCanvas.setAttribute("height", height);
    var g = tempCanvas.getContext("2d");

    if (typeof (isFlip) != "undefined" && isFlip == true) {
        g.translate(width, 0);       // 以右上為中心,向右翻轉畫布
        g.scale(-1, 1);
        g.drawImage(canvas, 0, 0);
        g.setTransform(1, 0, 0, 1, 0, 0);
    } else {
        g.drawImage(canvas, 0, 0);
    }

    return tempCanvas;
}

// 取得 Canvas 長寬小的一邊, 當作計算基準
gdiHelper.getBaseWidth = function (canvas) {
    var w = canvas.width;
    if (w > canvas.height)
        w = canvas.height;
    return w;
}


