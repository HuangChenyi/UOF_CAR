<%@ Page Title="設計者維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SetupDesignMember.aspx.cs" Inherits="Ede.Uof.Web.WKF.Auth.SetupDesignMember" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div><asp:CustomValidator ID="cvCateRequired" runat="server" ErrorMessage="表單或副流程類別至少需勾選一項。" Display="Dynamic"></asp:CustomValidator></div>
    <div><asp:CustomValidator ID="cvUserRequired" runat="server" ErrorMessage="請選擇設計者" Display="Dynamic"></asp:CustomValidator></div>
    <table style=" width: 99% ;margin-left:0.5%">
        <tr style="height:80px">
            <td>
                <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" ShowMember="false" ExpandToUser="false" />
            </td>
        </tr>
        <tr>
            <td style="width: 50%; border: 1px solid black">
                <Fast:Grid ID="gridFormCategory" runat="server" Width="100%"
                    OnRowDataBound="gridFormCategory_RowDataBound"
                    DataKeyNames="CATEGORY_ID" AutoGenerateColumns="False"
                    AutoGenerateCheckBoxColumn="True" DataKeyOnClientWithCheckBox="False"
                    DefaultSortDirection="Ascending" EnhancePager="True" PageSize="15" EmptyDataText="沒有資料">
                    <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
                        NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
                        PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""
                        ShowHeaderPager="True" />
                    <ExportExcelSettings AllowExportToExcel="False" />
                    <Columns>
                        <asp:BoundField DataField="CATEGORY_ID" Visible="false" />
                        <asp:BoundField DataField="CATEGORY_NAME" HeaderText="表單類別" meta:resourcekey="boundFieldResource1"/>
                    </Columns>
                </Fast:Grid>
            </td>
            <td style="width: 50%; border: 1px solid black">
                <Fast:Grid ID="gridFlowCategory" runat="server" Width="100%"
                    OnRowDataBound="gridFlowCategory_RowDataBound"
                    DataKeyNames="CATEGORY_ID" AutoGenerateColumns="False"
                    AutoGenerateCheckBoxColumn="True" DataKeyOnClientWithCheckBox="False"
                    DefaultSortDirection="Ascending" EnhancePager="True" PageSize="15" EmptyDataText="沒有資料">
                    <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
                        NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
                        PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""
                        ShowHeaderPager="True" />
                    <ExportExcelSettings AllowExportToExcel="False" />
                    <Columns>
                        <asp:BoundField DataField="CATEGORY_ID" Visible="false" />
                        <asp:BoundField DataField="CATEGORY_NAME" HeaderText="副流程類別" meta:resourcekey="boundFieldResource2"/>
                    </Columns>
                </Fast:Grid>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfRmid" runat="server" />
</asp:Content>
