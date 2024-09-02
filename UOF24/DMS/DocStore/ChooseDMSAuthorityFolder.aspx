<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ChooseDMSAuthorityFolder.aspx.cs" Inherits="Ede.Uof.Web.DMS.DocStore.ChooseDMSAuthorityFolder" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">

    $(function () {
        var curwindow = $uof.dialog.getOpener();
        var pd;
        if (curwindow) {
            pd = curwindow.document;
        } else if (typeof (dialogArguments) != "undefined") {
            pd = dialogArguments.document;
        }

        if (pd) {
            var hfSelectedFolderID = $("#<%=hfSelectedFolderID.ClientID%>");
            var parentid = $uof.tool.htmlDecode("<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["parentid"], true)%>");
            hfSelectedFolderID.val($("#" + parentid, pd).val());

            var isPostBack = $("#<%=hfIsPostBack.ClientID%>");
            if (isPostBack.val() == 'false') {
                isPostBack.val('true');

                $("#<%=btnPostBack.ClientID%>").click();
            }
        }
    });

    function wbtnClear_Click(button, args) {
        var tree = $find("<%= treeSelect.ClientID %>");

	    if (confirm('<%=lblClear.Text %>')) {
	        tree.trackChanges();
	        var node = tree.get_nodes();
	        node.clear();
	        tree.commitChanges();
	    }

	    button.set_autoPostBack(false);
	}

	function treeSelect_Click(sender, eventArgs) {
	    var tree = $find("<%= treeSelect.ClientID %>");
	    var node = eventArgs.get_node();
	    tree.trackChanges();
	    node.get_parent().get_nodes().remove(node);
	    tree.commitChanges();
	}
	$.extend({
	    getUrlVars: function () {
	        var vars = [], hash;
	        var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
	        for (var i = 0; i < hashes.length; i++) {
	            hash = hashes[i].split('=');
	            vars.push(hash[0]);
	            vars[hash[0]] = hash[1];
	        }
	        return vars;
	    },
	    getUrlVar: function (name) {
	        return $.getUrlVars()[name];
	    }
	});

	function OntreeFoldertNodeClicking(sender, args) {
	    var oldFolderid = $("#<%=hidSelectNose.ClientID %>").val();

	    $("#<%=hidSelectNose.ClientID %>").val(args.get_node().get_value());
	    var newFolderid = $("#<%=hidSelectNose.ClientID %>").val();
	    if (oldFolderid == newFolderid) {
	        args.set_cancel(true);
	    }
	}

	function OntreeFoldertNodeClicked(sender, args) {
	    var treeSelect = $find('<%=treeSelect.ClientID %>');
	    if (treeSelect.findNodeByValue(args.get_node().get_value()) == null) {
            treeSelect.trackChanges();
            var node = new Telerik.Web.UI.RadTreeNode();
            node.set_value(args.get_node().get_value());
            node.set_text(args.get_node().get_text());
            node.set_imageUrl("../../Common/Images/Icon/icon_m14.gif");
            treeSelect.get_nodes().insert(treeSelect.get_nodes().get_count(), node);
            treeSelect.commitChanges();
        }
        else {
	        return false;
        }
    }
    </script>    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Button ID="btnPostBack" runat="server" style="display:none;" OnClick="btnPostBack_Click" meta:resourcekey="btnPostBackResource1" />
            <table  style="height: 350px; width:780px">
                <tr>
                    <td style="width: 390px; vertical-align: top; height: 340px">
                        <telerik:RadButton ID="wbtnClear" Text="清除全部" runat="server" OnClientClicked="wbtnClear_Click" meta:resourcekey="wbtnClearResource1"
                            >
                        </telerik:RadButton>
                        <telerik:RadTreeView runat="server" ID="treeSelect" Height="320px" Width="390px" EnableNodeTextHtmlEncoding="True"
                            Image_Url="~/Common/Images/Icon/icon_m14.gif" OnClientNodeClicking="treeSelect_Click" meta:resourcekey="treeSelectResource1"></telerik:RadTreeView>                                                 
                    </td>
                    <td style="width: 390px; vertical-align: top; height: 350px">
                        <telerik:RadTreeView runat="server" ID="RadTreeView1" Height="400px" EnableNodeTextHtmlEncoding="True" 
                            OnClientNodeClicked="OntreeFoldertNodeClicked" OnClientNodeClicking="OntreeFoldertNodeClicking" OnNodeClick="RadTreeView1_NodeClick" meta:resourcekey="RadTreeView1Resource1">
                        </telerik:RadTreeView>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblRoot" runat="server" Text="文件庫" Visible="False" meta:resourcekey="lblRootResource1"></asp:Label>
    <asp:Label ID="lblIsChild" runat="server" Text='此目錄為"的子目錄，無法加入已選目錄' Visible="False" meta:resourcekey="lblIsChildResource1" ></asp:Label>
    <asp:Label ID="lblIsParent" runat="server" Text='此目錄為"的父目錄，這些子目錄將被從已選目錄移除' Visible="False" meta:resourcekey="lblIsParentResource1" ></asp:Label>    
    <asp:Label ID="lblClear" runat="server" Text='確定清除全部已選目錄嗎?' Visible="False" meta:resourcekey="lblClearResource1"></asp:Label>
    <asp:Label ID="lblIsSelect" runat="server" Text='此目錄已被選擇' Visible="False" meta:resourcekey="lblIsSelectResource1" ></asp:Label>        
    <asp:HiddenField ID="hidSelectNose" runat="server" />
    <asp:HiddenField ID="hidNotShowFolder" runat="server" Value="''" />
    <asp:HiddenField ID="hidNotShowChildFolderID" runat="server" Value="''" /> 
    <asp:HiddenField ID="hfSelectedFolderID" runat="server" /> 
    <asp:HiddenField ID="hfIsPostBack" runat="server" Value="false" /> 
     <asp:HiddenField ID="hfCurrentUserGuid" runat="server" /> 
     <asp:HiddenField ID="hfCurrentUserCulture" runat="server" /> 
     <asp:HiddenField ID="hfRoleId" runat="server" /> 
</asp:Content>
