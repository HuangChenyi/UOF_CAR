<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_WKFFlowInfo" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="WKFFlowInfo.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    
</script>

<table class="PopTable" border="0" cellspacing="1">
    <tr>
        <td class="PopTableLeftTD" align="right" style="white-space:nowrap;">
            <asp:Label ID="Label1" runat="server" Text="原始建立目錄" meta:resourcekey="Label1Resource1"></asp:Label>
        </td>
        <td class="PopTableRightTD" >
            <asp:Label ID="lblFolderName" runat="server" meta:resourcekey="lblFolderNameResource1"></asp:Label>
        </td> 
    </tr>
    <tr>
        <td class="PopTableLeftTD" align="right" style="width: 89px">
            <asp:Label ID="Label2" runat="server" Text="建立者" meta:resourcekey="Label2Resource1"></asp:Label>
        </td>
        <td class="PopTableRightTD" style="white-space:nowrap;">
            <asp:Label ID="lblCreateUser" runat="server" meta:resourcekey="lblCreateUserResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="PopTableLeftTD" align="right" style="width: 89px">
            <asp:Label ID="Label3" runat="server" Text="建立時間" meta:resourcekey="Label3Resource1"></asp:Label>
        </td>
        <td class="PopTableRightTD" style="white-space:nowrap;">
            <asp:Label ID="lblCreateTime" runat="server" meta:resourcekey="lblCreateTimeResource1"></asp:Label>
        </td>
    </tr>
</table>
    <asp:Label ID="lblNotExist" runat="server" Text="流程資訊不存在" meta:resourcekey="lblNotExistResource1" Visible="false"></asp:Label>
</asp:Content>

