<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_TimeTable_Default" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="Default.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/Organization/UC_DeptManagerTree.ascx" TagPrefix="uc1" TagName="UC_DeptManagerTree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">
        function RadToolBar1ButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            var tree = $find('<%=UC_DeptManagerTree.TreeClientId%>');
            switch (key) {
                case "ApplyTimeTable":
                    args.set_cancel(true);
                    var node = tree.get_selectedNode();
                    if (node != null) {
                        $uof.dialog.open2("~/EIP/Duty/TimeTable/Apply.aspx", args.get_item(), "", 1480, 768, openDialogResult);
                    }
                    break;
                case "ImportTimeTable":
                    args.set_cancel(true);
                    var node = tree.get_selectedNode();
                    if (node != null) {
                        $uof.dialog.open2("~/EIP/Duty/TimeTable/Import.aspx", args.get_item(), "", 600, 600, openDialogResult);
                    }
                    break;
                case "AddHoliday":
                    args.set_cancel(true);
                    var node = tree.get_selectedNode();
                    if (node != null) {
                        var groupID = node.get_value();
                        $uof.dialog.open2("~/EIP/OrganizationCalendar/CreateHoliday.aspx", args.get_item(), "", 1350, 450, openDialogResult, { "groupid": groupID });
                    }
                    break;
                case "ImportTimeTableByEmpNo":
                    var node = tree.get_selectedNode();
                    args.set_cancel(true);
                    if (node != null) {
                        $uof.dialog.open2("~/EIP/Duty/TimeTable/ImportDutyByEmpNo.aspx", args.get_item(), "", 600, 600, openDialogResult);
                    }
                    break;
                case "ExportTimeTable":
                    var node = tree.get_selectedNode();
                    args.set_cancel(true);
                    if (node != null) {
                        $uof.dialog.open2("~/EIP/Duty/TimeTable/ExportTimeTable.aspx", args.get_item(), "" , 600, 500, openDialogResult);
                    }
                    break;
            }
        }

        function openDialogResult(returnValue) {
            if (returnValue === '' || returnValue === null)
                return false;
            else
                return true;
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBar1ButtonClicking" meta:resourcekey="RadToolBar1Resource2" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="產生班表" ToolTip="產生班表" Value="ApplyTimeTable"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        meta:resourcekey="rdToolBarApplyTimeTableResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="匯入班表" ToolTip="匯入班表" Value="ImportTimeTable"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        meta:resourcekey="rdToolBarImportTimeTableResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="依工號匯入班表" ToolTip="依工號匯入班表" Value="ImportTimeTableByEmpNo"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        meta:resourcekey="rdToolBarImportTimeTableByEmpNoResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="匯出班表" ToolTip="匯出班表" Value="ExportTimeTable"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m144.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m144.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m144.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m144.gif"
                        meta:resourcekey="rdToolBarExportTimeTableResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="新增假日" ToolTip="新增假日" Value="AddHoliday"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m70.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m70.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m70.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m70.gif"
                        meta:resourcekey="rdToolBarAddHolidayResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="s1" IsSeparator="true"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="假日清單" ToolTip="假日清單" Value="ViewHolidayList"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m84_g.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m84_g.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m84_g.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m84_g.gif"
                        meta:resourcekey="rdToolBarViewHolidayListResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource12"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="User" meta:resourcekey="RadToolBarButtonResource13">
                        <ItemTemplate>
                            <asp:TextBox ID="Keyword" runat="server" width="120px" meta:resourcekey="KeywordResource2"></asp:TextBox>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="搜尋人員" ToolTip="搜尋人員" Value="Search"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        meta:resourcekey="rdToolBarSearchResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource14"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </ContentTemplate>
    </asp:UpdatePanel>    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <contenttemplate>
            <uc1:UC_DeptManagerTree runat="server" id="UC_DeptManagerTree" ShowDeptManagerTree="true" ShowDeptPersonalTree="false" ShowSuperiorTree="false" DisplayActiveControl="true"/>
        </contenttemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <contenttemplate>
            <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                AutoGenerateColumns="False" DataKeyNames="USER_GUID"  
                Width="100%" OnRowDataBound="Grid1_RowDataBound" 
                OnPageIndexChanging="Grid1_PageIndexChanging" OnSorting="Grid1_Sorting" DataKeyOnClientWithCheckBox="False"
                PageSize="15" DefaultSortDirection="Ascending" EnhancePager="True"
                DefaultSortColumnName="ACCOUNT" EmptyDataText="沒有資料" KeepSelectedRows="False"
                meta:resourcekey="Grid1Resource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="帳號" ShowHeader="False" SortExpression="ACCOUNT" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("ACCOUNT") %>' OnClick="LinkButton1_Click"
                                meta:resourcekey="LinkButton1Resource1"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NAME" HeaderText="名稱" SortExpression="NAME" meta:resourcekey="BoundFieldResource1" />
                    <asp:TemplateField HeaderText="帳號停用" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblSuppend" meta:resourcekey="lblSuppendResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EXPIRE_DATE" DataFormatString="{0:d}" HtmlEncode="False"
                        HeaderText="到期日" SortExpression="EXPIRE_DATE" meta:resourcekey="BoundFieldResource2" />
                    <asp:BoundField DataField="EMAIL" HeaderText="電子郵件" SortExpression="EMAIL" meta:resourcekey="BoundFieldResource3" />
                </Columns>
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
            </Fast:Grid>
        </contenttemplate>
    </asp:UpdatePanel>
    <asp:Label ID="Label1" runat="server" Text="內部組織結構列表" meta:resourcekey="Label1Resource1" Visible="False"></asp:Label>
    <asp:Label runat="server" ID="lbYes" Text="是" Visible="False" meta:resourcekey="lbYesResource1"></asp:Label>
    <asp:Label runat="server" ID="lbNo" Text="否" Visible="False" meta:resourcekey="lbNoResource1"></asp:Label>
    <asp:Label runat="server" ID="lblApplyTitle" Text="產生班表" Visible="False" meta:resourcekey="lblApplyTitleResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
