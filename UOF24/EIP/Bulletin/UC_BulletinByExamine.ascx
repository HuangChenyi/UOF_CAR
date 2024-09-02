<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Bulletin_UC_BulletinByExamine"
    meta:resourcekey="PageResource1" Codebehind="UC_BulletinByExamine.ascx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<script type="text/javascript">

    $(function () {
        var BULLETINE_ID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["BULLID"],true)%>'); 
        var mode = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["MODE"],true)%>'); 
        var CLASS_ID = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["CLASSID"],true)%>'); 
        var isOpen = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hidIsOpen.Value,true)%>'); 
        if (BULLETINE_ID != "" && mode != "" && isOpen == "") {
            $uof.dialog.open2("~/EIP/Bulletin/ViewBulletinByExamine.aspx", args.get_item(), "", 1024, 768, dialogresult, { "BULLETINID": BULLETINE_ID, "MODE": mode, "CLASSID": CLASS_ID });
        }
    });

    function dialogresult(returnValue) {
        if (typeof (reutrnValue) != "undefined" || reutrnValue == null) {
            $("#<%=hidIsOpen.ClientID%>").val("Yes");
            __doPostBack('Button1', '');
        }
    }


    function RadToolBar1_ButtonClicking(sender, args) {

        var Key = args.get_item().get_value();


        if (Key == "Pulish") {
            if (confirm('<%=lblMsgPublish.Text %>') == false) {
                args.set_cancel(true);
            }
        }
        if (Key == "Deny") {
            if (confirm('<%=lblMsgDelete.Text %>') == false) {
                args.set_cancel(true);
            }
            else {
                args.set_cancel(true);
                var CheckedData = $uof.fastGrid.getChecked('<%= examineGrid.ClientID %>');

                if (CheckedData != "") {
                    $uof.dialog.open2("~/EIP/Bulletin/BulletinExamineComment.aspx", args.get_item(), '<%=lblTitle.Text%>', 350, 220, openDialogResult, { "KEYS": CheckedData });
                }
            }
        }
    }

    function openDialogResult(returnValue) {
        if (typeof (returnValue) == 'undefined')
            return false;
        else
            return true;
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

        <telerik:RadToolBar ID="RadToolBar1" runat="server"
            OnClientButtonClicking="RadToolBar1_ButtonClicking" Width="99%"
            OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
            <Items>
                <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m132.gif"
                    HoveredImageUrl="~/Common/Images/Icon/icon_m132.gif" ImageUrl="~/Common/Images/Icon/icon_m132.gif"
                    Value="Pulish" CheckedImageUrl="~/Common/Images/Icon/icon_m132.gif" Text="允許"
                    meta:resourcekey="TBarButtonResource1">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource1">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m141.gif"
                    HoveredImageUrl="~/Common/Images/Icon/icon_m141.gif" ImageUrl="~/Common/Images/Icon/icon_m141.gif"
                    Value="Deny" CheckedImageUrl="~/Common/Images/Icon/icon_m141.gif" Text="拒絕" meta:resourcekey="TBarButtonResource2">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource2">
                </telerik:RadToolBarButton>
            </Items>
        </telerik:RadToolBar>
        <div id="errDiv" runat="server" style="color:red"></div>
        <Fast:Grid ID="examineGrid" runat="server" AutoGenerateCheckBoxColumn="True" AllowSorting="True" DefaultSortColumnName="CREATE_DATE"
            Width="99%" AutoGenerateColumns="False" AllowPaging="True" DataKeyOnClientWithCheckBox="True"
            EnhancePager="True" PageSize="15" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False" DataKeyNames="BULLETIN_GUID,CLASS_GUID,MODE"
            OnRowDataBound="examineGrid_RowDataBound" meta:resourcekey="examineGridResource1" ShowHeader="false"
            OnPageIndexChanging="examineGrid_PageIndexChanging" OnSorting="examineGrid_Sorting" SkinID="HomepageBlockStyle"   >
            <EnhancePagerSettings
                ShowHeaderPager="False" />
            <ExportExcelSettings AllowExportToExcel="False" />
            <Columns>
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Bind("TOPIC") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnTopIC" runat="server" Text='<%#: Bind("TOPIC") %>' meta:resourcekey="lbtnTopICResource1"
                            OnClick="lbtnTopIC_Click"></asp:LinkButton>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                </asp:TemplateField>
            </Columns>
        </Fast:Grid>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:Label ID="lblMsgPulish" runat="server" Text="已發佈" Visible="False" meta:resourcekey="lblMsgPulishResource1"></asp:Label>
<asp:Label ID="lblMsgProcess" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblMsgProcessResource1"></asp:Label>
<asp:Label ID="lblMsgDeny" runat="server" Text="發佈拒絕" Visible="False" meta:resourcekey="lblMsgDenyResource1"></asp:Label>
<asp:Label ID="lblMsgDelete" runat="server" Text="確定要拒絕發佈?" Visible="False" meta:resourcekey="lblMsgDeleteResource1"></asp:Label>
<asp:Label ID="lblMsgPublish" runat="server" Text="確定要允許發佈?" Visible="False" meta:resourcekey="lblMsgPublishResource1"></asp:Label>
<asp:Label ID="lblTitle" runat="server" Text="拒絕發佈意見填寫" Visible="False" meta:resourcekey="lblTitleResource1"></asp:Label>
<asp:Label ID="lblViewBullTitle" runat="server" Text="審核公告" Visible="False" meta:resourcekey="lblViewBullTitleResource1"></asp:Label>
<asp:HiddenField ID="hidIsOpen" runat="server" />
<asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" Style="display: none" meta:resourcekey="Button1Resource1" />
<asp:Label ID="lblMsgPublishing" runat="server" Text="未發佈" Visible="False" meta:resourcekey="lblMsgPublishingResource1"></asp:Label>
<asp:Label ID="lblHasAudit" runat="server" Text="下列公告已被審核，無法再次進行審核:" Visible="False" meta:resourcekey="lblHasAuditResource1"></asp:Label>
<asp:HiddenField ID="hfCurrentUser" runat="server" />


