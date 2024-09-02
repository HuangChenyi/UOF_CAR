<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Member_SearchGroup" Title="搜尋群組" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SearchGroup.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick">
        <Items>
            <telerik:RadToolBarButton runat="server" Value="Keyword">
                <ItemTemplate>
                    <asp:TextBox ID="txtKeyword" runat="server"></asp:TextBox>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                Value="Search_group" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                Text="搜尋群組" meta:resourcekey="TBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" OnRowDataBound="Grid1_RowDataBound" Width="100%" meta:resourcekey="Grid1Resource1" DataKeyOnClientWithCheckBox="False" AllowPaging="True" OnPageIndexChanging="Grid1_PageIndexChanging">
        <Columns>
            <asp:TemplateField HeaderText="GroupID" Visible="False" meta:resourcekey="TemplateFieldResource1">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("GROUP_ID") %>' ID="Label1" meta:resourceKey="Label1Resource1"></asp:Label>



                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="群組名稱" meta:resourcekey="TemplateFieldResource2">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="LinkButton1" Text='<%# Bind("GROUP_NAME") %>' CommandName="return" meta:resourceKey="LinkButton1Resource1" OnCommand="LinkButton1_Command"></asp:LinkButton>



                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PARENT_GROUP_NAME" HeaderText="父群組" meta:resourcekey="BoundFieldResource1" />
        </Columns>
        <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
            NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
            PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""
            ShowHeaderPager="True" />
    </Fast:Grid>
</asp:Content>

