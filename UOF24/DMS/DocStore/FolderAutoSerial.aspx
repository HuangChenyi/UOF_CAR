<%@ Page Title="設定文件編號字軌" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master"
    AutoEventWireup="true" Inherits="DMS_DocStore_FolderAutoSerial" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="FolderAutoSerial.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script id="Infragistics" type="text/javascript">
<!--
    function RadToolBar1_Click(sender, args) {
        
        var button = args.get_item();
        
        if (button.get_value() == "AddTrackId") {//編輯字軌
            args.set_cancel(true);
            $uof.dialog.open2("~/DMS/DocStore/AddAutoSerial.aspx", args.get_item(), "", 600, 350, OpenDialogResult);
    }
        else if (button.get_value() == "DeleteTrackId") {
	    if (confirm('<%=lblConfirmDelete.Text %>') == false)
	        args.set_cancel(true);
	}
    }// -->

        function OpenDialogResult(returnValue)
        {
            if (typeof (returnValue) == "undefined" || returnValue == null || returnValue == "") {
                return false;
            }
            return true;
        }
    </script>
    <table style="width:100%;">
        <tr>
            <td>
                <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="RadToolBar1_Click" OnButtonClick="RadToolBar1_ButtonClicked" SingleClick="None" Width="100%">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Text="新增字軌" ImageUrl="~/System/icon_images/icon_m02.gif"
                            meta:resourcekey="TBarButtonResource1" Value="AddTrackId">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="刪除字軌" ImageUrl="~/System/icon_images/icon_m03.gif"
                            meta:resourcekey="TBarButtonResource2" Value="DeleteTrackId">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true">
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>                
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                    <ContentTemplate>
                        <Fast:Grid ID="Grid1" runat="server"  Width="100%"
                            DataKeyNames="HEAD"   OnRowDataBound="Grid1_RowDataBound"
                            AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="True" AllowSorting="True"
                            __designer:wfdid="w15" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                            EnhancePager="True" PageSize="15" EmptyDataText="No data found"
                            KeepSelectedRows="False" meta:resourcekey="Grid1Resource1"
                            OnRowCommand="Grid1_RowCommand" AllowPaging="True" OnPageIndexChanging="Grid1_PageIndexChanging">
                            <EnhancePagerSettings
                                ShowHeaderPager="True" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="字軌" HeaderStyle-Width="20%" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="LinkButton1" Text='<%#: Eval("HEAD") %>' CommandArgument="a" meta:resourceKey="LinkButton1Resource1"
                                            __designer:wfdid="w10"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="加入西元年" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEnableYear" runat="server" meta:resourcekey="lblEnableYearResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="加入月份" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEnableMonth" runat="server" meta:resourcekey="lblEnableMonthResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="目前流水號">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCurrentIdentity" runat="server" Text=""></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="流水號位數" DataField="IDENTIFY_LENGTH"
                                    meta:resourcekey="BoundFieldResource2" />
                            </Columns>
                        </Fast:Grid>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick"></asp:AsyncPostBackTrigger>
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除?" Visible="False"
        meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblAddAutoSerial" runat="server" Text="新增/修改文件編號字軌" Visible="False"
        meta:resourcekey="lblAddAutoSerialResource1"></asp:Label>
    <asp:Label ID="lblYes" Visible="False" runat="server" Text="是" meta:resourcekey="lblYesResource1"></asp:Label>
    <asp:Label ID="lblNo" Visible="False" runat="server" Text="否" meta:resourcekey="lblNoResource1"></asp:Label>
</asp:Content>
