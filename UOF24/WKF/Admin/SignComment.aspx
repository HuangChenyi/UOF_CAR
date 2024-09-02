<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="WKF_Admin_SignComment" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SignComment.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <script type="text/javascript" id="telerikClientEvents1">

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "Insert") {
                args.set_cancel(true);
                $uof.dialog.open2("~/WKF/Admin/MaintainSignComment.aspx", args.get_item(), '<%=lblTitle.Text%>', 500, 400, function checkReturn(returnValue) { if (typeof (returnValue) == "undefined") return false; else return true; });
              }
            else if (value == "Delete") {
                if (!confirm("<%=lblDelete.Text %>"))
                    args.set_cancel(true);
            }
               
}

    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" meta:resourcekey="UltraWebToolbar1Resource1"
        OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" Width="100%" >
        <Items>
            <telerik:RadToolBarButton runat="server" Text="新增" meta:resourcekey="TBarButtonResource1"
                ImageUrl="~/Common/Images/Icon/icon_m23.png"
                HoveredImageUrl="~/Common/Images/Icon/icon_m23.png"
                DisabledImageUrl="~/Common/Images/Icon/icon_m23.png"
                CheckedImageUrl="~/Common/Images/Icon/icon_m23.png"
                Value="Insert">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1"  Image = "~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="刪除" meta:resourcekey="TBarButtonResource2"
                ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                Value="Delete">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3"  Image = "~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="Button 4" Value="Culture">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="語系：" meta:resourcekey="TBarLabelResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlCulture" runat="server" AutoPostBack="True" 
                                    OnSelectedIndexChanged="ddlCulture_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5"  Image = "~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>    
    
            <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True" 
                AllowSorting="True" AutoGenerateColumns="False"  
                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
                EnhancePager="True" PageSize="15" 
                  Width="800px" 
                DataKeyNames="COMMENT_ID" onrowdatabound="Grid1_RowDataBound" 
                AllowPaging="True"  
                onpageindexchanging="Grid1_PageIndexChanging">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="語系" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Bind("CULTURE") %>' 
                                meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnCulture" runat="server" Text='<%#: Bind("CULTURE") %>' 
                                meta:resourcekey="lbtnCultureResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Width="350px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label ID="lblCommentContent" runat="server" Text='<%#: Bind("COMMENT_CONTENT") %>' ></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="400px" Wrap="False" />
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
        </contenttemplate>
        <triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" 
                EventName="ButtonClick" />
        </triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" Visible="False"
        meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="罐頭意見維護" Visible="False"
        meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="lblAll" runat="server" Text="全部" Visible="False"
        meta:resourcekey="lblAllResource1"></asp:Label>
</asp:Content>

