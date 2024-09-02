<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Calendar_Common_UC_SchClass" Codebehind="UC_SchClass.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<script id="SchClassjs" type="text/javascript">

    <%--    function RadToolBar1_SchClass_ButtonClicking(sender, args) {

        var Key = args.get_item().get_value();
        if (Key == 'ClassManagement') {
            args.set_cancel(true);

            var owner = $("#<%=hideOwnerGUID.ClientID %>").val();
	        var type = $("#<%=hideSchType.ClientID %>").val();
	        
	        $uof.dialog.open2("~/EIP/Calendar/Common/ScheduleClass.aspx", args.get_item(), "", 500, 400, openDialogResult, { "Owner": owner, "scheduleType": type});
	    }
    }

    function openDialogResult(returnValue) {
        return true;
    }--%>

</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>
        <telerik:RadToolBar ID="RadToolBarSchClass" runat="server"
            Width="100%" OnButtonClick="RadToolBarSchClass_ButtonClick">
            <Items>
                <telerik:RadToolBarButton runat="server" Value="ClassManagement" Text="歸檔類別維護" HoveredImageUrl="~/Common/Images/Icon/icon_m01.png"
                    ImageUrl="~/Common/Images/Icon/icon_m01.png" CheckedImageUrl="~/Common/Images/Icon/icon_m01.png"
                    meta:resourcekey="TBarButtonResource1">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="tbCustomDdlClass">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlClass" runat="server" Width="150px" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" meta:resourcekey="ddlClassResource1"
                            OnPreRender="ddlClass_PreRender">
                        </asp:DropDownList>
                    </ItemTemplate>
                </telerik:RadToolBarButton>
            </Items>
        </telerik:RadToolBar>
        <asp:HiddenField ID="hideOwnerGUID" runat="server" />
        <asp:HiddenField ID="hideSchType" runat="server" />
        <asp:HiddenField ID="hideGridServerID" runat="server" />
        <asp:HiddenField ID="hideClassGUID" runat="server" />
        <asp:HiddenField ID="hideIsPostBack" runat="server" />
        <asp:HiddenField ID="hideEditable" runat="server" />
    </contenttemplate>
</asp:UpdatePanel>





<asp:Label ID="lbAll" runat="server" Text="全部(系統類別)" Visible="False" meta:resourcekey="lbAllResource1"></asp:Label>
<asp:Label ID="lbComplete" runat="server" Text="已完成(系統類別)" Visible="False" meta:resourcekey="lbCompleteResource1"></asp:Label>
<asp:Label ID="lbUnComplete" runat="server" Text="未完成(系統類別)" Visible="False" meta:resourcekey="lbUnCompleteResource1"></asp:Label>
<asp:Label ID="lbSetClass" runat="server" Text="歸檔至…" Visible="False" meta:resourcekey="lbSetClassResource1"></asp:Label>
<asp:Label ID="lbRemoveClass" runat="server" Text="從歸檔類別移除" Visible="False" meta:resourcekey="lbRemoveClassResource1"></asp:Label>
