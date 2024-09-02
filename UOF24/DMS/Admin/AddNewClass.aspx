<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_Admin_AddNewClass" Title="新增類別" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AddNewClass.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/jscript">
    function AddClass(className, classID)
    {                 
      var callerWindowObj = dialogArguments;          
      callerWindowObj.nodeAddClass(className,classID);
      
    }
</script>
<center>
    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="新增類別失敗" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator><br/>
<table border=1 width=450 cellpadding=0 cellspacing=0>
<tr><td align=right style="width: 86px">
    <asp:Label ID="Label1" runat="server" Text="父類別：" meta:resourcekey="Label1Resource1"></asp:Label></td><td >
    &nbsp;<asp:Label ID="lblParentClass" runat="server" ></asp:Label></td></tr>
<tr><td align=right style="width: 86px">
    <asp:Label ID="Label2" runat="server" Text="類別名稱：" meta:resourcekey="Label2Resource1"></asp:Label></td><td >
    &nbsp;<asp:TextBox ID="txtClassName" runat="server" MaxLength="50"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtClassName"
            Display="Dynamic" ErrorMessage="請輸入類別名稱" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="類別名稱已存在" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator></td></tr>
<tr><td style="height: 42px" align="right">
    <asp:Label ID="Label3" runat="server" Text="備註：" meta:resourcekey="Label3Resource1"></asp:Label></td><td style="height: 42px">
    <asp:TextBox ID="txtMemo" runat="server" Height="139px" TextMode="MultiLine" Width="358px"></asp:TextBox></td></tr>
</table>
</center>

</asp:Content>

