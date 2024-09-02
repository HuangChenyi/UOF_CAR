<%@ Page Title="駕駛執照維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_HR_MaintainDrivingLic" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MaintainDrivingLic.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table cellspacing="1" class="PopTable" width="100%">
        <tr>
            <td style=" white-space:nowrap;">
                <asp:Label ID="Label1" runat="server" Text="有效日期" 
                    meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td style=" white-space:nowrap;">
                <table>
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdDueDate" runat="server"></telerik:RadDatePicker>
                        </td>
                    </tr>
                </table>
               
            </td>
        </tr>
        <tr>
            <td style=" white-space:nowrap;">
                <font color="red">*</font><asp:Label ID="Label2" runat="server" Text="駕照種類" 
                    meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td style=" white-space:nowrap;">
                <table style="width: 100%">
                    <tr>
                        <td width="150px">
                            <asp:TextBox ID="txtLicenseType" runat="server" 
                                meta:resourcekey="txtLicenseTypeResource1"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtLicenseType" ErrorMessage="請輸入駕照種類" 
                                meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style=" white-space:nowrap;">
               <font color="red">*</font><asp:Label ID="Label3" runat="server" Text="管轄編號" 
                    meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td style=" white-space:nowrap;">
                 <table style="width: 100%">
                    <tr>
                        <td width="150px">
                            <asp:TextBox ID="txtJurisdictionNo" runat="server" 
                                meta:resourcekey="txtJurisdictionNoResource1"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtJurisdictionNo" ErrorMessage="請輸入管轄編號" 
                                meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style=" white-space:nowrap;">
                <font color="red">*</font><asp:Label ID="Label4" runat="server" Text="印製號碼" 
                    meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td style=" white-space:nowrap;">
                 <table style="width: 100%">
                    <tr>
                        <td width="150px">
                            <asp:TextBox ID="txtPrintNo" runat="server" 
                                meta:resourcekey="txtPrintNoResource1"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtPrintNo" ErrorMessage="請輸入印製號碼" 
                                meta:resourcekey="RequiredFieldValidator4Resource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style=" white-space:nowrap;">
                <font color="red">*</font><asp:Label ID="Label5" runat="server" Text="持照條件" 
                    meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td style=" white-space:nowrap;">
                <table style="width: 100%">
                    <tr>
                        <td width="150px">
                            <asp:TextBox ID="txtHoldCondition" runat="server" 
                                meta:resourcekey="txtHoldConditionResource1"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtHoldCondition" ErrorMessage="請輸入持照條件" 
                                meta:resourcekey="RequiredFieldValidator5Resource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style=" white-space:nowrap;">
                <asp:Label ID="Label6" runat="server" Text="上傳附件" 
                    meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" />
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

