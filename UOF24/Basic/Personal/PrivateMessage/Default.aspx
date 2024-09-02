<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="Basic_Personal_PrivateMessage_Default" Title="私人訊息" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="Default.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="UC_MessageClassList.ascx" TagName="UC_MessageClassList" TagPrefix="uc1" %>
<%@ Register Src="UC_MessageClass.ascx" TagName="UC_MessageClass" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">
       Sys.Application.add_load(function () {
            //目的:私人訊息中link 連結網頁後所欲開啟的dialog
            var messageId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["msgId"],true)%>');   
            
            if (messageId != "" && $('#<%=hidPostBack.ClientID%>').val() == 'True') {           
                $('#<%=hidPostBack.ClientID%>').val('False');              
                $uof.dialog.open2("~/Basic/Personal/PrivateMessage/ViewMessage.aspx", "" ,"", 1024, 768, OpenDialogResult,{"msgId":messageId});
            }
        });
        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "new") {
                args.set_cancel(true);
                $uof.dialog.open2("~/Basic/Personal/PrivateMessage/NewMessage.aspx", args.get_item(), "New Message", 1024, 768, OpenDialogResult);
            }
            else if (value == "delete") {
                if (!confirm('<%=msgDelconfirm.Text %>')) {
                    args.set_cancel(true);
                }
            }
            else if (value == "clearAll") {
                var status =  $("#<%=hideStatus.ClientID%>").val();
                var msgClear ='';

                if(status =="receive"){
                    msgClear = '<%= lblClearReceiveboxMsg.Text %>';
                }
                else if(status =="send"){
                    msgClear = '<%= lblClearSendboxMsg.Text %>';
                }

                if (!confirm(msgClear)){
                    args.set_cancel(true);
                }
            }
        }
        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) === 'undefined' || returnValue === null)
                return false;
            else
                return true;
        }
    </script>
    <style type="text/css">
        .breakword {
            word-break: break-all;
        }

        .boldword td {
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <table style="width: 100%">
        <tr>
            <td style="width: 5%">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <uc2:UC_MessageClass ID="UC_MessageClass1" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td>
               
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <telerik:RadToolBar ID="RadToolBar1" Width="100%" runat="server" OnClientButtonClicking="RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Text="收件匣" Value="receiveForder"
                                    ClickedImageUrl="~/Common/Images/Icon/icon_m31.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m31.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m31.gif" ImageUrl="~/Common/Images/Icon/icon_m31.gif" meta:resourcekey="RadToolBarButtonResource1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="寄件匣" Value="sendForder"
                                    ClickedImageUrl="~/Common/Images/Icon/icon_m32.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m32.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m32.gif" ImageUrl="~/Common/Images/Icon/icon_m32.gif" meta:resourcekey="RadToolBarButtonResource3">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource4">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="刪除選擇的訊息" Value="delete"
                                    ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource5">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6">
                                </telerik:RadToolBarButton>
                                 <telerik:RadToolBarButton runat="server" Text="" Value="clearAll"
                                    ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" >
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="發新訊息" Value="new"
                                    ClickedImageUrl="~/Common/Images/Icon/icon_m33.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m33.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m33.gif" ImageUrl="~/Common/Images/Icon/icon_m33.gif" meta:resourcekey="RadToolBarButtonResource7">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource17" >
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="全部已讀" Value="AllRead"
                                    ClickedImageUrl="~/Common/Images/Icon/icon_m221.png" DisabledImageUrl="~/Common/Images/Icon/icon_m221.png"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m221.png" ImageUrl="~/Common/Images/Icon/icon_m221.png"  meta:resourcekey="RadToolBarButtonResource15">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="readSp"  meta:resourcekey="RadToolBarButtonResource16">
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <uc1:UC_MessageClassList ID="UC_MessageClassList1" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <table style="width: 100%;">
        <tr>
           <td>
             <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
               <ContentTemplate>
                <telerik:RadToolBar ID="utbarControl" runat="server" Width="100%" meta:resourcekey="utbarControlResource1" OnButtonClick="utbarControl_ButtonClick" SingleClick="None">
                    <Items>
                        <telerik:RadToolBarButton runat="server" Value="QueryDate" meta:resourcekey="RadToolBarButtonResource8">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="期間：" meta:resourcekey="Label1Resource1"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker ID="rdpStart" runat="server" meta:resourcekey="rdpStartResource1">
                                                <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                </Calendar>
                                                <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                                    <EmptyMessageStyle Resize="None" />
                                                    <ReadOnlyStyle Resize="None" />
                                                    <FocusedStyle Resize="None" />
                                                    <DisabledStyle Resize="None" />
                                                    <InvalidStyle Resize="None" />
                                                    <HoveredStyle Resize="None" />
                                                    <EnabledStyle Resize="None" />
                                                </DateInput>
                                                <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="~" meta:resourcekey="Label3Resource1"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker ID="rdpEnd" runat="server" meta:resourcekey="rdpEndResource1">
                                                <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                                </Calendar>
                                                <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                                    <EmptyMessageStyle Resize="None" />
                                                    <ReadOnlyStyle Resize="None" />
                                                    <FocusedStyle Resize="None" />
                                                    <DisabledStyle Resize="None" />
                                                    <InvalidStyle Resize="None" />
                                                    <HoveredStyle Resize="None" />
                                                    <EnabledStyle Resize="None" />
                                                </DateInput>
                                                <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                            </telerik:RadDatePicker>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource9">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="Keyword" meta:resourcekey="RadToolBarButtonResource10">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="關鍵字：" meta:resourcekey="Label2Resource1"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txbSearchKey" runat="server" meta:resourcekey="txbSearchKeyResource1"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource11">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Text="查詢" Value="submit"
                            CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                            HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource12">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource13">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="Message" meta:resourcekey="RadToolBarButtonResource14">
                            <ItemTemplate>
                                <asp:Label ID="lblMessage" runat="server" Text="*未歸檔訊息只保留{0}個月" ForeColor="Red" meta:resourcekey="lblMessageResource9"></asp:Label>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
               </td>
                </ContentTemplate>
            </asp:UpdatePanel>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <Fast:Grid ID="gridReceive" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                            OnRowDataBound="gridReceive_RowDataBound" DataKeyNames="MESSAGE_GUID"
                            DataSourceID="ObjectDataSource1" OnSorting="gridReceive_Sorting"
                            OnRowCommand="gridReceive_RowCommand" Width="100%"
                            DataKeyOnClientWithCheckBox="False"
                            DefaultSortDirection="Ascending" EnhancePager="True" PageSize="15"
                            OnPageIndexChanging="gridReceive_PageIndexChanging"
                            EmptyDataText="沒有資料"
                            KeepSelectedRows="False" meta:resourcekey="gridReceiveResource2" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                            <EnhancePagerSettings ShowHeaderPager="True" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderImageUrl="~/App_Themes/DefaultTheme/images/attachment.gif" meta:resourcekey="TemplateFieldResource5">
                                    <HeaderStyle Width="16px" />
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td style="min-width: 16px">
                                                    <asp:Image ID="imgReceiveAttach" runat="server" Width="16px" Height="16px" meta:resourcekey="imgReceiveAttachResource1"></asp:Image>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="主旨" SortExpression="TOPIC" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbReadTopic" runat="server" CausesValidation="False" CommandName="view" meta:resourceKey="lbReadTopicResource1" Text='<%#: Eval("TOPIC") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="breakword" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="寄件人" SortExpression="MESSAGE_FROM_NAME" meta:resourcekey="TemplateFieldResource2">
                                    <ItemStyle Width="240px" />
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#: Eval("MESSAGE_FROM") %>' ID="lbSender" meta:resourceKey="lbSenderResource1" __designer:wfdid="w8"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="收到時間" SortExpression="CREATE_TIME" meta:resourcekey="BoundFieldResource1">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Bind("CREATE_TIME") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblCreateTime" runat="server" Text='<%#: Bind("CREATE_TIME") %>' meta:resourcekey="lblCreateTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="120px" Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="閱讀時間" SortExpression="READED_TIME" meta:resourcekey="BoundFieldResource2">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%#: Bind("READED_TIME") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblReadedTime" runat="server" Text='<%#: Bind("READED_TIME") %>' meta:resourcekey="lblReadedTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="120px" Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="回覆時間" SortExpression="REPLY_TIME" meta:resourcekey="BoundFieldResource3">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%#: Bind("REPLY_TIME") %>' meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblReplyTime" runat="server" Text='<%#: Bind("REPLY_TIME") %>' meta:resourcekey="lblReplyTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="120px" Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="MESSAGE_GUID" HeaderText="MESSAGE_GUID" ReadOnly="True"
                                    Visible="False" meta:resourcekey="BoundFieldResource4" />
                            </Columns>
                        </Fast:Grid>
                        <Fast:Grid ID="gridSend" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                            AutoGenerateColumns="False" DataKeyNames="MESSAGE_GUID,MASTER_GUID"
                            DataSourceID="ObjectDataSource2" Visible="False" OnRowDataBound="gridSend_RowDataBound"
                            OnSorting="gridSend_Sorting" OnRowCommand="gridSend_RowCommand" Width="100%"
                            DataKeyOnClientWithCheckBox="False"
                            DefaultSortDirection="Ascending" EnhancePager="True" PageSize="15"
                            OnPageIndexChanging="gridSend_PageIndexChanging" EmptyDataText="沒有資料" KeepSelectedRows="False" meta:resourcekey="gridSendResource2" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                            <EnhancePagerSettings ShowHeaderPager="True" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderImageUrl="~/App_Themes/DefaultTheme/images/attachment.gif"
                                    meta:resourcekey="TemplateFieldResource6">
                                    <HeaderStyle Width="16px" />
                                    <ItemTemplate>
                                        <asp:Image ID="imgSendAttach" runat="server" Width="16px" Height="16px"
                                            meta:resourcekey="imgSendAttachResource1"></asp:Image>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="主旨" SortExpression="TOPIC" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="lbSendTopic" Text='<%#: Eval("TOPIC") %>' CommandName="view" CausesValidation="False" meta:resourceKey="lbSendTopicResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="收件人" SortExpression="MESSAGE_TO_NAME" meta:resourcekey="TemplateFieldResource4">
                                    <ItemStyle Width="450px"/>
                                    <ItemTemplate>
                                        <asp:Panel ID="Panel1" runat="server" Height="45px" ScrollBars="Auto" meta:resourcekey="Panel1Resource1">
                                            <asp:Label runat="server" Text='<%#: Eval("MESSAGE_TO") %>' ID="lbReader"  meta:resourceKey="lbReaderResource1"></asp:Label>
                                        </asp:Panel>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="寄件時間" SortExpression="CREATE_TIME" meta:resourcekey="BoundFieldResource5">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSendCreateTime" runat="server" Text='<%#: Bind("CREATE_TIME") %>' meta:resourcekey="lblSendCreateTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="120px" Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="收件人閱讀時間" SortExpression="READED_TIME" meta:resourcekey="BoundFieldResource6">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSendReadTime" runat="server" Text='<%#: Bind("READED_TIME") %>' meta:resourcekey="lblSendReadTimeResource1"></asp:Label>
                                        <asp:LinkButton ID="lbtnReadTime" runat="server" Text="閱讀記錄" meta:resourcekey="lbtnReadTimeResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="120px" Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="回覆時間" SortExpression="REPLY_TIME" meta:resourcekey="BoundFieldResource7">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSendReplyTime" runat="server" Text='<%#: Bind("REPLY_TIME") %>' meta:resourcekey="lblSendReplyTimeResource1"></asp:Label>
                                        <asp:LinkButton ID="lbtnSendReplyTime" runat="server" Text="回覆記錄" meta:resourcekey="lbtnSendReplyTimeResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="120px" Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="MESSAGE_GUID" HeaderText="MESSAGE_GUID" ReadOnly="True"
                                    Visible="False" meta:resourcekey="BoundFieldResource8" />
                            </Columns>
                        </Fast:Grid>
                        <asp:HiddenField ID="hideStatus" runat="server" />
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="utbarControl" EventName="ButtonClick" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetReceivedMessages"
        TypeName="Ede.Uof.EIP.PrivateMessage.PrivateMessageUCO">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbUserGuid" Name="userGUID" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetSendedMessages"
        TypeName="Ede.Uof.EIP.PrivateMessage.PrivateMessageUCO">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbUserGuid" Name="userGUID" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:Label ID="lbUserGuid" runat="server" Visible="False" meta:resourcekey="lbUserGuidResource1"></asp:Label>
    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="hiddenOrder" runat="server" />
            <asp:HiddenField ID="hiddenOrderCol" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />

    <asp:Label ID="lblTotalAmount" runat="server" Text="...共{0}人" Visible="false" meta:resourcekey="lblTotalAmountResource1"></asp:Label>

    <asp:Label ID="hideSearch" runat="server" Visible="False" meta:resourcekey="hideSearchResource1" />
    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
    <asp:Label ID="msgNomessage" runat="server" Text="無訊息" Visible="False" meta:resourcekey="msgNomessageResource1"></asp:Label>
    <asp:Label ID="msgReceivebox" runat="server" Text="收件匣" Visible="False" meta:resourcekey="msgReceiveboxResource1"></asp:Label>
    <asp:Label ID="lblReplyTitle" runat="server" Text="回覆記錄" Visible="False" meta:resourcekey="lblReplyTitleResource1"></asp:Label>
    <asp:Label ID="lblReadTitle" runat="server" Text="閱讀記錄" Visible="False" meta:resourcekey="lblReadTitleResource1"></asp:Label>
    <asp:Label ID="msgSendbox" runat="server" Text="寄件匣" Visible="False" meta:resourcekey="msgSendboxResource1"></asp:Label>
    <asp:Label ID="lblClearReceivebox" runat="server" Text="清空收件匣" Visible="False" meta:resourcekey="lblClearReceiveboxResource1"></asp:Label>
    <asp:Label ID="lblClearSendbox" runat="server" Text="清空寄件匣" Visible="False" meta:resourcekey="lblClearSendboxResource1"></asp:Label>
    <asp:Label ID="lblClearReceiveboxMsg" runat="server" Text="將清空收件匣中包含已歸檔的所有私人訊息，確定要清空？" Visible="False" meta:resourcekey="lblClearReceiveboxMsgResource1"></asp:Label>
    <asp:Label ID="lblClearSendboxMsg" runat="server" Text="將清空寄件匣中包含已歸檔的所有私人訊息，確定要清空？" Visible="False" meta:resourcekey="lblClearSendboxMsgResource1"></asp:Label>
    <asp:HiddenField ID="hidPostBack" runat="server" Value="True" />

</asp:Content>

