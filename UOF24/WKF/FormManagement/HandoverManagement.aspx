<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" CodeBehind="HandoverManagement.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.HandoverManagement" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            OnRbFormStatusClick();
        });

        function OnRbFormStatusClick() {
            var rbApproving = $("#<%=rbApproving.ClientID%>");
            var rbSigned = $("#<%=rbSigned.ClientID%>");
            var dateSignStart = $find("<%=dateSignStart.ClientID%>");
            var dateSignEnd = $find("<%=dateSignEnd.ClientID%>");

            if (rbApproving[0].checked) {
                dateSignStart.set_enabled(false);
                dateSignEnd.set_enabled(false);
            }
            if (rbSigned[0].checked) {
                dateSignStart.set_enabled(true);
                dateSignEnd.set_enabled(true);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick">
        <Tabs>
            <telerik:RadTab runat="server" Text="依申請者" Value="byApplicant" PageViewID="RadPageApplicant" meta:resourcekey="RadPageApplicantResource1">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="依簽核者" Value="bySigner" PageViewID="RadPageSigner" meta:resourcekey="RadPageSignerResource1">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:CheckBox ID="chbDisplayAllDept" runat="server" Text="顯示已停用部門" Visible="False" AutoPostBack="True" OnCheckedChanged="chbDisplayAllDept_CheckedChanged" meta:resourcekey="chbDisplayAllDeptResource1" />
    <telerik:RadTreeView ID="UC_DEPTREE" runat="server" EnableNodeTextHtmlEncoding="True" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">

    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
        <telerik:RadPageView runat="server" ID="RadPageApplicant">
            <telerik:RadToolBar ID="radToolbar" runat="server" OnButtonClick="radToolbar_ButtonClick" Width="100%">
                <Items>
                    <telerik:RadToolBarButton Value="checkbox" runat="server">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbIncludeMinor" runat="server" Text="包含子部門" meta:resourcekey="cbIncludeMinorResource1"/>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="search" Text="查詢" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="tbSearchResource1"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>

            <table class="PopTable">
                <tr>
                    <td style="width: 15%">
                        <asp:Label ID="lblFormCategory" runat="server" Text="表單類別" meta:resourcekey="lblFormCategoryResource1"></asp:Label>
                    </td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlFormCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlApplyFormCategory_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                    <td style="width: 15%">
                        <asp:Label ID="lblFormName" runat="server" Text="表單名稱" meta:resourcekey="lblFormNameResource1"></asp:Label>
                    </td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlFormName" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%">
                        <asp:Label ID="lblApplyDateStart" runat="server" Text="申請日期(起)" meta:resourcekey="lblApplyDateStartResource1"></asp:Label>
                    </td>
                    <td style="width: 35%">
                        <telerik:RadDatePicker ID="dateStart" runat="server"></telerik:RadDatePicker>
                    </td>
                    <td style="width: 15%">
                        <asp:Label ID="lblApplyDateEnd" runat="server" Text="申請日期(訖)" meta:resourcekey="lblApplyDateEndResource1"></asp:Label>
                    </td>
                    <td style="width: 35%">
                        <telerik:RadDatePicker ID="dateEnd" runat="server"></telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%">
                        <asp:Label ID="lblApplicant" runat="server" Text="申請者" meta:resourcekey="lblApplicantResource1"></asp:Label>
                    </td>
                    <td style="width: 35%">
                        <asp:TextBox ID="txtApplicant" runat="server"></asp:TextBox>
                    </td>
                    <td style="width: 15%">
                        <asp:Label ID="lblFormStatus" runat="server" Text="表單狀態" meta:resourcekey="lblFormStatusResource1"></asp:Label>
                    </td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlFormStatus" runat="server">
                            <asp:ListItem Value="All" Text="全部" meta:resourcekey="AllResource1"></asp:ListItem>
                            <asp:ListItem Value="Approved" Text="結案(通過)" meta:resourcekey="ApprovedResource1"></asp:ListItem>
                            <asp:ListItem Value="Denied" Text="結案(否決)" meta:resourcekey="DeniedResource1"></asp:ListItem>
                            <asp:ListItem Value="Processing" Text="處理中" meta:resourcekey="ProcessingResource1"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>


            <asp:UpdatePanel ID="updatePanelApply" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                        CustomDropDownListPage="False" DataKeyNames="APPLICANT_GUID" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                        EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="Grid1Resource3"
                        OnPageIndexChanging="Grid1_PageIndexChanging" OnRowDataBound="Grid1_RowDataBound" OnSorting="Grid1_Sorting" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" Width="100%">
                        <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="帳號" meta:resourceKey="TemplateField1Resource1" ShowHeader="False" SortExpression="ACCOUNT">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccount" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="姓名" meta:resourceKey="TemplateField2Resource1" SortExpression="USER_NAME">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="員編" meta:resourceKey="TemplateField3Resource1" SortExpression="EMPNO">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployeeNo" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="部門" meta:resourceKey="TemplateField4Resource1" SortExpression="USER_GROUP_NAME">
                                <ItemTemplate>
                                    <asp:Label ID="lblDepartment" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="表單類別" meta:resourceKey="TemplateField5Resource1" SortExpression="CATEGORY_NAME">
                                <ItemTemplate>
                                    <asp:Label ID="lblGridFormCategory" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="表單名稱" meta:resourceKey="TemplateField6Resource1" SortExpression="FORM_NAME">
                                <ItemTemplate>
                                    <asp:Label ID="lblGridFormName" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="表單數量" meta:resourceKey="TemplateField7Resource1" SortExpression="TASK_COUNT">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnCount" runat="server" CausesValidation="False" CommandName="lbtnHR"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle Wrap="False" />
                    </Fast:Grid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageSigner">
            <telerik:RadToolBar ID="radToolbarSign" runat="server" OnButtonClick="radToolbarSign_ButtonClick" Width="100%">
                <Items>
                    <telerik:RadToolBarButton Value="checkbox" runat="server">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbIncludeMinor" runat="server" Text="包含子部門" meta:resourcekey="cbIncludeMinorResource1" />
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="search" Text="查詢" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="tbSearchResource1"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>

            <table class="PopTable">
                <tr>
                    <td style="width: 15%">
                        <asp:Label ID="lblSignFormCate" runat="server" Text="表單類別" meta:resourcekey="lblFormCategoryResource1"></asp:Label>
                    </td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlSignFormCate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSignFormCategory_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                    <td style="width: 15%">
                        <asp:Label ID="lblSignFormName" runat="server" Text="表單名稱" meta:resourcekey="lblFormNameResource1"></asp:Label>
                    </td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlSignFormName" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%">
                        <asp:Label ID="lblSignFormStatus" runat="server" Text="表單狀態" meta:resourcekey="lblFormStatusResource1"></asp:Label>
                    </td>
                    <td style="width: 35%" colspan="3">
                        <table>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rbApproving" runat="server" Text="待簽表單" GroupName="formStatus" Checked="true" onclick="OnRbFormStatusClick()"  meta:resourcekey="rbApprovingResource1"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rbSigned" runat="server" Text="已簽核表單，簽核日期" GroupName="formStatus" onclick="OnRbFormStatusClick()"  meta:resourcekey="rbSignedResource1"/>
                                    <telerik:RadDatePicker ID="dateSignStart" runat="server"></telerik:RadDatePicker>
                                    ~
                                    <telerik:RadDatePicker ID="dateSignEnd" runat="server"></telerik:RadDatePicker>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%">
                        <asp:Label ID="lblSigner" runat="server" Text="簽核者" meta:resourcekey="lblSignerResource1"></asp:Label>
                    </td>
                    <td style="width: 35%" colspan="3">
                        <asp:TextBox ID="txtSigner" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <asp:UpdatePanel ID="updatePanelSigned" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <Fast:Grid ID="gridSignedForm" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                        CustomDropDownListPage="False" DataKeyNames="SIGNER_GUID" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                        EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="Grid1Resource3"
                        OnPageIndexChanging="gridSignedForm_PageIndexChanging" OnRowDataBound="gridSignedForm_RowDataBound" OnSorting="gridSignedForm_Sorting" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" Width="100%">
                        <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="帳號" meta:resourceKey="TemplateField1Resource1" ShowHeader="False" SortExpression="ACCOUNT">
                                <ItemTemplate>
                                    <asp:Label ID="lblAccount" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="姓名" meta:resourceKey="TemplateField2Resource1" SortExpression="NAME">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="員編" meta:resourceKey="TemplateField3Resource1" SortExpression="EMPNO">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployeeNo" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="部門" meta:resourceKey="TemplateField4Resource1" SortExpression="USER_GROUP_ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblDepartment" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="表單類別" meta:resourceKey="TemplateField5Resource1" SortExpression="CATEGORY_NAME">
                                <ItemTemplate>
                                    <asp:Label ID="lblGridFormCategory" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="表單名稱" meta:resourceKey="TemplateField6Resource1" SortExpression="FORM_NAME">
                                <ItemTemplate>
                                    <asp:Label ID="lblGridFormName" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="表單數量" meta:resourceKey="TemplateField7Resource1" SortExpression="TASK_COUNT">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnCount" runat="server" CausesValidation="False" CommandName="lbtnHR"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle Wrap="False" />
                    </Fast:Grid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
    </telerik:RadMultiPage>

    <asp:Label ID="lblAll" runat="server" meta:resourcekey="AllResource1" Text="全部" Visible="False"></asp:Label>
    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="內部組織結構列表" Visible="False"></asp:Label>
    <asp:Label ID="lblApplyTitle" runat="server" Text="申請表單指定交接人員" visible="False" meta:resourcekey="lblApplyTitleResource1" ></asp:Label>
    <asp:Label ID="lblSignedTitle" runat="server" Text="簽核表單指定交接人員" visible="False" meta:resourcekey="lblSignedTitleResource1" ></asp:Label>
</asp:Content>
