<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_Admin_QueryRemoteDoc" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QueryRemoteDoc.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc1" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
    <telerik:RadToolBar ID="RadToolbar1" Runat="server" Width="100%"  OnButtonClick="RadFolderToolbar1_ButtonClicked" meta:resourcekey="barMainResource1">
    <Items>
    <telerik:RadToolBarButton runat="server" Value="QUERY1">
     <ItemTemplate>
        <table id="Table1" style="width: 100%;" runat="server">
             <tr id="Tr1" runat="server">
                 <td id="Td1" runat="server">
                     <asp:Label ID="Label1" runat="server" Text="選擇集團:" meta:resourcekey="Label1Resource1"></asp:Label>
                 </td>
                 <td id="Td2" runat="server">
                     <asp:DropDownList ID="ddlSelectSite" runat="server">
                     </asp:DropDownList>
                 </td>
             </tr>
         </table>
     </ItemTemplate>
     </telerik:RadToolBarButton>
      <telerik:RadToolBarButton runat="server" Value="QUERY2">
     <ItemTemplate>
            <table id="Table2" style="width: 100%;" runat="server">
        <tr id="Tr2" runat="server">
            <td id="Td3" runat="server">
                <asp:Label ID="Label3" runat="server" Text="文件標題:" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td id="Td4" runat="server">
                <asp:TextBox ID="txtDocName" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
     </ItemTemplate>
     </telerik:RadToolBarButton>
     <telerik:RadToolBarButton runat="server" Value="QUERY3">
     <ItemTemplate>
             <table id="Table3" style="width: 100%;" runat="server">
                    <tr id="Tr3" runat="server">
                        <td id="Td5" runat="server">
                            <asp:Label ID="Label4" runat="server" Text="發佈狀態:" meta:resourcekey="Label4Resource1"></asp:Label>
                        </td>
                        <td id="Td6" runat="server">
                            <asp:DropDownList ID="ddlSendStatus" runat="server">
                            <asp:ListItem Value="" meta:resourcekey="ddlSendStatus1Resource1">全部</asp:ListItem>
                            <asp:ListItem Value="Success" meta:resourcekey="ddlSendStatus2Resource1">成功</asp:ListItem>
                            <asp:ListItem Value="Fail" meta:resourcekey="ddlSendStatus3Resource1">失敗</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
     </ItemTemplate>
     </telerik:RadToolBarButton>
     <telerik:RadToolBarButton runat="server"  CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" Value="Query" meta:resourcekey="TBarButtonResource1">
        </telerik:RadToolBarButton>
    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2" />
    <telerik:RadToolBarButton runat="server"  CheckedImageUrl="~/Common/Images/Icon/icon_m06.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m06.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m06.gif" ImageUrl="~/Common/Images/Icon/icon_m06.gif" Text="重新發佈" Value="ReSend" meta:resourcekey="TBarButtonResource2">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource2" />
    </Items>
    </telerik:RadToolBar>

        <Fast:Grid ID="remoteDocGrid" runat="server" AutoGenerateCheckBoxColumn="True" 
        AllowSorting="True" AutoGenerateColumns="False"  
        DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
        EmptyDataText="沒有資料" EnableModelValidation="True" EnhancePager="True" 
        KeepSelectedRows="False" PageSize="15"  
         
        Width="100%" onrowdatabound="remoteDocGrid_RowDataBound" 
        onpageindexchanging="remoteDocGrid_PageIndexChanging" 
        onsorting="remoteDocGrid_Sorting" AllowPaging="True" 
        DataKeyNames="DOC_ID,REMOTE_SITE,REMOTE_FOLDER_PATH" 
        meta:resourcekey="remoteDocGridResource1" >
<EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

<ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
             <Columns>
                 <asp:TemplateField HeaderText="文件標題" SortExpression="DOC_NAME" 
                     meta:resourcekey="TemplateFieldResource1">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DOC_NAME") %>' 
                             meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:LinkButton ID="lbtnRemoteDoc" runat="server" 
                             Text='<%#: Bind("DOC_NAME") %>' meta:resourcekey="lbtnRemoteDocResource1"></asp:LinkButton>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="集團" meta:resourcekey="TemplateFieldResource2">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("REMOTE_SITE") %>' 
                             meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="lblSiteUrl" runat="server" Text='<%# Bind("REMOTE_SITE") %>' 
                             meta:resourcekey="lblSiteUrlResource1"></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="來源路徑" meta:resourcekey="TemplateFieldResource3">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="lblSourcePath" runat="server" 
                             meta:resourcekey="lblSourcePathResource1"></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="異地端路徑" meta:resourcekey="TemplateFieldResource4">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox5" runat="server" 
                             Text='<%# Bind("REMOTE_FOLDER_PATH") %>' 
                             meta:resourcekey="TextBox5Resource1"></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="lblRemotePath" runat="server" 
                             Text='<%# Bind("REMOTE_FOLDER_PATH") %>' 
                             meta:resourcekey="lblRemotePathResource1"></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="發佈狀態" SortExpression="STATUS" 
                     meta:resourcekey="TemplateFieldResource5">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("STATUS") %>' 
                             meta:resourcekey="TextBox4Resource1"></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Label ID="lblSendStatus" runat="server" Text='<%# Bind("STATUS") %>' 
                             meta:resourcekey="lblSendStatusResource1"></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                <asp:TemplateField HeaderText="最後發佈時間" SortExpression="CREATE_DATE" meta:resourcekey="BoundFieldResource1" >
                     <ItemTemplate>
                         <asp:Label ID="lblCreateDate" runat="server" Text=""></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:BoundField HeaderText="發佈次數" DataField="EXE_COUNT" 
                     SortExpression="EXE_COUNT" meta:resourcekey="BoundFieldResource2" />
            </Columns>
    </Fast:Grid>
        </contenttemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblSelect" runat="server" Text="全部" Visible="False"
        meta:resourcekey="lblSelectResource1"></asp:Label>
    <asp:Label ID="lblDMSRoot" runat="server" Text="文件庫" Visible="False"
        meta:resourcekey="lblDMSRootResource1"></asp:Label>
    <asp:Label ID="lblMsgSuccess" runat="server" Text="發佈成功" Visible="False"
        meta:resourcekey="lblMsgSuccessResource1"></asp:Label>
    <asp:Label ID="lblMsgFail" runat="server" Text="發佈失敗" Visible="False"
        meta:resourcekey="lblMsgFailResource1"></asp:Label>
    <asp:Label ID="lblMsgProcess" runat="server" Text="處理中" Visible="False"
        meta:resourcekey="lblMsgProcessResource1"></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="文件異地發佈狀態歷史記錄" Visible="False"
        meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="lblAddTask" runat="server" Text="已加入動態排程，於5分鐘後發佈。" Visible="False"
        meta:resourcekey="lblAddTaskResource1"></asp:Label>
</asp:Content>