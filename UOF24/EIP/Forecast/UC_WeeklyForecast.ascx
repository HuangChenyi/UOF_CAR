<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Forecast_UC_WeeklyForecast" Codebehind="UC_WeeklyForecast.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="System.Web.UI" tagprefix="cc1" %>
<%@ Register assembly="Ede.Uof.Utility.Component.Grid" namespace="Ede.Uof.Utility.Component" tagprefix="Fast" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
    <telerik:RadToolBar ID="RadToolBar1" Runat="server" Width="100%">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="Button 0" Value="SelectDays">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="地區" meta:resourcekey="Label1Resource1"></asp:Label>
                            </td>
                            <td>
                                &nbsp;
                              </td>
                            <td>
                                <asp:DropDownList ID="ddlDailyArea" runat="server"
                                        AutoPostBack="True" 
                                        OnSelectedIndexChanged="ddlDailyArea_SelectedIndexChanged" 
                                        meta:resourcekey="ddlDailyAreaResource1">
                                        <asp:ListItem Text="臺北市" Value="36_01.xml" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                        <asp:ListItem Text="高雄市" Value="36_02.xml" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                        <asp:ListItem Text="基隆市" Value="36_03.xml" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                        <asp:ListItem Text="新北市" Value="36_04.xml" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                        <asp:ListItem Text="桃園市" Value="36_05.xml" meta:resourcekey="ListItemResource5"></asp:ListItem>
                                        <asp:ListItem Text="新竹縣" Value="36_06.xml" meta:resourcekey="ListItemResource6"></asp:ListItem>
                                        <asp:ListItem Text="苗栗縣" Value="36_07.xml" meta:resourcekey="ListItemResource7"></asp:ListItem>
                                        <asp:ListItem Text="臺中市" Value="36_08.xml" meta:resourcekey="ListItemResource8"></asp:ListItem>
                                        <asp:ListItem Text="彰化縣" Value="36_09.xml" meta:resourcekey="ListItemResource9"></asp:ListItem>
                                        <asp:ListItem Text="南投縣" Value="36_10.xml" 
                                            meta:resourcekey="ListItemResource10"></asp:ListItem>
                                        <asp:ListItem Text="雲林縣" Value="36_11.xml" 
                                            meta:resourcekey="ListItemResource11"></asp:ListItem>
                                        <asp:ListItem Text="嘉義縣" Value="36_12.xml" 
                                            meta:resourcekey="ListItemResource12"></asp:ListItem>
                                        <asp:ListItem Text="臺南市" Value="36_13.xml" 
                                            meta:resourcekey="ListItemResource13"></asp:ListItem>
                                        <asp:ListItem Text="新竹市" Value="36_14.xml" 
                                            meta:resourcekey="ListItemResource14"></asp:ListItem>
                                        <asp:ListItem Text="屏東縣" Value="36_15.xml" 
                                            meta:resourcekey="ListItemResource15"></asp:ListItem>
                                        <asp:ListItem Text="嘉義市" Value="36_16.xml" 
                                            meta:resourcekey="ListItemResource16"></asp:ListItem>
                                        <asp:ListItem Text="宜蘭縣" Value="36_17.xml" 
                                            meta:resourcekey="ListItemResource17"></asp:ListItem>
                                        <asp:ListItem Text="花蓮縣" Value="36_18.xml" 
                                            meta:resourcekey="ListItemResource18"></asp:ListItem>
                                        <asp:ListItem Text="臺東縣" Value="36_19.xml" 
                                            meta:resourcekey="ListItemResource19"></asp:ListItem>
                                        <asp:ListItem Text="澎湖縣" Value="36_20.xml" 
                                            meta:resourcekey="ListItemResource20"></asp:ListItem>
                                        <asp:ListItem Text="金門縣" Value="36_21.xml" 
                                            meta:resourcekey="ListItemResource21"></asp:ListItem>
                                        <asp:ListItem Text="連江縣" Value="36_22.xml" 
                                            meta:resourcekey="ListItemResource22"></asp:ListItem>
                                    </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="Button 1" IsSeparator="true">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
<Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
    AutoGenerateColumns="False"  
    ShowHeader="False"  Width="100%" BorderStyle="None" 
            BorderWidth="0px" OnRowDataBound="Grid1_RowDataBound" 
            SkinID="HomepageBlockStyle"  
            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
            EnhancePager="True" PageSize="15" 
    EmptyDataText="沒有資料" EnableModelValidation="True" 
    KeepSelectedRows="False" meta:resourcekey="Grid1Resource1">
      <EnhancePagerSettings ShowHeaderPager="True" />
      <ExportExcelSettings AllowExportToExcel="False" />
    <Columns>
        <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
            <ItemTemplate>
                <table style="vertical-align:middle" width="100%">
                    <tr id="weeklyHeader2" runat="server" style="background-color:White; border-bottom-width:thin; border-bottom-style:solid">
                        <td runat="server">
                        </td>
                        <td style="width:30%" runat="server">
                            <asp:Label ID="Label4" runat="server" Text="日期" meta:resourcekey="Label4Resource1"></asp:Label>
                        </td>
                        <td style="width:40%" runat="server">
                             <asp:Label ID="Label2" runat="server" Text="天氣狀況" meta:resourcekey="Label2Resource1"></asp:Label>
                        </td>
                        <td style="width:30%" runat="server">
                            <asp:Label ID="Label3" runat="server" Text="溫度(℃)" meta:resourcekey="Label3Resource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="min-width:16px">
                            <img height="16px" src="<%=ResolveUrl("~/common/images/icon/icon02.png")%>" width="16px" />     
                        </td>
                        <td style="width:30%">
                            <asp:Label ID="lblTime" runat="server" meta:resourcekey="lblTimeResource1"></asp:Label>
                        </td>
                        <td style="width:40%">
                            <asp:Image ID="imgStatus" runat="server" Height="25px" Width="25px" 
                                ImageAlign="Middle" meta:resourcekey="imgStatusResource1" />
                             <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label>
                            
                        </td>
                        <td style="width:30%">
                            <asp:Label ID="lblTemperature" runat="server" 
                                meta:resourcekey="lblTemperatureResource1"></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</Fast:Grid>
<table width="100%">
    <tr>
        <td>
            <asp:Label ID="lblErrorMessage" runat="server" Text="發生錯誤，錯誤原因如下:{0}" 
                Visible="False" meta:resourcekey="lblErrorMessageResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:LinkButton ID="lbtnSourceWeb" runat="server" Text="請點此連結觀看氣象局網頁" 
                Visible="False" meta:resourcekey="lbtnSourceWebResource1"></asp:LinkButton>
        </td>
    </tr>
</table>
</ContentTemplate>
</asp:UpdatePanel>