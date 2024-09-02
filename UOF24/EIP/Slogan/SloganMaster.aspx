<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Slogan_SloganMaster" Title="公司語錄維護" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="SloganMaster.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/Organization/UC_DeptManagerTree.ascx" TagPrefix="uc1" TagName="UC_DeptManagerTree" %>
<%@ Register Src="~/Common/Organization/DepartmentTree.ascx" TagPrefix="uc1" TagName="DepartmentTree" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    <style type="text/css">
        td.JustAddBorder table tr td {
            border-width: 1px;
            border-style: solid;
            line-height: normal;
        }
    </style>
    <script type="text/javascript">
        function OpenMonie(e) {
            window.open(e);
        }
        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            switch (value) {
                case "Delete":
                    args.set_cancel(!confirm('<%=lblDelMsg.Text %>'))
                    break;
                case "Add":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Slogan/SloganDetail.aspx", args.get_item(), "<%=lblDialogTitle.Text%>", 1024, 780, OpenDialogReturn, { "GroupID": $("#<%=hfSelectDepID.ClientID%>").val() });
                    break;
            }

        }

        function OpenDialogReturn(returnValue) {
            if (typeof (returnValue) == "undefined") {
                return false
            }
            else {
                return true;
            }
        }

        function OnClientClicked(sender, args) {
            OpenMonie(sender.get_value());
        }

        function Setting_chbParentSetting_Click() {
            var toolbarbutton = $find("<%=RadToolBar1.ClientID%>").findItemByValue("useParent");
            var settingCheckBox = $telerik.findElement(toolbarbutton.get_element(), ("chbParentSetting"));
            if (settingCheckBox.checked) {
                if (!confirm('<%=lbConfirmCheckBox.Text%>'))
                    settingCheckBox.checked = false;
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:Label ID="Label1" runat="server" Text="內部組織結構列表" Visible="False" meta:resourcekey="Label1Resource1"></asp:Label>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblControlWidth" runat="server" Text="" Width="1px"></asp:Label>
            <asp:CheckBox ID="chbDisplayAllDept" runat="server" Text="顯示已停用部門" AutoPostBack="true" OnCheckedChanged="chbDisplayAllDept_CheckedChanged" meta:resourcekey="chbDisplayAllDeptResource1" />
            <telerik:RadTreeView ID="RadTreeView1" runat="server"
                OnNodeClick="RadTreeView1_NodeClick" EnableNodeTextHtmlEncoding="True"
                meta:resourcekey="RadTreeView1Resource1">
            </telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadTabStrip ID="rstTab" MultiPageID="rmp" runat="server" SelectedIndex="0" meta:resourcekey="rstTabResource1">
                <Tabs>
                    <telerik:RadTab runat="server" Text="公司語錄" Value="Slogan" Selected="True" PageViewID="rpvTabSlogan"
                        meta:resourcekey="RadTabResource1" Owner="">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="權限設定" Value="Authority" PageViewID="rpvTabAuthority"
                        meta:resourcekey="RadTabResource5" Owner="">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>

            <telerik:RadMultiPage ID="rmp" runat="server" SelectedIndex="0">
                <telerik:RadPageView ID="rpvTabSlogan" runat="server">
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" OnClientButtonClicking="RadToolBar1_ButtonClicking">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Value="useParent" meta:resourcekey="RadToolBarButtonResource5">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chbParentSetting" runat="server" Text="使用上一部門設定" AutoPostBack="True" Enabled="False"
                                        OnCheckedChanged="chbParentSetting_CheckedChanged" onClick="Setting_chbParentSetting_Click()" meta:resourcekey="chbParentSettingResource1" />
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="True" runat="server"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="新增" Value="Add"
                                ClickedImageUrl="~/Common/Images/Icon/icon_m59.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif" ImageUrl="~/Common/Images/Icon/icon_m59.gif" meta:resourcekey="RadToolBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                                ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource3">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                    <asp:HiddenField ID="hfSelectDepID" runat="server" />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblNoAuthMsg" runat="server" Text="無觀看權限" Visible="false" ForeColor="Red" meta:resourcekey="lblNoAuthMsgResource1"></asp:Label>                         
                            <Fast:Grid ID="SloganGrid" runat="server" AutoGenerateCheckBoxColumn="True"
                                AllowSorting="True" AutoGenerateColumns="False"
                                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" DefaultSortColumnName="SLOGAN_NO"
                                OnSorting="SloganGrid_Sorting"
                                EnhancePager="True" PageSize="15"
                                Width="100%"
                                DataKeyNames="SLOGAN_ID" OnRowDataBound="SloganGrid_RowDataBound"
                                AllowPaging="True" OnPageIndexChanging="SloganGrid_PageIndexChanging"
                                meta:resourcekey="SloganGridResource1" EmptyDataText="沒有資料" KeepSelectedRows="False" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

                                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                <Columns>
                                    <asp:TemplateField HeaderText="語錄主旨" SortExpression="SLOGAN_NO" meta:resourcekey="TemplateFieldResource1">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnSloganNo" runat="server"
                                                meta:resourcekey="lbtnSloganNoResource1" OnClick="lbtnSloganNo_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle Width="300px" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="語錄" meta:resourcekey="BoundFieldResource1" ItemStyle-CssClass="editorcontentstyle JustAddBorder">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSLOGAN_CONTENT" runat="server" Text=""></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle CssClass="editorcontentstyle JustAddBorder" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="關聯影音" meta:resourcekey="TemplateFieldResource2">
                                        <ItemTemplate>

                                            <telerik:RadButton runat="server" ID="btnLinkUrl" Visible="false"
                                                OnClientClicked="OnClientClicked">
                                            </telerik:RadButton>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle Width="100px" Wrap="False" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="外部會員是否可觀看" meta:resourcekey="TemplateFieldResource3">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblMember" runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle Width="100px" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="開始起始" meta:resourcekey="BoundFieldResource2">
                                        <ItemTemplate>
                                            <asp:Label ID="lblStartTime" runat="server" Text='<%# Bind("START_TIME", "{0:yyyy/MM/dd}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="False" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="開放終止" meta:resourcekey="BoundFieldResource3">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEndDate" runat="server" Text='<%# Bind("END_TIME", "{0:yyyy/MM/dd}") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="False" />
                                    </asp:TemplateField>
                                </Columns>
                            </Fast:Grid>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                        </Triggers>
                    </asp:UpdatePanel>
                </telerik:RadPageView>
                <telerik:RadPageView ID="rpvTabAuthority" runat="server">
                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="沒有設定的權限"
                        meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                    <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ShowMember="false" ExpandToUser="false" OnEditButtonOnClick="UC_ChoiceList1_EditButtonOnClick" />
                </telerik:RadPageView>
            </telerik:RadMultiPage>
            <asp:HiddenField ID="hfUserGuid" runat="server" />
            <asp:HiddenField ID="hidLink" runat="server" />
            <asp:HiddenField ID="hfIsDeleteAll" runat="server" Value="false"/>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblEndTime" runat="server" Text="永久開放" Visible="False" meta:resourcekey="lblEndTimeResource1"></asp:Label>
    <asp:Label ID="lblDelMsg" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblDelMsgResource1"></asp:Label>
    <asp:Label ID="lblAllowMember" runat="server" Text="是" Visible="False" meta:resourcekey="lblAllowMemberResource1"></asp:Label>
    <asp:Label ID="lblDenyMember" runat="server" Text="否" Visible="False" meta:resourcekey="lblDenyMemberResource1"></asp:Label>
    <asp:Label ID="lblDialogTitle" runat="server" Text="新增/維護公司語錄" Visible="False" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
    <asp:Label ID="lbConfirmCheckBox" runat="server"
        Text="確定要使用上一部門設定?     \r\n注意:確認後會刪除此部門所有的自訂資料!!" Visible="False" meta:resourcekey="lbConfirmCheckBoxResource1"></asp:Label>
</asp:Content>
