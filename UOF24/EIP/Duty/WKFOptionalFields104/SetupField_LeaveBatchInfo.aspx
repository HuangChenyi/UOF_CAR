﻿<%@ Page Title="" Language="C#" Culture="auto" UICulture="auto" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SetupField_LeaveBatchInfo.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.SetupField_LeaveBatchInfo" meta:resourcekey="PageResource1" %>
<%@ Register Src="~/WKF/FormManagement/UC_FiledDropList.ascx" TagName="UC_FiledDropList" TagPrefix="uc3" %>
<%@ Register Src="~/WKF/FormManagement/UC_FieldControl.ascx" TagName="UC_FieldControl" TagPrefix="uc2" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register src="~/WKF/FormManagement/UC_ModifySel.ascx" tagname="UC_ModifySel" tagprefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript">
    function <%=JavaScriptFuncName%>() { 
        if ($('#<%=rbAgentApplicantDep.ClientID%>').is(":checked") == true) {
            $('#<%=pnlAgentHasRange.ClientID  %>').show();
            $('#<%=pnlAgentHasRangeEmpty.ClientID  %>').hide();
            $('#<%=pnlAgentDefault.ClientID  %>').hide();
            $('#<%=pnlAgentDefaultEmpty.ClientID  %>').show();
        }
        else if ($('#<%=rbAgentNoRange.ClientID%>').is(":checked") == true) {
            $('#<%=pnlAgentHasRange.ClientID  %>').hide();
            $('#<%=pnlAgentHasRangeEmpty.ClientID  %>').show();
            $('#<%=pnlAgentDefault.ClientID  %>').show();
            $('#<%=pnlAgentDefaultEmpty.ClientID  %>').hide();
        }
        else {
            $('#<%=pnlAgentHasRange.ClientID  %>').hide();
            $('#<%=pnlAgentHasRangeEmpty.ClientID  %>').show();
            $('#<%=pnlAgentDefault.ClientID  %>').hide();
            $('#<%=pnlAgentDefaultEmpty.ClientID  %>').show();
        }
    }
</script>
<table width="100%" class="PopTable" cellspacing="1">
    <tr>
        <td align="center" class="PopTableHeader" colspan="4">
            <div style=" text-align:center;">
                <asp:Label ID="lblSingleLine" runat="server" Text="請假資訊" meta:resourcekey="lblSingleLineResource1"></asp:Label>
            </div>           
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
                <telerik:RadNumericTextBox ID="rdNumericEditFieldSeq" runat="server" MaxLength="3" MaxValue="999" MinValue="0" Width="40px" DataType="System.Int32" Culture="zh-TW" DbValueFactor="1" LabelWidth="16px" meta:resourcekey="rdNumericEditFieldSeqResource1"></telerik:RadNumericTextBox>
        </td>
    </tr>
             <tr>
            <td>
                <asp:Label ID="lblDispalyFieldName" runat="server" Text="欄位顯示" meta:resourcekey="lblDispalyFieldNameResource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:CheckBox ID="cbxDisplayFieldName" runat="server" Text="顯示欄位名稱" Checked="True" meta:resourcekey="cbxDisplayFieldNameResource1" />
            </td>
        </tr>
    <tr style="display:none;">
        <td><asp:Label ID="lblFieldControl" runat="server" Text="欄位控制" meta:resourcekey="lblFieldControlResource1"></asp:Label></td>
        <td colspan="3"><uc2:UC_FieldControl ID="UC_FieldControl1" runat="server" /></td>
    </tr>
    <tr>
        <td><asp:Label ID="lbl_FieldModify" runat="server" Text="修改權限" meta:resourcekey="lbl_FieldModifyResource1"></asp:Label></td>
        <td colspan="3"><uc4:UC_ModifySel ID="UC_ModifySel1" runat="server" /></td>
    </tr>
    <tr>
        <td style="white-space:nowrap"><asp:Label ID="lblAgentField" runat="server" Text="職務代理人欄位" meta:resourcekey="lblAgentFieldResource1"></asp:Label></td>
        <td colspan="3">
            <asp:Label ID="lblAgentRange" runat="server" Text="可選人員範圍設定"  meta:resourcekey="lblAgentRangeResource1"></asp:Label>
            <br />

            <asp:Panel ID="pnlAgentRangeSetting" style="padding-left: 15px;" runat="server">
                <asp:RadioButton ID="rbAgentNoRange" runat="server" Text="不限定" Checked="True" GroupName="AgentChooseRange" meta:resourcekey="rbAgentNoRangeResource1"/>

                <asp:Panel ID="pnlAgentDefault" runat="server" style="padding-left: 15px;">
                    <asp:CheckBox ID="cbAgentDefault" Text="預設顯示申請者個人設定中的代理人" runat="server" meta:resourcekey="cbAgentDefaultResource1"/>
                </asp:Panel>
                <asp:Panel ID="pnlAgentDefaultEmpty" runat="server"></asp:Panel>

                <asp:RadioButton ID="rbAgentApplicantDep" runat="server" Text="與申請者同部門人員" GroupName="AgentChooseRange" meta:resourcekey="rbAgentApplicantDepResource1"/>

                <asp:Panel ID="pnlAgentHasRange" runat="server" style="padding-left: 15px;">
                    <asp:CheckBox ID="cbAgentIncludeSubDep" runat="server" Text="包含子部門" meta:resourcekey="cbAgentIncludeSubDepResource1"/>
                    <br />
                    <asp:Label ID="lblExceptionUser" runat="server" Text="例外人員(可選擇到所有人員)" meta:resourcekey="lblExceptionUserResource1"></asp:Label>
                    <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" ChioceType="All" ShowEmployee="true" ShowMember="false" DefaultTab="Employee"/>
                </asp:Panel>
                <asp:Panel ID="pnlAgentHasRangeEmpty" runat="server"></asp:Panel>

                <asp:RadioButton ID="rbAgentSetting" runat="server" Text="申請者個人設定中的代理人" GroupName="AgentChooseRange" meta:resourcekey="rbAgentSettingResource1"/>
            </asp:Panel>

            <asp:CheckBox ID="cbApplicantRequired" Text="申請者必填" runat="server" meta:resourcekey="cbApplicantRequiredResource1"/>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblRemarkValidControl" runat="server" Text="事由欄位" meta:resourcekey="lblRemarkValidControlResource1"></asp:Label>
        </td>
        <td colspan="3">
            <asp:CheckBox ID="cbRemarkRequired" runat="server" Text="申請者必填" Checked="True" meta:resourcekey="cbApplicantRequiredResource1"/>
        </td>
    </tr>
        <tr>
        <td>
            <asp:Label ID="lblFieldValidControl" runat="server" Text="欄位驗證" meta:resourcekey="lblFieldValidControlResource1"></asp:Label>
        </td>
        <td colspan="3">
            <asp:CheckBox ID="cbContinuity" runat="server" Text="每筆請假時間需有連續性" meta:resourcekey="cbContinuityResource1"/>
        </td>
    </tr>
    <tr id="GrideDetail" style="display:none;">
        <td><asp:Label ID="lblDisplayLength" runat="server" Text="顯示寬度" meta:resourcekey="lblDisplayLengthResource1"></asp:Label></td>
        <td colspan="3">
            <telerik:RadNumericTextBox ID="rdNumericViewLength" runat="server" MaxLength="5" MaxValue="1000" MinValue="0" Width="40px" DataType="System.Int32" Value="0" Culture="zh-TW" DbValueFactor="1" LabelWidth="16px" meta:resourcekey="rdNumericViewLengthResource1"></telerik:RadNumericTextBox>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="px" meta:resourcekey="Label2Resource1"></asp:Label>
            <asp:Label ID="lblDisplayLengthNotify" runat="server" Text="(表單顯示的限制長度，設零由系統自行調整)" meta:resourcekey="lblDisplayLengthNotifyResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td><asp:Label ID="lblFieldRemark" runat="server" Text="欄位備註" meta:resourcekey="lblFieldRemarkResource1"></asp:Label></td>
        <td colspan="3"><asp:TextBox ID="txtFieldRemark" runat="server" Width="90%" meta:resourcekey="txtFieldRemarkResource1"></asp:TextBox></td>
    </tr>
</table>
    <asp:HiddenField ID="hiddenFieldId" runat="server" />
</asp:Content>

