<%@ Page Title="交接人員維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SetupHandoverMember.aspx.cs" Inherits="Ede.Uof.Web.WKF.Auth.SetupHandoverMember" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 99%; margin-left: 0.5%" class="PopTable">
        <tr>
            <td style="width: 50%; border: 1px solid black" class="PopTableHeader">
                <asp:Label ID="lblHandover" runat="server" Text="選擇人員" meta:resourcekey="lblHandoverResource1"></asp:Label>
            </td>
            <td style="width: 50%; border: 1px solid black" class="PopTableHeader">
                <asp:Label ID="lblDepartment" runat="server" Text="管理部門" meta:resourcekey="lblDepartmentResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: left; background-color: #FFFFFF; height: 180px">
                <uc1:UC_ChoiceList runat="server" ID="choiceListHandOver" ChioceType="User" ShowMember="false" ExpandToUser="false" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="請選擇人員" Display="Dynamic" ControlToValidate="txtChoiceHandover" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
            <td style="height: 180px">
                <uc1:UC_ChoiceList runat="server" ID="choiceListDept" ChioceType="Group" ShowMember="False" ShowSubDept="true" ExpandToUser="false" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="請選擇部門" Display="Dynamic" ControlToValidate="txtChoiceDepartment" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfRmid" runat="server" />
    <asp:TextBox ID="txtChoiceHandover" runat="server" Visible="false"></asp:TextBox>
    <asp:TextBox ID="txtChoiceDepartment" runat="server" Visible="false"></asp:TextBox>
</asp:Content>
