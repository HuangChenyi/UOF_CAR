<%@ Page Title="新增/維護幣別" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Currency_CurrencyEdit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="CurrencyEdit.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1" ForeColor="Red"></asp:CustomValidator>
<table  class="PopTable">
<tr>
    <td style="width:100px; white-space:nowrap;" class="PopTableLeftTD">
     <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label3Resource1"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="代碼" meta:resourcekey="Label1Resource1"></asp:Label></td>
    <td class="PopTableRightTD">
        <asp:TextBox ID="txtCurID" runat="server"  MaxLength="50" meta:resourcekey="txtCurIDResource1"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ControlToValidate="txtCurID" Display="Dynamic" ErrorMessage="請輸入幣別代碼" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>          
    </td>
</tr>   
<tr>
    <td style="width:100px; white-space:nowrap;" class="PopTableLeftTD"> 
        <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label4Resource1"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="幣別名稱" meta:resourcekey="Label2Resource1"></asp:Label></td>
    <td class="PopTableRightTD">
        <asp:TextBox ID="txtCurName" runat="server" MaxLength="100" meta:resourcekey="txtCurNameResource1"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ControlToValidate="txtCurName" Display="Dynamic" ErrorMessage="請輸入幣別名稱" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
    <td style="width:100px; white-space:nowrap;" class="PopTableLeftTD"> 
        <asp:Label ID="Label6" runat="server" Text="啟用否" meta:resourcekey="Label6Resource1"></asp:Label>
    </td>    
    <td class="PopTableRightTD">
        <asp:CheckBox ID="chkActive" runat="server" meta:resourcekey="chkActiveResource1"></asp:CheckBox>
    </td>
</tr>
<tr>
    <td style="width:100px; white-space:nowrap;" class="PopTableLeftTD"> 
        <asp:Label ID="Label5" runat="server" Text="本幣" meta:resourcekey="Label5Resource1"></asp:Label>
    </td>    
    <td class="PopTableRightTD">
        <asp:CheckBox ID="chkBase" runat="server" meta:resourcekey="chkBaseResource1"></asp:CheckBox>
    </td>
</tr>
</table>
<asp:Label ID="lblExist" runat="server" Visible="False" Text="幣別代碼已存在" meta:resourcekey="lblExistResource1"></asp:Label>
<asp:Label ID="lblBaseExist" runat="server" Visible="False" Text="系統已存在本幣" meta:resourcekey="lblBaseExistResource1"></asp:Label>
<asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

