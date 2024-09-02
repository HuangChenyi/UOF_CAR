<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Forum_EssenceSubjectList" Title="討論版精華區" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="EssenceSubjectList.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="UC_SubjectDetail.ascx" TagName="UC_SubjectDetail" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>



<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">

    <script id="ForumEssenceSubjectList" type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_pageLoaded(pageLoaded);

        function pageLoaded(sender, args) {
            var SubjectChangedClientControl = $("<% =UC_SubjectDetail1.SubjectChangedClientID %>");
            if (SubjectChangedClientControl != null) {
                var SubjectChanged = SubjectChangedClientControl.value;
                if (SubjectChanged == "1") {
                    ClearSiteMapNode();
                    AddEssenceSiteMapNode();
                    $("#<% =UC_SubjectDetail1.SubjectChangedClientID %>").val("0");
                }
            }
        }
        function lbtSubject_OnClientClick(subject) {
            var SubjectChangedClientControl = $("#<% =UC_SubjectDetail1.SubjectChangedClientID %>");
        if (SubjectChangedClientControl != null) {
            SubjectChangedClientControl.val("1");
        }
    }
    </script>
    <script type="text/javascript">

        function AddEssenceSiteMapNode() {
            var boardID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["boardid"],true)%>');
            var boardName = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["boardname"],true)%>'); 
            var msgEssence = '<%=msgEssence.Text %>';
            ClearSiteMapNode();
            AddSiteMapNodeWithLink(boardName, "AllSubjectList.aspx?boardid=" + boardID + "&boardname=" + escape(boardName));
            AddSiteMapNodeWithLink(msgEssence, "EssenceSubjectList.aspx?boardid=" + boardID + "&boardname=" + escape(boardName));

            var ArrNodeName = new Array();
            var ArrNodeID = new Array();

            var tree = $find("<%=RadTreeView1.ClientID %>");
            var selNode = tree.get_SelectedNode();

            while (selNode != null) {
                ArrNodeName.push(selNode.get_text());
                ArrNodeID.push(selNode.get_value());

                selNode = selNode.get_parent();
            }

            for (var i = ArrNodeID.length - 1; i >= 0; i--) {
                AddSiteMapNodeWithLink(ArrNodeName[i], "EssenceSubjectList.aspx?boardid=" + boardID + "&boardname=" + escape(boardName) + "&folderId=" + ArrNodeID[i]);
            }
        }
        function radToolBarClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Delete":
                    if (!confirm('<%=msgDelconfirm.Text %>')) {
                args.set_cancel(true);
            }
            break;
                case "Move":
                    args.set_cancel(true);                                        
                    $uof.dialog.open2("~/EIP/Forum/EssenceArticleMove.aspx", args.get_item(), "", 400, 450, OpenDialogReturn, { "boardid": $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["boardid"],true)%>')});
            break;
            }

            function OpenDialogReturn(returnValue){
                if (typeof (returnValue) == 'undefined')
                    return false;                
                else
                    return true;
            }
}
    </script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">


    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="radToolBarClicking">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="文章搬移" Value="Move"
                CheckedImageUrl="~/Common/Images/Icon/icon_m65.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m65.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m65.gif"
                ImageUrl="~/Common/Images/Icon/icon_m65.gif"
                meta:resourcekey="RadToolBarMoveResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="刪除選取項目" Value="Delete"
                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                meta:resourcekey="RadToolBarDeleteResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text="版主:" meta:resourcekey="Label2Resource1"></asp:Label>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="user">
                <ItemTemplate>
                    <asp:Label ID="Master" runat="server" Text=""></asp:Label>
                </ItemTemplate>
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanelTree" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadTreeView ID="RadTreeView1" runat="server" EnableNodeTextHtmlEncoding="true"  OnNodeClick="RadTreeView1_NodeClick"></telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">

    <asp:UpdatePanel ID="UpdatePanelGrid" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <input id="hideuserGuid" runat="server" type="hidden" />
            <input id="hideFolderid" runat="server" type="hidden" />
            <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                DataKeyNames="TOPIC_GUID" OnRowDataBound="Grid1_RowDataBound"
                Width="100%" AutoGenerateColumns="False"
                AllowPaging="True" OnPageIndexChanging="Grid1_PageIndexChanging" DataKeyOnClientWithCheckBox="False" OnRowCommand="Grid1_RowCommand" OnSorting="Grid1_Sorting">
                <Columns>
                    <asp:TemplateField HeaderText="文章主題" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtSubject" runat="server" CommandName="SubjectDetail" __designer:wfdid="w75"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="張貼者" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblAnnounce" meta:resourceKey="lblAnnounceResource1"></asp:Label>


                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="READ_TIMES" HeaderText="讀取" SortExpression="READ_TIMES" meta:resourcekey="BoundFieldResource1" />
                    <asp:BoundField DataField="REPLY_TIMES" HeaderText="回覆" SortExpression="REPLY_TIMES" meta:resourcekey="BoundFieldResource2" />
                    <asp:BoundField DataField="RECOMMEND_TIMES" HeaderText="推薦" SortExpression="RECOMMEND_TIMES" meta:resourcekey="BoundFieldResource3" />
                </Columns>
            </Fast:Grid>
            <div id="divUC_SubjectDetail">
                <uc1:UC_SubjectDetail ID="UC_SubjectDetail1" runat="server"></uc1:UC_SubjectDetail>
            </div>
        </ContentTemplate>
<%--        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
            <asp:AsyncPostBackTrigger ControlID="RadTreeView1" EventName="NodeClick" />

        </Triggers>--%>
    </asp:UpdatePanel>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetEssenceTopicList"
        TypeName="Ede.Uof.EIP.Forum.ReadEssenceUCO">
        <SelectParameters>
            <asp:ControlParameter ControlID="hideuserGuid" Name="userGUID" PropertyName="Value"
                Type="String" />
            <asp:ControlParameter ControlID="hideFolderid" Name="folderID" PropertyName="Value"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>


    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
    <asp:Label ID="msgEssence" runat="server" Text="精華區" Visible="False" meta:resourcekey="msgEssenceResource1"></asp:Label>
    <asp:Label ID="msgNone" runat="server" Text="無" meta:resourcekey="msgNoneResource1" Visible="False"></asp:Label>
    <asp:Label ID="msgNoessence" runat="server" Text="無精華目錄可供瀏覽" meta:resourcekey="msgNoessenceResource1" Visible="False"></asp:Label>
    <asp:Label ID="msgAnonymous" runat="server" Text="匿名" Visible="False"></asp:Label>
</asp:Content>
