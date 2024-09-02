<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SetupField_Canvas.aspx.cs" Inherits="WKF_FormManagement_SetupField_Canvas" Culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Src="UC_FiledDropList.ascx" TagName="UC_FiledDropList" TagPrefix="uc3" %>
<%@ Register Src="UC_FieldControl.ascx" TagName="UC_FieldControl" TagPrefix="uc2" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register src="UC_ModifySel.ascx" tagname="UC_ModifySel" tagprefix="uc4" %>
<%@ Register Src="~/WKF/FormManagement/UC_VisibleControl.ascx" TagPrefix="uc5" TagName="UC_VisibleControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td colspan="4">
                <asp:Label ID="lblCopied" runat="server" Text="已成功複製" CssClass="SizeMemo" Visible="false"  meta:resourcekey="lblCopiedResource1"></asp:Label>
            </td>
        </tr>
    </table>
    <table width="100%" class="PopTable" cellspacing="1">
        <colgroup class="PopTableLeftTD">
        </colgroup>
        <colgroup class="PopTableRightTD">
        </colgroup>
        <colgroup class="PopTableLeftTD">
        </colgroup>
        <colgroup class="PopTableRightTD">
        </colgroup>
        <tr>
            <td align="center" class="PopTableHeader" colspan="4">
                <center>
                <asp:Label ID="lblDropDownList" runat="server" meta:resourcekey="lblDropDownListResource1" ></asp:Label>
                </center>
                </td>
        </tr>
        <tr>
            <td><font color="red">*</font><asp:Label ID="lblFieldId" runat="server" Text="欄位代號"
                meta:resourcekey="lblFieldIdResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtFieldId" runat="server" Width="98px" meta:resourcekey="txtFieldIdResource1"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldId" runat="server" ControlToValidate="txtFieldId"
                    Display="Dynamic" ErrorMessage="請輸入欄位代號" meta:resourcekey="RequiredFieldValidatorFieldIdResource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidatorFieldId" runat="server" Display="Dynamic"
                    ErrorMessage="同一表單版本的欄位代號不得重複" meta:resourcekey="CustomValidatorFieldIdResource1"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFieldId"
                    Display="Dynamic" ErrorMessage="輸入內容只允許英文或數字" ValidationExpression="\w*" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator></td>
            <td><font color="red">*</font><asp:Label ID="lblFieldName" runat="server" Text="欄位名稱"
                meta:resourcekey="lblFieldNameResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtFieldName" runat="server" Width="200px" meta:resourcekey="txtFieldNameResource1"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldName" runat="server" ControlToValidate="txtFieldName"
                    Display="Dynamic" ErrorMessage="請輸入欄位名稱" meta:resourcekey="RequiredFieldValidatorFieldNameResource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFieldType" runat="server" Text="欄位格式" meta:resourcekey="lblFieldTypeResource1"></asp:Label></td>
            <td>
                <uc3:UC_FiledDropList ID="UC_FiledDropList1" runat="server" />
                <asp:CustomValidator ID="CustomValidatorModifyFieldType" runat="server" 
                    Display="Dynamic" meta:resourcekey="CustomValidatorModifyFieldTypeResource1"></asp:CustomValidator></td>
            <td>
                <asp:Label ID="lblFieldSeq" runat="server" Text="欄位順序" meta:resourcekey="lblFieldSeqResource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblSeq" runat="server" meta:resourcekey="lblSeqResource1"></asp:Label>
                <telerik:RadNumericTextBox ID="RadNumericTextBoxSeq" runat="server" MaxLength="3" MaxValue="999"
                    MinValue="0" Width="40px" meta:resourcekey="RadNumericTextBoxSeqResource1" Culture="zh-TW" DbValueFactor="1" LabelWidth="16px"></telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDispalyFieldName" runat="server" Text="欄位顯示" meta:resourcekey="lblDispalyFieldNameResource1"></asp:Label>
            </td>
            <td colspan=3>
                <asp:CheckBox ID="cbxDisplayFieldName" runat="server" Text="顯示欄位名稱" Checked=True meta:resourcekey="cbxDisplayFieldNameResource1"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFieldControl" runat="server" Text="欄位控制" meta:resourcekey="lblFieldControlResource1"></asp:Label></td>
            <td colspan="3">
                <uc2:UC_FieldControl ID="UC_FieldControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_FieldModify" runat="server" Text="修改權限" 
                    meta:resourcekey="lbl_FieldModifyResource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:Label ID="lblNotAllowModify" runat="server" Text="簽名欄位不支援修改設定" CssClass="SizeMemo" meta:resourcekey="lblNotAllowModifyResource1"></asp:Label>
                <div style="display:none">
                    <uc4:UC_ModifySel ID="UC_ModifySel1" runat="server" />
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblVisible" runat="server" Text="觀看權限控制" meta:resourcekey="lblVisibleResource1"></asp:Label>
            </td>
            <td colspan="3">
                <uc5:UC_VisibleControl runat="server" ID="UC_VisibleControl" />
            </td>
        </tr>
        <tr id="GrideDetail">
        <td>
            <asp:Label ID="lblDisplayLength" runat="server" Text="顯示寬度" meta:resourcekey="lblDisplayLengthRecource1"></asp:Label></td>
        <td colspan="3">
            <telerik:RadNumericTextBox ID="RadNumericViewLength" runat="server" MaxLength="5"
                MaxValue="1000" MinValue="0" NullText="0" Width="40px" meta:resourcekey="RadNumericViewLengthResource1" Culture="zh-TW" DbValueFactor="1" LabelWidth="16px"></telerik:RadNumericTextBox>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" 
                Text="px" meta:resourcekey="Label2Resource1"></asp:Label>
            <asp:Label ID="lblDisplayLengthNotify" runat="server" Text="(表單顯示的限制長度，設零由系統自行調整)" meta:resourcekey="lblDisplayLengthNotifyRecource1"></asp:Label></td>
    </tr>
        <tr>
            <td>
                <asp:Label ID="lblFieldRemark" runat="server" Text="欄位備註" meta:resourcekey="lblFieldRemarkResource1"></asp:Label></td>
            <td colspan="3">
                <asp:TextBox ID="txtFieldRemark" runat="server" Width="90%" meta:resourcekey="txtFieldRemarkResource1"></asp:TextBox>&nbsp;
            </td>
        </tr>
    </table>
    <asp:RadioButton ID="rbAptoticField" runat="server" Checked="True" Text="固定欄位選項" Visible="False" meta:resourcekey="rbAptoticFieldResource1" />
    <asp:Label ID="lblFieldSource" runat="server" Text="資料來源" Visible="False" meta:resourcekey="lblFieldSourceResource1"></asp:Label><br />
    <asp:Label ID="lblSetup" runat="server" meta:resourcekey="lblSetupResource1" Text="設定" Visible="False"></asp:Label>
    <asp:HiddenField ID="hiddenFieldId" runat="server" />
    <input type="hidden" id="HiddenFieldItemValue" runat="server" />
    <asp:Label ID="lblTestMsg500" runat="server" Text="呼叫Web Method錯誤" Visible="False" meta:resourcekey="lblTestMsg500Resource1"></asp:Label>
    <asp:Label ID="lblTestMsg401" runat="server" Text="無法認證通過" Visible="False" meta:resourcekey="lblTestMsg401Resource1"></asp:Label>
    <asp:Label ID="lblTestMsg404" runat="server" Text="無法呼叫asmx檔案" Visible="False" meta:resourcekey="lblTestMsg404Resource1"></asp:Label>
    <asp:Label ID="lblTestMsg99" runat="server" Text="無法連線Web Service主機" Visible="False" meta:resourcekey="lblTestMsg99Resource1"></asp:Label>
    <asp:Label ID="lblTestMsg" runat="server" Text="測試成功!!" Visible="False" meta:resourcekey="lblTestMsgResource1"></asp:Label>
    <asp:Label ID="lblNotifyMsgA" runat="server" Text="請填寫WebService URL及WebService Method" Visible="False" meta:resourcekey="lblNotifyMsgAResource1"></asp:Label>
    <asp:Label ID="lblNotifyMsgB" runat="server" Text="請填寫WebService主機帳號" Visible="False" meta:resourcekey="lblNotifyMsgBResource1"></asp:Label>
    <asp:Label ID="lblNormalNotify" runat="server" meta:resourcekey="lblNormalNotifyResource1" Text="只測試連線，此階段無法驗證資料的正確性與否" Visible="False"></asp:Label>
    <asp:Label ID="lblTestMsgError" runat="server" Text="測試失敗!!" Visible="False" meta:resourcekey="lblTestMsgErrorResource1"></asp:Label>
</asp:Content>
