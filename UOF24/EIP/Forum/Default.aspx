<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Forum_Default" Title="討論區" Culture="auto"  UICulture="auto" meta:resourcekey="PageResource1" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register Src="UC_SearchResultList.ascx" TagName="UC_SearchResultList" TagPrefix="uc1" %>
<%@ Register Src="UC_MySubscribe.ascx" TagName="UC_MySubscribe" TagPrefix="uc2" %>
<%@ Register Src="UC_MyPostList.ascx" TagName="UC_MyPostList" TagPrefix="uc3" %>
<%@ Register Src="UC_MyRelyList.ascx" TagName="UC_MyRelyList" TagPrefix="uc4" %>
<%@ Register assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="System.Web.UI" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<script id="telerikscript" type="text/javascript"> 
    function radToolBarClicking(sender, args) {
        var key = args.get_item().get_value();
        var text = args.get_item().get_text();
        switch (key) {
            case "Search":               
                var result = $uof.pageMethod.sync("TornadoSearchEnabled",[]);
                if (result == 'false') {
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Forum/AdvanceSearch.aspx", args.get_item(), "", 700, 650, OpenDialogResult);
                }               
            break;
            case "ReturnForum":
                return;
            break;
            default :
                ClearSiteMapNode();
                AddSiteMapNode(text);
            break;
        }
    }

    function OpenDialogResult(returnValue) {
        if (typeof (returnValue) == 'undefined') {            
            return false;
        }
        else {
            ClearSiteMapNode();
            AddSiteMapNode('<%=UC_SearchResultList1.Title %>');
            return true;
        }
    }
</script>
   
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr><td>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_OnButtonClick" OnClientButtonClicking="radToolBarClicking">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="我訂閱的文章" Value="Subscribe"
                                CheckedImageUrl="~/Common/Images/Icon/icon_s06.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_s06.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_s06.gif"
                                ImageUrl="~/Common/Images/Icon/icon_s06.gif"
                                meta:resourcekey="RadToolBarSubscribeResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="我發表過的" Value="MyPost"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m68.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m68.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m68.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m68.gif"
                                meta:resourcekey="RadToolBarMyPostResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="我參與的" Value="MyRely"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m69.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m69.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m69.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m69.gif"
                                meta:resourcekey="RadToolBarMyRelyResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="進階搜尋" Value="Search"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                meta:resourcekey="RadToolBarSearchResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="返回討論區" Value="ReturnForum"
                                CheckedImageUrl="~/Common/Images/Icon/icon_m62.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m62.gif"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m62.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m62.gif"
                                meta:resourcekey="RadToolBarReturnForumResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                </ContentTemplate> 
                </asp:UpdatePanel>
            </td>
            </tr>
            <tr>
                <td class="SizeMemo">
                     <asp:Image ID="Image2" runat="server" ImageUrl="~/EIP/Forum/image/imgAgent.gif" />
                     <asp:Label ID="lblImageAgentMsg" runat="server" Text="表示管理者已幫您代理訂閱該討論版，取消個人訂閱仍然會收到通知" meta:resourcekey="lblImageAgentMsgResource1" ForeColor="Blue"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                    <asp:DataList ID="DataList2" runat="server" OnItemDataBound="DataList2_ItemDataBound"
                        Width="100%" DataKeyField="AREA_GUID" DataSourceID="ObjectDataSource1" meta:resourcekey="DataList2Resource1" >
                        <ItemTemplate>
                            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="table2">
                                <tr>
                                    <td  class="td2" style="height: 23px; width:100%; background-image:url('<%=themePath %>/images/headerbg.gif')">
                                        <asp:Label ID="Label1" runat="server" class="j" Text='<%#: Eval("AREA_NAME") %>' meta:resourcekey="Label1Resource1" ></asp:Label>&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td  style="width: 100%">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                        <asp:DataList ID="DataList1" runat="server" Width="100%" RepeatColumns="1" RepeatDirection="Horizontal"
                                            OnItemDataBound="DataList1_ItemDataBound" DataKeyField="BOARD_GUID" HorizontalAlign="Left" meta:resourcekey="DataList1Resource1" OnItemCommand="DataList1_ItemCommand" >
                                            <ItemTemplate>
                                                <table width="100%" cellspacing="0" cellpadding="0" border="0" style="table-layout:fixed">
                                                    <tr>
                                                        <td width="5%" bgcolor="#f7f7f7" align="center" class="td2">
                                                            <asp:Image ID="Image1" ImageUrl="~/Common/Images/Icon/red_forum.png" runat="server" Height="39px" Width="31px" meta:resourcekey="Image1Resource1"  />
                                                        </td>
                                                        <td  class="td2" style="width: 50%">
                                                            <asp:HyperLink ID="HyperLink1" runat="server" meta:resourcekey="HyperLink1Resource1" ></asp:HyperLink>&nbsp;<asp:Label ID="lblanonymous" runat="server" ForeColor="Red"></asp:Label>  <br />
                                                            <asp:Label ID="lblMSG" runat="server" meta:resourcekey="lblMSGResource1" ></asp:Label></td>
                                                        <td class="td2" style="background-color:#f7f7f7; text-align:center; width:5%"><asp:Label ID="lblTopicCount" runat="server" Text="主題數" meta:resourcekey="lblTopicCountResource1" ></asp:Label></td>
                                                        <td class="td2" style="text-align:center; width:10%"><asp:Label ID="lblLastUser" runat="server" meta:resourcekey="lblLastUserResource1"   ></asp:Label></td>
                                                        <td class="td2" style="background-color:#f7f7f7; width:10%; text-align:center"><asp:Label ID="lblLastTime" runat="server" Text='<%#: Eval("LAST_REPLY_DATE") %>' meta:resourcekey="lblLastTimeResource1" ></asp:Label></td>
                                                        <td class="td2" style="width:13%; text-align:center"><asp:Label ID="lblMaster" runat="server" Text="版主" meta:resourcekey="lblMasterResource1" ></asp:Label></td>
                                                        <td class="td2" style="width:7%; text-align:center">
                                                            <asp:LinkButton ID="lbtSubscribe" runat="server" CommandName="Subscribe" 
                                                                meta:resourcekey="lbtSubscribeResource1" Text="訂閱"></asp:LinkButton>
                                                            <asp:LinkButton ID="lbtCancelSubscribe" runat="server" 
                                                                CommandName="CancelSubscribe" meta:resourcekey="lbtCancelSubscribeResource1" 
                                                                Text="取消訂閱"></asp:LinkButton>
                                                            <asp:Image ID="imgAgent" runat="server" ImageUrl="~/EIP/Forum/image/imgAgent.gif" ToolTip="強制訂閱" meta:resourcekey="imgAgentResource1" />
                                                       </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                    <tr>
                                                        <td style="width:5%; background-image:url('<%=themePath %>/images/catbg.gif')" class="td2">
                                                            </td>
                                                        <td style="text-align:center; background-image:url('<%=themePath %>/images/catbg.gif'); width:50%" class="td2">
                                                            <asp:Label ID="Label4" runat="server" Text="討論版" meta:resourcekey="Label4Resource1" ></asp:Label></td>
                                                        <td style="text-align:center; background-image:url('<%=themePath %>/images/catbg.gif'); width:5%" class="td2">
                                                            <asp:Label ID="Label5" runat="server" Text="主題數" meta:resourcekey="Label5Resource1" ></asp:Label></td>
                                                        <td style="text-align:center;background-image:url('<%=themePath %>/images/catbg.gif'); width:10%" class="td2">
                                                            <asp:Label ID="Label7" runat="server" Text="最後發表者" meta:resourcekey="Label7Resource1"  ></asp:Label>
                                                        </td>
                                                        <td style="text-align:center;background-image:url('<%=themePath %>/images/catbg.gif'); width:10%" class="td2">
                                                            <asp:Label ID="Label8" runat="server" Text="最後發表時間" meta:resourcekey="Label8Resource1" ></asp:Label>
                                                        </td>
                                                        <td style="text-align:center;background-image:url('<%=themePath %>/images/catbg.gif'); width:13%" class="td2">
                                                            <asp:Label ID="Label6" runat="server" Text="版主" meta:resourcekey="Label6Resource1" ></asp:Label></td>
                                                        <td style="text-align:center;background-image:url('<%=themePath %>/images/catbg.gif'); width:7%" class="td2"></td>
                                                    </tr>
                                                </table>
                                            </HeaderTemplate>
                                        </asp:DataList>
                                           </ContentTemplate> 
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <SeparatorTemplate>
                            <br />
                        </SeparatorTemplate>
                    </asp:DataList>
                    <div id="divUserControl">
                        <uc1:UC_SearchResultList id="UC_SearchResultList1" runat="server" >
                        </uc1:UC_SearchResultList>
                       <uc2:UC_MySubscribe id="UC_MySubscribe1" runat="server">
                        </uc2:UC_MySubscribe>
                       <uc3:UC_MyPostList id="UC_MyPostList1" runat="server">
                       </uc3:UC_MyPostList>
                      <uc4:UC_MyRelyList ID="UC_MyRelyList1" runat="server">
                      </uc4:UC_MyRelyList >
                       </div> 
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick"/>
                    </Triggers>
                    </asp:UpdatePanel>
                    </td>
            </tr>
        </table>
  
    <center>
        &nbsp;<br />
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllArea" TypeName="Ede.Uof.EIP.Forum.ReadArticleUCO">
            <SelectParameters>
                <asp:ControlParameter ControlID="hideGUID" Name="userGUID" PropertyName="Value" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>       
        <asp:HiddenField ID="hideGUID" runat="server"></asp:HiddenField>
        </center>
    <center>
        <asp:Label ID="msgRecruit" runat="server" Text="誠徵中"  Visible="False" meta:resourcekey="msgRecruitResource1"></asp:Label>&nbsp;</center>   
        <asp:Label ID="msgAnonymous" runat="server" Text="匿名" Visible="False" meta:resourcekey="msgAnonymousResource1"></asp:Label>
        <asp:Label ID="Label3" runat="server" Text='區版主:'  meta:resourcekey="Label3Resource1" Visible="False"></asp:Label>
</asp:Content>

