<%@ Page Title="新增/維護證照" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_HR_MaintainEipLicense" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MaintainEipLicense.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="PopTable" style="width:100%">
        <tr>
            <td style="width:25%; white-space:nowrap;">
                <font color="red">*</font><asp:Label ID="Label1" runat="server" Text="證照類別" 
                    meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td style=" white-space:nowrap;">
                <asp:DropDownList ID="ddlLicType" runat="server" 
                    meta:resourcekey="ddlLicTypeResource1">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvLicenseType" runat="server" Display="Dynamic"
                    ErrorMessage="請選擇證照類別" ControlToValidate="ddlLicType" 
                    meta:resourcekey="rfvLicenseTypeResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <font color="red">*</font><asp:Label ID="Label2" runat="server" Text="證照代碼" 
                    meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td style=" white-space:nowrap;">
                <asp:TextBox ID="txtLicGuid" runat="server" 
                    meta:resourcekey="txtLicGuidResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEnterLicense" runat="server" 
                    ErrorMessage="請輸入證照代碼" ControlToValidate="txtLicGuid" Display="Dynamic" 
                    meta:resourcekey="rfvEnterLicenseResource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvLicenseExist" runat="server" ErrorMessage="代碼已存在" 
                    Display="Dynamic" meta:resourcekey="cvLicenseExistResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <font color="red">*</font><asp:Label ID="Label3" runat="server" Text="證照名稱" 
                    meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td style=" white-space:nowrap;">
                <asp:TextBox ID="txtLicName" runat="server" 
                    meta:resourcekey="txtLicNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="請輸入證照名稱" ControlToValidate="txtLicName" Display="Dynamic" 
                    meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="False" 
        meta:resourcekey="lblSelectResource1"></asp:Label>
</asp:Content>

