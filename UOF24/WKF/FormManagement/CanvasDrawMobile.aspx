<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="CanvasDrawMobile.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.CanvasDrawMobile" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>


    .canvasDiv {
        border:solid;
        border-width:thick;
        border-color:darkgray;
        width:100%;
        position: absolute;
        /*top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);*/
        /*background-color: ghostwhite;*/
        /*border-radius: 30px;*/
    }

    .canvasPleceholder {
        display: table;
        font-size: xx-large;
        position: absolute;
        color: lightgrey;
        z-index: -100;
        vertical-align: middle;
        text-align: center;
        opacity: 0.7;
    }

    .canvasPleceholder span {
        display: table-cell;
        vertical-align: middle;
    }
</style>
<script>
    var signaturePad;
    var ajaxManager;
    var data;

    document.ontouchmove = function (e) {
      e.preventDefault();
    }

    window.onorientationchange = function(){
        window.setTimeout(function() {
        data = signaturePad.toData();
            resetWidthHeight();
            resizeCanvas();
        signaturePad.fromData(data);

        }, 250);
    }

    Sys.Application.add_load(function () {
        resetWidthHeight();
        var canvas = $('#signature-pad')[0];
        signaturePad = new SignaturePad(canvas, {
            minWidth: 2.5,
            maxWidth: 2.5,
            backgroundColor: 'rgba(255, 255, 255, 0)',
            penColor: 'rgb(0, 0, 0)'
        });
        resizeCanvas();
    });

    function resetWidthHeight() {
        $('.canvasDiv').height($(window).height() - $('.footer').height() - 10);
        $('.canvasPleceholder').height($(window).height() - $('.footer').height() - 10);
        $('.canvasPleceholder').width($('.canvasDiv').width());

        var canvas = $('#signature-pad')[0];
        canvas.style.width = $('.canvasDiv').width() + "px"; 
        canvas.style.height = $('.canvasDiv').height() + "px"; 
    }

    function resizeCanvas() {
        var canvas = $('#signature-pad')[0];
        var ratio =  Math.max(window.devicePixelRatio || 1, 1);
        canvas.width = canvas.offsetWidth * ratio;
        canvas.height = canvas.offsetHeight * ratio;
        
        canvas.getContext("2d").scale(ratio, ratio);
        signaturePad.clear();
    }
    
    function doUndo() {
        var data = signaturePad.toData();
        if (data) {
            data.pop(); 
            signaturePad.fromData(data);
        }
        return false;
    }

    function doReturn() {
        if (ajaxManager == null)
            ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
    
        ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Return", "Value": "" }));
        return false;
    }

    function doClear() {
        signaturePad.clear();
        return false;
    }

    function doSave() {
        if (ajaxManager == null)
            ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
        
        
        if(!signaturePad.isEmpty()) {
            $("#<%=txtDataUrl.ClientID%>").val(signaturePad.toDataURL());
        }
        else {
            $("#<%=txtDataUrl.ClientID%>").val("");
        }

        ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Save", "Value": "" }));
        return false;
    }
</script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest" meta:resourcekey="RadAjaxManager1Resource1">
    </telerik:RadAjaxManager>
    <div class="canvasDiv">
        <div class="canvasPleceholder">
            <asp:Label ID="lblSign" runat="server" Text="請簽名" meta:resourcekey="lblSignResource1"></asp:Label>
        </div>
        <canvas id="signature-pad" >
            Your browser does not support the HTML5 canvas tag.
        </canvas>
    </div>
    <asp:TextBox ID="txtDataUrl" runat="server" style="display:none" meta:resourcekey="txtDataUrlResource1"></asp:TextBox>
    <asp:Label ID="lblReturn" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnResource1"></asp:Label>
    <asp:Label ID="lblClear" runat="server" Text="清除" Visible="False" meta:resourcekey="lblClearResource1"></asp:Label>
    <asp:Label ID="lblUndo" runat="server" Text="復原" Visible="False" meta:resourcekey="lblUndoResource1"></asp:Label>
</asp:Content>
