<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_WorkClass_Default" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function RadToolBar1_WorkClass_ButtonClicking(sender, args) {

            var Key = args.get_item().get_value();

            if (Key == "AddClass") {
                args.set_cancel(true);
                $uof.dialog.open2("~/EIP/Calendar/WorkClass/MaintainWorkClass.aspx", args.get_item(), "", 450, 250, openDialogResult);
            }

            if (Key == "DeleteClass") {
                if (confirm("<%=lblDelete.Text %>")) {
                    args.set_cancel(false);
                }
                else {
                    args.set_cancel(true);
                }
            }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined' || returnValue == null)
                return false;
            else {
                return true;
            }
        }

        function MyImage(Img) {
            var image = new Image();
            image.src = Img.src;
            width = 16; //預先設置的所期望的寬的值
            height = 16; //預先設置的所期望的高的值
            if (image.width > width || image.height > height) {//現有圖片只有寬或高超了預設值就進行js控制
                w = image.width / width;
                h = image.height / height;
                if (w > h) {//比值比較大==>寬比高大
                    Img.width = width; //定下寬度為width的寬度
                    Img.height = image.height / w; //以下為計算高度
                    Img.style.margin = Math.floor((16 - (image.height / w)) / 2) + 'px '
                               + Math.floor((16 - width) / 2) + 'px';

                } else {//高比寬大
                    Img.height = height; //定下寬度為height高度
                    Img.width = image.width / h; //以下為計算高度
                    Img.style.margin = Math.floor((16 - height) / 2) + 'px '
                               + Math.floor((16 - (image.width / h)) / 2) + 'px';
                }
            }
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <contenttemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="RadToolBar1_WorkClass_ButtonClicking" Width="100%" OnButtonClick="RadToolBar1_ButtonClick">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="新增工作類別" Value="AddClass" DisabledImageUrl="~/Common/Images/Icon/icon_j21.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_j21.gif" ImageUrl="~/Common/Images/Icon/icon_j21.gif"
                        CheckedImageUrl="~/Common/Images/Icon/icon_j21.gif" meta:resourcekey="TBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除工作類別" Value="DeleteClass" DisabledImageUrl="~/Common/Images/Icon/icon_j22.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_j22.gif" ImageUrl="~/Common/Images/Icon/icon_j22.gif"
                        CheckedImageUrl="~/Common/Images/Icon/icon_j22.gif" meta:resourcekey="TBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </contenttemplate>
    </asp:UpdatePanel>    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
            <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True" AllowSorting="True"
                            AutoGenerateColumns="False" DataKeyNames="CLASS_GUID" DataKeyOnClientWithCheckBox="False"
                            DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnableModelValidation="True"
                            EnhancePager="True" KeepSelectedRows="False" PageSize="15" OnPageIndexChanging="Grid1_PageIndexChanging"
                            OnRowDataBound="Grid1_RowDataBound" OnSorting="Grid1_Sorting" Width="30%" Style="margin-top: 0px"
                            meta:resourcekey="Grid1Resource1">
                            <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                            <Columns>
                                <asp:TemplateField HeaderText="編號" SortExpression="CLASS_SEQ" meta:resourcekey="TemplateFieldResource1">
                                    <ItemStyle Width="40%" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnClassSeq" runat="server" Text='<%#: Bind("CLASS_SEQ") %>'
                                            meta:resourcekey="lbtnClassSeqResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CLASS_NAME" HeaderText="名稱" SortExpression="CLASS_NAME"
                                    meta:resourcekey="BoundFieldResource1">
                                    <ItemStyle Width="40%" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="圖示" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Image ID="imgWorkClass" runat="server" meta:resourcekey="imgWorkClassResource1" Width="16px" Height="16px"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="CLASS_GUID" Visible="False" meta:resourcekey="BoundFieldResource2" />
                            </Columns>
                            <HeaderStyle Wrap="False" />
                        </Fast:Grid>
        </contenttemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
</asp:Content>
