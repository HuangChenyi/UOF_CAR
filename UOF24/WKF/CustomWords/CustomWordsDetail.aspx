<%@ Page Title="簽核字詞設定" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="CustomWordsDetail.aspx.cs"
    Inherits="Ede.Uof.Web.WKF.CustomWords.CustomWordsDetail" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="PopTable">
        <tr>
            <td colspan="2" class="PopTableHeader">
                <div style="text-align: center">
                    <asp:Label ID="lblCustomWordTitle" runat="server" Text="簽核字詞設定" meta:resourcekey="lblCustomWordTitleResource1"></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap; width: 20%">
                <asp:Label ID="Label1" runat="server" Text="類型" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtType" runat="server" meta:resourcekey="txtTypeResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rvCheckType" runat="server" ControlToValidate="txtType" ErrorMessage="類型必填" meta:resourcekey="rvCheckTypeResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap; width: 20%">
                <asp:Label ID="Label2" runat="server" Text="站點設定" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbAllowDisapprove" runat="server" Text="允許否決"  meta:resourcekey="cbAllowDisapproveResource1" />
                <asp:CheckBox ID="cbAllowReturn" runat="server" Text="允許退簽"  meta:resourcekey="cbAllowReturnResource1" />
            </td>
        </tr>
    </table>
    <asp:Table ID="tbSetCustomWord" runat="server" CssClass="PopTable" >
         <asp:TableRow Style="white-space: nowrap" ID="trLanguage">
            <asp:TableCell CssClass="PopTableHeader" Style="width: 16.66%">
                <div style="text-align: center">
                    <asp:Label ID="lbllanguage" runat="server" Text="語系" meta:resourcekey="lbllanguageResource1"></asp:Label>
                </div>
            </asp:TableCell>
            <asp:TableCell CssClass="PopTableHeader" ColumnSpan="3" >
                <div style="text-align: center">
                    <asp:Label ID="lblButtonShow" runat="server" Text="簽核鈕顯示字詞" meta:resourcekey="lblButtonShowResource1"></asp:Label>
                </div>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Label ID="lblMemo" runat="server" CssClass="SizeMemo" Text="註：不輸入自訂字詞將會套用預設值" meta:resourcekey="lblMemoResource1"></asp:Label>
    <asp:Label ID="lblDefaultWord" runat="server" Visible="false" Text="預設" meta:resourcekey="Label3Resource1"></asp:Label>
    <asp:Label ID="lblAgreeWord" runat="server" Visible="false" Text="同意" meta:resourcekey="Label7Resource1"></asp:Label>
    <asp:Label ID="lblRejectWord" runat="server" Visible="false" Text="否決" meta:resourcekey="Label8Resource1"></asp:Label>
    <asp:Label ID="lblReturnWord" runat="server" Visible="false" Text="退簽" meta:resourcekey="Label9Resource1"></asp:Label>

</asp:Content>
