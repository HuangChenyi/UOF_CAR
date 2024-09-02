<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeFile="MaintainEditor.aspx.cs" Inherits="CDS_Editor_MaintainEditor" %>

<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
               <table class="PopTable">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="ModuleName"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblModultName" runat="server" Text=""></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label5" runat="server" Text="SubFolder"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblSubFolder" runat="server" Text=""></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="UploadFileGroupId"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblUploadFileGroupId" runat="server" Text=""></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label3" runat="server" Text="EnableInsertDMS"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblEnableInsertDMS" runat="server" Text=""></asp:Label>
                <asp:Button ID="btnEnableInsertDMS" runat="server" Text="Change Status" OnClick="btnEnableInsertDMS_Click" />
            </td>

        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="EnableInsertImage"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblEnableInsertImage" runat="server" Text=""></asp:Label>
                <asp:Button ID="btnEnableInsertImage" runat="server" Text="Change Status" OnClick="btnEnableInsertImage_Click" />
            </td>
            <td>
                <asp:Label ID="Label6" runat="server" Text="EnableInsertFiles"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblEnableInsertFiles" runat="server" Text=""></asp:Label>
                <asp:Button ID="btnEnableInsertFiles" runat="server" Text="Change Status"  OnClick="btnEnableInsertFiles_Click" />
            </td>
            <td>
                <asp:Label ID="Label7" runat="server" Text="EnableInsertEmotions"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblEnableInsertEmotions" runat="server" Text=""></asp:Label>
                <asp:Button ID="btnEnableInsertEmotions" runat="server" Text="Change Status" OnClick="btnEnableInsertEmotions_Click" />
            </td>
            <td>
                <asp:Label ID="Label8" runat="server" Text="EnableInsertCusImage"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblEnableInsertCusImage" runat="server" Text=""></asp:Label>
                <asp:Button ID="btnEnableInsertCusImage" runat="server" Text="Change Status"  OnClick="btnEnableInsertCusImage_Click" />
            </td>
        </tr>
    </table>
    <uc1:UC_HtmlEditor runat="server" ID="UC_HtmlEditor" ModuleName="CDS" SubFolder="Editor" Width="100%" />
        </ContentTemplate>
    </asp:UpdatePanel>

 
</asp:Content>

