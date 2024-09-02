<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="DocStatusExplanation.aspx.cs" Inherits="Ede.Uof.Web.DMS.DocStore.DocStatusExplanation" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%" >
        <tr>
            <td style="white-space:nowrap;padding-left:1px">
                <asp:Label runat="server" ID="lblInfo1" Text="勾選後，會依不同角色增加顯示以下狀態的文件：" ForeColor="Blue" meta:resourcekey="lblInfo1Resource1" /><br>
                <asp:Label runat="server" ID="lblInfo2" Text="目錄管理者、作者：已下架、已作廢、未生效、已失效" ForeColor="Blue" meta:resourcekey="lblInfo2Resource1" /><br>
                <asp:Label runat="server" ID="lblInfo3" Text="讀者：已下架" ForeColor="Blue" meta:resourcekey="lblInfo3Resource1" /><br>
            </td>
        </tr>
    </table>
</asp:Content>
