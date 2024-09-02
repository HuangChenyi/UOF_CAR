<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_ExportCustomerData" Title="匯出客戶資料" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ExportCustomerData.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

 <table class ="PopTable" style="width:100%">
        <tr>
            <td  style="width: 100px;text-align:left" class="PopTableHeader">
                <asp:Label ID="Label1" runat="server" Text="匯出資料範圍" meta:resourcekey="Label1Resource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 100px; height: 72px; text-align:left" class="PopTableRightTD">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem Value="ALL" meta:resourcekey="ListItemResource1">全部客戶資料</asp:ListItem>
                    <asp:ListItem Value="ByClass" meta:resourcekey="ListItemResource2">依據客戶類別</asp:ListItem>
                </asp:RadioButtonList>
                <table>
                    <tr>
                        <td style="width: 100px; text-align:left;">
                            <telerik:RadTreeView ID="rdTrees" EnableNodeTextHtmlEncoding="true" runat="server" CheckBoxes="True"></telerik:RadTreeView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            
        </tr>
    </table>
    <asp:Label ID="Label2" runat="server" Text="請選擇客戶類別" Visible="False" meta:resourcekey="Label2Resource1"></asp:Label>
    <asp:CustomValidator ID="cvMessage" runat="server" BackColor="Red" Display="None"
        ForeColor="White" Visible="False"></asp:CustomValidator>
    <asp:Label ID="lblFail" runat="server" Text="匯出資料失敗" Visible="False" meta:resourcekey="lblFailResource1"></asp:Label>
</asp:Content>

