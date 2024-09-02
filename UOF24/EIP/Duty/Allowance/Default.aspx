<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_Allowance_Default" UICulture="auto" Culture="auto" meta:resourcekey="PageResource1" Codebehind="Default.aspx.cs" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">
    
        function OnClientButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "MaintainClass":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Duty/Allowance/MaintainClass.aspx", args.get_item(), '', 320, 500, openDialogResult);

                    break;
                case "Add":
                    args.set_cancel(true);
                    var classGuid = $("#<%=hiddenNodeTag.ClientID %>").val();
                    var _className = $("#<%=hiddenNodeText.ClientID %>").val();
                    $uof.dialog.open2("~/EIP/Duty/Allowance/Add.aspx", args.get_item(), '', 500, 500, openDialogResult, { "classGuid": classGuid, "className": _className });

                    break;
                case "Delete":
                    if (!confirm('<%=lbConfirmDelete.Text %>')) {
                        args.set_cancel(true);
                    }
                    break;
            }
        }
        function typeTreeClientNodeClicked(sender, args) {

            var node = args.get_node();

            $("#<%=hiddenNodeTag.ClientID %>").val(node.get_value());
            $("#<%=hiddenNodeText.ClientID %>").val(node.get_text());
        }

        function typeTreeOnClientLoad(sender, args) {

            var tree = $find("<%= this.typeTree.ClientID %>");
            var node = tree.get_selectedNode();
            if (node != null) {
                $("#<%=hiddenNodeTag.ClientID %>").val(node.get_value());
                $("#<%=hiddenNodeText.ClientID %>").val(node.get_text());
            }
            else {
                $("#<%=hiddenNodeTag.ClientID %>").val('');
                $("#<%=hiddenNodeText.ClientID %>").val('');
            }
        }
        function openDialogResult(returnValue) {
            if (returnValue === '' || returnValue === null)
                return false;
            else
                return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="rdToolBarMain" runat="server" Width="100%"
                OnButtonClick="rdToolBar_OnButtonClick"
                OnClientButtonClicking="OnClientButtonClicking"
                meta:resourcekey="rdToolBarMainResource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="類別維護" Value="MaintainClass"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m43.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m43.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m43.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m43.gif"
                        meta:resourcekey="rdToolBarMaintainClassResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"
                        meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="新增津貼" Value="Add"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        meta:resourcekey="rdToolBarAddResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"
                        meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除津貼" Value="Delete"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        meta:resourcekey="rdToolBarDeleteResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"
                        meta:resourcekey="RadToolBarButtonResource3">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="name"
                        meta:resourcekey="RadToolBarButtonResource4">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text="津貼名稱："
                                meta:resourcekey="Label2Resource1"></asp:Label>
                            <asp:TextBox ID="txtName" runat="server" Width="100px"
                                meta:resourcekey="txtNameResource1"></asp:TextBox>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"
                        meta:resourcekey="RadToolBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Serach"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        meta:resourcekey="rdToolBarSerachResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"
                        meta:resourcekey="RadToolBarButtonResource6">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel4" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadTreeView ID="typeTree" Runat="server"
                OnClientNodeClicked="typeTreeClientNodeClicked"
                OnClientLoad="typeTreeOnClientLoad" OnNodeClick="typeTree_NodeClick">
            </telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <Fast:Grid ID="allowanceGrid" runat="server" AutoGenerateCheckBoxColumn="True" AllowSorting="True"
                AutoGenerateColumns="False"  DataKeyOnClientWithCheckBox="False"
                DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                EnhancePager="True" KeepSelectedRows="False" PageSize="15" 
                    AllowPaging="True"
                OnPageIndexChanging="allowanceGrid_PageIndexChanging" OnRowDataBound="allowanceGrid_RowDataBound"
                Width="100%" OnSorting="allowanceGrid_Sorting" DataKeyNames="CODE" 
                DefaultSortColumnName="CODE"  
                meta:resourcekey="allowanceGridResource1"  
                >
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="津貼代碼" SortExpression="CODE" 
                        meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnCode" runat="server" Text='<%#: Bind("CODE") %>' 
                                meta:resourcekey="lbtnCodeResource1" OnClick="lbtnCode_Click" ></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="NAME" HeaderText="津貼名稱" SortExpression="NAME" 
                        meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="MAX_ONCE_APPLY_COUNT" HeaderText="單次申請數量" 
                        SortExpression="MAX_ONCE_APPLY_COUNT" 
                        meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="COMPANY_AMOUNT" HeaderText="公司津貼金額" 
                        DataFormatString="{0:#,0}" SortExpression="COMPANY_AMOUNT" 
                        meta:resourcekey="BoundFieldResource3">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="COMMITTEE_AMOUNT" HeaderText="福委津貼金額" 
                        DataFormatString="{0:#,0}" SortExpression="COMMITTEE_AMOUNT" 
                        meta:resourcekey="BoundFieldResource4">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SUB_TOTAL_AMOUNT" HeaderText="合計" 
                        DataFormatString="{0:#,0}" SortExpression="SUB_TOTAL_AMOUNT" 
                        meta:resourcekey="BoundFieldResource5">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ADDITIONAL_AMOUNT" HeaderText="額外補助金額" 
                        DataFormatString="{0:#,0}" SortExpression="ADDITIONAL_AMOUNT" 
                        meta:resourcekey="BoundFieldResource6">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="APPLY_BEFORE" HeaderText="事實發生日前n天申請" 
                        SortExpression="APPLY_BEFORE" meta:resourcekey="BoundFieldResource7">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="APPLY_AFTER" HeaderText="事實發生日後n天申請" 
                        SortExpression="APPLY_AFTER" meta:resourcekey="BoundFieldResource8">
                        <HeaderStyle Wrap="False" />
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="REMARK" HeaderText="備註" SortExpression="REMARK" 
                        meta:resourcekey="BoundFieldResource9">
                        <HeaderStyle Wrap="False" />
                    </asp:BoundField>
                </Columns>
            </Fast:Grid>
        </ContentTemplate>       
    </asp:UpdatePanel>
    <asp:Label runat="server" ID="lbYes" Text="是" Visible="False" meta:resourcekey="lbYesResource1"></asp:Label>
    <asp:Label runat="server" ID="lbNo" Text="否" Visible="False" meta:resourcekey="lbNoResource1"></asp:Label>
    <asp:Label runat="server" ID="lbConfirmDelete" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
    <asp:Label runat="server" ID="lblAll" Text="所有類別" Visible="False" ForeColor="Black" meta:resourcekey="lblAllResource1"></asp:Label>
    <asp:HiddenField ID="hiddenNodeTag" runat="server" />
    <asp:HiddenField ID="hiddenNodeText" runat="server" />
    <asp:Label ID="Label1" runat="server" Text="津貼類別" meta:resourcekey="Label3Resource1" Visible="false"></asp:Label>
                                            
</asp:Content>

