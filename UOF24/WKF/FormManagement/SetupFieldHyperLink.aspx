<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupFieldHyperLink" Title="設定欄位選項值" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupFieldHyperLink.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%" class="PopTable" cellspacing="1">
    <colgroup class="PopTableLeftTD"></colgroup>
    <colgroup class="PopTableRightTD"></colgroup>
    <tr>
       <td nowrap>
           <font color="red">*</font><asp:Label ID="lblURLName" runat="server" Text="請輸入顯示文字" meta:resourcekey="lblURLNameResource1"></asp:Label></td>
       <td>
           <asp:TextBox ID="txtURLName" runat="server" Width="280px" meta:resourcekey="txtURLNameResource1"></asp:TextBox><br />
           <asp:RequiredFieldValidator ID="RequiredFieldValidatorLinkText" runat="server" ErrorMessage="連結文字不允許空白" ControlToValidate="txtURLName" meta:resourcekey="RequiredFieldValidatorLinkTextResource1"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
       <td style="height: 21px">
           <font color="red">*</font><asp:Label ID="lblURL" runat="server" Text="請輸入連結" meta:resourcekey="lblURLResource1"></asp:Label></td>
       <td style="height: 21px">
           <asp:TextBox ID="txtURL" runat="server" Width="280px" meta:resourcekey="txtURLResource1"></asp:TextBox><br />
           <asp:RequiredFieldValidator ID="RequiredFieldValidatorLinkUrl" runat="server" ErrorMessage="連結網址不允許空白" meta:resourcekey="RequiredFieldValidatorLinkUrlResource1" EnableClientScript="False" ControlToValidate="txtURL"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtURL"
               ErrorMessage="輸入網址格式錯誤" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?" Display="Dynamic" Enabled="False"></asp:RegularExpressionValidator></td>
    </tr>
</table>
    <asp:Label ID="lblReturnTxt" runat="server" Text="返回" Visible="False" ></asp:Label>

</asp:Content>

