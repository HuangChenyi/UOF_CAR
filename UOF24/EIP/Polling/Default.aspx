<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Polling_Default" Title="投票管理" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            switch (value) {
                case "AddTopicManager":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Polling/SubjectMasterSetting.aspx", args.get_item(), "", 400, 300, OpenDialogReturn);                    
                    break;
                case "NewTopic":
                    args.set_cancel(true);
                    $uof.dialog.open2("~/EIP/Polling/CreatePolling.aspx", args.get_item(), "", 700, 600, OpenDialogReturn);
                    break;
                case "delete":
                    args.set_cancel(!confirm('<%=msgDelconfirm.Text %>'));
                    break;
            }
        }

        function OpenDialogReturn(returnValue){
            if (typeof(returnValue) == "undefine")
                return false;
            else
                return true;            
        }
    </script>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <contenttemplate>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1" BackColor="Red" ForeColor="White" />
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" ForeColor="Red" ErrorMessage="無刪除投票議題的權限" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                    </contenttemplate>
                    <triggers>
                        <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                    </triggers>
                </asp:UpdatePanel></td>
        </tr>
        <tr>
            <td>
                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" OnClientButtonClicking="RadToolBar1_ButtonClicking">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Text="議題管理員設定" Value="AddTopicManager"
                            ClickedImageUrl="~/Common/Images/Icon/icon_m52.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m52.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m52.gif" ImageUrl="~/Common/Images/Icon/icon_m52.gif" meta:resourcekey="RadToolBarButtonResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="新增" Value="NewTopic"
                            ClickedImageUrl="~/Common/Images/Icon/icon_m55.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m55.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m55.gif" ImageUrl="~/Common/Images/Icon/icon_m55.gif" meta:resourcekey="RadToolBarButtonResource3">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="刪除" Value="delete"
                            ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource5">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource6">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="全部" Value="all"
                            ClickedImageUrl="~/Common/Images/Icon/icon_m56.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m56.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m56.gif" ImageUrl="~/Common/Images/Icon/icon_m56.gif" meta:resourcekey="RadToolBarButtonResource7">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource8">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="記名投票" Value="reg"
                            ClickedImageUrl="~/Common/Images/Icon/icon_m51.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m51.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m51.gif" ImageUrl="~/Common/Images/Icon/icon_m51.gif" meta:resourcekey="RadToolBarButtonResource9">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource10">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="不記名投票" Value="unreg"
                            ClickedImageUrl="~/Common/Images/Icon/icon_m53.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m53.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m53.gif" ImageUrl="~/Common/Images/Icon/icon_m53.gif" meta:resourcekey="RadToolBarButtonResource11">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource12">
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <contenttemplate>
                <fast:grid id="gridList" runat="server" allowsorting="True" autogeneratecheckboxcolumn="True"
                    autogeneratecolumns="False"   DataKeyNames="TOPIC_GUID" OnRowDataBound="Grid1_RowDataBound" DataSourceID="ObjectDataSource1" AllowPaging="True" OnRowCommand="gridList_RowCommand" Width="100%"  DataKeyOnClientWithCheckBox="False" EnhancePager="True" PageSize="15"  DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False" meta:resourcekey="gridListResource2">
                    <EnhancePagerSettings
                        ShowHeaderPager="True" />
                    <exportexcelsettings allowexporttoexcel="False" />
                    <Columns>
<asp:TemplateField HeaderText="議題內容" SortExpression="TOPIC" meta:resourcekey="TemplateFieldResource1">
<ItemTemplate>
<asp:LinkButton runat="server" ID="LinkButton1" Text='<%# Eval("TOPIC") %>' CommandName="modify" meta:resourceKey="LinkButton1Resource1"></asp:LinkButton>

 
</ItemTemplate>
<HeaderStyle Wrap="false"/>
</asp:TemplateField>
                        <asp:BoundField DataField="IS_REGISTERED" HeaderText="記名投票" 
                            SortExpression="IS_REGISTERED" meta:resourcekey="BoundFieldResource1" >
                        <HeaderStyle Wrap="False" />
                        </asp:BoundField>
<asp:BoundField DataField="POST_END_TIME" HeaderText="下架時間" SortExpression="POST_END_TIME" meta:resourcekey="BoundFieldResource2">
                        <HeaderStyle Wrap="False" />
                        </asp:BoundField>
<asp:BoundField DataField="OBJECT_USER_COUNT" HeaderText="應投票人數" SortExpression="OBJECT_USER_COUNT" meta:resourcekey="BoundFieldResource3">
                        <HeaderStyle Wrap="False" />
                        </asp:BoundField>
<asp:BoundField DataField="POLLED_USER_COUNT" HeaderText="已投票人數" SortExpression="POLLED_USER_COUNT" meta:resourcekey="BoundFieldResource4">
                        <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="發起人" meta:resourcekey="TemplateFieldResource4">
                            <itemtemplate>
<asp:Label runat="server" id="lblAnnouncer" meta:resourcekey="lblAnnouncerResource1"></asp:Label>
</itemtemplate>
<HeaderStyle Wrap="false"/>
                        </asp:TemplateField>
<asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource2">
<ItemTemplate>
<asp:LinkButton runat="server" ID="btnViewResult" Text="投票結果" meta:resourceKey="btnViewResultResource1"></asp:LinkButton>


</ItemTemplate>
<HeaderStyle Wrap="false"/>
<ItemStyle Wrap="false"/>
</asp:TemplateField>
<asp:BoundField DataField="TOPIC_GUID" HeaderText="TOPIC_GUID" ReadOnly="True" SortExpression="TOPIC_GUID"
                            Visible="False" meta:resourcekey="BoundFieldResource5" />
</Columns>
</fast:grid>
    <asp:Label ID="lbUserId" runat="server" Visible="False" meta:resourcekey="lbUserIdResource1"></asp:Label>
                    </contenttemplate>
                    <triggers>
                        <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                    </triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:Label ID="lbReg" runat="server" Text="記名" Visible="False" meta:resourcekey="lbRegResource1"></asp:Label>
    <asp:Label ID="lbUnReg" runat="server" Text="不記名" Visible="False" meta:resourcekey="lbUnRegResource1"></asp:Label>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetAllTopic" TypeName="Ede.Uof.EIP.Polling.MasterReadUCO">
        <selectparameters>
            <asp:ControlParameter ControlID="lbUserId" Name="userGUID" PropertyName="Text" Type="String" />
        </selectparameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetRegisteredTopic" TypeName="Ede.Uof.EIP.Polling.MasterReadUCO">
        <selectparameters>
            <asp:ControlParameter ControlID="lbUserId" Name="userGUID" PropertyName="Text" Type="String" />
        </selectparameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetUnRegisteredTopic" TypeName="Ede.Uof.EIP.Polling.MasterReadUCO">
        <selectparameters>
            <asp:ControlParameter ControlID="lbUserId" Name="userGUID" PropertyName="Text" Type="String" />
        </selectparameters>
    </asp:ObjectDataSource>
    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
    <asp:Label ID="msgNotdelete" runat="server" Text="使用者已投票,不可刪除" Visible="False" meta:resourcekey="msgNotdeleteResource1"></asp:Label>
</asp:Content>

