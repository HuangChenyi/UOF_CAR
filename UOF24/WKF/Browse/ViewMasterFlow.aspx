<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Browse_ViewMasterFlow" Title="" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ViewMasterFlow.aspx.cs" %>

<%@ Register Src="../FlowManagement/Layout/UC_SetMastFlow.ascx" TagName="UC_SetMastFlow"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <head>
        <style>
            .SubFlowTD {vertical-align:top; background-attachment: fixed; background-image: url("<%=themePath %>/images/wkf/line1.gif"); background-repeat: repeat-y;}
            .EmptyTable {padding:0px;border:0px;margin:0px;text-align:center}
            .SignerTD {color:blue;text-align:left}
            .SiteLeftTD {background-image: url("<%=themePath %>/images/wkf/site_left.gif"); background-repeat: repeat-y;}
            .SiteMiddleTD {background-image: url("<%=themePath %>/images/wkf/app_con.gif"); background-repeat: repeat-y;}
            .SiteRightTD {width:8px;background-image: url("<%=themePath %>/images/wkf/site_right.gif"); background-repeat: repeat-y;}
            .CondTextTD {text-align:center;font-weight:bold;}
            .CondLeftTD {background-image: url("<%=themePath %>/images/wkf/site_left_big.gif"); background-repeat: repeat-y;}
            .CondMiddleTD { background-image: url("<%=themePath %>/images/wkf/cond_con.gif");background-repeat: repeat-y;text-align:center}
            .CondRightTD {background-image: url("<%=themePath %>/images/wkf/site_rig_big.gif"); background-repeat: repeat-y;}
            td_{text-align:center;vertical-align:top;font-size:12px;width:120;}
            table_{text-align:center;border:0px}
        </style>
    </head>

<table cellpadding=0 cellspacing=0  width=100%>
    <tr>
        <td style="height: 71px; align="center">
            <table width = 100% >
                <tr>
                    <td align =center valign =top >
                        <table width= 70%>
                            <tr>
                                <td align=left nowrap=nowrap><asp:ImageButton ID="imgSiteType" runat="server" ImageUrl="site_normal.gif" ToolTip="觀看站點" meta:resourcekey="imgSiteTypeResource1" /><asp:Label ID="Label2" runat="server" Text="觀看站點資訊" meta:resourcekey="Label2Resource1"></asp:Label></td>
                                <td align=left nowrap=nowrap><asp:ImageButton ID="imgWSSetting" runat="server" ImageUrl="site_SetWS.gif" ToolTip="Web Service 設定" meta:resourcekey="imgWSSettingResource1" /><asp:Label ID="Label3" runat="server" Text="WebService設定" meta:resourcekey="Label3Resource1"></asp:Label></td>
                                <td align=left nowrap=nowrap><asp:ImageButton ID="imgsiteNote" runat="server" ImageUrl="site_noteSet.gif" ToolTip="站點備註" meta:resourcekey="imgsiteNoteResource1" /><asp:Label ID="Label4" runat="server" Text="站點備註(有備註內容)" meta:resourcekey="Label4Resource1"></asp:Label></td>
                                <td align=left nowrap=nowrap><asp:ImageButton ID="imgsiteNote1" runat="server" ImageUrl="site_noteSet1.gif" ToolTip="站點備註" meta:resourcekey="imgsiteNote1Resource1" /><asp:Label ID="Label5" runat="server" Text="站點備註(無備註內容)" meta:resourcekey="Label5Resource1"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align=left nowrap=nowrap><asp:ImageButton ID="imgsiteMail" runat="server" ImageUrl="site_Mail.gif" ToolTip="站點郵件" meta:resourcekey="imgsiteMailResource1" /><asp:Label ID="Label6" runat="server" Text="站點郵件資訊" meta:resourcekey="Label6Resource1"></asp:Label></td>
                                <td align=left nowrap=nowrap><asp:ImageButton ID="imgAllow" runat="server" ImageUrl="site_SetWS.gif" ToolTip="可結案" meta:resourcekey="imgAllowResource1" /><asp:Label ID="Label7" runat="server" Text="可結案站點" meta:resourcekey="Label7Resource1"></asp:Label></td>      
                                <td align=left nowrap=nowrap><asp:ImageButton ID="imgNo" runat="server" ImageUrl="site_SetWS.gif" ToolTip="不可結案" meta:resourcekey="imgNoResource1" /><asp:Label ID="Label8" runat="server" Text="不可結案站點" meta:resourcekey="Label8Resource1"></asp:Label></td>   
                                <td align=left nowrap=nowrap><asp:ImageButton ID="imgCondition" runat="server" ImageUrl="site_SetWS.gif" ToolTip="依條件結案" meta:resourcekey="imgConditionResource1" /><asp:Label ID="Label9" runat="server" Text="依條件結案站點" meta:resourcekey="Label9Resource1"></asp:Label></td>        
                            </tr>
                            <tr>
                                <td align="left" nowrap="nowrap">
                                    <asp:ImageButton ID="imgNoneCustomWords" runat="server" ToolTip="無自定義簽核文字" ImageUrl="~/Common/Images/Icon/icon_m205.png" Enabled="False"
                                        meta:resourceKey="imgNoneCustomWordsResource1" />
                                    <asp:Label ID="Label11" runat="server" Text="無自定義簽核文字" meta:resourceKey="Label11Resource1"></asp:Label>
                                </td>
                                <td align="left" nowrap="nowrap">
                                    <asp:ImageButton ID="imgHasCustomWords" runat="server" ToolTip="有自定義簽核文字" ImageUrl="~/Common/Images/Icon/icon_m206.png" Enabled="False"
                                        meta:resourceKey="imgHasCustomWordsResource1" />
                                    <asp:Label ID="Label12" runat="server" Text="有自定義簽核文字" meta:resourceKey="Label12Resource1"></asp:Label>
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                    </td>
               </tr>
            </table>
        </td>
    </tr>
</table>

<table  width="100%">
    <tr>
        <td align="center">
            <asp:Panel ID="Panel1"   runat="server" Width="100%" Height="500px">
                
                <uc1:UC_SetMastFlow ID="UC_SetMastFlow2" runat="server" />
                
            </asp:Panel>

        </td>
    </tr>
</table>
    <asp:HiddenField ID="hfUserGuid" runat="server" />
</asp:Content>

