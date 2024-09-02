<%@ Page Title="受文機關維護" Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/DefaultMasterPage.master" CodeBehind="EditOrg.aspx.cs" Inherits="Ede.Uof.Web.Edoc.Management.EditOrg" Culture="auto" UICulture="auto" %>


<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        /* 隱藏Grid內的欄位 */
        .cssHidden {
            display: none;
        }

        .cssCenter {
            text-align: center !important;
        }
    </style>

    <script type="text/javascript">

        function OnContactClicking(sender, args) {
            if (args.get_item().get_value() == "Create") {
                args.set_cancel(true);
                $uof.dialog.open2("~/Edoc/Management/OrgDialog.aspx", args.get_item(), '<%=lblAddOrg.Text%>', 600, 400, openDialogResult, { "TYPE": "Add" });
            }
        }

        function ConfirmDelete() {
            if (confirm('<%=lblDelete.Text%>')) {
                return true;
            }
            else {
                return false;
            }
        }

        function openDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false;
            }
            return true;
        }

    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadMultiPage ID="rmpOrg" runat="server" SelectedIndex="0">
                <telerik:RadPageView ID="pvOrg" Selected="True" runat="server">

                    <telerik:RadToolBar ID="rtbEditOrg" runat="server" OnButtonClick="rtbEditOrg_ButtonClick" OnClientButtonClicking="OnContactClicking" Width="100%">
                        <Items>
                            <telerik:RadToolBarButton Text="查詢" Value="Query" runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m39.gif">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sKeyword" />
                            <telerik:RadToolBarButton Text="新增" Value="Create" ID="rtbbCreate" CheckedImageUrl="~/Common/Images/Icon/icon_m71.png"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m71.png" HoveredImageUrl="~/Common/Images/Icon/icon_m71.png"
                                ImageUrl="~/Common/Images/Icon/icon_m71.png" runat="server">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sKeyword" />
                        </Items>
                    </telerik:RadToolBar>

                    <table class="PopTable">
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="關鍵字"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOrgKeyWord" Width="400px" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="資料來源"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlQueryStatus" Width="200px" runat="server">
                                    <asp:ListItem Text="全部" Value="ALL"></asp:ListItem>
                                    <asp:ListItem Text="自訂" Value="CUSTOM"></asp:ListItem>
                                    <asp:ListItem Text="匯入" Value="IMPORT"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>

                    <Ede:Grid ID="grdOrgList" runat="server" DataKeyNames="ORG_ID" Width="100%"
                        PageSize="15" EnhancePager="True" AutoGenerateColumns="False"
                        AllowPaging="True" AllowSorting="True"
                        AutoGenerateCheckBoxColumn="False"
                        OnSorting="grdOrgList_Sorting"
                        OnRowDataBound="grdOrgList_RowDataBound"
                        OnPageIndexChanging="grdOrgList_PageIndexChanging"
                        CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" KeepSelectedRows="False"
                        SelectedRowColor="" UnSelectedRowColor="">
                        <EnhancePagerSettings ShowHeaderPager="True" />
                        <HeaderStyle Wrap="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="機關代碼" SortExpression="ORG_ID">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnOrgId" Text="" OnClick="lbtnOrgId_Click" runat="server"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" HorizontalAlign="Left" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="ORG_NAME" HtmlEncode="true" HeaderText="機關名稱" SortExpression="ORG_NAME">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>

                            <asp:BoundField DataField="ORG_ZIPCODE" HeaderText="郵遞區號" SortExpression="ORG_ZIPCODE">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>

                            <asp:BoundField DataField="ORG_ADDRESS" HeaderText="地址" SortExpression="ORG_ADDRESS">
                                <HeaderStyle Wrap="False" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="電子交換" SortExpression="EXCHANGE_TYPE">
                                <ItemTemplate>
                                    <asp:Label ID="lblExchangeType" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="發文方式" SortExpression="EXCHANGE_TYPE">
                                <ItemTemplate>
                                    <asp:Label ID="lblExchangeType2" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" HorizontalAlign="Left" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="異動人員" SortExpression="MODIFY_USER">
                                <ItemTemplate>
                                    <asp:Label ID="lblModifyUser" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" HorizontalAlign="Left" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="異動時間" SortExpression="MODIFY_DATE">
                                <ItemTemplate>
                                    <asp:Label ID="lblModifyDate" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="資料來源" SortExpression="IMPORT_TYPE">
                                <ItemTemplate>
                                    <asp:Label ID="lblImportType" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" />
                            </asp:TemplateField>

                        </Columns>
                    </Ede:Grid>

                </telerik:RadPageView>
            </telerik:RadMultiPage>

            <asp:HiddenField ID="hfPageIndex" runat="server" Value="0" />

            <asp:Label ID="lblPlaceHolder" runat="server" Text="可搜尋機關代碼或機關名稱" CssClass="cssHidden"></asp:Label>

            <asp:Label ID="lblDialogTitle" runat="server" Text="編輯字號" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎 ?" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblNoDelete" runat="server" Text="使用過的類別不可刪除" CssClass="cssHidden"></asp:Label>

            <asp:Label ID="lblModifyOrg" runat="server" Text="維護受文機關" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblAddOrg" runat="server" Text="新增受文機關" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblDescription" runat="server" Text="說明：請查詢要維護的受文機關來進行修改" ForeColor="Blue" Visible="false"></asp:Label>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
