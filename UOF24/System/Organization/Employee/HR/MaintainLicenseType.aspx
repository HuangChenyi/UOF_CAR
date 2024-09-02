<%@ Page Title="證照維護" Language="C#" MasterPageFile="~/Master/TwoColumn.master"
    AutoEventWireup="true" Inherits="System_Organization_Employee_HR_MaintainLicenseType"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="MaintainLicenseType.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContentPlaceHolder" Runat="Server">
      <script type="text/javascript">

        function RadToolBar1_LicType_ButtonClicking(sender, args) {
              var Key = args.get_item().get_value();
              if (Key === "btnMaintain") {
                  args.set_cancel(true);
                  $uof.dialog.open2("~/System/Organization/Employee/HR/MaintainEipLicType.aspx", args.get_item(), "", 300, 500, OpenDialogResult);
             
                }
            if (Key === "btnDelete") {
                args.set_cancel(!confirm('<%=lblConfirmDel.Text %>'));
            }
            if (Key === "btnInsert") {
                var tree = $find('<%=RadTreeViewLicType.ClientID%>');
                var node = tree.get_selectedNode();
                var focusenode = node.get_value();
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Employee/HR/MaintainEipLicense.aspx", args.get_item(), "",  450, 250, OpenDialogResult,  { "FocuseNode": focusenode });
            }
        }
    
          function OpenDialogResult(returnValue) {
              if (typeof (returnValue) === 'undefined' || returnValue === null) {
                  return false;
              }
              else {
                  return true;
              }
              
          }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" Runat="Server" Height="0px">
        <asp:Label ID="lblConfirmDel" runat="server" Text="確認刪除嗎?" Visible="False" meta:resourcekey="lblConfirmDelResource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="類別維護" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="lblTitle2" runat="server" Text="維護證照" Visible="False" meta:resourcekey="lblTitle2Resource1"></asp:Label>
    <asp:Label ID="lblAllType" runat="server" Text="全部" Visible="False" meta:resourcekey="lblAllTypeResource1"></asp:Label>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Always">
        <ContentTemplate>
             <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick"
                            OnClientButtonClicking="RadToolBar1_LicType_ButtonClicking">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Value="btnMaintain" Text="類別維護" DisabledImageUrl="~/Common/Images/Icon/icon_m43.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m43.gif" ImageUrl="~/Common/Images/Icon/icon_m43.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m43.gif" meta:resourcekey="TBarButtonResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="新增證照" Value="btnInsert" DisabledImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m02.gif" ImageUrl="~/Common/Images/Icon/icon_m02.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m02.gif" meta:resourcekey="TBarButtonResource2">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="刪除證照" Value="btnDelete" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="TBarButtonResource3">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True">
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
             </ContentTemplate>

    </asp:UpdatePanel>
	</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="LeftContentPlaceHolder" Runat="Server">   
 
        <asp:Label ID="Label2" runat="server" meta:resourcekey="Label1Resource1" Text="證照類別" Visible="false"/>
  
         <asp:UpdatePanel ID="UpdatePanel3" runat="server" RenderMode="Inline" UpdateMode="Always">
        <ContentTemplate>    
  <telerik:RadTreeView ID="RadTreeViewLicType" runat="server" OnNodeClick="RadTreeViewLicType_NodeClick">
                                                            </telerik:RadTreeView>
             </ContentTemplate>

    </asp:UpdatePanel>
    	</asp:Content>    
 <asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" Runat="Server">    
     <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Always">
        <ContentTemplate>    
                        <Fast:Grid ID="LicenseGrid" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DataKeyNames="LICENSE_GUID"
                            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                            EnableModelValidation="True" EnhancePager="True" OnPageIndexChanging="LicenseGrid_PageIndexChanging"
                            OnRowDataBound="LicenseGrid_RowDataBound" OnSorting="LicenseGrid_Sorting" PageSize="15"
                            KeepSelectedRows="False" meta:resourcekey="LicenseGridResource1">
                            <EnhancePagerSettings ShowHeaderPager="True" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="證照代碼" SortExpression="LICENSE_GUID" meta:resourcekey="TemplateFieldResource1">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Visible="False" meta:resourcekey="Label1Resource2"></asp:Label>
                                        <asp:LinkButton ID="lbtnLicGuid" runat="server" Text='<%#: Eval("LICENSE_GUID") %>'
                                            meta:resourcekey="lbtnLicGuidResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="100px" Wrap="False" />
                                    <HeaderStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="NAME" HeaderText="證照名稱" SortExpression="NAME" meta:resourcekey="BoundFieldResource1">
                                    <HeaderStyle Wrap="False" />
                                </asp:BoundField>
                            </Columns>
                        </Fast:Grid>
       </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
