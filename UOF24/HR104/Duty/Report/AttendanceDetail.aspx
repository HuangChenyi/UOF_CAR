<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master/DialogMasterPage.master" CodeBehind="AttendanceDetail.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Report.AttendanceDetail1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick" SingleClick="None" meta:resourcekey="RadToolBar1Resource1">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="userName" meta:resourcekey="RadToolBarButtonResource1">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text="關鍵字(姓名/員工編號/部門)" meta:resourcekey="Label3Resource1"></asp:Label>
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
                        <asp:Label ID="Label1" runat="server" Text="人員" meta:resourcekey="LabelResource1"></asp:Label>
                    </td>
                    <td runat="server">
                        <asp:Label ID="lblUser" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <table style="width:100%">
        <tr>
            <td colspan="2">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblLeaveTitle" runat="server" Text="請假" Font-Bold="True" meta:resourcekey="lblLeaveTitleResource1"></asp:Label>
                        <Ede:Grid ID="grdLeave" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" Width="100%" PageSize="10"
                            AllowSorting="True" AllowPaging="True" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                            EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" SelectedRowColor="" PagerSettings-Position="Bottom"
                            UnSelectedRowColor="" OnRowDataBound="grdLeave_RowDataBound" OnPageIndexChanging="grdLeave_PageIndexChanging"  meta:resourcekey="grdLeaveResource1"
                            DefaultSortColumnName="EMPLOYEE_NO" OnSorting="grdLeave_Sorting" >
                            <EnhancePagerSettings ShowHeaderPager="False"></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>                            
                            <Columns>
                                <asp:BoundField HeaderText="部門" DataField="DEPARTMENT_CNAME" SortExpression="DEPARTMENT_CNAME" ItemStyle-Wrap="false" ItemStyle-Width="250" meta:resourcekey="BoundFieldResource2"  />
                                <asp:BoundField HeaderText="姓名" DataField="EMPLOYEE_CNAME" SortExpression="EMPLOYEE_CNAME" meta:resourcekey="TemplateFieldResource1" ItemStyle-Wrap="false"/>
                                <asp:TemplateField HeaderText="請假時間(起)" SortExpression="ASK_LEAVE_START" meta:resourcekey="TemplateFieldResource3" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblLeaveStartDateTime" runat="server" Text='<%# Bind("ASK_LEAVE_START") %>' meta:resourcekey="lblLeaveStartDateTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" Width="25%"/>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="請假時間(訖)" SortExpression="ASK_LEAVE_END" meta:resourcekey="TemplateFieldResource4" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblLeaveEndDateTime" runat="server" Text='<%# Bind("ASK_LEAVE_END") %>' meta:resourcekey="lblLeaveEndDateTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" Width="25%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="職務代理人" meta:resourcekey="TemplateFieldResource5">
                                    <ItemTemplate>
                                       <asp:Label ID="lblLeaveJobAgent" runat="server" Text=""></asp:Label>
                                    </ItemTemplate>
                                     <ItemStyle Wrap="False" Width="15%"/>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="UserGuid" DataField="APPLICANT" Visible="false"/>
                            </Columns>
                        </Ede:Grid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblTravelTitle" runat="server" Text="出差" Font-Bold="True" meta:resourcekey="lblTravelTitleResource1"></asp:Label>
                        <Ede:Grid ID="grdTravel" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" Width="100%" PageSize="10"
                            AllowSorting="True" AllowPaging="True" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                            EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" SelectedRowColor=""
                            UnSelectedRowColor="" OnRowDataBound="grdTravel_RowDataBound" OnPageIndexChanging="grdTravel_PageIndexChanging"
                            DefaultSortColumnName="EMPLOYEE_NO" OnSorting="grdTravel_Sorting" meta:resourcekey="grdTravelResource1">
                            <EnhancePagerSettings ShowHeaderPager="False" ></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                            <Columns >
                                <asp:BoundField HeaderText="部門" DataField="DEPARTMENT_CNAME" SortExpression="DEPARTMENT_CNAME" ItemStyle-Wrap="false" ItemStyle-Width="250"  meta:resourcekey="BoundFieldResource3"/>
                                <asp:BoundField HeaderText="姓名" DataField="EMPLOYEE_CNAME" SortExpression="EMPLOYEE_CNAME" meta:resourcekey="TemplateFieldResource6"  ItemStyle-Wrap="false"/>                            
                                <asp:TemplateField HeaderText="出差時間(起)" SortExpression="ASK_LEAVE_START" meta:resourcekey="TemplateFieldResource8" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblTravelStartDateTime" runat="server" Text='<%# Bind("ASK_LEAVE_START") %>' meta:resourcekey="lblTravelStartDateTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" Width="25%"/>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="出差時間(訖)" SortExpression="ASK_LEAVE_END" meta:resourcekey="TemplateFieldResource9" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblTravelEndDateTime" runat="server" Text='<%# Bind("ASK_LEAVE_END") %>' meta:resourcekey="lblTravelEndDateTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Wrap="False" Width="25%"/>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="職務代理人" meta:resourcekey="TemplateFieldResource10">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTravelJobAgent" runat="server" Text=""></asp:Label>
                                    </ItemTemplate>
                                     <ItemStyle Wrap="False" Width="15%"/>
                                </asp:TemplateField>      
                                <asp:BoundField HeaderText="UserGuid" DataField="APPLICANT" Visible="false"/>                                                          
                            </Columns>
                        </Ede:Grid>
                    </ContentTemplate>
                </asp:UpdatePanel>                
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfApplicant" runat="server" />   
</asp:Content>
