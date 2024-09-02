<%@ Page Title="新增工作類別" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_WorkClass_MaintainWorkClass" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="MaintainWorkClass.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table cellspacing="1" class="PopTable">
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"
                    meta:resourcekey="Label4Resource1"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="編號"
                    meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSeqNum" runat="server"
                    meta:resourcekey="txtSeqNumResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtSeqNum" ErrorMessage="請輸入編號"
                    meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"
                    meta:resourcekey="Label5Resource1"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="名稱"
                    meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" MaxLength="10"
                    meta:resourcekey="txtNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtName" ErrorMessage="請輸入名稱"
                    meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="圖片"
                    meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>                
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedMultipleFileSelection="false" FileSizeLimit="100" />
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td class="SizeMemo">
                <asp:Label ID="Label6" runat="server" Text="*工作類別圖示預設以編號排序" CssClass="SizeMemo" meta:resourcekey="Label6Resource1"></asp:Label>
                <br />
                <asp:Label ID="Label7" runat="server" Text="*圖片大小限制為100KB" CssClass="SizeMemo" meta:resourcekey="Label7Resource1"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

