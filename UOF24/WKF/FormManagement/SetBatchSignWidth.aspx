<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetBatchSignWidth" Title="設定批次簽核欄位寬度" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SetBatchSignWidth.aspx.cs" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        function webNbrWidth_OnValueChanging(sender, e) {
            if (e.get_newValue() == '') {
                e.set_newValue(0);
            }
        }

    </script>

<table style="width:100%"  border="0" class="PopTable">
    <tr>
        <td style="width:100%" colspan="2" class="PopTableHeader">
            <center>
            <asp:Label ID="lblTitle" runat="server" Text="設定欄位寬度" 
                meta:resourcekey="lblTitleResource1"></asp:Label>
                </center></td>
    </tr>
    <tr>
        <td class="PopTableLeftTD"><asp:Label ID="lblSetWidth" runat="server" Text="寬度" 
                meta:resourcekey="lblSetWidthResource1"></asp:Label></td>
        <td class="PopTableRightTD">
            <telerik:RadNumericTextBox ID="webNbrWidth" runat="server" MaxLength="4" MaxValue="1024" MinValue="0"
                ClientEvents-OnValueChanging="webNbrWidth_OnValueChanging">
<NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
            </telerik:RadNumericTextBox>           
        </td>
    </tr>
</table>
    <asp:HiddenField ID="hiddenformVersionId" runat="server" />
    <asp:HiddenField ID="hiddenNodeId" runat="server" />
</asp:Content>

