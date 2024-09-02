<%@ Page Title="呼叫DLL狀態查詢" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="WKF_Admin_CallDllFormList" meta:resourcekey="PageResource1" Culture="auto" UICulture="auto" CodeBehind="CallDllFormList.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">

    <script type="text/javascript">
        function CompareDate(source, arguments) {
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" meta:resourceKey="UltraWebToolbar1Resource1" OnButtonClick="RadToolBar1_ButtonClick">
        <Items>
            <telerik:RadToolBarButton runat="server" Value="StartTime" ValidationGroup="rpdStartTime">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Label runat="server" Text="開始時間：" meta:resourceKey="TBLabelResource1"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker runat="server" ID="rpdStartTime"></telerik:RadDatePicker>
                                <asp:RequiredFieldValidator runat="server" ID="cvCheckStartTime" ErrorMessage="請輸入查詢日期(起)"
                                    Display="Dynamic" ForeColor="Red" meta:resourceKey="RequiredFieldValidator1Resource1" ControlToValidate="rpdStartTime"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:Label runat="server" Text="結束時間：" meta:resourceKey="TBLabelResource2"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rpdEndTime" runat="server"></telerik:RadDatePicker>
                                <asp:RequiredFieldValidator runat="server" ID="cvCheckEndTime" ErrorMessage="請輸入查詢日期(迄)"
                                    Display="Dynamic" ForeColor="Red" meta:resourceKey="RequiredFieldValidator2Resource1" ControlToValidate="rpdEndTime"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvTimeError" runat="server" ErrorMessage="結束時間需晚於開始時間"
                                    meta:resourcekey="cvTimeErrorResource1" ControlToValidate="rpdEndTime" Type="Date"
                                    Operator="GreaterThanEqual" ControlToCompare="rpdStartTime" Display="Dynamic"></asp:CompareValidator>
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
            <telerik:RadTreeView ID="treeFormList" runat="server"
                meta:resourcekey="treeFormListResource1">
            </telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td style="height: 100%" valign="top" width="80%" align="left">
                <table cellspacing="1" class="PopTable" width="100%">
                    <tr>
                        <td align="center" class="PopTableHeader" style="height: 21px; width: 100%">
                            <center>
                                <asp:Label ID="lblFormList" runat="server" Text="表單列表" meta:resourcekey="lblFormListResource1"></asp:Label></center>
                        </td>
                    </tr>
                </table>


                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage1">

                            <Tabs>
                                <telerik:RadTab runat="server" Selected="True" Text="起單查詢" meta:resourcekey="TabResource1">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="結案查詢" meta:resourcekey="TabResource2">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="狀態變更查詢" meta:resourcekey="TabResource3">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="簽核中查詢" meta:resourcekey="TabResource4">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="站點呼叫查詢" meta:resourcekey="TabResource5">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="表單取回查詢" meta:resourcekey="TabResource6">
                                </telerik:RadTab>
                                <telerik:RadTab runat="server" Text="副流程結束查詢"  meta:resourcekey="TabResource7">
                                </telerik:RadTab>
                            </Tabs>
                        </telerik:RadTabStrip>
                        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0">
                            <telerik:RadPageView runat="server" ID="RadPageView1">
                                <Fast:Grid ID="startFormGrid" runat="server" AutoGenerateCheckBoxColumn="True"
                                    OnRowDataBound="startFormGrid_RowDataBound" AllowSorting="True"
                                    AutoGenerateColumns="False"
                                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                    EnhancePager="True" PageSize="15"
                                    DataKeyNames="TASK_ID,SITE_ID"
                                    Width="800px" AllowPaging="True"
                                    OnPageIndexChanging="startFormGrid_PageIndexChanging"
                                    OnSorting="startFormGrid_Sorting" EmptyDataText="沒有資料"
                                    EnableModelValidation="True" KeepSelectedRows="False"
                                    meta:resourcekey="startFormGridResource1">
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="表單編號" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource1">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%#: Bind("DOC_NBR") %>'
                                                    meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDocNbrByStart" runat="server"
                                                    Text='<%#: Bind("DOC_NBR") %>'>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="表單名稱"
                                            meta:resourceKey="BoundFieldResource1">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFormname" runat="server" Text='<%#: Bind("FORM_NAME") %>'
                                                    meta:resourceKey="lblFormnameResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="USER_GUID" HeaderText="申請人" SortExpression="USER_GUID" meta:resourcekey="BoundField2Resource1" />
                                        <asp:TemplateField HeaderText="申請日期" meta:resourcekey="BoundField3Resource2" SortExpression="BEGIN_TIME">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStartFormBeginTime" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="STATUS" HeaderText="傳送狀態" SortExpression="STATUS" meta:resourcekey="BoundField4Resource1" />
                                        <asp:BoundField DataField="SEND_COUNT" HeaderText="傳送次數" meta:resourcekey="BoundField5Resource1" />
                                    </Columns>
                                </Fast:Grid>
                            </telerik:RadPageView>
                            <telerik:RadPageView runat="server" ID="RadPageView2">
                                <Fast:Grid ID="endFormGrid" runat="server" AutoGenerateCheckBoxColumn="True"
                                    AllowSorting="True"
                                    AutoGenerateColumns="False"
                                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                    EnhancePager="True" PageSize="15"
                                    DataKeyNames="TASK_ID,SITE_ID"
                                    OnRowDataBound="endFormGrid_RowDataBound" Width="800px" AllowPaging="True"
                                    OnPageIndexChanging="endFormGrid_PageIndexChanging"
                                    OnSorting="endFormGrid_Sorting" EmptyDataText="沒有資料"
                                    EnableModelValidation="True" KeepSelectedRows="False"
                                    meta:resourcekey="endFormGridResource1">
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="表單編號" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource2">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%#: Bind("DOC_NBR") %>'
                                                    meta:resourcekey="TextBox1Resource2"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDocNbrByEnd" runat="server"
                                                    Text='<%#: Bind("DOC_NBR") %>' meta:resourcekey="lbtnDocNbrByEndResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="表單名稱"
                                            meta:resourceKey="BoundFieldResource6">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFormname" runat="server" Text='<%#: Bind("FORM_NAME") %>'
                                                    meta:resourceKey="lblFormnameResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="USER_GUID" HeaderText="申請人" SortExpression="USER_GUID" meta:resourcekey="BoundField2Resource2" />
                                        <asp:TemplateField HeaderText="申請日期" meta:resourcekey="BoundField3Resource2" SortExpression="BEGIN_TIME">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEndFormBeginTime" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="STATUS" HeaderText="傳送狀態" SortExpression="STATUS" meta:resourcekey="BoundField4Resource2" />
                                        <asp:BoundField DataField="SEND_COUNT" HeaderText="傳送次數" meta:resourcekey="BoundField5Resource2" />
                                    </Columns>
                                </Fast:Grid>
                            </telerik:RadPageView>
                            <telerik:RadPageView runat="server" ID="RadPageView3">
                                <Fast:Grid ID="changeFormGrid" runat="server" AutoGenerateCheckBoxColumn="True"
                                    AllowSorting="True"
                                    AutoGenerateColumns="False"
                                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                    EnhancePager="True" PageSize="15"
                                    DataKeyNames="TASK_ID,SITE_ID"
                                    OnRowDataBound="changeFormGrid_RowDataBound" Width="800px"
                                    AllowPaging="True" OnPageIndexChanging="changeFormGrid_PageIndexChanging"
                                    OnSorting="changeFormGrid_Sorting" EmptyDataText="沒有資料"
                                    EnableModelValidation="True" KeepSelectedRows="False"
                                    meta:resourcekey="changeFormGridResource1">
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="表單編號" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource3">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%#: Bind("DOC_NBR") %>'
                                                    meta:resourcekey="TextBox1Resource3"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDocNbrByChange" runat="server"
                                                    Text='<%#: Bind("DOC_NBR") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="表單名稱"
                                            meta:resourceKey="BoundFieldResource11">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFormname" runat="server" Text='<%#: Bind("FORM_NAME") %>'
                                                    meta:resourceKey="lblFormnameResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="USER_GUID" HeaderText="申請人" SortExpression="USER_GUID" meta:resourcekey="BoundField2Resource3" />
                                        <asp:TemplateField HeaderText="申請日期" meta:resourcekey="BoundField3Resource3" SortExpression="BEGIN_TIME">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChangeFormBeginTime" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="STATUS" HeaderText="傳送狀態" SortExpression="STATUS" meta:resourcekey="BoundField4Resource3" />
                                        <asp:BoundField DataField="SEND_COUNT" HeaderText="傳送次數" meta:resourcekey="BoundField5Resource3" />
                                    </Columns>
                                </Fast:Grid>
                            </telerik:RadPageView>
                            <telerik:RadPageView runat="server" ID="RadPageView4">
                                <Fast:Grid ID="signFormGrid" runat="server" AutoGenerateCheckBoxColumn="True"
                                    AllowSorting="True"
                                    AutoGenerateColumns="False"
                                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                    EnhancePager="True" PageSize="15"
                                    DataKeyNames="TASK_ID,SITE_ID"
                                    Width="800px" AllowPaging="True"
                                    OnPageIndexChanging="signFormGrid_PageIndexChanging"
                                    OnRowDataBound="signFormGrid_RowDataBound"
                                    OnSorting="signFormGrid_Sorting" EmptyDataText="沒有資料"
                                    EnableModelValidation="True" KeepSelectedRows="False"
                                    meta:resourcekey="signFormGridResource1" HeaderStyle-Wrap="False">
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="表單編號" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource4">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server" Text='<%#: Bind("DOC_NBR") %>'
                                                    meta:resourcekey="TextBox1Resource4"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDocNbrBySign" runat="server"
                                                    Text='<%#: Bind("DOC_NBR") %>' meta:resourcekey="lbtnDocNbrBySignResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="表單名稱"
                                            meta:resourceKey="BoundField1Resource4">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFormname" runat="server" Text='<%#: Bind("FORM_NAME") %>'
                                                    meta:resourceKey="lblFormnameResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="USER_GUID" HeaderText="申請人" SortExpression="USER_GUID" meta:resourcekey="BoundField2Resource4" />
                                        <asp:TemplateField HeaderText="申請日期" meta:resourcekey="BoundField3Resource4" SortExpression="BEGIN_TIME">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSignFormBeginTime" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ACTUAL_SIGNER" HeaderText="簽核者" SortExpression="ACTUAL_SIGNER" meta:resourcekey="BoundField6Resource4" />
                                        <asp:BoundField DataField="SITE_CODE" HeaderText="站點代號" meta:resourcekey="BoundField7Resource4" />
                                        <asp:BoundField DataField="STATUS" HeaderText="傳送狀態" SortExpression="STATUS" meta:resourcekey="BoundField4Resource4" />
                                        <asp:BoundField DataField="SEND_COUNT" HeaderText="傳送次數" meta:resourcekey="BoundField5Resource4" />
                                    </Columns>
                                </Fast:Grid>
                            </telerik:RadPageView>
                            <telerik:RadPageView runat="server" ID="RadPageView5">
                                <Fast:Grid ID="siteFormGrid" runat="server" AutoGenerateCheckBoxColumn="True"
                                    AllowSorting="True"
                                    AutoGenerateColumns="False"
                                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                    EnhancePager="True" PageSize="15"
                                    DataKeyNames="TASK_ID,SITE_ID"
                                    Width="800px" AllowPaging="True"
                                    OnPageIndexChanging="siteFormGrid_PageIndexChanging"
                                    OnRowDataBound="siteFormGrid_RowDataBound"
                                    OnSorting="siteFormGrid_Sorting" EmptyDataText="沒有資料"
                                    EnableModelValidation="True" KeepSelectedRows="False"
                                    meta:resourcekey="siteFormGridResource1">
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="表單編號" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource5">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Bind("DOC_NBR") %>'
                                                    meta:resourcekey="TextBox1Resource5"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDocNbrBySite" runat="server"
                                                    Text='<%#: Bind("DOC_NBR") %>' meta:resourcekey="lbtnDocNbrBySiteResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="表單名稱"
                                            meta:resourceKey="BoundField1Resource5">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFormname" runat="server" Text='<%#: Bind("FORM_NAME") %>'
                                                    meta:resourceKey="lblFormnameResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="USER_GUID" HeaderText="申請人" SortExpression="USER_GUID" meta:resourcekey="BoundField2Resource5" />
                                        <asp:TemplateField HeaderText="申請日期" meta:resourcekey="BoundField3Resource5" SortExpression="BEGIN_TIME">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSiteFormBeginTime" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ACTUAL_SIGNER" HeaderText="簽核者" SortExpression="ACTUAL_SIGNER" meta:resourcekey="BoundField6Resource5" />
                                        <asp:BoundField DataField="SITE_CODE" HeaderText="站點代號" meta:resourcekey="BoundField7Resource5" />
                                        <asp:BoundField DataField="STATUS" HeaderText="傳送狀態" SortExpression="STATUS" meta:resourcekey="BoundField4Resource5" />
                                        <asp:BoundField DataField="SEND_COUNT" HeaderText="傳送次數" meta:resourcekey="BoundField5Resource5" />


                                    </Columns>
                                </Fast:Grid>
                            </telerik:RadPageView>
                            <telerik:RadPageView runat="server" ID="RadPageView6">
                                <Fast:Grid ID="getBackFormGrid" runat="server" AutoGenerateCheckBoxColumn="True"
                                    AllowSorting="True"
                                    AutoGenerateColumns="False"
                                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                    EnhancePager="True" PageSize="15"
                                    DataKeyNames="TASK_ID,SITE_ID"
                                    Width="800px" AllowPaging="True"
                                    OnPageIndexChanging="getBackFormGrid_PageIndexChanging"
                                    OnRowDataBound="getBackFormGrid_RowDataBound"
                                    OnSorting="getBackFormGrid_Sorting" EmptyDataText="沒有資料"
                                    EnableModelValidation="True" KeepSelectedRows="False"
                                    meta:resourcekey="getBackFormGridResource1" HeaderStyle-Wrap="False">
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="表單編號" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource6">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" Text='<%#: Bind("DOC_NBR") %>'
                                                    meta:resourcekey="TextBox1Resource6"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDocNbrByGetBack" runat="server"
                                                    Text='<%#: Bind("DOC_NBR") %>' meta:resourcekey="lbtnDocNbrByGetBackResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="表單名稱"
                                            meta:resourceKey="BoundField1Resource6">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFormname" runat="server" Text='<%#: Bind("FORM_NAME") %>'
                                                    meta:resourceKey="lblFormnameResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="USER_GUID" HeaderText="申請人" SortExpression="USER_GUID" meta:resourcekey="BoundField2Resource6" />
                                        <asp:TemplateField HeaderText="申請日期" meta:resourcekey="BoundField3Resource6" SortExpression="BEGIN_TIME">
                                            <ItemTemplate>
                                                <asp:Label ID="lblGetBackFormBeginTime" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="GETBACK_USER" HeaderText="取回人員" SortExpression="GETBACK_USER" meta:resourcekey="BoundField6Resource6" />
                                        <asp:BoundField DataField="SITE_CODE" HeaderText="站點代號" meta:resourcekey="BoundField7Resource6" />
                                        <asp:BoundField DataField="STATUS" HeaderText="傳送狀態" SortExpression="STATUS" meta:resourcekey="BoundField4Resource6" />
                                        <asp:BoundField DataField="SEND_COUNT" HeaderText="傳送次數" meta:resourcekey="BoundField5Resource6" />
                                    </Columns>
                                </Fast:Grid>
                            </telerik:RadPageView>
                            <telerik:RadPageView runat="server" ID="RadPageView7">
                                <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True"
                                    AllowSorting="True"
                                    AutoGenerateColumns="False"
                                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                    EnhancePager="True" PageSize="15"
                                    DataKeyNames="TASK_ID,SITE_ID"
                                    Width="800px" AllowPaging="True"
                                    OnPageIndexChanging="Grid1_PageIndexChanging"
                                    OnRowDataBound="Grid1_RowDataBound"
                                    OnSorting="Grid1_Sorting" EmptyDataText="沒有資料"
                                    EnableModelValidation="True" KeepSelectedRows="False" HeaderStyle-Wrap="False">
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="表單編號" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource6">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" Text='<%#: Bind("DOC_NBR") %>'
                                                    meta:resourcekey="TextBox1Resource6"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDocNbrByGetBack" runat="server"
                                                    Text='<%#: Bind("DOC_NBR") %>' meta:resourcekey="lbtnDocNbrByGetBackResource1"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="表單名稱"
                                            meta:resourceKey="BoundField1Resource6">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFormname" runat="server" Text='<%#: Bind("FORM_NAME") %>'
                                                    meta:resourceKey="lblFormnameResource1"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="USER_GUID" HeaderText="申請人" SortExpression="USER_GUID" meta:resourcekey="BoundField2Resource6" />
                                        <asp:TemplateField HeaderText="申請日期" meta:resourcekey="BoundField3Resource6" SortExpression="BEGIN_TIME">
                                            <ItemTemplate>
                                                <asp:Label ID="lblGetBackFormBeginTime" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="SUB_FLOW_NAME" HeaderText="副流程名稱" SortExpression="SUB_FLOW_NAME" />
                                        <asp:BoundField DataField="STATUS" HeaderText="傳送狀態" SortExpression="STATUS"  meta:resourcekey="BoundField4Resource6"/>
                                        <asp:BoundField DataField="SEND_COUNT" HeaderText="傳送次數" meta:resourcekey="BoundField5Resource6"/>
                                    </Columns>
                                </Fast:Grid>
                            </telerik:RadPageView>
                        </telerik:RadMultiPage>
                        <br />
                        <div style="text-align: center; width: 100%">
                            <asp:CustomValidator ID="cvNoCheckItem" runat="server" Display="Dynamic" ErrorMessage="請選擇欲傳送的項目"
                                Font-Size="X-Small" meta:resourcekey="cvNoCheckItemResource1" ForeColor="Red">
                            </asp:CustomValidator>
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
    <asp:Label ID="lblErrorMessage" runat="server" Text="錯誤訊息"
        Visible="False" meta:resourcekey="lblErrorMessageResource1"></asp:Label>
    <asp:Label ID="lblDllHistory" runat="server" Text="歷史記錄" Visible="False"
        meta:resourcekey="lblDllHistoryResource1"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="歷史記錄" Visible="False" meta:resourcekey="lblDllHistoryResource1"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="分類列表" meta:resourcekey="Label1Resource1" Visible="false"></asp:Label>
</asp:Content>






