<%@ Page Title="工作經歷維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_HR_MaintainHRExp" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MaintainHRExp.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="PopTable" cellpadding="0" cellspacing="1" width="100%">
        <tr>
            <td class="PopTableLeftTD" style="white-space: nowrap;">
                <font color="red">*</font>
                <asp:Label ID="lblCompany" runat="server" Text="服務單位"
                    meta:resourcekey="lblCompanyResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space: nowrap;">
                <asp:TextBox ID="txtCompany" runat="server" MaxLength="50" Width="130px"
                    meta:resourcekey="txtCompanyResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCompany" runat="server"
                    ControlToValidate="txtCompany" Display="Dynamic" ErrorMessage="服務單位不可空白" meta:resourcekey="rfvCompanyResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space: nowrap;">
                <font color="red">*</font>
                <asp:Label ID="lblDepartment" runat="server"
                    Text="部門" meta:resourcekey="lblDepartmentResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space: nowrap;">
                <asp:TextBox ID="txtDepartment" runat="server" MaxLength="50" Width="130px"
                    meta:resourcekey="txtDepartmentResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDepartment" runat="server"
                    ControlToValidate="txtDepartment" Display="Dynamic"
                    ErrorMessage="部門不可空白" meta:resourcekey="rfvDepartmentResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space: nowrap;">
                <font color="red">*</font>
                <asp:Label ID="lblTitle" runat="server" Text="職級"
                    meta:resourcekey="lblTitleResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space: nowrap;">
                <asp:TextBox ID="txtTitle" runat="server" MaxLength="50" Width="130px"
                    meta:resourcekey="txtTitleResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTitle" runat="server"
                    ControlToValidate="txtTitle" Display="Dynamic"
                    ErrorMessage="職級不可空白" meta:resourcekey="rfvTitleResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space: nowrap;">
                <font color="red">*</font>
                <asp:Label ID="lblManage" runat="server"
                    Text="是否擔任主管職" meta:resourcekey="lblManageResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space: nowrap;">
                <table width="100%">
                    <tr>
                        <td width="70px">
                            <asp:RadioButtonList ID="rblManage" runat="server" RepeatDirection="Horizontal"
                                meta:resourcekey="rblManageResource1">
                                <asp:ListItem Value="1" meta:resourcekey="ListItemResource1">是</asp:ListItem>
                                <asp:ListItem Value="0" meta:resourcekey="ListItemResource2">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvManage" runat="server"
                                ControlToValidate="rblManage" Display="Dynamic"
                                ErrorMessage="請選擇是否擔任主管職" meta:resourcekey="rfvManageResource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space: nowrap;">
                <font color="red">*</font>
                <asp:Label ID="lblPeriodYear" runat="server"
                    Text="經歷年資" meta:resourcekey="lblPeriodYearResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space: nowrap;">
                <telerik:RadNumericTextBox ID="webnePeriodYear" MinValue="0" MaxValue="99.9" Type="Number" NumberFormat-DecimalDigits="1" runat="server">
                </telerik:RadNumericTextBox>
                <asp:RequiredFieldValidator ID="rfvPeriodYear" runat="server"
                    ControlToValidate="webnePeriodYear" Display="Dynamic"
                    ErrorMessage="經歷年資不可空白" meta:resourcekey="rfvPeriodYearResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space: nowrap;">
                <font color="red">*</font>
                <asp:Label ID="lblFromDate" runat="server" Text="到職日期"
                    meta:resourcekey="lblFromDateResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space: nowrap;">
                <table width="100%">
                    <tr>
                        <td width="100px">
                            <telerik:RadDatePicker ID="webdcFromDate" runat="server">
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfvFromDate" runat="server"
                                ControlToValidate="webdcFromDate" Display="Dynamic"
                                ErrorMessage="到職日期不可空白" meta:resourcekey="rfvFromDateResource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space: nowrap;">
                <font color="red">*</font>
                <asp:Label ID="lblLeaveDate" runat="server"
                    Text="離職日期" meta:resourcekey="lblLeaveDateResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space: nowrap;">
                <table width="100%">
                    <tr>
                        <td width="100px">
                            <telerik:RadDatePicker ID="webdcLeaveDate" runat="server">
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rvfLeaveDate" runat="server"
                                ControlToValidate="webdcLeaveDate" Display="Dynamic"
                                ErrorMessage="離職日期不可空白" meta:resourcekey="rvfLeaveDateResource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space: nowrap;">
                <asp:Label ID="lblSalary" runat="server" Text="薪額"
                    meta:resourcekey="lblSalaryResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space: nowrap;">
                <telerik:RadNumericTextBox ID="webneSalary" runat="server" NumberFormat-DecimalDigits="0" Type="Number" MinValue="0">
                </telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space: nowrap;">
                <font color="red">*</font>
                <asp:Label ID="lblReason" runat="server" Text="離職原因"
                    meta:resourcekey="lblReasonResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space: nowrap;">
                <asp:TextBox ID="txtReason" runat="server" MaxLength="255" Width="130px"
                    meta:resourcekey="txtReasonResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvReason" runat="server"
                    ControlToValidate="txtReason" Display="Dynamic"
                    ErrorMessage="離職原因不可空白" meta:resourcekey="rfvReasonResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space: nowrap;">
                <asp:Label ID="lblFile" runat="server" Text="上傳附件"
                    meta:resourcekey="lblFileResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" />
            </td>
        </tr>
    </table>

</asp:Content>