<%@ Page Language="C#" AutoEventWireup="true" Inherits="WKF_FormUse_WebServiceApplyForm" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="WebServiceApplyForm.aspx.cs" %>

<!DOCTYPE html>
<html>
    <head runat="server">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <meta name="referrer" content="no-referrer" />
        <title></title>
    </head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="表單申請" 
                meta:resourcekey="Button1Resource1" />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="402px" TextMode="MultiLine" 
                Width="900px" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
    
    </div>
    </form>
</body>
</html>
