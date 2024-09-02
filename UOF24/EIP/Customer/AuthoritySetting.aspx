<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Customer_AuthoritySetting" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AuthoritySetting.aspx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc2" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceOnce.ascx" TagName="UC_ChoiceOnce" TagPrefix="uc3" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanelTree" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <telerik:RadTreeView ID="rdRoleTree" runat="server" OnNodeClick="rdRoleTree_NodeClick" meta:resourcekey="rdRoleTreeResource1"></telerik:RadTreeView>
            <br />
            <asp:Label ID="lblLeftTitle" runat="server" Text="角色列表" Visible="False" meta:resourcekey="lblLeftTitleResource1" ></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanelGrid" runat="server">
        <ContentTemplate>
            <table style="height:100%; width:100%;">
                <tr>
                    <td>
                        <asp:Label ID="lblMessage" runat="server" Text="角色說明：資料管理者，能維護主檔資料及新增/修改/刪除客戶資料，擁有最大的權限"  meta:resourcekey="lblMessageResource1"></asp:Label><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <uc1:UC_ChoiceList ID="ucChoiceList1" runat="server" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="Label1" runat="server" Text="角色權限設定" Visible="False" meta:resourcekey="Label1Resource2"></asp:Label>
    <asp:Label ID="lblManager" runat="server" Text="資料管理者" Visible="False" meta:resourcekey="lblManagerResource1"></asp:Label>
    <asp:Label ID="lblCreater" runat="server" Text="新增資料者" Visible="False" meta:resourcekey="lblCreaterResource1"></asp:Label>
    <asp:Label ID="lblModifier" runat="server" Text="修改資料者" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
    <asp:Label ID="lblDeletion" runat="server" Text="刪除資料者" Visible="False" meta:resourcekey="lblDeletionResource1"></asp:Label>
    <asp:Label ID="lblMsgManager" runat="server" Text="角色說明：資料管理者，能維護主檔資料及新增/修改/刪除客戶資料，擁有最大的權限" Visible="False" meta:resourcekey="lblMsgManagerResource1"></asp:Label>
    <asp:Label ID="lblMsgCreater" runat="server" Text="角色說明：新增資料者，只能新增客戶資料、新增聯絡人資料" Visible="False" meta:resourcekey="lblMsgCreaterResource1"></asp:Label>
    <asp:Label ID="lblMsgModifier" runat="server" Text="角色說明：修改資料者，能新增/修改客戶資料及聯絡人資料、批次設定資料歸屬" Visible="False" meta:resourcekey="lblMsgModifierResource1"></asp:Label>
    <asp:Label ID="lblMsgDeletion" runat="server" Text="角色說明：刪除資料者，能新增/修改/刪除客戶資料及聯絡人資料" Visible="False" meta:resourcekey="lblMsgDeletionResource1"></asp:Label>
</asp:Content>

