<%@ Page Title="新增/維護時區" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="LocationTimeZoneEdit.aspx.cs" Inherits="System_LocationTimeZone_LocationTimeZoneEdit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>        
        <table class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label3Resource1"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="歸屬地點" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="txtLocation" runat="server" MaxLength="255" Width="100%" meta:resourcekey="txtLocationResource1"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidatorLocationEmpty" runat="server" ErrorMessage="必填欄位" Display="Dynamic" OnServerValidate="CustomValidatorLocation_ServerValidate" meta:resourcekey="rfValidatorLocationResource1"></asp:CustomValidator>
                <asp:CustomValidator ID="CustomValidatorLocation" runat="server" ErrorMessage="歸屬地點已存在" Display="Dynamic" OnServerValidate="CustomValidatorLocation_ServerValidate" meta:resourcekey="CustomValidatorLocationResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="Label5" runat="server" Text="地址" meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" MaxLength="255" Width="100%" meta:resourcekey="txtAddressResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="Label6" runat="server" Text="電話" meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server" MaxLength="255" Width="100%" meta:resourcekey="txtPhoneResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label4Resource1"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="時區" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="ddlTimeZone" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTimeZone_SelectedIndexChanged" meta:resourcekey="ddlTimeZoneResource1"></asp:DropDownList>
                        <br />
                        <asp:TextBox ID="txtTimeZone" runat="server" Style="display: none" meta:resourcekey="txtTimeZoneResource1"></asp:TextBox>                        
                        <asp:CustomValidator ID="CustomValidatorTimeZone" runat="server" ErrorMessage="必填欄位" Display="Dynamic" OnServerValidate="CustomValidatorLocation_ServerValidate" meta:resourcekey="rfValidatorTimeZoneResource1"></asp:CustomValidator>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlTimeZone" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        </table>
    <asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
    <asp:HiddenField ID="hfLocationID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
