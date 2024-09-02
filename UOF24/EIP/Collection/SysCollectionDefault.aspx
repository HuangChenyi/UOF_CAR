<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Collection_SysCollectionDefault" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SysCollectionDefault.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="Fast" Namespace="Ede.Uof.Utility.Component" Assembly="Ede.Uof.Utility.Component.Grid" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">

        function uwtMasterToolBar(sender, args) {
            var toolbar = sender;
            var value = args.get_item().get_value();
            switch (value) {
                case "Insert":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Collection/ModifySysCollection.aspx", args.get_item(), "", 500, 500, OpenDocDialogResult, { "Mode": "Insert" });
                      break;
                  case "Delete":
                      var deleteValue = confirm('<%= lblConfirmMsg.Text%>');
                      if (!deleteValue) {
                          args.set_cancel(true);
                      }
                      break;
              }

          }

        function OpenDocDialogResult(returnValue) {
            if (returnValue == null || typeof (returnValue) == 'undefined')
                return false;
            else
                return true;
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
            <table style="width: 100%">
                <tr>
                    <td>
                        <telerik:RadToolBar ID="uwtMasterToolBar" Runat="server" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="uwtMasterToolBar" Width="100%" meta:resourcekey="uwtMasterToolBarResource2">
                            <Items>
                                <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m22.png" DisabledImageUrl="~/Common/Images/Icon/icon_m22.png" Enabled="False" 
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m22.png" ImageUrl="~/Common/Images/Icon/icon_m22.png" Text="新增收藏" Value="Insert" meta:resourcekey="RadToolBarButtonResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="Button 1" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="取消收藏" Value="Delete" ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource3">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="Button 3" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td >
                        <Fast:Grid ID="gridPersColection" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                              DataKeyNames="COLLECTION_ID"
                             AutoGenerateColumns="False" AllowPaging="True" DataKeyOnClientWithCheckBox="True"
                            EmptyDataText="沒有資料" EnhancePager="True" PageSize="15"
                            KeepSelectedRows="False" Width="1000px" OnRowDataBound="gridPersColection_RowDataBound"
                            OnPageIndexChanging="gridPersColection_PageIndexChanging" OnSorting="gridPersColection_Sorting"
                            DefaultSortColumnName="CREATE_DATE" DefaultSortDirection="Descending" meta:resourcekey="gridPersColectionResource1"    OnRowCommand="gridPersColection_RowCommand">
                            <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="收藏目錄" SortExpression="TOPIC" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="hlLink" runat="server" Text='<%# Eval("TOPIC") %>'
                                            meta:resourcekey="hlLinkResource1" CommandName="Link"></asp:LinkButton>
                                        <asp:Label runat="server" ID="lblDataLost" Visible="False" Text="收藏資料可能已被刪除！" ForeColor="Red" meta:resourcekey="lblDataLostResource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" Width="50%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="收藏人員" meta:resourcekey="TemplateFieldResource2">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" IsAllowEdit="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="最後更新時間" SortExpression="MODIFY_DATE" meta:resourcekey="BoundFieldResource1">
                                    <ItemTemplate>
                                        <asp:Label  ID="lblModifyDate" runat="server" Text=""></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="加入收藏時間" SortExpression="CREATE_DATE" meta:resourcekey="BoundFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label  ID="lblCreateDate" runat="server" Text=""></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False"></ItemStyle>
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                    </td>
                </tr>
            </table>
        </contenttemplate>
    </asp:UpdatePanel>
    <asp:Label runat="server" ID="lblConfirmMsg" Visible="False" Text="確定要取消嗎？" meta:resourcekey="lblConfirmMsgResource1"></asp:Label>
    <asp:Label runat="server" ID="lblDMSRoot" Visible="False" Text="文件庫" meta:resourcekey="lblDMSRootResource1"></asp:Label>
    <asp:Label ID="lblErrorMsg" runat="server" Text="無權限使用" Visible="False"
        meta:resourcekey="lblErrorMsgResource1"></asp:Label>

</asp:Content>

