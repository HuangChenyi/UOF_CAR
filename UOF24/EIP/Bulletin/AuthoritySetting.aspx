<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Bulletin_AuthoritySetting"
    Title="權限設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AuthoritySetting.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function RadToolBar1_ButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            if (key == "Save") {
                var isEdit = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hidSyncUpdate.Value,true)%>');
                if (isEdit == "Y") {
                    var withchild = $("#<%=chbWithChild.ClientID%>").is(":checked");
                    if (withchild == true) {
                        if (confirm('<%=lblMsgException.Text %>') == false)
                            args.set_cancel(true);
                    }                    
                }
            }
        }

        Sys.Application.add_load(function () {
            var toolBar = $find("<%=RadToolBar1.ClientID %>");
            var tmpvalue = $("#<%=hftmp.ClientID %>");
            if (tmpvalue == null || tmpvalue.val() == "") {
                toolBar.set_visible(false);
                tmpvalue.val("V");
            }
        })

        function NodeClientClicking(sender, args) {
            var toolBar = $find("<%=RadToolBar1.ClientID %>");
            var tree = $find("<%=RadTreeView1.ClientID%>");
            var node = tree.get_selectedNode();
            var sel = node.get_value();
            if (sel !== "InnerClass" && sel != "OuterClass")
                toolBar.set_visible(true);
        }
    </script>
    <asp:HiddenField runat="server" ID="hftmp" ></asp:HiddenField>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td valign="top" style="width: 380px">
                        <%--<asp:Panel ID="Panel2" runat="server" Height="520px" ScrollBars="Both">--%>
                        <telerik:RadTreeView ID="RadTreeView1"  Runat="server" Height="650px" meta:resourcekey="UltraWebTree1Resource1"
                            onnodeclick="RadTreeView1_NodeClick" OnClientNodeClicking="NodeClientClicking" >
                            <Nodes>
                                <telerik:RadTreeNode Value="InnerClass" Enabled="false"></telerik:RadTreeNode>
                                <telerik:RadTreeNode Value="OuterClass" Enabled="false"></telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeView>
                        <%--</asp:Panel>--%>
                    </td>
                    <td style="width: 5px">
                    </td>
                    <td valign="top">

                        <telerik:RadToolBar ID="RadToolBar1" runat="server" OnButtonClick="RadToolBar1_ButtonClick"  Width="100%"  OnClientButtonClicking="RadToolBar1_ButtonClicking">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Text="儲存" DisabledImageUrl="~/Common/Images/Icon/icon_m66.png"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m66.png" ImageUrl="~/Common/Images/Icon/icon_m66.png"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m66.png" Value="Save" meta:resourcekey="TBarButtonResource1" Width="100%">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server"  IsSeparator="true" >
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="HadSave">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSaveMsg" runat="server" Text="已儲存" ForeColor="Blue" Visible="false" meta:resourcekey="lblSaveMsgResource1"></asp:Label>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="無權限維護" Display="Dynamic"
                            meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                        <br />
                        <asp:CustomValidator ID="chCheckClassHasExamine" runat="server" Display="Dynamic" ErrorMessage=""></asp:CustomValidator>
                        <asp:Label ID="lblCheckClassHasExamineMsg" runat="server" Text="以下類別內尚有審核中的公告，請設定審核者進行審核:<br />{0}" Visible="false" meta:resourcekey="lblCheckClassHasExamineMsgResource1"></asp:Label>
                        <asp:Label ID="lblNeedExamineClassName" runat="server" Text="" Visible="false"></asp:Label>
                        <div id="divUC_ChoiceList1">
                            <fieldset style="padding: 2; width: 100%; height: 300px;">
                                <legend>
                                    <asp:Label ID="Label1" runat="server" Text="設定公告發佈者" meta:resourcekey="Label1Resource1"></asp:Label></legend>
                                <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" TreeHeight="130px" />
                            </fieldset>
                            <br />
                            <fieldset style="padding: 2; width: 100%; height: 300px;" id="classExamineSet" runat="server">
                                <legend>
                                    <asp:Label ID="Label2" runat="server" Text="設定公告審核者" meta:resourcekey="Label2Resource1"></asp:Label></legend>
                                <asp:CheckBox ID="chbWithChild" runat="server" Text="同步修改子類別下的公告審核設定" AutoPostBack="True"
                                    meta:resourcekey="chbWithChildResource1" OnCheckedChanged="chbWithChild_CheckedChanged" />
                                <br />
                                <asp:CheckBox ID="chbExamine" runat="server" Text="公告發佈之前必須經過審核" AutoPostBack="True"
                                    OnCheckedChanged="chbExamine_CheckedChanged" meta:resourcekey="chbExamineResource1" />
                                <asp:Label ID="Label4" runat="server" Text="(任一審核人員通過即發佈)" meta:resourcekey="Label4Resource1"></asp:Label>
                                <br />
                                <asp:CustomValidator ID="cvCheckExamine" runat="server" Display="Dynamic" ErrorMessage="請選取審核人員" ForeColor="Red"
                                    meta:resourcekey="cvCheckExamineResource1"></asp:CustomValidator>
                                <br />
                                <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1">
                                    <uc1:UC_ChoiceList ID="UC_ChoiceListExamine" runat="server" TreeHeight="120px" ExpandToUser="false" />
                                </asp:Panel>
                            </fieldset>
                        </div>
                    </td>
                    <td style="width: 5px">
                    </td>
                </tr>
            </table>
            <table style="height: 10px" width="100%">
                <tr>
                    <td>
                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Common/Images/Icon/icon_m47.png"
                            meta:resourcekey="Image3Resource1" />
                        <asp:Label ID="Label5" runat="server" Text="不需審核" meta:resourcekey="Label5Resource1"></asp:Label>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_m75.png"
                            meta:resourcekey="Image1Resource1" Height="16px" />
                        <asp:Label ID="Label3" runat="server" Text="審核" meta:resourcekey="Label3Resource1"></asp:Label>
                        <asp:Label ID="lblMsgException" runat="server" Text="注意:勾選此設定會同步修改子類別下的公告審核設定" Visible="false"
                            meta:resourcekey="lblMsgExceptionResource1"></asp:Label>
                        <asp:HiddenField ID="hidIsEdit" runat="server" Value="N" />
                        <asp:HiddenField ID="hidSyncUpdate" runat="server" Value="N" />
                        <asp:Label ID="msgInnerClass" runat="server" Text="內部公告" Visible="False" meta:resourcekey="msgInnerClassResource1"></asp:Label>
                        <asp:Label ID="msgOuterClass" runat="server" Text="外部公告" Visible="False" meta:resourcekey="msgOuterClassResource1"></asp:Label>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
