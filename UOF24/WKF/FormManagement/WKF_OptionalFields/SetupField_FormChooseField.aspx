<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SetupField_FormChooseField.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.WKF_OptionalFields.SetupField_FormChooseField" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/WKF/FormManagement/UC_FieldControl.ascx" TagName="UC_FieldControl" TagPrefix="uc2" %>
<%@ Register Src="~/WKF/FormManagement/UC_FiledDropList.ascx" TagName="UC_FiledDropList" TagPrefix="uc3" %>
<%@ Register src="~/WKF/FormManagement/UC_ModifySel.ascx" tagname="UC_ModifySel" tagprefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            HideShowDDL();
        });

        function HideShowDDL() {
            var radioButton = $('#<%=rbAllForm.ClientID%>');
            if (radioButton.prop("checked")) {
                $('#<%=ddlFormCategory.ClientID%>').hide();
                $('#<%=ddlFormList.ClientID%>').hide();
            }
            else {
                $('#<%=ddlFormCategory.ClientID%>').show();
                $('#<%=ddlFormList.ClientID%>').show();
            }
        }

        function CheckValidationChooseForm_<%=cvChooseForm.ClientID%>(sender, args) {

            var isValid = true;

            if ($("#<%=rbSpecForm.ClientID%>").is(":checked") && $("#<%=ddlFormList.ClientID%>").val() === '0')
                isValid = false;

            if (isValid === false) $("#<%=hlFocusChooseForm.ClientID%>").focus();

            args.IsValid = isValid;
        }

        function CheckValidationAllowChooseUserForm_<%=cvAllowChooseUserForm.ClientID%>(sender, args) {

            var isValid = false;

            if ($("#<%=panelAllowChooseUserForm.ClientID%>").length > 0) {

                $.each($("#<%=panelAllowChooseUserForm.ClientID%>")[0].childNodes, function (i, control) {
                    if (control.type === "checkbox" && control.checked) {
                        isValid = true;
                    }
                })
            }
            if (isValid === false) $("#<%=hlFocusAllowChooseUserForm.ClientID%>").focus();

            args.IsValid = isValid;
        }
        
    </script>

    <table width="100%" class="PopTable" cellspacing="1">
    <colgroup class="PopTableLeftTD"></colgroup>
    <colgroup class="PopTableRightTD"></colgroup>
    <colgroup class="PopTableLeftTD"></colgroup>
    <colgroup class="PopTableRightTD">	</colgroup>
    <tr>
        <td class="PopTableHeader" colspan="4">
        <center>
            <asp:Label ID="lblFormChooseField" runat="server" Text="表單參考欄位" meta:resourcekey="lblFormChooseFieldResource1"></asp:Label>
        </center>
        </td>
    </tr>
    <tr>
        <td style="height: 26px"><font color="red">*</font><asp:Label ID="lblFieldId" runat="server" Text="欄位代號" meta:resourcekey="lblFieldIdResource1"></asp:Label></td>
        <td style="height: 26px">
            <asp:TextBox ID="txtFieldId" runat="server" Width="98px" meta:resourcekey="txtFieldIdResource1"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFieldId" Display="Dynamic" ErrorMessage="輸入內容只允許英文或數字" ValidationExpression="\w*" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldId" runat="server" ErrorMessage="請輸入欄位代號" ControlToValidate="txtFieldId" Display="Dynamic" meta:resourcekey="RequiredFieldValidatorFieldIdResource1"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidatorFieldId" runat="server" ErrorMessage="同一表單版本的欄位代號不得重複" Display="Dynamic" meta:resourcekey="CustomValidatorFieldIdResource1"></asp:CustomValidator>
        </td>
        <td style="height: 26px"><font color="red">*</font><asp:Label ID="lblFieldName" runat="server" Text="欄位名稱" meta:resourcekey="lblFieldNameResource1"></asp:Label></td>
        <td style="height: 26px">
            <asp:TextBox ID="txtFieldName" runat="server" Width="200px" meta:resourcekey="txtFieldNameResource1"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldName" runat="server" ErrorMessage="請輸入欄位名稱" ControlToValidate="txtFieldName" Display="Dynamic" meta:resourcekey="RequiredFieldValidatorFieldNameResource1"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td><asp:Label ID="lblFieldType" runat="server" Text="欄位格式" meta:resourcekey="lblFieldTypeResource1"></asp:Label></td>
        <td><uc3:UC_FiledDropList ID="UC_FiledDropList1" runat="server" /><asp:CustomValidator ID="CustomValidatorModifyFieldType" runat="server" Display="Dynamic" meta:resourcekey="CustomValidatorModifyFieldTypeResource1"></asp:CustomValidator></td>
        <td>	<asp:Label ID="lblFieldSeq" runat="server" Text="欄位順序" meta:resourcekey="lblFieldSeqResource1"></asp:Label></td>
        <td>	<asp:Label ID="lblSeq" runat="server" meta:resourcekey="lblSeqResource1"></asp:Label>
            <telerik:RadNumericTextBox ID="RadNumericTextBoxSeq" runat="server" MaxLength="3" MaxValue="999"
                    MinValue="0" Width="40px" meta:resourcekey="RadNumericTextBoxSeqResource1"></telerik:RadNumericTextBox></td>
    </tr>
     
    <tr>
        <td>
            <asp:Label ID="lblDispalyFieldName" runat="server" Text="欄位顯示" meta:resourcekey="lblDispalyFieldNameResource1"></asp:Label>
        </td>
        <td colspan=3>
            <asp:CheckBox ID="cbxDisplayFieldName" runat="server" Text="顯示欄位名稱" Checked="true" meta:resourcekey="cbxDisplayFieldNameResource1"/>
        </td>
    </tr>
    <tr id="GrideDetail">
        <td><asp:Label ID="lblDisplayLength" runat="server" Text="顯示寬度" meta:resourcekey="lblDisplayLengthRecource1"></asp:Label></td>
        <td colspan="3">
                       <telerik:RadNumericTextBox ID="RadNumericViewLength" runat="server" MaxLength="5"
                MaxValue="1000" MinValue="0" NullText="0" Width="40px" meta:resourcekey="RadNumericViewLengthResource1"></telerik:RadNumericTextBox>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="px" meta:resourcekey="Label2Resource1"></asp:Label>
            <asp:Label ID="lblDisplayLengthNotify" runat="server" Text="(表單顯示的限制長度，設零由系統自行調整)" meta:resourcekey="lblDisplayLengthNotifyRecource1"></asp:Label>
        </td>
    </tr>
        <tr>
            <td>
                <asp:Label ID="lblFormChooseLimit" runat="server" Text="可參考表單" meta:resourcekey="lblFormChooseLimitResource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <div style="line-height: 27.5px;">
                            <asp:Label id="lblFormRange" runat="server" Text="表單範圍" meta:resourcekey="lblFormRangeResource1"></asp:Label>
                            <br />
                            &nbsp;&nbsp;&nbsp;
                            <asp:RadioButton ID="rbAllForm" runat="server" Text="全部表單" Checked="True" GroupName="FormLimit" onclick="HideShowDDL()" meta:resourcekey="rbAllFormResource1"/>
                            &nbsp;&nbsp;&nbsp;
                            <br />
                            &nbsp;&nbsp;&nbsp;
                            <asp:HyperLink ID="hlFocusChooseForm" NavigateUrl="#" runat="server" />
                            <asp:RadioButton ID="rbSpecForm" runat="server" Text="特定表單" GroupName="FormLimit" onclick="HideShowDDL()" meta:resourcekey="rbSpecFormResource1"/>            
                            <asp:DropDownList ID="ddlFormCategory" OnSelectedIndexChanged="ddlFormCategory_SelectedIndexChanged" AutoPostBack="true" runat="server" style="display:none" meta:resourcekey="ddlFormCategoryResource1"></asp:DropDownList>
                            <asp:DropDownList ID="ddlFormList" runat="server" style="display:none" meta:resourcekey="ddlFormListResource1"></asp:DropDownList>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Customvalidator id="cvFormCategoryNotExist" runat="server" Display="Dynamic" Visible="false" ErrorMessage="表單已不存在，請重新設定" ForeColor="Red" meta:resourcekey="cvFormCategoryNotExist" ></asp:Customvalidator>
                            <asp:CustomValidator ID="cvChooseForm" runat="server" Text="請選擇表單" ForeColor="Red" meta:resourcekey="lblChooseFormTipResource1"></asp:CustomValidator>
                            <br />
                            <asp:Label ID="lblAllowChooseUserForm" runat="server" Text="允許參考與下列人員相關的表單" meta:resourcekey="lblAllowChooseUserFormResource1"></asp:Label>
                            <br />
                            <asp:Panel ID="panelAllowChooseUserForm" runat="server">
                                &nbsp;&nbsp;&nbsp;&nbsp
                                <asp:CheckBox ID="cbSigner" Text="簽核者" Value="Signer" runat="server" meta:resourcekey="cbSignerResource1" />
                                <asp:CheckBox ID="cbFiller" Text="填寫者" Value="Filler" runat="server" meta:resourcekey="cbFillerResource1" />
                                <asp:CheckBox ID="cbApplicant" Text="申請者" Value="Applicant" runat="server" meta:resourcekey="cbApplicantResource1" />
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:CustomValidator ID="cvAllowChooseUserForm" runat="server" Text="請選擇參考人員" ForeColor="Red" meta:resourcekey="cvAllowChooseUserFormResource1"></asp:CustomValidator>
                                <asp:HyperLink ID="hlFocusAllowChooseUserForm" NavigateUrl="#" runat="server" />
                            </asp:Panel>
                            <asp:CheckBox ID="cbFormApprove" runat="server" Text="只允許選擇已核准的表單" meta:resourcekey="cbFormApproveResource1"/>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
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
                <uc4:UC_ModifySel ID="UC_ModifySel1" runat="server"/>
            </td>
        </tr>
    <tr>
        <td><asp:Label ID="lblFieldRemark" runat="server" Text="欄位備註" meta:resourcekey="lblFieldRemarkResource1"></asp:Label></td>
        <td colspan="3"><asp:TextBox ID="txtFieldRemark" runat="server" Width="90%" meta:resourcekey="txtFieldRemarkResource1"></asp:TextBox></td>
    </tr>
</table>
    <asp:Label ID="lblChooseCategoryTip" Text="請選擇類別" runat="server" style="display:none;" meta:resourcekey="lblChooseCategoryTipResource1"></asp:Label>
    <asp:Label ID="lblChooseFormTip" Text="請選擇表單" runat="server" style="display:none;" meta:resourcekey="lblChooseFormTipResource1"></asp:Label>
    <asp:HiddenField ID="hiddenFieldId" runat="server" />
    <asp:HiddenField ID="hfFormLimitId" runat="server" />

</asp:Content>
