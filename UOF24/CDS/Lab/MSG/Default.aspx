<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="CDS_Lab_MSG_Default" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="PopTable">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="發送對象"></asp:Label>

            </td>
            <td>
                <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="標題"></asp:Label>

            </td>
            <td>
                <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>

            </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="內容"></asp:Label>

            </td>
            <td>
                <uc1:UC_HtmlEditor runat="server" ID="UC_HtmlEditor"  ModuleName="CDS" />

            </td>
        </tr>
    </table>
    <asp:Button ID="btnSend" runat="server" Text="發送" OnClick="btnSend_Click" />
</asp:Content>

