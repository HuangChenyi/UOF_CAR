<%@ Control Language="C#" AutoEventWireup="true" Inherits="Ede.Uof.EIP.Schedule.UI.UC_MemoList" Codebehind="UC_MemoList.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Src="UC_SchClassList.ascx" TagName="UC_SchClassList" TagPrefix="uc2" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/eip/calendar/common/uc_schclass.ascx" TagName="UC_SchClass" TagPrefix="uc1" %>

<script id="MemoListjs" type="text/javascript">
    Sys.Application.add_load(function () {
        var is_Editable = "<%=Request.QueryString["isEditable"]%>";
        var memoid_id = "<%=Request.QueryString["Memoid"]%>";
        var Owner_Guid = "<%=Request.QueryString["OwnerGuid"]%>";
        var is_Opened = $("#<%=hidIsOpened.ClientID%>");
        var UserGuid = '<%=SetUserGuid%>';
        if (is_Opened.val() !== "True") {
            is_Opened.val("True");
            if ((memoid_id != "") & (Owner_Guid != "")) {

                //避免訊息連結被他人取得, 直接進入備頁
                if (UserGuid === "<%=Request.QueryString["OwnerGuid"]%>") {
                    $uof.dialog.open2("~/EIP/Calendar/ReminderDetail.aspx","","",700,600,
                        function(returnValue) {
                            if (returnValue == null) {
                                return false;
                            }
                            return true;
                        },
                        { "memoid": memoid_id, "OwnerGuid": Owner_Guid, "isEditable": is_Editable });
                } else {
                    alert($("#<%=lblNotAllowViewReminder.ClientID%>").text());
                }
            }
        }
    });
    function RadToolBar1_MemoList_ButtonClicking(sender, args) {
        var Key = args.get_item().get_value();

        if (Key == "Delete") {
            if (confirm('<%=msgDelconfirm.Text %>') == false)
                args.set_cancel(true);
        }
        else if (Key == "Create") {
            var ownerGuid = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hideUserguid.Value,true)%>');
            var date = '<%= Ede.Uof.EIP.Organization.Util.UserTime.SetZone(Ede.Uof.EIP.SystemInfo.Current.UserGUID).GetNowForUi().ToString("yyyy/MM/dd HH:mm:dd") %>';
            args.set_cancel(true);
            $uof.dialog.open2("~/EIP/Calendar/CreateReminder.aspx", args.get_item(), "", 600, 550, openDialogResult, { "OwnerGuid": ownerGuid, "Date": date });
        }
    }
    function memoRadsplitter2_clientLoaded(sender, args) {
        var radsplitter = $find("<%=memoRadsplitter2.ClientID%>");
        var leftPane = $find("<%=leftPane.ClientID%>");
        var memoRadpane = $find("<%=memoRadpane2.ClientID%>");

        var width = radsplitter.get_width();
        if (leftPane == null) {
            radsplitter.set_width(1);
            radsplitter.set_width(width);

        }
        else {
            if (memoRadpane.get_width() == width)
                memoRadpane.set_width(width - leftPane.get_width() - 6);
        }
    }

    function openDialogResult(returnValue) {
        if (typeof (returnValue) == 'undefined' || returnValue == null)
            return false;
        else {
            return true;
        }
    }
</script>
<style>
    body {
        overflow: hidden;
    }
</style>


<telerik:RadSplitter ID="memoRadsplitter1" runat="server" Orientation="Horizontal"
    PanesBorderSize="0" Height="100%"
    BorderSize="0" LiveResize="True" ResizeWithParentPane="True"
    ResizeWithBrowserWindow="True">
    
            <telerik:RadPane ID="memoToolbarPane" runat="server" Height="35" Scrolling="None" Locked="true">
                <table style="width:100%">
                    <tr>
                        <td style="width:5%"><uc1:UC_SchClass ID="UC_SchClass_Memo" runat="server" /></td>
                        <td>
                            <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="RadToolBar1_MemoList_ButtonClicking" Width="100%"
                                    OnButtonClick="RadToolBar1_ButtonClick">
                                <Items>
                                    <telerik:RadToolBarButton runat="server" Value="Create" Text="新增備忘" DisabledImageUrl="~/Common/Images/Icon/icon_m67.png"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m67.png" ImageUrl="~/Common/Images/Icon/icon_m67.png"
                                        CheckedImageUrl="~/Common/Images/Icon/icon_m67.png" meta:resourcekey="TBarButtonResource1">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                        Value="Delete" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" Text="刪除"
                                        meta:resourcekey="TBarButtonResource2">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2">
                                    </telerik:RadToolBarButton>
                                </Items>
                            </telerik:RadToolBar>
                        </td>
                    </tr>
                </table>
                
            </telerik:RadPane>
            <telerik:RadPane ID="memoRadpane12" runat="server" Scrolling="none" Height="100%">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
                <telerik:RadSplitter ID="memoRadsplitter2" runat="server" Height="100%" LiveResize="True" OnClientLoaded="memoRadsplitter2_clientLoaded">

                    <telerik:RadPane ID="leftPane" runat="server" Width="15%" Height="100%">
                        <div class="LeftPaneBackground">
                            <telerik:RadSplitter ID="Radsplitter3" runat="server" Width="100%" Height="100%" Orientation="Horizontal"
                                BorderSize="0" PanesBorderSize="0" LiveResize="True" ResizeWithParentPane="True"
                                ResizeWithBrowserWindow="True">
                                <telerik:RadPane ID="leftDownPane" runat="server" Height="100%">

                                    <uc2:UC_SchClassList ID="UC_SchClassList1" runat="server" UpdateMode="conditional" />

                                </telerik:RadPane>
                            </telerik:RadSplitter>
                        </div>
                    </telerik:RadPane>
                    <telerik:RadSplitBar ID="RadSplitbar1" runat="server" CollapseMode="Forward">
                    </telerik:RadSplitBar>
                    <telerik:RadPane ID="memoRadpane2" runat="server">
                        <telerik:RadSplitter ID="memoRadsplitter4" runat="server" Orientation="Horizontal" PanesBorderSize="0" Height="100%"
                            BorderSize="0" LiveResize="True" ResizeWithParentPane="True" ResizeWithBrowserWindow="True">                          
                            <telerik:RadPane ID="memoRadpane5" runat="server" Height="100%">

                                <Fast:Grid ID="MemoGrid" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                    AutoGenerateColumns="False" DataKeyNames="MEMO_GUID" Width="100%" AllowPaging="True"
                                    DataSourceID="ObjectDataSource1" OnRowDataBound="Grid1_RowDataBound" DataKeyOnClientWithCheckBox="False">
                                    <Columns>
                                        <asp:TemplateField HeaderText="主旨" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="LinkButton1" Text='<%#: Eval("SUBJECT") %>' meta:resourceKey="LinkButton1Resource1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="開始時間" SortExpression="START_TIME" meta:resourcekey="BoundFieldResource1">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStartTime" runat="server" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="false" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="結束時間" SortExpression="END_TIME" meta:resourcekey="BoundFieldResource2">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEndTime" runat="server" ></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="false" />
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetNoClassMemorandum"
                                    TypeName="Ede.Uof.EIP.Schedule.Memorandum.MemorandumManagementUCO">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="hideUserguid" Name="userGUID" PropertyName="Value"
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
                                <asp:HiddenField ID="hideUserguid" runat="server" />
                                <asp:HiddenField ID="hidIsOpened" runat="server" />
                                <asp:Label ID="lblNotAllowViewReminder" runat="server" Text="備忘的擁有者與登入者不一致,不允許觀看" Style="display:none;" meta:resourcekey="lblNotAllowViewReminderResource1"></asp:Label>
                            </telerik:RadPane>

                        </telerik:RadSplitter>

                    </telerik:RadPane>
                </telerik:RadSplitter>
             </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="UC_SchClass_Memo" EventName="BarClassButtonClick" />
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
            <asp:AsyncPostBackTrigger ControlID="UC_SchClassList1" EventName="NodeOnClick" />
            <asp:AsyncPostBackTrigger ControlID="UC_SchClass_Memo" EventName="SelectedOnChanged" />
        </Triggers>
    </asp:UpdatePanel>
            </telerik:RadPane>
       
</telerik:RadSplitter>
