<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Personal_Briefcase_Default" Title="公事包" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" EnableEventValidation="false" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script id="defaultjs" type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_pageLoaded(pageLoaded);

        function pageLoaded(sender, args) {
            var toolbar = $find("<%=RadToolBar1.ClientID%>");
            if (toolbar != null) {
                var createFileEnable = $("#<%=hideCreateFileEnable.ClientID %>").val();
                var createFileItem = toolbar.findItemByValue("CreateFile");
                if (createFileEnable == "1")
                    createFileItem.set_enabled(true);
                else
                    createFileItem.set_enabled(false);

                var createFolderEnable = $("#<%=hideCreateFolderEnable.ClientID %>").val();
                var createFolderItem = toolbar.findItemByValue("CreateFolder");
                if (createFolderEnable == "1")
                    createFolderItem.set_enabled(true);
                else
                    createFolderItem.set_enabled(false);

                var deleteFileEnable = $("#<%=hideDeleteFileEnable.ClientID %>").val();
                var deleteFileItem = toolbar.findItemByValue('DeleteFile');
                if (deleteFileEnable == "1")
                    deleteFileItem.set_enabled(true);
                else
                    deleteFileItem.set_enabled(false);

                var sharingFolderEnable = $("#<%=hideSharingFolderEnable.ClientID %>").val();
                var sharingFolderItem = toolbar.findItemByValue('SharingFolder');
                if (sharingFolderEnable == "1")
                    sharingFolderItem.set_enabled(true);
                else
                    sharingFolderItem.set_enabled(false);
            }
  
            var txtSearchKey= document.getElementById('<%=RadToolBar2.FindItemByValue("KeyWord").FindControl("txtSearchKey").ClientID %>');           
            var searchRange= document.getElementById('<%=RadToolBar2.FindItemByValue("SearchRange").FindControl("rbSearchScope").ClientID %>');           

            if (txtSearchKey != null) {
                txtSearchKey.onkeydown = clickSearch;  
            }
            if (searchRange != null) {
                searchRange.onkeydown = clickSearch;  
            }           
        }

        function clickSearch(e) {          
            e = e || window.event || {};
            var charCode = e.charCode || e.keyCode || e.which;
            if (charCode == 13) {              
                var toobar2 = $find("<%=RadToolBar2.ClientID%>");
                var Search = toobar2.findItemByValue("Search");                 
                    Search.click();
            }
        }

        function ShareFolderPathLink(folderID) {
            $("#<%=hideLinkFolder.ClientID %>").val(folderID);
            WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("ctl00$ContentPlaceHolder1$UltraWebTab1$_ctl1$LinkButton1", "", true, "", "", false, true));
        }
        function RadToolBar1_ButtonClicking(sender, args) {
            //Add code to handle your event here.
            var toolbar = sender;
            var value = args.get_item().get_value();
            var createFileItem = toolbar.findItemByValue('CreateFile');
            var createFileEnable = createFileItem.get_enabled();
            createFileItem.set_enabled(true);
            var createFolderItem = toolbar.findItemByValue('CreateFolder');
            var createFolderEnable = createFolderItem.get_enabled();
            createFolderItem.set_enabled(true);
            var deleteFileItem = toolbar.findItemByValue('DeleteFile');
            var deleteFileEnable = deleteFileItem.get_enabled();
            deleteFileItem.set_enabled(true);
            var sharingFolderItem = toolbar.findItemByValue('SharingFolder');
            var sharingFolderEnable = sharingFolderItem.get_enabled();
            sharingFolderItem.set_enabled(true);

            var tree = $find("<%= rtvMyFolderTree.ClientID %>");
            var node = tree.get_selectedNode();
            var folderId;
            var folderName;
            if (node != null) {
                folderId = node.get_value();
                folderName = node.get_text();
            }
            switch (value) {
                case "CreateFolder":

                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Personal/Briefcase/ManageFolder.aspx", args.get_item(), 
                   "",400, 510, OpenDialogResult);

                   
                    break;
                case "CreateFile":
                    if (folderId == null || folderId == "") {
                        args.set_cancel(true);
                        return;
                    }
                   
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Personal/Briefcase/CreateFile.aspx", args.get_item(), 
                   "",800, 600, OpenDialogResult,{"FolderID":folderId});

                    break;
                case "SharingFolder":
                    if (folderId == null || folderId == "") {
                        args.set_cancel(true);
                        return;
                    }

                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Personal/Briefcase/SharingFolder.aspx", args.get_item(), 
                   "",400, 500, OpenDialogResult,{"FolderID":folderId,"FolderName":folderName});

                    break;
                case "DeleteFile":
                    args.set_cancel(true);
                    args.set_cancel(!confirm('<%=msgDelconfirm.Text %>'));
                    break;
                case "Search":
                    args.set_cancel(true);
                  
                    $uof.dialog.open2("~/EIP/Personal/Briefcase/Search.aspx", args.get_item(), 
              "",400, 200, OpenDialogResult);


                    break;
            }
        }

        function OpenDialogResult(returnValue) {
           

            if (typeof (returnValue) == "undefined") {
                var toolbar = $find("<%=RadToolBar1.ClientID%>");
                var createFileItem = toolbar.findItemByValue('CreateFile');
                var createFileEnable = createFileItem.get_enabled();

                var createFolderItem = toolbar.findItemByValue('CreateFolder');
                var createFolderEnable = createFolderItem.get_enabled();

                var deleteFileItem = toolbar.findItemByValue('DeleteFile');
                var deleteFileEnable = deleteFileItem.get_enabled();

                var sharingFolderItem = toolbar.findItemByValue('SharingFolder');
                var sharingFolderEnable = sharingFolderItem.get_enabled();


                createFileItem.set_enabled(createFileEnable);
                createFolderItem.set_enabled(createFolderEnable);
                deleteFileItem.set_enabled(deleteFileEnable);
                sharingFolderItem.set_enabled(sharingFolderEnable);

                return false;
            }
            else
                return true;
        }

        function UltraWebTab1_Click(oWebTab, oTab, oEvent) {
            //Add code to handle your event here.

            var toolbar = $find("<%=RadToolBar1.ClientID %>");
            var itemcreate = toolbar.findItemByValue('CreateFile');
            var itemdelete = toolbar.findItemByValue('DeleteFile');
            var itemshare = toolbar.findItemByValue('SharingFolder');
            var nodecount = $("<%=hideNodecount.ClientID%>").val();
            if (toolbar.get_item().get_value() == 'sharedFolder') {
                itemcreate.set_enabled(false);
                itemdelete.set_enabled(false);
                itemshare.set_enabled(false);
            }
            else {
                if (nodecount > 0) {
                    itemcreate.set_enabled(true);
                    itemdelete.set_enabled(true);
                    itemshare.set_enabled(true);
                }
            }
        }            
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanelTab" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
    <telerik:RadTabStrip ID="RadTabStrip1" MultiPageID="RadMultiPage1" runat="server" OnTabClick="RadTabStrip1_TabClick" 
        >
        <Tabs>
            <telerik:RadTab runat="server" Text="我的目錄" Value="myFolder" PageViewID="rpvMyFolder" meta:resourcekey="RadTabResource1">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="分享資源" Value="sharedFolder" PageViewID="rpvSharedFolder" meta:resourcekey="RadTabResource2">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="最新分享" Value="latestShare" PageViewID="rpvLatestShare" meta:resourcekey="RadTabResource3">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="搜尋檔案" Value="searchResult" PageViewID="rpvSearchResult" meta:resourcekey="RadTabResource4">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    
            <telerik:RadMultiPage ID="rmpToolBar" runat="server">
                <telerik:RadPageView ID="RadPageView1" runat="server">
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="目錄管理" Value="CreateFolder"
                                ClickedImageUrl="~/Common/Images/Icon/icon_m10.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m10.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m10.gif" ImageUrl="~/Common/Images/Icon/icon_m10.gif" meta:resourcekey="RadToolBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="新增檔案" Value="CreateFile"
                                ClickedImageUrl="~/Common/Images/Icon/icon_m12.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m12.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m12.gif" ImageUrl="~/Common/Images/Icon/icon_m12.gif" meta:resourcekey="RadToolBarButtonResource3">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="刪除檔案" Value="DeleteFile"
                                ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource5">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="目錄分享" Value="SharingFolder"
                                ClickedImageUrl="~/Common/Images/Icon/icon_m13.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m13.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m13.gif" ImageUrl="~/Common/Images/Icon/icon_m13.gif" meta:resourcekey="RadToolBarButtonResource7">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource8"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Value="Size" meta:resourcekey="RadToolBarButtonResource9">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblMaxSize" runat="server" Text="容量上限：" ForeColor="Red" meta:resourcekey="lblMaxSizeResource1"></asp:Label>
                                            </td>
                                            <td>&nbsp; &nbsp;
                                            </td>
                                            <td>
                                                <asp:Label ID="lblUseSize" runat="server" Text="已使用容量：" ForeColor="Red" meta:resourcekey="lblUseSizeResource1"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView2" runat="server">
                    <telerik:RadToolBar ID="RadToolBar2" runat="server" meta:resourcekey="RadToolBar2Resource1" OnButtonClick="RadToolBar2_ButtonClick" Width="100%">
                        <Items>
                            <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource10" Value="KeyWord">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="關鍵字："></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSearchKey"  runat="server" meta:resourcekey="txtSearchKeyResource1"></asp:TextBox>

                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource11"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource12" Value="SearchRange">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label3" runat="server" meta:resourcekey="Label2Resource2" Text="搜尋範圍："></asp:Label>
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="rbSearchScope" runat="server" meta:resourceKey="rbSearchScopeResource1" RepeatColumns="3">
                                                    <asp:ListItem meta:resourceKey="ListItemResource1" Text="全部" Value="All"></asp:ListItem>
                                                    <asp:ListItem meta:resourceKey="ListItemResource2" Selected="True" Text="自己的檔案" Value="Self"></asp:ListItem>
                                                    <asp:ListItem meta:resourceKey="ListItemResource3" Text="別人分享的檔案" Value="Share"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource13"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource14" Text="搜尋檔案" Value="Search"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource15"></telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanelTree" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadMultiPage ID="rmpTree" runat="server">
                <telerik:RadPageView ID="RadPageView3" runat="server">
                    <telerik:RadTreeView ID="rtvMyFolderTree" runat="server" EnableNodeTextHtmlEncoding="true"
                        OnNodeClick="rtvMyFolderTree_NodeClick">
                    </telerik:RadTreeView>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView5" runat="server">
                    <telerik:RadTreeView ID="rtvDepUserTree" EnableNodeTextHtmlEncoding="true"
                        runat="server" OnNodeClick="rtvDepUserTree_NodeClick">
                    </telerik:RadTreeView>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanelGrid" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadMultiPage ID="rmpGrid" runat="server">
                <telerik:RadPageView ID="RadPageView4" runat="server">
                    <asp:HiddenField ID="hideCreateFileEnable" runat="server" Value="1"/>
                    <asp:HiddenField ID="hideCreateFolderEnable" runat="server" Value="1" />
                    <asp:HiddenField ID="hideDeleteFileEnable" runat="server" Value="1" />
                    <asp:HiddenField ID="hideSharingFolderEnable" runat="server" Value="1" />
                    <Fast:Grid ID="fileGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                        AutoGenerateColumns="False"  DataKeyNames="FILE_ID" DataKeyOnClientWithCheckBox="False"
                        DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False"
                        meta:resourceKey="fileGridResource2" OnPageIndexChanging="fileGrid_PageIndexChanging"
                        OnRowDataBound="fileGrid_RowDataBound" OnSorting="fileGrid_Sorting" PageSize="15" 
                         Width="100%">
                        <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl=""
                            NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass=""
                            PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

                        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                        <Columns>
                            <asp:BoundField DataField="FILE_ID" HeaderText="FILE_ID" meta:resourceKey="BoundFieldResource1" Visible="False"></asp:BoundField>
                            <asp:TemplateField HeaderText="檔案名稱" meta:resourceKey="TemplateFieldResource1" SortExpression="FILE_NAME">
                                <ItemTemplate>
                                    <asp:Image ID="imgFile" runat="server" meta:resourceKey="imgFileResource2"></asp:Image>
                                    <asp:HyperLink ID="HyperLink2" runat="server" Target="_blank" NavigateUrl='<%# "~/Common/FileCenter/DownloadFile.aspx?id="+Eval("FILE_ID") %>' Text='<%#: Eval("FILE_NAME") %>'></asp:HyperLink>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Width="60%"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="檔案大小" meta:resourceKey="TemplateFieldResource6">
                                <ItemTemplate>
                                    <asp:Label ID="lblFileLength" runat="server" meta:resourceKey="lblFileLengthResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Right" Width="10%"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="上傳日期" meta:resourceKey="BoundFieldResource3" SortExpression="CREATE_DATE">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblFileGridUploadDate" Text='<%# Bind("CREATE_DATE") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Width="15%" Wrap="False"></ItemStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="DESCRIPTION" HeaderText="備註" meta:resourceKey="BoundFieldResource4" SortExpression="DESCRIPTION">
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle Width="20%"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField meta:resourceKey="TemplateFieldResource7">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDescription" runat="server" meta:resourceKey="lbtnDescriptionResource1" Text="修改"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="5%" Wrap="False"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </Fast:Grid>
                    <asp:HiddenField ID="hideFolderid" runat="server" />
                    <asp:HiddenField ID="hideNodecount" runat="server" />
                    <asp:HiddenField ID="hideFoldername" runat="server" />
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView6" runat="server">
                    <asp:ImageButton ID="imgUpperFolder" runat="server" AlternateText="回上一層目錄" OnClick="imgUpperFolder_Click"
                        meta:resourcekey="imgUpperFolderResource1" />

                    <asp:Label ID="Label1" runat="server" Text="目錄：" meta:resourcekey="Label1Resource1"></asp:Label>
                    <asp:Label ID="lblSharePath" runat="server" Visible="False" meta:resourcekey="lblSharePathResource1"></asp:Label>
                    <asp:Literal ID="litSharePath" runat="server" meta:resourcekey="litSharePathResource1"></asp:Literal>
                    <asp:HiddenField ID="hideCurrentFolder" runat="server" />
                    <asp:HiddenField ID="hideUpperFolder" runat="server" />
                    <asp:HiddenField ID="hideLinkFolder" runat="server" />
                    <Fast:Grid ID="shareGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                         DataKeyNames="ID" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                        EnhancePager="True" KeepSelectedRows="False" meta:resourceKey="shareGridResource2" OnPageIndexChanging="shareGrid_PageIndexChanging" OnRowCommand="shareGrid_RowCommand"
                        OnRowDataBound="shareGrid_RowDataBound" OnSorting="shareGrid_Sorting" PageSize="15"   Width="100%">
                        <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" meta:resourceKey="BoundFieldResource6" Visible="False"></asp:BoundField>
                            <asp:TemplateField HeaderText="檔案名稱" meta:resourceKey="TemplateFieldResource3" SortExpression="Name">
                                <ItemTemplate>
                                    <asp:Image ID="imgFile" runat="server" meta:resourceKey="imgFileResource3"></asp:Image>
                                    <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl='<%# "~/Common/FileCenter/DownloadFile.aspx?id="+Eval("ID") %>'><%#: Eval("Name") %></asp:HyperLink>
                                    <asp:LinkButton ID="lbtFolderName" runat="server" Text='<%#: Eval("Name") %>' Visible="False"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
<%--                            <asp:BoundField DataField="FILE_LENGTH" HeaderText="檔案大小(Byte)" meta:resourceKey="BoundFieldResource7" SortExpression="FILE_LENGTH"></asp:BoundField>--%>
                            <asp:TemplateField HeaderText="檔案大小" meta:resourceKey="BoundFieldResource7">
                                <ItemTemplate>
                                    <asp:Label ID="lblFileLengthShare" runat="server" Text='<%# Bind("FILE_LENGTH") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle  HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="上傳日期" meta:resourceKey="BoundFieldResource8" SortExpression="CREATE_DATE">
                                <ItemTemplate>
                                    <asp:Label ID="lblShareGridUploadDate" runat="server" Text='<%# Bind("CREATE_DATE") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="DESCRIPTION" HeaderText="備註" meta:resourceKey="BoundFieldResource9" SortExpression="DESCRIPTION"></asp:BoundField>
                            <asp:BoundField DataField="Type" HeaderText="Type" meta:resourceKey="BoundFieldResource10" Visible="False"></asp:BoundField>
                        </Columns>
                    </Fast:Grid>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="BindFolder" meta:resourceKey="LinkButton1Resource1" OnCommand="LinkButton1_Command" Visible="False"></asp:LinkButton>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView7" runat="server">
                    <Fast:Grid ID="latestShareGrid" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                        AutoGenerateColumns="False" Width="100%"
                        DataKeyNames="FILE_ID" OnRowDataBound="latestShareGrid_RowDataBound" AllowPaging="True"
                        PageSize="15" OnSorting="latestShareGrid_Sorting"
                        OnPageIndexChanging="latestShareGrid_PageIndexChanging" DataKeyOnClientWithCheckBox="False"  DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="latestShareGridResource2"  >
                        <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />

                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:BoundField DataField="FILE_ID" HeaderText="FILE_ID" Visible="False" meta:resourcekey="BoundFieldResource11" />
                            <asp:TemplateField HeaderText="使用者" SortExpression="USER_GUID" meta:resourcekey="TemplateFieldResource4">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbUser" meta:resourcekey="lbUserResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="FOLDER_NAME" HeaderText="目錄名稱" SortExpression="FOLDER_NAME"
                                meta:resourcekey="BoundFieldResource12" />
                            <asp:TemplateField HeaderText="檔案名稱" SortExpression="FILE_NAME" meta:resourcekey="TemplateFieldResource5">
                                <ItemTemplate>
                                    <asp:Image runat="server" ID="imgFile" meta:resourcekey="imgFileResource4"></asp:Image>
                                    <asp:HyperLink runat="server" ID="HyperLink4" Target="_blank" NavigateUrl='<%# "~/Common/FileCenter/DownloadFile.aspx?id="+Eval("FILE_ID") %>'><%#: Eval("FILE_NAME") %></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="上傳日期" meta:resourceKey="BoundFieldResource3" SortExpression="CREATE_DATE">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblLatestShareUploadDate" Text='<%# Bind("CREATE_DATE") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </asp:TemplateField>

                        </Columns>
                    </Fast:Grid>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageView8" runat="server">
                    <asp:Label ID="lblSearchMsg" runat="server" ForeColor="Blue" meta:resourceKey="lblSearchMsgResource1" Text="目前只能搜尋檔案內容，暫不提供搜尋檔案名稱" Visible="False"></asp:Label>
                    <asp:CustomValidator ID="cvIndexNotFound" runat="server" Display="Dynamic" ErrorMessage="找不到系統索引檔，請洽系統管理員" ForeColor="Red" meta:resourceKey="cvIndexNotFoundResource1"></asp:CustomValidator>

                    <Fast:Grid ID="searchGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                         DataKeyNames="fileID" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                        EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="searchGridResource1" OnPageIndexChanging="searchGrid_PageIndexChanging" OnRowDataBound="searchGrid_RowDataBound"
                        OnSorting="searchGrid_Sorting" PageSize="15"   Width="100%">
                        <EnhancePagerSettings ShowHeaderPager="True" />

                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:BoundField DataField="fileID" HeaderText="fileID" meta:resourceKey="BoundFieldResource1" Visible="False"></asp:BoundField>
                            <asp:TemplateField HeaderText="檔案名稱" meta:resourceKey="TemplateFieldResource1" SortExpression="title">
                                <ItemTemplate>
                                    <asp:Image ID="imgFile" runat="server" meta:resourceKey="imgFileResource1" />
                                    <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" NavigateUrl='<%# "~/Common/FileCenter/DownloadFile.aspx?id="+Eval("fileID") %>'><%# Eval("title") %></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:BoundField DataField="byteSize" HeaderText="檔案大小" meta:resourceKey="BoundFieldResource2" SortExpression="byteSize"></asp:BoundField>--%>
                            <asp:TemplateField HeaderText="檔案大小" meta:resourceKey="BoundFieldResource2">
                                <ItemTemplate>
                                    <asp:Label ID="lblbyteSize" runat="server" Text='<%# Bind("byteSize") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False"></HeaderStyle>
                                <ItemStyle  HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="上傳日期" meta:resourceKey="BoundFieldResource3" SortExpression="created">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblSearchGridUploadDate" Text='<%# Bind("created") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="False"></ItemStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="sample" HeaderText="檔案內容" HtmlEncode="False" meta:resourceKey="BoundFieldResource5"></asp:BoundField>
                            <asp:TemplateField HeaderText="來源" meta:resourceKey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:Label ID="lbFileSource" runat="server" meta:resourceKey="lbFileSourceResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </Fast:Grid>
                    <asp:HiddenField ID="hideSearchKey" runat="server" />
                    <asp:HiddenField ID="hideSearchScope" runat="server" />
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </ContentTemplate>
    </asp:UpdatePanel>


    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
    <asp:Label ID="msgUseunit" runat="server" Text="已使用容量:" Visible="False" meta:resourcekey="msgUseunitResource1"></asp:Label>
    <asp:Label ID="msgUnitlimit" runat="server" Text="容量上限:" Visible="False" meta:resourcekey="msgUnitlimitResource1"></asp:Label>

    <asp:Label ID="lblModifyDescription" runat="server" Text="修改備註" Visible="False" meta:resourcekey="lblModifyDescriptionResource1"></asp:Label>
    <asp:HiddenField ID="hideBriefcaseSize" runat="server" />
    <asp:HiddenField ID="hideScope" runat="server" />
</asp:Content>