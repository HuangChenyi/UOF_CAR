<%@ Page Title="生日簡訊" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="SendBirthdayDefault.aspx.cs" Inherits="Ede.Uof.Web.EIP.SMS.SendBirthdayDefault" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../Common/Organization/UC_DeptManagerTree.ascx" TagName="UC_DeptManagerTree" TagPrefix="uc1" %>
<%@ Register Src="~/Common/Organization/DepartmentTree.ascx" TagPrefix="uc1" TagName="DepartmentTree" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script type="text/javascript">
        function OnValueChanging(sender, args) {

            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
            }
        }

        function RadToolBarButtonClicking(sender, args) {
            var key = args.get_item().get_value();
            switch (key) {
                case "Send":
                    args.set_cancel(true);
                    var toolbarbutton = $find('<%=RadToolBar1.ClientID %>').findItemByValue('QueryCondition');
                    var startDate = $telerik.findElement(toolbarbutton.get_element(), ("rdpDateStart")).defaultValue;

                    var selectKeyClientID = '<%=hfSelectKey.ClientID%>';
                    var checkedData = $uof.fastGrid.getChecked('<%=grid1.ClientID%>');
                    if (checkedData != '') {
                        $("#<%=hfSelectKey.ClientID%>").val(checkedData);
                        $uof.dialog.open2("~/EIP/SMS/SendBirthdayMsg.aspx", args.get_item(), '<%=lblDialogTitle.Text%>', 1000, 750,
                            openDialogResult,
                            { "ClientID": selectKeyClientID, "StartDate": startDate });
                    }
                    else {
                        alert('<%=lblNotSelectedMsg.Text %>');                        
                        args.set_cancel(true);
                    }
                    break;
                case "Cancel":
                    
                    var checkedData = $uof.fastGrid.getChecked('<%=grid1.ClientID%>');
                    if (checkedData != '') {
                        if (!confirm('<%=lblConfirm.Text %>')) {
                            args.set_cancel(true);
                        }
                    }
                    else { args.set_cancel(true); }
                    break;
            }
        }

        function openDialogResult(returnValue) {
            if (returnValue === '' || returnValue === null)
                return false;
            else
                return true;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBarButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
        <Items>
            <telerik:RadToolBarButton runat="server" Value="QueryCondition" meta:resourcekey="RadToolBarButtonResource1">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="生日區間：" meta:resourcekey="Label3Resource1"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rdpDateStart" runat="server" onselecteddatechanged="rdpDateStart_SelectedDateChanged" AutoPostBack="True" meta:resourcekey="rdpDateStartResource1">
                                    <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput AutoPostBack="True" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                        <ClientEvents OnValueChanging="OnValueChanging" />
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
                                <asp:Label ID="Label4" runat="server" Text="~" meta:resourcekey="Label4Resource1"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rdpDateEnd" runat="server" meta:resourcekey="rdpDateEndResource1">
                                    <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                    </Calendar>
                                    <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                        <ClientEvents OnValueChanging="OnValueChanging" />
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
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="SendStatus" meta:resourcekey="RadToolBarButtonResource3">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="發送狀態：" meta:resourcekey="Label2Resource1"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlSendResult" runat="server" meta:resourcekey="ddlSendResultResource1">
                                    <asp:ListItem Value="ALL" Text="全部" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                    <asp:ListItem Value="NotYet" Text="未預約" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                    <asp:ListItem Value="Wait" Text="未發送" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                    <asp:ListItem Value="Success" Text="已發送" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                    <asp:ListItem Value="Fail" Text="失敗" meta:resourcekey="ListItemResource5"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="ContainSubDept" meta:resourcekey="RadToolBarButtonResource5">
                <ItemTemplate>
                    <asp:CheckBox ID="chSubDept" runat="server" Text="包含子部門" Checked="True" meta:resourcekey="chSubDeptResource1" />
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m39.gif"  DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" Value="Query" meta:resourcekey="RadToolBarButtonResource7">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource8">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m33.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m33.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m33.gif" ImageUrl="~/Common/Images/Icon/icon_m33.gif" Text="預約發送" Value="Send" meta:resourcekey="RadToolBarButtonResource9">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource10">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" Text="取消" Value="Cancel" meta:resourcekey="RadToolBarButtonResource11">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource12">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" ClickedImageUrl="~/Common/Images/Icon/icon_m38.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m38.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m38.gif" ImageUrl="~/Common/Images/Icon/icon_m38.gif" Text="更新發送結果" Value="Update" meta:resourcekey="RadToolBarButtonResource13">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource14">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" meta:resourcekey="RadToolBarButtonResource15" >
                <ItemTemplate>
                    <asp:Label ID="lblNoticeMsg2" runat="server" Text="※更新發送結果按鈕是取得簡訊廠商的發送結果" ForeColor="Blue" meta:resourcekey="lblNoticeMsg2Resource1"></asp:Label>
                </ItemTemplate>
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
                    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblTreeTitle" runat="server" Text="內部組織結構列表" Visible="False" meta:resourcekey="lblTreeTitleResource1"></asp:Label>
            <uc1:DepartmentTree runat="server" ID="DepartmentTree" DisplayActiveControl="true" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>

            <Fast:Grid ID="grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="True" 
                DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                DefaultSortColumnName="GROUP_NAME,NAME" DataKeyNames="USER_GUID,MSG_ID"
                EnhancePager="True" KeepSelectedRows="False"
                PageSize="15" Width="100%" CustomDropDownListPage="False" 
                SelectedRowColor="" UnSelectedRowColor="" OnPageIndexChanging="grid1_PageIndexChanging" 
                OnRowDataBound="grid1_RowDataBound" OnSorting="grid1_Sorting" OnBeforeExport="grid1_BeforeExport" meta:resourcekey="grid1Resource1">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="True" />
                <Columns>

                    <asp:TemplateField HeaderText="姓名" SortExpression="GROUP_NAME,NAME" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("USER_GUID") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnName" runat="server" meta:resourcekey="lbtnNameResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="10%"/>
                        <ItemStyle Wrap="False" Width="10%"/>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="生日" SortExpression="BIRTHDAYSORT" meta:resourcekey="TemplateFieldResource4">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("BIRTHDAY") %>' meta:resourcekey="TextBox4Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBirthday" runat="server" Text='<%# Bind("BIRTHDAY") %>' meta:resourcekey="lblBirthdayResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="50px"/>
                        <ItemStyle Width="50px" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="電話" DataField="PHONE" SortExpression="PHONE" meta:resourcekey="BoundFieldResource2" >
                    <HeaderStyle Wrap="False" Width="100px"/>
                    <ItemStyle  Wrap="false" Width="100px"/>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="發送時間" SortExpression="SEND_TIME" meta:resourcekey="BoundFieldResource3">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("SEND_TIME") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSendTime" runat="server" Text='<%# Bind("SEND_TIME") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="100px" Wrap="False" />
                        <ItemStyle Width="100px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="簡訊內容" DataField="SMS_CONTENT" SortExpression="SMS_CONTENT" meta:resourcekey="BoundFieldResource4" >
                    <ItemStyle Width="40%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="狀態" SortExpression="SEND_STATUS" meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("SEND_STATUS") %>' meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("SEND_STATUS") %>' meta:resourcekey="lblStatusResource1"></asp:Label>                         
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="80px"/>
                        <ItemStyle Wrap="False" HorizontalAlign="Center" Width="80px"/>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ERROR_MSG" HeaderText="發送結果" meta:resourcekey="BoundFieldResource5" >
                    <HeaderStyle Wrap="False" Width="10%"/>
                    <ItemStyle Wrap="False" Width="10%"/>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource3">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnReSend" runat="server" Text="重發" OnClick="lbtnReSend_Click" Visible="False" meta:resourcekey="lbtnReSendResource1"></asp:LinkButton>
                            <asp:LinkButton ID="lbtnModify" runat="server" Text="修改" OnClick="lbtnModify_Click" Visible="False" meta:resourcekey="lbtnModifyResource1"></asp:LinkButton>                            
                        </ItemTemplate>
                        <HeaderStyle Wrap="False" Width="80px"/>
                        <ItemStyle HorizontalAlign="Center" Wrap="False" Width="80px"/>
                    </asp:TemplateField>
                </Columns>      
            </Fast:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>    
    <asp:Label ID="lblStatusNotYet" runat="server" Text="未預約" Visible="False" meta:resourcekey="lblStatusNotYetResource1"></asp:Label>
    <asp:Label ID="lblStatusWait" runat="server" Text="未發送" Visible="False" meta:resourcekey="lblStatusWaitResource1"></asp:Label>
    <asp:Label ID="lblStatusSuccess" runat="server" Text="已發送" Visible="False" meta:resourcekey="lblStatusSuccessResource1"></asp:Label>
    <asp:Label ID="lblStatusFail" runat="server" Text="失敗" Visible="False" meta:resourcekey="lblStatusFailResource1"></asp:Label>
    <asp:Label ID="lblConfirm" runat="server" Text="確定要取消嗎?" Visible="False" meta:resourcekey="lblConfirmResource1"></asp:Label>
    <asp:Label ID="lblDialogTitle" runat="server" Text="預約發送" Visible="False" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
    <asp:Label ID="lblDialogErrorMsg" runat="server" Text="發送簡訊結果" Visible="False" meta:resourcekey="lblDialogErrorMsgResource1"></asp:Label>
    <asp:HiddenField ID="hfSelectKey" runat="server" />
    <asp:Label ID="lblSMSConnectFail" runat="server" Text="更新發送結果失敗，請至簡訊管理確認連線是否正常。" Visible="False" meta:resourcekey="lblSMSConnectFailResource1"></asp:Label>
    <asp:Label ID="lblUpdateSuccess" runat="server" Text="更新完成" Visible="False" meta:resourcekey="lblUpdateSuccessResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:Label ID="lblNotSelectedMsg" runat="server" Text="請選擇預約發送對象" Visible="False" meta:resourcekey="lblNotSelectedMsgResource1"></asp:Label>
</asp:Content>
