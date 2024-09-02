<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="System_MulitSitesMenu_Default" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc3" %>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContentPlaceHolder" Runat="Server">
    <script type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_pageLoaded(pageLoaded);

        function pageLoaded(sender, args) {
            var lblRequireMenuTextMsg = $("#<%=lblRequireMenuTextMsg.ClientID %>");
        if (lblRequireMenuTextMsg.length) {
            lblRequireMenuTextMsg.hide();
        }
    }

    function RadToolBar1_ButtonClicking(sender, args) {

        var Key = args.get_item().get_value();

        if (Key == "DelMenu") {
            if (confirm('<%=lblMsgCheckDel.Text %>') == false)
	            args.set_cancel(true);
	    }
    }



    function btSave_Clicking(sender, args) {
        //Add code to handle your event here.
        var txtMenu = $("#<%=txtMenuText.ClientID %>").val();
    var lblRequireMenuTextMsg = $("#<%=lblRequireMenuTextMsg.ClientID %>");

    if (txtMenu === "") {
        lblRequireMenuTextMsg.show();
        args.set_cancel(true);
    }
    else {
        lblRequireMenuTextMsg.hide();
        args.set_cancel(false);
    }
}

function CheckParameterName(name, orgName) {
    var tmpNames = ParameterName;
    if (orgName != "") {
        tmpNames = tmpNames.replace('{' + orgName + '}', '');
    }
    if (tmpNames.indexOf('{' + name + '}') > -1) {
        return true;
    }
    else {
        return false;
    }
}

function SelectSite() {

    var lblRealLink = $("#<%= lblRealLink.ClientID %>");
    var ddlDomainUrl = $("#<%= ddlDomainUrl.ClientID %>");

    lblRealLink.text($uof.tool.htmlDecode(ddlDomainUrl.val()));
}

    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarContentPlaceHolder" Runat="Server">

                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick"
                    OnClientButtonClicking="RadToolBar1_ButtonClicking">
                    <Items>
                        <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m112.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m112.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m112.gif"
                            Value="AddMenu" Text="新增選單" meta:resourcekey="TBarButtonResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m113.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m113.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m113.gif"
                            Value="Up" Text="選單順序上移" meta:resourcekey="TBarButtonResource2">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m114.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m114.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m114.gif"
                            Value="Down" Text="選單順序下移" meta:resourcekey="TBarButtonResource3">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s3">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m115.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m115.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m115.gif"
                            Value="DelMenu" Text="刪除選單" meta:resourcekey="TBarButtonResource4">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s4">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m49.gif"
                            ImageUrl="~/Common/Images/Icon/icon_m49.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m49.gif"
                            Value="Reload" Text="重新載入選單" meta:resourcekey="TBarButtonResource5">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s5">
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
 </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="LeftContentPlaceHolder" Runat="Server">        
      
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <telerik:RadTreeView ID="RadTreeView1" runat="server" Height="450px" Width="250px" EnableNodeTextHtmlEncoding="true" OnNodeClick="RadTreeView1_NodeClick"></telerik:RadTreeView>
                       
                    </ContentTemplate>
                   
                </asp:UpdatePanel>
   </asp:Content>
 <asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" Runat="Server">        
            
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:CustomValidator ID="cvSelectNode" runat="server" Display="Dynamic" ErrorMessage="請選擇節點，或點選新增選單開始"
                            class="SizeSB" ForeColor="Red" meta:resourcekey="cvSelectNodeResource1"></asp:CustomValidator>
                        <asp:CustomValidator ID="cvNotDeleteNode" runat="server" ErrorMessage="此為根節點或尚有子節點存在，不可刪除"
                            Display="Dynamic" class="SizeSB" ForeColor="Red" meta:resourcekey="cvNotDeleteNodeResource1"></asp:CustomValidator>
                        <asp:CustomValidator ID="cvUnSave" runat="server" ErrorMessage="新增之選單尚未儲存" Display="Dynamic"
                            class="SizeSB" ForeColor="Red" meta:resourcekey="cvUnSaveResource1"></asp:CustomValidator>
                        <asp:CustomValidator ID="cvNoAuthority" runat="server" ErrorMessage="沒有權限" class="SizeSB"
                            Display="Dynamic" ForeColor="Red" meta:resourcekey="cvNoAuthorityResource1"></asp:CustomValidator>
                        <asp:Panel ID="panTB" runat="server" Width="100%" meta:resourcekey="panTBResource1">
                            <table class="PopTable" width="100%" cellspacing="1">
                              
                                <tr>
                                    <td>
                                        <font color="red">*</font><asp:Label ID="lblMenuText" runat="server" Text="選單文字"
                                            meta:resourcekey="lblMenuTextResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMenuText" runat="server" Columns="50" MaxLength="50" meta:resourcekey="txtMenuTextResource1"></asp:TextBox>
                                        <asp:Label ID="lblRequireMenuTextMsg" runat="server" Text="此為必要欄位" ForeColor="Red"
                                            meta:resourcekey="lblRequireMenuTextMsgResource1"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblResource" runat="server" Text="選單多國語言" meta:resourcekey="lblResourceResource1"></asp:Label>
                                    </td>
                                    <td style="line-height: 2.2em">
                                        <table id="tbResourceMenu" runat="server">
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label1Resource1"></asp:Label>
                                        <asp:Label ID="lblLinkUrl" runat="server" Text="連結網頁" meta:resourcekey="lblLinkUrlResource1"></asp:Label>
                                    </td>
                                    <td style="line-height: 2.2em">
                                        <table>
                                            <tr>
                                                <td style="padding-right: 5px">
                                                    <asp:Label ID="Label3" runat="server" Text="選擇集團" meta:resourcekey="Label3Resource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlDomainUrl" runat="server" AutoPostBack="true" meta:resourcekey="ddlDomainUrlResource1"
                                                        onchange="SelectSite()" OnSelectedIndexChanged="ddlDomainUrl_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:Label ID="lblSetDomain" runat="server" Text="請先到一般組態設定集團Domain Site。" ForeColor="Red"
                                                        Visible="False" meta:resourcekey="lblSetDomainResource1"></asp:Label>
                                                    <asp:Label ID="lblErrorDomain" runat="server" ForeColor="Red" Text="原集團資訊遺失,請重新選擇。"
                                                        Visible="False" meta:resourcekey="lblErrorDomainResource1"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                        <table>
                                            <tr>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td style="padding-right: 5px">
                                                                <asp:Label ID="lblRealLink" runat="server" ForeColor="Blue" meta:resourcekey="lblRealLinkResource1"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txtLinkUrl" runat="server" Columns="50" meta:resourcekey="txtLinkUrlResource1"
                                                                    Width="250px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:Label ID="lblRealLinkTitle" runat="server" Text="真實網址為：" ForeColor="Blue" meta:resourcekey="lblRealLinkTitleResource1"
                                            Visible="false"></asp:Label>
                                        <asp:Label ID="lblNoUrl" runat="server" Text="說明 : 第二階選單為選單類別，不需輸入連接位置，請於選單類別下再新增欲管理的選單。"
                                            Visible="False"  ForeColor="Blue" meta:resourcekey="lblNoUrlResource1"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="display: none">
                                    <td>
                                        <asp:Label ID="lblNewWindow" runat="server" Text="開新視窗" meta:resourcekey="lblNewWindowResource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbNewWindow" runat="server" Checked="True" meta:resourcekey="cbNewWindowResource1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <font color="red"></font>
                                        <asp:Label ID="lblUserSet" runat="server" Text="選取人員" meta:resourcekey="lblUserSetResource1"></asp:Label>
                                    </td>
                                    <td valign="top">
                                        <uc3:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center">
                                        <telerik:RadButton ID="btSave" runat="server" Text="儲存" OnClick="btSave_Click" OnClientClicking="btSave_Clicking" AutoSubmit="False" meta:resourcekey="btSaveResource1"></telerik:RadButton>

                                        <asp:Label ID="lblSaveSuccess" runat="server" class="SizeSB" ForeColor="Blue" Text="儲存成功"
                                            Visible="False" meta:resourcekey="lblSaveSuccessResource1"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <input id="hideIsSave" runat="server" type="hidden" />
                        <input id="hideLastSelMenuID" runat="server" type="hidden" />
                        <asp:Label ID="lblMsgCheckDel" runat="server" Text="確定要刪除此選單嗎？" Visible="False" meta:resourcekey="lblMsgCheckDelResource1"></asp:Label>
                        <asp:Label ID="lblCustomMenu" runat="server" Text="集團選單" Visible="False" meta:resourcekey="lblCustomMenuResource1"></asp:Label>
                        <asp:Label ID="lbMsgCheckDeleteParameter" runat="server" Text="確定要刪除嗎?" Visible="False"
                            meta:resourcekey="lbMsgCheckDeleteParameterResource1"></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text="集團選單" Visible="False" meta:resourcekey="Label2Resource1"></asp:Label>
                        <asp:Label ID="lblNullItem" runat="server" Visible="False"></asp:Label>
                    </ContentTemplate>
                   
                </asp:UpdatePanel>
           
    <asp:HiddenField ID="hidSelectNode" runat="server" />
     <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

