<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormContent.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.FormContent" %>

<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" TagName="VersionFieldCollectionUsingUC" TagPrefix="uc1" %>
<%@ Register Src="../../WKF/FormUse/FormIQY/UC_QueryIqyTask.ascx" TagName="UC_QueryIqyTask" TagPrefix="uc2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style>
        .ul {
            border-bottom: 1px dotted silver;
        }

        .bigT {
            color: #ffffff;
            font-size: 25px;
            font-weight: bolder;
        }
    </style>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td id="formInfo" runat="server"></td>
                </tr>
                <tr>
                    <td>
                        <uc1:VersionFieldCollectionUsingUC ID="VersionFieldCollectionUsingUC1" runat="server" />
                    </td>
                </tr>
            </table>
            <br />
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </form>
</body>
</html>
