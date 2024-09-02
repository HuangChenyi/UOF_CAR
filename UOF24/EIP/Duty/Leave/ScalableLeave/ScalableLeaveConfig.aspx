<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Leave_ScalableLeave_ScalableLeaveConfig" Codebehind="ScalableLeaveConfig.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register assembly="Ede.Uof.Utility.Component.Grid" namespace="Ede.Uof.Utility.Component" tagprefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript"  >
        function RadToolBarButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Add":
                    args.set_cancel(true);
                    var Type = "add";
                    $uof.dialog.open2("~/EIP/Duty/Leave/ScalableLeave/MaintainScalableLeave.aspx", args.get_item(), '<%=lblDialogTitle.Text %>', 500, 260, openDialogResult, { "type": Type });

                    break;
                case "Delete":

                    if (!confirm('<%=lblDeleteMsg.Text %>')) {
                        args.set_cancel(true);
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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style=" width:100%;">
                <tr>
                    <td>
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBarButtonClicking">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Text="新增" Value="Add"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                    meta:resourcekey="RadToolBarAddResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    meta:resourcekey="RadToolBarDeleteResource1">
                                </telerik:RadToolBarButton>
                                 <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                 <telerik:RadToolBarButton runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="lblYear" runat="server" Text="年度" meta:resourcekey="lblYearResource1"></asp:Label>
                                    </ItemTemplate>
                                 </telerik:RadToolBarButton>
                                 <telerik:RadToolBarButton runat="server" Value="year">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlYear" runat="server"></asp:DropDownList>
                                    </ItemTemplate>
                                 </telerik:RadToolBarButton>
                                 <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                 <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    meta:resourcekey="RadToolBarQueryResource1">
                                 </telerik:RadToolBarButton>
                                 <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td>
                        <Fast:Grid ID="Grid1" DataKeyNames="SCALABLE_DATE,YEAR" runat="server" 
                            Width="100%" AllowPaging="True" 
                            AllowSorting="True" AutoGenerateCheckBoxColumn="True" 
                            AutoGenerateColumns="False"  
                            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
                            EmptyDataText="沒有資料" EnableModelValidation="True" EnhancePager="True" 
                            KeepSelectedRows="False" PageSize="15"  
                             DefaultSortColumnName="SCALABLE_DATE" 
                            onpageindexchanging="Grid1_PageIndexChanging" 
                            onrowdatabound="Grid1_RowDataBound" onsorting="Grid1_Sorting" 
                            meta:resourcekey="Grid1Resource1">
                        <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>
                        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                            <Columns>
                                <asp:TemplateField HeaderText="日期"  ItemStyle-Width="30px"  
                                    ItemStyle-HorizontalAlign="Center"  SortExpression="SCALABLE_DATE" 
                                    meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnDate" runat="server" 
                                            meta:resourcekey="lbtnDateResource1" OnClick="lbtnDate_Click"></asp:LinkButton>
                                    </ItemTemplate>

<ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                </asp:TemplateField>
                                <asp:BoundField DataField="SCALABLE_NAME" HeaderText="名稱" 
                                    SortExpression="SCALABLE_NAME" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="REMARK" HeaderText="備註" SortExpression="REMARK" 
                                    meta:resourcekey="BoundFieldResource2" />
                            </Columns>
                        </Fast:Grid>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>        
<asp:Label ID="lblDialogTitle" runat="server" Text="新增/維䕶彈休假" Visible="False" 
        meta:resourcekey="lblDialogTitleResource1" ></asp:Label>
<asp:HiddenField ID="hfIsDelete" runat="server" />
<asp:Label ID="lblDeleteMsg" runat="server" Text="確定刪除?" Visible="False" 
        meta:resourcekey="lblDeleteMsgResource1" ></asp:Label>
</asp:Content>

