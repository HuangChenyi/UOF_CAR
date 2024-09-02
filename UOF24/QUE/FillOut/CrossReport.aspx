<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_FillOut_CrossReport" Title="交叉分析" Codebehind="CrossReport.aspx.cs" %>
   
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblItemName" runat="server" style="font-size:16px;color:Blue;margin-left:5px;" Text=""></asp:Label>
    <asp:DataList ID="dsCross" Width="100%" runat="server" OnItemDataBound="dsCross_ItemDataBound">
        <ItemTemplate>
            <table style="width: 100%;">
                <tr>
                    <td  style="padding-left:5px">
                        <asp:Label ID="lblPropertyName" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left:10px">
                        <telerik:RadChart ID="chart" runat="server"  DefaultType="StackedBar100" Width="600px">
                            <ChartTitle Visible ="false">
                                <Appearance Visible="False">
                                </Appearance>
                            </ChartTitle>
                            <Series>
                                <telerik:ChartSeries Name="Series 1" Type="StackedBar100">
                                  </telerik:ChartSeries>
                                <telerik:ChartSeries Name="Series 2" Type="StackedBar100">
                                </telerik:ChartSeries>
                            </Series>
                            
                            <PlotArea>
                                <XAxis DataLabelsColumn="PROPERTY_NAME">
                                    <AxisLabel>
                                        <Appearance Visible="false"></Appearance>
                                    </AxisLabel>
                                   
                                    <Items>
                                        <telerik:ChartAxisItem>
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="1">
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="2">
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="3">
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="4">
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="5">
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="6">
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="7">
                                        </telerik:ChartAxisItem>
                                    </Items>
                                   
                                </XAxis>

                                
                                <YAxis AutoScale="false" MaxValue="100" MinValue="0" Step="10" IsZeroBased="true">
                                   
                                    <Items>
                                        <telerik:ChartAxisItem Value="0" TextBlock-Text="0%">
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="10" TextBlock-Text="10%">
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="20" TextBlock-Text="20%">
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="30" TextBlock-Text="30%">
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="40" TextBlock-Text="40%">
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="50" TextBlock-Text="50%">
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="60" TextBlock-Text="60%">
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="70" TextBlock-Text="70%">
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="80" TextBlock-Text="80%">
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="90" TextBlock-Text="90%">
                                        </telerik:ChartAxisItem>
                                        <telerik:ChartAxisItem Value="100" TextBlock-Text="100%">
                                        </telerik:ChartAxisItem>
                                    </Items>
                                  
                                
                                </YAxis>

                                
                            </PlotArea>
                        </telerik:RadChart>
                            
                      
                    </td>
                </tr>
            </table>
        </ItemTemplate>
        <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
    </asp:DataList>
</asp:Content>
