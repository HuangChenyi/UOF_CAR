<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupField_NumberText" Title="新增欄位" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupField_NumberText.aspx.cs" %>

<%@ Register Src="UC_FiledDropList.ascx" TagName="UC_FiledDropList" TagPrefix="uc3" %>
<%@ Register Src="UC_FieldControl.ascx" TagName="UC_FieldControl" TagPrefix="uc2" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="UC_ModifySel.ascx" TagName="UC_ModifySel" TagPrefix="uc4" %>
<%@ Register Src="~/WKF/FormManagement/UC_VisibleControl.ascx" TagPrefix="uc1" TagName="UC_VisibleControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">

        function chkexternalDataCheck_CheckedChanged() {

            if ($("#<%=this.chkexternalDataCheck.ClientID%>").prop("checked")) {
            $("#<%=this.pnlexternalData.ClientID%>").show();
        }
        else {
            $("#<%=this.pnlexternalData.ClientID%>").hide();
        }
    }

    function chkAuth_CheckedChanged() {


        if ($("#<%=this.chkAuth.ClientID%>").prop("checked")) {
            $("#<%=this.Panel1.ClientID%>").show();
        }
        else {
            $("#<%=this.Panel1.ClientID%>").hide();
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
        <colgroup class="PopTableLeftTD"></colgroup>
        <colgroup class="PopTableRightTD"></colgroup>
        <colgroup class="PopTableLeftTD"></colgroup>
        <colgroup class="PopTableRightTD"></colgroup>
        <tr>
            <td align="center" class="PopTableHeader" colspan="4">
                <center>
                    <asp:Label ID="lblNumber" runat="server" Text="數值欄位" meta:resourcekey="lblNumberResource1"></asp:Label>

                    <asp:CustomValidator ID="CustomValidatorModifyFieldType" runat="server" Display="Dynamic" meta:resourcekey="CustomValidatorModifyFieldTypeResource1"></asp:CustomValidator>
                </center>
            </td>
        </tr>
        <tr>
            <td>
                <font color="red">*</font><asp:Label ID="lblFieldId" runat="server" Text="欄位代號" meta:resourcekey="lblFieldIdResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtFieldId" runat="server" Width="98px" meta:resourcekey="txtFieldIdResource1"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldId" runat="server" ControlToValidate="txtFieldId"
                    Display="Dynamic" ErrorMessage="請輸入欄位代號" meta:resourcekey="RequiredFieldValidatorFieldIdResource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidatorFieldId" runat="server" Display="Dynamic"
                    ErrorMessage="同一表單版本的欄位代號不得重複" meta:resourcekey="CustomValidatorFieldIdResource1"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFieldId"
                    Display="Dynamic" ErrorMessage="輸入內容只允許英文或數字" ValidationExpression="\w*" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator></td>
            <td>
                <font color="red">*</font><asp:Label ID="lblFieldName" runat="server" Text="欄位名稱" meta:resourcekey="lblFieldNameResource1"></asp:Label></td>
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
            </td>
            <td>
                <asp:Label ID="lblFieldSeq" runat="server" Text="欄位順序" meta:resourcekey="lblFieldSeqResource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblSeq" runat="server" meta:resourcekey="lblSeqResource1"></asp:Label>
                <telerik:RadNumericTextBox ID="RadNumericTextBoxSeq" runat="server" MaxLength="3" MaxValue="999"
                    MinValue="0" Width="40px">
                </telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <font color="red">*</font><asp:Label ID="lblFieldLength" runat="server" Text="欄位範圍" meta:resourcekey="lblFieldLengthResource1"></asp:Label></td>
            <td colspan="3">
                <telerik:RadNumericTextBox ID="RadNumericLengthMin" runat="server" Width="160px">
<NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="2"></NumberFormat>
                </telerik:RadNumericTextBox>
                &nbsp;~&nbsp;
           <telerik:RadNumericTextBox ID="RadNumericLengthMax" runat="server" Width="160px">
               <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="2"></NumberFormat>
           </telerik:RadNumericTextBox>
                &nbsp; &nbsp;&nbsp;
           <asp:Label ID="lblFieldLengthDesc" runat="server" Text="可輸入正負數值，範例：-2～99" ForeColor="Blue" meta:resourcekey="lblFieldLengthDescResource1"></asp:Label><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLengthMax" runat="server" ControlToValidate="RadNumericLengthMax"
                    Display="Dynamic" ErrorMessage="請輸入最大欄位長度" meta:resourcekey="RequiredFieldValidatorLengthMaxResource1"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLengthMin" runat="server" ControlToValidate="RadNumericLengthMin"
                    Display="Dynamic" ErrorMessage="請輸入最小欄位長度" meta:resourcekey="RequiredFieldValidatorLengthMinResource1"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="RadNumericLengthMin"
                    ControlToValidate="RadNumericLengthMax" ErrorMessage="請最小欄位長度不可大於最大欄位長度" Operator="GreaterThan"
                    Type="Double" Display="Dynamic" meta:resourcekey="CompareValidator1Resource1"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td>
               <asp:Label ID="Label1" runat="server" ForeColor="Black" meta:resourcekey="Label1Resource1"
                    Text="小數點顯示位數" ></asp:Label></td>
            <td colspan="3">

                <telerik:RadNumericTextBox ID="WebNumericEditDecimalPoint" runat="server"
                    MaxLength="1" MaxValue="8" MinValue="0" Width="40px">
<NumberFormat ZeroPattern="n" AllowRounding="False"></NumberFormat>
                </telerik:RadNumericTextBox>

          
                <asp:CheckBox ID="cbxEnabledDecimalPoint" runat="server" Text="啟用小數點顯示位數" AutoPostBack="true" OnCheckedChanged="cbxEnabledDecimalPoint_CheckedChanged"
                 meta:resourcekey="cbxEnabledDecimalPointResource1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFieldDefault" runat="server" Text="預設值" meta:resourcekey="lblFieldDefaultResource1"></asp:Label></td>
            <td colspan="3">
                <telerik:RadNumericTextBox ID="RadNumericTextBoxDefault" runat="server" MinValue="0" Width="160px">
                    <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="2"></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:CheckBox ID="cbxAllowMoidfyDefaultValue" runat="server" Text="允許修改預設值" meta:resourcekey="cbxAllowMoidfyDefaultValueResource1" Checked="True" />
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="RadNumericLengthMin"
                    ControlToValidate="RadNumericTextBoxDefault" Display="Dynamic" ErrorMessage="預設值不可小於最小值"
                    Operator="GreaterThanEqual" Type="Double" meta:resourcekey="CompareValidator2Resource1"></asp:CompareValidator>
                <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToCompare="RadNumericLengthMax"
                    ControlToValidate="RadNumericTextBoxDefault" Display="Dynamic" ErrorMessage="預設值不可大於最大值"
                    Operator="LessThanEqual" Type="Double" meta:resourcekey="CompareValidator3Resource1"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDispalyFieldName" runat="server" Text="欄位顯示" meta:resourcekey="lblDispalyFieldNameResource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:CheckBox ID="cbxDisplayFieldName" runat="server" Text="顯示欄位名稱" Checked="true" meta:resourcekey="cbxDisplayFieldNameResource1" />
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
                <asp:Label ID="lbl_FieldModify" runat="server" Text="修改權限" meta:resourcekey="lbl_FieldModifyResource1"></asp:Label>
            </td>
            <td colspan="3">
                <uc4:UC_ModifySel ID="UC_ModifySel1" runat="server" />
            </td>
        </tr>
        <tr id="GrideDetail">
            <td>
                <asp:Label ID="lblDisplayLength" runat="server" Text="顯示寬度" meta:resourcekey="lblDisplayLengthRecource1"></asp:Label></td>
            <td colspan="3">
                <telerik:RadNumericTextBox ID="RadNumericViewLength" runat="server" maxlength="5"
                    maxvalue="1000" width="40px" DataType="System.Int16" NullText="0">
<NegativeStyle Resize="None"></NegativeStyle>

<NumberFormat ZeroPattern="n" AllowRounding="False"></NumberFormat>

<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="px" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:Label ID="lblDisplayLengthNotify" runat="server" Text="(表單顯示的限制長度，設零由系統自行調整)" meta:resourcekey="lblDisplayLengthNotifyRecource1"></asp:Label></td>
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
                <asp:TextBox ID="txtFieldRemark" runat="server" Width="90%" meta:resourcekey="txtFieldRemarkResource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblexternalData" runat="server" Text="外部資料" meta:resourcekey="lblexternalDataResource1"></asp:Label></td>
            <td colspan="3">
                <asp:CheckBox ID="chkexternalDataCheck" runat="server" meta:resourcekey="chkexternalDataCheckResource1" Text="使用外部資料來源" onclick="chkexternalDataCheck_CheckedChanged()" /><br />
                <asp:Panel ID="pnlexternalData" runat="server" Width="100%" meta:resourcekey="pnlexternalDataResource1">
                    <table border="0" cellpadding="1" cellspacing="1" style="width: 100%">
                        <tr>
                            <td style="width: 132px" nowrap>
                                <asp:Label ID="lblwsURL" runat="server" Text="WebService URL:" Width="100%" meta:resourcekey="lblwsURLResource1"></asp:Label></td>
                            <td colspan="5">
                                <asp:TextBox ID="txtwsURL" runat="server" Width="300px" meta:resourcekey="txtwsURLResource1"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="width: 132px" nowrap>
                                <asp:Label ID="lblwsMethod" runat="server" Text="WebService Method:" Width="100%" meta:resourcekey="lblwsMethodResource1"></asp:Label></td>
                            <td colspan="5">
                                <asp:TextBox ID="txtwsMethod" runat="server" Width="100px" meta:resourcekey="txtwsMethodResource1"></asp:TextBox>
                                <asp:Button ID="btnTestConn" runat="server" meta:resourcekey="btnTestConnResource1" Text="測試連線" OnClick="btnTestConn_Click" /></td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblAuth" runat="server" meta:resourcekey="lblAuthResource1" Text="是否需要驗證:"></asp:Label><asp:CheckBox ID="chkAuth" runat="server" onclick="chkAuth_CheckedChanged()" Text="是" meta:resourcekey="chkAuthResource1" /></td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Panel ID="Panel1" runat="server" Width="100%" Style="display: none" meta:resourcekey="Panel1Resource1">
                                    <table border="0" style="width: 100%">
                                        <tr>
                                            <td colspan="6">
                                                <asp:Label ID="lblwsAccount" runat="server" meta:resourcekey="lblwsAccountResource1" Text="WebService帳號:"></asp:Label><asp:TextBox ID="txtwsAccount" runat="server" meta:resourcekey="txtwsAccountResource1"></asp:TextBox><br />
                                                <asp:Label ID="lblwsPassword" runat="server" meta:resourcekey="lblwsPasswordResource1" Text="WebService密碼:"></asp:Label><asp:TextBox ID="txtwsPassword" runat="server" meta:resourcekey="txtwsPasswordResource1"></asp:TextBox></td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:CheckBox ID="chkgetBeforeTime" runat="server" meta:resourcekey="chkgetBeforeTimeResource1" Text="是否表單填寫前先取得資料 (如不勾選，使用者需點選取得資料才可取得)" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:CheckBox ID="chkVariation" runat="server" meta:resourcekey="chkVariationResource1" Text="欄位內容是否需每個站點更新 (如果勾選，每次簽核時，會再次取得內容)" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblHasSumAvgFieldMsg" runat="server" Text="此欄位被表單設定為加總平均欄位,無法更改欄位格式!!" Visible="False" meta:resourcekey="lblHasSumAvgFieldMsgResource1" ForeColor="Red"></asp:Label>
    <asp:HiddenField ID="hiddenFieldId" runat="server" />
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

