<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupField_HyperLink" Title="新增欄位" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupField_HyperLink.aspx.cs" %>
<%@ Register Src="UC_FiledDropList.ascx" TagName="UC_FiledDropList" TagPrefix="uc2" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register src="UC_ModifySel.ascx" tagname="UC_ModifySel" tagprefix="uc4" %>
<%@ Register src="UC_FieldControl.ascx" tagname="UC_FieldControl" tagprefix="uc3" %>
<%@ Register Src="~/WKF/FormManagement/UC_VisibleControl.ascx" TagPrefix="uc1" TagName="UC_VisibleControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<script type="text/javascript">        

    //20141107 解決B3963對話視窗寬高因為設定超連結預設值而消失的問題
    Sys.Application.add_load(function () {
        clientClick();
    });
    
    function clientClick() {
       
        if ($("input[id^='<% =rblLinkTarget.ClientID %>']:checked").val() == "Dialog") {
            $("#<%=DialogPanel.ClientID%>").show();
        }
        else {
            $("#<%=DialogPanel.ClientID%>").hide();
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
            <td align="center" class="PopTableHeader" colspan="4">
                 <center>
                <asp:Label ID="lblHyperLink" runat="server" Text="超連結" meta:resourcekey="lblHyperLinkResource1"></asp:Label>
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
            <td style="height: 26px">
                <asp:Label ID="lblFieldType" runat="server" Text="欄位格式" meta:resourcekey="lblFieldTypeResource1"></asp:Label></td>
            <td style="height: 26px">
                <uc2:UC_FiledDropList ID="UC_FiledDropList1" runat="server" />
                <asp:CustomValidator ID="CustomValidatorModifyFieldType" runat="server" Display="Dynamic" meta:resourcekey="CustomValidatorModifyFieldTypeResource1"></asp:CustomValidator></td>
            <td style="height: 26px">
                <asp:Label ID="lblFieldSeq" runat="server" Text="欄位順序" meta:resourcekey="lblFieldSeqResource1"></asp:Label></td>
            <td style="height: 26px">
                <asp:Label ID="lblSeq" runat="server" meta:resourcekey="lblSeqResource1"></asp:Label>
                      <telerik:RadNumericTextBox ID="RadNumericTextBoxSeq" runat="server" MaxLength="3" MaxValue="999"
                    MinValue="0" Width="40px"></telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td><span style="color: #ff0000"></span><asp:Label ID="lblFieldDefault" runat="server"
                Text="預設值" meta:resourcekey="lblFieldDefaultResource1"></asp:Label></td>
            <td>
                <telerik:RadButton ID="WebImageButton1" runat="server" Text="設定超連結" OnClick="WebImageButton1_Click1"
                    CausesValidation="False" meta:resourcekey="WebImageButton1Resource1"></telerik:RadButton>
                <br />
                <asp:HyperLink ID="hlDefaultLink" runat="server" Target="_blank" meta:resourcekey="hlDefaultLinkResource1" ForeColor="Blue"></asp:HyperLink>
                <asp:CheckBox ID="cbxAllowMoidfyDefaultValue" runat="server" meta:resourcekey="cbxAllowMoidfyDefaultValueResource1"
                    Text="允許修改預設值" /></td>
            <td>
                <asp:Label ID="lblLinkTarget" runat="server" Text="連結目標" meta:resourcekey="lblLinkTargetResource1"></asp:Label></td>
            <td>
                <asp:RadioButtonList ID="rblLinkTarget" runat="server" RepeatDirection="Horizontal"
                    meta:resourcekey="rblLinkTargetResource1" onclick="clientClick();">
                    <asp:ListItem Selected="True" Value="_blank" meta:resourcekey="ListItemResource21"
                        Text="新視窗"></asp:ListItem>
                    <asp:ListItem Value="_self" meta:resourcekey="ListItemResource22" Text="原視窗"></asp:ListItem>
                    <asp:ListItem Value="Dialog" meta:resourcekey="ListItemResource23" Text="對話視窗"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:Panel ID="DialogPanel" runat="server" Height="25px" Width="100%" meta:resourcekey="DialogPanelResource1" style="display:none" >
                    <asp:Label ID="dialogWidth" runat="server" Text="寬度:" meta:resourcekey="dialogWidthResource1"></asp:Label>
                    <telerik:RadNumericTextBox ID="RadNumericTextBox_dialogWidth" runat="server"
                        Width="35px" MinValue="0" Value="0">
                        <NumberFormat AllowRounding="False" ZeroPattern="n" />
                    </telerik:RadNumericTextBox>
                    <asp:Label ID="dialogHeight" runat="server" Text="高度:" meta:resourcekey="dialogHeightResource1"></asp:Label>
                    <telerik:RadNumericTextBox ID="RadNumericTextBox_dialogHeight" runat="server"
                        Width="35px" MinValue="0" Value="0">
                        <NumberFormat AllowRounding="False" ZeroPattern="n" />
                    </telerik:RadNumericTextBox>
                </asp:Panel>
            </td>
        </tr>
        <tr id="GrideDetail">
        <td>
            <asp:Label ID="lblDisplayLength" runat="server" Text="顯示寬度" meta:resourcekey="lblDisplayLengthRecource1"></asp:Label></td>
        <td colspan="3">
            <telerik:RadNumericTextBox ID="RadNumericViewLength" runat="server" MaxLength="5"
                MaxValue="1000" MinValue="0" NullText="0" Width="40px" DataType="System.Int16">
<NegativeStyle Resize="None"></NegativeStyle>

<NumberFormat ZeroPattern="n" AllowRounding="False"></NumberFormat>

            </telerik:RadNumericTextBox>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="px" meta:resourcekey="Label2Resource1"></asp:Label>
            <asp:Label ID="lblDisplayLengthNotify" runat="server" Text="(表單顯示的限制長度，設零由系統自行調整)" meta:resourcekey="lblDisplayLengthNotifyRecource1"></asp:Label></td>
    </tr>
            <tr>
            <td>
                <asp:Label ID="lblDispalyFieldName" runat="server" Text="欄位顯示" meta:resourcekey="lblDispalyFieldNameResource1"></asp:Label>
            </td>
            <td colspan=3>
                <asp:CheckBox ID="cbxDisplayFieldName" runat="server" Text="顯示欄位名稱" Checked=true meta:resourcekey="cbxDisplayFieldNameResource1"/>
            </td>
        </tr>
    <tr>
            <td>
                <asp:Label ID="lblFieldControl" runat="server" Text="欄位控制" meta:resourcekey="lblFieldControlResource1"></asp:Label></td>
            <td colspan="3"><uc3:UC_FieldControl ID="UC_FieldControl1" runat="server" />
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
    </table>
    <asp:Label ID="lblUserHyperlink" runat="server" meta:resourcekey="lblUserHyperlinkResource1"
        Text="設定超連結" Visible="False"></asp:Label>
    <asp:HiddenField ID="hiddenFieldId" runat="server" />
</asp:Content>
