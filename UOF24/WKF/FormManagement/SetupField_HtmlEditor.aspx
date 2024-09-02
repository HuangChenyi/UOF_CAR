<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupField_HtmlEditor" meta:resourcekey="PageResource1" CodeBehind="SetupField_HtmlEditor.aspx.cs" %>

<%@ Register Src="UC_FiledDropList.ascx" TagName="UC_FiledDropList" TagPrefix="uc3" %>
<%@ Register Src="UC_FieldControl.ascx" TagName="UC_FieldControl" TagPrefix="uc2" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="UC_ModifySel.ascx" TagName="UC_ModifySel" TagPrefix="uc4" %>
<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>
<%@ Register Src="~/WKF/FormManagement/UC_VisibleControl.ascx" TagPrefix="uc1" TagName="UC_VisibleControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function CheckNullorEmpty(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(0);
            }
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
        <colgroup class="PopTableLeftTD">
        </colgroup>
        <colgroup class="PopTableRightTD">
        </colgroup>
        <colgroup class="PopTableLeftTD">
        </colgroup>
        <colgroup class="PopTableRightTD">
        </colgroup>
        <tr>
            <td class="PopTableHeader" colspan="4">
                <center>                
                    <asp:Label ID="lblDropDownList" runat="server" Text="文字編輯欄位" meta:resourcekey="lblDropDownListResource1"></asp:Label>
               </center>
            </td>
        </tr>
        <tr>
            <td><font color="red">*</font>
                <asp:Label ID="lblFieldId" runat="server" Text="欄位代號"
                    meta:resourcekey="lblFieldIdResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtFieldId" runat="server" Width="98px" meta:resourcekey="txtFieldIdResource1"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldId" runat="server" ControlToValidate="txtFieldId"
                    Display="Dynamic" ErrorMessage="請輸入欄位代號" meta:resourcekey="RequiredFieldValidatorFieldIdResource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidatorFieldId" runat="server" Display="Dynamic"
                    ErrorMessage="同一表單版本的欄位代號不得重複" meta:resourcekey="CustomValidatorFieldIdResource1"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFieldId"
                    Display="Dynamic" ErrorMessage="輸入內容只允許英文或數字" ValidationExpression="\w*" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator></td>
            <td><font color="red">*</font>
                <asp:Label ID="lblFieldName" runat="server" Text="欄位名稱"
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
                <telerik:RadNumericTextBox ID="RadNumericTextBox1" runat="server" MaxLength="3" DataType="System.Int32" NumberFormat-DecimalDigits="0"
                    MaxValue="999" MinValue="0" Width="40px" meta:resourcekey="RadNumericTextBox1Resource1">
                </telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFieldDefault" runat="server" Text="預設值" meta:resourcekey="lblFieldDefaultResource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:CheckBox ID="cbxAllowMoidfyDefaultValue" runat="server" Text="允許修改預設值" meta:resourcekey="cbxAllowMoidfyDefaultValueResource1" Checked="True" />
                <uc1:UC_HtmlEditor runat="server" ID="RadEditor1" Width="600px" ModuleName="WKF" EnableInsertFiles="false" EnableInsertImage="true" EnableInsertDMS="false" EnableInsertEmotions="false" EnableInsertCusImage="false" />
            </td>
        </tr>


        <tr>
            <td>
                <asp:Label ID="lblDispalyFieldName" runat="server" Text="欄位顯示" meta:resourcekey="lblDispalyFieldNameResource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbxDisplayFieldName" runat="server" Text="顯示欄位名稱" Checked="True" meta:resourcekey="cbxDisplayFieldNameResource1" />
            </td>
            <td style="width: 50px">
                <asp:Label ID="lblControlContent" runat="server" Text="內容控制" meta:resourcekey="lblControlContentResource1"></asp:Label>
            </td>
            <td>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:Label ID="lblDisplayWidth" runat="server" Text="顯示寬度:" meta:resourcekey="lblDisplayWidthResource1"></asp:Label>

                            <telerik:RadNumericTextBox Width="50px" ID="rnumDisplayWidth" NumberFormat-DecimalDigits="0" MinValue="0" runat="server" DataType="System.Int32" MaxLength="4" Value="0" ClientEvents-OnValueChanging="CheckNullorEmpty" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rnumDisplayWidthResource1"></telerik:RadNumericTextBox>
                            <asp:Label ID="lblWidthPX" runat="server" Font-Bold="True" Text="PX" meta:resourcekey="lblWidthPXResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDisplayHeight" runat="server" Text="顯示高度:" meta:resourcekey="lblDisplayHeightResource1"></asp:Label>
                            <telerik:RadNumericTextBox Width="50px" ID="rnumDisplayHeight" NumberFormat-DecimalDigits="0" DataType="System.Int32" MinValue="0" runat="server" MaxLength="4" Value="0" ClientEvents-OnValueChanging="CheckNullorEmpty" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rnumDisplayHeightResource1">
                            </telerik:RadNumericTextBox>
                            <asp:Label ID="lblHeightPX" runat="server" Font-Bold="True" Text="PX" meta:resourcekey="lblHeightPXResource1"></asp:Label>
                            <br />
                            <asp:Label ID="lblRemindMinValue" runat="server" CssClass="SizeMemo" Text="註：建議最小寬高為600x400，或設0由系統自行調整。" meta:resourcekey="lblRemindMinValueResource1"></asp:Label>
                        </td>
                    </tr>
                </table>
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
                <uc4:UC_ModifySel ID="UC_ModifySel1" runat="server" />
            </td>
        </tr>
        <tr id="GrideDetail">
            <td>
                <asp:Label ID="lblDisplayLength" runat="server" Text="顯示寬度" meta:resourcekey="lblDisplayLengthRecource1"></asp:Label></td>
            <td colspan="3">
                <telerik:RadNumericTextBox ID="WebNumericViewLength" runat="server" MaxLength="4" NumberFormat-DecimalDigits="0"
                    MinValue="0" Width="40px" DataType="System.Int32" Value="0" meta:resourcekey="WebNumericViewLengthResource1">
                </telerik:RadNumericTextBox>

                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial"
                    Text="px" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:Label ID="lblDisplayLengthNotify" runat="server" Text="註：表單顯示的限制長度，或設0由系統自行調整" meta:resourcekey="lblDisplayLengthNotifyRecource1" CssClass="SizeMemo"></asp:Label></td>
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

