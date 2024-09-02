<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Forum_BoardSetting" Title="討論區設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="BoardSetting.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">

    <script type="text/javascript">
        function RadToolBar1ButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            var tree = $find("<%= this.RadTreeView1.ClientID %>");
            var node = tree.get_selectedNode();
            var areaID;
            var areaName;
            if (node != null) {
                areaID = node.get_value();
                areaName = node.get_text();
            }
            switch (key) {
                case "CreateBlock":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Forum/AreaSetting.aspx", args.get_item(), "", 660, 600, OpenDialogResult);                    
                    break;
                case "SetBlockOwner":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Forum/AreaBoardMasterSetting.aspx", args.get_item(), "", 700, 600, OpenDialogResult, { "areaID": areaID });
                    break;
                case "CreateForum":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Forum/CreateBoard.aspx", args.get_item(), "", 700, 600, OpenDialogResult, { "areaid": areaID, "areaname": areaName });
                    break;
                case "Delete":
                    if (!confirm('<%=msgDelconfirm.Text %>')) {
                        args.set_cancel(true);
                    }
                    break;
            }
        }
        
        function OpenDialogResult(returnValue) {            
            if (typeof (returnValue) == 'undefined')
                return false;
            else
                return true;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">

    <asp:UpdatePanel ID="UpdatePanelToolbar" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBar1ButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="討論區設定" Value="CreateBlock"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m57.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m57.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m57.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m57.gif"
                        meta:resourcekey="RadToolBarCreateBlockResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="設定區版主" Value="SetBlockOwner"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m58.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m58.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m58.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m58.gif"
                        meta:resourcekey="RadToolBarSetBlockOwnerResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="新增討論版" Value="CreateForum"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m59.gif"
                        meta:resourcekey="RadToolBarCreateForumResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource3"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除討論版" Value="Delete"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        meta:resourcekey="RadToolBarDeleteResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>


<%--TABLE待刪 --%>
<%--<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td width="230px" valign="top">
            <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
                <tr>
                    <td background="<%=themePath %>/images/tree_title.gif" style="height: 30px" width="100%">
                        <table align="center" border="0" cellpadding="0" cellspacing="0" height="30" width="95%">
                            <tr>
                                <td width="23">
                                    <div align="center">
                                        <img src="<%=themePath %>/images/icon04.gif" width="7" height="7">
                                    </div>
                                </td>
                                <td class="g">
                                    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="討論區列表"></asp:Label></td>
                                <td width="3">
                                    <img src="<%=themePath %>/images/tree_line01.gif" width="3" height="23"></td>
                                <td background="<%=themePath %>/images/tree_line02.gif">&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td rowspan="2" valign="top" background="<%=themePath %>/images/tree_line04.gif" style="width: 89%">
                        <img src="<%=themePath %>/images/tree_line03.gif" width="8" height="101">
                    </td>
                </tr>
                <tr>
                    <td background="<%=themePath %>/images/tree_bg.gif" height="433" valign="top" width="100%">
                        <table align="center" border="0" cellpadding="0" cellspacing="0" height="100%" width="100%">
                            <tr>
                                <td valign="top" width="100%">
                                 
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
        <td valign="top">--%>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">

    <asp:UpdatePanel ID="UpdatePanelTree" runat="server" UpdateMode="Conditional"
        RenderMode="Inline">
        <ContentTemplate>
            <telerik:RadTreeView ID="RadTreeView1" runat="server" EnableNodeTextHtmlEncoding="true"  OnNodeClick="RadTreeView1_NodeClick" meta:resourcekey="RadTreeView1Resource1">
            </telerik:RadTreeView>
            <br />
            <asp:Label ID="lblLeftTitle" runat="server" Visible="False" meta:resourcekey="lblLeftTitleResource1">討論區列表</asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanelGrid" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:CustomValidator ID="cvDelete" runat="server" ForeColor="Red" ErrorMessage="刪除失敗" Display="Dynamic" meta:resourcekey="cvDeleteResource1"></asp:CustomValidator>
            <Fast:Grid ID="Grid1" runat="server" Width="100%" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                AutoGenerateColumns="False" DataKeyNames="BOARD_GUID" DataSourceID="ObjectDataSource1"
                OnRowDataBound="Grid1_RowDataBound"
                DataKeyOnClientWithCheckBox="False"
                DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False"
                PageSize="15"  meta:resourcekey="Grid1Resource2"  >
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="討論版名稱" SortExpression="BOARD_NAME" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="LinkButton1" Text='<%# Eval("BOARD_NAME") %>' meta:resourceKey="LinkButton1Resource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="200px" />
                        <ItemStyle Width="200px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="發表者身份" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblPostedDisplay" meta:resourcekey="lblPostedDisplayResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="80px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="版主" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label runat="server" Text="Label" ID="lblMaster" meta:resourceKey="lblMasterResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="200px" />
                        <ItemStyle Width="200px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="可瀏覽對象" meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:Label ID="lblUser" runat="server" meta:resourcekey="lblUserResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="200px" />
                        <ItemStyle Width="200px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="DESCRIPTION" HeaderText="描述" SortExpression="DESCRIPTION" meta:resourcekey="BoundFieldResource1" />
                </Columns>
            </Fast:Grid>
            <br />
            <input id="hideUserGuid" runat="server" type="hidden" />
            </input>
            <input id="hideSelecttext" runat="server" type="hidden"></input>
                <input id="hideSelectnode" runat="server" type="hidden"></input>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllBoard" TypeName="Ede.Uof.EIP.Forum.ReadArticleUCO">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblUserGUID" DefaultValue="" Name="userGUID" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="lblTreeSelectValue" DefaultValue=" " Name="areaID" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:Label ID="lblUserGUID" runat="server" meta:resourcekey="lblUserGUIDResource1" Visible="False"></asp:Label>
                    <asp:Label ID="lblTreeSelectValue" runat="server" meta:resourcekey="lblTreeSelectValueResource1" Visible="False"></asp:Label>
                </input>
            </input>
        </ContentTemplate>
    </asp:UpdatePanel>
    <%--TABLE待刪 --%>
    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1" Style="display: none"></asp:Label>
    <asp:Label ID="msgNone" runat="server" Text="無" meta:resourcekey="msgNoneResource1" Visible="False" Style="display: none"></asp:Label>
    <asp:Label ID="msgNormalName" runat="server" Text="顯示姓名" meta:resourcekey="msgNormalNameResource1" Style="display: none"></asp:Label>
    <asp:Label ID="msgNickName" runat="server" Text="顯示暱稱" meta:resourcekey="msgNickNameResource1" Style="display: none"></asp:Label>
    <asp:Label ID="msgAnonymous" runat="server" Text="匿名" meta:resourcekey="msgAnonymousResource1" Style="display: none"></asp:Label>    
</asp:Content>
