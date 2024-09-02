<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="SetMemberAuthorityDefault.aspx.cs" Inherits="System_Organization_Member_SetMemberAuthorityDefault" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<%@ Register src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function RadToolBarButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Add":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/System/Organization/Member/EditMemberAuthority.aspx", args.get_item(), '<%=lblDialogTitle.Text %>', 500, 500, openDialogResult);

                     break;
                 case "Delete":
                     var checkedData = $uof.fastGrid.getChecked('<%=authGrid.ClientID%>');
                     if (checkedData != '') {
                         if (!confirm('<%=lblConfirmDelete.Text %>')) {
                             args.set_cancel(true);
                         }
                     }
                     else { args.set_cancel(true); }
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
    <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="RadToolBarButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" Width="100%" meta:resourcekey="RadToolBar1Resource2" SingleClick="None">
        <Items>
             <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m140.png"
                HoveredImageUrl="~/Common/Images/Icon/icon_m140.png"
                ImageUrl="~/Common/Images/Icon/icon_m140.png"
                CheckedImageUrl="~/Common/Images/Icon/icon_m140.png"
                Text="新增權限" Value="Add" meta:resourcekey="RadToolBarButtonResource5" >
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6"></telerik:RadToolBarButton>
             <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                Text="刪除" Value="Delete" meta:resourcekey="RadToolBarButtonResource7" >
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource8">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Ede:Grid ID="authGrid" runat="server" AllowPaging="True" OnPageIndexChanging="authGrid_PageIndexChanging"
        AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"   Width="100%" DataKeyNames="GROUP_AUTH_GUID,MGT_USER_RM_ID,VIEW_USER_RM_ID"
        DataKeyOnClientWithCheckBox="False" PageSize="15"
        DefaultSortDirection="Ascending" EnhancePager="True" OnRowDataBound="authGrid_RowDataBound" CustomDropDownListPage="False" EmptyDataText="No data found" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="authGridResource2" AllowSorting="True">
                <ExportExcelSettings AllowExportToExcel="False" />
                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                <Columns>
                    <asp:TemplateField HeaderText="群組" meta:resourceKey="TemplateFieldResource5">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource2"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <uc1:UC_ChoiceList ID="UC_ChoiceListGroup" runat="server" />
                        </ItemTemplate>
                        <HeaderStyle Width="30%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="可維護人員" meta:resourceKey="TemplateFieldResource3">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <uc1:UC_ChoiceList ID="UC_ChoiceListMgt" runat="server" />
                        </ItemTemplate>
                        <HeaderStyle Width="30%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="可觀看人員" meta:resourceKey="TemplateFieldResource4">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource2"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <uc1:UC_ChoiceList ID="UC_ChoiceListUser" runat="server" />
                        </ItemTemplate>
                        <HeaderStyle Width="30%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource6">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" meta:resourcekey="TextBox3Resource2"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" Text="編輯" OnClick="lbtnEdit_Click" meta:resourcekey="lbtnEditResource2"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="10%"/>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                    </asp:TemplateField>
                </Columns>                
            </Ede:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除嗎?" Visible="False" meta:resourcekey="lblConfirmDeleteResource2"></asp:Label>
    <asp:Label ID="lblDialogTitle" runat="server" Text="群組權限維護" Visible="False" meta:resourcekey="lblDialogTitleResource2"></asp:Label>
</asp:Content>
