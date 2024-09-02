<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_OMS_OnlineLookMA" Title="影音維護" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="OnlineLookMA.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">
<!--
    function ibtnShow_Click(MovieID) {
        window.open("OnlineLookShow.aspx?MovieID=" + MovieID + "&PreView=True", "", "height=550, width=670, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no");                
    }

    function OpenDialogResult(returnValue) {        
        if (typeof (returnValue) == 'undefined')
            return false;
        else
            return true;
    }

    function RadToolBar1_ButtonClicking(sender, args) {
        var value = args.get_item().get_value();
        switch (value) {
            case "Create":
                args.set_cancel(true);
                var tree = $find('<%=classTree.ClientID%>');
                var node = tree.get_selectedNode();
                var classID = node.get_value();
                var className = node.get_text();
                var mode = "Add";
                $uof.dialog.open2("~/EIP/OMS/OnlineLookMAEdit.aspx", args.get_item(), "", 600, 580, OpenDialogResult, { "Classid": classID, "Classname": className, "Mode": mode });
                break;
            case "ClassMA":
                args.set_cancel(true);
                $uof.dialog.open2("~/EIP/OMS/ClassSetting.aspx", args.get_item(), "", 600, 600, OpenDialogResult);
                break;
            case "Delete":
                var CheckedData = $uof.fastGrid.getChecked('<%=listGrid.ClientID %>');//得到grid中已經選擇的guid
                if (CheckedData == "" || CheckedData == null) {
                    alert('<%=lblNullSelectedRow.Text %>');
                    args.set_cancel(true);
                    return;
                }
                else {
                    args.set_cancel(!confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>'));
                }
                break;
            case "ClassAuthMA":
                args.set_cancel(true);
                var tree = $find('<%=classTree.ClientID %>');
                var node = tree.get_selectedNode();
                var classID = node.get_value();
                var className = node.get_text();
                $uof.dialog.open2("~/EIP/OMS/ClassAuthSetting.aspx", args.get_item(), "", 600, 500, OpenDialogResult, { "Classid": classID });                
                break;
        }
    }
    // -->
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking" meta:resourcekey="RadToolBar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="類別權限設定" ClickedImageUrl="~/Common/Images/Icon/icon_m105.png" DisabledImageUrl="~/Common/Images/Icon/icon_m105.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m105.png" ImageUrl="~/Common/Images/Icon/icon_m105.png" Value="ClassAuthMA" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="類別維護" ClickedImageUrl="~/Common/Images/Icon/icon_m43.png" DisabledImageUrl="~/Common/Images/Icon/icon_m43.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m43.png" ImageUrl="~/Common/Images/Icon/icon_m43.png" Value="ClassMA" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="新增影音" ClickedImageUrl="~/Common/Images/Icon/icon_m71.png" DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m71.png" ImageUrl="~/Common/Images/Icon/icon_m71.png" Value="Create" meta:resourcekey="RadToolBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除影音" ClickedImageUrl="~/Common/Images/Icon/icon_m03.png" DisabledImageUrl="~/Common/Images/Icon/icon_m03.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.png" ImageUrl="~/Common/Images/Icon/icon_m03.png" Value="Delete" meta:resourcekey="RadToolBarButtonResource7">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource8">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadTreeView ID="classTree" runat="server" OnNodeClick="classTree_NodeClick">
                <Nodes>
                    <telerik:RadTreeNode runat="server" Value="MovieClass" Height="100%"
                        Enabled="False" ImageUrl="~/Common/Images/Icon/icon_m15.png" ForeColor="Black">
                    </telerik:RadTreeNode>
                </Nodes>
            </telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <Fast:Grid ID="listGrid" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                AutoGenerateColumns="False" AllowPaging="True" EnhancePager="True" DefaultSortColumnName="TOPIC"
                DataKeyOnClientWithCheckBox="True"
                PageSize="15" Width="100%"
                OnPageIndexChanging="listGrid_PageIndexChanging" OnSorting="listGrid_Sorting"
                OnRowDataBound="listGrid_RowDataBound" DefaultSortDirection="Ascending"
                DataKeyNames="MOVIE_GUID"  EmptyDataText="沒有資料" KeepSelectedRows="False" meta:resourcekey="listGridResource2"
                CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" >
                <EnhancePagerSettings FirstAltImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_01.gif"
                    FirstImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_01.gif"
                    LastAltImage="&lt;%=themePath %&gt;/images/grid/arrow_04.gif"
                    LastImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_04.gif" NextImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_03.gif"
                    PreviousImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_02.gif"
                    NextIAltImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_03.gif"
                    PreviousAltImageUrl="&lt;%=themePath %&gt;/images/grid/arrow_02.gif"
                    PageInfoCssClass="GridPagerPagerInfo" PageNumberCssClass="GridPagerNumber"
                    PageNumberCurrentCssClass="GridPagerCurrentNumber"
                    PageRedirectCssClass="GridPagerPagerInfoRedirect" ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>

                    <asp:TemplateField HeaderText="檔案名稱" SortExpression="TOPIC"
                        meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnFileName" runat="server" OnClick="lbtnFileName_Click"
                                Text='<%#: Eval("TOPIC") %>' meta:resourcekey="lbtnFileNameResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="維護人員" SortExpression="USER_NAME" meta:resourcekey="BoundFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="lblUserName" runat="server" Text=""></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="張貼日期" DataField="CREATE_DATE"
                        SortExpression="CREATE_DATE" DataFormatString="{0:yyyy/MM/dd}" meta:resourceKey="BoundFieldResource2">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="簡介" SortExpression="CONTEXT"
                        meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblContext" runat="server" Text='<%#: Eval("CONTEXT") %>'
                                meta:resourcekey="lblContextResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="開放起始"
                        DataField="OPEN_DATE" SortExpression="OPEN_DATE"
                        meta:resourcekey="BoundFieldResource3" DataFormatString="{0:d}">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="開放終止" SortExpression="CLOSE_DATE"
                        meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblCloseDate" runat="server"
                                Text='<%#: Eval("CLOSE_DATE","{0:yyyy/MM/dd}") %>'
                                meta:resourcekey="lblCloseDateResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="觀看次數" SortExpression="LOOK_COUNT"
                        meta:resourcekey="TemplateFieldResource4">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnLookCount" runat="server"
                                Text='<%#: Eval("LOOK_COUNT") %>' meta:resourcekey="lbtnLookCountResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle Wrap="False" HorizontalAlign="Right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="預覽" meta:resourcekey="TemplateFieldResource5">
                        <ItemTemplate>
                            <asp:ImageButton ID="ibtnShow" runat="server" ImageUrl="~/EIP/OMS/images/view.gif"
                                CommandArgument='<%#: Eval("FILE_GROUP_ID") %>' OnClick="ibtnShow_Click" EnableTheming="False" UseBrowserDefaults="False" AutoSubmit="false"
                                meta:resourcekey="ibtnShowResource1" />
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
            <asp:Label ID="lblNoAuthMsg" runat="server" Text="沒有權限維護" Visible="false" ForeColor="Red" meta:resourcekey="lblNoAuthMsgResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label runat="server" ID="lblClassTitle" Text="影音類別維護" Visible="False"
        meta:resourcekey="lblClassTitleResource1"></asp:Label>
    <asp:Label ID="msgClass" runat="server" Text="影音類別" Visible="False"
        meta:resourcekey="msgClassResource1"></asp:Label>
    <asp:Label ID="lblFileMA" runat="server" Text="影音資料維護" Visible="False"
        meta:resourcekey="lblFileMAResource1"></asp:Label>
    <asp:Label ID="lblAuthSettingTitle" runat="server" Text="類別權限管理"
        Visible="False" meta:resourcekey="lblAuthSettingTitleResource1"></asp:Label>
    <asp:Label ID="lblOnlineLikeHistoryTitle" runat="server" Text="觀看記錄"
        Visible="False" meta:resourcekey="lblOnlineLikeHistoryTitleResource1"></asp:Label>
    <asp:Label ID="lblNullSelectedRow" runat="server" Text="沒有選擇任何資料"
        Visible="False" meta:resourcekey="lblNullSelectedRowResource1"></asp:Label>
    <asp:Label ID="lblOpenNoLimit" runat="server" Text="永久開放" Visible="False"
        meta:resourcekey="lblOpenNoLimitResource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Visible="false" meta:resourcekey="Label1Resource1" Text="影音類別列表"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
