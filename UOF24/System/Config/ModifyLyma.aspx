<%@ Page Title="新增/修改來嘛通便利貼代碼" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Config_ModifyLyma" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="ModifyLyma.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table class="PopTable" width="100%" cellspacing="1">
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:Label ID="lblDirections" runat="server" Text="說明"
                    meta:resourcekey="lblDirectionsResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDirections" runat="server" Columns="50" MaxLength="50"
                    meta:resourcekey="txtDirectionsResource1"></asp:TextBox>
                <br />
                <asp:Label ID="lblDirectionsError" runat="server" Text="此為必要欄位" class="SizeSB"
                    ForeColor="Red" Visible="False"
                    meta:resourcekey="lblDirectionsErrorResource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="white-space: nowrap;">
                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label3Resource1"></asp:Label>
                <asp:Label ID="lblCode" runat="server" Text="便利貼代碼"
                    meta:resourcekey="lblCodeResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCode" runat="server" TextMode="MultiLine" Columns="50"
                    Rows="5" meta:resourcekey="txtCodeResource1"></asp:TextBox>
                <br />
                <asp:Label ID="lblCodeError" runat="server" Text="此為必要欄位" class="SizeSB" ForeColor="Red"
                    Visible="False" meta:resourcekey="lblCodeErrorResource1"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfMode" runat="server" />
    <asp:HiddenField ID="hfOnlineID" runat="server" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

