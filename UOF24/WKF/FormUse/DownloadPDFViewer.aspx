<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_DownloadPDFViewer" Codebehind="DownloadPDFViewer.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
    <table border="0" cellpadding="0" cellspacing="0" style="width:100px;height:100px">
            <tr>
                <td valign="middle" align="center" nowrap><asp:Label ID="lblViewMsg" runat="server" Text="<br>您沒有安裝EB PDF Viewer！<br/><br/>是否要下載安裝？" Visible="True" meta:resourcekey="lblViewMsgResource1"></asp:Label></td>
            </tr>
    </table>
    </div>
    <asp:Label ID="lblSaveTxt" runat="server" Text="下載" Visible="False" meta:resourcekey="lblSaveTxtResource1"></asp:Label>
</asp:Content>

