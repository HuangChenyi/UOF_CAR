<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Currency_CurrencyMA" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="CurrencyMA.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function RadToolBar1ButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Create":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Duty/Currency/CurrencyEdit.aspx", args.get_item(), '', 500, 400, openDialogResult);
                    break;
                case "unActive":
                    if (confirm('<%=lblunActiveMSG.Text %>') == false)
                    args.set_cancel(true);
                break;
        }
    }

    function openDialogResult(returnValue) {

        if (typeof (returnValue) == 'undefined')
            return false;
        else
            return true;
    }
    </script>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td colspan="2" height="20px">
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBar1ButtonClicking">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Text="新增幣別" Value="Create"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m44.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m44.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m44.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m44.gif"
                                    meta:resourcekey="RadToolBarButtonCreateResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="停用幣別" Value="unActive"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    meta:resourcekey="RadToolBarButtonunActiveResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td>
                        <Fast:Grid ID="listGrid" runat="server" AutoGenerateCheckBoxColumn="True"
                            AllowSorting="True"
                            Width="600px" DataKeyNames="CUR_ID"
                            AutoGenerateColumns="False" AllowPaging="True"
                            DataKeyOnClientWithCheckBox="True"
                            EnhancePager="True" PageSize="15"
                            DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                            EnableModelValidation="True" KeepSelectedRows="False"
                            OnRowDataBound="listGrid_RowDataBound"
                            OnPageIndexChanging="listGrid_PageIndexChanging"
                            OnSorting="listGrid_Sorting" meta:resourcekey="listGridResource1">
                            <EnhancePagerSettings ShowHeaderPager="True" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>

                                <asp:TemplateField HeaderText="代碼"
                                    SortExpression="CUR_ID" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="LinkButton1" Text='<%#: Bind("CUR_ID") %>' CommandName="update"
                                            OnClick="LinkButton1_Click" meta:resourcekey="LinkButton1Resource1"></asp:LinkButton>

                                    </ItemTemplate>
                                    <HeaderStyle Width="100px"  />
                                </asp:TemplateField>
                                <asp:BoundField DataField="CUR_NAME" HeaderText="幣別名稱"
                                    SortExpression="CUR_NAME" meta:resourcekey="BoundFieldResource1">

                                    <HeaderStyle Width="300px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="啟用"
                                    SortExpression="ACTIVE" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblActive" runat="server" meta:resourcekey="lblActiveResource1"></asp:Label>

                                    </ItemTemplate>
                                    <HeaderStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="本幣"
                                    SortExpression="BASE" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBase" runat="server" meta:resourcekey="lblBaseResource1"></asp:Label>

                                    </ItemTemplate>
                                    <HeaderStyle Width="100px" />
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblunActiveMSG" runat="server" Text="是否要停用" Visible="False" meta:resourcekey="lblunActiveMSGResource1"></asp:Label>
    <asp:Label ID="lblYes" runat="server" Text="是" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
    <asp:Label ID="lblNo" runat="server" Text="否" Visible="False" meta:resourcekey="lblNoResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

