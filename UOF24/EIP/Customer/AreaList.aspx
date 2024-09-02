<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Customer_AreaList" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AreaList.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function RadToolBar1ButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "btnEdit":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Customer/AreaEdit.aspx",args.get_item(), <%= lblAreaEdit.Text %>, 500, 500, OpenDialogResult, {"Mode":"Insert"});
                  
                  
                    break;
            }
        }
        function OpenDialogResult(retrunValue){
            if (typeof (retrunValue) === "undefined" || retrunValue === null) {
                return false;
            }
            else
                return true;
        }
    </script>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td valign="top" width="230px">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
                    <tr>
                        <td background="<%=themePath %>/images/tree_title.gif" style="height: 30px" width="100%">
                            <table align="center" border="0" cellpadding="0" cellspacing="0" height="23" width="95%">
                                <tr>
                                    <td width="23">
                                        <div align="center">
                                            <img src="<%=themePath %>/images/icon04.gif" width="7" height="7">
                                        </div>
                                    </td>
                                    <td class="g">
                                        <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="主檔維護列表"></asp:Label></td>
                                    <td width="3">
                                        <img src="<%=themePath %>/images/tree_line01.gif" width="3" height="23"></td>
                                    <td background="<%=themePath %>/images/tree_line02.gif" style="height: 23px"></td>
                                </tr>
                            </table>
                        </td>
                        <td rowspan="2" valign="top" background="<%=themePath %>/images/tree_line04.gif"
                            style="width: 89%">
                            <img src="<%=themePath %>/images/tree_line03.gif" width="8" height="101"></td>
                    </tr>
                    <tr>
                        <td background="<%=themePath %>/images/tree_bg.gif" height="433" valign="top" width="100%">
                            <table width="100%" border="0" align="center" cellpadding="5" cellspacing="3">
                                <tr>
                                    <td valign="top" style="height: 50px">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional"
                                            RenderMode="Inline">
                                            <contenttemplate>
                                                <telerik:RadTreeView ID="rdTree" runat="server" OnNodeClick="rdTree_NodeClick"></telerik:RadTreeView>
                                            </contenttemplate>
                                            <triggers>
                                                <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" /> 
                                           </triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <contenttemplate>
                                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="RadToolBar1ButtonClicking" >
                                        <Items>
                                            <telerik:RadToolBarButton runat="server" Text="地區別維護" Value="btnEdit"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                                ImageUrl="~/Common/Images/Icon/icon_m59.gif"
                                                meta:resourcekey="TBarButtonResource1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                                        </Items>
                                    </telerik:RadToolBar>
                                    <br />
                                    <telerik:RadTreeView ID="rdtreeArea" Runat="server" Height="430px" Width="100%" ></telerik:RadTreeView> 
                               </contenttemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hiddenDelete" runat="server" Value="沒有挑選要刪除的項目" />
    <asp:Label ID="lblCustClass" runat="server" Text="客戶類別" Visible="False" meta:resourcekey="lblCustClassResource1"></asp:Label>
    <asp:Label ID="lblGrade" runat="server" Text="客戶等級" Visible="False" meta:resourcekey="lblGradeResource1"></asp:Label>
    <asp:Label ID="lblIndustry" runat="server" Text="行業別" Visible="False" meta:resourcekey="lblIndustryResource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="基礎資料維護 – 地區別" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="lblClassEdit" runat="server" Text="修改類別" Visible="False" meta:resourcekey="lblClassEditResource1"></asp:Label>
    <asp:Label ID="lblEdit" runat="server" Text="主檔維護" Visible="False" meta:resourcekey="lblEditResource1"></asp:Label>
    <asp:Label ID="lblArea" runat="server" Text="地區別" Visible="False" meta:resourcekey="lblAreaResource1"></asp:Label>
    <asp:Label ID="lblAreaEdit" runat="server" Text="地區別維護" Visible="False" meta:resourcekey="lblAreaEditResource1"></asp:Label>
</asp:Content>

