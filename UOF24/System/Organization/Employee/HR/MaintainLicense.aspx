<%@ Page Title="考試證照維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_HR_MaintainLicense" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="MaintainLicense.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="PopTable" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label1Resource1"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="年度" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="rdYear" runat="server" Width="80px" DataType="System.Int32" MaxLength="4" MaxValue="2100" MinValue="1911">
                    <NumberFormat ZeroPattern="n" DecimalDigits="0" GroupSeparator=""></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rdYear" ErrorMessage="請輸入年度" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label3Resource1"></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="類別" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlType_SelectedIndexChanged"
                    meta:resourcekey="ddlTypeResource1">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rvType" runat="server" ControlToValidate="ddlType" ErrorMessage="請選擇類別" meta:resourcekey="rvTypeResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label5Resource1"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="證照" meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlLicenseName" runat="server"
                    meta:resourcekey="ddlLicenseNameResource1">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rvLicenseName" runat="server" ControlToValidate="ddlLicenseName" ErrorMessage="請選擇證照" meta:resourcekey="rvLicenseNameResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="級別" meta:resourcekey="Label8Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtGrade" runat="server" MaxLength="50" meta:resourcekey="txtGradeResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="證件字號"
                    meta:resourcekey="Label7Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNumber" runat="server" MaxLength="50"
                    meta:resourcekey="txtNumberResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="取得日期"
                    meta:resourcekey="Label9Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadDatePicker ID="rdAcquDate" runat="server"></telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap;">
                <asp:Label ID="Label10" runat="server" Text="有效期限"
                    meta:resourcekey="Label10Resource1"></asp:Label>
            </td>
            <td style="white-space: nowrap;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rb1" runat="server" AutoPostBack="True"
                                        OnCheckedChanged="rb1_CheckedChanged" meta:resourcekey="rb1Resource1" />
                                </td>
                                <td>
                                    <asp:Label ID="Label13" runat="server" Text="永久有效"
                                        meta:resourcekey="Label13Resource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:RadioButton ID="rb2" runat="server" AutoPostBack="True"
                                        OnCheckedChanged="rb2_CheckedChanged" meta:resourcekey="rb2Resource1" />
                                </td>
                                <td>
                                    <telerik:RadDatePicker ID="rdEFFDate" runat="server"></telerik:RadDatePicker>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvDate" runat="server"
                                        ControlToValidate="rdEFFDate" ErrorMessage="請選擇有效期限"
                                        meta:resourcekey="rfvDateResource1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label11" runat="server" Text="備註"
                    meta:resourcekey="Label11Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtRemark" runat="server"
                    meta:resourcekey="txtRemarkResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label12" runat="server" Text="上傳附件"
                    meta:resourcekey="Label12Resource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedMultipleFileSelection="false" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="false" meta:resourcekey="lblSelectResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
