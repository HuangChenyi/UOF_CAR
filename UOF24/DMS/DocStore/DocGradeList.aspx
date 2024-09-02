<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocGradeList" Title="評分列表" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocGradeList.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
    <telerik:RadChart ID="RadChart1" AutoLayout="True" width="445px" Height="191px" runat="server" onitemdatabound="RadChart1_ItemDataBound" 
                            meta:resourcekey="rcDocGradeResource1" DefaultType="Line">
                            <Series>
                                <telerik:ChartSeries Name="Series 1" DataYColumn="DOC_VER_GRADE" ActiveRegionToolTip="#ITEM:#Y" Type="Line">
                                    <Appearance ShowLabels="False">
                                    
                                        <FillStyle MainColor="213, 247, 255">
                                        </FillStyle>
                                    
                                    </Appearance>
                                </telerik:ChartSeries>
                            </Series>
                            <Legend Visible="False">
                                <Appearance Visible="False">
                                </Appearance>
                            </Legend>
                            <PlotArea>
                                <XAxis DataLabelsColumn="MANUAL_VERSION" AutoScale="False" MaxValue="7" MinValue="0" 
                                    Step="1" IsZeroBased="False">
                                    <Appearance MajorTick-Visible="False" CustomFormat="0.0">
                                        <MajorGridLines Visible="False" />
                                    </Appearance>
<Items>
<telerik:ChartAxisItem></telerik:ChartAxisItem>
<telerik:ChartAxisItem Value="1"></telerik:ChartAxisItem>
<telerik:ChartAxisItem Value="2"></telerik:ChartAxisItem>
<telerik:ChartAxisItem Value="3"></telerik:ChartAxisItem>
<telerik:ChartAxisItem Value="4"></telerik:ChartAxisItem>
<telerik:ChartAxisItem Value="5"></telerik:ChartAxisItem>
<telerik:ChartAxisItem Value="6"></telerik:ChartAxisItem>
<telerik:ChartAxisItem Value="7"></telerik:ChartAxisItem>
</Items>
                                </XAxis>
                                <YAxis>
                                    <Appearance MinorTick-Visible="False" MajorTick-Visible="False">
                                        <MinorGridLines Visible="False" />
                                    </Appearance>
                                </YAxis>
                            </PlotArea>
                            <ChartTitle Visible="False">
                                <Appearance Visible="False">
                                </Appearance>
                            </ChartTitle>
                        </telerik:RadChart>
    
    <br />
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
        <center>
        <table style="width:100%">
        <tr>
        <td style=" text-align:left;">
            <fast:grid id="gdGradeList" runat="server" autogeneratecheckboxcolumn="False" width="100%" AllowSorting="True" AutoGenerateColumns="False"  OnRowDataBound="gdGradeList_RowDataBound"   DataKeyOnClientWithCheckBox="False" EnhancePager="True" PageSize="15" OnSorting="gdGradeList_Sorting">
        <Columns>
            <asp:BoundField DataField="MANUAL_VERSION" HeaderText="版本" meta:resourcekey="BoundFieldResource1" SortExpression="MANUAL_VERSION" />
            <asp:BoundField DataField="DOC_VER_GRADE" HeaderText="評分" meta:resourcekey="BoundFieldResource2" SortExpression="DOC_VER_GRADE" />
            <asp:TemplateField HeaderText="作者" meta:resourcekey="TemplateFieldResource1" SortExpression="DOC_AUTHOR">
                <itemtemplate>
<asp:Label runat="server" ID="lblAuthor" __designer:wfdid="w1"></asp:Label>

</itemtemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="意見數" meta:resourcekey="TemplateFieldResource2" SortExpression="DOC_GRADE_COUNT">
                <itemtemplate>
&nbsp;<asp:LinkButton runat="server" ID="LinkButton1" Text='<%# Bind("DOC_GRADE_COUNT") %>' __designer:wfdid="w3"></asp:LinkButton>
 
</itemtemplate>
            </asp:TemplateField>
        </Columns>
        <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
            NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
            PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""
            ShowHeaderPager="True" />
    </fast:grid>
        </td>
        </tr>
        </table>
        </center>
    
        </contenttemplate>
    </asp:UpdatePanel>&nbsp;
    &nbsp;&nbsp;&nbsp;
    <br />
    <asp:Label ID="lblNoGrade" runat="server" Text="尚無任何評分" Visible="False" meta:resourcekey="lblNoGradeResource1" ForeColor="Red"></asp:Label><br />
    </center>
</asp:Content>

