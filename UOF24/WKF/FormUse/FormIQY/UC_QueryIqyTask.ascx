<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormUse_FormIQY_UC_QueryIqyTask" Codebehind="UC_QueryIqyTask.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Reference Control="~/WKF/FormUse/FormIQY/UC_QueryIqySingle.ascx" %>


<asp:Table ID="Table1" runat="server" meta:resourcekey="Table1Resource1"></asp:Table>
<asp:Label ID="Label1" runat="server" Text="{0} 的徵詢：" Visible="False" 
    meta:resourcekey="Label1Resource1"></asp:Label><asp:Label ID="Label2" 
    runat="server" Text="(使用滑鼠左鍵在意見文字上點兩下即可複製內容。)" Visible="False" ForeColor="Red" 
    meta:resourcekey="Label2Resource1"></asp:Label>
