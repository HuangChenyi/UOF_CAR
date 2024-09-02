<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupField_CalculateText"
    Title="新增欄位" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupField_CalculateText.aspx.cs" %>

<%@ Register Src="UC_FiledDropList.ascx" TagName="UC_FiledDropList" TagPrefix="uc1" %>
<%@ Register Src="~/WKF/FormManagement/UC_VisibleControl.ascx" TagPrefix="uc1" TagName="UC_VisibleControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript">
    
        function ValidateFormula(sender, args)
        {
            if ( $('#<%=lblFormula.ClientID %>').text() == '')
            {
                args.IsValid = false;
                return;
            }
            else
            {           
                args.IsValid = true;
            }
       }
        
function GetFormula()
{
    return $('#<%=lblFormula.ClientID%>').text() + '@' + $('#<%=hiddenForumla.ClientID %>').val();
}
    </script>

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
                <asp:Label ID="lblCalculateText" runat="server" Text="表單計算欄位" meta:resourcekey="lblCalculateTextResource1"></asp:Label>
                <asp:CustomValidator ID="CustomValidatorModifyFieldType" runat="server" Display="Dynamic" meta:resourcekey="CustomValidatorModifyFieldTypeResource1"></asp:CustomValidator>
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
                    ErrorMessage="同一表單版本的欄位代號不得重複" meta:resourcekey="CustomValidatorFieldIdResource1"></asp:CustomValidator></td>
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
                <uc1:UC_FiledDropList ID="UC_FiledDropList1" runat="server" />
            </td>
            <td>
                <asp:Label ID="lblFieldSeq" runat="server" Text="欄位順序" meta:resourcekey="lblFieldSeqResource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblSeq" runat="server" meta:resourcekey="lblSeqResource1"></asp:Label>
                <telerik:RadNumericTextBox ID="RadNumericTextBoxSeq" runat="server" MaxLength="3" MaxValue="999"
                    MinValue="0" Width="40px"></telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span style="color: #ff0000">*<asp:Label ID="Label1" runat="server" ForeColor="Black"
                    Text="小數點顯示位數" meta:resourcekey="Label1Resource1"></asp:Label></span></td>
            <td colspan="3">
                <telerik:RadNumericTextBox ID="RadNumericTextBoxDecimalPoint" runat="server" MaxLength="1"
                    MaxValue="8" MinValue="0" Width="40px">
<NumberFormat ZeroPattern="n" AllowRounding="False"></NumberFormat>
                </telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td><font color="red">*</font><asp:Label ID="lblCalculateformula" runat="server"
                Text="計算欄位公式" meta:resourcekey="lblCalculateformulaResource1"></asp:Label></td>
            <td colspan="3">
                <asp:Label ID="lblFormula" runat="server" ForeColor="Blue" Font-Size="Medium" ></asp:Label>
                <asp:CustomValidator ID="CustomValidatorFormula" runat="server" ErrorMessage="請設定計算公式" ClientValidationFunction="ValidateFormula" Display="Dynamic" meta:resourcekey="CustomValidatorFormulaResource1"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidatorCycleRef" runat="server" Display="Dynamic"
                    ErrorMessage="計算欄位之間不允許循環參考" meta:resourcekey="CustomValidatorCycleRefResource1"></asp:CustomValidator>
                <telerik:RadButton ID="WebImageButton1" runat="server" Text="公式設定" OnClick="WebImageButton1_Click1"
                    CausesValidation="False" meta:resourcekey="WebImageButton1Resource1"></telerik:RadButton>
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
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="px"></asp:Label>
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
                <asp:Label ID="lblVisible" runat="server" Text="觀看權限控制" meta:resourcekey="lblVisibleResource1"></asp:Label>
            </td>
            <td colspan="3">
                <uc1:UC_VisibleControl runat="server" ID="UC_VisibleControl" IsFormula="true"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFieldRemark" runat="server" Text="欄位備註" meta:resourcekey="lblFieldRemarkResource1"></asp:Label></td>
            <td colspan="3">
                <asp:TextBox ID="txtFieldRemark" runat="server" meta:resourcekey="txtFieldRemarkResource1"
                    Width="98%"></asp:TextBox></td>
        </tr>
    </table>
    <asp:HiddenField ID="hiddenFieldId" runat="server" />
    <asp:HiddenField ID="hiddenForumla" runat="server" />

    <asp:Label ID="lblHasSumAvgFieldMsg" runat="server" Text="此欄位被表單設定為加總平均欄位,無法更改欄位格式!!" Visible="False" meta:resourcekey="lblHasSumAvgFieldMsgResource1" ForeColor="Red"></asp:Label>
</asp:Content>
