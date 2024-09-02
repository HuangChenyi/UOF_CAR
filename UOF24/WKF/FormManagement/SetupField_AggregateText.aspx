<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupField_AggregateText"
    Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="SetupField_AggregateText.aspx.cs" %>

<%@ Register Src="UC_FiledDropList.ascx" TagName="UC_FiledDropList" TagPrefix="uc1" %>
<%@ Register Src="~/WKF/FormManagement/UC_VisibleControl.ascx" TagPrefix="uc1" TagName="UC_VisibleControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript">

        function ValidateFormula(sender, args) {

            if ($('#<%=lblAggregateFiled.ClientID %>').text() == '') {

                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }

    </script>

    <table cellspacing="1" class="PopTable" width="100%">
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
                <asp:Label ID="lblCalculateText" runat="server" meta:resourcekey="lblCalculateTextResource1"
                    Text="加總平均欄位"></asp:Label></center>
            </td>
        </tr>
        <tr>
            <td><font color="red"><span style="color: red">*</span></font>
                <asp:Label ID="lblFieldId"
                    runat="server" meta:resourcekey="lblFieldIdResource1" Text="欄位代號"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtFieldId" runat="server" meta:resourcekey="txtFieldIdResource1"
                    Width="100px"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldId" runat="server" ControlToValidate="txtFieldId"
                    Display="Dynamic" ErrorMessage="請輸入欄位代號" meta:resourcekey="RequiredFieldValidatorFieldIdResource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidatorFieldId" runat="server" Display="Dynamic"
                    ErrorMessage="同一表單版本的欄位代號不得重複" meta:resourcekey="CustomValidatorFieldIdResource1"></asp:CustomValidator></td>
            <td><font color="red">*</font>
                <asp:Label ID="lblFieldName" runat="server" meta:resourcekey="lblFieldNameResource1"
                    Text="欄位名稱"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtFieldName" runat="server" meta:resourcekey="txtFieldNameResource1"
                    Width="200px"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldName" runat="server" ControlToValidate="txtFieldName"
                    Display="Dynamic" ErrorMessage="請輸入欄位名稱" meta:resourcekey="RequiredFieldValidatorFieldNameResource1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFieldType" runat="server" meta:resourcekey="lblFieldTypeResource1"
                    Text="欄位格式"></asp:Label></td>
            <td>
                <uc1:UC_FiledDropList ID="UC_FiledDropList1" runat="server" />
                <asp:CustomValidator ID="CustomValidatorModifyFieldType" runat="server" Display="Dynamic" meta:resourcekey="CustomValidatorModifyFieldTypeResource1"></asp:CustomValidator></td>
            <td>
                <asp:Label ID="lblFieldSeq" runat="server" meta:resourcekey="lblFieldSeqResource1"
                    Text="欄位順序"></asp:Label></td>
            <td>
                <asp:Label ID="lblSeq" runat="server" meta:resourcekey="lblSeqResource1"></asp:Label>
                <telerik:RadNumericTextBox ID="RadNumericTextBoxSeq" runat="server" MaxLength="3" MaxValue="999"
                    MinValue="0" Width="40px">
                </telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <span style="color: #ff0000">*</span><asp:Label ID="Label2" runat="server" Text="小數點顯示位數" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td colspan="3">
                <telerik:RadNumericTextBox ID="RadNumericTextBoxDecimalPoint" runat="server"
                    MaxLength="1" MaxValue="8" MinValue="0" Width="40px">
                    <NumberFormat ZeroPattern="n" AllowRounding="False"></NumberFormat>
                </telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td><font color="red">*</font>
                <asp:Label ID="lblCalculateformula" runat="server"
                    meta:resourcekey="lblCalculateformulaResource1" Text="加總公式"></asp:Label></td>
            <td colspan="3">&nbsp;<asp:RadioButton ID="rbSum" runat="server" Checked="True" GroupName="Forumal"
                Text="加總 ( SUM )" meta:resourcekey="rbSumResource1" />
                <asp:RadioButton ID="rbAvg" runat="server" GroupName="Forumal" Text="平均 ( AVG )" meta:resourcekey="rbAvgResource1" />&nbsp;
                <asp:Label ID="lblAggregateFiled" runat="server" ForeColor="Blue" Font-Bold="False" Font-Size="Medium" meta:resourcekey="lblAggregateFiledResource1"></asp:Label>
                <asp:CustomValidator ID="CustomValidatorAggField" runat="server" ClientValidationFunction="ValidateFormula"
                    Display="Dynamic" ErrorMessage="請選取欄位" meta:resourcekey="CustomValidatorAggFieldResource1"></asp:CustomValidator>
                <telerik:RadButton ID="WebImageButton1" runat="server" CausesValidation="False"
                    meta:resourcekey="WebImageButton1Resource1" OnClick="WebImageButton1_Click1" Text="加總欄位">
                </telerik:RadButton>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDispalyFieldName" runat="server" Text="欄位顯示" meta:resourcekey="lblDispalyFieldNameResource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:CheckBox ID="cbxDisplayFieldName" runat="server" Tesxt="顯示欄位名稱" Checked="true" meta:resourcekey="cbxDisplayFieldNameResource1" />
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

        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFieldRemark" runat="server" meta:resourcekey="lblFieldRemarkResource1"
                    Text="欄位備註"></asp:Label></td>
            <td colspan="3">
                <asp:TextBox ID="txtFieldRemark" runat="server" meta:resourcekey="txtFieldRemarkResource1"
                    Width="98%"></asp:TextBox></td>
        </tr>
    </table>
    <div align="right">
        <br />
        <asp:Label ID="Label1" runat="server" Text="註：此欄位只適用於明細子欄位資料之統計" meta:resourcekey="Label1Resource1"></asp:Label>&nbsp;
    </div>
    <asp:HiddenField ID="hiddenFieldId" runat="server" />
    <asp:HiddenField ID="hiddenAggGridFieldId" runat="server" />
    <asp:HiddenField ID="hiddenAggFieldId" runat="server" />
</asp:Content>
