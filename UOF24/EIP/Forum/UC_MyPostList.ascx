<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Forum_UC_MyPostList" Codebehind="UC_MyPostList.ascx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
    <Fast:Grid ID="Grid2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
        AutoGenerateColumns="False"  DataKeyNames="TOPIC_GUID"
        OnRowDataBound="Grid2_RowDataBound"
          Width="100%" PageSize="30" DataKeyOnClientWithCheckBox="False" CustomDropDownListPage="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="">
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
            <asp:BoundField DataField="REPLY_TIMES" HeaderText="回覆"
                SortExpression="REPLY_TIMES" meta:resourcekey="BoundFieldResource3" />
            <asp:BoundField DataField="READ_TIMES" HeaderText="查看" SortExpression="READ_TIMES" meta:resourcekey="BoundFieldResource4" />
            <asp:BoundField DataField="RECOMMEND_TIMES" HeaderText="推薦" SortExpression="RECOMMEND_TIMES" meta:resourcekey="BoundFieldResource5" />
            <asp:BoundField DataField="BOARD_NAME" HeaderText="討論版" SortExpression="BOARD_NAME" meta:resourcekey="BoundFieldResource6" />
        </Columns>
    </Fast:Grid>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetMyCreatedTopic"
        TypeName="Ede.Uof.EIP.Forum.ReadArticleUCO">
        <SelectParameters>
            <asp:ControlParameter ControlID="hideUserid" Name="userGUID" PropertyName="Value"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <input id="hideUserid" runat="server" type="hidden" /><br />
    <asp:Label ID="msgMypost" runat="server" Text="我發表過的" Visible="False" meta:resourcekey="msgMypostResource1"></asp:Label>
    <asp:Label ID="msgAnonymous" runat="server" Text="匿名" Visible="False"></asp:Label>
