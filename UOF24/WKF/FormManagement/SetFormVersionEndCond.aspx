<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetFormVersionEndCond" Title="結案條件設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetFormVersionEndCond.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <script>
        function ResizeTree(X, Y) {
            var tree = $find("<%=RadTreeView1.ClientID %>");
            tree.get_element().style.height = Y - 35 + "px";
        }
    </script>
<table cellpadding=0 cellspacing=0 width= 100%>
<tr><td style="height: 29px" class="PopTableRightTD">
    <asp:RadioButton ID="rbYes" runat="server" Text="可結案" AutoPostBack="True" GroupName="EndCond" OnCheckedChanged="rbYes_CheckedChanged" meta:resourcekey="rbYesResource1" />
    <asp:RadioButton ID="rbNo" runat="server" Text="不可結案" AutoPostBack="True" GroupName="EndCond" OnCheckedChanged="rbNo_CheckedChanged" meta:resourcekey="rbNoResource1" Checked="True" />
    <asp:RadioButton ID="rbByCond" runat="server" Text="依條件" AutoPostBack="True" GroupName="EndCond" OnCheckedChanged="rbByCond_CheckedChanged" meta:resourcekey="rbByCondResource1" />
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請選擇結案條件" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    </td></tr>
<tr><td valign=top>
    <table border="1" cellpadding="0" cellspacing="0"  style="width:100%">
        <tr>
            <td class="PopTableRightTD" valign="top" style="border: 1;border-style: solid;border-color: #868581">
                    <telerik:RadTreeView ID="RadTreeView1" runat="server" Width="100%"></telerik:RadTreeView>
            </td>
        </tr>
    </table>

</td></tr>

</table>
</asp:Content>

