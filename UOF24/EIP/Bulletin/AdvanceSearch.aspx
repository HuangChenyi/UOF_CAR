<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Bulletin_AdvanceSearch" Title="搜尋公告" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AdvanceSearch.aspx.cs" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="PopTable" cellspacing="1">
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="搜尋所有類別" meta:resourcekey="Label7Resource1"></asp:Label></td>
            <td>
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Checked="True" meta:resourcekey="CheckBox1Resource1" /></td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label1" runat="server" Text="分類" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td >
                <telerik:RadTreeView ID="RadTreeView1" Runat="server"  meta:resourcekey="UltraWebTree1Resource1">
                </telerik:RadTreeView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="關鍵字" 
                    meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TBKeyword" runat="server" meta:resourcekey="TBtopicResource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <asp:Label ID="Label4" runat="server" Text="發表者帳號或名稱" meta:resourcekey="Label4Resource1"></asp:Label></td>
            <td style="width: 100px">
                <asp:TextBox ID="TBannouncer" runat="server" meta:resourcekey="TBannouncerResource1"></asp:TextBox>&nbsp;
            </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label5" runat="server" Text="發佈時間" meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td style="width: 100px;text-align:left">
                <table>
                    <tr >
                        <td style="width: 100px">
                            <telerik:RadDatePicker ID="startDateChooser" runat="server" >
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ></Calendar>

                                <DateInput LabelWidth="40%"></DateInput>

                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                            </telerik:RadDatePicker>
                        </td>
                        <td style="width:20px; text-align:center"  valign="top">
                            ~</td>
                        <td style="width: 100px">
                            <telerik:RadDatePicker ID="endDateChooser" runat="server" >
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ></Calendar>

                                <DateInput LabelWidth="40%"></DateInput>

                                <DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                            </telerik:RadDatePicker>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
                <asp:TextBox ID="txtName" runat="server" meta:resourcekey="txtNameResource1" Visible="False"></asp:TextBox>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

