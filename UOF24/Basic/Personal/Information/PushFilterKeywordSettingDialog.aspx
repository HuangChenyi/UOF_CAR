<%@ Page Title="新增關鍵字" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="PushFilterKeywordSettingDialog.aspx.cs" Inherits="PushFilterKeywordSettingDialog" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="PnlAdmin" runat="server" meta:resourcekey="PnlAdminResource1">
        <asp:Table ID="tbAdminKeyword" runat="server" CssClass="PopTable" meta:resourcekey="tbAdminKeywordResource1">
        </asp:Table>

        <Fast:Grid ID="grdFilterKeyword" runat="server" Visible="False"
            AutoGenerateCheckBoxColumn="False" 
            AutoGenerateColumns="False" 
            CustomDropDownListPage="False"
            DataKeyOnClientWithCheckBox="False" 
            EmptyDataText="沒有資料" 
            EnhancePager="True" 
            KeepSelectedRows="False"
            Width="100%" DefaultSortDirection="Ascending" meta:resourcekey="grdFilterKeywordResource1" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" AllowSorting="True" >
            <EnhancePagerSettings ShowHeaderPager="False"></EnhancePagerSettings>
            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
        </Fast:Grid>

        <asp:Label ID="lblSettingIsEmpty" runat="server" Text="尚未設定。" Visible="False" meta:resourcekey="lblSettingIsEmptyResource1"></asp:Label>
    </asp:Panel>

    <asp:Panel ID="PnlUser" runat="server" meta:resourcekey="PnlUserResource1">
        <table id="tbUserKeyword" runat="server" border="0" class="PopTable" style="width: 100%">
            <tr runat="server">
                <td style="width:20%;" runat="server">
                    <asp:Label ID="lblTitle1" runat="server" Text="關鍵字1" meta:resourcekey="lblTitle1Resource1"></asp:Label>
                </td>
                <td style="width:80%;" runat="server">
                    <asp:TextBox ID="txtKeyword1" Width="600px" runat="server" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr runat="server">
                <td style="width:20%;" runat="server">
                    <asp:Label ID="lblTitle2" runat="server" Text="關鍵字2" meta:resourcekey="lblTitle2Resource1"></asp:Label>
                </td>
                <td style="width:80%;" runat="server">
                    <asp:TextBox ID="txtKeyword2" Width="600px" runat="server" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr runat="server">  
                <td style="width:20%;" runat="server">
                    <asp:Label ID="lblTitle3" runat="server" Text="關鍵字3" meta:resourcekey="lblTitle3Resource1"></asp:Label>
                </td>
                <td style="width:80%;" runat="server">
                    <asp:TextBox ID="txtKeyword3" Width="600px" runat="server" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr runat="server">
                <td style="width:20%;" runat="server">
                    <asp:Label ID="lblTitle4" runat="server" Text="關鍵字4" meta:resourcekey="lblTitle4Resource1"></asp:Label>
                </td>
                <td style="width:80%;" runat="server">
                    <asp:TextBox ID="txtKeyword4" Width="600px" runat="server" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr runat="server">
                <td style="width:20%;" runat="server">
                    <asp:Label ID="lblTitle5" runat="server" Text="關鍵字5" meta:resourcekey="lblTitle5Resource1"></asp:Label>
                </td>
                <td style="width:80%;" runat="server">
                    <asp:TextBox ID="txtKeyword5" Width="600px" runat="server" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr runat="server">
                <td style="width:20%;" runat="server">
                    <asp:Label ID="lblTitle6" runat="server" Text="關鍵字6" meta:resourcekey="lblTitle6Resource1"></asp:Label>
                </td>
                <td style="width:80%;" runat="server">
                    <asp:TextBox ID="txtKeyword6" Width="600px" runat="server" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr runat="server"> 
                <td style="width:20%;" runat="server">
                    <asp:Label ID="lblTitle7" runat="server" Text="關鍵字7" meta:resourcekey="lblTitle7Resource1"></asp:Label>
                </td>
                <td style="width:80%;" runat="server">
                    <asp:TextBox ID="txtKeyword7" Width="600px" runat="server" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr runat="server">
                <td style="width:20%;" runat="server">
                    <asp:Label ID="lblTitle8" runat="server" Text="關鍵字8" meta:resourcekey="lblTitle8Resource1"></asp:Label>
                </td>
                <td style="width:80%;" runat="server">
                    <asp:TextBox ID="txtKeyword8" Width="600px" runat="server" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr runat="server"> 
                <td style="width:20%;" runat="server">
                    <asp:Label ID="lblTitle9" runat="server" Text="關鍵字9" meta:resourcekey="lblTitle9Resource1"></asp:Label>
                </td>
                <td style="width:80%;" runat="server">
                    <asp:TextBox ID="txtKeyword9" Width="600px" runat="server" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
            <tr runat="server">
                <td style="width:20%;" runat="server">
                    <asp:Label ID="lblTitle10" runat="server" Text="關鍵字10" meta:resourcekey="lblTitle10Resource1"></asp:Label>
                </td>
                <td style="width:80%;" runat="server">
                    <asp:TextBox ID="txtKeyword10" Width="600px" runat="server" MaxLength="30"></asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:Panel>
        
    <asp:Label ID="lblKeywordSettingIsFull" runat="server" Text="已達10組設定上限" Visible="False" meta:resourcekey="lblKeywordSettingIsFullResource1"></asp:Label>
    <asp:CustomValidator ID="cvChineseCantEmpty" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="請輸入繁體中文" meta:resourcekey="cvChineseCantEmptyResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cvApostropheCantUse" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="請勿輸入單引號" meta:resourcekey="cvApostropheCantUseResource1"></asp:CustomValidator>

    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hfUserType" runat="server" />
    <asp:HiddenField ID="hfEditMode" runat="server" />
    <asp:HiddenField ID="hfSeq" runat="server" />
</asp:Content>