<%@ Page Title="公告類別" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Bulletin_WKFOptionalFields_SelectPublishDept" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SelectPublishDept.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function resizeTree(X, Y) {
            var tree = $find("<%=classTree.ClientID %>");
            tree.get_element().style.height = Y + "px";
            tree.get_element().style.width = X + "px";
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadSplitter ID="MainRadSplitter" runat="server" Width="100%" LiveResize="true" ResizeWithBrowserWindow="true" ResizeWithParentPane="true" Orientation="Horizontal" BorderSize="0"  meta:resourcekey="MainRadSplitterResource1">
                <telerik:RadPane ID="TreeRadPane" runat="server" Scrolling="None" meta:resourceKey="RadPaneRankTopResource1">
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請選擇一公告類別" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                    <telerik:RadTreeView ID="classTree" runat="server" Width="100%" Height="100%" meta:resourcekey="classTreeResource1">
                    </telerik:RadTreeView>
                    <asp:Label ID="lblNoAuthority" runat="server" Text="選擇的類別沒有發佈權限。" Visible="False" meta:resourcekey="lblNoAuthorityResource1"></asp:Label>
                </telerik:RadPane>
            </telerik:RadSplitter>
            <asp:HiddenField ID="X" runat="server" />
            <asp:HiddenField ID="Y" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hfApplicant" runat="server" />
    <asp:Label ID="lblInnerclass" runat="server" Text="內部公告" Visible="False" meta:resourcekey="lblInnerclassResource1"></asp:Label>
    <asp:Label ID="lblOuterclass" runat="server" Text="外部公告" Visible="False" meta:resourcekey="lblOuterclassResource1"></asp:Label>
</asp:Content>

