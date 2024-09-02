<%@ Page Title="歷年考績維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_HR_MaintainPerf" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="MaintainPerf.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table cellspacing="1" class="PopTable" width="100%">
        <tr>
            <td style="white-space: nowrap;">
                <font color="red">*</font>
                <asp:Label ID="Label1" runat="server" Text="年度"
                    meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td style="white-space:nowrap;width:200px;">
                <telerik:RadNumericTextBox ID="wneYear" runat="server" Type="Number" MaxLength="4" MaxValue="2100" MinValue="1911" NumberFormat-DecimalDigits="0" NumberFormat-GroupSeparator="">
                </telerik:RadNumericTextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="wneYear" ErrorMessage="請輸入年度"
                    meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <font color="red">*</font>
                <asp:Label ID="Label2" runat="server" Text="總分"
                    meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="wneScore" runat="server" Type="Number" MinValue="0" NumberFormat-DecimalDigits="0">
                </telerik:RadNumericTextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="wneScore" ErrorMessage="請輸入總分"
                    meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="等次"
                    meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlRank" runat="server"
                    meta:resourcekey="ddlRankResource1">
                    <asp:ListItem Value="" meta:resourcekey="ListItemResource8">請選擇</asp:ListItem>
                    <asp:ListItem Value="A" meta:resourcekey="ListItemResource9">特優</asp:ListItem>
                    <asp:ListItem Value="B" meta:resourcekey="ListItemResource10">優</asp:ListItem>
                    <asp:ListItem Value="C" meta:resourcekey="ListItemResource11">甲上</asp:ListItem>
                    <asp:ListItem Value="D" meta:resourcekey="ListItemResource12">甲</asp:ListItem>
                    <asp:ListItem Value="E" meta:resourcekey="ListItemResource13">乙</asp:ListItem>
                    <asp:ListItem Value="F" meta:resourcekey="ListItemResource14">丙</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap;width:200px;">
                <asp:Label ID="Label4" runat="server" Text="原職等職級"
                    meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOrgRank" runat="server"
                    meta:resourcekey="txtOrgRankResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="新職等職級"
                    meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtNewRank" runat="server" Height="19px"
                    meta:resourcekey="txtNewRankResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="職務異動"
                    meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFunChange" runat="server"
                    meta:resourcekey="txtFunChangeResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="備註"
                    meta:resourcekey="Label7Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtRemark" runat="server" Rows="5" TextMode="MultiLine"
                    Width="100%" meta:resourcekey="txtRemarkResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label8" runat="server" Text="上傳附件"
                    meta:resourcekey="Label8Resource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedMultipleFileSelection="false" />
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>