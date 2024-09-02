<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_QueryCustomerData" Title="查詢客戶資料" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QueryCustomerData.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
            <table class ="PopTable" cellspacing="0" style="width:100%;">
                <tr>
                    <td style=" white-space:nowrap;width:40%;">
                        <asp:Label ID="Label1" runat="server" Text="(客戶代號/客戶簡稱/名稱/統一編號)關鍵字:"  meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td style=" white-space:nowrap;">
                        <asp:TextBox ID="txtQuery" runat="server"></asp:TextBox>
                        <telerik:RadButton ID="rdbtnQuery" runat="server" Text="查詢" meta:resourcekey="ibtnQueryResource1" OnClick="rdbtnQuery_Click"></telerik:RadButton>
                    </td>
                </tr>
            </table>
    <Fast:Grid ID="grd" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"  DataKeyOnClientWithCheckBox="False"  EnhancePager="True" PageSize="30"    Width="100%" OnRowDataBound="grd_RowDataBound"  >
                    <EnhancePagerSettings
                        ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                    <Columns>
                        <asp:BoundField DataField="CUSTOMER_ID" HeaderText="客戶代號" SortExpression="CU.CUSTOMER_ID" meta:resourcekey="BoundFieldResource1" >
                            <footerstyle width="120px" />
                            <headerstyle width="120px" wrap="False" />
                            <itemstyle width="120px" wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UNIFIED_ID" HeaderText="統一編號" meta:resourcekey="BoundFieldResource2" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CUSTOMER_ABBREVIATION" HeaderText="客戶簡稱" SortExpression="CU.CUSTOMER_ABBREVIATION" meta:resourcekey="BoundFieldResource3" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CUSTOMER_NAME" HeaderText="客戶名稱" SortExpression="CU.CUSTOMER_NAME" meta:resourcekey="BoundFieldResource4" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PUBLISH_DATE" HeaderText="發佈日期" DataFormatString="{0:d}" SortExpression="CU.PUBLISH_DATE" meta:resourcekey="BoundFieldResource5" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CONFIRM_PUBLISH" HeaderText="資料狀態" SortExpression="CU.CONFIRM_PUBLISH" meta:resourcekey="BoundFieldResource6">
                            <headerstyle wrap="False" />
                            <itemstyle wrap="True" />
                        </asp:BoundField>
                    </Columns>
                </Fast:Grid>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="Ede.Uof.EIP.Customer.UCO.CUSCustomerUCO" EnablePaging="True" MaximumRowsParameterName="intMaxRows" OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetCustDataSetByStrQuery_Count" SelectMethod="GetCustDataSetByStrQuery" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex">
        <SelectParameters>
            <asp:Parameter Name="strQuery" Type="String" />
            <asp:Parameter Name="intStartIndex" Type="Int32" />
            <asp:Parameter Name="intMaxRows" Type="Int32" />
            <asp:Parameter Name="strSortExpression" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </contenttemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblTitle" runat="server" Text="查詢客戶資料" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="已發佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
    <asp:Label ID="lblUnPublish" runat="server" Text="未發佈" Visible="False" meta:resourcekey="lblUnPublishResource1"></asp:Label>
</asp:Content>