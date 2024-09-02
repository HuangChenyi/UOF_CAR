<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_SubscribeDoc" Title="訂閱文件" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SubscribeDoc.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">

    $(function() {

        ChangeStatus();
    });
 
 
 
    function ChangeStatus() {
        var chkSubscribe = $("#<%=chkSubscribe.ClientID%>");
        if (chkSubscribe.length == 0)
            return;

        var chkAllChange = $("#<%=chkAllChange.ClientID%>");
        // 文件版本更新
        var chkVerChange = $("#<%=chkVerChange.ClientID%>");

        // 文件作廢
        var chkDocVoid = $("#<%=chkDocVoid.ClientID%>");

        // 文件銷毀
        var chkDocDel = $("#<%=chkDocDel.ClientID%>");

        chkAllChange.prop("disabled", !chkSubscribe.prop("checked"));
        chkVerChange.prop("disabled", !chkSubscribe.prop("checked"));
        chkDocVoid.prop("disabled", !chkSubscribe.prop("checked"));
        chkDocDel.prop("disabled", !chkSubscribe.prop("checked"));
    }
 
 
        function ChangeInformType() {
            var chkAllChange = $("#<%=chkAllChange.ClientID%>");

            if (chkAllChange.length > 0) {
                // 文件版本更新
                var chkVerChange = $("#<%=chkVerChange.ClientID%>");

                // 文件作廢
                var chkDocVoid = $("#<%=chkDocVoid.ClientID%>");

                // 文件銷毀
                var chkDocDel = $("#<%=chkDocDel.ClientID%>");


                chkVerChange.prop("checked", chkAllChange.prop("checked"));
                chkDocVoid.prop("checked", chkAllChange.prop("checked"));
                chkDocDel.prop("checked", chkAllChange.prop("checked"));
            }
        }
 
 
        function ChangeAllStatus() {

            // 文件版本更新
            var chkVerChange = $("#<%=chkVerChange.ClientID%>");

            // 文件作廢
            var chkDocVoid = $("#<%=chkDocVoid.ClientID%>");

            // 文件銷毀
            var chkDocDel = $("#<%=chkDocDel.ClientID%>");

            var chkAllChange = $("#<%=chkAllChange.ClientID%>");


            if (chkVerChange.prop("checked") && chkDocVoid.prop("checked") && chkDocDel.prop("checked"))
                chkAllChange.prop("checked", true);
            else
                chkAllChange.prop("checked", false);
        }
 
 
 </script>

    &nbsp;<asp:CheckBox ID="chkSubscribe" runat="server" Text="訂閱內容" meta:resourcekey="chkSubscribeResource1" />
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="訂閱失敗" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="取消訂閱失敗" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="請選擇通知時機" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator><br />
    &nbsp;
    <asp:Label ID="Label2" runat="server" Text="文件所在目錄：" meta:resourcekey="Label2Resource1"></asp:Label><img
        src="../../DMS/images/open.gif" />
    <asp:Label ID="lblFolderName" runat="server" ForeColor="Blue"></asp:Label><br />
    <br />
     <div id="panelSubscribe">
    <table class="PopTable" cellpadding="0" cellspacing="0" border="1">
        <tr><td colspan="2" align="left" style="text-align:left">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="通知時機：" meta:resourcekey="Label3Resource1"></asp:Label></td></tr>
        <tr>
        <td style="width: 30%" align="left">
        <asp:CheckBox ID="chkAllChange" runat="server" Text="任何變更" meta:resourcekey="chkAllChangeResource1" /></td>
        <td style="width: 187px" align="left">
            &nbsp;<asp:CheckBox ID="chkVerChange" runat="server" Text="文件版本變更" meta:resourcekey="chkVerChangeResource1" /><br />
            &nbsp;<asp:CheckBox ID="chkDocVoid" runat="server" Text="文件作廢" meta:resourcekey="chkDocVoidResource1" /><br />
            &nbsp;<asp:CheckBox ID="chkDocDel" runat="server" Text="文件被銷毀" meta:resourcekey="chkDocDelResource1" /></td>
        </tr>
        
        </table>
    &nbsp;
    </div>
    <asp:Label ID="labDocIsDelete" runat="server" Text="文件已被銷毀" Visible="false" meta:resourcekey="labDocIsDeleteResource1"></asp:Label>
    <asp:Label ID="labDocStore" runat="server" Text="文件庫" Visible="False" meta:resourcekey="labDocStoreResource1"></asp:Label>
</asp:Content>

