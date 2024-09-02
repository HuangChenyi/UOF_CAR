<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="VirtualDeptSettingEdit.aspx.cs" Inherits="Ede.Uof.Web.Basic.Analysis.VirtualDeptSettingEdit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        function CheckSelectGroup(source, args) {
            var txtDept = $('#<%= txtDept.ClientID%>');
            if (txtDept.val() == '') {
                args.IsValid = false;
                return;
            }
        }
</script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable"  style="width:100%">
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="lblMark" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblMarkResource1"></asp:Label>
                        <asp:Label ID="lblDept" runat="server" Text="部門" meta:resourcekey="lblDeptResource1" ></asp:Label>
                    </td>
                    <td style="white-space: nowrap;">
                        <asp:TextBox ID="txtDept" runat="server" meta:resourcekey="txtDeptResource1"></asp:TextBox>                       
                        <asp:CustomValidator ID="cvCheckSelectGroup" runat="server" ErrorMessage="部門欄位必填" Display="Dynamic" ClientValidationFunction="CheckSelectGroup" meta:resourcekey="cvCheckSelectGroupResource1"></asp:CustomValidator>                       
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="lblEmployee" runat="server" Text="員工" meta:resourcekey="lblEmployeeResource1"></asp:Label>
                    </td>
                    <td>
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceListEmployee" />
                    </td>
                </tr>
            </table>
             <asp:HiddenField ID="hfGroupList" runat="server" />
            <asp:HiddenField ID="hfSettingGuid" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
