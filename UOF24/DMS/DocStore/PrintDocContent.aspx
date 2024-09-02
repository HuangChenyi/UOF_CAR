<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintDocContent.aspx.cs" Inherits="Ede.Uof.Web.DMS.DocStore.PrintDocContent" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <title></title>    
    <link href="../../Common/Style/telerik.css" rel="stylesheet" />
    <link href="../../Common/Style/uof-fixed.css" rel="stylesheet" />
    <link href="../../Common/Style/cssReset.css" rel="stylesheet" />     
</head>
<body style="background-color:#FFFFFF;">
    <form id="form1" runat="server">
        <script type="text/javascript">
            window.onload = function () {               
                setTimeout(function () { window.print(); window.close(); }, 500);
            }            
        </script>
        <style>
            span.JustAddBorder table tr td {
                border-width: 1px;
                border-style: solid;
            }

            thead {
              font-size: 12px;
              color: #000;
              text-align: left;
              opacity: 0.7;
            }

            tfoot {
              font-size: 12px;
              color: #000;
              text-align: left;
              opacity: 0.7;
            }

            @media print {
                .print-content {
                    page-break-after: always;
                }

                thead {
                    position: fixed;
                    top: 0;
                    opacity: 0.7;
                    display: table-header-group;
                }
             
                tfoot {
                    height: 20px;
                    position: fixed;
                    bottom: 0;
                    opacity: 0.7;
                    display: table-footer-group; 
                }
            }
        </style>
        <p></p>
        <div style="width: 100%">
            <table class="print-container">
                <thead>
                    <tr>
                        <td>
                            <%=docserial%><%=manualversion%>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <asp:Label ID="lblDocContent" runat="server" class="editorcontentstyle JustAddBorder" Width="100%"
                                        Style="word-break: break-all; word-wrap: break-word;display:table; -ms-word-break:break-all"  
                                       meta:resourcekey="lblDocContentResource1">
                            </asp:Label>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td>
                            <%=printuser%>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </form>

    <asp:Label ID="lblDocSerial" runat="server" Text="文件編號：" Visible="False" meta:resourcekey="lblDocSerialResource1"></asp:Label>
    <asp:Label ID="lblManualVersion" runat="server" Text="版本：" Visible="False" meta:resourcekey="lblManualVersionResource1"></asp:Label>
    <asp:Label ID="lblPrintUser" runat="server" Text="列印者：" Visible="False" meta:resourcekey="lblPrintUserResource1"></asp:Label>
</body>
</html>
