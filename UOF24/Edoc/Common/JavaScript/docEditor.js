function DocEditor(elementId) {
    this.elementId = elementId;
    this.innerDom = document.getElementById(this.elementId);
    this.innerDom.className += "doceditor_p";

    this._init();

}

DocEditor.prototype._init = function () {

    this.innerDom.contentEditable = true;

    var make_keydown = function (sender) {
        var inner_sender = sender;
        return function () {
            inner_sender._onKeydown();
        };
    };


    $(this.innerDom).on("keydown", make_keydown(this));


    var make_paste = function (sender) {
        var inner_sender = sender;
        return function () {
            inner_sender._onPaste();
        }
    }
    $(this.innerDom).on("paste", make_paste(this));

    var make_drop = function (sender) {
        var inner_sender = sender;
        return function () {
            inner_sender._onDrop();
        }
    }
    $(this.innerDom).on("drop", make_drop(this));


}

DocEditor.prototype._onPaste = function () {

    let paste = (event.clipboardData || window.clipboardData).getData('text');

    this._insertText(paste);
    console.log(paste);

    // 阻止貼上的傳遞
    event.preventDefault();
    //event.stopPropagation();
    this._stopPropagation(event);

    return;
}

DocEditor.prototype._onDrop = function () {

    var data = event.dataTransfer.getData("Text");

    // 阻止拖曳
    event.preventDefault();
    //event.stopPropagation();
    this._stopPropagation(event);

    console.log("禁止拖曳.\r\n" + data);

    return;
}


DocEditor.prototype._onKeydown = function () {

    var o = window.getSelection();
    var focusNode = o.anchorNode;

    var node = focusNode;

    // o.isCollapsed: true => 沒有選取文字
    // o.isCollapsed: false => 正在選取文字

    // 阻止空 LI 因為只有 <br> 被 Enter 切成兩半
    if (event.keyCode == 13) {

        // 阻止空 LI 因為只有 <br> 被 Enter 切成兩半
        if ($(node).html() != null && $(node).text() == "") {
            event.preventDefault();
            //event.stopPropagation();
            this._stopPropagation(event);
            return;
        }

        // 如果選取文字的狀態也阻止按 Enter, 以免被切成兩個 OL
        if (o.isCollapsed == false) {
            event.preventDefault();
            //event.stopPropagation();
            this._stopPropagation(event);
            return;
        }

        // 如果非 OL 的情況下, 按下 Enter, 需要強制換成 <br> 以免被迫加上 <div> 破壞結構
        if (o.isCollapsed == true) {
            if (this._isIndentationNode(focusNode) == false) {
                //document.execCommand("insertHTML", false, "<div><br></div>");                

                //var range = o.getRangeAt(0).cloneRange();
                //range.deleteContents();
                //var sdiv = document.createElement("div");
                //sdiv.innerHTML = "<br />";
                //range.insertNode(sdiv);

                //// Place the caret immediately after the div
                //range.setStartAfter(sdiv);
                //range.collapse(true);
                //o.removeAllRanges();
                //o.addRange(range);                                   

                // 目前使用 css 解決, IE 使用自己的 P Tag 即可
                //this._insertHtml("<div><br /></div>");

                // 取出第一行文字
                var txt = $(node).text();
                var leftStr = txt.substr(0, o.anchorOffset);    // 取出左邊的字串
                var rightStr = txt.substr(o.anchorOffset);  // 取出右邊要加到段落的字串

                var oldRange = o.getRangeAt(0).cloneRange();
                oldRange.setStart(node, o.anchorOffset);
                oldRange.setEnd(node, txt.length);

                // 往下取出(移除)所有 Text 
                var scanNode = focusNode;
                while (true) {
                    if (scanNode == null) {
                        console.log("My GOD ! scanNode is null !")
                        break;
                    }

                    if (typeof (scanNode.contentEditable) != "undefined" && scanNode.contentEditable == "true") {
                        break;
                    }

                    if (scanNode.nextSibling != null) {
                        if (scanNode.nextSibling.tagName != null && scanNode.nextSibling.tagName == "OL") {
                            break;
                        }

                        var txt = scanNode.nextSibling.nodeValue || scanNode.nextSibling.innerText;
                        if (txt != null || typeof (txt) != "undefined") {
                            rightStr += txt;
                        }

                        //scanNode.nextSibling.remove();    // IE not support !
                        scanNode.parentNode.removeChild(scanNode.nextSibling);
                        continue;
                    }

                    if (scanNode.nextSibling == null) {
                        scanNode = scanNode.parentNode;
                        continue;
                    }

                    scanNode = scanNode.nextSibling;
                }

                console.log("被切掉的右邊字串: " + rightStr);

                // 將右邊的字串, 加到下方的段落
                var rootNode = this._findRootNode(focusNode); // 取出 Root Node
                if (rootNode == null)
                    return;

                if ($(rootNode).next().length <= 0) {
                    // 下方沒有 Tag, 則建立第一個 OL
                    var ol = document.createElement("ol");
                    var li = document.createElement("li");

                    rootNode.parentNode.appendChild(ol);

                    ol.appendChild(li);
                    li.innerText = rightStr;

                    this._selectNode(li);   // focus 在右邊的字串上 (已經變成是 LI)        


                    oldRange.deleteContents();  // 移除一開始按 Enter 後面的文字
                }
                else {
                    // 如果下方有 Tag
                    if ($(rootNode).next().length > 0) {
                        var firstChild = $(rootNode).next().first();

                        // 下方第一個 Tag 為 OL, 插入到 OL 第一個 LI
                        if (firstChild[0].tagName && firstChild[0].tagName == "OL") {
                            var ol = firstChild;

                            var li = $("<li />");
                            li.text(rightStr);

                            ol.prepend(li); // 加入 LI 到 OL 的第一個位置

                            this._selectNode(li[0]);
                        }

                        oldRange.deleteContents();  // 移除一開始按 Enter 後面的文字
                    }
                }

                // 取消事件的傳遞
                event.preventDefault();
                this._stopPropagation(event);
                return;
            }
        }
    }

    // 按下 Backspace
    if (event.keyCode == 8) {

        // 非 IE 就不擋 Backspace
        if (this._isIE() == false)
            return;

        // 如果在 OL 裏, 而且在第一個 Char 按下 Backspace, 擋下這種刪除方式, 否則會讓 OL 被切斷 (IE 才會這樣)
        if ($(focusNode).parents("ol").length > 0 && o.anchorOffset == 0) {
            event.preventDefault();
            //event.stopPropagation();
            this._stopPropagation(event);
            return;
        }
    }


    // 按下 TAB 執行縮排
    if (event.keyCode == 9) {
        var isShift;
        if (window.event) {
            key = window.event.keyCode;
            isShift = !!window.event.shiftKey; // typecast to boolean
        } else {
            key = ev.which;
            isShift = !!ev.shiftKey;
        }

        if (isShift == false) {
            this.increaseIndentation();
            event.preventDefault();
            //event.stopPropagation();
            this._stopPropagation(event);
        }
        else {
            this.decreaseIndentation();
            event.preventDefault();
            //event.stopPropagation();
            this._stopPropagation(event);
        }

        return;
    }


    // 如果 Parent 是 OL, 則是在縮排中, 則 PASS
    var ol = $(node).closest("ol");
    if (ol.length > 0)
        return;

    // 找出 Editor 下的 Root Node
    var rootNode = null;
    while (true) {
        //if (node.parentElement == null)
        //    return;        
        //if (node.parentElement.id && node.parentElement.id == this.elementId) {
        //    rootNode = node;
        //    break;
        //}
        //node = node.parentElement;

        if (this._getParent(node) == null)
            return;

        if (this._getParent(node).id && this._getParent(node).id == this.elementId) {
            rootNode = node;
            break;
        }

        node = this._getParent(node);
    }

    // 往上找是否有找到 OL
    var foundOl = false;
    while (true) {
        node = node.previousElementSibling;
        if (node == null) {
            break;
        }

        if (node.nodeName == "OL") {
            foundOl = true;
            break;
        }
    }

    // 找到 OL 代表目前的內容是非法的,必須刪除
    if (foundOl == true) {
        //focusNode.remove();        
        this._removeNode(focusNode);
    }

}

DocEditor.prototype._getParent = function (node) {
    if (node.parentElement)
        return node.parentElement;
    if (node.parentNode)
        return node.parentNode;
    return null;
}


// 找出 node 整串 parent, 位於 Editor 下的 Root Node
DocEditor.prototype._findRootNode = function (node) {

    var parents = $(node).parents();

    var lastNode = node;
    for (var i = 0; i < parents.length; i++) {
        var parent = parents.eq(i);
        if (parent[0].contentEditable && parent[0].contentEditable == "true")
            return lastNode;
        lastNode = parent[0];
    }

    return null;
}

DocEditor.prototype._selectNode = function (node) {

    // Set select to new element
    var sel = window.getSelection();
    sel.removeAllRanges();
    var range = document.createRange();

    var focusNode = node;
    if (node.childNodes && node.childNodes.length > 0) {
        focusNode = node.childNodes[0];
    }

    range.selectNodeContents(focusNode);
    sel.addRange(range);
}

// 檢查 node 是否為縮排結構之中
DocEditor.prototype._isIndentationNode = function (node) {
    var ol = $(node).closest("ol");
    if (ol.length > 0)
        return true;

    return false;
}

DocEditor.prototype.increaseIndentation = function () {
    //document.execCommand('indent');
    //return;

    var selection = window.getSelection();

    if (!selection || !selection.anchorNode || $(selection.anchorNode).parent().length <= 0)
        return;

    var focusNode = selection.anchorNode;

    var rootNode = this._findRootNode(focusNode); // 取出 Root Node
    if (rootNode == null)
        return;

    // RootNode1 => 不能縮排
    // RootNode2 => 不能縮排
    // RootNode3 => 可以縮排, 如果下方沒有 OL, 則要建立 OL, 否則要加到 OL 第一個 LI
    //     <OL>
    //        <LI></LI> => 第一個 LI 不能縮排
    //        <LI></LI> => 可以縮排
    //        <LI></LI> => 可以縮排
    //     </OL>
    // RootNode4 => 非法格式, 不該存在
    // RootNode5 => 非法格式, 不該存在
    // RootNode6 => 非法格式, 不該存在

    var prevOlCount = $(rootNode).prevAll("ol").length;

    // 如果非 OL Tag
    if (rootNode.tagName != "OL") {

        // 如果 Root Node 不是 OL, 上方又有 OL , 則為非法格式
        if (prevOlCount > 0) {
            return;
        }

        // 下方沒有 Tag, 則建立第一個 OL
        if ($(rootNode).next().length <= 0) {
            var ol = document.createElement("ol");
            var li = document.createElement("li");

            rootNode.parentNode.insertBefore(ol, rootNode);
            ol.appendChild(li);
            li.innerText = $(rootNode).text();

            //rootNode.remove();            
            this._removeNode(rootNode);

            this._selectNode(li);
        }

        // 下方有 Tag
        if ($(rootNode).next().length > 0) {
            var firstChild = $(rootNode).next().first();

            // 下方第一個 Tag 為 OL, 插入到 OL 第一個 LI
            if (firstChild[0].tagName && firstChild[0].tagName == "OL") {
                var ol = firstChild;

                var li = $("<li />");
                li.text($(rootNode).text());

                ol.prepend(li); // 加入 LI 到 OL 的第一個位置

                //rootNode.remove();  // 移除原有的 DOM
                this._removeNode(rootNode);

                this._selectNode(li[0]);
            }
        }

        return;
    }

    // 如果 Root Tag 是 OL
    if (rootNode.tagName == "OL") {

        var li = $(focusNode).parent("li").first();
        if (li.length <= 0)
            return;

        // 第一個 LI 不能縮排
        if (li.prev().length == 0)
            return;


        // 第二個以上 LI 可以縮排

        // 取得 prev() 的 OL child, 或者建立一個 OL
        var prevOlObj = li.prev().children("ol").first();

        if (prevOlObj.length <= 0) {
            prevOlObj = $("<ol />");
            li.prev().append(prevOlObj);
        }

        prevOlObj.append(li);   // 將目前 LI 加入到 OL

        this._selectNode(li[0]);
    }

}

// 執行縮排
DocEditor.prototype.decreaseIndentation = function () {
    //document.execCommand('outdent');
    // return;

    var selection = window.getSelection();

    if (!selection || !selection.anchorNode || $(selection.anchorNode).parent().length < 0)
        return;

    var focusNode = selection.anchorNode;

    var rootNode = this._findRootNode(focusNode); // 取出 Root Node
    if (rootNode == null)
        return;

    // RootNode1 => 不能減縮排
    // RootNode2 => 不能減縮排
    // RootNode3 => 不能減縮排
    //     <OL>
    //        <LI>L1</LI>   => 第一階, 第一個 LI 可以減縮排
    //        <LI>L2        => 第一階, 第二個, 不能減縮排
    //            <OL>
    //                <LI>L2.1</LI>     => 第二階, 第一個可以減縮排
    //                <LI>L2.2</LI>     => 第二階, 第二個可以減縮排
    //                <LI>L2.3          => 第二階, 第三個可以減縮排
    //                    <OL>
    //                        <LI>L2.3.1</LI>    => 第三階, 第一個, 可以減縮排
    //                        <Li>L2.3.2</LI>    => 第三階, 第二個, 可以減縮排
    //                    </OL>
    //                </LI>
    //            </OL>
    //        </LI>
    //        <LI>L3</LI> => 第一階, 第三個, 不能減縮排
    //     </OL>
    // RootNode4 => 非法格式, 不該存在
    // RootNode5 => 非法格式, 不該存在
    // RootNode6 => 非法格式, 不該存在

    // 如果非 OL Tag, 不管上面或下面的 Tag 都不能減縮排
    if (rootNode.tagName != "OL") {
        return;
    }

    var li = $(focusNode).parent("li");
    if (li.length <= 0)
        return;

    // 如果要減縮排的 LI 的 Parent 不是 OL, 也不是 LI (第一階要減縮排)
    if (li.parent().parent()[0].tagName != "OL" && li.parent().parent()[0].tagName != "LI") {

        if (li.prev().length > 0) {
            console.log("只有第一個 LI 可以減縮排 !");
            return;
        }

        if (li.children().length > 0) {
            console.log("第一個 LI 有 Children 不能減縮排 !");
            return;
        }

        var li_parent = li.parent();

        var div = $("<div />");
        div.text(li.text());

        li.parent().before(div);
        li.remove();

        // 如果 LI 是 OL 內最後一個 LI, 則移除 OL
        if (li_parent.children().length <= 0)
            li_parent.remove();

        this._selectNode(div[0]);

        return;
    }


    // 取出 LI 的 next 物件
    var list = [];
    var o = li;
    while (true) {
        var o = o.next();
        if (o.length <= 0)
            break;
        list.push(o);
    }


    // 將 next 都加到 LI 的 child
    if (list.length > 0) {
        // 取得或產生 LI 下的 OL
        var li_ol = li.children("ol");
        if (li_ol.length <= 0) {
            li_ol = $("<ol />");
            li.append(li_ol);
        }

        for (var i = 0; i < list.length; i++) {
            li_ol.append(list[i]);
        }
    }

    var li_parent = li.parent();
    li.parent().parent().after(li);     // 將 LI 加到 Parent OL 的下方

    // 如果原先的 OL, 已經沒有 child 則刪除之
    if (li_parent.children().length <= 0) {
        li_parent.remove();
    }

    this._selectNode(li[0]);
}

DocEditor.prototype.getValue = function () {

    // 取得 HTML 的純文字
    var div = $("<div style='visibility:hiden; width:1px, height: 1px' />");

    var children = this.innerDom.childNodes;
    for (var i = 0; i < children.length; i++) {
        var o = children[i];
        if (o.nodeName && o.nodeName == "OL")
            break;

        div.append($(o).clone());
    }

    $(document.body).append(div);

    var header = div[0].innerText;
    //div.remove();
    this._removeNode(div);

    // 取得 OL, LI 的樹狀結構            
    var nodes = [];
    var ol = $(this.innerDom).children("ol");
    if (ol.length > 0) {
        nodes = this._convertNodeFromOl(ol);
    }

    var o = {
        header: header,
        nodes: nodes
    };

    return o;
}

DocEditor.prototype._convertNodeFromOl = function (ol) {
    var nodes = [];
    var children = ol.children("li");
    for (var i = 0; i < children.length; i++) {
        var li = children.eq(i);

        // 取出 LI 的 Text
        var txt = "";
        for (var j = 0; j < li[0].childNodes.length; j++) {
            var li_child = $(li[0].childNodes[j]);
            if (li_child.prop("tagName") == "OL")
                break;
            txt += li_child.text();
        }

        // 取出 LI 內的 OL 結構
        var child_nodes = [];
        var li_ol = li.children("ol").first();
        if (li_ol.length > 0)
            child_nodes = this._convertNodeFromOl(li_ol);

        var node = {
            text: txt,
            nodes: child_nodes
        };

        nodes.push(node);
    }

    return nodes;
}

DocEditor.prototype.setValue = function (o) {

    /* 
    if (!o.header || !o.nodes) {
        return;
    }
    */

    var div = $("<div/>");

    var header = o.header;
    var lines = header.split(/\r?\n/g);
    for (var i = 0; i < lines.length; i++) {
        var line = lines[i];
        if (line.trim() == "")
            continue;
        var line_div = $("<div />");
        line_div.text(line);
        div.append(line_div);
    }

    var nodes = o.nodes;
    var ol = this._expandNodes(nodes);
    div.append(ol);

    var html = div.html();
    $(this.innerDom).html(html);
}

DocEditor.prototype._expandNodes = function (nodes) {

    var ol = $("<ol />");
    for (var i = 0; i < nodes.length; i++) {
        var node = nodes[i];
        var li = $("<li />");
        if (typeof (node.text) != "undefined")
            li.text(node.text);

        if (typeof (node.nodes) != "undefined") {
            var li_ol = this._expandNodes(node.nodes);
            if (li_ol.children().length > 0)
                li.append(li_ol);
        }

        ol.append(li);
    }

    return ol;
}



DocEditor.prototype._stopPropagation = function (event) {
    if (event.stopPropagation) {
        // Mozilla 和 Opera
        event.stopPropagation();
    } else if (window.event) {
        // IE
        window.event.cancelBubble = true;
    }
}

DocEditor.prototype._insertText = function (text) {

    document.getElementById(this.elementId).focus();    // 避免 Insert 到 Editor 外面

    var o = window.getSelection();

    var range = o.getRangeAt(0).cloneRange();
    range.deleteContents();

    var sdiv = document.createTextNode(text);
    range.insertNode(sdiv);

    // Place the caret immediately after the div
    range.setStartAfter(sdiv);
    range.collapse(true);
    o.removeAllRanges();
    o.addRange(range);

}

DocEditor.prototype._insertHtml = function (html) {

    document.getElementById(this.elementId).focus();    // 避免 Insert 到 Editor 外面

    var o = window.getSelection();

    var range = o.getRangeAt(0).cloneRange();
    range.deleteContents();

    var dom = $(html)[0];
    range.insertNode(dom);

    // Place the caret immediately after the div
    range.setStartAfter(dom);
    range.collapse(true);
    o.removeAllRanges();
    o.addRange(range);

    //if (this._isIE() == true) {
    //    var o = window.getSelection();

    //    var range = o.getRangeAt(0).cloneRange();
    //    range.deleteContents();    

    //    var sdiv = document.createElement("div");
    //    sdiv.innerHTML = html;
    //    range.insertNode(sdiv);

    //    // Place the caret immediately after the div
    //    range.setStartAfter(sdiv);
    //    range.collapse(true);
    //    o.removeAllRanges();
    //    o.addRange(range);
    //} else {
    //    document.execCommand('InsertHtml', '', html);
    //}
}

DocEditor.prototype.insertText = function (text) {
    this._insertText(text);
}

DocEditor.prototype.insertHtml = function (html) {
    this._insertHtml(html);
}



//DocEditor.prototype._insertHTML = function(sHtml) {
//    //_win.focus();    
//    if (document.selection.createRange) {
//        document.selection.createRange().pasteHTML(sHtml);
//    } else {
//        document.execCommand('InsertHtml', '', sHtml);
//    }
//}

//DocEditor.prototype._insertText = function (text) {

//    var html = $('<div/>').text(text).html();

//    if (document.selection.createRange) {
//        document.selection.createRange().pasteHTML(html);
//    } else {
//        document.execCommand('InsertHtml', '', html);
//    }
//}







DocEditor.prototype._removeNode = function (node) {
    if (node.remove) {
        node.remove();
        return;
    }

    node.parentNode.removeChild(node);
}

DocEditor.prototype._isIE = function () {
    ua = navigator.userAgent;
    /* MSIE used to detect old browsers and Trident used to newer ones*/
    var is_ie = ua.indexOf("MSIE ") > -1 || ua.indexOf("Trident/") > -1;
    return is_ie;
}











