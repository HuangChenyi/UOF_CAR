<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupField_DataGrid" Title="新增欄位" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="SetupField_DataGrid.aspx.cs" %>

<%@ Register Src="UC_FiledDropList.ascx" TagName="UC_FiledDropList" TagPrefix="uc1" %>
<%@ Register Src="UC_ModifySel.ascx" TagName="UC_ModifySel" TagPrefix="uc4" %>
<%@ Register Src="UC_FieldControl.ascx" TagName="UC_FieldControl" TagPrefix="uc2" %>
<%@ Register Src="~/WKF/FormManagement/UC_VisibleControl.ascx" TagPrefix="uc1" TagName="UC_VisibleControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
        function checkEmpty(sender, args) {
            if (args.get_newValue() == "")
                args.set_newValue(0);
        }
    </script>
    <table>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblCopied" runat="server" Text="已成功複製" CssClass="SizeMemo" Visible="false"  meta:resourcekey="lblCopiedResource1"></asp:Label>
            </td>
        </tr>
    </table>
    <table width="100%" class="PopTable" cellspacing="1">

        <tr>
            <td align="center" class="PopTableHeader" colspan="4">
                <center>
           <asp:Label ID="lblDataGrid" runat="server" Text="明細欄位" meta:resourcekey="lblDataGridResource1"></asp:Label>
           </center>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <font color="red">*</font>
                <asp:Label ID="lblFieldId" runat="server" Text="欄位代號" meta:resourcekey="lblFieldIdResource1"></asp:Label></td>
            <td class="PopTableRightTD">
                <asp:TextBox ID="txtFieldId" runat="server" Width="98px" meta:resourcekey="txtFieldIdResource1"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldId" runat="server" ControlToValidate="txtFieldId" Display="Dynamic" ErrorMessage="請輸入欄位代號" meta:resourcekey="RequiredFieldValidatorFieldIdResource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidatorFieldId" runat="server" Display="Dynamic" ErrorMessage="同一表單版本的欄位代號不得重複" meta:resourcekey="CustomValidatorFieldIdResource1"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFieldId" Display="Dynamic" ErrorMessage="輸入內容只允許英文或數字" ValidationExpression="\w*" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator></td>
            <td class="PopTableLeftTD">
                <font color="red">*</font>
                <asp:Label ID="lblFieldName" runat="server" Text="欄位名稱" meta:resourcekey="lblFieldNameResource1"></asp:Label></td>
            <td class="PopTableRightTD">
                <asp:TextBox ID="txtFieldName" runat="server" Width="200px" meta:resourcekey="txtFieldNameResource1"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldName" runat="server" ControlToValidate="txtFieldName" Display="Dynamic" ErrorMessage="請輸入欄位名稱" meta:resourcekey="RequiredFieldValidatorFieldNameResource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="lblFieldType" runat="server" Text="欄位格式" meta:resourcekey="lblFieldTypeResource1"></asp:Label></td>
            <td class="PopTableRightTD">
                <uc1:UC_FiledDropList ID="UC_FiledDropList1" runat="server" />
                <asp:CustomValidator ID="CustomValidatorModifyFieldType" runat="server" Display="Dynamic" meta:resourcekey="CustomValidatorModifyFieldTypeResource1"></asp:CustomValidator></td>
            <td class="PopTableLeftTD">
                <asp:Label ID="lblFieldSeq" runat="server" Text="欄位順序" meta:resourcekey="lblFieldSeqResource1"></asp:Label></td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblSeq" runat="server" meta:resourcekey="lblSeqResource1"></asp:Label>
                <telerik:RadNumericTextBox ID="RadNumericTextBoxSeq" runat="server" MaxLength="3" MaxValue="999"
                    MinValue="0" Width="40px">
                </telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <font color="red">*</font>
                <asp:Label ID="lblTotalWidth" runat="server" Text="欄位寬度" meta:resourcekey="lblTotalWidthResource1"></asp:Label></td>
            <td colspan="3" class="PopTableRightTD">
                <telerik:RadNumericTextBox ID="RadNumericTextBox_Width" runat="server" MinValue="0" Value="0" ClientEvents-OnValueChanging="checkEmpty" Width="48px">
                    <NumberFormat ZeroPattern="n" AllowRounding="False"></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Text="px" meta:resourcekey="Label1Resource1"></asp:Label></td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="lblDispalyFieldName" runat="server" Text="欄位顯示" meta:resourcekey="lblDispalyFieldNameResource1"></asp:Label>
            </td>
            <td colspan="3" class="PopTableRightTD">
                <asp:CheckBox ID="cbxDisplayFieldName" runat="server" Text="顯示欄位名稱" Checked="true" meta:resourcekey="cbxDisplayFieldNameResource1" />
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="lblFieldControl" runat="server" Text="欄位控制" meta:resourcekey="lblFieldControlResource1"></asp:Label></td>
            <td colspan="3" class="PopTableRightTD">
                <uc2:UC_FieldControl ID="UC_FieldControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <font color="red">*</font>
                <asp:Label ID="lblDataGridSet" runat="server" Text="明細欄位" meta:resourcekey="lblDataGridSetResource1"></asp:Label></td>
            <td colspan="3" class="PopTableRightTD">
                <telerik:RadButton ID="WebImageButton1" runat="server" Text="明細欄位設定"
                    CausesValidation="False" Enabled="False"
                    meta:resourcekey="WebImageButton1Resource1" OnClick="WebImageButton1_Click1">
                </telerik:RadButton>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="lbl_FieldModify" runat="server" Text="修改權限" meta:resourcekey="lbl_FieldModifyRecource1"></asp:Label>
            </td>
            <td colspan="3" class="PopTableRightTD">
                <uc4:UC_ModifySel ID="UC_ModifySel1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblVisible" runat="server" Text="觀看權限控制" meta:resourcekey="lblVisibleResource1"></asp:Label>
            </td>
            <td colspan="3">
                <uc1:UC_VisibleControl runat="server" ID="UC_VisibleControl" />
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="lblFieldRemark" runat="server" Text="欄位備註" meta:resourcekey="lblFieldRemarkResource1"></asp:Label></td>
            <td colspan="3" class="PopTableRightTD">
                <asp:TextBox ID="txtFieldRemark" runat="server" Width="90%" meta:resourcekey="txtFieldRemarkResource1"></asp:TextBox></td>
        </tr>
    </table>
    <asp:Label ID="lblDetailSetup" runat="server" meta:resourcekey="lblDetailSetupResource1"
        Text="明細欄位設定" Visible="False"></asp:Label>
    <asp:HiddenField ID="hiddenFieldId" runat="server" />
</asp:Content>

