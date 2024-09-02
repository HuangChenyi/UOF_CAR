<%@ Page Title="挑選部門" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master"
    AutoEventWireup="true" Inherits="WKF_FormUse_Superior_SelectDept"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SelectDept.aspx.cs" %>

<%@ Register Src="../../../Common/Organization/UC_DeptManagerTree.ascx" TagName="UC_DeptManagerTree"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%">
        <tr>
            <td>
                <telerik:RadToolBar ID="webToolBar" runat="server" Width="100%">
                    <Items>
                        <telerik:RadToolBarButton Value="SubDept" runat="server">
                            <ItemTemplate>
                                <asp:CheckBox ID="ckDept" runat="server" meta:resourcekey="ckDeptResource1" />
                                <asp:Label ID="lblDept" runat="server" Text="包含子部門" meta:resourcekey="lblDeptResource1"></asp:Label>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
            </td>
        </tr>
        <tr>
            <td background="<%=themePath %>/images/tree_bg.gif" height="433" valign="top" style="width: 100%">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <uc1:UC_DeptManagerTree ID="UC_DeptManagerTree1" runat="server" ShowDeptManagerTree="False"
                            ShowDeptPersonalTree="False" ShowSuperiorTree="True" DisplayActiveControl="true"/>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:Label ID="lbl" runat="server" meta:resourcekey="lblResource1"></asp:Label>
</asp:Content>
