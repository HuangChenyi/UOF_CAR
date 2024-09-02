<%@ Page Language="C#" AutoEventWireup="true" Inherits="WKF_FlowManagement_ListFlow" Culture="auto" Title="列出流程" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ListFlow.aspx.cs" %>


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
        &nbsp;&nbsp;
        <telerik:RadButton ID="RadButton1" runat="server" text="開窗J1" meta:resourcekey="WebImageButton1Resource1"></telerik:RadButton>
        <br />
        <asp:Label ID="lblOpenWindow" runat="server" meta:resourcekey="lblOpenWindowResource1"
            Text="開窗J1" Visible="False"></asp:Label></div>
    </form>
</body>
</html>
