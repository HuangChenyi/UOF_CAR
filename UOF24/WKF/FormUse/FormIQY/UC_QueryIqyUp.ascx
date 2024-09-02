<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormUse_FormIQY_UC_QueryIqyUp" Codebehind="UC_QueryIqyUp.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<Fast:Grid id="DGIqySingleList" runat="server" Width="100%" 
    PageSize="15" EnhancePager="True" 
    DataKeyOnClientWithCheckBox="True"   
     AutoGenerateColumns="False" 
    AutoGenerateCheckBoxColumn="False" DefaultSortDirection="Ascending" 
    onrowdatabound="DGIqySingleList_RowDataBound"  CssClass="Grid" 
    AllowSorting="True" >
    <AlternatingRowStyle  CssClass="GridItemAlternating" />
    <HeaderStyle CssClass="GridHeader"/>    
    <RowStyle CssClass="GridItem" />        
    <PagerStyle CssClass="GridPager"   />

    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
    <Columns>
        <asp:BoundField DataField="IQY_USER_ID" HeaderText="被徵詢者" 
            meta:resourcekey="BoundFieldResource1">
        <ItemStyle Width="20%" />
        </asp:BoundField>
        <asp:BoundField DataField="FILE_GROUP_ID" HeaderText="附件" 
            meta:resourcekey="BoundFieldResource6">
        <ItemStyle Width="10%" HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="IQY_RESULT" HeaderText="結果" 
            meta:resourcekey="BoundFieldResource3">
        <ItemStyle Width="10%" HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="RESPONSE_TIME" HeaderText="回覆時間" 
            meta:resourcekey="BoundFieldResource4">
        <ItemStyle Width="15%" HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="FORM_USER_ID" HeaderText="徵詢者" 
            meta:resourcekey="BoundFieldResource5">
        <ItemStyle Width="25%" />
        </asp:BoundField>
        <asp:BoundField DataField="IQY_COMMENT" HeaderText="徵詢原因" 
            meta:resourcekey="BoundFieldResource2">
        <ItemStyle Width="20%" />
        </asp:BoundField>
    </Columns>
    
    <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
    
</Fast:Grid>

<asp:Label ID="lblLable1" Text="贊成" runat="server" Visible="False" 
    meta:resourcekey="lblLable1Resource1"></asp:Label>
<asp:Label ID="lblLable2" Text="反對" runat="server" Visible="False" 
    meta:resourcekey="lblLable2Resource1"></asp:Label>
<asp:Label ID="lblLable3" Text="其他" runat="server" Visible="False" 
    meta:resourcekey="lblLable3Resource1"></asp:Label>
<asp:Label ID="lblLable4" Text="下載附件" runat="server" Visible="False" 
    meta:resourcekey="lblLable4Resource1"></asp:Label>
<asp:Label ID="Label1" Text="下載" runat="server" Visible="False" 
    meta:resourcekey="Label1Resource1"></asp:Label>    