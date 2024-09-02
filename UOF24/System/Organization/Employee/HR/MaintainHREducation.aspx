<%@ Page Title="學歷維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_HR_MaintainHREducation" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="MaintainHREducation.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table class="PopTable" cellpadding="0" cellspacing="1" width="100%">
        <tr>
            <td class="PopTableLeftTD" nowrap="nowrap">
                <font color="red">*</font>
                <asp:Label ID="lblCompany" runat="server" Text="學校名稱"
                    meta:resourcekey="lblCompanyResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space: nowrap;">
                <asp:TextBox ID="txtSchool" runat="server" MaxLength="255" Width="130px"
                    meta:resourcekey="txtSchoolResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvSchool" runat="server"
                    ControlToValidate="txtSchool" Display="Dynamic" ErrorMessage="學校名稱不可空白" meta:resourcekey="rfvSchoolResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" nowrap="nowrap">
                <font color="red">*</font>
                <asp:Label ID="lblMajor" runat="server" Text="院系科別"
                    meta:resourcekey="lblMajorResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space: nowrap;">
                <asp:TextBox ID="txtMajor" runat="server" MaxLength="255" Width="130px"
                    meta:resourcekey="txtMajorResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMajor" runat="server"
                    ControlToValidate="txtMajor" Display="Dynamic"
                    ErrorMessage="院系科別不可空白" meta:resourcekey="rfvMajorResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" nowrap="nowrap">
                <font color="red">*</font>
                <asp:Label ID="lblMajorFromDate" runat="server"
                    Text="修業年限(起)" meta:resourcekey="lblMajorFromDateResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space: nowrap;">
                <table width="100%">
                    <tr>
                        <td width="100px">
                            <telerik:RadDatePicker ID="rdMajorFromDate" runat="server"></telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvMajorFromDate" runat="server"
                                ControlToValidate="rdMajorFromDate" Display="Dynamic"
                                ErrorMessage="修業年限(起)不可空白" meta:resourcekey="rfvMajorFromDateResource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" nowrap="nowrap">
                <font color="red">*</font>
                <asp:Label ID="lblMajorToDate" runat="server"
                    Text="修業年限(迄)" meta:resourcekey="lblMajorToDateResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space: nowrap;">
                <table width="100%">
                    <tr>
                        <td width="100px">
                            <telerik:RadDatePicker ID="rdMajorToDate" runat="server"></telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvMajorToDate" runat="server"
                                ControlToValidate="rdMajorToDate" Display="Dynamic"
                                ErrorMessage="修業年限(迄)不可空白" meta:resourcekey="rfvMajorToDateResource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" nowrap="nowrap">
                <font color="red">*</font>
                <asp:Label ID="lblGraduated" runat="server" Text="畢業"
                    meta:resourcekey="lblGraduatedResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space: nowrap;">
                <table width="100%">
                    <tr>
                        <td width="100px">
                            <asp:RadioButtonList ID="rblGraduated" runat="server" RepeatDirection="Horizontal"
                                meta:resourcekey="rblGraduatedResource1">
                                <asp:ListItem Value="1" meta:resourcekey="ListItemResource1">畢業</asp:ListItem>
                                <asp:ListItem Value="0" meta:resourcekey="ListItemResource2">肄業</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvGraduated" runat="server"
                                ControlToValidate="rblGraduated" Display="Dynamic"
                                ErrorMessage="請選擇畢業" meta:resourcekey="rfvGraduatedResource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" nowrap="nowrap">
                <font color="red">*</font>
                <asp:Label ID="lblLeaveDate" runat="server"
                    Text="教育程度" meta:resourcekey="lblLeaveDateResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space: nowrap;">
                <asp:DropDownList ID="ddlLevel" runat="server"
                    meta:resourcekey="ddlLevelResource1">
                    <asp:ListItem Value="" meta:resourcekey="ListItemResource3">請選擇</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvddlLevel" runat="server"
                    ControlToValidate="ddlLevel" Display="Dynamic"
                    ErrorMessage="請選擇教育程度" meta:resourcekey="rfvddlLevelResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" nowrap="nowrap">
                <asp:Label ID="lblSalary" runat="server" Text="證件字號"
                    meta:resourcekey="lblSalaryResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space: nowrap;">
                <asp:TextBox ID="txtNumber" runat="server" MaxLength="50" Width="130px"
                    meta:resourcekey="txtNumberResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" nowrap="nowrap">
                <asp:Label ID="lblFile" runat="server" Text="上傳附件"
                    meta:resourcekey="lblFileResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <uc2:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedMultipleFileSelection="false" />
            </td>
        </tr>
    </table>

</asp:Content>
