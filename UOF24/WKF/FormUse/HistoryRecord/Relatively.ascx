<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormUse_HistoryRecord_Relatively" Codebehind="Relatively.ascx.cs" %>

<%@ Register assembly="Ede.Uof.Utility.Component.Grid" namespace="Ede.Uof.Utility.Component" tagprefix="Fast" %>
<Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" 
    AutoGenerateColumns="False"  
    DataKeyOnClientWithCheckBox="False" 
    EnhancePager="True" PageSize="15"   
    Width="100%" AllowSorting="True" onrowdatabound="Grid1_RowDataBound" 
    >
<EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>
    <Columns>
        <asp:BoundField DataField="FieldName" HeaderText="欄位名稱" ItemStyle-Width="20%" 
            ItemStyle-Wrap="true" meta:resourcekey="BoundFieldResource1" >
            <ItemStyle Width="20%" Wrap="True" />
        </asp:BoundField>
        <asp:BoundField DataField="SourceFieldValue" HeaderText="更改前" 
            ItemStyle-Width="40%" ItemStyle-Wrap="true" 
            meta:resourcekey="BoundFieldResource2" >
            <ItemStyle Width="40%" Wrap="True" />
        </asp:BoundField>
        <asp:BoundField DataField="DestFieldValue" HeaderText="更改後" 
            ItemStyle-Width="40%" ItemStyle-Wrap="true" 
            meta:resourcekey="BoundFieldResource3" >
            <ItemStyle Width="40%" Wrap="True" />
        </asp:BoundField>
    </Columns>
</Fast:Grid>
