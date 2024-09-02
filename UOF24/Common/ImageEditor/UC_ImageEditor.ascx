<%@ Control Language="C#" AutoEventWireup="true" Inherits="Common_ImageEditor_UC_ImageEditor" Codebehind="UC_ImageEditor.ascx.cs" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagName="UC_FileCenter" TagPrefix="uc1" %>

<telerik:RadScriptBlock runat="server">
    <script type="text/javascript">
        //<![CDATA[


        Type.registerNamespace('UOFImageEditor');
        UOFImageEditor.ImageEditor_<%=ClientID %> = function (element) {
                UOFImageEditor.ImageEditor_<%=ClientID %>.initializeBase(this, [element]);
            };

            UOFImageEditor.ImageEditor_<%=ClientID %>.prototype = {
                SetCropSize: function (wval, hval) {
                    $("#<%=hideW.ClientID %>").val(wval);
                        $("#<%=hideH.ClientID %>").val(hval);
                        var imgE = getImageEditor();
                        imgE.fire("Crop");
                    },
                saveimage: function () {
                    handleClientClick();
                    
                },
                saveorginalimage: function () {
                    handleClientClick2();
                    
                },
                CheckUpload: function () {
                    var isupload = "false";//"<%=IsUpload%>";

                    if ($("#<%=HiddenField1.ClientID%>").val() != "")
                        isupload = "true";

                    //isupload = isupload.toLowerCase();
                    return isupload;
                }
            };
            UOFImageEditor.ImageEditor_<%=ClientID %>.registerClass('UOFImageEditor.ImageEditor_<%=ClientID %>', Sys.UI.Control);
        if (typeof (Sys) !== 'undefined') {
            Sys.Application.notifyScriptLoaded();
        }

        Sys.Application.add_init(function () {
            $create(UOFImageEditor.ImageEditor_<%=ClientID %>, {}, {
                    //click: null                
                }, null, window.$get("<%=ClientID %>")
            );

            });

            Sys.Application.add_load(function () {
                var isFirefox = navigator.userAgent.search('Firefox');
                $("#divFF").hide();
                $("#filediv").hide();
                $(".rieStatusBar").hide();
                $(".rieDraggableResizeBox").hide();

                Telerik.Web.UI.ImageEditor.CommandList["InsertImage"] = function (imageEditor, commandName, args) {
                    FireSelectFile();
                }
                <%--if (isFirefox > -1) {
                    $("#divFF").show();
                    var imgEditor = $find("<%=RadImageEditor1.ClientID%>");
                    imgEditor.get_tools().Zoom.disable();
                    imgEditor.get_tools().RotateRight.disable();
                    imgEditor.get_tools().RotateLeft.disable();
                    imgEditor.get_tools().ImageUpload.disable();

                }--%>
            });





            function <%=UC_FileCenter1.ClientID%>_imageUploaded(id, name, folder, size, type, url, w, h) {
            //alert('here');
            var paras = {};
            paras.FileGroupId = "";
            paras.ImageUrl = url;
            $("#<%=HiddenField1.ClientID%>").val(JSON.stringify(paras));

                $find("<%=UC_FileCenter1.ClientID%>").reset();
              __doPostBack("<%=Button1.UniqueID %>", 'OnClick');

          }

          function <%=UC_FileCenter2.ClientID%>_imageUploaded(id, name, folder, size, type, url, w, h) {
            //alert('here');
            var paras = {};
            paras.FileGroupId = "";
            paras.ImageUrl = url;
            $("#<%=HiddenField1.ClientID%>").val(JSON.stringify(paras));

                $find("<%=UC_FileCenter2.ClientID%>").reset();
                __doPostBack("<%=Button1.UniqueID %>", 'OnClick');

            }

            function getImageEditor() { return $telerik.findImageEditor("<%= RadImageEditor1.ClientID %>"); }
        function handleClientClick() {
            //   $("#imageeditordiv").hide();
            if ($("#<%=HiddenField1.ClientID%>").val() == "") {
                    return;
                }
                $("#<%=hideCommand.ClientID%>").val('Save');
                var imgE = getImageEditor();
                applyModifications();
                //  $find("<%=RadImageEditor1.ClientID %>").fire("Save");
                imgE.setToggleState('Save', false);

                imgE.saveImageOnServer('', true);

                $(".rieDraggableResizeBox").hide();
               return false;

            }

function handleClientClick2() {
            //   $("#imageeditordiv").hide();
            if ($("#<%=HiddenField1.ClientID%>").val() == "") {
                    return;
                }
                $("#<%=hideCommand.ClientID%>").val('Save');
                var imgE = getImageEditor();
              //  applyModifications();
                //  $find("<%=RadImageEditor1.ClientID %>").fire("Save");
                imgE.setToggleState('Save', false);

                imgE.saveImageOnServer('', true);

                $(".rieDraggableResizeBox").hide();
               return false;

            }

            function <%=RadImageEditor1.ClientID%>_ImageEditorLoad(imgEditor, args) {
            //open the Crop tool dialog with a little timeout

            if ($("#<%=HiddenField1.ClientID%>").val() == "")
                    return;
                if ($("#<%=hideCommand.ClientID%>").val() == "Save") {
                    return;
                }
                //  ZoomImage(imgEditor, args);

                //imgEditor._resizeImage(573, 430, true, false);

                <%=RadImageEditor1.ClientID%>_CropImg();


            }

            function ZoomImage(sender, args) {
                setTimeout(function () {
                    var imgE = $telerik.toImageEditor(sender);
                    imgE.zoomBestFit();
                }, 50)
            }

            function <%=RadImageEditor1.ClientID%>_CropImg() {

                if ($("#<%=hideCommand.ClientID%>").val() != "ResizeImage") {
                    $find("<%=RadImageEditor1.ClientID %>").fire("Crop");
                }
            }

            function <%=RadImageEditor1.ClientID%>_OnClientToolsDialogClosed(sender, eventArgs) {
            $find("<%=RadImageEditor1.ClientID %>").fire("Crop");
            }


            function <%=RadImageEditor1.ClientID%>_OnClientCommandExecuted(sender, args) {
            var ed = $find("<%=RadImageEditor1.ClientID %>");
                if (args.get_commandName() == "Crop") {
                    waitForCommand(sender, args.get_commandName(), function (widget) {

                        var width = $("#<%=hideW.ClientID%>").val();
                        var height = $("#<%=hideH.ClientID%>").val();
                        var ratio = width / height;
                        widget._setCropBoxRatio(ratio);
                        widget._sizeRatio = ratio;
                        widget.set_width(width);
                        widget.set_height(height);

                        widget._constraintBtn.set_visible(false);
                        widget._swapBtn.set_visible(false);
                        widget._presetDD.set_visible(false);

                        widget._updateCropBoxFromControls();
                        var $rdTable = $(".rieDialogs > .rdTable");
                        $rdTable.find(".rieDialogsTable:first > tbody > tr:first").hide();
                        $rdTable.find(".rieDialogsTable:first > tbody > tr:nth-last-child(2)").hide();
                        $rdTable.find(".rieDialogsTable:first .rieResizeButtons").hide();
                        $rdTable.find(".rieDialogsTable:first .rieInputDimension").width(120);
                        setTimeout(function () {
                            var imageEditorId = ed.get_id();
                            $('#' + imageEditorId + '_ToolsPanel').hide();  //隱藏那個panel式窗
                        }, 0);
                        $(".rieDraggableResizeBox").css("border", "3px dashed #000");

                        $rdTable.find(".rieDialogsTable:first").find("input").prop("disabled", true);//.attr("readonly", "readonly");

                        //$(".rieDraggableResizeBox").css("width", CROP_WIDTH);
                        //$(".rieDraggableResizeBox").css("height", CROP_HEIGHT);
                    });

                }


                $("#<%=hideCommand.ClientID%>").val(args.get_commandName());

            }



            function waitForCommand(imageEditor, commandName, callback) {
                var timer = setInterval(function () {
                    var widget = imageEditor.get_currentToolWidget();
                    var obj = imageEditor.get_formDecorator();
                    if (widget != undefined && widget.get_name() == commandName) {
                        clearInterval(timer);
                        callback(widget);
                    }
                }, 200);
            }

            function <%=RadImageEditor1.ClientID%>_OnClientCommandExecuting(imEditor, eventArgs) {
                if (eventArgs.get_commandName() == 'Save') {
                    //Prevent the buil-in Save dialog to pop up
                    // alert('save');
                    applyModifications();
                    imEditor.setToggleState('Save', false);
                    imEditor.saveImageOnServer('', true);
                    eventArgs.set_cancel(true);
                    //setTimeout(function () {

                    //}, 1000);


                }

            }

            function <%=RadImageEditor1.ClientID%>_OnClientSaved(imgEditor, args) {
            var paras = {};
            paras.FileGroupId = args.get_argument();
            paras.ImageUrl = "";
            $("#<%=HiddenField1.ClientID%>").val(JSON.stringify(paras));
            }

            function applyModifications() {
                var x = $find("<%=RadImageEditor1.ClientID %>");
                var txtx = $("#<%=RadImageEditor1.ClientID %>_ToolsPanel_C_txtX").val();
                var txty = $("#<%=RadImageEditor1.ClientID %>_ToolsPanel_C_txtY").val();
                var txtWidth = $("#<%=RadImageEditor1.ClientID %>_ToolsPanel_C_txtWidth").val();
                var txtHeight = $("#<%=RadImageEditor1.ClientID %>_ToolsPanel_C_txtHeight").val();
                var xy = new Sys.UI.Bounds(
                        parseInt(txtx),
                        parseInt(txty),
                        parseInt(txtWidth),
                        parseInt(txtHeight));
                x._cropImage(xy);
                x.applyChangesOnServer();

            }
        function FireSelectFile() {
                if ($("#<%=hideSpaceEnough.ClientID %>").val() == "True") {
                    $find("<%=UC_FileCenter2.ClientID%>").select_file();
                }
                <%--var filecount = $find("<%=UC_FileCenter2.ClientID%>").get_count();

                if (filecount == 0) {
                    //setTimeout(function () { $find("<%=UC_FileCenter1.ClientID%>").select_file(); }, 50);
                  $find("<%=UC_FileCenter1.ClientID%>").select_file();
              }--%>
            }
            //]]>
    </script>
</telerik:RadScriptBlock>
<div id="divFF">
    <asp:Label ID="lblNotFireFox" runat="server" Text="本功能不支援FireFox" ForeColor="Red" Font-Bold="True" Font-Size="Larger" meta:resourcekey="lblNotFireFoxResource1"></asp:Label></div>
<div id="<%=ClientID %>" class="<%=ClientID %>" style="overflow: hidden">

     <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline">
     <ContentTemplate> 
    <div id="filediv">
        <uc1:UC_FileCenter ID="UC_FileCenter1" runat="server" AjaxSupported="True" />
        <uc1:UC_FileCenter ID="UC_FileCenter2" runat="server" AjaxSupported="True" />
    </div>

    <asp:Label ID="lblLendSpaceMsg" runat="server" Text="租用空間已達上限，不可上傳檔案" ForeColor="Red" meta:resourcekey="lblLendSpaceMsgResource1"></asp:Label>

    <telerik:RadImageEditor ID="RadImageEditor1" runat="server"
        OnImageSaving="RadImgEdt_ImageSaving" OnImageLoading="RadImageEditor1_ImageLoading" Language="zh-TW" meta:resourcekey="RadImageEditor1Resource1">
        <Tools>
            <telerik:ImageEditorToolGroup>
                <telerik:ImageEditorTool CommandName="Zoom" meta:resourcekey="ImageEditorToolResource1"></telerik:ImageEditorTool>
                <telerik:ImageEditorTool CommandName="RotateRight" meta:resourcekey="ImageEditorToolResource2"></telerik:ImageEditorTool>
                <telerik:ImageEditorTool CommandName="RotateLeft" meta:resourcekey="ImageEditorToolResource3"></telerik:ImageEditorTool>
                <telerik:ImageEditorTool CommandName="InsertImage" meta:resourcekey="ImageEditorToolResource4"></telerik:ImageEditorTool>
            </telerik:ImageEditorToolGroup>

        </Tools>
    </telerik:RadImageEditor>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="hideW" runat="server" Value="100" />
    <asp:HiddenField ID="hideH" runat="server" Value="100" />
    <asp:HiddenField ID="hideModule" runat="server" />
    <asp:HiddenField ID="hideCommand" runat="server" />
    <asp:HiddenField ID="hideFileGroup" runat="server" />
    <asp:HiddenField ID="hideCutFileID" runat="server" />
    <asp:Button ID="Button1" runat="server" Text="Button" Style="display: none" OnClick="Button1_Click" meta:resourcekey="Button1Resource1" />
    <asp:Button ID="Button2" runat="server" Text="Button" Style="display: none" OnClick="Button2_Click" meta:resourcekey="Button2Resource1" />
    <asp:HiddenField ID="hideIsFF" runat="server" />
    <asp:HiddenField ID="hideImageLength" runat="server" />
    <asp:HiddenField ID="hideSpaceEnough" runat="server" Value="True" />
     </ContentTemplate>

   
  <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Button1"  EventName="Click" />
      <asp:AsyncPostBackTrigger ControlID="Button2"  EventName="Click" />
      <asp:AsyncPostBackTrigger ControlID="RadImageEditor1"  EventName="ImageSaving" />
            </Triggers>

</asp:UpdatePanel>
</div>

<asp:HiddenField ID="hdnSaveDbMode" runat="server" Value="1" />
