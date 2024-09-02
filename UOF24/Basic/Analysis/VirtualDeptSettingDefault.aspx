<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="VirtualDeptSettingDefault.aspx.cs" Inherits="Ede.Uof.Web.Basic.Analysis.VirtualDeptSettingDefault" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        function RadToolBarButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Add":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/Basic/Analysis/VirtualDeptSettingEdit.aspx", args.get_item(), '<%=lblDialogTitle.Text %>', 500, 500, openDialogResult);

                    break;
                case "Delete":
                    var checkedData = $uof.fastGrid.getChecked('<%=virtualGrid.ClientID%>');
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

     <telerik:RadToolBar ID="RadToolBar1" runat="server"  Width="100%"  OnClientButtonClicking="RadToolBarButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
        <Items>
             <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m140.png"
                HoveredImageUrl="~/Common/Images/Icon/icon_m140.png"
                ImageUrl="~/Common/Images/Icon/icon_m140.png"
                CheckedImageUrl="~/Common/Images/Icon/icon_m140.png"
                Text="新增" Value="Add" meta:resourcekey="RadToolBarButtonResource1" >
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2" ></telerik:RadToolBarButton>
             <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                Text="刪除" Value="Delete" meta:resourcekey="RadToolBarButtonResource3" >
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4" >
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Ede:Grid ID="virtualGrid" runat="server" AllowPaging="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" Width="100%"  
                DataKeyOnClientWithCheckBox="False" PageSize="15" EmptyDataText="No data found" KeepSelectedRows="False"  AllowSorting="True"
                DataKeyNames="SETTING_GUID" OnRowDataBound="virtualGrid_RowDataBound" OnPageIndexChanging="virtualGrid_PageIndexChanging" CustomDropDownListPage="False" 
                DefaultSortDirection="Ascending" EnhancePager="True" meta:resourcekey="virtualGridResource1">
                <ExportExcelSettings AllowExportToExcel="False"/>
                <EnhancePagerSettings ShowHeaderPager="True"/>
                <Columns>
                    <asp:TemplateField HeaderText="部門" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource1" ></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDept" runat="server" meta:resourcekey="lblDeptResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="45%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="人員" meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" meta:resourcekey="TextBox4Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <uc1:UC_ChoiceList ID="UC_ChoiceListMgt" runat="server" />
                        </ItemTemplate>
                        <HeaderStyle Width="45%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource3" >
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" meta:resourcekey="TextBox3Resource1" ></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" Text="編輯" OnClick="lbtnEdit_Click" meta:resourcekey="lbtnEditResource1"></asp:LinkButton>
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
    <asp:Label ID="lblDialogTitle" runat="server" Text="大數據部門維護" Visible="False" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除嗎?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
</asp:Content>
