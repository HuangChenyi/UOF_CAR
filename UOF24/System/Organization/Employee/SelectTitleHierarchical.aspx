<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_SelectTitleHierarchical" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SelectTitleHierarchical.aspx.cs" %>
<%@ Register src="../../../Common/Organization/Hierarchical_Department.ascx" tagname="Hierarchical_Department" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="0" cellpadding="0" cellspacing="1" width="100%" height="100%" class="PoPTable">
        <tr>
            <td width="30%" bgcolor="#e1eeee">
                <asp:Label ID="Label1" runat="server" Text="部門" meta:resourcekey="Label1Resource1" ></asp:Label></td>
            <td width="35%"  bgcolor="#e1eeee">
                <asp:Label ID="Label2" runat="server" Text="職級" meta:resourcekey="Label2Resource1" ></asp:Label></td>
            <td width="35%"  bgcolor="#e1eeee">
                <asp:Label ID="Label3" runat="server" Text="職務" meta:resourcekey="Label3Resource1" ></asp:Label></td>
        </tr>
        <tr>
            <td width="30%" valign="top" height="100%" bgcolor="white">

                <uc1:Hierarchical_Department ID="Hierarchical_Department1" runat="server" DisplayActiveControl="true"/>

            </td>
            <td width="35%" valign="top" height="100%"  bgcolor="white">
                <asp:RadioButtonList ID="rdoTitle" runat="server" meta:resourcekey="rdoTitleResource1">
                </asp:RadioButtonList></td>
            <td width="35%" valign="top" height="100%"  bgcolor="white">
                <asp:CheckBoxList ID="chkFunc" runat="server" meta:resourcekey="chkFuncResource1">
                </asp:CheckBoxList></td>
        </tr>
    </table>
</asp:Content>

