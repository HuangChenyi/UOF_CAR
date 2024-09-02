<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_YearLeaveDays_Default" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="Default.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="System.Web.UI" tagprefix="cc1" %>
<%@ Register Src="~/Common/Organization/UC_DeptManagerTree.ascx" TagPrefix="uc1" TagName="UC_DeptManagerTree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">

    <script type="text/javascript">
        function RadToolBarButtonClicking(sender, args) {
            var hidSignCount = $("#<%= hidSignCount.ClientID %>");
            var lblErrorYearLeave = $("#<%= lblErrorYearLeave.ClientID %>");
            var hidYear = $("#<%= hidYear.ClientID %>").val();
            var hidError = $("#<%= hidError.ClientID %>");
            var key = args.get_item().get_value();
            var data = [hidYear];
            //2015/1/20 Cody 前端不擋
            switch (key) {
                case "ImportYearLeave":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Duty/YearLeaveDays/ImportYearLeaveInfo.aspx", args.get_item(), "", 550, 500, openDialogResult);
                    break;
                case "CreateNextYearLeave":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Duty/YearLeaveDays/CreateNextYearLeave.aspx", args.get_item(), "", 550, 650, openDialogResult);
                    break;
                case "DeleteYearLeave":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Duty/YearLeaveDays/DeleteYearLeave.aspx", args.get_item(), "<%=lblDeleteYearLeave.Text%>", 550, 650, openDialogResult);
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
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBarButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="匯入年休" ToolTip="匯入年休" Value="ImportYearLeave"
                CheckedImageUrl="~/Common/Images/Icon/icon_m110.png"
                DisabledImageUrl="~/Common/Images/Icon/icon_m110.png"
                HoveredImageUrl="~/Common/Images/Icon/icon_m110.png"
                ImageUrl="~/Common/Images/Icon/icon_m110.png"
                meta:resourcekey="RadToolBarImportResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="產生年休" Value="CreateNextYearLeave"
                CheckedImageUrl="~/Common/Images/Icon/icon_m90.png"
                DisabledImageUrl="~/Common/Images/Icon/icon_m90.png"
                HoveredImageUrl="~/Common/Images/Icon/icon_m90.png"
                ImageUrl="~/Common/Images/Icon/icon_m90.png"
                meta:resourcekey="RadToolBarCreateResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource6"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="刪除年休" Value="DeleteYearLeave"
                CheckedImageUrl="~/Common/Images/Icon/icon_m03.png"
                DisabledImageUrl="~/Common/Images/Icon/icon_m03.png"
                HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                ImageUrl="~/Common/Images/Icon/icon_m03.png"
                meta:resourcekey="RadToolBarDeleteResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource3">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text="查詢年度"  meta:resourcekey="RadToolBarYearResource1"></asp:Label>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="Year" meta:resourcekey="RadToolBarButtonResource4">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlYear" runat="server" meta:resourcekey="ddlYearResource1" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource3"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="user" meta:resourcekey="RadToolBarButtonResource5">
                <ItemTemplate>
                    <asp:Label ID="lblMember" runat="server" Text="人員" meta:resourcekey="lblMemberResource1"></asp:Label>
                    <asp:TextBox ID="Keyword" runat="server" meta:resourcekey="KeywordResource1"></asp:TextBox>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource9"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="subDept" meta:resourcekey="RadToolBarButtonResource7">
                <ItemTemplate>
                    <asp:CheckBox ID="cbxDept" runat="server" Text="包含子部門" meta:resourcekey="cbxDeptResource1" />
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource8"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="查詢" ToolTip="查詢" Value="Search"
                CheckedImageUrl="~/Common/Images/Icon/icon_m39.png"
                DisabledImageUrl="~/Common/Images/Icon/icon_m39.png"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.png"
                ImageUrl="~/Common/Images/Icon/icon_m39.png"
                meta:resourcekey="RadToolBarSearchResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource6"></telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <uc1:UC_DeptManagerTree runat="server" ID="UC_DeptManagerTree" ShowDeptManagerTree="true" ShowDeptPersonalTree="false" ShowSuperiorTree="false" DisplayActiveControl="true"/>                                 
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate> 
                <asp:CustomValidator ID="cvError" runat="server" Display="None" meta:resourcekey="cvErrorResource1" ></asp:CustomValidator>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1" />                  
                 
                <Fast:Grid ID="gridLeave" runat="server" AutoGenerateCheckBoxColumn=False AllowSorting="True" AutoGenerateColumns="False"                    
                           DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Descending" DefaultSortColumnName="ARRIVE_DATE" EmptyDataText="沒有資料" 
                           EnhancePager="True" PageSize="15" AllowPaging="True" onrowcommand="gridLeave_RowCommand" onrowdatabound="gridLeave_RowDataBound"          
                           onpageindexchanging="gridLeave_PageIndexChanging" onsorting="gridLeave_Sorting" KeepSelectedRows="False"              
                           meta:resourcekey="gridLeaveResource1" Width="100%" OnBeforeExport="gridLeave_BeforeExport" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">            
                    <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" /> 
                    <ExportExcelSettings AllowExportToExcel="True" DataSourceType="ObjectDataSource" />                    
                        <Columns>
                            <asp:BoundField DataField="GROUP_NAME" HeaderText="部門"  
                                SortExpression="GROUP_NAME" meta:resourcekey="BoundFieldResource1" >
                            <ItemStyle Width=120px Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="姓名" SortExpression="NAME" 
                                meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnName" CommandName="lbtnName" runat="server" meta:resourcekey="lbtnNameResource1"></asp:LinkButton>
                                    <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                                </ItemTemplate>                                    
                                <ItemStyle Width="180px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ACCOUNT" HeaderText="帳號"  
                                SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource2" >
                            <ItemStyle Width="120px" Wrap="False"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="EMPLOYEE_NO" HeaderText="工號"  
                                SortExpression="EMPLOYEE_NO" meta:resourcekey="EMPLOYEE_NOResource2" >
                            <ItemStyle Width="100px" Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ARRIVE_DATE" HeaderText="到職日"  SortExpression="ARRIVE_DATE"
                                DataFormatString="{0:yyyy/MM/dd}" meta:resourcekey="BoundFieldResource3" >                                
                            <ItemStyle Width=80px Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="年資" SortExpression="YEARTH" 
                                meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:Label ID="lblCreated" runat="server" 
                                        meta:resourcekey="lblCreatedResource1"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Wrap="False"/>                                    
                            </asp:TemplateField>
                            <asp:BoundField DataField="YEARTH" HeaderText="年資" Visible="False" 
                                SortExpression="YEARTH" meta:resourcekey="BoundFieldResource4">
                            <ItemStyle HorizontalAlign="Right" Wrap="False" />                                
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="總年休" 
                                meta:resourcekey="TemplateFieldResource3" >
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalDays" runat="server" 
                                        meta:resourcekey="lblTotalDaysResource1"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Wrap=False  />                                    
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="本年度可休" SortExpression="LEAVE_DAYS" 
                                meta:resourcekey="TemplateFieldResource4">
                                <ItemTemplate>
                                    <asp:Label ID="lblThisYearLeavedays" runat="server" 
                                        Text='<%# Bind("LEAVE_DAYS", "{0:#,##0.##}") %>' 
                                        meta:resourcekey="lblThisYearLeavedaysResource1"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="本年度已用" DataField="USED_DAYS" SortExpression="USED_DAYS" DataFormatString="{0:#,##0.##}"  
                                meta:resourcekey="ThisYearUsedResource4" >
                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="REMINDER_DAYS" HeaderText="本年度剩餘"  SortExpression="REMINDER_DAYS"
                                DataFormatString="{0:#,##0.##}" meta:resourcekey="BoundFieldResource12" >                                
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="單位"  
                                meta:resourcekey="lblThisYearUnitResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblThisYearUnit" runat="server"                                         
                                        meta:resourcekey="lblThisYearUnitResource2"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="LEAVE_DAYS_BEGIN" HeaderText="本年度可用起"  SortExpression="LEAVE_DAYS_BEGIN"
                                DataFormatString="{0:yyyy/MM/dd}" meta:resourcekey="BoundFieldResource6" >                                
                            </asp:BoundField>
                            <asp:BoundField DataField="LEAVE_DAYS_END" HeaderText="本年度可用訖"  SortExpression="LEAVE_DAYS_END"
                                DataFormatString="{0:yyyy/MM/dd}" meta:resourcekey="BoundFieldResource7" >                                
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="去年度保留" 
                                 SortExpression="LAST_YEAR_LEAVE_DAYS"
                                meta:resourcekey="TemplateFieldResource5">
                                <ItemTemplate>
                                    <asp:Label ID="lblLastYearLeavedays" runat="server" 
                                        Text='<%# Bind("LAST_YEAR_LEAVE_DAYS", "{0:#,##0.##}") %>' 
                                        meta:resourcekey="lblLastYearLeavedaysResource1"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="去年度已用" DataField="LAST_USED_DAYS" SortExpression="LAST_USED_DAYS" DataFormatString="{0:#,##0.##}"  
                                meta:resourcekey="LastYearUsedResource4" >
                                <ItemStyle HorizontalAlign="Right" Wrap="False" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LAST_REMINDER_DAYS" HeaderText="去年度剩餘"  SortExpression="LAST_REMINDER_DAYS"
                                DataFormatString="{0:#,##0.##}" meta:resourcekey="BoundFieldResource11" >                                
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="單位"  
                                meta:resourcekey="lblLastYearUnitResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblLastYearUnit" runat="server"                                         
                                        meta:resourcekey="lblLastYearUnitResource2"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="LAST_YEAR_LEAVE_DAYS_BEGIN" HeaderText="去年度可用起"  SortExpression="LAST_YEAR_LEAVE_DAYS_BEGIN"
                                DataFormatString="{0:yyyy/MM/dd}" meta:resourcekey="BoundFieldResource9" >                                
                            </asp:BoundField>
                            <asp:BoundField DataField="LAST_YEAR_LEAVE_DAYS_END" HeaderText="去年度可用訖"  SortExpression="LAST_YEAR_LEAVE_DAYS_END"
                                DataFormatString="{0:yyyy/MM/dd}" meta:resourcekey="BoundFieldResource10">                                
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="異動記錄" meta:resourcekey="TemplateFieldResource6">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnModify" CausesValidation="false" Visible="false" runat="server" Text="異動記錄" meta:resourcekey="lbtnModifyResource1"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle Wrap="False" />
                </Fast:Grid>
             </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblSearch" runat="server" Visible="False" meta:resourcekey="lblSearchResource1" ></asp:Label>
    <asp:Label ID="lblCreatedShowText" runat="server" Text="未產生" Visible="False" meta:resourcekey="lblCreatedShowTextResource1" ></asp:Label>
    <asp:Label ID="lblNoArriveDate" runat="server" Text="無到職日" Visible="False" meta:resourcekey="lblNoArriveDateResource1" ></asp:Label>
    <asp:Label ID="lblNotArrive" runat="server" Text="尚未到職" Visible="False" meta:resourcekey="lblNotArriveResource1" ></asp:Label>
    <asp:HiddenField ID="hidSignCount" runat="server" />
    <asp:HiddenField ID="hidYear" runat="server" />
    <asp:HiddenField ID="hidError" Value="false" runat="server" />
    <asp:Label ID="lblErrorYearLeave" runat="server" style="display:none" ForeColor="Red" Text="尚有審核中的年休假單,不可產生年休假資訊!"  meta:resourcekey="lblErrorYearLeaveResource1"  ></asp:Label>
    <asp:Label ID="lblHour" runat="server"  Visible="False"  Text="小時" meta:resourcekey="lblHourResource1"  ></asp:Label>
    <asp:Label ID="lblDay" runat="server" Visible="False" Text="天" meta:resourcekey="lblDayResource1"  ></asp:Label>
    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="內部組織結構列表" Visible="False"></asp:Label>
    <asp:Label ID="lblModifyTitle" runat="server" Text="異動記錄" Visible="false" meta:resourcekey="lblModifyTitleResource1"></asp:Label>
    <asp:Label ID="lblDeleteYearLeave" runat="server" Text="刪除年休資訊" Visible="false" meta:resourcekey="lblDeleteYearLeaveResource1"></asp:Label>
</asp:Content>