<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_Admin_MoveDoc" Title="文件搬移" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="MoveDoc.aspx.cs" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script id="MoveDocjs" type="text/javascript">

var currentSelNode;
var nodeCurrentSelect;

$(function() {

    var CustomValidator4 = $("#<%=CustomValidator4.ClientID %>");
	$("#<%=CustomValidator4.ClientID %>").css("position", "absolute");
	$("#<%=CustomValidator4.ClientID %>").css("left", 180); 
	$("#<%=CustomValidator4.ClientID %>").css("top", 200); 
	$("#<%=CustomValidator4.ClientID %>").css("backgroundColor", "#FFFFFF"); 
});

</script>

    &nbsp;<asp:Label ID="Label1" runat="server" ForeColor="Blue" Text="請指定文件要搬移至那個目錄" meta:resourcekey="Label1Resource1"></asp:Label><br />
    <asp:CheckBox ID="cbAuthority" runat="server" Text="將文件讀者與新目錄讀者合併(*只針對有單獨設定讀者的文件)" ForeColor="Blue" meta:resourcekey="cbAuthorityResource1"/><br />
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請選擇目地目錄" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="搬移文件至目錄發生錯誤" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="不可搬移至目前的目錄" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="沒有選擇要搬移的文件" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="cmvNoPrivilege" runat="server" Display="Dynamic" 
        ErrorMessage="無權限搬移至此目錄" meta:resourcekey="cmvNoPrivilegeResource1"  ></asp:CustomValidator>
	<telerik:RadTreeView runat="server" ID="folderTree" EnableNodeTextHtmlEncoding="true" meta:resourcekey="folderTreeResource1">
    </telerik:RadTreeView>
    
    <input id="hidGridKey" runat="server" type="hidden" style="width: 48px" />    
    <asp:Label ID="lblMoveDoc" runat="server" Text="搬移文件" Visible="False" meta:resourcekey="lblMoveDocResource1"></asp:Label>
    <asp:Label ID="lblRoot" runat="server" Text="文件庫" Visible="False" meta:resourcekey="lblRootResource1"></asp:Label>
    <asp:Label ID="lblDocNoDuplicate" runat="server" Text="文件編號: {0} 已在目地目錄被使用" Visible="False" meta:resourcekey="lblDocNoDuplicateResource1" ></asp:Label>
    <asp:HiddenField ID="hidSelectNose" runat="server" />
    <asp:HiddenField ID="hidNotShowFolder" runat="server" Value="''" />
    <asp:HiddenField ID="hidNotShowChildFolderID" runat="server" Value="''" /> 
</asp:Content>

