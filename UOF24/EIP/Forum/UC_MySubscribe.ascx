<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Forum_UC_MySubscribe" Codebehind="UC_MySubscribe.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<script type="text/javascript">

function mySubscribeToolBarClicking(sender, args) {
    var key = args.get_item().get_value();
    switch (key) {
        case "Cancel":
            if(!confirm('<%=msgCancelsubscribe.Text %>')){
                args.set_cancel(true);
            }
        break;
    }
}
</script>
<telerik:RadToolBar ID="mySubscribeToolBar" runat="server" Width="100%" OnButtonClick="mySubscribeToolBar_OnButtonClick" OnClientButtonClicking="mySubscribeToolBarClicking">
    <Items>
        <telerik:RadToolBarButton runat="server" Text="取消訂閱" Value="Cancel"
            CheckedImageUrl="~/Common/Images/Icon/icon_m46.gif"
            DisabledImageUrl="~/Common/Images/Icon/icon_m46.gif"
            HoveredImageUrl="~/Common/Images/Icon/icon_m46.gif"
            ImageUrl="~/Common/Images/Icon/icon_m46.gif"
            meta:resourcekey="mySubscribeToolBarCancelResource1">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" Value="checkAuth">
            <ItemTemplate>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" ErrorMessage="沒有取消權限" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            </ItemTemplate>
        </telerik:RadToolBarButton>
    </Items>
</telerik:RadToolBar>
    <Fast:Grid ID="Grid2" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" 
        DataKeyNames="TOPIC_GUID" OnRowDataBound="Grid2_RowDataBound"
          Width="100%"  PageSize="30" DataKeyOnClientWithCheckBox="False" CustomDropDownListPage="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="">
<EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

<ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:TemplateField HeaderText="標題" meta:resourcekey="TemplateFieldResource1">
                <ItemTemplate>
                    <asp:HyperLink runat="server" ID="HyperLink2" meta:resourceKey="HyperLink2Resource1"></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="作者" meta:resourcekey="TemplateFieldResource2">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblAuthor" meta:resourceKey="lblAuthorResource1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="張貼時間" SortExpression="CREATE_DATE" meta:resourcekey="BoundFieldResource1">
                <ItemTemplate>
                    <asp:Label ID="lblCreateDate" runat="server" Text='<%#: Bind("CREATE_DATE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="最後發表" meta:resourcekey="TemplateFieldResource3">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblLastUser" meta:resourceKey="lblLastUserResource1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="回覆時間" SortExpression="LAST_REPLY_DATE" meta:resourcekey="BoundFieldResource2">
                <ItemTemplate>
                    <asp:Label ID="lblLastReplyDate" runat="server" Text='<%#: Bind("LAST_REPLY_DATE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="READ_TIMES" HeaderText="查看" SortExpression="READ_TIMES" meta:resourcekey="BoundFieldResource4" />
            <asp:BoundField DataField="RECOMMEND_TIMES" HeaderText="推薦" SortExpression="RECOMMEND_TIMES" meta:resourcekey="BoundFieldResource5" />
            <asp:BoundField DataField="BOARD_NAME" HeaderText="討論版" SortExpression="BOARD_NAME" meta:resourcekey="BoundFieldResource6" />
        </Columns>
    </Fast:Grid>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetMySubscribedTopic"
        TypeName="Ede.Uof.EIP.Forum.ReadArticleUCO">
        <SelectParameters>
            <asp:ControlParameter ControlID="hideUserid" Name="userGUID" PropertyName="Value"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <input id="hideUserid" runat="server" type="hidden" /><br />
    <asp:Label ID="msgCancelsubscribe" runat="server" Text="確定要取消訂閱?" Visible="False" meta:resourcekey="msgCancelsubscribeResource1"></asp:Label>
    <asp:Label ID="msgMysubscribe" runat="server" Text="我的訂閱" Visible="False" meta:resourcekey="msgMysubscribeResource1"></asp:Label>
    <asp:Label ID="msgAnonymous" runat="server" Text="匿名" Visible="False"></asp:Label>