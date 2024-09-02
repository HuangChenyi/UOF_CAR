<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="Test_Default8" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="QueryEDoc.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
    <Items>
        <telerik:RadToolBarButton runat="server" Value="QueryDate" meta:resourcekey="RadToolBarButtonResource1">
            <ItemTemplate>
                <asp:Label ID="lblTransDate" runat="server" Text="收文日期" meta:resourcekey="lblTransDateResource1"></asp:Label>
                <telerik:RadDatePicker ID="radDateStart" runat="server" meta:resourcekey="radDateStartResource1">
                    <Calendar EnableWeekends="True" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
                ~
                &nbsp;
                <telerik:RadDatePicker ID="radDateEnd" runat="server" meta:resourcekey="radDateEndResource1" >
                    <Calendar EnableWeekends="True" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
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
            </ItemTemplate>
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" Value="Type" meta:resourcekey="RadToolBarButtonResource3">
            <ItemTemplate>
                <asp:Label ID="lblType" runat="server" Text="類別" meta:resourcekey="lblTypeResource1"></asp:Label>
                <asp:DropDownList ID="ddlType" runat="server" meta:resourcekey="ddlTypeResource1">
                    <asp:ListItem Text="全部" meta:resourcekey="ListItemResource1"></asp:ListItem>
                    <asp:ListItem Value="EDocMail" Text="函" meta:resourcekey="ListItemResource2"></asp:ListItem>
                    <asp:ListItem Value="EDocOrder" Text="令" meta:resourcekey="ListItemResource3"></asp:ListItem>
                    <asp:ListItem Value="EDocNotify" Text="開會通知單" meta:resourcekey="ListItemResource4"></asp:ListItem>
                </asp:DropDownList>
            </ItemTemplate>
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" Value="Status" meta:resourcekey="RadToolBarButtonResource5">
            <ItemTemplate>
                <asp:Label ID="lblStatus" runat="server" Text="簽核狀態" meta:resourcekey="lblStatusResource1"></asp:Label>
                <asp:DropDownList ID="ddlStatus" runat="server" meta:resourcekey="ddlStatusResource1">
                    <asp:ListItem Text="全部" meta:resourcekey="ListItemResource5"></asp:ListItem>
                    <asp:ListItem Value="Signing" Text="處理中" meta:resourcekey="ListItemResource6"></asp:ListItem>
                    <asp:ListItem Value="Adopt" Text="通過" meta:resourcekey="ListItemResource7"></asp:ListItem>
                    <asp:ListItem Value="Reject" Text="否決" meta:resourcekey="ListItemResource8"></asp:ListItem>
                    <asp:ListItem Value="Cancel" Text="作廢" meta:resourcekey="ListItemResource9"></asp:ListItem>
                </asp:DropDownList>
            </ItemTemplate>
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource6"></telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" Value="Query" Text="查詢" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource7"></telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource8"></telerik:RadToolBarButton>
    </Items>
    </telerik:RadToolBar>

    <center>
                            <asp:UpdatePanel ID="updatePanelGrid" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
    <table style="width:100%">
        <tr>
            <td>
            <table style="width:100%">
                <tr>
                    <td>
                        <Fast:Grid ID="FormGrid" runat="server" Width="100%" AllowPaging="True" OnPageIndexChanging="FormGrid_PageIndexChanging"
                                                DataKeyNames="RECEIVE_DATE" AutoGenerateColumns="False" OnRowDataBound="FormGrid_RowDataBound"
                                                 AutoGenerateCheckBoxColumn="False" AllowSorting="True" DataKeyOnClientWithCheckBox="False"
                                                DefaultSortDirection="Ascending" EnhancePager="True" PageSize="15" EmptyDataText="沒有資料" KeepSelectedRows="False" OnSorting="FormGrid_Sorting" OnBeforeExport="FormGrid_BeforeExport"  meta:resourcekey="FormGridResource1"  >
                                                <EnhancePagerSettings
                                                    ShowHeaderPager="True" />
                                                <ExportExcelSettings AllowExportToExcel="True" ExportType="DataSource" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="收文日期" SortExpression="RECEIVE_DATE" meta:resourcekey="TemplateFieldResource1">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblReceiveDate"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="發文日期" SortExpression="SEND_TIME" meta:resourcekey="TemplateFieldResource2">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("SEND_TIME") %>' ID="lblSendTime" meta:resourcekey="lblSendTimeResource1" ></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="8%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="類別" SortExpression="TYPE" meta:resourcekey="TemplateFieldResource3" >
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("TYPE") %>' ID="lblType" meta:resourcekey="lblTypeResource2"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left"  Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="發文字號" SortExpression="E_DOC_NBR" meta:resourcekey="TemplateFieldResource4" >
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%#: Bind("E_DOC_NBR") %>' ID="lblEDocNbr" meta:resourcekey="lblEDocNbrResource1"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="13%"  />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="主旨" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource5" >
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%#: Bind("SUBJECT") %>' ID="lblSubject" meta:resourcekey="lblSubjectResource1"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="25%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="發文機關" SortExpression="SENDER" meta:resourcekey="TemplateFieldResource6" >
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%#: Bind("SENDER") %>' ID="lblSender" meta:resourcekey="lblSenderResource1"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left"  Width="15%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="簽核狀態" SortExpression="STATUS" meta:resourcekey="TemplateFieldResource7" >
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("STATUS") %>' ID="lblStatus" meta:resourcekey="lblStatusResource2"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left"  Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="TaskId" Visible="False" meta:resourcekey="TemplateFieldResource8">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("TASK_ID") %>' ID="lblTaskId" meta:resourcekey="lblTaskIdResource1"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>                                                    
                                                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource9">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbtnOperate" runat="server" Text="觀看" meta:resourcekey="lbtnOperateResource1"/>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="5%" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle Wrap="False" />
                                            </Fast:Grid>
                    </td>
                </tr>
            </table>

            </td>
        </tr>
    </table>
                    </ContentTemplate>
    </asp:UpdatePanel>
    </center>
    <asp:Label ID="lblSigning" runat="server" Text="處理中" Visible="False" meta:resourcekey="lblSigningResource1"></asp:Label>
    <asp:Label ID="lblAdopt" runat="server" Text="通過" Visible="False" meta:resourcekey="lblAdoptResource1"></asp:Label>
    <asp:Label ID="lblReject" runat="server" Text="否決" Visible="False" meta:resourcekey="lblRejectResource1"></asp:Label>
    <asp:Label ID="lblCancel" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblCancelResource1"></asp:Label>
    <asp:Label ID="lblReceiveTime" runat="server" Text="收文日期" Visible="False" meta:resourcekey="lblReceiveTimeResource1"></asp:Label>
    <asp:Label ID="lblSendDate" runat="server" Text="發文日期" Visible="False" meta:resourcekey="lblSendDateResource1"></asp:Label>
    <asp:Label ID="lblType" runat="server" Text="類別" Visible="False" meta:resourcekey="lblTypeResource3"></asp:Label>
    <asp:Label ID="lblEDocNbr" runat="server" Text="發文字號" Visible="False" meta:resourcekey="lblEDocNbrResource2"></asp:Label>
    <asp:Label ID="lblSubject" runat="server" Text="主旨" Visible="False" meta:resourcekey="lblSubjectResource2"></asp:Label>
    <asp:Label ID="lblOrganization" runat="server" Text="發文機關" Visible="False" meta:resourcekey="lblOrganizationResource1"></asp:Label>
    <asp:Label ID="lblStatus" runat="server" Text="簽核狀態" Visible="False" meta:resourcekey="lblStatusResource3"></asp:Label>
</asp:Content>

