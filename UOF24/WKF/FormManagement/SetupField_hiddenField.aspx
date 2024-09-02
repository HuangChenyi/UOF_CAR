<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupField_hiddenField" Title="" Codebehind="SetupField_hiddenField.aspx.cs" %>


<%@ Register Src="UC_FiledDropList.ascx" TagName="UC_FiledDropList" TagPrefix="uc3" %>

<%@ Register Src="UC_FieldControl.ascx" TagName="UC_FieldControl" TagPrefix="uc2" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
                <asp:Label ID="lblhiddenLine" runat="server" Text="隱藏欄位" meta:resourcekey="lblSingleLineResource1"></asp:Label>
                </center>
                </td>
        </tr>
        <tr>
            <td style="height: 26px"><font color="red">*</font><asp:Label ID="lblFieldId" runat="server"
                Text="欄位代號" meta:resourcekey="lblFieldIdResource1"></asp:Label></td>
            <td style="height: 26px">
                <asp:TextBox ID="txtFieldId" runat="server" Width="98px" meta:resourcekey="txtFieldIdResource1"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFieldId"
                    Display="Dynamic" ErrorMessage="輸入內容只允許英文或數字" ValidationExpression="\w*" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldId" runat="server" ErrorMessage="請輸入欄位代號"
                    ControlToValidate="txtFieldId" Display="Dynamic" meta:resourcekey="RequiredFieldValidatorFieldIdResource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidatorFieldId" runat="server" ErrorMessage="同一表單版本的欄位代號不得重複"
                    Display="Dynamic" meta:resourcekey="CustomValidatorFieldIdResource1"></asp:CustomValidator></td>
            <td style="height: 26px"><font color="red">*</font><asp:Label ID="lblFieldName" runat="server"
                Text="欄位名稱" meta:resourcekey="lblFieldNameResource1"></asp:Label></td>
            <td style="height: 26px">
                <asp:TextBox ID="txtFieldName" runat="server" Width="200px" meta:resourcekey="txtFieldNameResource1"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFieldName" runat="server" ErrorMessage="請輸入欄位名稱"
                    ControlToValidate="txtFieldName" Display="Dynamic" meta:resourcekey="RequiredFieldValidatorFieldNameResource1"></asp:RequiredFieldValidator></td>
        </tr>
       <tr>
            <td>
                <asp:Label ID="lblFieldType" runat="server" Text="欄位格式" meta:resourcekey="lblFieldTypeResource1"></asp:Label></td>
            <td>
                <uc3:UC_FiledDropList ID="UC_FiledDropList1" runat="server" />
                <%--<asp:Label ID="lblHiddenField" runat="server" Text="隱藏欄位" meta:resourcekey="lblSingleLineResource1"></asp:Label>--%>
                <asp:CustomValidator ID="CustomValidatorModifyFieldType" runat="server" Display="Dynamic" meta:resourcekey="CustomValidatorModifyFieldTypeResource1"></asp:CustomValidator></td>
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
                <asp:Label ID="lblFieldRemark" runat="server" Text="欄位備註" meta:resourcekey="lblFieldRemarkResource1"></asp:Label></td>
            <td colspan="3">
                <asp:TextBox ID="txtFieldRemark" runat="server" Width="90%" meta:resourcekey="txtFieldRemarkResource1"></asp:TextBox></td>
        </tr>
       
    </table>
    <asp:HiddenField ID="hiddenFieldId" runat="server" />
</asp:Content>

