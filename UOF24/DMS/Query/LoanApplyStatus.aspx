<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_Query_LoanApplyStatus" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="LoanApplyStatus.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        
    <style>
        .WordBreak {
            word-break: break-word;
            overflow: hidden;
        }
    </style>

    <script id="LoanApplyStatusjs" type="text/javascript">

        function RadToolbar1_Click(sender, args) {
            var toolBar = sender;
            var button = args.get_item();
            if (button.get_value() == "Delete") {
                if (confirm('<%=lblConfirmDelete.Text %>') == false)
                    args.set_cancel(true);
            }
        }

    </script>
    <telerik:RadToolBar ID="RadToolbar1" runat="server" Width="100%" OnButtonClick="RadToolbar1_ButtonClicked" 
        OnClientButtonClicking="RadToolbar1_Click" meta:resourcekey="barMainResource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Enabled="true" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                DisabledImageUrl="~/Common/Images/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" 
                ImageUrl="~/Common/Images/Icon/icon_m03.gif" Text="刪除" Value="Delete" meta:resourcekey="TBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2" />
        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <Fast:Grid ID="gridPersonLendApprove" runat="server" DataKeyNames="DOC_ID,LEND_USER" Width="100%" PageSize="15"
                AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                DataKeyOnClientWithCheckBox="True" DefaultSortDirection="Ascending" 
                EnhancePager="True" EmptyDataText="沒有資料" EnableModelValidation="True" 
                KeepSelectedRows="False"
                OnPageIndexChanging="gridPersonLendApprove_PageIndexChanging"
                OnRowDataBound="gridPersonLendApprove_RowDataBound" 
                OnSorting="gridPersonLendApprove_Sorting" >
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="文件編號" SortExpression="DOC_SERIAL" meta:resourcekey="TemplateFieldResource4">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("DOC_SERIAL") %>' ID="TextBox2"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <span style="width:80px;">
                                <asp:Label runat="server" Text='<%#: Bind("DOC_SERIAL") %>' ID="Label1"></asp:Label>
                            </span>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" Wrap="false" />
                        <ItemStyle Wrap="false" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="文件名稱" SortExpression="DOC_NAME" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("DOC_NAME") %>' ID="TextBox4"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <span style="word-break: break-all;">
                                <asp:Image runat="server" ID="docIcon2" ImageUrl="~/DMS/images/icon/unknown.gif"></asp:Image>
                                &nbsp;
                                <asp:Label runat="server" Text='<%#: Bind("DOC_NAME") %>' ID="lblDocName2"></asp:Label></span>
                        </ItemTemplate>
                        <HeaderStyle Width="20%" Wrap="false" />
                        <ItemStyle Wrap="false" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="MANUAL_VERSION" HeaderText="版本" SortExpression="MANUAL_VERSION" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Width="5%" Wrap="false" />
                        <ItemStyle HorizontalAlign="Center" Wrap="false" />
                    </asp:BoundField>
                    <asp:BoundField DataField="LEND_REASON" HeaderText="調閱原因" meta:resourcekey="BoundFieldResource7" SortExpression="LEND_REASON" > 
                        <HeaderStyle Width="35%" Wrap="false" />
                        <ItemStyle HorizontalAlign="Left" CssClass="WordBreak"/>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="狀態" SortExpression="APPROVE_STATUS" meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("APPROVE_STATUS") %>' ID="TextBox1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("APPROVE_STATUS") %>' ID="labStatus"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="5%" Wrap="false" />
                        <ItemStyle ForeColor="#FF8000" HorizontalAlign="Center" Wrap="false" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="調閱開始時間" SortExpression="LEND_START" meta:resourcekey="BoundFieldResource3">
                        <ItemTemplate>
                            <asp:Label runat="server" Text="" ID="lblLendStart"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" Wrap="false" />
                        <ItemStyle HorizontalAlign="Center" Wrap="false"  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="調閱結束時間" SortExpression="LEND_END" meta:resourcekey="BoundFieldResource4">
                        <ItemTemplate>
                            <asp:Label runat="server" Text="" ID="lblLendEnd"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="10%" Wrap="false" />
                        <ItemStyle HorizontalAlign="Center" Wrap="false"  />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnInfo2" Text="資訊" meta:resourcekey="lbtnInfo2Resource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="5%" Wrap="false" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle Height="30px" />
            </Fast:Grid>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolbar1" EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:Label ID="lblApproving" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovingResource1"></asp:Label>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblAccept" runat="server" Text="允許調閱" Visible="False" meta:resourcekey="lblAcceptResource1"></asp:Label>
    <asp:Label ID="lblDeny" runat="server" Text="拒絕調閱" Visible="False" meta:resourcekey="lblDenyResource1"></asp:Label>

</asp:Content>
