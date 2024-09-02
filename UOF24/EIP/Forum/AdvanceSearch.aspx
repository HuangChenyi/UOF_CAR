<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Forum_AdvanceSearch" Title="進階搜尋" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AdvanceSearch.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%"  class="PopTable" cellspacing="0">
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="討論版" meta:resourcekey="Label7Resource1"></asp:Label></td>
            <td>
                <asp:CheckBox ID="CheckBox1" runat="server" Text="選擇所有討論版" AutoPostBack="True" Checked="True" OnCheckedChanged="CheckBox1_CheckedChanged" meta:resourcekey="CheckBox1Resource1" />
                <br />
                <telerik:RadTreeView ID="RadTreeView1" EnableNodeTextHtmlEncoding="true" runat="server" Height="350px">
                </telerik:RadTreeView>
                </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="關鍵字" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtSubject" runat="server" meta:resourcekey="txtSubjectResource1"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="height: 26px">
                <asp:Label ID="Label4" runat="server" Text="作者帳號或名稱" meta:resourcekey="Label4Resource1"></asp:Label></td>
            <td style="height: 26px">
                <asp:TextBox ID="txbAuthor" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="推薦次數" meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtRecommend" runat="server" Width="49px" meta:resourcekey="txtRecommendResource1"></asp:TextBox><asp:Label
                    ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="次以上"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="發表時間" meta:resourcekey="Label6Resource1"></asp:Label></td>
            <td>
                <table>
                    <tr>
                        <td >
                            <telerik:RadDatePicker ID="rdStartDate" runat="server">
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="~"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadDatePicker ID="rdEndDate" runat="server">
                            </telerik:RadDatePicker>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

