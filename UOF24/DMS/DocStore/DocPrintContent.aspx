<%@ Page Language="C#" AutoEventWireup="true" Inherits="DMS_DocStore_DocPrintContent" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="DocPrintContent.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<head runat="server">
</head>
<body>
    <script type="text/javascript">
    window.onload = printPage;
    function printPage() {
        window.print();
        //window.close();
    }
    </script>
    <style type="text/css">
        div.JustAddBorder table tr td {
            border-width: 1px;
            border-style: solid;
        }
    </style>
    <form id="form1" >
    <div style=" vertical-align:top;">
    <table  width="100%"  style=" height:768px; vertical-align:top; ">
        <tr valign="top" style=" height:100%; vertical-align:top; " >
            <td valign="top" style=" height:100%; vertical-align:top; ">
                <div class="editorcontentstyle JustAddBorder" style="overflow: auto; width: 100%; height: 100%">
                    <asp:Label ID="lblContent" runat="server" meta:resourcekey="lblContentResource1" ></asp:Label>
                </div>
            </td>
        </tr>
    </table>
    </div>        
    </form>
</body>
