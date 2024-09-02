<%@ Control Language="C#" AutoEventWireup="true" Inherits="Basic_Personal_PrivateMessage_UC_MessageClass" Codebehind="UC_MessageClass.ascx.cs" %>

<script type="text/javascript" id="telerikClientEvents1">
    //<![CDATA[

    function barSchClass_ButtonClicking(sender, args) {
        var value = args.get_item().get_value();
        if (value == 'ClassManagement') {
            var owner = $('#<%=hideOwnerGUID.ClientID %>').val();
            var type = $('#<%=hideSchType.ClientID %>').val();
            args.set_cancel(true);
            $uof.dialog.open2("~/Basic/Personal/PrivateMessage/MessageClass.aspx", args.get_item(), "", 500, 400, OpenDialogResult, { "Owner": owner, "scheduleType": type });
        }
    }
    function OpenDialogResult(returnValue) {
        if (typeof (returnValue) === 'undefined' || returnValue === null) {
            return false;
        }
        else
            return true;
    }
    //]]>
</script>

<telerik:RadToolBar ID="barSchClass" runat="server" OnClientButtonClicking="barSchClass_ButtonClicking" OnButtonClick="barSchClass_ButtonClick" Width="100%" meta:resourcekey="barSchClassResource2">
    <Items>
        <telerik:RadToolBarButton runat="server" Text="歸檔類別維護" Value="ClassManagement"
            ClickedImageUrl="~/Common/Images/Icon/icon_m01.png" DisabledImageUrl="~/Common/Images/Icon/icon_m01.png"
            HoveredImageUrl="~/Common/Images/Icon/icon_m01.png" ImageUrl="~/Common/Images/Icon/icon_m01.png" meta:resourcekey="RadToolBarButtonResource1">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" Value="tbCustomDdlClass" meta:resourcekey="RadToolBarButtonResource3">
            <ItemTemplate>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline">
                    <ContentTemplate>
                        <asp:DropDownList ID="ddlClass" runat="server" Width="150px" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" OnPreRender="ddlClass_PreRender"
                            meta:resourcekey="ddlClassResource1">
                        </asp:DropDownList>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="barSchClass" EventName="PreRender" />
                    </Triggers>
                </asp:UpdatePanel>
            </ItemTemplate>
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
        </telerik:RadToolBarButton>
    </Items>
</telerik:RadToolBar>
<asp:HiddenField ID="hideOwnerGUID" runat="server" />
<asp:HiddenField ID="hideSchType" runat="server" />
<asp:HiddenField ID="hidMessageType" runat="server" />
<asp:Label ID="lbAll" runat="server" Text="全部(系統類別)" Visible="False" meta:resourcekey="lbAllResource1"></asp:Label>
<asp:Label ID="lbComplete" runat="server" Text="已完成(系統類別)" Visible="False" meta:resourcekey="lbCompleteResource1"></asp:Label>
<asp:Label ID="lbUnComplete" runat="server" Text="未完成(系統類別)" Visible="False" meta:resourcekey="lbUnCompleteResource1"></asp:Label>
<asp:Label ID="lbSetClass" runat="server" Text="歸檔至…" Visible="False" meta:resourcekey="lbSetClassResource1"></asp:Label>
<asp:Label ID="lbRemoveClass" runat="server" Text="從歸檔類別移除" Visible="False" meta:resourcekey="lbRemoveClassResource1"></asp:Label>
