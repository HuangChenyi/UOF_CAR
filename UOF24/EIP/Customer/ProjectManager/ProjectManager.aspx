<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_ProjectManager_ProjectManager" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ProjectManager.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
      
        function OnClientButtonClicking(sender, args) {            
            var key = args.get_item().get_value();
            switch (key) {
                case "GetNew":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Customer/ProjectManager/ProjectDialog.aspx", args.get_item(), "<%=lblCreateTitle.Text %>", 600, 550, openDialogResult);
                    break;
                case "Delete":
                    if (!confirm("<%=lblConfirm.Text%>")) {
                        args.set_cancel(true);
                    }
                    break;
            }
        }
        function openDialogResult(returnValue) {            
            if (typeof(returnValue)=="undefined")
                return false;
            else
                return true;
        }        
        
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


    <telerik:RadToolBar ID="RadToolBar1" runat="server" SingleClick="None" OnClientButtonClicking="OnClientButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" Width="100%" meta:resourcekey="RadToolBar1Resource1" >
        <Items>
            <telerik:RadToolBarButton runat="server" Text="新增" Value="GetNew"
                CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m59.gif" meta:resourcekey="RadToolBarButtonResource1">                
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                 CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="txtSearch" meta:resourcekey="RadToolBarButtonResource5">
                <ItemTemplate>
                    <asp:Label ID="lbSearch" runat="server" Text="關鍵字：" meta:resourcekey="lbSearchResource1"></asp:Label>
                    <asp:TextBox ID="txtSearch" runat="server" meta:resourcekey="txtSearchResource1"></asp:TextBox>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="btnDrop" meta:resourcekey="RadToolBarButtonResource7">
                <ItemTemplate>
                    <asp:Label ID="lbStatus" runat="server" Text="狀態：" meta:resourcekey="lbStatusResource1"></asp:Label>
                    <telerik:RadDropDownList ID="ddlStatus" runat="server" SelectedText="全部" Height="40px" Width="89px" meta:resourcekey="ddlStatusResource1">
                        <Items>
                            <telerik:DropDownListItem runat="server" Selected="True" Text="全部" meta:resourcekey="DropDownListItemResource1" />
                            <telerik:DropDownListItem runat="server" Text="草稿" Value="0" meta:resourcekey="DropDownListItemResource2" />
                            <telerik:DropDownListItem runat="server" Text="審核中" Value="1" meta:resourcekey="DropDownListItemResource3" />
                            <telerik:DropDownListItem runat="server" Text="尚未開始" Value="2" meta:resourcekey="DropDownListItemResource4" />
                            <telerik:DropDownListItem runat="server" Text="進行中" Value="3" meta:resourcekey="DropDownListItemResource5" />
                            <telerik:DropDownListItem runat="server" Text="已中止" Value="4" meta:resourcekey="DropDownListItemResource6" />
                            <telerik:DropDownListItem runat="server" Text="已結案" Value="5" meta:resourcekey="DropDownListItemResource7" />
                        </Items>
                    </telerik:RadDropDownList>
                </ItemTemplate>
            </telerik:RadToolBarButton>
<telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource8"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="查詢" Value="Search"                
                 CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource9">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>  
    <Fast:Grid ID="GdProject" runat="server" AutoGenerateCheckBoxColumn="True" AllowSorting="True" AutoGenerateColumns="False"  DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15"   AllowPaging="True" Width="100%" DataKeyNames="PROJ_GUID" OnRowDataBound="GdProject_RowDataBound" OnSorting="GdProject_Sorting" OnBeforeExport="GdProject_BeforeExport" DefaultSortColumnName="PROJ_NBR" OnPageIndexChanging="GdProject_PageIndexChanging" meta:resourcekey="GdProjectResource1" OnRowCommand="GdProject_RowCommand">
<EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

<ExportExcelSettings AllowExportToExcel="True"></ExportExcelSettings>
        <Columns>               
            <asp:TemplateField HeaderText="專案編號" SortExpression="PROJ_NBR" meta:resourcekey="TemplateFieldResource1" >
                <ItemTemplate>
                    <asp:LinkButton ID="lkBtnNumber" runat="server" Text='<%#: Bind("PROJ_NBR") %>' meta:resourcekey="LinkButton2Resource1"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PROJ_NAME" HeaderText="專案名稱" SortExpression="PROJ_NAME" meta:resourcekey="BoundFieldResource1" />            
            <asp:TemplateField HeaderText="專案負責人" SortExpression="PM_NAME" meta:resourcekey="TemplateFieldResource2">
                <ItemTemplate>
                    <asp:Label ID="lblLeader" runat="server" meta:resourcekey="lblLeaderResource1"></asp:Label>
                    <asp:Label ID="lblPMID" runat="server" Text='<%# Eval("PM_RM_ID") %>' Visible="False" meta:resourcekey="lblPMIDResource1"></asp:Label>
                    <asp:Label ID="lblDBLeaderName" runat="server" Text='<%# Eval("PM_NAME") %>' meta:resourcekey="lblDBLeaderNameResource1"></asp:Label>
                    <asp:Label ID="lblDBLeaderGuid" runat="server" Text='<%# Eval("PM_GUID") %>' Visible="False" meta:resourcekey="lblDBLeaderGuidResource1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="專案代理人" SortExpression="AGENT_NAME" meta:resourcekey="TemplateFieldResource3">
                <ItemTemplate>
                    <asp:Label ID="lblAgent" runat="server" meta:resourcekey="lblAgentResource1"></asp:Label>                    
                    <asp:Label ID="lblAgentID" runat="server" Text='<%# Eval("PROJ_AGENT_RM_ID") %>' Visible="False" meta:resourcekey="lblAgentIDResource1"></asp:Label>
                    <asp:Label ID="lblDBAgentName" runat="server" Text='<%# Eval("AGENT_NAME") %>' meta:resourcekey="lblDBAgentNameResource1"></asp:Label>
                    <asp:Label ID="lblDBAgentGuid" runat="server" Text='<%# Eval("AGENT_GUID") %>' Visible="False" meta:resourcekey="lblDBAgentGuidResource1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="狀態" SortExpression="STATUS" meta:resourcekey="TemplateFieldResource4">
                <ItemTemplate>                    
                    <asp:Label ID="lbStatus" runat="server" meta:resourcekey="lbStatusResource2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </Fast:Grid>
                    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label runat="server" Visible="False" ID="lblDrafts" Text="草稿" meta:resourcekey="lblDraftsResource1"></asp:Label>
    <asp:Label runat="server" Visible="False" ID="lblAudit" Text="審核中" meta:resourcekey="lblAuditResource1"></asp:Label>
    <asp:Label runat="server" Visible="False" ID="lblNotStarted" Text="尚未開始" meta:resourcekey="lblNotStartedResource1"></asp:Label>
    <asp:Label runat="server" Visible="False" ID="lblIng" Text="進行中" meta:resourcekey="lblIngResource1"></asp:Label>
    <asp:Label runat="server" Visible="False" ID="lblAborted" Text="已中止" meta:resourcekey="lblAbortedResource1"></asp:Label>
    <asp:Label runat="server" Visible="False" ID="lblFinished" Text="已結案" meta:resourcekey="lblFinishedResource1"></asp:Label>
    <asp:Label runat="server" Visible="False" ID="lblModifyTitle" Text="修改專案編號" meta:resourcekey="lblModifyTitleResource1"></asp:Label>
    <asp:Label runat="server" Visible="False" ID="lblCreateTitle" Text="新增專案編號" meta:resourcekey="lblCreateTitleResource1"></asp:Label>
    <asp:Label runat="server" Visible="False" ID="lblConfirm" Text="確定要刪除嗎?" meta:resourcekey="lblConfirmResource1"></asp:Label>
    <asp:Label ID="lblNull" runat="server" meta:resourcekey="lblNullResource1"></asp:Label>
    </asp:Content>

