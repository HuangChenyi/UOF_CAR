<%@ Page Language="C#" AutoEventWireup="true" Inherits="Common_javascript_CommonJS" Codebehind="CommonJS.aspx.cs" %>
//
//  2007/11/6 更新
//

// DMS 開出檔案連結視窗
function showDMSDocLink(docShortID)
{
    $uof.dialog.open2("~/DMS/DocStore/DMSDocDownLoadLink.aspx","","",500,360, function (returnValue) {return false;},{"docShortID":docShortID});;
    return false;
}



function showPersonalDetail(userGUID)
{
    $uof.dialog.open2("~/Basic/Personal/PersonalDetailInformation.aspx","","",750,700, function (returnValue) {return false;},{"userid":userGUID});
    return false;
}


function utf16to8(str) {
    var out, i, len, c;

    out = "";
    len = str.length;
    for(i = 0; i < len; i++) {
 c = str.charCodeAt(i);
 if ((c >= 0x0001) && (c <= 0x007F)) {
     out += str.charAt(i);
 } else if (c > 0x07FF) {
     out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
     out += String.fromCharCode(0x80 | ((c >>  6) & 0x3F));
     out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));
 } else {
     out += String.fromCharCode(0xC0 | ((c >>  6) & 0x1F));
     out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));
 }
    }
    return out;
}

function utf8to16(str) {
    var out, i, len, c;
    var char2, char3;

    out = "";
    len = str.length;
    i = 0;
    while(i < len) {
 c = str.charCodeAt(i++);
 switch(c >> 4)
 { 
   case 0: case 1: case 2: case 3: case 4: case 5: case 6: case 7:
     // 0xxxxxxx
     out += str.charAt(i-1);
     break;
   case 12: case 13:
     // 110x xxxx   10xx xxxx
     char2 = str.charCodeAt(i++);
     out += String.fromCharCode(((c & 0x1F) << 6) | (char2 & 0x3F));
     break;
   case 14:
     // 1110 xxxx  10xx xxxx  10xx xxxx
     char2 = str.charCodeAt(i++);
     char3 = str.charCodeAt(i++);
     out += String.fromCharCode(((c & 0x0F) << 12) |
        ((char2 & 0x3F) << 6) |
        ((char3 & 0x3F) << 0));
     break;
 }
    }

    return out;
}

   function Utf8ByteArrayToString(bytes) {

       var out = [], pos = 0, c = 0;
       while (pos < bytes.length) {
           var c1 = bytes[pos++];
           if (c1 < 128) {
               out[c++] = String.fromCharCode(c1);
           } else if (c1 > 191 && c1 < 224) {
               var c2 = bytes[pos++];
               out[c++] = String.fromCharCode((c1 & 31) << 6 | c2 & 63);
           } else {
               var c2 = bytes[pos++];
               var c3 = bytes[pos++];
               out[c++] = String.fromCharCode(
                   (c1 & 15) << 12 | (c2 & 63) << 6 | c3 & 63);
           }
       }
       return out.join('');
   }

   function StringToUtf8ByteArray ( str ) {
       str = str.replace( /\r\n/g , '\n');
       var out = [], p = 0;
       for (var i = 0; i < str.length; i++) {
           var c = str.charCodeAt(i);
           if (c < 128) {
               out[p++] = c;
           } else if (c < 2048) {
               out[p++] = (c >> 6) | 192;
               out[p++] = (c & 63) | 128;
           } else {
               out[p++] = (c >> 12) | 224;
               out[p++] = ((c >> 6) & 63) | 128;
               out[p++] = (c & 63) | 128;
           }
       }
       return out;
   }

   function ByteArrayToHexString(a, upcase) {
        upcase = upcase || true;
        var hex_tab = upcase ? "0123456789ABCDEF" : "0123456789abcdef";
        var r = "";
        for (var i = 0; i < a.length; i++) {
            var b = hex_tab.charAt((a[i] >> 4) & 0x0F) +
                hex_tab.charAt(a[i] & 0x0F);
            r += b;
        }
        return r;
    }





function Base64encode(str) 
{
   if(str!="" && str != undefined){
    return Base64.encode(str);
    }
    return "";
}

function Base64encodeForUrl(str)
{
   var out = Base64.encode(str);
   out=out.replace("+","%2B");
}


function Base64decode(str) 
{
    if(str!="" && str != undefined){
        return Base64.decode(str);
    }
    return "";
}




function TreeCheckedControl(treeId,checked)
{
  var tree= igtree_getTreeById(treeId); 
  var objNodeElement=igtree_getFirstChildNodeElement(tree,false);
  if(objNodeElement!=null)
  {
      var node=igtree_getNodeById(objNodeElement.id);      
      TreeCheckedChildNode(node,checked)
  }
}

function TreeCheckedChildNode(node,checked)
{
     if(node.hasCheckbox())
     {
        node.setChecked(checked);
     }
     
     if(node.hasChildren())
     {
        subNode=node.getFirstChild();
        TreeCheckedChildNode(subNode,checked);
     }
     nextNode=node.getNextSibling();
     if(nextNode!=null)
     {
        TreeCheckedChildNode(nextNode,checked);
     }
}

function GetTreeCheckedNode(treeId)
{
    var checkedNodeList = new Array();
    var tree= igtree_getTreeById(treeId); 
    var objNodeElement=igtree_getFirstChildNodeElement(tree,false);
    if(objNodeElement!=null)
    {
        var node=igtree_getNodeById(objNodeElement.id);
        CheckedNodes(node,checkedNodeList)
    }
    
    return checkedNodeList;
}

function CheckedNodes(node,checkedNodeList)
{ 
     if(node.hasCheckbox() && node.getChecked())
     {     
       checkedNodeList[checkedNodeList.length]=node;
     }
     
     if(node.hasChildren())
     {
        var subNode=node.getFirstChild();
        CheckedNodes(subNode,checkedNodeList);
     }
     var nextNode=node.getNextSibling();
     if(nextNode!=null)
     {
        CheckedNodes(nextNode,checkedNodeList);
     }
     
}

function HasGridViewChecked(gridViewClientId)
{
   var gridObj = document.getElementById(gridViewClientId);
   var checkboxs = gridObj.getElementsByTagName('INPUT');
   var i;
   for(i = 1; i < checkboxs.length; i++)
   {
      if(checkboxs[i].checked)
      {
         return true;
      }
   }
   
   return false;
}

function WebForm_CallbackComplete_SyncFixed() {
   for (var i = 0; i < __pendingCallbacks.length; i++) {
   callbackObject = __pendingCallbacks[i];
   if (callbackObject && callbackObject.xmlRequest && (callbackObject.xmlRequest.readyState == 4)) {
   
     if (!__pendingCallbacks[i].async) {
       __synchronousCallBackIndex = -1;
     }
     __pendingCallbacks[i] = null;

     var callbackFrameID = "__CALLBACKFRAME" + i;
     var xmlRequestFrame = document.getElementById(callbackFrameID);
     if (xmlRequestFrame) {
       xmlRequestFrame.parentNode.removeChild(xmlRequestFrame);
     }

     WebForm_ExecuteCallback(callbackObject);
   }
 }
}

if (typeof (WebForm_CallbackComplete) == "function") {
  WebForm_CallbackComplete = WebForm_CallbackComplete_SyncFixed;
}

function HtmleditorBeforeAction(p1,p2,p3,p4,p5,p6,p7,p8)
{    
    
    var obj=window.event.srcElement;   
    //debugger;
    if(typeof(obj)!="undefined" && obj.tagName.toLowerCase()=="img" &&  p2=="RightClick")
    {
     
        var checkFlag=CheckIsInHtmleditorContent(obj,p1.ID);   

        if(checkFlag)
        {  
            var img_clone = document.createElement("IMG");
            img_clone.src = obj.src;
            
            obj.width = img_clone.width;
            obj.style.width = img_clone.width+'px';
            obj.height = img_clone.height;         
            obj.style.height = img_clone.height+'px';          
            
            img_clone.removeNode();                        
        }
    }
    else
    {
       
        return true;
    }
}

//
// 2006/12/8 
//

function CheckIsInHtmleditorContent(obj,topElementId)
{
    if(obj.parentElement.id==topElementId+"_tw")
    {   
        return true;
    }

    else if(obj.parentElement.id==topElementId+"_tb")
    {   
        return false;
    }
    else
    {    
        if(obj.parentElement.id==topElementId)
        {
            return false;
        }
        else
        {
            return CheckIsInHtmleditorContent(obj.parentElement,topElementId);   
        }
     
    }

}

//
// 2006/12/13  
//

function CreateNewGuid()
{
   var guid = ""; 
    for (var i = 1; i <= 32; i++) 
     { 
     var n = Math.floor(Math.random() * 16.0).toString(16); 
     guid += n; 
     if ((i == 8) || (i == 12) || (i == 16) || (i == 20)) 
      guid += "-"; 
     } 
    return guid ; 

}

//
// 2007/1/8
//
function GetGridViewChecked(gridViewClientId) {
    //var gridObj = document.getElementById(gridViewClientId);
    //var checkboxs = gridObj.getElementsByTagName('INPUT');

    var checkedString = "";
    var checkboxs = $('#'+ gridViewClientId +' input[type=checkbox][purpose=autocheck]')
        .each(function(){
            if($(this).prop("checked")){ checkedString+=","+$(this).attr("DataKey");}
    });
        
   
    return checkedString.substring(1);
}

2007/4/23
var Base64 = {

    // private property
    _keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",

    // public method for encoding
    encode : function (input) {
        var output = "";
        var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
        var i = 0;

        input = Base64._utf8_encode(input);

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
    decode : function (input) {
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

        output = Base64._utf8_decode(output);

        return output;

    },

    // private method for UTF-8 encoding
    _utf8_encode : function (string) {
        string = string.replace(/\r\n/g,"\n");
        var utftext = "";

        for (var n = 0; n < string.length; n++) {

            var c = string.charCodeAt(n);

            if (c < 128) {
                utftext += String.fromCharCode(c);
            }
            else if((c > 127) && (c < 2048)) {
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
    _utf8_decode : function (utftext) {
        var string = "";
        var i = 0;
        var c = c1 = c2 = 0;

        while ( i < utftext.length ) {

            c = utftext.charCodeAt(i);

            if (c < 128) {
                string += String.fromCharCode(c);
                i++;
            }
            else if((c > 191) && (c < 224)) {
                c2 = utftext.charCodeAt(i+1);
                string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
                i += 2;
            }
            else {
                c2 = utftext.charCodeAt(i+1);
                c3 = utftext.charCodeAt(i+2);
                string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
                i += 3;
            }

        }

        return string;
    }

}

//2009/8/6

// That function is called when WebHtmlEditor1 was initialized.
function HtmleditorInitialize(oEditor) {
    initializeYoutubeDialog(oEditor);
}


function youtubeIDextract(url) 
{ 
  var youtube_id=""; 
  //youtube_id = url.replace(/^[^v]+v.(.{11}).*/,"$1"); 
  var matchObj = url.match(/[\?&]v=([A-Za-z0-9_-][^&#]+)/); 
  
  if(matchObj!=null &&  matchObj.length > 0)
  {
      youtube_id = matchObj[0].substring(3,matchObj[0].length);  
  }
  else
  {
      matchObj = url.match(/\/v\/([A-Za-z0-9_-][^&#]+)/); 
  
      if(matchObj!=null &&  matchObj.length > 0)
      {
          youtube_id = matchObj[0].substring(3,matchObj[0].length);  
      }
  }
  
  return youtube_id; 
  
}

// That function is called by a button located in custom dialog YoutubeDialogContentID.
// Build some object (here SPAN) and insert it into WebHtmlEditor at current selection.
function YoutubeDialogButtonClick(url, videoSizeType) {
    var videoID=youtubeIDextract(url);
    if(videoID == "")
    {
        alert("The URL does not match");
    }
    else
    {

        var width = 320;
        var height = 265;
        if (videoSizeType == 2) {
            width = 425;
            height = 344;
        }
        else if (videoSizeType == 3) {
            width = 480;
            height = 385;
        }
        else if (videoSizeType == 4) {
            width = 640;
            height = 505;
        }
        

        var object = document.createElement("div");
        object.setAttribute("width", width);
        object.setAttribute("height", height);            

        var oEmbed = document.createElement("embed");
        oEmbed.setAttribute("src", "http://www.youtube.com/v/" + videoID);
        oEmbed.setAttribute("type", "application/x-shockwave-flash");
        oEmbed.setAttribute("allowscriptaccess", "always");
        oEmbed.setAttribute("allowfullscreen", "true");
        oEmbed.setAttribute("width", width);
        oEmbed.setAttribute("height", height);
        object.appendChild(oEmbed);

                    
        // var oEditor = iged_getById("WebHtmlEditor1");
        // if(oEditor)
        //  oEditor.insertAtCaret(object);
        // Commented lines below do alternative action using internal function of WebHtmlEditor
        iged_closePop();
        if (typeof iged_insNodeAtSel == "function")
            iged_insNodeAtSel(object);
        else
            iged_insText(object.outerHTML);
     }
}

// That function is called by WebHtmlEditor1_Initialize in order to
// initialize content of custom dialog, which is defined explicitly within aspx
var YoutubeDialogWasCreated = false;
function initializeYoutubeDialog(oEditor) {
    if (YoutubeDialogWasCreated)
        return;
    YoutubeDialogWasCreated = true;
    HtmlEditorYoutube_CreateYoutubeDialogContent();
    // Find reference to html-element container for YoutubeDialogID.
    // That value was set to ToolbarDialogButton.Dialog.DialogContentID
    var dialog = document.getElementById("YoutubeDialogID");
    if (!dialog)
        return;
    // Find reference to html-element content for YoutubeDialog.
    // The html element with that id was created within aspx.
    var content = document.getElementById("YoutubeDialogContentID");
    // Remove YoutubeDialogContentID from its temporary container (body of asxp-page)
    // and insert it into YoutubeDialogID container, which is used by WebHtmlEditor.
    content.parentNode.removeChild(content);
    dialog.appendChild(content);
    // Undo initial hidden state.
    content.style.display = "";
    content.style.visibility = "visible";
}

function HtmlEditorYoutube_GetSelectedSize() {
    if (HtmlEditorYoutubeSize1.checked)
        return 1
    else if(HtmlEditorYoutubeSize2.checked)
        return 2
    else if (HtmlEditorYoutubeSize3.checked)
        return 3
    else 
        return 4
    
}

 function HtmlEditorYoutube_CreateYoutubeDialogContent() {
            var aElement = document.createElement("DIV");
            aElement.id = "YoutubeDialogContentID";
            aElement.style.cssText = "padding: 10px; width: 400px; height: 210px; border: 2px solid #80A0C0;background: #FFFFFF; display: none; visibility: hidden;";
            aElement.innerHTML ="<span>Enter YouTube Video URL:</span>"+
        "<input id=\"YoutubeDialogEditField\" style=\"margin-top: 10px;width: 380px;\"  value=\"\" />"+
        "<br />"+
        "<br />"+
        "<span>Video size:</span>"+
        "<br />  "+
        "<input id=\"HtmlEditorYoutubeSize1\" name=\"HtmlEditorYoutubeSize\"  value=\"1\" type=radio checked=checked />320x265 "+
        "<input id=\"HtmlEditorYoutubeSize2\" name=\"HtmlEditorYoutubeSize\"  value=\"2\" type=radio />425x344 "+
        "<input id=\"HtmlEditorYoutubeSize3\" name=\"HtmlEditorYoutubeSize\"  value=\"3\" type=radio />480x385 "+
        "<input id=\"HtmlEditorYoutubeSize4\" name=\"HtmlEditorYoutubeSize\"  value=\"4\" type=radio />640x505 "+        
        "<br />"+
        "<br />"+
        "<input type=\"button\" style=\"width: 300px; margin-top: 10px; margin-left: 20px;\" value=\"Click To Insert Video\" "+
           " onclick=\"YoutubeDialogButtonClick(YoutubeDialogEditField.value,HtmlEditorYoutube_GetSelectedSize())\" />";
            document.appendChild(aElement);
        }
        

function FormatFileSize(bytecount) {
        var str = bytecount + ' B';

        str = (bytecount / 1024).toFixed(0)
        str=formatNumber(str)  + ' KB';
        return str;
    }

function formatNumber(str) {
    if(str.length <= 3){
        return str;

    } else {

    return formatNumber(str.substr(0,str.length-3))+','+str.substr(str.length-3);

    }
}