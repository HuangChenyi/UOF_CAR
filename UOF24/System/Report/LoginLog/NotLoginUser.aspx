<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_Report_LoginLog_NotLoginUser" Title="未登入使用者查詢" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="NotLoginUser.aspx.cs" %>

<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
<!--
    function RadToolBar1_NL_ButtonClicking(sender, args) {
        var Key = args.get_item().get_value();
        if (Key == "btnSendMail") {
            // 人員群組
            var toolbarbutton = $find("<%=RadToolBar1.ClientID%>").findItemByValue("UserType");
            var ddlUserType = $telerik.findElement(toolbarbutton.get_element(), ("ddlUserType"));  
            var userType = ddlUserType.value; 

            // 查詢最後登入日期
            var toolbarDaybutton = $find("<%=RadToolBar1.ClientID%>").findItemByValue("QueryDate");
            var rdpQueryDate = $telerik.findElement(toolbarDaybutton.get_element(), ("rdpQueryDate"));  
            var queryDate = rdpQueryDate.value;

            args.set_cancel(true);
            if (userType != null && typeof userType != "undefined") {
                $uof.dialog.open2("~/System/Report/LoginLog/SendNotLoginUserMail.aspx", args.get_item(), "", 450, 350, function () { return false; },
                    { "QueryDate": queryDate, "usertype": userType });
            }
        }
    }
    // -->
    function OnValueChanging(sender, args)
    {
        if (args.get_newValue() == "") {
            args.set_newValue(args.get_oldValue());
        }
    }
    </script>
    <center style="text-align: left">
        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" 
            OnButtonClick="RadToolBar1_ButtonClick" 
            OnClientButtonClicking="RadToolBar1_NL_ButtonClicking" 
            meta:resourcekey="RadToolBar1Resource1">
            <Items>
                <telerik:RadToolBarButton runat="server" Value="UserType" 
                    meta:resourcekey="RadToolBarButtonResource1">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="padding-left: 2px; padding-right: 1px">
                                    <asp:Label runat="server" Text="人員群組：" meta:resourcekey="TBLabelResource1"></asp:Label></td>
                                <td style="padding-left: 2px; padding-right: 1px">
                                    <asp:DropDownList runat="server" ID="ddlUserType" meta:resourcekey="ddlUserTypeResource1">
                                        <asp:ListItem Value="all" meta:resourcekey="ListItemResource1" Text="全部"></asp:ListItem>
                                        <asp:ListItem Value="Member" meta:resourcekey="ListItemResource2" Text="外部會員"></asp:ListItem>
                                        <asp:ListItem Value="Employee" meta:resourcekey="ListItemResource3" Text="內部員工"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" IsSeparator="True" 
                    meta:resourcekey="RadToolBarButtonResource2">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="QueryDate" 
                    meta:resourcekey="RadToolBarButtonResource3">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="padding-left: 2px; padding-right: 1px">
                                    <asp:Label runat="server" Text="查詢最後登入日期：" meta:resourcekey="TBLabelResource2"></asp:Label></td>
                                <td style="padding-left: 2px; padding-right: 1px">
                                    <telerik:RadDatePicker ID="rdpQueryDate" runat="server"  
                                        meta:resourcekey="rdpQueryDateResource1">
                                        <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" >
                                        </Calendar>
                                        <DateInput  LabelWidth="64px"  ClientEvents-OnValueChanging="OnValueChanging"
                                            Width="">
                                        </DateInput>
                                        <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl=""   />
                                    </telerik:RadDatePicker>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" IsSeparator="True" 
                    meta:resourcekey="RadToolBarButtonResource4">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                    HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                    Value="btnQuery" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                    Text="查詢" meta:resourcekey="TBarButtonResource1">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" IsSeparator="True" 
                    meta:resourcekey="RadToolBarButtonResource5">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/EIP/Personal/icon_images/icon_m33.gif" ImageUrl="~/EIP/Personal/icon_images/icon_m33.gif"
                    Value="btnSendMail" CheckedImageUrl="~/EIP/Personal/icon_images/icon_m33.gif" Text="發送郵件" meta:resourcekey="TBarButtonResource4">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" IsSeparator="True" 
                    meta:resourcekey="RadToolBarButtonResource6">
                </telerik:RadToolBarButton>
            </Items>
        </telerik:RadToolBar>
    </center>
    <center style="text-align: left">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <contenttemplate> 
                <fast:grid id="DGList" runat="server" allowsorting="True" autogeneratecheckboxcolumn="False" autogeneratecolumns="False" DefaultSortColumnName="LAST_LOGIN_TIME"
                            DataKeyNames="USER_GUID" OnPageIndexChanging="DGList_PageIndexChanging" OnRowDataBound="DGList_RowDataBound" Width="700px" DefaultSortDirection="Ascending"
                            AllowPaging="True" OnSorting="DGList_Sorting" DataKeyOnClientWithCheckBox="False" OnBeforeExport="DGList_BeforeExport" CustomDropDownListPage="False" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor="">
                     <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                     <ExportExcelSettings AllowExportToExcel="True" />
                    <Columns>
                         <asp:TemplateField HeaderText="部門/群組" SortExpression="GROUP_NAME" meta:resourcekey="tfDeptGroupResource1">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Bind("GROUP_NAME") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Label ID="lblDept" runat="server" Text='<%#: Bind("GROUP_NAME") %>'></asp:Label>
                             </ItemTemplate>
                             <HeaderStyle Wrap="False" />
                             <ItemStyle Wrap="False" />
                         </asp:TemplateField>
                         <asp:BoundField DataField="ACCOUNT" HeaderText="帳號" SortExpression="ACCOUNT" meta:resourcekey="tfAccountResource1">
                             <ItemStyle Wrap="False"/>
                             <HeaderStyle Wrap="False"/>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="人員名稱" meta:resourcekey="tfNameResource1" SortExpression="NAME">
                            <itemtemplate>
                                  <asp:Label runat="server" ID="lblName"></asp:Label>                          
                            </itemtemplate>
                            <ItemStyle Wrap="False"/>
                            <HeaderStyle Wrap="False"/>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="最後登入時間" meta:resourcekey="BoundFieldResource1" SortExpression="LAST_LOGIN_TIME">
                            <itemtemplate>
                                 <asp:Label runat="server" ID="lblLastLoginTime"></asp:Label>                           
                           </itemtemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="IP" HeaderText="最後登入IP" SortExpression="IP" meta:resourcekey="BoundFieldResource2">
                            <ItemStyle Wrap="False"/>
                            <HeaderStyle Wrap="False"/>
                        </asp:BoundField>
                    </Columns>
                </fast:grid>
                <asp:TextBox ID="txtMail" runat="server" Visible="False" meta:resourcekey="txtMailResource1"></asp:TextBox> 
            </contenttemplate>
            <triggers>
                <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" /> 
           </triggers>
        </asp:UpdatePanel>
    </center>
    <asp:HiddenField ID="hfCurrentGUID" runat="server" />
</asp:Content>

