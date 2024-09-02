<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_Charts_GlobalPublishCountChart" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="GlobalPublishCountChart.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Charting" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
    <table width="100%" class="PopTable">                         
        <tr>
            <td >
                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" >
                    <Items>
                        <telerik:RadToolBarButton runat="server">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="日期：" meta:resourcekey="Label1Resource1"></asp:Label>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="date">
                            <ItemTemplate>
                                <table id="Table1" width = "275px" cellpadding="0" cellspacing="0" runat="server">
                                <tr id="Tr1" runat="server">
                                    <td id="Td1"  width="125px" runat="server">
                                        <telerik:RadDatePicker Runat="server" ID="rdStart"></telerik:RadDatePicker>
                                    </td>
                                    <td id="Td2" wihth = "25px" align="center" runat="server">
                                        <asp:Label ID="Label2" runat="server" Text="~" meta:resourcekey="Label2Resource1"></asp:Label>
                                    </td>
                                    <td id="Td3"  width="125px" runat="server">
                                        <telerik:RadDatePicker Runat="server" ID="rdEnd"></telerik:RadDatePicker>
                                    </td>
                                </tr>
                            </table> 
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            meta:resourcekey="RadToolBarQueryResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>            
           </td>
        </tr>
        <tr>
            <td style=" text-align:center;">
                <telerik:RadChart ID="rdChart" runat="server" AutoTextWrap="false" OnItemDataBound="rdChart_ItemDataBound" Style="margin: 0 auto" Height="400px">
                    <series>
                        <telerik:ChartSeries Name="Series 1">
                            <appearance>
                                <labelappearance visible="False">
                                </labelappearance>
                                <FillStyle FillType="Solid">
                                </FillStyle>
                                <Border Color="Black" />
                            </appearance>
                        </telerik:ChartSeries>
                        <telerik:ChartSeries Name="Series 2">
                        </telerik:ChartSeries>
                    </series>
                    <legend visible="False">
                        <appearance visible="False" >
                        </appearance>
                    </legend>
                    <plotarea>
                        <Appearance Dimensions-Margins="20px, 20px, 100px, 80px">
                            <FillStyle FillType="Solid" MainColor="White"></FillStyle>                            
                        </Appearance>
                        <emptyseriesmessage visible="True">
                            <appearance visible="True">
                            </appearance>
                        </emptyseriesmessage>
                        <XAxis DataLabelsColumn="PUBLISH_DATE" >
                             <appearance>
                                 <labelappearance rotationangle="270" dimensions-margins="10px, 1px, 1px, 1px">
                                 </labelappearance>
                                 <TextAppearance TextProperties-Color="Black">
                                 </TextAppearance>
                             </appearance>
                            <AxisLabel Visible="true">
                                <appearance visible="True">
                                </appearance>
                                <TextBlock>
                                    <Appearance AutoTextWrap="False">
                                    </Appearance>
                                </TextBlock>
                            </AxisLabel>
                        </XAxis>
                        <yaxis AutoScale="true" MinValue="0" Step="1" VisibleValues="Positive">
                            <AxisLabel Visible="true">
                                <Appearance RotationAngle="0">
                                </Appearance>
                            </AxisLabel>
                            <Appearance MajorTick-Visible="False" MinorTick-Visible="False" MajorGridLines-Color="#999999">
                                <MinorGridLines Visible="False"></MinorGridLines>
                            </Appearance>
                        </yaxis>                        
                    </plotarea>
                    <ChartTitle Visible="False">
                        <Appearance Visible="False">
                        </Appearance>
                    </ChartTitle>
                </telerik:RadChart>

            </td>
        </tr>
    </table>   
  </contenttemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblMonth" runat="server" Text="月份" Visible="False" meta:resourcekey="lblMonthResource1"></asp:Label>
    <asp:Label ID="lblCustCount" runat="server" Text="客戶數" Visible="False" meta:resourcekey="lblCustCountResource1"></asp:Label>
</asp:Content>

