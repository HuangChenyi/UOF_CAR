<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="PMS_Query_QueryProject" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QueryProject.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Src="../Common/UC_SearchProject.ascx" TagName="UC_SearchProject" TagPrefix="uc5" %>
<%@ Register Src="../Common/UC_ProjectStatusDDL.ascx" TagName="UC_ProjectStatusDDL" TagPrefix="uc4" %>
   
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script id="defaultjs" type="text/javascript">
        Sys.Application.add_load(function () {
            //目的:訊息中link 連結網頁後所欲開啟的dialog
            var strProjGUID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["strProjGUID"],true)%>');
            var param = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hfOpenDialogParam.Value,true)%>');
            if (strProjGUID != "" && (param == 'True')) {
                $("#<%=hfOpenDialogParam.ClientID%>").val('False');
                $uof.dialog.open2("~/PMS/Query/ViewProject.aspx", '', '', 1024, 768, function (returnValue) { return false; }, { "strProjGUID": strProjGUID });
            }
        });
    </script>
<table style="width: 100%;">
    <tr>
        <td>
            <telerik:RadToolBar ID="barProjQuery" runat="server" Width="100%" OnButtonClick="barProjQuery_ButtonClick" meta:resourcekey="barProjQueryResource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="proStatus" meta:resourcekey="RadToolBarButtonResource1">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="專案狀態：" meta:resourcekey="Label1Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        <uc4:UC_ProjectStatusDDL ID="UC_ProjectStatusDDL1" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="proName" meta:resourcekey="RadToolBarButtonResource3">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="專案名稱：" meta:resourcekey="Label2Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtName" runat="server" meta:resourcekey="txtNameResource1"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="btnQuery" 
                         CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                         HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource5">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource6">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>          
        </td>
    </tr>
</table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
          <uc5:UC_SearchProject id="UC_SearchProject1" runat="server"></uc5:UC_SearchProject>
    </ContentTemplate> 
   <Triggers>      
        <asp:AsyncPostBackTrigger ControlID="barProjQuery" EventName="ButtonClick" />
   </Triggers> 
    </asp:UpdatePanel>        

    <asp:HiddenField ID="hfOpenDialogParam" runat="server" Value="True" />
</asp:Content>

