<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_ListTrackID" Title="字軌設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ListTrackID.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <script type="text/javascript" id="telerikClientEvents1">

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();

            if (value == "AddTrackId") {//編輯字軌
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/FormManagement/ManageTrackID.aspx",args.get_item(),"",400,200,openDialogResult);
            }
            else if (value == "DeleteTrackId") {
                if (confirm('<%=lblConfirmDelete.Text %>') == false)
                    args.set_cancel(true);
            }
        }
        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }
    </script>
    <table>
        <tr>
            <td>
                <telerik:RadToolBar ID="RadToolBar1" runat="server" meta:resourcekey="UltraWebToolbar1Resource1"
                     OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" Width="100%">
                    <Items>
                        <telerik:RadToolBarButton runat="server" 
                            Text="新增字軌" 
                            HoveredImageUrl="~/System/icon_images/icon_m02.gif" 
                            ImageUrl="~/System/icon_images/icon_m02.gif" 
                            Value="AddTrackId" 
                            CheckedImageUrl="~/System/icon_images/icon_m02.gif" 
                            DisabledImageUrl="~/System/icon_images/icon_m02.gif" 
                            meta:resourcekey="TBarButtonResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value = "s1" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server"  
                            Text="刪除字軌" 
                            HoveredImageUrl="~/System/icon_images/icon_m03.gif" 
                            ImageUrl="~/System/icon_images/icon_m03.gif"
                            Value="DeleteTrackId" 
                            CheckedImageUrl="~/System/icon_images/icon_m03.gif" 
                            DisabledImageUrl="~/System/icon_images/icon_m03.gif"
                            meta:resourcekey="TBarButtonResource2">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value = "s2" IsSeparator="True" Text="Button 3" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel id="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                    <contenttemplate>
<fast:grid id="Grid1" runat="server"  
                            Width="100%" DataKeyNames="TRACK_ID"   
                            onrowdatabound="Grid1_RowDataBound" autogeneratecolumns="False" 
                            autogeneratecheckboxcolumn="True" allowsorting="True" __designer:wfdid="w15" 
                            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
                            EnhancePager="True" PageSize="15">
    <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" 
        LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" 
        PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" 
        PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
    <ExportExcelSettings AllowExportToExcel="False" />
    <Columns>
                        <asp:TemplateField HeaderText="字軌" meta:resourcekey="TemplateFieldResource1">
                            <itemtemplate>
<asp:LinkButton runat="server" ID="LinkButton1" Text='<%#: Eval("TRACK_ID") %>' meta:resourceKey="LinkButton1Resource1" __designer:wfdid="w10"></asp:LinkButton>


</itemtemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TRACK_DESC" HeaderText="字軌說明" meta:resourcekey="BoundFieldResource1" />
                        <asp:TemplateField Visible="False" meta:resourcekey="TemplateFieldResource2">
                            <edititemtemplate>
<asp:TextBox runat="server" Text='<%#: Bind("IS_USED") %>' ID="TextBox1" meta:resourceKey="TextBox1Resource1" __designer:wfdid="w22"></asp:TextBox>


</edititemtemplate>
                            <itemtemplate>
<asp:Label runat="server" Text='<%#: Bind("IS_USED") %>' ID="lblIsUsed" meta:resourceKey="lblIsUsedResource1" __designer:wfdid="w21"></asp:Label>


</itemtemplate>
                        </asp:TemplateField>
</Columns>
</fast:grid>
</contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel>

            </td>
        </tr>
    </table>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblSystemDefault" runat="server" Text="系統預設字軌(一)" Visible="False" meta:resourcekey="lblSystemDefaultResource1"></asp:Label> 
    <asp:Label ID="lblSystemDefault2" runat="server" Text="系統預設字軌(二)" Visible="False" meta:resourcekey="lblSystemDefaultResource2"></asp:Label>
</asp:Content>

