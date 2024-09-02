<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="PMS_Maintain_Move" Title="搬移階段任務" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Move.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:CustomValidator ID="cvMessage" runat="server" Display="Dynamic" ForeColor="Red" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
    <script type="text/javascript">
        function taskTreeClientNodeDropping(sender, args) {
            var nSource = args.get_sourceNode();
            $('#<%=hfSourceNode.ClientID %>').val(nSource.get_value());
    }
    </script>
    <telerik:RadToolBar ID="toolBarMove" runat="server" Width="100%" OnButtonClick="toolBarMove_ButtonClick" meta:resourcekey="toolBarMoveResource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="向上" Value="btnUp"
                CheckedImageUrl="~/Common/images/Icon/increaserowspan_down.gif" DisabledImageUrl="~/Common/images/Icon/increaserowspan_down.gif"
                HoveredImageUrl="~/Common/images/Icon/increaserowspan_down.gif" ImageUrl="~/Common/images/Icon/increaserowspan_down.gif" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="向下" Value="btnDown"
                CheckedImageUrl="~/Common/images/Icon/decreaserowspan_down.gif" DisabledImageUrl="~/Common/images/Icon/decreaserowspan_down.gif"
                HoveredImageUrl="~/Common/images/Icon/decreaserowspan_down.gif" ImageUrl="~/Common/images/Icon/decreaserowspan_down.gif" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
            </telerik:RadToolBarButton>

        </Items>
    </telerik:RadToolBar>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
            <telerik:RadTreeView ID="taskTree" runat="server" AllowNodeEditing="true" EnableDragAndDrop="true" EnableNodeTextHtmlEncoding="true"
            OnClientNodeDropping="taskTreeClientNodeDropping" 
                onnodedrop="taskTree_NodeDrop" >
            </telerik:RadTreeView>
        </contenttemplate>
        <triggers>
            <asp:AsyncPostBackTrigger ControlID="toolBarMove" EventName="ButtonClick" />
        </triggers>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hidName" runat="server" />
    <asp:HiddenField ID="hidMode" runat="server" />
    <asp:HiddenField ID="hidProjGUID" runat="server" />
    <asp:HiddenField ID="hidGUID" runat="server" />
    <asp:HiddenField ID="hidSelectedNode" runat="server" />
    <asp:Label ID="lblNoAuthorityMsg" runat="server" Text="您沒有搬移該專案的權限！" Visible="False" meta:resourcekey="lblNoAuthorityMsgResource1"></asp:Label>
    <asp:Label ID="lblNotAllowedStatusMsg" runat="server" Text="該專案的狀態不能被搬移！" Visible="False" meta:resourcekey="lblNotAllowedStatusMsgResource1"></asp:Label>
    <asp:Label ID="lblDisableMSDTCMsg" runat="server" Text=" 已停用分散式交易管理員 (MSDTC) 的網路存取，<br/>請通知系統管理員修正。" Visible="False" meta:resourcekey="lblDisableMSDTCMsgResource1"></asp:Label>
    <asp:Label ID="lblMSDTCErrMsg" runat="server" Text=" 分散式交易管理員 (MSDTC) 的網路存取發生錯誤，<br/>請通知系統管理員修正。" Visible="False" meta:resourcekey="lblMSDTCErrMsgResource1"></asp:Label>
    <asp:HiddenField ID="hfSourceNode" runat="server" />

</asp:Content>

