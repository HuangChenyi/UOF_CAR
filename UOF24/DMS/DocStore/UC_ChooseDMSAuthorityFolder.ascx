<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_ChooseDMSAuthorityFolder.ascx.cs" Inherits="Ede.Uof.Web.DMS.DocStore.UC_ChooseDMSAuthorityFolder" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<script type="text/javascript" id="igClientScript">

	function WebImageButton1ClientClick(button, args){
	    var pid = '<%=hidSelectFolderID2.ClientID %>';	    
	    $uof.dialog.open2("~/DMS/DocStore/ChooseDMSAuthorityFolder.aspx", button, "", 815, 500, 
           OpenDialogResult, {"parentid": pid, "RoleId":"DMSAuthor,DMSFolderMang"});
	    return false;
    }

   function OpenDialogResult(returnValue) {
                if (typeof (returnValue) == "undefined")
                    return false;
                else
                    return true;
        }
</script>
<asp:UpdatePanel ID="dmsAuthorityFolderUpdatePanel" runat="server">
    <ContentTemplate>   
        <table style="width:300px">
            <tr>                
                <td>  
					<telerik:RadButton ID="WebImageButton1" Text="選取目錄" runat="server" OnClientClicked="WebImageButton1ClientClick" OnClick="WebImageButton1_Click" meta:resourcekey="WebImageButton1Resource1"></telerik:RadButton>
                </td>
            </tr>
            <tr>                
                <td>
                    <telerik:RadTreeView runat="server" ID="folderTree" EnableNodeTextHtmlEncoding="True" meta:resourcekey="folderTreeResource1" ></telerik:RadTreeView>
                </td>
            </tr>
        </table>  
    
    <asp:HiddenField ID="hidSelectFolderID" runat="server" />
    <asp:HiddenField ID="hidSelectFolderID2" runat="server" />
    </contenttemplate>
</asp:UpdatePanel>