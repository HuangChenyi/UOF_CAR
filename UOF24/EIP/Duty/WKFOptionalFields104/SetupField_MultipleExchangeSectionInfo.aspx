<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.SetupField_MultipleExchangeSectionInfo" Title="" Culture="auto" UICulture="auto" CodeBehind="SetupField_MultipleExchangeSectionInfo.aspx.cs" meta:resourcekey="PageResource1"%>

<%@ Register Src="~/WKF/FormManagement/UC_FiledDropList.ascx" TagName="UC_FiledDropList" TagPrefix="uc3" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register src="~/WKF/FormManagement/UC_ModifySel.ascx" tagname="UC_ModifySel" tagprefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript">
    function <%=JavaScriptFuncName%>() { 
        if ($('#<%=rbNoRange.ClientID%>').is(":checked") == false) {
            $('#<%=pnlHasRange.ClientID  %>').show();
        }
        else {
            $('#<%=pnlHasRange.ClientID  %>').hide();
        }    
    }
</script>
<table width="100%" class="PopTable" cellspacing="1">
    <tr>
        <td align="center" class="PopTableHeader" colspan="4">
            <div style=" text-align:center;">
                <asp:Label ID="lblSingleLine" runat="server" Text="調班資訊(多人)" meta:resourcekey="lblSingleLineResource1"></asp:Label>
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
                <asp:CheckBox ID="cbxDisplayFieldName" runat="server" Text="顯示欄位名稱" 
                    Checked="True" meta:resourcekey="cbxDisplayFieldNameResource1"/>
            </td>
        </tr>
    <tr>
        <td><asp:Label ID="lbl_FieldModify" runat="server" Text="修改權限" meta:resourcekey="lbl_FieldModifyResource1"></asp:Label></td>
        <td colspan="3"><uc4:UC_ModifySel ID="UC_ModifySel1" runat="server" /></td>
    </tr>
    <tr id="GrideDetail">
        <td><asp:Label ID="lblDisplayLength" runat="server" Text="顯示寬度" meta:resourcekey="lblDisplayLengthRecource1"></asp:Label></td>
        <td colspan="3">
            <telerik:RadNumericTextBox ID="rdNumericViewLength" runat="server" MaxLength="5" MaxValue="1000" MinValue="0" Width="40px" DataType="System.Int32" Value="0" Culture="zh-TW" DbValueFactor="1" LabelWidth="16px" meta:resourcekey="rdNumericViewLengthResource1"></telerik:RadNumericTextBox>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="px" meta:resourcekey="Label2Resource1"></asp:Label>
            <asp:Label ID="lblDisplayLengthNotify" runat="server" Text="(表單顯示的限制長度，設零由系統自行調整)" meta:resourcekey="lblDisplayLengthNotifyRecource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td nowrap>
            <asp:Label ID="Label3" runat="server" Text="調班人員範圍限制" meta:resourcekey="Label3Resource1"></asp:Label>
        </td>
        <td  colspan="3">
            <asp:RadioButton ID="rbNoRange" runat="server" Text="不限定" Checked="True" GroupName="UserChooseRange" meta:resourcekey="rbNoRangeResource1"/>
            <br />
            <asp:RadioButton ID="rbHasRange" runat="server" Text="與申請者同部門人員" GroupName="UserChooseRange" meta:resourcekey="rbHasRangeResource1"/>
            <asp:Panel ID="pnlHasRange" runat="server" style="padding-left: 15px;" meta:resourcekey="pnlHasRangeResource1">
                <asp:CheckBox ID="cbIncludeSubDep" runat="server" Text="包含子部門" meta:resourcekey="cbIncludeSubDepResource1"/>
                <br />
                <asp:Label ID="Label4" runat="server" Text="例外人員(可選擇到所有人員)" meta:resourcekey="Label4Resource1"></asp:Label>
                <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" ChioceType="All" ShowEmployee="true" ShowMember="false" DefaultTab="Employee"/>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="事由欄位" meta:resourcekey="Label1Resource1"></asp:Label>
        </td>
        <td colspan="3">
            <asp:CheckBox ID="cbRemarkRequired" runat="server" Text="申請者必填" Checked="True" meta:resourcekey="cbRemarkRequiredResource1"/>
        </td>
    </tr>
    <tr>
        <td><asp:Label ID="lblFieldRemark" runat="server" Text="欄位備註" meta:resourcekey="lblFieldRemarkResource1"></asp:Label></td>
        <td colspan="3"><asp:TextBox ID="txtFieldRemark" runat="server" Width="90%" meta:resourcekey="txtFieldRemarkResource1"></asp:TextBox></td>
    </tr>
</table>
    <asp:HiddenField ID="hiddenFieldId" runat="server" />
</asp:Content>

