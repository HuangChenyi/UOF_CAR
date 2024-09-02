<%@ Page Title="手動同步" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ExecuteSyncHR.aspx.cs" Inherits="Ede.Uof.Web.HR104.SyncHR.ExecuteSyncHR" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="PopTable">
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                <asp:Label ID="lbltitle" runat="server" Text="執行同步作業" meta:resourcekey="lbltitleResource1"></asp:Label>
            </td>
            <td style="white-space: nowrap">
                <asp:RadioButtonList ID="rblSyncTime" runat="server">
                    <asp:ListItem Text="不限異動時間" Value="All" meta:resourcekey="ListItemResource1" />
                    <asp:ListItem Text="指定異動時間" Value="withTime" Selected="True" meta:resourcekey="ListItemResource2" />
                </asp:RadioButtonList>&nbsp;&nbsp;
                <telerik:RadDatePicker ID="rdStart" runat="server"></telerik:RadDatePicker>
                <asp:Label ID="Label2" runat="server" Text="~" meta:resourcekey="Label2Resource1"></asp:Label>
                <telerik:RadDatePicker ID="rdEnd" runat="server"></telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label4" runat="server" Text="指定對象" meta:resourcekey="Label4Resource1" ></asp:Label>
            </td>
            <td style="white-space: nowrap">
                <asp:CheckBox ID="cbCurrentEmployee" runat="server" Text="只同步104組織目前在職人員" Checked="false" meta:resourcekey="cbCurrentEmployeeResource1" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblmesg" runat="server" Text="手動同步作業會同時進行部門與人員的同步(先同步部門再同步人員)" ForeColor="Blue" meta:resourcekey="lblmesgResource1"></asp:Label>
</asp:Content>
