<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Forum_AreaBoardMasterSetting" Title="設定區板主" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="AreaBoardMasterSetting.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width = "100%">
  <tr>
    <td  style="width:50%;vertical-align:top">
        <telerik:RadTreeView ID="RadTreeView1" EnableNodeTextHtmlEncoding="true" runat="server" onnodeclick="RadTreeView1_NodeClick" Height="100%" Width="100%">
        </telerik:RadTreeView>
    </td>
    <td  style="width:50%;vertical-align:top">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="無權限維護" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="請先新增討論區或選取節點" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
          <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" />
        </ContentTemplate> 
       <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadTreeView1" EventName="NodeClick"/>
       </Triggers> 
        </asp:UpdatePanel></td>
    </tr>
</table>
</asp:Content>

