<%@ Control Language="C#" AutoEventWireup="true" Inherits="DMS_DocStore_UC_ChooseFolder" Codebehind="UC_ChooseFolder.ascx.cs" %>
<%@ Register assembly="System.Web.Extensions" namespace="System.Web.UI" tagprefix="asp" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<script type="text/javascript" id="igClientScript">
<!--

	function WebImageButton1ClientClick(button, args){
	    var pid = '<%=hidSelectFolderID2.ClientID %>';	    
	    $uof.dialog.open2("~/DMS/DocStore/ChooseFolder.aspx", button, "", 815, 500, 
            function (returnValue) 
            { 
                if (typeof (returnValue) != 'undefined' || returnValue != null || returnValue != "")
                { return true; }

                return false;
            }
            , {"parentid": pid });
	    return false;
    }
// -->
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
        <table width="300px">
            <tr>                
                <td>
                    
					<telerik:RadButton ID="WebImageButton1" Text="選取目錄" runat="server" OnClientClicked="WebImageButton1ClientClick" OnClick="WebImageButton1_Click"
						  meta:resourcekey="WebImageButton1Resource1">
						</telerik:RadButton>
                </td>
            </tr>
            <tr>                
                <td style="">
                    
					<telerik:RadTreeView runat="server" ID="folderTree" EnableNodeTextHtmlEncoding="true" >
									    </telerik:RadTreeView>
                </td>
            </tr>
        </table>  
    
    <asp:HiddenField ID="hidSelectFolderID" runat="server" />
    <asp:HiddenField ID="hidSelectFolderID2" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>
