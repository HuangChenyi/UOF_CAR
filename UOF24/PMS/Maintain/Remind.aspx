<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="PMS_Maintain_Remind" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Remind.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table class="PopTable">
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="Label1" runat="server" Text="專案名稱" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblProjName" runat="server" meta:resourcekey="lblProjNameResource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="Label2" runat="server" Text="階段/任務名稱" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblTaskName" runat="server" meta:resourcekey="lblTaskNameResource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <span style="color: #ff0000">*</span><asp:Label ID="Label3" runat="server" Text="提醒事項" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td>
                <asp:RequiredFieldValidator ID="rfvRemindDesc" runat="server" Display="Dynamic" ControlToValidate="txtRemindDesc" ErrorMessage="請輸入提醒事項" ForeColor="Red" meta:resourcekey="rfvRemindDescResource1"></asp:RequiredFieldValidator> 
                <asp:TextBox ID="txtRemindDesc" runat="server" Columns="30" Rows="5" TextMode="MultiLine" MaxLength="200" Width="100%" meta:resourcekey="txtRemindDescResource1"></asp:TextBox>
                </td>
        </tr>
    </table>
    <asp:HiddenField ID="hidProjGUID" runat="server" />
    <asp:HiddenField ID="hidTaskGUID" runat="server" />
    <asp:HiddenField ID="hidSeriesGUID" runat="server" />
</asp:Content>

