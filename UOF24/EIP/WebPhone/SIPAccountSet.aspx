<%@ Page Title="SIP帳號維護" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master"
    AutoEventWireup="true" Inherits="EIP_WebPhone_SIPAccountSet" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SIPAccountSet.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceOnce.ascx" TagName="UC_ChoiceOnce"
    TagPrefix="uc2" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce"
    TagPrefix="uc3" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceCustomer.ascx" TagName="UC_ChoiceCustomer"
    TagPrefix="uc4" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceOnceByGroup.ascx" TagName="UC_ChoiceOnceByGroup"
    TagPrefix="uc5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function RadToolBar1_ButtonClicking(sender, args)
        {
            var value = args.get_item().get_value();
            switch (value)
            {
                case "AccountAdd":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/WebPhone/SIPAccountAdd.aspx", args.get_item(), "<%=lblDialogTitle.Text %>", 550, 300, OpenDialogResult);
                    
                    break;
                case "AccountDel":
                    args.set_cancel(!confirm('<%=lblConfirmDelMsg.Text %>'));
                    break;
            }
        }
        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) === "undefined" || returnValue === null) {
                return false;
            }
            else {
                return true;
            }
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table width="100%">
                <tr>
                    <td>
                        <telerik:RadToolBar ID="RadToolBar1" Runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking" meta:resourcekey="RadToolBar1Resource1">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Text="新增" CheckedImageUrl="~/Common/Images/Icon/icon_m44.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m44.gif" 
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m44.gif" ImageUrl="~/Common/Images/Icon/icon_m44.gif" Value="AccountAdd" meta:resourcekey="RadToolBarButtonResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="刪除" ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" Value="AccountDel" meta:resourcekey="RadToolBarButtonResource3">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td>
                        <Fast:Grid ID="AccountGrid" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                            AllowSorting="True"  DataKeyOnClientWithCheckBox="False"
                            DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                            EnhancePager="True" PageSize="15"  
                             AllowPaging="True"
                            DataKeyNames="SIP_ACCOUNT" OnPageIndexChanging="AccountGrid_PageIndexChanging"
                            OnRowDataBound="AccountGrid_RowDataBound" OnSorting="AccountGrid_Sorting" 
                            KeepSelectedRows="False" meta:resourcekey="AccountGridResource1"    DefaultSortColumnName="SIP_ACCOUNT" >
                            <EnhancePagerSettings ShowHeaderPager="True" firstaltimageurl="" firstimageurl="" lastaltimage="" lastimageurl="" nextialtimageurl="" nextimageurl="" pageinfocssclass="" pagenumbercssclass="" pagenumbercurrentcssclass="" pageredirectcssclass="" previousaltimageurl="" previousimageurl=""></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="帳號" SortExpression="SIP_ACCOUNT" 
                                    meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtAccount" runat="server" OnClick="lbtAccount_Click"
                                            Text='<%#: Bind("SIP_ACCOUNT") %>' meta:resourcekey="lbtAccountResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="120px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="SIP_PWD" HeaderText="密碼" SortExpression="SIP_PWD" 
                                    meta:resourcekey="BoundFieldResource1">
                                    <ItemStyle Width="80px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="IS_PRIVATE" HeaderText="公用/私用" 
                                    SortExpression="IS_PRIVATE" meta:resourcekey="BoundFieldResource2">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="80px"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="OWNER_USER" HeaderText="擁有者" 
                                    SortExpression="OWNER_USER" meta:resourcekey="BoundFieldResource3">
                                    <ItemStyle Width="250px"></ItemStyle>
                                </asp:BoundField>
                            </Columns>
                        </Fast:Grid>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="PopTable">
                          
                            <tr>
                                <td style="width:15%">
                                    <asp:Label ID="lblUseSIPAccount" runat="server" Text="可撥打公用線路之人員" 
                                        meta:resourcekey="lblUseSIPAccountResource1"></asp:Label>
                                </td>
                                <td >
                                    <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="false" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblPRIVATETXT" runat="server" Text="私用" Visible="False" meta:resourcekey="lblPRIVATETXTResource1"></asp:Label>
    <asp:Label ID="lblSHARETEXT" runat="server" Text="公用" Visible="False" meta:resourcekey="lblSHARETEXTResource1"></asp:Label>
    <asp:Label ID="lblDialogTitle" runat="server" Text="SIP帳號新增" Visible="False" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
    <asp:Label ID="lblDialogTitle1" runat="server" Text="SIP帳號編輯" Visible="False" meta:resourcekey="lblDialogTitle1Resource1"></asp:Label>
    <asp:Label ID="lblConfirmDelMsg" runat="server" Text="確定要刪除嗎？" Visible="False" meta:resourcekey="lblConfirmDelMsgResource1"></asp:Label>
    <asp:Label ID="lblSaveShareUserMsg" runat="server" Text="確定儲存嗎？" Visible="False" meta:resourcekey="lblSaveShareUserMsgResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
