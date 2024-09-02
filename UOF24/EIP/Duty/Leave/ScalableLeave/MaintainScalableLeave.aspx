<%@ Page Title="新增/維䕶彈休假" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Leave_ScalableLeave_MaintainScalableLeave" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MaintainScalableLeave.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="PopTable" >
        <tr>
            <td style=" white-space:nowrap;">
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" 
                    meta:resourcekey="Label1Resource1" ></asp:Label>
                <asp:Label ID="lblDate" runat="server" Text="日期" 
                    meta:resourcekey="lblDateResource1" ></asp:Label>
            </td>
            <td>
                <telerik:RadDatePicker ID="rdDate" runat="server">
                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>
                    <DateInput LabelWidth="40%"></DateInput>
                    <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" 
                    meta:resourcekey="Label2Resource1" ></asp:Label>
                <asp:Label ID="lblName" runat="server" Text="名稱" 
                    meta:resourcekey="lblNameResource1" ></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" meta:resourcekey="txtNameResource1" Width="100%"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="rfvCheckName" runat="server" ErrorMessage="必填欄位" Display="Dynamic" ControlToValidate="txtName" meta:resourcekey="rfvCheckNameResource1" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblRemark" runat="server" Text="備註" 
                    meta:resourcekey="lblRemarkResource1" ></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtRemark" runat="server" meta:resourcekey="txtRemarkResource1" Width="100%"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfType" runat="server" />
    <asp:HiddenField ID="hfDate" runat="server" />
    <asp:Label ID="lblMessage" runat="server" Text="※欄位前有 * 符號為必填欄位。" 
        CssClass="SizeMemo" meta:resourcekey="lblMessageResource1" ></asp:Label>
    <asp:CustomValidator ID="cvDateRepeat" runat="server" 
        ErrorMessage="已有相同日期的彈休假資訊。" Display="Dynamic" 
        meta:resourcekey="cvDateRepeatResource1" ></asp:CustomValidator>
</asp:Content>

