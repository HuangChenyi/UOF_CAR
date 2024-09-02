<%@ Page Title="維護幣別匯率" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Currency_CurrencyRateEdit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="CurrencyRateEdit.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<style type="text/css"> 
    .RightAligned 
    { 
        text-align: right; 
    } 
</style>
    <asp:DataList ID="DataList1" runat="server" onitemdatabound="DataList1_ItemDataBound" Width="100%" meta:resourcekey="DataList1Resource1">   
        <HeaderTemplate>
        <table class="PopTable" cellspacing="0" width="100%">
            <tr>
                <td class="PopTableHeader">
                    <asp:Label ID="Label1" runat="server" Text="年份：" meta:resourcekey="Label1Resource1"></asp:Label>
                    <asp:Label ID="lblYear" runat="server" Text="Label" meta:resourcekey="lblYearResource1"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" Text="月份：" meta:resourcekey="Label2Resource1"></asp:Label>
                    <asp:Label ID="lblMonth" runat="server" Text="Label" meta:resourcekey="lblMonthResource1"></asp:Label>
            </td>
            </tr>
        </table>
        </HeaderTemplate>
        <ItemTemplate>
        <table  class="PopTable" cellspacing="0" width="100%">
            <tr>
                <td width="100px" class="PopTableLeftTD">
                    <asp:Label ID="lblCurrency" Text='<%#: Bind("CUR_NAME") %>' runat="server" meta:resourcekey="lblCurrencyResource1"></asp:Label>
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                </td>
                <td class="PopTableRightTD">
                    <telerik:RadNumericTextBox ID="rdCurrency" runat="server" CssClass="RightAligned" MinValue="0" DataType="System.Decimal" Culture="zh-TW" DbValueFactor="1" LabelCssClass="" LabelWidth="64px" meta:resourcekey="rdCurrencyResource1" >
                        <NumberFormat DecimalDigits="4" ZeroPattern="n" />
                    </telerik:RadNumericTextBox>
                <asp:CustomValidator ID="cvCheckData" runat="server" Display="Dynamic" ErrorMessage="不可為空白或0" ForeColor="Red" meta:resourcekey="cvCheckDataResource1"></asp:CustomValidator>
                </td>
            </tr>
        </table>
        </ItemTemplate>        
    </asp:DataList>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
