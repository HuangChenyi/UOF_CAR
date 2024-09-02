<%@ Page Language="C#" AutoEventWireup="true" Inherits="Common_HtmlEditor_ModifyImage" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ModifyImage.aspx.cs" %>
<html>
<head runat="server">
    <title>Modify Image Size</title>
</head>
<body scroll=no>
    <form id="form1" runat="server">
    
   <table cellpadding="2" cellspacing="2" border="0" align=center>
                <tr>
                    <td align="right">
                        Height:
                    </td>
                    <td>
                        <asp:TextBox ID="imageHeight" runat="server" size="5" maxlength="3"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Width:
                    </td>
                    <td>
                        <asp:TextBox ID="imageWidth" runat="server" size="5" maxlength="3"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="OK" OnClientClick="setImage();" />
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Cancel" OnClientClick="top.close();" />
                    </td>
                </tr>
            </table>
    <script>
        
        document.all['imageHeight'].value=  window.dialogArguments.height;
        document.all['imageWidth'].value=  window.dialogArguments.width;
        
        function setImage()
        {         
          window.dialogArguments.height=document.all['imageHeight'].value;
          window.dialogArguments.style.height=document.all['imageHeight'].value+"px";
          window.dialogArguments.width=document.all['imageWidth'].value;
          window.dialogArguments.style.width=document.all['imageWidth'].value+"px";
          top.close();
        }
    </script>
    </form>
</body>
</html>
