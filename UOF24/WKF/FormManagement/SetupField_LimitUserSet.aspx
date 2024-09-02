<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupField_LimitUserSet" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="SetupField_LimitUserSet.aspx.cs" %>

<%@ Register Src="UC_FiledDropList.ascx" TagName="UC_FiledDropList" TagPrefix="uc3" %>
<%@ Register Src="UC_FieldControl.ascx" TagName="UC_FieldControl" TagPrefix="uc2" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="UC_ModifySel.ascx" TagName="UC_ModifySel" TagPrefix="uc4" %>
<%@ Register Src="~/WKF/Common/UC_LimitChoice.ascx" TagPrefix="uc5" TagName="UC_LimitChoice" %>
<%@ Register Src="~/WKF/FormManagement/UC_VisibleControl.ascx" TagPrefix="uc1" TagName="UC_VisibleControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script>
        Sys.Application.add_load(function () {
            OnExcludeApplicantClick();
        });

        function OnExcludeApplicantClick() {
            var cbExcludeApplicant = $("#<%=cbExcludeApplicant.ClientID%>");
            var cbxApplicant = $("#<%=cbxApplicant.ClientID%>");

            cbxApplicant.prop("disabled", cbExcludeApplicant[0].checked);
            if (cbExcludeApplicant[0].checked)
                cbxApplicant[0].checked = false;

        }

        function onOtherUserClick() {
            if ($('#<%= cbxOther.ClientID %>').prop("checked")) {
                $('#<%=Panel1.ClientID %>').show();
            }
            else {
                $('#<%=Panel1.ClientID %>').hide();
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
        <tr>
            <td align="center" class="PopTableHeader" colspan="4">
                <center>
                <asp:Label ID="lblSpecialField" runat="server" Text="人員組織" meta:resourcekey="lblSpecialFieldResource1"></asp:Label>
                </center>
            </td>
        </tr>
        <tr>
            <td><font color="red">*</font>
                <asp:Label ID="lblFieldId" runat="server" Text="欄位代號"
                    meta:resourcekey="lblFieldIdResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtFieldId" runat="server" Width="98px" meta:resourcekey="txtFieldIdResource1"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidatorFieldId" runat="server" ControlToValidate="txtFieldId"
                    Display="Dynamic" ErrorMessage="請輸入欄位代號" meta:resourcekey="RequiredFieldValidatorFieldIdResource1"></asp:RequiredFieldValidator><asp:CustomValidator
                        ID="CustomValidatorFieldId" runat="server" Display="Dynamic" ErrorMessage="同一表單版本的欄位代號不得重複"
                        meta:resourcekey="CustomValidatorFieldIdResource1"></asp:CustomValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFieldId"
                    Display="Dynamic" ErrorMessage="輸入內容只允許英文或數字" ValidationExpression="\w*" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator></td>
            <td><font color="red">*</font>
                <asp:Label ID="lblFieldName" runat="server" Text="欄位名稱"
                    meta:resourcekey="lblFieldNameResource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtFieldName" runat="server" Width="200px" meta:resourcekey="txtFieldNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldName" runat="server" ControlToValidate="txtFieldName"
                    Display="Dynamic" ErrorMessage="請輸入欄位名稱" meta:resourcekey="RequiredFieldValidatorFieldNameResource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFieldType" runat="server" Text="欄位格式" meta:resourcekey="lblFieldTypeResource1"></asp:Label></td>
            <td>
                <uc3:UC_FiledDropList ID="UC_FiledDropList1" runat="server" />
                <asp:CustomValidator ID="CustomValidatorModifyFieldType" runat="server"
                    Display="Dynamic" meta:resourcekey="CustomValidatorModifyFieldTypeResource1"></asp:CustomValidator>
            </td>
            <td>
                <asp:Label ID="lblFieldSeq" runat="server" Text="欄位順序" meta:resourcekey="lblFieldSeqResource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblSeq" runat="server" meta:resourcekey="lblSeqResource1"></asp:Label>
                <telerik:RadNumericTextBox ID="RadNumericTextBoxSeq" runat="server" MaxLength="3" MaxValue="999"
                    MinValue="0" Width="40px" Culture="zh-TW" DbValueFactor="1" LabelWidth="16px" meta:resourcekey="RadNumericTextBoxSeqResource1">
                </telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDispalyFieldName" runat="server" Text="欄位顯示"
                    meta:resourcekey="lblDispalyFieldNameResource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:CheckBox ID="cbxDisplayFieldName" runat="server" Text="顯示欄位名稱"
                    Checked="True" meta:resourcekey="cbxDisplayFieldNameResource1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="人員範圍限制"
                    meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td colspan="3">

                <uc5:UC_LimitChoice ID="UC_LimitChoice1" IsSetupField="true" runat="server" />
                <asp:CustomValidator ID="cvLimitChoiceErrorMsg" runat="server"
                    ErrorMessage="請選擇限定人員" Visible="False" meta:resourcekey="cvLimitChoiceErrorMsgResource1"></asp:CustomValidator>
                <hr style="display: block; height: 1px; border-top: 1px solid black; margin-top: 6px; margin-bottom: 3px" />
                        <asp:CheckBox ID="cbExcludeApplicant" Text="不允許選擇申請者" runat="server" onclick="OnExcludeApplicantClick()"
                    meta:resourcekey="cbExcludeApplicantResource1" />
                 
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="預設值" meta:resourcekey="Label4Resource2"></asp:Label>
            </td>
            <td>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:CheckBox ID="cbxApplicant" Text="申請者" runat="server" meta:resourcekey="cbxApplicantResource1" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox ID="cbxOther" Text="特定人員" runat="server" onClick="onOtherUserClick()" meta:resourcekey="cbxOtherResource1" />
                            <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1">
                                <uc1:UC_ChoiceList ID="ucOtherUser" runat="server" />
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: left; background-color: white" colspan="2">
                <asp:CheckBox ID="cbxAllowMoidfyDefaultValue" Text="允許修改預設值" runat="server" Checked="True" meta:resourcekey="cbxAllowMoidfyDefaultValueResource1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFieldControl" runat="server" meta:resourcekey="lblFieldControlResource1"
                    Text="欄位控制"></asp:Label></td>
            <td colspan="3">
                <uc2:UC_FieldControl ID="UC_FieldControl1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_FieldModify" runat="server" Text="修改權限" meta:resourcekey="lbl_FieldModifyRecource1"></asp:Label>
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
                    MaxValue="1000" MinValue="0" NullText="0" Width="40px" DataType="System.Int16" Culture="zh-TW" DbValueFactor="1" LabelWidth="16px" meta:resourcekey="RadNumericViewLengthResource1">
                    <NumberFormat ZeroPattern="n" AllowRounding="False"></NumberFormat>

                </telerik:RadNumericTextBox>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial"
                    Text="px" meta:resourcekey="Label2Resource1"></asp:Label>
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
            <td style="height: 26px">
                <asp:Label ID="Label1" runat="server" Text="欄位備註" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td style="height: 26px" colspan="3">
                <asp:TextBox ID="txtFieldRemark" runat="server" Width="90%" meta:resourcekey="txtFieldRemarkResource1"></asp:TextBox></td>
        </tr>
    </table>
    <asp:Label ID="lblFieldModify" runat="server" Text="是否可修改" Visible="False" meta:resourcekey="lblFieldModifyResource1"></asp:Label>
    <asp:RadioButtonList ID="rblFieldModify" runat="server" RepeatDirection="Horizontal"
        Visible="False" meta:resourcekey="rblFieldModifyResource1">
        <asp:ListItem Selected="True" Value="1" meta:resourcekey="ListItemResource21">是</asp:ListItem>
        <asp:ListItem Value="0" meta:resourcekey="ListItemResource22">否</asp:ListItem>
    </asp:RadioButtonList>
    <asp:HiddenField ID="hiddenFieldId" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="hfxml" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="hflimitType" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="hfIsWithUserDept" runat="server"></asp:HiddenField>
</asp:Content>

