<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="CustomWords.aspx.cs" Inherits="Ede.Uof.Web.WKF.CustomWords.CustomWords" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        function RadToolBar1ButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Add":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/WKF/CustomWords/CustomWordsDetail.aspx", args.get_item(), "", 600, 600, openDialogResult);
                    break;
                case "Delete":
                    args.set_cancel(true);
                    if (confirm('<%=lblConfirmDelete.Text %>'))
                        args.set_cancel(false);
            }
        }

        function openDialogResult(returnValue) {
            if (returnValue === '' || returnValue === null)
                return false;
            else
                return true;
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" 
                OnClientButtonClicking="RadToolBar1ButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="新增" Value="Add"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        meta:resourcekey="RadToolBarAddResource1">        
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m03.png"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.png"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                        ImageUrl="~/Common/Images/Icon/icon_m03.png"
                        meta:resourcekey="RadToolBarDeleteResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>                      
                    <telerik:RadToolBarButton runat="server" Value="CheckBox" meta:resourcekey="RadToolBarButtonResource7">
                        <ItemTemplate>        
                            <asp:CheckBox ID="cbxDefaultEnable" runat="server" Text="停用預設字詞" AutoPostBack="true"
                                OnCheckedChanged="cbxDefaultEnable_CheckedChanged" meta:resourcekey="cbxDefaultEnableResource1" />
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>   
            <asp:Label ID="Label1" runat="server" ForeColor="Blue" Text="說明：此設定適用於「一般/進階加簽」及「自訂流程站點」，使用者可選擇其一類型作為下一站的簽核按鈕字詞。" 
                meta:resourcekey="Label1Resource1"></asp:Label>
            
                <Ede:Grid ID="grdCustWord" runat="server" AutoGenerateCheckBoxColumn="True" EmptyDataText="沒有資料" PageSize="15" 
                DataKeyNames="CUSTOM_WORDS_ID" DefaultSortColumnName="TYPE" DataKeyOnClientWithCheckBox="False" 
                DefaultSortDirection="Ascending" AllowPaging="True" AllowSorting="True" CustomDropDownListPage="False" 
                EnhancePager="True" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="" AutoGenerateColumns="False" 
                Width="100%" OnSorting="grdCustWord_Sorting" OnPageIndexChanging="grdCustWord_PageIndexChanging" 
                OnRowDataBound="grdCustWord_RowDataBound" meta:resourcekey="grdCustWordResource1">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                    <HeaderStyle Wrap="False" />
                <Columns>
                    <asp:TemplateField HeaderText="字詞類型" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnType" runat="server" OnClick="lbtnType_Click" meta:resourcekey="lbtnTypeResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="允許否決" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblAllowDisapprove" runat="server" meta:resourcekey="lblAllowDisapproveResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Wrap="False" /> </asp:TemplateField>
                    <asp:TemplateField HeaderText="允許退簽" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblAllowReturn" runat="server" meta:resourcekey="lblAllowReturnResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" Wrap="False" />
                    </asp:TemplateField>
                  
                </Columns>
            </Ede:Grid>
            
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblCustomWordsDetail" runat="server" Text="簽核字詞設定" Visible="False" meta:resourcekey="lblCustomWordsDetailResource1"></asp:Label>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblYes" runat="server" Text="V" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>

    <asp:Label ID="lblAgree" runat="server" Visible="False" Text="同意" meta:resourcekey="lblAgreeResource1"></asp:Label> 
    <asp:Label ID="lblReject" runat="server" Visible="False" Text="否決"  meta:resourcekey="lblRejectResource1"></asp:Label> 
    <asp:Label ID="lblReturn" runat="server" Visible="False" Text="退簽" meta:resourcekey="lblReturnResource1"></asp:Label> 
</asp:Content>