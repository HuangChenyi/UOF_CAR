<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrgDialog.aspx.cs" MasterPageFile="~/Master/DialogMasterPage.master" Inherits="Ede.Uof.Web.Edoc.Management.OrgDialog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        /* 隱藏Grid內的欄位 */
        .cssHidden {
            display: none;
        }
    </style>
    <script type="text/javascript">
        function ConfirmDelete() {
            if (confirm('<%=lblDelete.Text%>')) {
                return true;
            }
            else {
                return false;
            }
        }

    </script>

    

    <table class="PopTable">
        <tr>
            <td style=" white-space:nowrap;">
                <asp:Label runat="server" ID="Label1" Text="機關代碼"></asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="lblOrgId" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td style=" white-space:nowrap;">
                <asp:Label runat="server" ID="lblNeedOrgName" Text="*" ForeColor="Red"></asp:Label>
                <asp:Label runat="server" ID="Label2" Text="機關名稱"></asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="lblOrgName" Text=""></asp:Label>
                <asp:TextBox runat="server" ID="txtOrgName" Style="text-align: left" Width="100%" MaxLength="255"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style=" white-space:nowrap;">
                <asp:Label ID="lblNeedOrgAddress" runat="server" Text="*" ForeColor="Red"></asp:Label>
                <asp:Label runat="server" ID="Label3" Text="地址"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtOrgZipCode" Style="text-align: left; width:60px" MaxLength="10"></asp:TextBox>
                <asp:TextBox runat="server" ID="txtOrgAddress" Style=" width:85% ; text-align: left" MaxLength="255"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style=" white-space:nowrap;">
                <asp:Label runat="server" ID="Label4" Text="電子交換"></asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="lblExchangeType" Text=""></asp:Label>
                <asp:CheckBox ID="chkExchangeType" runat="server" />
            </td>
        </tr>

    </table>

    <asp:HiddenField runat="server" ID="hfOrgId" />
    <asp:HiddenField runat="server" ID="hfImportType" />
    <asp:Label runat="server" ID="lblExchangeTypeCancel" Text="若取消電子交換，發文方式將只能選擇郵寄。" ForeColor="Blue"></asp:Label>
    <asp:Label runat="server" ID="lblImportTypeIsCustom" Text="自訂的受文機關，發文方式統一為郵寄，無法選擇電子交換。" ForeColor="Blue"></asp:Label>

    <asp:Label runat="server" ID="lblAutoOrgId" Text="由系統自動產生" CssClass="cssHidden"></asp:Label>

    <asp:Label runat="server" ID="lblOrgNameError" Text="通訊錄中已有此機關" CssClass="cssHidden"></asp:Label>

    <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" CssClass="cssHidden"></asp:Label>

    <asp:Label ID="lblNullError" runat="server" Text="必填" CssClass="cssHidden"></asp:Label>

    <asp:Label ID="lblIsSpecialChar" runat="server" Text="不可輸入特殊符號" CssClass="cssHidden"></asp:Label>

</asp:Content>
