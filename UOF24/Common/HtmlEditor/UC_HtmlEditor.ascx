<%@ Control Language="C#" AutoEventWireup="true" Inherits="Common_HtmlEditor_UC_HtmlEditor" Codebehind="UC_HtmlEditor.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register src="~/Common/FileCenter/V3/UC_FileCenter.ascx" tagname="UC_FileCenter" tagprefix="uc1" %>
<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
<style type="text/css">
.EditorAddBorder table td {
    border-width:1px;
    border-style:solid;
    border-collapse: collapse
}

.EditorAddBorder table td {
    border-width:1px;
    border-style:solid;
    border-collapse: collapse
}

.EditorDisableContent span, 
.EditorDisableContent strong, 
.EditorDisableContent p, 
.EditorDisableContent div, 
.EditorDisableContent td {
    font-family: inherit;
}
</style>
<script type="text/javascript">
    var tbimgcontent = "<tr>#tdcontent</tr>";

    Type.registerNamespace('UOFEditor_<%=ClientID %>');
    UOFEditor_<%=ClientID %>.Editor = function (element) {
        UOFEditor_<%=ClientID %>.Editor.initializeBase(this, [element]);
    };

    UOFEditor_<%=ClientID %>.Editor.prototype = {
        set_pastefilegroupid: function (val) { $("#<%=hideBigIconGroupID.ClientID %>").val(val); },
        set_Size: function (val, val) { setSize_<%=ClientID %>(val, val); },
        enableDMS: function (val) { enableDMS_<%=ClientID %>(val); },
        get_content: function () {
            var oValue = '';
            var editor = $find("<%=RadEditor1.ClientID%>");
            if (editor === null) {
                oValue = $("#<%=RadEditor1.ClientID%>").html();
            }
            else {
                oValue = editor.get_html(true);
            }
            return oValue;
        },
        get_Enabled: function () {
            if ("<%=RadEditor1.Enabled%>".toLowerCase() == "true")
                return true;
            else
                return false;
        },
        on_ImageUploaded: function () {
            if ($.isFunction(eval($("#<%=hideImageUploadEvent.ClientID %>").val()))) {
                eval(String.format("{0}();", $("#<%=hideImageUploadEvent.ClientID %>").val()));
            }
        }
    };
    UOFEditor_<%=ClientID %>.Editor.registerClass('UOFEditor_<%=ClientID %>.Editor', Sys.UI.Control);
    if (typeof (Sys) !== 'undefined') {
        Sys.Application.notifyScriptLoaded();
    }

    Sys.Application.add_init(function () {
        $create(UOFEditor_<%=ClientID %>.Editor, {}, {
            //click: null                
        }, null, window.$get("<%=ClientID %>")
        );

    });

    Sys.Application.add_load(function () {
        var editor = $find("<%=RadEditor1.ClientID%>");
        if ("<%=RadEditor1.Enabled.ToString()%>" == "True") {
            if (editor != null) {
                editor.get_filtersManager().add(new MyFilter_<%=RadEditor1.ClientID%>());
                if ($("#<%=hideflag.ClientID%>").val() == 'InsertIMG') {
                    <%=RadEditor1.ClientID%>_PasteImg();
                }
            }
        }
        //處理當畫面有postback時，toolbar後方會增加空白按鈕的問題
        $(".reToolbar.Silk").each(function (index) {
            var n = $(this).find(".reToolFirstItem").length;
            if (n == 0) {
                $(this).remove();
            }

            $(this).find(".Paste").on("click", function () {
                if ($uof.tool.browser.ie) {
                    return false;
                }
            });

        });

        var editorid = '#' + "<%=RadEditor1.ClientID%>";
        if (!$(editorid).hasClass("RadEditor Silk reWrapper")) {
            //代表enable=false時
            $(editorid).each(function (index, val) {
                $(this).addClass('EditorAddBorder');
                $(this).addClass('EditorDisableContent');
            });
        }
    });

    function setSize_<%=ClientID %>(width, height) {
        var editor = $find("<%=RadEditor1.ClientID%>");
        editor.setSize(width, height);
    }

    function enableDMS_<%=ClientID %>(flag) {
        $("#<%=hideEnableDMS.ClientID%>").val(flag);
    }

    function <%=RadEditor1.ClientID%>_PasteImg() {
        var imastr = $("#<%=hideSelectImgstr.ClientID%>").val();
        var editor = $find("<%=RadEditor1.ClientID%>");
        var regex = new RegExp(/<img(?:[^>]*\s+class\s*=\s*"\s*UOF\")[^>]+>/g);
        var res = imastr.match(regex);
        if (res != null) {
            jQuery.each(res, function (i, val) {
                regex = new RegExp(/src=\"(.*)\"/g);
                res2 = val.match(regex);
                if (res2 != null) {
                    if (res2[0].indexOf("http") < 0) {
                        var old = res2[0];
                        var url = res2[0].replace("src=\"", "");

                        var newsrc = String.format("src=\"{0}/{1}", "<%=Request.ApplicationPath %>", url);
                        imastr = imastr.replace(old, newsrc);
                    }
                }
            });
        }
        editor.pasteHtml(imastr);
        $("#<%=hideSelectImgstr.ClientID%>").val("");
    }

    MyFilter_<%=RadEditor1.ClientID%> = function <%=RadEditor1.ClientID%>() {
        MyFilter_<%=RadEditor1.ClientID%>.initializeBase(this);
        this.set_isDom(false);
        this.set_enabled(true);
        this.set_name("RadEditor filter");
        this.set_description("RadEditor filter description");
    }
    MyFilter_<%=RadEditor1.ClientID%>.prototype =
  {
      getHtmlContent: function (content) {
          var regex = new RegExp(/<img(?:[^>]*\s+class\s*=\s*"\s*UOF\")[^>]+>/g);
          var res = content.match(regex);
          var newContent = content;
          if (res != null) {
              jQuery.each(res, function (i, val) {
                  var old = val;
                  var tmp = val.replace(/<img(.*?)\/>/g, "[img$1/]");
                  newContent = newContent.replace(old, tmp);
              });
          }
          //<img(?:[^>]*\s+class\s*=\s*['"]\s*UOF)[^>]+>  這個試過濾取得class="UOF"或是class='UOF' 單引號或是雙引號皆可的模式
          //var newContent = content.replace(new RegExp("<img(\\s([^>])*?)?/>", "ig"), "[img$1/]"); 這個是一律過濾所有的<img tag
          //var newContent = content.replace(new RegExp("\\[img(\\s([^>])*?)? /\\]", "ig"), "<img$1 />");
          $("#<%=HiddenField1.ClientID%>").val(newContent);
          $("#<%=HiddenField2.ClientID%>").val(newContent); 
          return content;
      },

      getDesignContent: function (content) {
          var newContent = content;
          return newContent;
      }
  }
    if ("<%=RadEditor1.Enabled.ToString()%>" == "True") {
        MyFilter_<%=RadEditor1.ClientID%>.registerClass('MyFilter_' + "<%=RadEditor1.ClientID%>", Telerik.Web.UI.Editor.Filter);

        //Telerik.Web.UI.Editor.CommandList["InsertFiles"] = function (commandName, editor, args) {     

        //};


        Telerik.Web.UI.Editor.ClipboardImagesProvider.prototype.supportsClipboardData = function (event) {
            return false;
        }

    }

    function <%=RadEditor1.ClientID%>_OnClientCommandExecuting(editor, args) {
        var name = args.get_name(); //The command name
        var val = args.get_value(); //The tool that initiated the command
        if (name == "Emoticons") {

            //Set the background image to the head of the tool depending on the selected toolstrip item
            var tool = args.get_tool();
            var span = tool.get_element().getElementsByTagName("SPAN")[0];
            span.style.backgroundImage = "url(" + val + ")";

            //Paste the selected in the dropdown emoticon    
            editor.pasteHtml("<img src='" + val + "' class='UOF' emoimg='True'>");

            //Cancel the further execution of the command
            args.set_cancel(true);

        }
        else if (name == "Original") {
            var img = editor.getSelectedElement();
            if (img == null)
                return false;
            var images = editor.get_document().images;
            if (images.length == 0) {
                return false;
            }

            var limitedWidth = 640;
            if (img.naturalWidth != undefined) {
                var iw = img.naturalWidth;
                var ih = img.naturalHeight;
                $(img).removeAttr("style");
                $(img).removeAttr("height");
                $(img).removeAttr("width");
                $(img).width(iw);
                //   $(img).height(ih);
            }
            else {
                var sel2 = editor.getSelectedElement().childNodes;
                var shallowCopy = $.extend({}, sel2);
                $.each(shallowCopy, function (idx, item) {
                    var iw = shallowCopy[idx].naturalWidth;
                    var ih = shallowCopy[idx].naturalHeight;
                    
                    $(item).removeAttr("style")
                    $(item).removeAttr("height");
                    $(item).removeAttr("width");
                    $(item).width(iw);
                });
            }
            args.set_cancel(true);
        }
        else if (name == "Fit") {
            var img = editor.getSelectedElement();
            if (img == null)
                return false;
            var images = editor.get_document().images;
            if (images.length == 0) {
                return false;
            }

            var limitedWidth = 640;
            if (img.naturalWidth != undefined) {
                var iw = img.naturalWidth;
                var ih = img.naturalHeight;
                //如果圖片寬度超過640, 則只放大到寬度640
                if (iw > limitedWidth) {
                    iw = 640;
                }
                $(img).removeAttr("style")
                $(img).removeAttr("height");
                $(img).removeAttr("width");
                $(img).width(iw);
                //   $(img).height(ih);
            }
            else {
                var sel2 = editor.getSelectedElement().childNodes;
                var shallowCopy = $.extend({}, sel2);
                $.each(shallowCopy, function (idx, item) {
                    var iw = shallowCopy[idx].naturalWidth;
                    var ih = shallowCopy[idx].naturalHeight;
                    //如果圖片寬度超過640, 則只放大到寬度640
                    if (iw > limitedWidth) {
                        iw = 640;
                    }
                    $(item).removeAttr("style")
                    $(item).removeAttr("height");
                    $(item).removeAttr("width");
                    $(item).width(iw);
                });
            }
            args.set_cancel(true);
        }
        else if (name == "Bulletin") {
            var img = editor.getSelectedElement();
            if (img == null)
                return false;
            var images = editor.get_document().images;
            if (images.length == 0) {
                return false;
            }

            var iw = 880;
            if (img.naturalWidth != undefined) {
                $(img).removeAttr("style")
                $(img).removeAttr("height");
                $(img).removeAttr("width");
                $(img).width(iw);
            }
            else {
                var sel2 = editor.getSelectedElement().childNodes;
                var shallowCopy = $.extend({}, sel2);
                $.each(shallowCopy, function (idx, item) {
                    $(item).removeAttr("style")
                    $(item).removeAttr("height");
                    $(item).removeAttr("width");
                    $(item).width(iw);
                });
            }
            args.set_cancel(true);
        }
        else if (name == "Small") {
            var img = editor.getSelectedElement();
            if (img == null)
                return false;
            var images = editor.get_document().images;
            if (images.length == 0) {
                return false;
            }
            

            var limitedWidth = 640;
            if (img.naturalWidth != undefined) {
                var iw = img.naturalWidth;
                var ih = img.naturalHeight;
                //如果圖片寬度超過640, 則只放大到寬度640
                if (iw > limitedWidth) {
                    iw = 640;
                }
                var ww = (iw / 3).toFixed();
                $(img).removeAttr("style")
                $(img).removeAttr("height");
                $(img).removeAttr("width");
                $(img).width(ww);
                //   $(img).height(ih);
            }
            else {
                var sel2 = editor.getSelectedElement().childNodes;
                var shallowCopy = $.extend({}, sel2);
                $.each(shallowCopy, function (idx, item) {
                    var iw = shallowCopy[idx].naturalWidth;
                    var ih = shallowCopy[idx].naturalHeight;
                    //如果圖片寬度超過640, 則只放大到寬度640
                    if (iw > limitedWidth) {
                        iw = 640;
                    }
                    var ww = (iw / 3).toFixed();
                    $(item).removeAttr("style")
                    $(item).removeAttr("height");
                    $(item).removeAttr("width");
                    $(item).width(ww);
                });
            }
            args.set_cancel(true);
        }
        else if (name == "Remove") {
            var selectedElement = editor.getSelectedElement();
            if (selectedElement == null)
                return false;
            var sel2 = editor.getSelectedElement().childNodes;

            var shallowCopy = $.extend({}, sel2);
            if (selectedElement.naturalWidth != undefined)
                $telerik.$(selectedElement).remove();
            else {
                $.each(shallowCopy, function (idx, item) {
                    $(item).remove();
                });
            }
            args.set_cancel(true);
        }
        else if (name == "CustomIcon") {

            //Set the background image to the head of the tool depending on the selected toolstrip item
            var tool = args.get_tool();
            var span = tool.get_element().getElementsByTagName("SPAN")[0];
            span.style.backgroundImage = "url(" + val + ")";
            //Paste the selected in the dropdown emoticon    
            editor.pasteHtml("<img src='" + val + "' class='UOF' cusimg='True'>");

            //Cancel the further execution of the command
            args.set_cancel(true);
        }
        else if (name == "EditorPreview") {
             var editor = $find("<%=RadEditor1.ClientID%>");
            var txt = editor.get_html(true);
            window.sessionStorage["viewdata"] = txt;

            if (typeof (Storage) !== "undefined") {

            } else {
                alert("Browser not support Web Storage");
                return;
            }
            $uof.dialog.open2("~/Common/HtmlEditor/Preview.aspx", '', '<%=lblPreview.Text%>', 800, 600, function () { return false; });
            args.set_cancel(true);
        }
        else if (name == "InsertIMG") {

            $("#<%=hideflag.ClientID%>").val("InsertIMG");
           
            var ucupload2 = $find("<%=UC_FileCenter2.ClientID%>");
            ucupload2.select_file();
            ucupload2.reset();
            args.set_cancel(true);
        }
        else if (name == "InsertFiles") {
            $("#<%=hideflag.ClientID%>").val("InsertFiles");
            var ucupload1 = $find("<%=UC_FileCenter1.ClientID%>");
            ucupload1.select_file();
            args.set_cancel(true);
        }
        else if (name == "InsertDMS") {
            $("#<%=hideflag.ClientID%>").val("InsertDMS");
            $uof.dialog.open2("~/Common/HtmlEditor/SelectDMSFolderDoc.aspx", this, '', 900, 500, function (returnValue) {
                if (typeof (returnValue) != "undefined") {
                    var list = returnValue.split(',');
                    var linkstr = "";
                    var linkscript2 = "";

                    jQuery.each(list, function (i, val) {
                        if (val != '') {
                            var arr = val.split('@');
                            
                            //0:DOCID , 1:VERSION , 2:STATUS , 3:DOCNAME
                            var linkscript = "@path?docid={0}&status={1}&manualver={2}";
                            linkscript = linkscript.replace("@path", $("#<%=hidepath.ClientID%>").val());
                            linkscript = linkscript.replace("{0}", arr[0]);
                            linkscript = linkscript.replace("{1}", arr[2]);
                            if (arr[1] != 'NEW') //insert docversion link
                                linkscript = linkscript.replace("{2}", arr[1]);
                            else
                                linkscript = linkscript.replace("{2}", "");
                            //var data = [linkscript];
                            //var result = $uof.pageMethod.syncUc("Common/HtmlEditor/UC_HtmlEditor.ascx", "EditorGetEncryptLinkTag", data);
                            //[Quick link]</a>
                            linkscript2 += "<p><span style=\"color: blue;\"><strong><a target=\"_blank\" class='DMSLink' href=\"{0}\" >{1}</a></strong></span></p>";
                            linkscript2 = linkscript2.replace("{0}", linkscript);
                            if (arr[1] != 'NEW') //insert docversion link
                                linkscript2 = linkscript2.replace("{1}", arr[3] + "(V" + $uof.pageMethod.syncUc("Common/HtmlEditor/UC_HtmlEditor.ascx", "UrlDecode", [arr[1]]) + ")");
                            else
                                linkscript2 = linkscript2.replace("{1}", arr[3]);
                            //var regex = new RegExp(/<a target(?:[^>]*\s+)[^>]+>\[Quick link\]<\/a>/g);
                            //var res = result.match(regex);
                            //result = result.replace(res, "<DMSLink>" + res + "</DMSLink>");
                            //result = result.replace("[Quick link]", arr[2]);
                            //linkstr += result;


                            //        var s = "<a title=\"Blah\" href=\"javascript:BlahFunc('" + options.rowId +
                            //      "')\">This is blah</a>";

                            //alink = "<a id=\"{1}\" onclick=\"if(!$(this).hasClass('aspNetDisabled'))$uof.dialog.open2('{2}',this,'',400,400,function(returnValue){return (returnValue) ? true : false;}); return false;\" href=\"javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions('{3}', '', true, '', '', false, true))\" >{4}</a> ";

                        }
                    });
                    editor.pasteHtml(linkscript2);
                }



                if (typeof (returnValue) == "undefined")
                    return false;
                else
                    return true;
            });
            args.set_cancel(true);
        }

    }

<%--    function RemoveSelectElement(selectelement) {
        var imgstr = $("#<%=hideSelectImgstr.ClientID%>").val();
        var regex = new RegExp(/src=\"(.*)\"/g);
        var res2 = selectelement.match(regex);
        var src = res2[0].replace("<%=Request.ApplicationPath %>", "");
        selectelement = selectelement.replace(res2[0], src);
        imgstr=imgstr.replace(selectelement, "");
        $("#<%=hideSelectImgstr.ClientID%>").val(imgstr)
        alert('RemoveSelectElement_'+imgstr);
        alert(selectelement);
    }--%>

    function OnClientPasteHtml(sender, args) {
        if (args.get_commandName() == "Paste" || args.get_commandName() == "PasteFromWord" || args.get_commandName() == "PasteFromWordNoFontsNoSizes") {
            var pastedHtml = args.get_value();
            if (/<img(?:[^>]*\s)[^>]+>/i.test(pastedHtml) &&
                /data:image\/[a-z]{2,5};base64/i.test(pastedHtml)) {
                alert('<%=lblCannotPaste.Text %>');
                pastedHtml = "";
            }

            if (!$telerik.isIE && pastedHtml == "&nbsp;") {
                alert('<%=lblCannotPaste.Text %>');
                pastedHtml = "";
            }

            var canPaste = true;
            var match = pastedHtml.match(/(?:<img[^>]*src=[^>]*handler\/FileControlHandler.ashx[^>]+>)/);
            while (match != null && match.length > 0) {
                canPaste = false;
                pastedHtml = pastedHtml.replace(match[0], '');
                match = pastedHtml.match(/(?:<img[^>]*src=[^>]*handler\/FileControlHandler.ashx[^>]+>)/);
            }

            if (!canPaste) {
                alert('<%=lblCannotPaste.Text %>');
            }

            args.set_value(pastedHtml);
        }

    }

    function EditorOnClientPasteHtml_<%=ClientID %>(sender, args) {

    }



    function <%=UC_FileCenter2.ClientID%>_up1ClientUploaded(id, name, folder, size, type, url, w, h) {
        //__doPostBack('ctl00$ContentPlaceHolder1$LinkButton1','')
        <%--var clickButton = $("#<%=btnuploadcomplete.ClientID %>"); 
        clickButton.click();--%>
        var list;

        //list = "<td imageid='{0}'><input id='{0}' type='checkbox' checked='checked' /><img ID='{0}'  onclick=\"imgdelete('{0}');\"  src=\"<%=AppPath%>/Common/Images/Icon/icon_m115.gif\" /><br/><img width='100' heigh='100' src=\"{1}\" class=\"UOF\" />  </td>"
        list = "<img src=\"{0}\" class=\"UOF\" style=\"width: {1}px; \" />"
        var n_w;
        var n_h;
        if (w > 640)
            n_w = 640;
        else
            n_w = w;
        if (url.indexOf("http") < 0) {
            var n = url.indexOf("common/");
            url = url.substr(n, url.length - n);
        }
        //if (h > 400)
        //    n_h = 400;
        //else
        //    n_h = h;
        var tmp = String.format(
            list
            , url
            , n_w
        );
        $("#<%=hideSelectImgstr.ClientID%>").val($("#<%=hideSelectImgstr.ClientID%>").val() + tmp);
    }

    function <%=UC_FileCenter2.ClientID%>_OnClientUploaded(proxy) {
        var uploadimg;
        var file1 = $find("<%=UC_FileCenter2.ClientID %>");
        if ($('#<%=hideimgupload.ClientID%>').val() != "") {
            var files = JSON.parse($('#<%=hideimgupload.ClientID%>').val());
            var permanentFiles = file1.get_uploaded();
            var list = [];
            files.push.apply(files, permanentFiles);
            uploadimg = JSON.stringify(files);
        }
        else {
            uploadimg = JSON.stringify(file1.get_uploaded());
        }
        $("#<%=hideimgupload.ClientID %>").val(uploadimg);
        var previewWindow = $find("<%=this.RadWindow2.ClientID %>");
        previewWindow.close();
        file1.reset();
        <%=RadEditor1.ClientID%>_PasteImg();
        var source = UOFEditor_<%=ClientID %>.Editor.prototype;
        source.on_ImageUploaded();
    }


    function <%=UC_FileCenter1.ClientID%>_OnClientUploaded(proxy) {
        var previewWindow = $find("<%=this.RadWindow1.ClientID %>");
        previewWindow.close();

        var fc1 = $find("<%=UC_FileCenter1.ClientID%>");
        var fc3 = $find("<%=UC_FileCenter3.ClientID%>");
        fc3.set_list(fc1.get_list());
    }

    function <%=UC_FileCenter3.ClientID%>_OnClientRemoved(fileId) {
        $find("<%=UC_FileCenter1.ClientID%>").remove_file(fileId);
    }

</script>
</telerik:RadCodeBlock>
<%-- -webkit-text-size-adjust: none(因IOS字體會自動變大，故設定此屬性) width:100%(因文字會自動折行，故加入此屬性不自動折行) --%>
<div id="<%=ClientID %>" class="<%=ClientID %>" style="min-width:500px; display:inline-block; " >

     <telerik:radeditor runat="server" ID="RadEditor1" OnClientPasteHtml="OnClientPasteHtml"  meta:resourcekey="RadEditor1Resource1"   >
</telerik:radeditor>   
<asp:Label ID="lblLendSpaceMsg" runat="server" Text="租用空間已達上限，不可上傳檔案" ForeColor="Red" Visible="false" meta:resourcekey="lblLendSpaceMsgResource1"></asp:Label>

        <uc1:UC_FileCenter ID="UC_FileCenter3" runat="server" />
   <table style="margin: 1px;width:auto;"  runat="server" ID="tbFileList" class="NormalPopTable" >
</table> 
                  <asp:HiddenField ID="hideDeleteFileID" runat="server" />


         <telerik:RadWindow ID="RadWindow1" runat="server"  Title="插入檔案" Width="300px" Height="300px" meta:resourcekey="RadWindow1Resource1"  >
        <ContentTemplate>
             <asp:HiddenField ID="hidefileupload" runat="server" />
           <uc1:UC_FileCenter ID="UC_FileCenter1" runat="server" />
          
       </ContentTemplate>
                </telerik:RadWindow>
               
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="HiddenField2" runat="server" />

<telerik:RadWindow ID="RadWindow2" runat="server" Title="插入圖片" Width="300px" Height="400px" meta:resourcekey="RadWindow2Resource1"   >
        <ContentTemplate>

                <asp:HiddenField ID="hideimgupload" runat="server" />
                 <asp:HiddenField ID="hideSelectImgstr" runat="server" />

               
          
                                       <uc1:UC_FileCenter ID="UC_FileCenter2" runat="server" AllowedFileType="Image" />

        </ContentTemplate>    
               </telerik:RadWindow>  

</div>
         
<asp:Label ID="lblInsertIMG" Visible="False" runat="server" Text="插入圖片" meta:resourcekey="lblInsertIMGResource1"></asp:Label>
<asp:Label ID="lblInsertFiles" Visible="False" runat="server" Text="插入附件" meta:resourcekey="lblInsertFilesResource1"></asp:Label>
<asp:Label ID="lblInsertEmotions" Visible="False" runat="server" Text="表情符號" meta:resourcekey="lblInsertEmotionsResource1"></asp:Label>
<asp:Label ID="lblInsertDMS" runat="server" Visible="False" Text="插入文管連結" meta:resourcekey="lblInsertDMSResource1"></asp:Label>
<asp:Label ID="lblInsertCus" runat="server" Visible="False" Text="插入貼圖" meta:resourcekey="lblInsertCusResource1"></asp:Label>
<asp:Label ID="lblSmall" runat="server" Visible="False" Text="小" meta:resourcekey="lblSmallResource1"></asp:Label>
<asp:Label ID="lblFit" runat="server" Visible="False" Text="最適大小" meta:resourcekey="lblFitResource1"></asp:Label>
<asp:Label ID="lblBulletin" runat="server" Visible="False" Text="符合公告檢視" meta:resourcekey="lblBulletinResource1"></asp:Label>
<asp:Label ID="lblOriginal" runat="server" Visible="False" Text="原始大小" meta:resourcekey="lblOriginalResource1"></asp:Label>
<asp:Label ID="lblRemove" runat="server" Visible="False" Text="移除" meta:resourcekey="lblRemoveResource1"></asp:Label>
<asp:Label ID="lblCannotPaste" runat="server" Visible="False" Text="不可複製貼上圖片" meta:resourcekey="lblCannotPasteResource1"></asp:Label>
<asp:Label ID="lblPreview" Visible="False" runat="server" Text="預覽" meta:resourcekey="lblPreviewResource1"></asp:Label>

 <asp:HiddenField ID="hideflag" runat="server" />
<asp:HiddenField ID="hidepath" runat="server" />
<asp:HiddenField ID="hideEnableDMS" runat="server" />
<asp:HiddenField ID="hideImgFileID" runat="server" />
<asp:HiddenField ID="hideBigIconGroupID" runat="server" />
<asp:HiddenField ID="hideEnableInsertIMG" runat="server" />
<asp:HiddenField ID="hideEnableInsertFile" runat="server" />
<asp:HiddenField ID="hideEnableInsertEmotion" runat="server" />
<asp:HiddenField ID="hideEnableInsertCusImg" runat="server" />
<asp:HiddenField ID="hideImgFileGroupID" runat="server" />
<asp:HiddenField ID="hideImageUploadEvent" runat="server" />     
<asp:HiddenField ID="hideBulletinSize" runat="server" />