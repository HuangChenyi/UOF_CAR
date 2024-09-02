<%@ Page Language="C#" AutoEventWireup="true" Inherits="Help_LeftTree" Codebehind="LeftTree.aspx.cs" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>
<html>
    <head runat="server">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <title>HELP</title>
        <style>
            body {
                background-color: #d9e4e6;
                margin:0;
            }
            A:link {
                COLOR: #4A76B8; font-size:12px; TEXT-DECORATION: none
            }
            A:visited {
                COLOR: #4A76B8; font-size:12px;  TEXT-DECORATION: none
            }
            A:hover {
                COLOR: #FF0000; font-size:12px;  TEXT-DECORATION: underline
            }
        </style>
    </head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <telerik:RadTreeView ID="RadTreeView1"  runat="server"  DataSourceID="XmlDataSource1" 
                            onnodedatabound="RadTreeView1_NodeDataBound" 
                            ondatabound="RadTreeView1_DataBound" >
        <DataBindings>
            <telerik:RadTreeNodeBinding  DataMember="node"  ValueField="id" Target="helpContent"  NavigateUrlField="url"  TextField="title" />
        </DataBindings>
    </telerik:RadTreeView>
                    <asp:XmlDataSource ID="XmlDataSource1" runat="server" XPath="/Nodes/node"></asp:XmlDataSource>
               
    </form>
</body>
</html>
