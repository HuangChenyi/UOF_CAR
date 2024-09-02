<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Common_ChoiceCenter_ChoicePreView" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ChoicePreView.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <Fast:Grid
    ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False"
    AutoGenerateColumns="False"  EmptyDataText="沒有資料...." 
      Width="100%" AllowPaging="True" 
        AllowSorting="True" OnPageIndexChanging="Grid1_PageIndexChanging" 
        OnSorting="Grid1_Sorting" OnRowDataBound="Grid1_RowDataBound" 
        meta:resourcekey="Grid1Resource1" DataKeyOnClientWithCheckBox="False" 
        DefaultSortColumnName="Name"  DefaultSortDirection="Ascending" EnhancePager="True" KeepSelectedRows="False" PageSize="15"  >
<EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

<ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        <Columns>
            <asp:BoundField DataField="ACCOUNT" HeaderText="帳號" SortExpression="ACCOUNT" meta:resourcekey="BoundFieldResource1">
                <itemstyle width="100px" />
                <HeaderStyle Wrap="false"/>
            </asp:BoundField>
            <asp:BoundField DataField="NAME" HeaderText="姓名" SortExpression="NAME" meta:resourcekey="BoundFieldResource2" >
                <itemstyle width="150px" />
                <headerstyle width="150px"  Wrap="false"/>
            </asp:BoundField>
            <asp:BoundField DataField="GROUP_TYPE" HeaderText="類別" SortExpression="GROUP_TYPE" meta:resourcekey="BoundFieldResource3" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
            <asp:BoundField DataField="GROUP_NAME" HeaderText="部門/群組" SortExpression="GROUP_NAME" meta:resourcekey="BoundFieldResource4" >
                <itemstyle width="250px" Wrap="True" />
                <HeaderStyle Wrap="false"/>
            </asp:BoundField>
            <asp:BoundField DataField="TITLE_NAME" HeaderText="職級" SortExpression="TITLE_NAME" meta:resourcekey="BoundFieldResource5" >
            <HeaderStyle Wrap="False" />
            </asp:BoundField>
        </Columns>
    </Fast:Grid>
    <input id="Hidden1" runat="server" type="hidden" />
    <asp:Label ID="lbIsFirstRun" runat="server" Visible="False" meta:resourcekey="lbIsFirstRunResource1"></asp:Label>
    <asp:Label ID="lbMember" runat="server" Text="會員" Visible="False" meta:resourcekey="lbMemberResource1"></asp:Label>
    <asp:Label ID="lbEmployee" runat="server" Text="員工" Visible="False" meta:resourcekey="lbEmployeeResource1"></asp:Label>
</asp:Content>

