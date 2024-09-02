<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Currency_CurrencyRateMA" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="CurrencyRateMA.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
<ContentTemplate>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td colspan="2" height="20px">
                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" meta:resourcekey="RadToolBar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server"  >
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="年份：" meta:resourcekey="RadToolBarYearResource1"></asp:Label>
                    </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="Year" 
                        meta:resourcekey="RadToolBarButtonResource1" Owner="">
                        <ItemTemplate>
                            <asp:TextBox ID="txtYear" runat="server" meta:resourcekey="txtYearResource1"></asp:TextBox>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        meta:resourcekey="RadToolBarQueryResource1" Owner="">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" 
                        meta:resourcekey="RadToolBarButtonResource2" Owner=""></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="新增年份匯率" Value="Create"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m44.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m44.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m44.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m44.gif"
                        meta:resourcekey="RadToolBarCreateResource1" Owner="">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" 
                        meta:resourcekey="RadToolBarButtonResource3" Owner=""></telerik:RadToolBarButton>
                </Items>
                </telerik:RadToolBar>                
            </td>
        </tr>
        <tr>
            <td>
                <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" 
                                    AllowSorting="True"  
                                     Width="100%" 
                                    AutoGenerateColumns="False"  
                                     
                                     DataKeyOnClientWithCheckBox="True" 
                                    EnhancePager="True" PageSize="15" 
                                    DefaultSortDirection="Ascending" 
                    EmptyDataText="沒有資料" KeepSelectedRows="False" 
                    onrowdatabound="Grid1_RowDataBound" meta:resourcekey="Grid1Resource1" 
                       
                      >
                                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                                <ExportExcelSettings AllowExportToExcel="False" />
                                <HeaderStyle Wrap="False" />
                            </Fast:Grid>
            </td>
        </tr>
    </table>
     </ContentTemplate> 
</asp:UpdatePanel>
<asp:Label ID="lblYEAR" runat="server" Text="年份" Visible="False" meta:resourcekey="lblYEARResource1"></asp:Label>
<asp:Label ID="lblMonth" runat="server" Text="月份" Visible="False" meta:resourcekey="lblMonthResource1"></asp:Label>
<asp:Label ID="lblmodifier" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblmodifierResource1"></asp:Label>
<asp:Label ID="lblmodifytime" runat="server" Text="修改日期" Visible="False" meta:resourcekey="lblmodifytimeResource1"></asp:Label>
<asp:Label ID="lblRateExist" runat="server" Text="已產生過次年的匯率資料" Visible="False" meta:resourcekey="lblRateExistResource1"></asp:Label>    
<asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>


