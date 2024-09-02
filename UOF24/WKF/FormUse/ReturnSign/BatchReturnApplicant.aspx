<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_ReturnSign_BatchReturnApplicant" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="BatchReturnApplicant.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagPrefix="uc1" TagName="UC_BtnChoiceOnce" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc2" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        function ToolbarClicking(sender, args) {
            var Key = args.get_item().get_value();
            if (Key == "Return") {
                if (confirm('<%=lblConfirm.Text %>') == false) {
                    args.set_cancel(true);
                }
            }
        }
    </script>


    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="ToolbarClicking" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
    <Items>
        <telerik:RadToolBarButton runat="server" Value="Query" Text="查詢" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" Value="Return" Text="退回申請者" ImageUrl="~/Common/Images/Icon/icon_m113.gif" meta:resourcekey="RadToolBarButtonResource3"></telerik:RadToolBarButton>
        <telerik:RadToolBarButton IsSeparator="true" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
    </Items>
    </telerik:RadToolBar>

    <center>
                            <asp:UpdatePanel ID="updatePanelGrid" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
    <table style="width:75%">
        <tr>
            <td>

            <table class="PopTable">
                <tbody>
                    <tr>
                        <td style="width:15%">
                            <asp:Label ID="lblApplyDate" runat="server" Text="申請日期" meta:resourcekey="lblApplyDateResource1"></asp:Label>
                        </td>
                        <td style="text-align: left; width: 35%; vertical-align: middle">
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
                            <telerik:RadDatePicker ID="radDateEnd" runat="server" meta:resourcekey="radDateEndResource1">
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
                        </td>
                        <td style="width:15%">
                            <asp:Label ID="lblFormName" runat="server" Text="表單名稱" meta:resourcekey="lblFormNameResource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" style="text-align: left;width:35%">
                            <asp:DropDownList ID="ddlFormName" runat="server" meta:resourcekey="ddlFormNameResource1"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server"  Text="人員" meta:resourcekey="Label1Resource1"></asp:Label>
                        </td>
                        <td style="text-align: left;" class="PopTableRightTD" colspan="3">

                            <div style="overflow-y:auto;height:150px">
                                 
                                <uc2:UC_ChoiceList runat="server" ID="UC_ChoiceList1" ShowMember="false" ShowAddToFavorite="false"  />
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="請選擇人員"  Display="Dynamic" ControlToValidate="txtChoice" meta:resourcekey="RequiredFieldValidator1Resource1" ></asp:RequiredFieldValidator>
                            <asp:Label ID="lblExplain" runat="server" CssClass="SizeMemo" Text="註:此查詢所帶出之表單為該人員已簽核或處理中之未結案表單。" meta:resourcekey="lblExplainResource1"></asp:Label>
                            <asp:TextBox ID="txtChoice" runat="server"  style ="display:none" meta:resourcekey="txtChoiceResource1"></asp:TextBox>
                        </td>
                    </tr>
                </tbody>
            </table>
                </td>
            </tr>
        </table>
            <table style="width:100%">
                <tr>
                    <td style="text-align:left">
                        <asp:Label ID="lblErrorMsgs" runat="server" Text="" Visible="False" ForeColor="Red"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                        <Fast:Grid ID="FormGrid" runat="server" Width="100%" AllowPaging="True" OnPageIndexChanging="FormGrid_PageIndexChanging"
                                                DataKeyNames="SITE_ID,TASK_ID,NODE_SEQ,FLOW_TYPE" AutoGenerateColumns="False" OnRowDataBound="FormGrid_RowDataBound"
                                                 AutoGenerateCheckBoxColumn="True" AllowSorting="True" DataKeyOnClientWithCheckBox="False"
                                                DefaultSortDirection="Ascending" EnhancePager="True" PageSize="15" EmptyDataText="沒有資料" KeepSelectedRows="False" OnSorting="FormGrid_Sorting"  meta:resourcekey="FormGridResource1"  >
                                                <EnhancePagerSettings
                                                    ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                                                <ExportExcelSettings AllowExportToExcel="False" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="表單編號" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource1">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" Text='<%#: Bind("DOC_NBR") %>' ID="lblDocNumber" meta:resourcekey="lblDocNumberResource1"></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="表單名稱" SortExpression="FORM_NAME" meta:resourcekey="TemplateFieldResource2">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%#: Bind("FORM_NAME") %>' ID="Label2" meta:resourcekey="Label2Resource1" ></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="表單狀態" SortExpression="TASK_STATUS" Visible="False" meta:resourcekey="TemplateFieldResource3">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%#: Bind("TASK_STATUS") %>' ID="lblTaskStatus" meta:resourcekey="lblTaskStatusResource1"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="申請者" SortExpression="APPLICANT" meta:resourcekey="TemplateFieldResource4">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbtnApplicant" runat="server" Text='<%#: Bind("APPLICANT") %>' CommandArgument='<%# Bind("APPLICANT") %>' meta:resourcekey="lbtnApplicantResource1" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="申請時間" SortExpression="BEGIN_TIME" meta:resourcekey="TemplateFieldResource5">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblApplyTime"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="20%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="目前簽核者" meta:resourcekey="TemplateFieldResource6">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbtnCurrentSigner" runat="server" meta:resourcekey="lbtnCurrentSignerResource1"></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="申請者姓名" Visible="False" meta:resourcekey="TemplateFieldResource7">
                                                        <ItemTemplate>
                                                            <asp:Label ID="hidApplicantName" runat="server" meta:resourcekey="hidApplicantNameResource1" ></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="False" meta:resourcekey="TemplateFieldResource8">
                                                        <ItemTemplate>
                                                            <asp:Label ID="hidCurrentSigner" runat="server" meta:resourcekey="hidCurrentSignerResource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
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

    <asp:Label ID="lblConfirm" runat="server" Text="是否將所有勾選表單退回申請者" Visible="False" meta:resourcekey="lblConfirmResource1"></asp:Label>
    <asp:Label ID="hidMember" runat="server" Visible="False" meta:resourcekey="hidMemberResource1"></asp:Label>
    <asp:Label ID="hidAllForms" runat="server" Visible= "False" Text="所有表單" meta:resourcekey="hidAllFormsResource1"></asp:Label>
    <asp:Label ID="lblStarted" runat="server" Visible="False" Text="處理中" meta:resourcekey="lblStartedResource1"></asp:Label>
    <asp:Label ID="lblSiteId" runat="server" Visible="False" Text="SiteID:" meta:resourcekey="lblSiteIdResource1"></asp:Label>
    <asp:Label ID="lblTaskId" runat="server" Visible="False" Text="TaskID:" meta:resourcekey="lblTaskIdResource1"></asp:Label>
    <asp:Label ID="lblErrorMsg" runat="server" Text="筆資料退簽失敗" Visible="False" ForeColor="Red" meta:resourcekey="lblErrorMsgResource1"></asp:Label>
</asp:Content>

