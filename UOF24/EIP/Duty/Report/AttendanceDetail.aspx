<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="AttendanceDetail.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.Report.AttendanceDetail" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" SingleClick="None" meta:resourcekey="RadToolBar1Resource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Value="userName" meta:resourcekey="RadToolBarButtonResource1">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text="人員" meta:resourcekey="Label3Resource1"></asp:Label>
                    <asp:TextBox ID="txtuserName" runat="server" Width="120px" meta:resourcekey="txtuserNameResource1"></asp:TextBox>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <table runat="server" id="usertb" style="width: 100%" class="PopTable">
        <tr runat="server">
            <td runat="server">
                <asp:Label ID="Label1" runat="server" Text="人員" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td runat="server">
                <asp:Label ID="lblUser" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table width="100%">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblLeaveTitle" runat="server" Text="請假" Font-Bold="True" meta:resourcekey="lblLeaveTitleResource1"></asp:Label>
                        <Ede:Grid ID="grdLeave" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" Width="100%"
                            AllowSorting="True" AllowPaging="True" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                            EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" SelectedRowColor="" PagerSettings-Position="Bottom"
                            UnSelectedRowColor="" OnRowDataBound="grdLeave_RowDataBound" OnPageIndexChanging="grdLeave_PageIndexChanging"
                            DefaultSortColumnName="APPLICANT_GROUP_ID_NAME" OnSorting="grdLeave_Sorting" meta:resourcekey="grdLeaveResource1" PageSize="15">
                            <EnhancePagerSettings ShowHeaderPager="False" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                            <Columns>
                                <asp:TemplateField HeaderText="部門" SortExpression="APPLICANT_GROUP_ID_NAME">
                                    <ItemTemplate>
                                        <asp:Label ID="lblGROUPName" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="姓名" SortExpression="APPLICANT_NAME">
                                    <ItemTemplate>
                                        <asp:Label ID="lblApplicantName" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="請假單號" DataField="DOC_NBR" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource2" ItemStyle-Wrap="false" ItemStyle-Width="10%">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="10%" Wrap="False" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="請假時間(起)" SortExpression="START_DATETIME" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLeaveStartDateTime" runat="server" Text='<%# Bind("START_DATETIME") %>' meta:resourcekey="lblLeaveStartDateTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" Width="15%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="請假時間(訖)" SortExpression="END_DATETIME" meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLeaveEndDateTime" runat="server" Text='<%# Bind("END_DATETIME") %>' meta:resourcekey="lblLeaveEndDateTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" Width="15%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="職務代理人" meta:resourcekey="TemplateFieldResource5">
                                    <ItemTemplate>
                                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceLeaveJobAgent" ShowMember="false" IsAllowEdit="false" />
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="UserGuid" DataField="APPLICANT" Visible="false" />
                            </Columns>
                        </Ede:Grid>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblTravelTitle" runat="server" Text="出差" Font-Bold="True" meta:resourcekey="lblTravelTitleResource1"></asp:Label>
                        <Ede:Grid ID="grdTravel" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" Width="100%"
                            AllowSorting="True" AllowPaging="True" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                            EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" SelectedRowColor=""
                            UnSelectedRowColor="" OnRowDataBound="grdTravel_RowDataBound" OnPageIndexChanging="grdTravel_PageIndexChanging"
                            DefaultSortColumnName="APPLICANT_GROUP_NAME" OnSorting="grdTravel_Sorting" meta:resourcekey="grdTravelResource1">
                            <EnhancePagerSettings ShowHeaderPager="False" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                            <Columns>
                                <asp:BoundField HeaderText="部門" DataField="APPLICANT_GROUP_NAME" SortExpression="APPLICANT_GROUP_NAME" meta:resourcekey="BoundFieldResource3" ItemStyle-Wrap="false">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="姓名" DataField="APPLICANT_NAME" SortExpression="APPLICANT_NAME" meta:resourcekey="TemplateFieldResource6" ItemStyle-Wrap="false">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="出差單號" DataField="DOC_NBR" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource7" ItemStyle-Wrap="false" ItemStyle-Width="10%">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="10%" Wrap="False" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="出差時間(起)" SortExpression="START_DATETIME" meta:resourcekey="TemplateFieldResource8">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTravelStartDateTime" runat="server" Text='<%# Bind("START_DATETIME") %>' meta:resourcekey="lblTravelStartDateTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" Width="15%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="出差時間(訖)" SortExpression="END_DATETIME" meta:resourcekey="TemplateFieldResource9">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTravelEndDateTime" runat="server" Text='<%# Bind("END_DATETIME") %>' meta:resourcekey="lblTravelEndDateTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" Width="15%" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="目的地" DataField="DESTINAION" SortExpression="DESTINAION" meta:resourcekey="BoundFieldResource1">
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Width="10%" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="職務代理人" meta:resourcekey="TemplateFieldResource10">
                                    <ItemTemplate>
                                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceTravelJobAgent" ShowMember="false" IsAllowEdit="false" />
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False"></HeaderStyle>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="UserGuid" DataField="APPLICANT" Visible="false" />
                            </Columns>
                        </Ede:Grid>
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="hfApplicant" runat="server" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
