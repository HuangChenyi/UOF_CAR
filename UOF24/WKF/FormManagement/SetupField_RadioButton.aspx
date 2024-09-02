<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupField_RadioButton" Title="新增欄位" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="SetupField_RadioButton.aspx.cs" %>
<%@ Register Src="UC_FiledDropList.ascx" TagName="UC_FiledDropList" TagPrefix="uc3" %>
<%@ Register Src="UC_FieldControl.ascx" TagName="UC_FieldControl" TagPrefix="uc2" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="UC_ModifySel.ascx" TagName="UC_ModifySel" TagPrefix="uc4" %>
<%@ Register Src="~/WKF/FormManagement/UC_VisibleControl.ascx" TagPrefix="uc1" TagName="UC_VisibleControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest"></telerik:RadAjaxManager>
    <script type="text/javascript">
        // =============== 清空 RadioButton  ===============
        function CleanRadioBtnDefault() {
            var aryInput = $('#ctl00_ContentPlaceHolder1_RadioButtonList1 input[type="radio"]');

            for (var i = 0; i < aryInput.length; i++) {

                $(aryInput[i]).prop("checked", false);

            }

            return false;
        }

        function OnBlur(sender, args) {
            //B4482 取消AutoPostBack改用RadAjaxManager
            var rblLength = $find("<%=RadNumericTextBoxLength.ClientID%>").get_value();
            var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "SettingClick", "Value": rblLength }));
        }

        function checkListLegal(sender, args) {
            var aryInput = $('#ctl00_ContentPlaceHolder1_RadioButtonList1 input[type="radio"]');
            for (var i = 0; i < aryInput.length; i++) {

                if ($(aryInput[i]).val() == "others") {
                    args.IsValid = false;
                    return;
                }
            }
            args.IsValid = true;
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
           <asp:Label ID="lblRadioButton" runat="server" Text="單選鈕" meta:resourcekey="lblRadioButtonResource1"></asp:Label>
           </center>
            </td>
        </tr>
        <tr>
            <td>
                <font color="red">*</font>
                <asp:Label ID="lblFieldId" runat="server" Text="欄位代號" meta:resourcekey="lblFieldIdResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtFieldId" runat="server" Width="98px" meta:resourcekey="txtFieldIdResource1"></asp:TextBox>
                <br />
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
                <uc3:UC_FiledDropList ID="UC_FiledDropList1" runat="server" />
                <asp:CustomValidator ID="CustomValidatorModifyFieldType" runat="server" Display="Dynamic"></asp:CustomValidator></td>
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
                <font color="red">*</font>
                <asp:Label ID="lblFieldLength" runat="server" Text="單行顯示欄位個數" meta:resourcekey="lblFieldLengthResource1"></asp:Label></td>
            <td>
                <telerik:RadNumericTextBox ID="RadNumericTextBoxLength" runat="server" MaxLength="3"
                    MaxValue="999" MinValue="0" Width="40px" ClientEvents-OnBlur="OnBlur">
                    <NumberFormat ZeroPattern="n" AllowRounding="False"></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="lblFieldLengthDesc" runat="server" Text="(個)" meta:resourcekey="lblFieldLengthDescResource1"></asp:Label><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLength" runat="server" ControlToValidate="RadNumericTextBoxLength"
                    Display="Dynamic" ErrorMessage="請輸入欄位長度" meta:resourcekey="RequiredFieldValidatorLengthResource1"></asp:RequiredFieldValidator></td>
            <td>
                <asp:Label ID="lblFieldModify" runat="server" Text="允許修改預設值" meta:resourcekey="lblFieldModifyResource1"></asp:Label></td>
            <td>
                <asp:RadioButtonList ID="rblFieldModify" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rblFieldModifyResource1">
                    <asp:ListItem Selected="True" Value="1" meta:resourcekey="ListItemResource21">是</asp:ListItem>
                    <asp:ListItem Value="0" meta:resourcekey="ListItemResource22">否</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td><span style="color: #ff0000">*</span><asp:Label ID="lblItemList" runat="server" Text="欄位選項" meta:resourcekey="lblItemListResource1"></asp:Label></td>
            <td colspan="3">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <telerik:RadButton ID="WebImageButton1" runat="server" OnClick="WebImageButton1_Click1"
                                Text="設定" CausesValidation="False" meta:resourcekey="WebImageButton1Resource1">
                            </telerik:RadButton>
                            &nbsp;&nbsp;
           <asp:Label ID="lblItemListDesc" runat="server" Text="(點選即為預設值)" meta:resourcekey="lblItemListDescResource1"></asp:Label>
                            &nbsp;&nbsp;
                        <asp:LinkButton ID="linkBtnCleanDefault" runat="server" meta:resourcekey="linkBtnCleanDefaultResource1">清空預設值</asp:LinkButton></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanelRBL" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatColumns="6" RepeatDirection="Horizontal" meta:resourcekey="RadioButtonList1Resource1">
                                    </asp:RadioButtonList>
                                    <asp:CustomValidator ID="cvListlegal" runat="server" ClientValidationFunction="checkListLegal" Display="Dynamic"
                                         ErrorMessage="others為保留字，請勿使用"  meta:resourcekey="cvListlegalResource1"></asp:CustomValidator>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br />
                            <asp:CheckBox ID="cbAllowOthers" runat="server" Text="啟用其他選項" meta:resourcekey="cbAllowOthersResource1" />
                        </td>
                        <td></td>
                    </tr>
                </table>
                <asp:CustomValidator ID="CustomValidatorRb" runat="server" ErrorMessage="欄位選項不得為空" Display="Dynamic" meta:resourcekey="CustomValidatorRbResource1"></asp:CustomValidator>
                <asp:CustomValidator ID="CvRbOthersUsedInConditions" runat="server" ErrorMessage="此欄位已被設定為表單條件，不允許變更或刪除選項！" Display="Dynamic" meta:resourcekey="CvRbOthersUsedInConditionsResource1"></asp:CustomValidator>

            </td>
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
                <telerik:RadNumericTextBox ID="RadNumericViewLength" runat="server" MaxLength="5"
                    MaxValue="1000" MinValue="0" NullText="0" Width="40px" DataType="System.Int16">
                    <NumberFormat ZeroPattern="n" AllowRounding="False"></NumberFormat>
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="px"></asp:Label>
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
                <asp:TextBox ID="txtFieldRemark" runat="server" Width="90%" meta:resourcekey="txtFieldRemarkResource1"></asp:TextBox>&nbsp;</td>
        </tr>
    </table>
    <asp:Label ID="lblFieldSource" runat="server" Text="資料來源" Visible="False" meta:resourcekey="lblFieldSourceResource1"></asp:Label>
    <asp:RadioButton ID="rbAptoticField" runat="server" Checked="True" Text="固定欄位選項" Visible="False" meta:resourcekey="rbAptoticFieldResource1" /><br />
    <asp:Label ID="lblSetup" runat="server" meta:resourcekey="lblSetupResource1" Text="設定"
        Visible="False"></asp:Label>
    <input type="hidden" id="HiddenFieldItemValue" runat="server" />
    <asp:HiddenField ID="hiddenFieldId" runat="server" />
    <asp:HiddenField id="hidFileName" runat="server"></asp:HiddenField>
    <asp:HiddenField id="hidTempPath" runat="server"></asp:HiddenField>
    <asp:Label ID="lblUsedInConditions" runat="server" Text="此欄位已被設定為表單條件，不允許變更或刪除選項！" Visible="False" ></asp:Label>
</asp:Content>

