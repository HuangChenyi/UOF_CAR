<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="CanvasDraw.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.CanvasDraw" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
    .canvasDiv {
        width:100%;
        height:inherit;
        overflow:hidden;
    }

    .canvasPleceholder {
        display: table;
        font-size: xx-large;
        position: absolute;
        color: lightgrey;
        z-index: -100;
        vertical-align: middle;
        text-align: center;
        opacity: 0.5;
        width: inherit;
        height: inherit;
    }

    .canvasPleceholder span {
        display: table-cell;
        vertical-align: middle;
    }
</style>
<script>
    var signaturePad;
     Sys.Application.add_load(function () { 
        var radwindow = $uof.dialog.getCurrentWindow();
      
        var canvas = document.getElementById('signature-pad');
        signaturePad = new SignaturePad(canvas, {
            minWidth: 2.5,
            maxWidth: 2.5,
            backgroundColor: 'rgba(255, 255, 255, 0)',
            penColor: 'rgb(0, 0, 0)'
        });
        resizeCanvas();
    });

    function doUndo() {
        var data = signaturePad.toData();
        if (data) {
            data.pop(); 
            signaturePad.fromData(data);
        }
        return false;
    }

    function doClear() {
        signaturePad.clear();
        return false;
    }

    function resizeCanvas() {
        var canvas = document.getElementById('signature-pad')
        var ratio =  Math.max(window.devicePixelRatio || 1, 1);
        canvas.width = canvas.offsetWidth * ratio;
        canvas.height = canvas.offsetHeight * ratio;
        canvas.getContext("2d").scale(ratio, ratio);
        signaturePad.clear();
    }

    function doSave() {
        if(!signaturePad.isEmpty()) {
            $("#<%=txtDataUrl.ClientID%>").val(signaturePad.toDataURL());
        }
        else {
            $("#<%=txtDataUrl.ClientID%>").val("ClearCanvas");
        }
    }

    
</script>
    <div class="canvasDiv">
        <div class="canvasPleceholder">
            <asp:Label ID="lblSign" runat="server" Text="請簽名" meta:resourcekey="lblSignResource1"></asp:Label>
        </div>
        <canvas id="signature-pad" style="width:inherit; height:inherit" >
            Your browser does not support the HTML5 canvas tag.
        </canvas>
    </div>
    <asp:TextBox ID="txtDataUrl" runat="server" style="display:none" meta:resourcekey="txtDataUrlResource1"></asp:TextBox>
    <asp:Label ID="lblReturn" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnResource1"></asp:Label>
    <asp:Label ID="lblClear" runat="server" Text="清除" Visible="False" meta:resourcekey="lblClearResource1"></asp:Label>
    <asp:Label ID="lblUndo" runat="server" Text="復原" Visible="False" meta:resourcekey="lblUndoResource1"></asp:Label>
</asp:Content>
