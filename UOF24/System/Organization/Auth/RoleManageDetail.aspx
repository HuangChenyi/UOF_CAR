<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="RoleManageDetail.aspx.cs" Inherits="System_Organization_Auth_RoleManageDetail" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content runat="server" ID="ContentID" ContentPlaceHolderID="ContentPlaceHolder1" >
    <asp:UpdatePanel runat="server" ID="UpdatePanelID">
        <ContentTemplate>
            <table class="PopTable">
                <tr>
                    <td><asp:Label ID="lblGroupTitle" runat="server" Text="部門" meta:resourcekey="lblGroupTitleResource1" ></asp:Label></td>
                    <td><asp:Label ID="lblGroup" runat="server" meta:resourcekey="lblGroupResource1"  ></asp:Label></td>
                    <td><asp:Label ID="lblNameTitle" runat="server" Text="姓名" meta:resourcekey="lblNameTitleResource1"></asp:Label></td>
                    <td><asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1" ></asp:Label></td>
                </tr>
            <tr>
                    <td><asp:Label ID="lblModuleTitle" runat="server" Text="模組" meta:resourcekey="lblModuleTitleResource1" ></asp:Label></td>
                    <td><asp:Label ID="lblModule" runat="server" meta:resourcekey="lblModuleResource1"  ></asp:Label></td>
                    <td><asp:Label ID="lblRoleTitle" runat="server" Text="角色" meta:resourcekey="lblRoleTitleResource1"></asp:Label></td>
                    <td><asp:Label ID="lblRole" runat="server" meta:resourcekey="lblRoleResource1" ></asp:Label></td>
                </tr>                 
            </table>           
            <table>
                <tr style="height:50px">                    
                    <td style="padding:13px 0px 10px 17px">
                        <asp:Image ID="imgRemarkIcon"  runat="server" ImageUrl="../../../Common/Images/Icon/icon_m233.png"/>
                        <asp:Label runat="server" ID="lblColon" ForeColor="Blue" Text="：" meta:resourcekey="lblColonResource1"></asp:Label>
                        <asp:Label runat="server" ID="lblRemark" ForeColor="Blue" meta:resourcekey="lblRemarkResource1"></asp:Label>
                    </td>                                  
                </tr>
                <tr>
                    <td style="padding-left:17px">
                        <telerik:RadTreeView ID="radRoleManageTree"  Runat="server" OnNodeClick="radRoleManageTree_NodeClick" EnableNodeTextHtmlEncoding="True"
                                             OnNodeExpand="radRoleManageTree_NodeExpand"  meta:resourcekey="radRoleManageTreeResource1">
                        </telerik:RadTreeView>
                    </td>
                </tr>
             </table>
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
            <asp:HiddenField ID="hfCurrentCulture" runat="server" />
            <asp:HiddenField ID="hfRoleID" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel> 
    <asp:Label ID="lblInnerClass" runat="server" Text="內部公告" Visible="False" meta:resourcekey="lblInnerClassResource1" ></asp:Label>
    <asp:Label ID="lblOuterClass" runat="server" Text="外部公告" Visible="False" meta:resourcekey="lblOuterClassResource1"></asp:Label>
    <asp:Label ID="lblAllClass" runat="server" Text="全部類別" Visible="False" meta:resourcekey="lblAllClassResource1"></asp:Label>
    <asp:Label ID="lblAlbumClass" runat="server" Text="相簿類別" Visible="False" meta:resourcekey="lblAlbumClassResource1"></asp:Label>
    <asp:Label ID="lblMovieClass" runat="server" Text="影音類別" Visible="False" meta:resourcekey="lblMovieClassResource1"></asp:Label>
    <asp:Label ID="lblForumClass" runat="server" Text="討論區列表" Visible="False" meta:resourcekey="lblForumClassResource1"></asp:Label>
    <asp:Label ID="lblDMSRoot" runat="server" Text="文件庫" Visible="False" meta:resourcekey="lblDMSRootResource1" ></asp:Label>
    <asp:Label ID="lblPlantClass" runat="server" Text="全部" Visible="False"></asp:Label>
    <asp:Label ID="lblFormCategory" runat="server" Text="表單類別" Visible="False" meta:resourcekey="lblFormCategoryResource1" ></asp:Label>
    <asp:Label ID="lblFlowCategory" runat="server" Text="副流程類別" Visible="False" meta:resourcekey="lblFlowCategoryResource1"></asp:Label>

    <asp:Label ID="lblBulletinRemark" runat="server" Text="表示此人員沒有該公告類別的權限" Visible="False" meta:resourcekey="lblBulletinRemarkResource1"></asp:Label>
    <asp:Label ID="lblQUERemark" runat="server" Text="表示此人員沒有該問卷類別的權限" Visible="False" meta:resourcekey="lblQUERemarkResource1"></asp:Label>
    <asp:Label ID="lblAlbumRemark" runat="server" Text="表示此人員沒有該相簿類別的權限" Visible="False" meta:resourcekey="lblAlbumRemarkResource1"></asp:Label>
    <asp:Label ID="lblMovieRemark" runat="server" Text="表示此人員沒有該影音類別的權限" Visible="False" meta:resourcekey="lblMovieRemarkResource1"></asp:Label>
    <asp:Label ID="lblWKFRemark" runat="server" Text="表示此人員沒有該表單類別的權限"  Visible="False" meta:resourcekey="lblWKFRemarkResource1"></asp:Label>
    <asp:Label ID="lblForumRemark" runat="server" Text="表示此人員沒有該討論區(版)的權限" Visible="False" meta:resourcekey="lblForumRemarkResource1"></asp:Label>
    <asp:Label ID="lblDutyRemark" runat="server" Text="表示此人員沒有該結算類別的權限" Visible="False" meta:resourcekey="lblDutyRemarkResource1"></asp:Label>
    <asp:Label ID="lblDepartmentRemark" runat="server" Text="表示此人員沒有該部門的權限" Visible="False" meta:resourcekey="lblDepartmentRemarkResource1"></asp:Label>
    <asp:Label ID="lblDMSRemark" runat="server" Text="表示此人員沒有該目錄的權限" Visible="False" meta:resourcekey="lblDMSRemarkResource1"></asp:Label>
    <asp:Label ID="lblPlantRemark" runat="server" Text="表示此人員沒有該設備的權限" Visible="False"></asp:Label>
</asp:Content>