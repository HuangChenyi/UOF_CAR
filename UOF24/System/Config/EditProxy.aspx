<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Config_EditProxy" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="EditProxy.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="PopTable">
        <tr>
            <td style="white-space: nowrap" class="PopTableLeftTD">
                <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label4Resource1"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="Proxy 名稱"
                    meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td style="white-space:nowrap">
                <asp:TextBox ID="txtProxyName" runat="server"
                    meta:resourcekey="txtProxyNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtProxyName" Display="Dynamic"
                    ErrorMessage="Proxy名稱不允許為空白"
                    meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label3Resource1"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="URL"
                    meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>

                <asp:TextBox ID="txtURL" runat="server"  style="white-space:nowrap"
                    meta:resourcekey="txtURLResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                    runat="server" ControlToValidate="txtURL" Display="Dynamic"
                    ErrorMessage="URL不允許為空白"
                    meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                <br />
                <asp:Label runat="server" ID="lblLinkUrlSample" CssClass="SizeMemo" Text="範例: http://www.edetw.com/Proxy"
                    meta:resourcekey="lblLinkUrlSampleResource1"></asp:Label>


            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label5" runat="server" Text="停用"
                    meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td>
                <asp:CheckBox ID="CheckBox1" runat="server"
                    meta:resourcekey="CheckBox1Resource1" /></td>

        </tr>

    </table>
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic"
        meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
        ControlToValidate="txtURL" ErrorMessage="請輸入正確的URL網址"
        ValidationExpression="http(s)?://([\w-]+[\S])+[\w-]+(/[\w- ./?%&amp;=]*)?"
        Display="Dynamic" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
    <asp:Label ID="lbloverflowlimit" runat="server" Text="已超出Proxy授權數"
        Visible="False" meta:resourcekey="lbloverflowlimitResource1"></asp:Label>
</asp:Content>

