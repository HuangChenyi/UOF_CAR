<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="System_CustomMenu_Default" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc3" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc3" TagName="UC_HtmlEditor" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc3" TagName="UC_FileCenter" %>




<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <style type="text/css">
        .JustAddBorder table tr td {
            border-width:1px;
            border-style:solid;
        }
    </style>

    <script type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_pageLoaded(pageLoaded);

        function pageLoaded(sender, args) {
            var lblRequireMenuTextMsg = $("#<%=lblRequireMenuTextMsg.ClientID %>");
            if (lblRequireMenuTextMsg.length) {
                lblRequireMenuTextMsg.hide();
            }

            var lblRequiredLinkUrl = $("#<%=lblRequiredLinkUrl.ClientID %>");
            if (lblRequiredLinkUrl.length) {
                lblRequiredLinkUrl.hide();
            }

            var lblSign = $("#<%=lblSign.ClientID %>");
            lblSign.hide();
            var tree = $find("<%= this.RadTreeView1.ClientID %>");
            var node = tree.get_selectedNode();
            if (node && node.get_level() > 2) {
                lblSign.show();
            }
        }  


        function RadToolBar1_ButtonClicking(sender, args) {

            var Key = args.get_item().get_value();

            if (Key == "DelMenu") {
                if (confirm('<%=lblMsgCheckDel.Text %>') == false)
	            args.set_cancel(true);
	    }
    }

    function RadToolBar2_ButtonClicking(sender, args) {

        var Key = args.get_item().get_value();

        if (Key == "AddPara") {
            args.set_cancel(true);
            $uof.dialog.open2("~/System/CustomMenu/AddParameter.aspx", args.get_item(), "", 800, 650, OpenDialogResult);

        }
        else if (Key == "DelPara") {
            if (confirm('<%=lbMsgCheckDeleteParameter.Text %>') == false)
                args.set_cancel(true);
        }
}

function btSave_Clicking(sender, args) {
    //Add code to handle your event here.
    var txtMenu = $("#<%=txtMenuText.ClientID %>");
         var lblRequireMenuTextMsg = $("#<%=lblRequireMenuTextMsg.ClientID %>");
         if (txtMenu.val().trim() === "") {
             lblRequireMenuTextMsg.css("display", "");
             args.set_cancel(true);
         }
         else {
             lblRequireMenuTextMsg.css("display", "none");
             args.set_cancel(false);
         }

         var tree = $find("<%= this.RadTreeView1.ClientID %>");
         var node = tree.get_selectedNode();
         if (node && node.get_level() > 2) {
             var rbLink = $("#<%=rbLink.ClientID %>").is(":checked");
             if (rbLink) {
                var txtLinkUrl = $("#<%=txtLinkUrl.ClientID %>");
                var lblRequiredLinkUrl = $("#<%=lblRequiredLinkUrl.ClientID %>");
                if (txtLinkUrl.val().trim() === "") {
                    lblRequiredLinkUrl.show()
                    args.set_cancel(true);
                }
                else {
                    lblRequiredLinkUrl.hide();
                    args.set_cancel(false);
                }
             }
         }
     }

     function CheckParameterName(name, orgName) {
         var tmpNames = $uof.tool.htmlDecode(ParameterName);;
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

     function OpenDialogResult(retuenValue) {
         if (typeof (retuenValue) === 'undefined' || retuenValue === null) {
             return false;
         }
         else {
             return true;
         }
     }

     function checkRb() {

     }  
     Sys.Application.add_load(function () { checkRb(); })
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick"
        OnClientButtonClicking="RadToolBar1_ButtonClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
        <Items>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m112.gif"
                ImageUrl="~/Common/Images/Icon/icon_m112.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m112.gif"
                Value="AddMenu" Text="新增選單" meta:resourcekey="TBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m113.gif"
                ImageUrl="~/Common/Images/Icon/icon_m113.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m113.gif"
                Value="Up" Text="選單順序上移" meta:resourcekey="TBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m114.gif"
                ImageUrl="~/Common/Images/Icon/icon_m114.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m114.gif"
                Value="Down" Text="選單順序下移" meta:resourcekey="TBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s3" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m115.gif"
                ImageUrl="~/Common/Images/Icon/icon_m115.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m115.gif"
                Value="DelMenu" Text="刪除選單" meta:resourcekey="TBarButtonResource4">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s4" meta:resourcekey="RadToolBarButtonResource4">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m49.gif"
                ImageUrl="~/Common/Images/Icon/icon_m49.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m49.gif"
                Value="Reload" Text="重新載入選單" meta:resourcekey="TBarButtonResource5">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s5" meta:resourcekey="RadToolBarButtonResource5">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional" ChildrenAsTriggers="False">
        <ContentTemplate>
            <telerik:RadTreeView ID="RadTreeView1" runat="server" OnNodeClick="RadTreeView1_NodeClick" EnableNodeTextHtmlEncoding="true" meta:resourcekey="RadTreeView1Resource1"></telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:CustomValidator ID="cvSelectNode" runat="server" Display="Dynamic" ErrorMessage="請選擇節點，或點選新增選單開始"
                Font-Bold="True" meta:resourcekey="cvSelectNodeResource1"></asp:CustomValidator>
            <asp:CustomValidator ID="cvNotDeleteNode" runat="server" ErrorMessage="此為根節點或尚有子節點存在，不可刪除"
                Display="Dynamic" Font-Bold="True" meta:resourcekey="cvNotDeleteNodeResource1"></asp:CustomValidator>
            <asp:CustomValidator ID="cvUnSave" runat="server" ErrorMessage="新增之選單尚未儲存" Display="Dynamic"
                Font-Bold="True" meta:resourcekey="cvUnSaveResource1"></asp:CustomValidator>
            <asp:CustomValidator ID="cvNoAuthority" runat="server" ErrorMessage="沒有權限" Font-Bold="True"
                meta:resourcekey="cvNoAuthorityResource1" Display="Dynamic"></asp:CustomValidator>
            <asp:Panel ID="panTB" runat="server" Width="100%" meta:resourcekey="panTBResource1">
                <table class="PopTable" width="100%" cellspacing="1">
                    <tr>
                        <td>
                            <font color="red">*</font>
                            <asp:Label ID="lblMenuText" runat="server" Text="選單文字"
                                meta:resourcekey="lblMenuTextResource1"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMenuText" runat="server" meta:resourcekey="txtMenuTextResource1"
                                Columns="50" MaxLength="50"></asp:TextBox>
                            <asp:Label ID="lblRequireMenuTextMsg" runat="server" Text="請輸入文字" Font-Bold="True"
                                ForeColor="Red" meta:resourcekey="lblRequireMenuTextMsgResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblResource" runat="server" Text="選單多國語言" meta:resourcekey="lblResourceResource1"></asp:Label>
                        </td>
                        <td style="line-height: 2.2em;">
                            <table id="tbResourceMenu" runat="server">
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="選單類型" meta:resourcekey="Label1Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:RadioButton ID="rbLink" Checked="True" AutoPostBack="True" onclick="checkRb();" GroupName="1" Text="連結" OnCheckedChanged="rbLink_CheckedChanged" runat="server" meta:resourcekey="rbLinkResource1" />
                            <asp:RadioButton ID="rbContent" AutoPostBack="True" onclick="checkRb()" GroupName="1" Text="自訂內容" OnCheckedChanged="rbContent_CheckedChanged1" runat="server" meta:resourcekey="rbContentResource1" />
                            <asp:RadioButton ID="rbFillForm" AutoPostBack="True" onclick="checkRb()" GroupName="1" Text="申請表單" OnCheckedChanged="rbFillForm_CheckedChanged" runat="server" meta:resourcekey="rbFillFormResource1"  />
                        </td>
                    </tr>

                    <tr id="systemLinkWeb" runat="server">
                        <td runat="server">
                            <asp:Label ID="lblSign" runat="server" Text="*" ForeColor="Red" ></asp:Label>                       
                            <asp:Label ID="lblLinkUrl" runat="server" Text="連結網頁" meta:resourcekey="lblLinkUrlResource1"></asp:Label>
                        </td>
                        <td runat="server">
                            <asp:TextBox ID="txtLinkUrl" runat="server" meta:resourcekey="txtLinkUrlResource1"
                                Columns="50"></asp:TextBox>
                            <asp:Label ID="lblNoUrl" runat="server" Text="說明 : 第二階選單為選單類別，不需輸入連接位置，請於選單類別下再新增欲管理的選單。"
                                Visible="False" Font-Bold="False" ForeColor="Blue" meta:resourcekey="lblNoUrlResource1"></asp:Label>
                            <asp:Label ID="lblRequiredLinkUrl" runat="server" Text="請輸入網址" Font-Bold="True" ForeColor="Red" meta:resourcekey="lblRequiredLinkUrlResource1"></asp:Label>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr id="systemLinkParas" runat="server">
                        <td runat="server">
                            <asp:Label ID="lblLinkPara" runat="server" Text="連結參數" meta:resourcekey="lblLinkParaResource1"></asp:Label>
                        </td>
                        <td runat="server">
                            <asp:Panel ID="PanelParameter" runat="server" meta:resourcekey="PanelParameterResource1">
                                <telerik:RadToolBar ID="RadToolBar2" runat="server" Width="100%" OnButtonClick="RadToolBar2_ButtonClick"
                                    OnClientButtonClicking="RadToolBar2_ButtonClicking" meta:resourcekey="RadToolBar2Resource1" SingleClick="None">
                                    <Items>
                                        <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_j13.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_j13.gif" CheckedImageUrl="~/Common/Images/Icon/icon_j13.gif"
                                            Value="AddPara" Text="新增參數" meta:resourcekey="TBarButtonResource6">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource6">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/Common/Images/Icon/icon_m115.gif"
                                            ImageUrl="~/Common/Images/Icon/icon_m115.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m115.gif"
                                            Value="DelPara" Text="刪除參數" meta:resourcekey="TBarButtonResource7">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource7">
                                        </telerik:RadToolBarButton>
                                    </Items>
                                </telerik:RadToolBar>
                                <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                                    DataKeyNames="PARA_GUID" AllowSorting="True" DataKeyOnClientWithCheckBox="False"
                                    DefaultSortDirection="Ascending" EnhancePager="True" PageSize="15" DefaultSortColumnName="NAME"
                                    OnSorting="Grid1_Sorting" OnRowDataBound="Grid1_RowDataBound" CustomDropDownListPage="False" EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="Grid1Resource2" SelectedRowColor="" UnSelectedRowColor="">
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="參數名稱" meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbName" runat="server" OnClick="lbName_Click"
                                                    meta:resourcekey="lbNameResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="資料來源" meta:resourcekey="TemplateFieldResource2">
                                            <ItemTemplate>
                                                <asp:Label ID="lbSource" runat="server" meta:resourcekey="lbSourceResource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="加密" meta:resourcekey="TemplateFieldResource3">
                                            <ItemTemplate>
<%--                                                <input id="Checkbox1" type="checkbox" checked='<%# Bind("ENCRYPTION") %>' disabled="disabled"
                                                    runat="server" />--%>
                                                <asp:CheckBox ID="Checkbox1" runat="server" checked='<%# Bind("ENCRYPTION") %>' Enabled="false" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                                <table>
                                    <tr>
                                        <td colspan="2">
                                            <br />
                                            <asp:Label ID="lblEncyption" runat="server" Text="加密演算法(Advanced Encryption Standard,AES 128bits)"
                                                meta:resourcekey="lblEncyptionResource1"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table style="line-height: 2.2em">
                                                <tr>
                                                    <td style="padding-right: 5px">
                                                        <asp:Label ID="lblEncyptionKey" runat="server" Text="Key" meta:resourcekey="lblEncyptionKeyResource1"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtKey" runat="server" MaxLength="50" meta:resourcekey="txtKeyResource1"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblEncyptionIV" runat="server" Text="IV" meta:resourcekey="lblEncyptionIVResource1"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="txtIV" runat="server" meta:resourcekey="txtIVResource1"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />                                
                                <telerik:RadButton ID="btnPreview" runat="server" Text="預覽連結" OnClick="btnPreview_Click" meta:resourcekey="btnPreviewResource1"></telerik:RadButton>                                
                                
                                <asp:HyperLink ID="hlPreview" runat="server" Target="_blank" meta:resourcekey="hlPreviewResource1"></asp:HyperLink>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr id="fillFormTr" runat="server">
                        <td runat="server">
                            <asp:Label ID="lblFormName" runat="server" Text="表單名稱" meta:resourcekey="lblFormNameResource1"></asp:Label>
                        </td>
                        <td runat="server">
                            <asp:DropDownList ID="ddlFormName" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFormName_SelectedIndexChanged">
                                <asp:ListItem Text="請選擇" Value="Select" meta:resourcekey="ListItemResource1"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr id="htmleditor" runat="server">
                        <td runat="server">
                            <asp:Label ID="Label2" runat="server" Text="內容" meta:resourcekey="Label2Resource1"></asp:Label>
                           
                        </td>
                        <td runat="server">                            
                            <telerik:RadButton ID="btnEditor"  OnClick="btnEditor_Click" runat="server" Text="編輯內容" meta:resourcekey="btnEditorResource1"></telerik:RadButton>   <br/>                                                         
                            <asp:Label ID="lblHtml" runat="server" meta:resourcekey="lblHtmlResource1" CssClass="JustAddBorder"></asp:Label>       
                            <uc3:UC_FileCenter runat="server" ID="UC_FileCenter" />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lblNewWindow" runat="server" meta:resourcekey="lblNewWindowResource1"
                                Text="開新視窗"></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="cbNewWindow" runat="server" meta:resourcekey="cbNewWindowResource1" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <font color="red"></font>
                            <asp:Label ID="lblUserSet" runat="server" Text="選取人員" meta:resourcekey="lblUserSetResource1" Visible="false"></asp:Label>
                            <asp:Label ID="lblMenuAuth" runat="server" Text="選單權限" meta:resourcekey="lblMenuAuthResource1"></asp:Label>
                        </td>
                        <td valign="top">
                            <uc3:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="false" />
                            <asp:Label ID="lblAuthMessage" runat="server" Text="目前選單類型為申請表單，選單權限會自動繼承表單使用權限" CssClass="SizeMemo" meta:resourcekey="lblAuthMessageResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">
                            <telerik:RadButton ID="btSave" runat="server" Text="儲存" OnClick="btSave_Click" meta:resourcekey="btSaveResource1" AutoSubmit="False" OnClientClicking="btSave_Clicking"></telerik:RadButton>
                            <asp:Label ID="lblSaveSuccess" runat="server" Font-Bold="True" ForeColor="Blue" Text="儲存成功"
                                Visible="False" meta:resourcekey="lblSaveSuccessResource1"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:HiddenField ID="hideIsSave" runat="server" />
            <asp:HiddenField ID="hideLastSelMenuID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblMsgCheckDel" runat="server" meta:resourceKey="lblMsgCheckDelResource1" Text="確定要刪除此選單嗎？" Visible="False"></asp:Label>
    <asp:Label ID="lblCustomMenu" runat="server" meta:resourceKey="lblCustomMenuResource1" Text="自訂選單" Visible="False"></asp:Label>
    <asp:Label ID="lblPreview" runat="server" Text="編輯內容" Visible="False" meta:resourcekey="lblPreviewResource1"></asp:Label>
    <asp:Label ID="lbMsgCheckDeleteParameter" runat="server" meta:resourcekey="lbMsgCheckDeleteParameterResource1" Text="確定要刪除嗎?" Visible="False"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
