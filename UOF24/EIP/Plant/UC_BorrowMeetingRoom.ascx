<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_BorrowMeetingRoom.ascx.cs" Inherits="Ede.Uof.Web.EIP.Plant.UC_BorrowMeetingRoom" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None" >
    <Items>
        <telerik:RadToolBarButton runat="server" Value="Date" meta:resourcekey="RadToolBarButtonResource1">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text="日期" meta:resourcekey="Label1Resource1"></asp:Label>
                <telerik:RadDatePicker ID="rdDate" Runat="server" meta:resourcekey="rdDateResource1">
                    <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                    </Calendar>
                    <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                        <EmptyMessageStyle Resize="None" />
                        <ReadOnlyStyle Resize="None" />
                        <FocusedStyle Resize="None" />
                        <DisabledStyle Resize="None" />
                        <InvalidStyle Resize="None" />
                        <HoveredStyle Resize="None" />
                        <EnabledStyle Resize="None" />
                    </DateInput>
                    <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                </telerik:RadDatePicker>
            </ItemTemplate>
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true"  runat="server" meta:resourcekey="RadToolBarButtonResource2"/>
        <telerik:RadToolBarButton runat="server" Value="Location" meta:resourcekey="RadToolBarButtonResource6">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text="地點" meta:resourcekey="Label2Resource6"></asp:Label>
                <asp:DropDownList ID="ddlLocation" runat="server"></asp:DropDownList>
            </ItemTemplate>
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true"  runat="server" meta:resourcekey="RadToolBarButtonResource2"/>
        <telerik:RadToolBarButton runat="server" Value="btnQuery" Text="查詢"  
             CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
             DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" 
             HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
             ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource3">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true" runat="server" meta:resourcekey="RadToolBarButtonResource4" />
        <telerik:RadToolBarButton runat="server" Value="btnPlant" Text="場地借用"  
             CheckedImageUrl="~/Common/Images/Icon/icon_m182.png"
             DisabledImageUrl="~/Common/Images/Icon/icon_m182.png" 
             HoveredImageUrl="~/Common/Images/Icon/icon_m182.png"
             ImageUrl="~/Common/Images/Icon/icon_m182.png"  meta:resourcekey="RadToolBarButtonResource5" >
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true"  runat="server" meta:resourcekey="RadToolBarButtonResource2" />
    </Items>
</telerik:RadToolBar>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <Ede:Grid ID="meetingGrid" runat="server" AutoGenerateColumns="False" ShowHeader="False" BorderStyle="None" BorderWidth="0px" 
                  Width="100%"  AutoGenerateCheckBoxColumn="False" EmptyDataText="沒有資料" CustomDropDownListPage="False" 
                  DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EnhancePager="True"  DataKeyNames="PLANT_GUID"
                  onrowdatabound="meetingGrid_RowDataBound"  KeepSelectedRows="False"  SkinID="HomepageBlockStyle" 
                   SelectedRowColor="" UnSelectedRowColor="" AllowPaging="True" AllowSorting="True" meta:resourcekey="meetingGridResource1" OnPageIndexChanging="meetingGrid_PageIndexChanging1" PageSize="5">
            <EnhancePagerSettings  ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
            <ExportExcelSettings AllowExportToExcel="False" />
            <Columns>
                <asp:TemplateField HeaderText="Meeting Room" ShowHeader="False" meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                       <table  style="width:100%">
                           <tr>
                               <td style="width:30%;text-align:left">                                                           
                                   <asp:LinkButton ID="lbtnPlantName" runat="server" meta:resourcekey="lbtnPlantNameResource1"></asp:LinkButton>   
                                </td>                             
                           </tr>
                           <tr>
                               <td style="width:30%;text-align:left">
                                   <asp:Label ID="lblRecord" runat="server" meta:resourcekey="lblRecordResource1"></asp:Label>
                               </td>
                           </tr>
                       </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </Ede:Grid>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:Label ID="lblAll" runat="server" Text="全部" Visible="False" meta:resourcekey="lblAllResource1"></asp:Label>
<asp:Label ID="lblCrossDay" runat="server" Text="跨日" Visible="False" meta:resourcekey="lblCrossDayResource1"></asp:Label>
<asp:HiddenField ID="hfUserGuid" runat="server" />
