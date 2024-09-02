<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="QUE_Design_QusDesign" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="QusDesign.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <style>
    .SearchBoxMargin {
        margin-top: 2px;
        margin-left: 1px;
    }
    .rbPrimary{
        padding-left:0px !important;
    }
    </style>

    <script type="text/javascript" id="igClientScript">
        function ConfirmSuspend(masterGuid) {
            var data = [masterGuid];
            var status = $uof.pageMethod.sync("GetQueStatus", data);
            if (status == "CL") {

                alert('<%=lblHidStatus.Text %>');
                return false;
            }
            if (!confirm('<%=lblSuspend.Text %>')) {
                $('#<%= hiddenFlag.ClientID %>').val("No");
                return false;
            }
            else {
                $('#<%= hiddenFlag.ClientID %>').val("Yes");
                return true;
            }
        }
        function RadToolBarButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "CatAuth":
                    args.set_cancel(true);
                    var CategoryId = $('#<%= hiddenCategoryId.ClientID %>').val();
                    $uof.dialog.open2("~/QUE/Design/QusCategoryAuthority.aspx", args.get_item(), "<%=lblCate.Text%>", 840, 700, function () { return true; }, { "CategoryId": CategoryId });
                    break;
                case "EditCat":
                    args.set_cancel(true);

                    $uof.dialog.open2("~/QUE/Design/QusCategory.aspx", args.get_item(), "<%=lblCategoryTitle.Text%>", 480, 520, function () { return true; }, { "Type": "Edit" });
                    break;
                case "Add":
                    var CategoryId = $('#<%= hiddenCategoryId.ClientID %>').val();
                    var isExamine = $('#<%= hidisExamine.ClientID %>').val();
                    var Add = 'Add';
                    args.set_cancel(true);
                    $uof.dialog.open2("~/QUE/Design/QusMA.aspx", args.get_item(), "", 900, 780, openDialogResult, { "CategoryId": CategoryId, "Type": "Add", "Examine": isExamine });
                    break;
                case "Delete":
                    var CheckedData = $uof.fastGrid.getChecked('<%= gridQue.ClientID %>');
                    var choose = '<%= lblSelectDelete.Text %>';//信息
                    if (CheckedData == "") {
                        alert(choose);
                        args.set_cancel(true);
                        return;
                    }
                    else {
                        if (!confirm('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ConfirmDelete") %>')) {
                            args.set_cancel(true);
                        }
                    }
                    break;
            }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined') {
                return false;
            }
            return true;
        }

        function ShowAlert(msg) {
            alert(msg);
        }

        Sys.Application.add_load(function () {
            var lblLeftTitle = $("#<%=lblLeftTitle.ClientID%>");
            var txtSearch = $("#<%=txtSearch.ClientID%>");

            txtSearch.attr("placeholder", lblLeftTitle.text());

            txtSearch.keyup(function (e) {
                if ((e.which == 8 && txtSearch.val() == "") ||
                    (e.which == 13 && txtSearch.val() != "") ||
                    (e.which == 46 && txtSearch.val() == "")) {
                    $('#<%= btnSearh.ClientID%>').click();
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBarButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="類別維護" Value="EditCat"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m88.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m88.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m88.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m88.gif"
                        meta:resourcekey="RadToolBarEditCatResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="CatAuthSeparator" meta:resourcekey="RadToolBarButtonResource6"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="類別權限設定" Value="CatAuth"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m42.png"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m42.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m42.png"
                        ImageUrl="~/Common/Images/Icon/icon_m42.png" meta:resourcekey="RadToolBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" meta:resourcekey="RadToolBarButtonResource1" Value="EditCatSeparator" runat="server"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="新增問卷" Value="Add"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m02.gif"
                        meta:resourcekey="RadToolBarAddResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2" Value="AddSeparator" runat="server"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除問卷" Value="Delete"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        meta:resourcekey="RadToolBarDeleteResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" meta:resourcekey="RadToolBarButtonResource3" Value="DeleteSeparator" runat="server"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        meta:resourcekey="RadToolBarQueryResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4" runat="server"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <asp:HiddenField ID="hidTreeNodetoXml" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <table>
                <tr>
                    <td style="width:100%">
                        <asp:TextBox ID="txtSearch" runat="server" Width="100%" CssClass="SearchBoxMargin"></asp:TextBox>
                    </td>
                    <td>
                        <telerik:RadButton ID="btnSearh" runat="server" OnClick="btnSearh_Click">
                            <Icon PrimaryIconUrl="~/Common/Images/Icon/icon_m39.png" PrimaryIconLeft="2px" />
                        </telerik:RadButton>
                    </td>
                </tr>
            </table>
            <telerik:RadTreeView ID="treeCategory" runat="server" OnNodeClick="treeCategory_NodeClick" EnableNodeTextHtmlEncoding="True" meta:resourcekey="treeCategoryResource1"></telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    <table>
        <tr>
            <td>
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/Images/Icon/icon_m178.gif" meta:resourcekey="Image2Resource1" />
            </td>
            <td>
                <asp:Label ID="Label1" runat="server" Text="不需審核" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td style="width: 10px"></td>
            <td>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_m75.png" meta:resourcekey="Image1Resource1" />
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="需審核" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Label ID="lblNoAuthMsg" runat="server" Text="沒有權限維護" ForeColor="Red" Visible="False" meta:resourcekey="lblNoAuthMsgResource1"></asp:Label>
            <table style="width: 100%" id="qusTB" runat="server">
                <tr>
                    <td>
                        <table style="width: 100%" class="PopTable" cellspacing="1">
                            <tr>
                                <td style="white-space: nowrap;">
                                    <asp:Label ID="lblCatLeft" runat="server" Text="類別"
                                        meta:resourcekey="lblCatLeftResource1"></asp:Label>
                                </td>
                                <td style="white-space: nowrap;">
                                    <asp:Label ID="lblCatText" runat="server"
                                        meta:resourcekey="lblCatTextResource1"></asp:Label>
                                </td>
                                <td style="white-space: nowrap;">
                                    <asp:Label ID="lblStateLeft" runat="server" Text="狀態"
                                        meta:resourcekey="lblStateLeftResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlState" runat="server"
                                        meta:resourcekey="ddlStateResource1">
                                        <asp:ListItem Value="ALL" Text="全部" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                        <asp:ListItem Value="DS" Text="製作中" Selected="True" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                        <asp:ListItem Value="AP" Text="審核中" meta:resourcekey="ListItemResource6"></asp:ListItem>
                                        <asp:ListItem Value="DN" Text="拒絕發佈" meta:resourcekey="ListItemResource7"></asp:ListItem>
                                        <asp:ListItem Value="EM" Text="調查中" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                        <asp:ListItem Value="CL" Text="結束" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                        <asp:ListItem Value="SP" Text="中止" meta:resourcekey="ListItemResource5"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="white-space: nowrap;">
                                    <asp:Label ID="lblNameLeft" runat="server" Text="問卷名稱"
                                        meta:resourcekey="lblNameLeftResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" meta:resourcekey="txtNameResource1"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CustomValidator ID="cvMessage" runat="server" ForeColor="Red" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
                        <Fast:Grid ID="gridQue" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                            AutoGenerateColumns="False" DataKeyNames="DESIGN_MASTER_GUID"
                            DataKeyOnClientWithCheckBox="False" EnhancePager="True"
                            OnRowCommand="gridQue_RowCommand" OnRowDataBound="gridQue_RowDataBound" PageSize="15"
                            Width="100%"
                            DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                            KeepSelectedRows="False" meta:resourcekey="gridQueResource2" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                            <EnhancePagerSettings
                                ShowHeaderPager="True" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="問卷名稱" SortExpression="DESIGN_NAME"
                                    meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnName" Style="word-wrap: break-word; overflow-x: hidden;" runat="server" Text='<%#: Eval("DESIGN_NAME") %>'
                                            OnClick="lbtnName_Click" meta:resourcekey="lbtnNameResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="狀態" SortExpression="QUS_MASTER_STATUS"
                                    meta:resourcekey="BoundFieldResource1">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="公開" SortExpression="IS_PUBLISH"
                                    meta:resourcekey="BoundFieldResource2">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="記名" SortExpression="IS_REGISTERED"
                                    meta:resourcekey="BoundFieldResource3">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="發送數" SortExpression="SEND_COUNT"
                                    meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSendCount" runat="server" Text='<%#: Eval("SEND_COUNT") %>'
                                            meta:resourcekey="lblSendCountResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="回收數" SortExpression="SUBMIT_COUNT"
                                    meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSubmitCount" runat="server" Text='<%#: Eval("SUBMIT_COUNT") %>' meta:resourcekey="lblSubmitCountResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" Width="100px" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="調查時間" SortExpression="START_TIME"
                                    meta:resourcekey="BoundFieldResource4">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="25%" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td style="white-space: nowrap;">
                                                    <asp:LinkButton ID="lbtnSend" runat="server" Text="啟用" CommandName="sendQus"
                                                        meta:resourcekey="lbtnSendResource1"></asp:LinkButton>
                                                </td>
                                                <td style="width: 10px"></td>
                                                <td style="white-space: nowrap;">
                                                    <asp:LinkButton ID="lbtnSuspend" runat="server" CommandName="suspendQus"
                                                        Text="中止" meta:resourcekey="lbtnSuspendResource1"></asp:LinkButton>
                                                </td>
                                                <td style="width: 10px"></td>
                                                <td style="white-space: nowrap;">
                                                    <asp:LinkButton ID="lbtnResult" runat="server" Text="回收結果"
                                                        meta:resourcekey="lbtnResultResource1"></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="220px" />
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>

                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
                            SelectCountMethod="QueryQus_Count" SelectMethod="QueryQus" SortParameterName="strSortExpression"
                            StartRowIndexParameterName="intStartIndex" TypeName="Ede.Uof.EIP.QUE.QusUCO">
                            <SelectParameters>
                                <asp:Parameter Name="condition" />
                                <asp:Parameter Name="intStartIndex" />
                                <asp:Parameter Name="intMaxRows" />
                                <asp:Parameter Name="strSortExpression" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblQus" runat="server" Text="問卷維護" Visible="False"
                meta:resourcekey="lblQusResource1"></asp:Label>
            <asp:Label ID="lblType" runat="server" Text="新增/維護填寫人屬性" Visible="False"
                meta:resourcekey="lblTypeResource1"></asp:Label>
            <asp:HiddenField ID="hiddenDelete" runat="server" Value="請選擇要刪除的資料行" />
            <asp:Label ID="lblSelectDelete" runat="server" Text="請選擇要刪除的資料行" Visible="False"
                meta:resourcekey="lblSelectDeleteResource1"></asp:Label>
            <asp:HiddenField ID="hiddenCategoryId" runat="server" />
            <asp:Label ID="lblCate" runat="server" Text="問卷類別權限設定" Visible="False"
                meta:resourcekey="lblCateResource1"></asp:Label>
            <asp:Label ID="lblDS" runat="server" Text="製作中" Visible="False"
                meta:resourcekey="lblDSResource1"></asp:Label>
            <asp:Label ID="lblEM" runat="server" Text="調查中" Visible="False"
                meta:resourcekey="lblEMResource1"></asp:Label>
            <asp:Label ID="lblCL" runat="server" Text="結束" Visible="False"
                meta:resourcekey="lblCLResource1"></asp:Label>
            <asp:Label ID="lblSP" runat="server" Text="中止" Visible="False"
                meta:resourcekey="lblSPResource1"></asp:Label>
            <asp:Label ID="lblPublishY" runat="server" Text="公開" Visible="False"
                meta:resourcekey="lblPublishYResource1"></asp:Label>
            <asp:Label ID="lblPublishN" runat="server" Text="不公開" Visible="False"
                meta:resourcekey="lblPublishNResource1"></asp:Label>
            <asp:Label ID="lblRegisterY" runat="server" Text="記名" Visible="False"
                meta:resourcekey="lblRegisterYResource1"></asp:Label>
            <asp:Label ID="lblRegisterN" runat="server" Text="不記名" Visible="False"
                meta:resourcekey="lblRegisterNResource1"></asp:Label>
            <asp:Label ID="lblViewSendCount" runat="server" Text="瀏覽問卷發送數" Visible="False"
                meta:resourcekey="lblViewSendCountResource1"></asp:Label>
            <asp:Label ID="lblViewSubmitCout" runat="server" Text="瀏覽問卷回收數" Visible="False"
                meta:resourcekey="lblViewSubmitCoutResource1"></asp:Label>
            <asp:HiddenField ID="hiddenSuspend" runat="server" Value="確定中止問卷嗎？" />
            <asp:Label ID="lblSuspend" runat="server" Text="確定中止問卷嗎?" Visible="False"
                meta:resourcekey="lblSuspendResource1"></asp:Label>
            <asp:HiddenField ID="hiddenFlag" runat="server" />
            <asp:Label ID="lblDelete" runat="server" Text="問卷狀態是調查中，不可以刪除" Visible="False"
                meta:resourcekey="lblDeleteResource1"></asp:Label>
            <asp:Label ID="lblSetSendUsers" runat="server" Text="未設定問卷調查對象" Visible="False"
                meta:resourcekey="lblSetSendUsersResource1"></asp:Label>
            <asp:Label ID="lblLinkName" runat="server" Text="請點選此處,填寫問卷。" Visible="False"
                meta:resourcekey="lblLinkNameResource1"></asp:Label>
            <asp:Label ID="lblStatus" runat="server" Text="問卷狀態已為關閉。" Visible="False"
                meta:resourcekey="lblStatusResource1"></asp:Label>
            <asp:HiddenField ID="hiddenStatus" runat="server" Value="該問卷已關閉。" />
            <asp:Label ID="lblHidStatus" runat="server" Visible="False" Text="該問卷已關閉"
                meta:resourcekey="lblHidStatusResource1"></asp:Label>
            <asp:Label ID="lblItemError" runat="server" Text="題目是必填,請編輯題目選項"
                Visible="False" meta:resourcekey="lblItemErrorResource1"></asp:Label>
            <asp:Label ID="lblItemEmpty" runat="server" Text="該問卷沒有題目,不可以發送問卷"
                Visible="False" meta:resourcekey="lblItemEmptyResource1"></asp:Label>
            <asp:Label ID="lblViewResult" runat="server" Text="回收結果" Visible="False"
                meta:resourcekey="lblViewResultResource1"></asp:Label>
            <asp:Label ID="lblSend" runat="server" Text="發送數:" Visible="False"
                meta:resourcekey="lblSendResource1"></asp:Label>
            <asp:Label ID="lblSubmit" runat="server" Text="回收數:" Visible="False"
                meta:resourcekey="lblSubmitResource1"></asp:Label>
            <asp:Label ID="lblRootName" runat="server" Visible="False" Text="全部類別" meta:resourcekey="lblRootNameResource1"></asp:Label>
            <asp:Label ID="lblLeftTitle" runat="server" Text="問卷類別" Style="display:none;" meta:resourcekey="lblLeftTitleResource1"></asp:Label>
            <asp:Label ID="lblAP" runat="server" Text="審核中" ForeColor="Orange" Visible="False" meta:resourcekey="lblAPResource1"></asp:Label>
            <asp:Label ID="lblDN" runat="server" Text="發佈拒絕" Visible="False" meta:resourcekey="lblDNResource1"></asp:Label>
            <asp:Label ID="lblCategoryTitle" runat="server" Text="問卷類別維護" Visible="False" meta:resourcekey="lblCategoryTitleResource1"></asp:Label>
            <asp:Label ID="lblInsertTargetUserMsg" runat="server" Text="已啟用問卷，問卷發送將進入系統排程。" meta:resourcekey="lblInsertTargetUserMsgResource1" Visible="False"></asp:Label>
            <asp:HiddenField ID="hidisExamine" runat="server" />
            <asp:HiddenField ID="hidExaminer" runat="server" />
            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

