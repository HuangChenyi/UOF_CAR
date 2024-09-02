<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="QueryRenewPunchDef.aspx.cs"  Culture="auto" Inherits="Ede.Uof.Web.EIP.Duty.Report.QueryRenewPunchDef" meta:resourcekey="PageResource1" uiculture="auto"  %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Common/Organization/UC_DeptManagerTree.ascx" TagPrefix="uc1" TagName="UC_DeptManagerTree" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    <script type="text/javascript">        
        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server"></asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc1:UC_DeptManagerTree runat="server" ID="UC_DeptManagerTree" ShowDeptManagerTree="True" ShowDeptPersonalTree="True" ShowSuperiorTree="True" DisplayActiveControl="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="rtbSearch" runat="server" OnButtonClick="rtbSearch_ButtonClick" Width="100%" meta:resourcekey="rtbSearchResource1" SingleClick="None" >
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="subDept" meta:resourcekey="RadToolBarButtonResource1" >
                        <ItemTemplate>
                            <asp:CheckBox ID="cbSubDept" runat="server" Text="包含子部門" meta:resourcekey="cbSubDeptResource1"  />
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2" >
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource3" Text="查詢" Value="Serach">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4" >
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <table class="PopTable" style="width: 100%">
                <tr>
                    <td style="width: 20%">
                        <asp:Label ID="lblStart" runat="server" Text="日期(起)" meta:resourcekey="lblStartResource1"  ></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <telerik:RadDatePicker ID="rdStart" runat="server"  meta:resourcekey="rdStartResource1" >
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                            </Calendar>
                            <DateInput LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
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
                    <td style="width: 20%">
                        <asp:Label ID="lblEnd" runat="server" Text="日期(訖)" meta:resourcekey="lblEndResource1" ></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <telerik:RadDatePicker ID="rdEnd" runat="server"  meta:resourcekey="rdEndResource1" >
                            <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;">
                            </Calendar>
                            <DateInput LabelWidth="40%" DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" Width="">
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
                <tr>
                    <td>
                        <asp:Label ID="lblUser" runat="server" Text="人員" meta:resourcekey="lblUserResource1" ></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtUser" runat="server" meta:resourcekey="txtUserResource1" ></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblState" runat="server" Text="單據狀態" meta:resourcekey="lblStateResource1" ></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlByState" runat="server" meta:resourcekey="ddlByStateResource1" >
                            <asp:ListItem Value="0" Text="所有狀態" meta:resourcekey="ListItemResource1" ></asp:ListItem>
                            <asp:ListItem Value="1" Text="簽核中" meta:resourcekey="ListItemResource2" ></asp:ListItem>
                            <asp:ListItem Value="2" Text="通過" meta:resourcekey="ListItemResource3" ></asp:ListItem>
                            <asp:ListItem Value="3" Text="否決" meta:resourcekey="ListItemResource4" ></asp:ListItem>
                            <asp:ListItem Value="4" Text="作廢" meta:resourcekey="ListItemResource5" ></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>          
                <Ede:Grid ID="grdRenewPunch" Width="100%" runat="server" AllowPaging="True" OnAfterExport="grdRenewPunch_AfterExport" OnBeforeExport="grdRenewPunch_BeforeExport" OnPageIndexChanging="grdRenewPunch_PageIndexChanging" OnSorting="grdRenewPunch_Sorting" OnRowDataBound="grdRenewPunch_RowDataBound" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" AllowSorting="True" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" DefaultSortColumnName="APPLICANT_ACCOUNT" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grdRenewPunchResource1" >
                    <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                    <ExportExcelSettings AllowExportToExcel="True" />
                    <Columns>
                        <asp:BoundField DataField="APPLICANT_ACCOUNT" HeaderText="帳號" SortExpression="APPLICANT_ACCOUNT" meta:resourcekey="BoundFieldResource1"  >
                        <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="姓名" meta:resourcekey="BoundFieldResource2" >
                           <ItemTemplate>
                             <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                           </ItemTemplate>
                           <HeaderStyle Wrap="False" />
                           <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="員工編號" SortExpression="EMPLOYEE_NO" meta:resourcekey="TemplateFieldResource5">
                            <ItemTemplate>
                                <asp:Label ID="lblEmployee" runat="server" Text='<%#: Bind("EMPLOYEE_NO") %>' meta:resourcekey="lblEmployeeResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="false"/>
                        </asp:TemplateField>
                        <asp:BoundField DataField="GROUP_NAME" HeaderText="申請部門" SortExpression="GROUP_NAME" meta:resourcekey="BoundFieldResource4"  >
                        <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="補刷卡單號" InsertVisible="False" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource1" >
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDocNbr" runat="server" Text='<%#: Eval("DOC_NBR") %>' meta:resourcekey="lbtnDocNbrResource1" ></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="類別" SortExpression="TYPE" meta:resourcekey="TemplateFieldResource2" >
                            <EditItemTemplate>
                                <asp:TextBox ID="txtType" runat="server" Text='<%#: Bind("TYPE") %>' meta:resourcekey="txtTypeResource1" ></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblType" runat="server" Text='<%#: Bind("TYPE") %>' meta:resourcekey="lblTypeResource1" ></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="上班卡" SortExpression="WORK_CLOCK_TIME" meta:resourcekey="BoundFieldResource5">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%#: Bind("WORK_CLOCK_TIME") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblWork" runat="server" Text='<%#: Bind("WORK_CLOCK_TIME") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="下班卡" SortExpression="OFF_CLOCK_TIME" meta:resourcekey="BoundFieldResource6">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%#: Bind("OFF_CLOCK_TIME") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblOff" runat="server" Text='<%#: Bind("OFF_CLOCK_TIME") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="DATE" HeaderText="歸屬日期" SortExpression="DATE" meta:resourcekey="BoundFieldResource7" DataFormatString="{0:d}"  >
                        <HeaderStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="原因" InsertVisible="False" meta:resourcekey="TemplateFieldResource3" >
                            <ItemTemplate>
                                <asp:Label ID="lblReason" runat="server" Text='<%#: Bind("CURRENT_DOC") %>' meta:resourcekey="lblReasonResource1" ></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="單據狀態" SortExpression="STATUS" meta:resourcekey="TemplateFieldResource4" >
                            <EditItemTemplate>
                                <asp:TextBox ID="txtStatus" runat="server" Text='<%#: Bind("STATUS") %>' meta:resourcekey="txtStatusResource1" ></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%#: Bind("STATUS") %>' meta:resourcekey="lblStatusResource1" ></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                    </Columns>
                </Ede:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hidIsExporting" runat="server" Value="N" />
    <asp:Label ID="lblLeftTitle" runat="server" Text="內部組織結構列表" Visible="False" meta:resourcekey="lblLeftTitleResource1" ></asp:Label>
    <asp:Label ID="lblSigning" runat="server" Text="簽核中" Visible="False" meta:resourcekey="lblSigningResource1" ></asp:Label>
    <asp:Label ID="lblAdopt" runat="server" Text="通過" Visible="False" meta:resourcekey="lblAdoptResource1" ></asp:Label>
    <asp:Label ID="lblReject" runat="server" Text="否決" Visible="False" meta:resourcekey="lblRejectResource1" ></asp:Label>
    <asp:Label ID="lblCancel" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblCancelResource1" ></asp:Label>  
    <asp:Label ID="lblClear" runat="server" Text="清空刷卡資料" Visible="False" meta:resourcekey="lblClearResource1" ></asp:Label>
    <asp:Label ID="lblRenew" runat="server" Text="補刷卡" Visible="False" meta:resourcekey="lblRenewResource1" ></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
