<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DownloadQusExcel.aspx.cs" Inherits="Ede.Uof.Web.QUE.Design.DownloadQusExcel" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblHeader" runat="server" Text="問卷說明" Visible="False" meta:resourcekey="lblHeaderResource1"></asp:Label>
        <asp:Label ID="lblProperty" runat="server" Text="個人資料" Visible="False" meta:resourcekey="lblPropertyResource1"></asp:Label>
        <asp:Label ID="lblQusItem" runat="server" Text="問卷題目" Visible="False" meta:resourcekey="lblQusItemResource1"></asp:Label>
        <asp:Label ID="lblFooter" runat="server" Text="問卷結束語" Visible="False" meta:resourcekey="lblFooterResource1"></asp:Label>
        <asp:Label ID="lblStar" runat="server" Text="*" Visible="False" ForeColor="Red" meta:resourcekey="lblStarResource1"></asp:Label>
        <asp:Label ID="lblRequire" runat="server" Text="(必填)" Visible="False" ForeColor="Red" meta:resourcekey="lblRequireResource1"></asp:Label>
        <asp:Label ID="lblMemo" runat="server" Text="備註" Visible="False" meta:resourcekey="lblMemoResource1"></asp:Label>
        <asp:Label ID="lblNoData" runat="server" Text="(此題沒有選項)" ForeColor="Red" Visible="False" meta:resourcekey="lblNoDataResource1"></asp:Label>
        <asp:Label ID="lblMaxAnsCountText" runat="server" Text="最多可勾選的數量為:" Visible="False" meta:resourcekey="lblMaxAnsCountTextResource1"></asp:Label>
         <asp:Label ID="lblPhoto" runat="server" Text="(圖片)" Visible="False" meta:resourcekey="lblPhotoResource1"></asp:Label>
    </div>
    </form>
</body>
</html>
