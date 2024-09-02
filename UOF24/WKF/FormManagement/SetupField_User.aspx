<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupField_User" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="SetupField_User.aspx.cs" %>

<%@ Register Src="UC_FiledDropList.ascx" TagName="UC_FiledDropList" TagPrefix="uc2" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>
<%@ Register Src="~/WKF/FormManagement/UC_VisibleControl.ascx" TagPrefix="uc1" TagName="UC_VisibleControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblCopied" runat="server" Text="已成功複製" CssClass="SizeMemo" Visible="false"  meta:resourcekey="lblCopiedResource1"></asp:Label>
            </td>
        </tr>
    </table>
    <table width="100%" class="PopTable" cellspacing="1">
        <colgroup class="PopTableLeftTD"></colgroup>
        <colgroup class="PopTableRightTD"></colgroup>
        <colgroup class="PopTableLeftTD"></colgroup>
        <colgroup class="PopTableRightTD"></colgroup>
        <tr>
            <td align="center" class="PopTableHeader" colspan="4">
                <center>
                    <asp:Label ID="lblSpecialField" runat="server" Text="" meta:resourcekey="lblSpecialFieldResource1"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td>
                <font color="red">*</font>
                <asp:Label ID="lblFieldId" runat="server" Text="欄位代號" meta:resourcekey="lblFieldIdResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtFieldId" runat="server" Width="98px" meta:resourcekey="txtFieldIdResource1"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldId" runat="server" ControlToValidate="txtFieldId"
                    Display="Dynamic" ErrorMessage="請輸入欄位代號" meta:resourcekey="RequiredFieldValidatorFieldIdResource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidatorFieldId" runat="server" Display="Dynamic"
                    ErrorMessage="同一表單版本的欄位代號不得重複" meta:resourcekey="CustomValidatorFieldIdResource1"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFieldId"
                    Display="Dynamic" ErrorMessage="輸入內容只允許英文或數字" ValidationExpression="\w*" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator></td>
            <td>
                <font color="red">*</font>
                <asp:Label ID="lblFieldName" runat="server" Text="欄位名稱" meta:resourcekey="lblFieldNameResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtFieldName" runat="server" Width="200px" meta:resourcekey="txtFieldNameResource1"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldName" runat="server" ControlToValidate="txtFieldName"
                    Display="Dynamic" ErrorMessage="請輸入欄位名稱" meta:resourcekey="RequiredFieldValidatorFieldNameResource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFieldType" runat="server" Text="欄位格式" meta:resourcekey="lblFieldTypeResource1"></asp:Label></td>
            <td>
                <uc2:UC_FiledDropList ID="UC_FiledDropList1" runat="server" />
                <asp:CustomValidator ID="CustomValidatorModifyFieldType" runat="server" Display="Dynamic"></asp:CustomValidator></td>
            <td>
                <asp:Label ID="lblFieldSeq" runat="server" Text="欄位順序" meta:resourcekey="lblFieldSeqResource1"></asp:Label></td>
            <td>
                <telerik:RadNumericTextBox ID="RadNumericTextBoxSeq" runat="server" MaxLength="3" MaxValue="999"
                    MinValue="0" Width="40px">
                </telerik:RadNumericTextBox>
                <asp:Label ID="lblSeq" runat="server" meta:resourcekey="lblSeqResource1"></asp:Label></td>
        </tr>
        <tr id="GrideDetail">
            <td>
                <asp:Label ID="lblDisplayLength" runat="server" Text="顯示寬度" meta:resourcekey="lblDisplayLengthRecource1"></asp:Label></td>
            <td colspan="3">
                <telerik:RadNumericTextBox ID="RadNumericViewLength" runat="server" MaxLength="5"
                    MaxValue="1000" MinValue="0" NullText="0" Width="40px" DataType="System.Int16">
                    <NumberFormat ZeroPattern="n" AllowRounding="False"></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="px"></asp:Label>
                <asp:Label ID="lblDisplayLengthNotify" runat="server" Text="(表單顯示的限制長度，設零由系統自行調整)" meta:resourcekey="lblDisplayLengthNotifyRecource1"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="欄位備註" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td colspan="3">
                <asp:TextBox ID="txtFieldRemark" runat="server" Width="90%" meta:resourcekey="txtFieldRemarkResource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDispalyFieldName" runat="server" Text="欄位顯示" meta:resourcekey="lblDispalyFieldNameResource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:CheckBox ID="cbxDisplayFieldName" runat="server" Text="顯示欄位名稱" Checked="true" meta:resourcekey="cbxDisplayFieldNameResource1" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblFieldModify" runat="server" Text="是否可修改" Visible="False" meta:resourcekey="lblFieldModifyResource1"></asp:Label>
    <asp:RadioButtonList ID="rblFieldModify" runat="server" RepeatDirection="Horizontal" Enabled="False" Visible="False" meta:resourcekey="rblFieldModifyResource1">
        <asp:ListItem Value="1" meta:resourcekey="ListItemResource21">是</asp:ListItem>
        <asp:ListItem Value="0" Selected="True" meta:resourcekey="ListItemResource22">否</asp:ListItem>
    </asp:RadioButtonList>
    <asp:HiddenField ID="hiddenFieldId" runat="server" />
    <asp:Label ID="lblApplicant" runat="server" Text="申請者" Visible="False" meta:resourcekey="lblApplicantResource1"></asp:Label>
    <asp:Label ID="lblApplicantDept" runat="server" Text="申請者部門" Visible="False" meta:resourcekey="lblApplicantDeptResource1"></asp:Label>
    <asp:Label ID="lblApplicantRank" runat="server" Text="申請者職級" Visible="False" meta:resourcekey="lblApplicantRankResource1"></asp:Label>
    <asp:Label ID="lblApplicantFunction" runat="server" Text="申請者職務" Visible="False" meta:resourcekey="lblApplicantFunctionResource1"></asp:Label>
</asp:Content>

