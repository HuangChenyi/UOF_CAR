<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Common_HtmlEditor_SelectDMSFolderDoc" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SelectDMSFolderDoc.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<script id="DocRefLinkjs" type="text/javascript">

    var firstOpen = true;

    $(function () {

    });

</script>

<script type="text/jscript">
    var selTreeId;
    var arrayNodes = new Array();

    function AddTreeNode(docID, docName, version) {
        var treeCurrent = $find("<%= docTree.ClientID %>");
        var keyvalue = docID + "@" + version;
        var node = treeCurrent.findNodeByValue(keyvalue);//docID
	    if (!node) {
	        treeCurrent.trackChanges();
	        var newNode = new Telerik.Web.UI.RadTreeNode();
	        newNode.set_text(docName);
	        newNode.set_value(keyvalue);//docID
            if(version=="NEW")
                newNode.set_imageUrl("../../Common/Images/Icon/icon_m155.gif");
	        else
                newNode.set_imageUrl("../../Common/Images/Icon/icon_m156.gif");
	        treeCurrent.get_nodes().add(newNode);
	        treeCurrent.commitChanges();
	    }
	}

	function docTreeClientNodeClicked(sender, args) {
	    var node = args.get_node();
	    // 移除
	    var tree = $find("<%= docTree.ClientID %>");

		tree.trackChanges();
		node.get_parent().get_nodes().remove(node);
	    //... or by ordinal position    
	    //node.get_parent().get_nodes().removeAt(0);    
	    //... or remove all nodes at one time
	    //node.get_parent().get_nodes().clear();
		tree.commitChanges();
    }





//2012-5-24 ELTON, add for download file by [FileCenterV2 FileControlHandler]
function DownloadFileWithHandler(sHandlerUrl, sUserProxyIndex) {
    $uof.download(sHandlerUrl, sUserProxyIndex);
}


</script>




   <table id="Table1" border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 450px; border: solid 2px silver; padding: 0px;">
	   <tr>
		   <td valign="top" style="width:20%">

			   <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%; padding: 0px; TABLE-LAYOUT: fixed;">
				   <tr>
					   <td valign="top" align="left" style="border-right-color: Silver; border-right-width: thin; border-right-style: solid; height: 100%; width: 150px">

						   <asp:UpdatePanel ID="UpdatePanel2" runat="server">
							   <contenttemplate>
                          
                           
                            
                                <asp:Label ID="Label2" runat="server" Text="已選取的文件" meta:resourcekey="Label2Resource1" ></asp:Label><br />
								<telerik:RadButton ID="wibtnClearAll" Text="清除全部" runat="server" OnClick="wibtnClearAll_Click" meta:resourcekey="wibtnClearAllResource1">
						        </telerik:RadButton>	
                                <br />
                                <div style=" overflow:auto;width:100%;height:400px">
                                        <telerik:RadTreeView runat="server" ID="docTree" 
                                        OnNodeCreated="docTree_NodeCreated" EnableNodeTextHtmlEncoding="true"
                                        OnClientNodeClicked="docTreeClientNodeClicked" meta:resourcekey="docTreeResource1">
                                    </telerik:RadTreeView>
                                </div>
                                </contenttemplate>
						   </asp:UpdatePanel>
					   </td>
				   </tr>
			   </table>
		   </td>
		   <td valign="top" align="left" style="border-right-color: Silver; border-right-width: thin; border-right-style: solid; height: 400px; width: 20%;">
			   	<div id="folderdiv" style="overflow: auto; width: 100%; height: 100%">
								   <telerik:RadTreeView runat="server" ID="folderTree" EnableNodeTextHtmlEncoding="true"
									OnNodeClick="folderTree_NodeClick" meta:resourcekey="folderTreeResource1">
									    </telerik:RadTreeView>
							   </div>
		   </td>
		   <td valign="top" align="left" style="height: 369px; width: 60%">


			   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
				   <contenttemplate>                                
                        <asp:Label runat="server" Text="文件編號或名稱" meta:resourcekey="LabelResource1"></asp:Label> <asp:TextBox ID="txtKeyVlue" runat="server" meta:resourcekey="txtKeyVlueResource1" ></asp:TextBox>    
                        <telerik:RadButton ID="btnSearch" runat="server" Text="搜尋" OnClick="btnSearch_Click" meta:resourcekey="btnSearchResource1"></telerik:RadButton>                                           
                             <div id="folderGrid" style="  overflow-y: auto; width: 100%; ">
                                <fast:grid id="docGrid" runat="server" allowpaging="True" allowsorting="True" autogeneratecheckboxcolumn="False"
                                 autogeneratecolumns="False"  datakeynames="DOC_ID"
                                 datakeyonclientwithcheckbox="True"  enhancepager="True"
                                 pagesize="15"  skinid="DMSStyle"  width=100% OnRowDataBound="docGrid_RowDataBound" OnPageIndexChanging="docGrid_PageIndexChanging" OnSorting="docGrid_Sorting" DefaultSortDirection="Ascending" EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="docGridResource1" >
                                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                                    <exportexcelsettings allowexporttoexcel="False" />
                                <Columns>               
                                <asp:TemplateField HeaderText="狀態" SortExpression="DOC_STATUS"  meta:resourcekey="TemplateFieldResource1" Visible="False" >
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblStatus" Text='<%# Bind("DOC_STATUS") %>' meta:resourcekey="lblStatusResource1"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False"/>
                                        <ItemStyle Wrap="False"/>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="文件名稱" SortExpression="DOC_NAME" meta:resourcekey="TemplateFieldResource2" >
                                        <ItemTemplate>
                                            <span style="word-wrap:break-word; word-break:break-all; ">
                                                <asp:Image runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" ID="imgDocIcon" meta:resourcekey="imgDocIconResource1" />
                                                &nbsp;<asp:LinkButton runat="server" ID="lbtnDocName" meta:resourcekey="lbtnDocNameResource1"></asp:LinkButton>
                                            </span>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" Width="45%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="保管者" meta:resourcekey="TemplateFieldResource3" >
                                        <ItemTemplate>
                                            <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList1" IsAllowEdit="false"></uc1:UC_ChoiceList>
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" Width="25%" />
                                    </asp:TemplateField>
                                   
                                    <asp:TemplateField HeaderText="加入" meta:resourcekey="TemplateFieldResource4" >
                                        <itemtemplate>
<asp:LinkButton runat="server" ID="linkbtAdd" meta:resourcekey="linkbtAddResource1"  >文件連結</asp:LinkButton> <br />
<asp:LinkButton runat="server" ID="linkVerAdd" meta:resourcekey="linkVerAddResource1" >版本連結</asp:LinkButton>

</itemtemplate> <HeaderStyle Wrap="False" Width="15%"/>
                                    </asp:TemplateField>
                                </Columns>
                                </fast:grid>                                
                              </div>  
                                
                            
                                                                                                                                                                                                                                                 
                                    </contenttemplate>
			   </asp:UpdatePanel>
		   </td>
	   </tr>
   </table>

    <asp:HiddenField ID="hidRefDoc" runat="server" />&nbsp;
    <asp:HiddenField ID="hidSelectType" runat="server" />       
    <asp:Label ID="lblDMSRoot" runat="server" Text="文件庫" Visible="False" meta:resourcekey="lblDMSRootResource1" ></asp:Label>
    <asp:Label ID="lblCheckin" runat="server" Text="已存回" Visible="False" meta:resourcekey="lblCheckinResource1" ></asp:Label>
    <asp:Label ID="lblCheckOut" runat="server" Text="已取出" Visible="False" meta:resourcekey="lblCheckOutResource1" ></asp:Label>
    <asp:Label ID="lblApproval" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovalResource1" ></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="已公佈" Visible="False" meta:resourcekey="lblPublishResource1" ></asp:Label>
    <asp:Label ID="lblInactive" runat="server" Text="已失效" Visible="False" meta:resourcekey="lblInactiveResource1"></asp:Label>
    <asp:Label ID="lblVoid" runat="server" Text="已作廢" Visible="False" meta:resourcekey="lblVoidResource1" ></asp:Label>
    <asp:Label ID="lblTempInact" runat="server" Text="已下架" Visible="False" meta:resourcekey="lblTempInactResource1" ></asp:Label>
    <asp:Label ID="lblOldVer" runat="server" Text="舊版本" Visible="False" meta:resourcekey="lblOldVerResource1" ></asp:Label>
    <asp:Label ID="lblReAct" runat="server" Text="已上架" Visible="False" meta:resourcekey="lblReActResource1" ></asp:Label>
    <asp:Label ID="labDocDeny" runat="server" Text="發佈拒絕" Visible="False" meta:resourcekey="labDocDenyResource1" ></asp:Label>&nbsp;
    <asp:Label ID="labNoActive" runat="server" Text="未生效" Visible="False" meta:resourcekey="labNoActiveResource1" ></asp:Label>
 
    <asp:Label ID="lblFolder" runat="server" Text="目錄" Visible="False" meta:resourcekey="lblFolderResource1" ></asp:Label>
    <asp:Label ID="lblSearch" runat="server"  Text="全文檢索" Visible="False" meta:resourcekey="lblSearchResource1"></asp:Label>
    
    <asp:HiddenField ID="hidClickValue" runat="server"/>
    <asp:HiddenField ID="hdAppPath" runat="server" EnableViewState="true"/>
    <asp:HiddenField ID="hidTabSelect" runat="server" EnableViewState="true" />
     
    
     <asp:Label ID="lblDMSClass" runat="server" Text="文件類別" Visible="False" meta:resourcekey="lblDMSClassResource1" ></asp:Label>
     
     <asp:HiddenField ID="hidSelectNose" runat="server" />
    <asp:HiddenField ID="hidNotShowFolder" runat="server" Value="''" />
    <asp:HiddenField ID="hidNotShowChildFolderID" runat="server" Value="''" /> 
     
    <!--2012-5-23 ELTON, 因檔案仍在Proxy尚未傳輸到UOF, 需顯示警告訊息-->
    <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" meta:resourcekey="lblFileNotTransferToUofResource1"></asp:Label>
        <asp:Label ID="lblVioding" runat="server" Text="(作廢審核中)" Visible="False" meta:resourcekey="lblViodingResource1" ></asp:Label>
    <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1" ></asp:Label>
    <asp:Label ID="Label11" runat="server" Text="未生效" Visible="False" meta:resourcekey="Label11Resource1"></asp:Label>
    <asp:Label ID="lblDraft" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftResource1" ></asp:Label>

</asp:Content>

