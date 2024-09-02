<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_TourAllowance_Default" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="Default.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../../Common/Organization/DepartmentTree.ascx" TagName="DepartmentTree" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="System.Web.UI" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">
        function RadToolBar1ButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "ImportTourAllowance":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Duty/TourAllowance/ImportTourAllowance.aspx", args.get_item(), '', 450, 450, openDialogResult);
                    break;
                case "CreateTourAllowance":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Duty/TourAllowance/CreateTourAllowance.aspx", args.get_item(), '', 450, 450, openDialogResult);
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
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" 
                    OnButtonClick="RadToolBar1_OnButtonClick"  
                    OnClientButtonClicking="RadToolBar1ButtonClicking" 
                    meta:resourcekey="RadToolBar1Resource1" >
        <Items>
            <telerik:RadToolBarButton runat="server" Text="匯入旅遊補助資訊" Value="ImportTourAllowance"
                CheckedImageUrl="~/Common/Images/Icon/icon_m110.png"
                DisabledImageUrl="~/Common/Images/Icon/icon_m110.png"
                HoveredImageUrl="~/Common/Images/Icon/icon_m110.png"
                ImageUrl="~/Common/Images/Icon/icon_m110.png" 
                meta:resourcekey="RadToolBarButtonResource1" Owner="">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="True" runat="server" 
                meta:resourcekey="RadToolBarButtonResource2" Owner=""></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="產生旅遊補助資訊" Value="CreateTourAllowance"
                CheckedImageUrl="~/Common/Images/Icon/icon_m90.png"
                DisabledImageUrl="~/Common/Images/Icon/icon_m90.png"
                HoveredImageUrl="~/Common/Images/Icon/icon_m90.png"
                ImageUrl="~/Common/Images/Icon/icon_m90.png" 
                meta:resourcekey="RadToolBarButtonResource3" Owner="">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="True" runat="server" 
                meta:resourcekey="RadToolBarButtonResource4" Owner=""></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" 
                meta:resourcekey="RadToolBarButtonResource5" Owner="">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text="查詢年度" 
                        meta:resourcekey="Label2Resource1"></asp:Label>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="year" 
                meta:resourcekey="RadToolBarButtonResource6" Owner="">
                <ItemTemplate>
                        <asp:DropDownList ID="ddlYear" runat="server" 
                            meta:resourcekey="ddlYearResource1" >
                    </asp:DropDownList>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="True" runat="server" 
                meta:resourcekey="RadToolBarButtonResource7" Owner=""></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="user" 
                meta:resourcekey="RadToolBarButtonResource8" Owner="">
                <ItemTemplate>
                    <asp:TextBox ID="Keyword" runat="server" meta:resourcekey="KeywordResource1"></asp:TextBox>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="搜尋人員" Value="Search"
                CheckedImageUrl="~/Common/Images/Icon/icon_m39.png"
                DisabledImageUrl="~/Common/Images/Icon/icon_m39.png"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.png"
                ImageUrl="~/Common/Images/Icon/icon_m39.png" 
                meta:resourcekey="RadToolBarButtonResource9" Owner="">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="True" runat="server" 
                meta:resourcekey="RadToolBarButtonResource10" Owner=""></telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <uc1:DepartmentTree ID="DepartmentTree1" runat="server" DisplayActiveControl="true"/>                        
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"  RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
                <asp:CustomValidator ID="cvError" runat="server" Display="None" meta:resourcekey="cvErrorResource1" ></asp:CustomValidator>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1"/>         
                <Fast:Grid ID="gridTourAllowance" runat="server" AutoGenerateCheckBoxColumn=False 
                    AllowSorting="True" AutoGenerateColumns="False"  
                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Descending" DefaultSortColumnName="ARRIVE_DATE"
                    EmptyDataText="沒有資料" EnhancePager="True" 
                    PageSize="15"   AllowPaging="True" 
                    onrowcommand="gridTourAllowance_RowCommand"
                    onrowdatabound="gridTourAllowance_RowDataBound" 
                    onpageindexchanging="gridTourAllowance_PageIndexChanging" 
                    onsorting="gridTourAllowance_Sorting" KeepSelectedRows="False" 
                    Width="100%"  
                    meta:resourcekey="gridTourAllowanceResource1"  
                    >
                    <EnhancePagerSettings ShowHeaderPager="True" />
                    <ExportExcelSettings AllowExportToExcel="False" />
                    <Columns>
                        <asp:BoundField DataField="GROUP_NAME" HeaderText="部門"  
                            SortExpression="GROUP_NAME" meta:resourcekey="BoundFieldResource1" >
                        <ItemStyle Width=120px />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="姓名(帳號)" SortExpression="NAME" 
                            meta:resourcekey="TemplateFieldResource1" >
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnName" CommandName="lbtnName" runat="server" 
                                    Text='<%#: Bind("NAME") %>' meta:resourcekey="lbtnNameResource1" ></asp:LinkButton>
                                <asp:Label ID="lblName" runat="server" Text='<%#: Bind("NAME") %>' 
                                    meta:resourcekey="lblNameResource1" ></asp:Label>
                            </ItemTemplate>
                                    
                            <ItemStyle Width="180px" Wrap="False" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ACCOUNT" HeaderText="帳號" Visible="False" 
                            SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource2"  >
                        <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="到職日" SortExpression="ARRIVE_DATE" 
                            meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <asp:Label ID="lblArrive" runat="server" 
                                    Text='<%# Bind("ARRIVE_DATE", "{0:yyyy/MM/dd}") %>' 
                                    meta:resourcekey="lblArriveResource1"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="80px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="年資" SortExpression="YEARTH" 
                            meta:resourcekey="TemplateFieldResource3" >
                            <ItemTemplate>
                                <asp:Label ID="lblCreated" runat="server" 
                                    meta:resourcekey="lblCreatedResource1" ></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" Wrap="False"/> 
                        </asp:TemplateField>
                        <asp:BoundField DataField="YEARTH" HeaderText="年資" Visible="False" 
                            SortExpression="YEARTH" meta:resourcekey="BoundFieldResource3" >
                        <ItemStyle HorizontalAlign="Right" />
                                
                        </asp:BoundField>
                        <asp:BoundField HeaderText="可補助金額" DataField="TOTAL_AMOUNT" 
                            DataFormatString="{0:#,0}" SortExpression="TOTAL_AMOUNT" 
                            meta:resourcekey="BoundFieldResource4" >
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="使用狀況" DataField="ACTIVE" SortExpression="ACTIVE" 
                            Visible="False" meta:resourcekey="BoundFieldResource5" />
                        <asp:TemplateField HeaderText="使用狀況" SortExpression="ACTIVE" 
                            meta:resourcekey="TemplateFieldResource4" >
                            <ItemTemplate>
                                <asp:Label ID="lblUseStatus" runat="server" 
                                    meta:resourcekey="lblUseStatusResource1" ></asp:Label>
                            </ItemTemplate>
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
        
    <%--  //shanna add check year leave sign 20120510--%>
    <asp:HiddenField ID="hidSignCount" runat="server" />
    <asp:HiddenField ID="hidYear" runat="server" />
    <asp:HiddenField ID="hidError" Value="false" runat="server" />
    <asp:Label ID="lblErrorYearLeave" runat="server" style="display:none" ForeColor="Red" Text="尚有審核中的年休假單,不可產生年休假資訊!" meta:resourcekey="lblErrorYearLeaveResource1"  ></asp:Label>   
    <asp:Label ID="lblNotUse" runat="server" Text="未使用" Visible="False" meta:resourcekey="lblNotUseResource1"></asp:Label>
    <asp:Label ID="lblUsed" runat="server" Text="已使用" Visible="False" meta:resourcekey="lblUsedResource1"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="內部組織結構列表" meta:resourcekey="Label1Resource1" Visible="false"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

