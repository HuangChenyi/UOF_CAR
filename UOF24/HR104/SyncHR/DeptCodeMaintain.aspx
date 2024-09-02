<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="DeptCodeMaintain.aspx.cs" Inherits="Ede.Uof.Web.HR104.SyncHR.DeptCodeMaintain" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    <script type="text/javascript">
        function rdToolBar_ButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            if (key == "Export") {
                var frame = "<iframe style=display:none src='ExportDeptData.aspx'></iframe>";
	            $('body').prepend(frame);
            }
            else if (key == "Import")
            {
                args.set_cancel(true);
                $uof.dialog.open2("~/HR104/SyncHR/ImportDeptData.aspx", args.get_item(), '<%= lblDialogTitle.Text %>', 500, 400, OpenDialogResult);
            }
        }

        function OpenDialogResult(returnValue) {
                return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Label ID="lblControlWidth" runat="server" Text="" Width="1px" ></asp:Label>
            <asp:CheckBox ID="chbDisplayAllDept" runat="server" Text="顯示已停用部門" AutoPostBack="true" OnCheckedChanged="chbDisplayAllDept_CheckedChanged" meta:resourcekey="chbDisplayAllDeptResource1" />  
            <telerik:RadTreeView ID="treeDepartment" runat="server" ShowLineImages="False" EnableNodeTextHtmlEncoding="true"  OnNodeClick="RadTreeView1_NodeClick" meta:resourcekey="treeDepartmentResource1"></telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="rdToolBar" runat="server" Width="100%" SingleClick="None"
                OnButtonClick="RadToolBar1_OnButtonClick"
                OnClientButtonClicking="rdToolBar_ButtonClicking" meta:resourcekey="rdToolBarResource1">
                <Items>
                    <telerik:RadToolBarButton runat="server"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m66.png"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m66.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m66.png"
                        ImageUrl="~/Common/Images/Icon/icon_m66.png" Text="儲存" Value="Save" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m144.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m144.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m144.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m144.gif" Text="匯出" Value="Export" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m110.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m110.gif" Text="匯入" Value="Import" meta:resourcekey="RadToolBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource6">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="SaveMsg" meta:resourcekey="RadToolBarButtonResource7">
                        <ItemTemplate>
                            <asp:Label ID="lblSaveMsg" runat="server" Text="已儲存" ForeColor="Blue" Visible="False" meta:resourcekey="lblSaveMsgResource1"></asp:Label>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <table class="PopTable" style="width: 100%">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="部門名稱" meta:resourcekey="Label1Resource1"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblDeptName" runat="server" meta:resourcekey="lblDeptNameResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="部門代碼" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDeptCode" runat="server" meta:resourcekey="txtDeptCodeResource1"></asp:TextBox>
                        <asp:CustomValidator ID="cvCheckDeptCode" runat="server" ErrorMessage="部門代碼已存在" Display="Dynamic" meta:resourcekey="cvCheckDeptCodeResource1" ></asp:CustomValidator>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblTreeTitle" runat="server" Text="內部組織結構列表" Visible="False" meta:resourcekey="lblTreeTitleResource1"></asp:Label>
    <asp:Label ID="lblDialogTitle" runat="server" Text="匯入部門代碼" Visible="False" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
</asp:Content>
