<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_Report_QueryTimeTableByManager" Codebehind="QueryTimeTableByManager.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../../Common/Organization/UC_DeptManagerTree.ascx" TagName="UC_DeptManagerTree" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel4" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <uc1:UC_DeptManagerTree ID="UC_DeptManagerTree1" runat="server" ShowDeptManagerTree="True" ShowSuperiorTree="True" DisplayActiveControl="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>
   
                                                            
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                            <tr>
                                <td>
                                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick">
                                        <Items>
                                            <telerik:RadToolBarButton runat="server">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblQueryUser" runat="server" Text="查詢人員" meta:resourcekey="lblQueryUserResource1"></asp:Label>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="user">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtName" runat="server" Width="100px"></asp:TextBox>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton IsSeparator="true">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Text="查詢" Value="Search" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarSearchResource1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton IsSeparator="true">
                                            </telerik:RadToolBarButton>
                                        </Items>
                                    </telerik:RadToolBar>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional" RenderMode="Inline">
                                        <ContentTemplate>
                                            <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                                AutoGenerateColumns="False" DataKeyNames="USER_GUID" Width="100%" OnRowDataBound="Grid1_RowDataBound"
                                                OnPageIndexChanging="Grid1_PageIndexChanging" OnSorting="Grid1_Sorting" DataKeyOnClientWithCheckBox="False"
                                                PageSize="15" DefaultSortDirection="Ascending" EnableModelValidation="True" EnhancePager="True"
                                                DefaultSortColumnName="ACCOUNT" EmptyDataText="沒有資料" KeepSelectedRows="False">
                                                <ExportExcelSettings AllowExportToExcel="False" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="帳號" ShowHeader="False" SortExpression="ACCOUNT" meta:resourcekey="TemplateFieldResource1">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("ACCOUNT") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="名稱" meta:resourcekey="BoundFieldResource1" >
                                                       <ItemTemplate>
                                                         <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                                                       </ItemTemplate>
                                                       <HeaderStyle Wrap="False" />
                                                       <ItemStyle Wrap="False" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="帳號停用" meta:resourcekey="TemplateFieldResource2">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblSuppend"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="EXPIRE_DATE" DataFormatString="{0:d}" HtmlEncode="False"
                                                        HeaderText="到期日" SortExpression="EXPIRE_DATE" meta:resourcekey="BoundFieldResource2" />
                                                    <asp:BoundField DataField="EMAIL" HeaderText="電子郵件" SortExpression="EMAIL" meta:resourcekey="BoundFieldResource3" />
                                                </Columns>
                                                <EnhancePagerSettings ShowHeaderPager="True" />
                                            </Fast:Grid>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
    <asp:Label ID="Label1" runat="server" Text="內部組織結構列表" Visible="false" meta:resourcekey="Label1Resource1"></asp:Label>
    <asp:Label runat="server" ID="lbYes" Text="是" Visible="False" meta:resourcekey="lbYesResource1"></asp:Label>
    <asp:Label runat="server" ID="lbNo" Text="否" Visible="False" meta:resourcekey="lbNoResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

