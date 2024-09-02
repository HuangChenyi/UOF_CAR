<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="AuthoritySetting" Title="" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="AuthoritySetting.aspx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <asp:ValidationSummary ID="vsError" runat="server" Width="100%" meta:resourcekey="vsErrorResource1" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <telerik:RadTreeView ID="rdRoleTreeView" runat="server" 
        onnodeclick="RadTreeView1_NodeClick">
    </telerik:RadTreeView>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" style="height:100%;" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <table style="height:100%;" border="0" class="PopTable" cellpadding="0" cellspacing="1">
            <tr style="height:1%;" >
                <td style="text-align:left;" class="PopTableRightTD">
                    <asp:Label ID="lblQueAdminDesc" runat="server" Text="問卷管理者：具有問卷管理的最大權限，可以觀看所有的問卷及下載所有的問卷統計結果." meta:resourcekey="lblQueAdminDescResource1"></asp:Label>
                    <asp:Label ID="lblQueManagerDesc" runat="server" Text="問卷製作者：可維護填寫人屬性、製作問卷、發送問卷及統計製作的問卷." meta:resourcekey="lblQueManagerDescResource1"></asp:Label>
                    <asp:Label ID="lblQueUserDesc" runat="server" Text="瀏覽全部統計資料者：可觀看全部問卷的統計結果，但沒有權限製作問卷、發送問卷及維護填寫人屬性." meta:resourcekey="lblQueUserDescResource1"></asp:Label>
                    <asp:Label ID="lblQueExaminerDesc" runat="server" Text="問卷審核者：當問卷發佈時，需由問卷審核者進行問卷審核，審核通過問卷才會發佈" meta:resourcekey="lblQueExaminerDescResource1"></asp:Label>
                </td>
            </tr>
            <tr style="height:99%;vertical-align:top; padding-top:5px;">
                <td style="text-align:left;padding-top:5px;vertical-align:top;" class="PopTableRightTD" >
                    <uc1:UC_ChoiceList ID="ucRoleMember" runat="server" ChioceType="All" />
                     <asp:CustomValidator ID="chCheckClassHasExamine" runat="server" ErrorMessage="" Display="Dynamic"></asp:CustomValidator>
                     <asp:Label ID="lblCheckClassHasExamineMsg" runat="server" Text="以下類別內尚有審核中的問卷，請設定審核者進行審核:<br />{0}" Visible="false" meta:resourcekey="lblCheckClassHasExamineMsgResource1"></asp:Label>
                     <asp:Label ID="lblNeedExamineClassName" runat="server" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
        </table>
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblTitle" runat="server" Text="權限設定" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="lblCreate" runat="server" Text="問卷製作者" Visible="False" meta:resourcekey="lblCreateResource1"></asp:Label>
    <asp:Label ID="lblView" runat="server" Text="瀏覽全部統計資料者" Visible="False" meta:resourcekey="lblViewResource1"></asp:Label>
    <asp:Label ID="lblQueManager" runat="server" Text="問卷製作者" Visible="False" meta:resourcekey="lblQueManagerResource1"></asp:Label>
    <asp:Label ID="lblQueUser" runat="server" Text="瀏覽全部統計資料者" Visible="False" meta:resourcekey="lblQueUserResource1"></asp:Label>
    <asp:Label ID="lblQueExaminer" runat="server" Text="問卷審核者" Visible="False" meta:resourcekey="lblQueExaminerResource1"></asp:Label>
    <asp:Label ID="lblQueAdmin" runat="server" Text="QUE Administrator" Visible="False" meta:resourcekey="lblQueAdminResource1"></asp:Label>
    <asp:Label ID="lblRole" Visible="False" runat="server" Text="角色" meta:resourcekey="lblRoleResource1"></asp:Label>
    <asp:CustomValidator ID="cvError" runat="server" Visible="False" ForeColor="Red" meta:resourcekey="cvErrorResource1"></asp:CustomValidator>
</asp:Content>
