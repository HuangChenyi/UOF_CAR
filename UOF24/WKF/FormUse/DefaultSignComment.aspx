<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_DefaultSignComment" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="DefaultSignComment.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register assembly="Ede.Uof.Utility.Component.Grid" namespace="Ede.Uof.Utility.Component" tagprefix="Fast" %>

<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="System.Web.UI" tagprefix="cc1" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <script type="text/javascript" id="telerikClientEvents1">

     function RadToolBar1_ButtonClicking(sender, args) {
         var value = args.get_item().get_value();


         if (value == "Insert") {
             args.set_cancel(true);
             $uof.dialog.open2("~/WKF/FormUse/MaintainSignComment.aspx", args.get_item(), '<%=lblTitle.Text%>', 500, 400, function checkReturn(returnValue) { if (typeof (returnValue) == "undefined") return false; else return true;});
         }

         if (value == "Delete") {
             var postback = confirm("<%=lblDelete.Text %>");
             args.set_cancel(!postback);
         }




     }

 </script>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" meta:resourcekey="UltraWebToolbar1Resource1" OnClientButtonClicking="RadToolBar1_ButtonClicking" Width="100%" OnButtonClick="RadToolBar1_ButtonClick">
        <Items>
            <telerik:RadToolBarButton runat="server" 
              Value="Insert" Text="新增"
              DisabledImageUrl="~/Common/Images/Icon/icon_m23.png" 
              HoveredImageUrl="~/Common/Images/Icon/icon_m23.png" 
              ImageUrl="~/Common/Images/Icon/icon_m23.png" 
              CheckedImageUrl="~/Common/Images/Icon/icon_m23.png" 
                meta:resourcekey="TBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" 
                Value="Delete" Text="刪除"
              DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" 
              HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" 
              ImageUrl="~/Common/Images/Icon/icon_m03.gif" 
              CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                meta:resourcekey="TBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
            </telerik:RadToolBarButton>
        </Items>

    </telerik:RadToolBar>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True" 
                AllowSorting="True" AutoGenerateColumns="False"  
                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
                EnhancePager="True" PageSize="15" 
                  Width="80%" 
                DataKeyNames="COMMENT_ID" onrowdatabound="Grid1_RowDataBound" 
                AllowPaging="True"  
                onpageindexchanging="Grid1_PageIndexChanging" onsorting="Grid1_Sorting" 
                >
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" 
                    FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" 
                    NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" 
                    PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" 
                    PreviousImageUrl="" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="內容" SortExpression="COMMENT_CONTENT" 
                        meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" 
                                meta:resourcekey="LinkButton2Resource1">LinkButton</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("COMMENT_CONTENT") %>' 
                                meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <HeaderStyle Width="100%" Wrap="False" />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />           
        </Triggers>
    </asp:UpdatePanel>
    
    <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" Visible="False" 
        meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="罐頭意見維護" Visible="False"
        meta:resourcekey="lblTitleResource1"></asp:Label>
</asp:Content>

