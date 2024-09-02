<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Admin_SetTrigger_Dialog" Title="呼叫外部組件設定維護" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetTrigger_Dialog.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript" id="telerikClientEvents1">
        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "InsertButton") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/Admin/AddTrigger.aspx", args.get_item(), '<%=hfTriggerTitleName.Value %>', 550, 350, openDialogResult, {"Action":"Insert"});
             }
             if (value == "DeleteButton") {
                 if (confirm('<%=lblDelete.Text %>') == false)
                     args.set_cancel(true);
             }
             if (value == "TriggerClassType") {
                 args.set_cancel(false);
                 $uof.dialog.open2("~/WKF/Admin/AddTriggerCalss.aspx", args.get_item(), "", 380, 530, openDialogResult);
             }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefinded") {
                return false;
            }
            return true;
        }

    </script>
    <table cellpadding="0" cellspacing="0" width="100%" border="0">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <contenttemplate>         
                    <telerik:RadToolBar ID="RadToolBar1" Runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="UltraWebToolbar1Resource1">

                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="分類管理" 
                                DisabledImageUrl="~/Common/Images/Icon/icon_m43.gif" 
                                HoveredImageUrl="~/Common/Images/Icon/icon_m43.gif" 
                                ImageUrl="~/Common/Images/Icon/icon_m43.gif" 
                                CheckedImageUrl="~/Common/Images/Icon/icon_m43.gif" 
                                Value="TriggerClassType" meta:resourcekey="TBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/System/icon_images/icon_m02.gif" 
                                HoveredImageUrl="~/System/icon_images/icon_m02.gif" 
                                ImageUrl="~/System/icon_images/icon_m02.gif" 
                                CheckedImageUrl="~/System/icon_images/icon_m02.gif" Text="新增" 
                                Value="InsertButton" meta:resourcekey="TBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/System/icon_images/icon_m03.gif" 
                                HoveredImageUrl="~/System/icon_images/icon_m03.gif" 
                                ImageUrl="~/System/icon_images/icon_m03.gif" 
                                CheckedImageUrl="~/System/icon_images/icon_m03.gif" Text="刪除" 
                                Value="DeleteButton" meta:resourcekey="TBarButtonResource3">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="Button 6" Value="TBCustom1">
                                <ItemTemplate>
                                    <table id="Table1" width="100%" runat="server">
                                    <tr id="Tr1" runat="server">
                                        <td id="Td1" width="65" runat="server"><asp:Label ID="lblClassTitle" runat="server" Text="選擇分類" meta:resourcekey="lblClassTitleResource1"></asp:Label></td>
                                        <td id="Td2" align="left" runat="server">
                                            <asp:DropDownList ID="ddlTriggerClass" runat="server">                                        
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table> 
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 7" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg"> 
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="類別查詢" 
                                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" 
                                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" 
                                ImageUrl="~/Common/Images/Icon/icon_m39.gif" 
                                CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" 
                                Value="Query" meta:resourcekey="TBarButtonResource4">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 9" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>       
                </contenttemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <contenttemplate>
                    <table cellpadding="0" cellspacing="0" width="100%" border="0">
                        <tr valign="top">
                            <td>
                                <Fast:Grid ID="TriggerGrid" runat="server" AutoGenerateCheckBoxColumn="True" 
                                    AllowSorting="True" AutoGenerateColumns="False"  
                                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
                                     EnhancePager="True" PageSize="15" 
                                      DataKeyNames="TRIGGER_ID" 
                                    AllowPaging="True" 
                                    onpageindexchanging="TriggerGrid_PageIndexChanging" 
                                    onrowdatabound="TriggerGrid_RowDataBound" onsorting="TriggerGrid_Sorting" 
                                    >
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:BoundField HeaderText="分類" DataField="CLASS_GUID" 
                                            SortExpression="CLASS_GUID" meta:resourcekey="BoundFieldResource1">
                                            <ItemStyle Width="140px" Wrap="False" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="外部組件名稱" SortExpression="TRIGGER_NAME"
                                            meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnName" runat="server" 
                                                    meta:resourcekey="lbtnNameResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Width="200px" Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="FILE" HeaderText="DLL名稱" SortExpression="FILE" HtmlEncode="true"
                                            meta:resourcekey="BoundFieldResource2">
                                            <ItemStyle Width="150px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TYPE" HeaderText="組件路徑" SortExpression="TYPE" HtmlEncode="true"
                                            meta:resourcekey="BoundFieldResource3">
                                            <ItemStyle Width="300px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="MODULE_NAME" HeaderText="備註"  HtmlEncode="true"
                                            SortExpression="MODULE_NAME" meta:resourcekey="BoundFieldResource4">
                                            <ItemStyle Width="100px" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                    </Columns>
                                </Fast:Grid>
                            </td>
                        </tr>
                    </table>
                </contenttemplate>
                    <triggers>
                    <asp:AsyncPostBackTrigger ControlID="RadToolBar1" 
                            EventName="ButtonClick" />
                </triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfStartFORM" runat="server" Value="起單" />
    <asp:HiddenField ID="hfEndFORM" runat="server" Value="結案" />
    <asp:HiddenField ID="hfChangesFORM" runat="server" Value="狀態變更" />
    <asp:HiddenField ID="hfTriggerTitleName" runat="server" Value="表單異動設定維護" meta:resourcekey="hfTriggerTitleNameResource1" />
    <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎" Visible="False"
        meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblTotalClass" runat="server" Text="全部類別" Visible="false" meta:resourcekey="lblTotalClassResource1"></asp:Label>
</asp:Content>