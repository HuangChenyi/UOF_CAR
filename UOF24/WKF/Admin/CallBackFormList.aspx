<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="WKF_Admin_CallBackFormList" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="CallBackFormList.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script id="CallBackFormListjs" type="text/javascript">

        //按下 node 事件
        function treeFormList_NodeClick(sender, args) {
            var node = args.get_node();

            // ======= 第一層的不動作 (表單類別) =======
            if (node.get_level() == 0) {
                args.set_cancel(true);
            }
        }

        function SendAlert() {
            alert('<%=lblMsgSend.Text %>');
        }

        function CheckStartTime(source, arguments) {
            //arguments.IsValid = false;
            arguments.IsValid = true;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" meta:resourceKey="UltraWebToolbar1Resource1" OnButtonClick="RadToolBar1_ButtonClick">
        <Items>
            <telerik:RadToolBarButton runat="server" Value="StartTime" ValidationGroup="wdcStartTime">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="開始時間：" meta:resourceKey="TBLabelResource1"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rdpStartTime" runat="server"></telerik:RadDatePicker>
                            </td>
                        </tr>
                    </table>


                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="EndTime">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="結束時間：" meta:resourceKey="TBLabelResource2"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rdpEndTime" runat="server"></telerik:RadDatePicker>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="Status">
                <ItemTemplate>
                    <asp:Label runat="server" Text="傳送狀態：" meta:resourceKey="TBLabelResource3"></asp:Label>
                    <asp:DropDownList runat="server" ID="ddlStatus" meta:resourceKey="ddlStatusResource1">
                        <asp:ListItem Text="成功" Value="success" meta:resourceKey="ListItemResource1"></asp:ListItem>
                        <asp:ListItem Text="失敗" Value="unsuccess" meta:resourceKey="ListItemResource2"></asp:ListItem>
                        <asp:ListItem Text="尚未傳送" Value="NotSend" meta:resourceKey="ListItemResource3"></asp:ListItem>
                        <asp:ListItem Text="全部" Selected="True" Value="all" meta:resourceKey="ListItemResource4"></asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg">
            </telerik:RadToolBarButton>

            <telerik:RadToolBarButton runat="server" Text="查詢"
                ImageUrl="~/Common/Images/Icon/icon_m39.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                meta:resourceKey="TBarButtonResource1" Value="btnQuery">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="重新傳送"
                ImageUrl="~/Common/Images/Icon/icon_m06.gif"
                HoveredImageUrl="~/Common/Images/Icon/icon_m06.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m06.gif"
                CheckedImageUrl="~/Common/Images/Icon/icon_m06.gif"
                meta:resourceKey="TBarButtonResource2" Value="btnSend">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadTreeView ID="treeFormList" runat="server" OnNodeClick="treeFormList_NodeClick" OnClientNodeClicking="treeFormList_NodeClick"></telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
        <tr>
            <td valign="top" width="100%" align="left">
                <table cellspacing="1" class="PopTable" width="100%">
                    <tr>
                        <td align="center" class="PopTableHeader" style="height: 21px; width: 100%">
                            <center>
                                <asp:Label ID="lblFormList" runat="server" meta:resourcekey="lblFormListResource1"
                                    Text="表單列表"></asp:Label>
                            </center>
                        </td>
                    </tr>
                </table>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0" OnTabClick="RadTabStrip1_TabClick">
                            <Tabs>
                                <telerik:RadTab runat="server" Selected="True" Text="結案回傳查詢" meta:resourcekey="endFormResource1" Value="endForm">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="退回申請者回傳查詢" meta:resourcekey="returnApplicantResource1" Value="returnApplicant">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="站點回傳查詢" meta:resourcekey="siteCallResource1" Value="siteCall">
                                </telerik:RadTab>
                            </Tabs>
                        </telerik:RadTabStrip>
                        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0">
                            <telerik:RadPageView runat="server" ID="RadPageView1">
                                <Fast:Grid ID="DGFormList" runat="server"
                                    AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                    AutoGenerateColumns="False"
                                    DataKeyNames="TASK_ID" DataKeyOnClientWithCheckBox="False"
                                    OnPageIndexChanging="DGFormList_PageIndexChanging"
                                    OnRowDataBound="DGFormList_RowDataBound" OnSorting="DGFormList_Sorting"
                                    Width="100%"
                                    EnhancePager="True" PageSize="15">
                                    <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage=""
                                        LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                                        PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass=""
                                        PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                                    <Columns>
                                        <asp:BoundField DataField="DOC_NBR" HeaderText="表單編號"
                                            meta:resourceKey="BoundFieldResource1" SortExpression="DOC_NBR">
                                            <ItemStyle HorizontalAlign="Left" Width="80px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="表單名稱"
                                            meta:resourceKey="TemplateFieldResource4">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFormname" runat="server"
                                                    meta:resourceKey="lblFormnameResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="標題" meta:resourceKey="TemplateFieldResource3">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTitle" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="60px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="申請人"
                                            meta:resourceKey="TemplateFieldResource1">
                                            <ItemStyle HorizontalAlign="Center" Width="140px" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblUser" runat="server"
                                                    meta:resourceKey="lblUserResource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="申請日期" meta:resourcekey="BoundFieldResource3">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBeginTime" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="傳送狀態"
                                            meta:resourceKey="TemplateFieldResource2">
                                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblSendStatus" runat="server"
                                                    meta:resourceKey="lblSendStatusResource1"></asp:Label>
                                                <asp:LinkButton ID="lbtnSendStatus" runat="server"
                                                    meta:resourcekey="lbtnSendStatusResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="SEND_COUNT" HeaderText="傳送次數"
                                            meta:resourceKey="BoundFieldResource2" SortExpression="SEND_COUNT">
                                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="上次傳送時間" meta:resourcekey="BoundFieldResource4">
                                            <ItemTemplate>
                                                <asp:Label ID="lblModifyDate" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Left" />
                                </Fast:Grid>
                            </telerik:RadPageView>
                            <telerik:RadPageView runat="server" ID="RadPageView2">
                                <Fast:Grid ID="DGreturnApplicant" runat="server" AllowPaging="True"
                                    AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                    AutoGenerateColumns="False"
                                    DataKeyNames="RECORD_ID" DataKeyOnClientWithCheckBox="False"
                                    Width="100%"
                                    OnPageIndexChanging="DGreturnApplicant_PageIndexChanging"
                                    OnRowDataBound="DGreturnApplicant_RowDataBound"
                                    OnSorting="DGreturnApplicant_Sorting"
                                    EnhancePager="True" PageSize="15">
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <Columns>
                                        <asp:BoundField DataField="DOC_NBR" HeaderText="表單編號"
                                            meta:resourceKey="BoundFieldResource1" SortExpression="DOC_NBR">
                                            <ItemStyle HorizontalAlign="Left" Width="80px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="表單名稱" meta:resourceKey="TemplateFieldResource4">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFormname3" runat="server"
                                                    meta:resourceKey="lblFormnameResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="標題" meta:resourceKey="TemplateFieldResource3">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTitle3" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="60px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="申請人" meta:resourceKey="TemplateFieldResource1">
                                            <ItemStyle HorizontalAlign="Center" Width="140px" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblUser3" runat="server" meta:resourceKey="lblUserResource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="申請日期" meta:resourcekey="BoundFieldResource3" SortExpression="BEGIN_TIME">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBeginTime" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="傳送狀態" meta:resourceKey="TemplateFieldResource2">
                                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblSendStatus3" runat="server"
                                                    meta:resourceKey="lblSendStatusResource1"></asp:Label>
                                                <asp:LinkButton ID="lbtnSendStatus3" runat="server"
                                                    meta:resourcekey="lbtnSendStatusResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="SEND_COUNT" HeaderText="傳送次數"
                                            meta:resourceKey="BoundFieldResource2" SortExpression="SEND_COUNT">
                                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="上次傳送時間" meta:resourcekey="BoundFieldResource4">
                                            <ItemTemplate>
                                                <asp:Label ID="lblModifyDate" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Left" />
                                </Fast:Grid>
                            </telerik:RadPageView>
                            <telerik:RadPageView runat="server" ID="RadPageView3">
                                <Fast:Grid ID="DGsiteCall" runat="server" AllowPaging="True"
                                    AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                    AutoGenerateColumns="False"
                                    DataKeyNames="RECORD_ID" DataKeyOnClientWithCheckBox="False"
                                    Width="100%"
                                    OnRowDataBound="DGsiteCall_RowDataBound"
                                    OnPageIndexChanging="DGsiteCall_PageIndexChanging"
                                    OnSorting="DGsiteCall_Sorting"
                                    EnhancePager="True" PageSize="15">
                                    <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage=""
                                        LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                                        PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass=""
                                        PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                                    <Columns>
                                        <asp:BoundField DataField="DOC_NBR" HeaderText="表單編號"
                                            meta:resourceKey="BoundFieldResource1" SortExpression="DOC_NBR">
                                            <ItemStyle HorizontalAlign="Left" Width="80px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="表單名稱" meta:resourceKey="TemplateFieldResource4">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFormname2" runat="server"
                                                    meta:resourceKey="lblFormnameResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="標題" meta:resourceKey="TemplateFieldResource3">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTitle2" meta:resourceKey="lblTitle2Resource1" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="60px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="申請人" meta:resourceKey="TemplateFieldResource1">
                                            <ItemStyle HorizontalAlign="Center" Width="140px" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblUser2" runat="server"
                                                    meta:resourceKey="lblUserResource1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="申請日期" meta:resourcekey="BoundFieldResource3" SortExpression="BEGIN_TIME">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBeginTime" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="傳送狀態" meta:resourceKey="TemplateFieldResource2">
                                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblSendStatus2" runat="server"
                                                    meta:resourceKey="lblSendStatusResource1"></asp:Label>
                                                <asp:LinkButton ID="lbtnSendStatus2" runat="server"
                                                    meta:resourcekey="lbtnSendStatusResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="SEND_COUNT" HeaderText="傳送次數"
                                            meta:resourceKey="BoundFieldResource2" SortExpression="SEND_COUNT">
                                            <ItemStyle HorizontalAlign="Center" Width="60px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="上次傳送時間" meta:resourcekey="BoundFieldResource4">
                                            <ItemTemplate>
                                                <asp:Label ID="lblModifyDate" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="100px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Left" />
                                </Fast:Grid>
                            </telerik:RadPageView>
                        </telerik:RadMultiPage>
                        <br />
                        <div style="text-align: center; width: 100%">
                            <asp:CustomValidator runat="server" ID="cvCheckStartTime" ErrorMessage="請輸入查詢日期(起)" OnServerValidate="CheckStartTime" Display="Dynamic" ForeColor="Red" meta:resourceKey="RequiredFieldValidator1Resource1"></asp:CustomValidator>
                            <asp:CustomValidator runat="server" ID="cvCheckEndTime" ErrorMessage="請輸入查詢日期(迄)" OnServerValidate="CheckEndTime" Display="Dynamic" ForeColor="Red" meta:resourceKey="RequiredFieldValidator2Resource1"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間"
                                meta:resourceKey="CustomValidator1Resource1" OnServerValidate="CustomValidator1_ServerValidate" ForeColor="Red"></asp:CustomValidator>
                            <asp:CustomValidator ID="cvNoCheckItem" runat="server" Display="Dynamic" ErrorMessage="請選擇欲傳送的項目"
                                Font-Size="X-Small" meta:resourcekey="cvNoCheckItemResource1" ForeColor="Red"></asp:CustomValidator>
                        </div>
                    </ContentTemplate>
                    <%--                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="RadToolBar1"
                            EventName="ButtonClick" />
                        <asp:AsyncPostBackTrigger ControlID="treeFormList" EventName="NodeClick" />
                        <asp:AsyncPostBackTrigger ControlID="RadTabStrip1" EventName="TabClick" />
                    </Triggers>--%>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblSuccess" runat="server" Text="傳送成功"
        Visible="False" meta:resourcekey="lblSuccessResource1"></asp:Label>
    <asp:Label ID="lblUnSuccess" runat="server" Text="傳送失敗"
        Visible="False" meta:resourcekey="lblUnSuccessResource1"></asp:Label>
    <asp:Label ID="lblNotSend" runat="server" Text="尚未傳送"
        Visible="False" meta:resourcekey="lblNotSendResource1"></asp:Label>
    <asp:Label ID="lblMsgSend" runat="server" meta:resourcekey="lblMsgSendResource1"
        Text="所選擇的項目已進入傳送的排程，系統即將進行傳送" Visible="False"></asp:Label>
    <asp:Label ID="lblErrorMessage" runat="server" Text="錯誤訊息"
        Visible="False" meta:resourcekey="lblErrorMessageResource1"></asp:Label>
    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="分類列表" Visible="false"></asp:Label>
</asp:Content>




