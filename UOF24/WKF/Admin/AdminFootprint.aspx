<%@ Page Title="管理員觀看表單記錄" meta:resourcekey="PageResource1" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="AdminFootprint.aspx.cs" Inherits="WKF_Admin_AdminFootprint" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        /* 隱藏Grid內的欄位 */
        .cssHidden {
            display: none;
        }
    </style>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick">
                <Tabs>
                    <telerik:RadTab runat="server" Value="View">
                    </telerik:RadTab>
                    
                    <telerik:RadTab runat="server" Value="Set">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
                                
            <telerik:RadMultiPage ID="rmpViewAndSet" runat="server" SelectedIndex="0" >
                <telerik:RadPageView ID="rpvView" Selected="True" runat="server" >
                    <telerik:RadToolBar ID="rtbView" runat="server" OnButtonClick="rtbView_ButtonClick" Width="100%" SingleClick="None">
                        <Items>
                            <telerik:RadToolBarButton Text="查詢" Value="Query" runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="sKeyword" />
                        </Items>
                    </telerik:RadToolBar>
                    <table class="PopTable">
                        <tr>
                            <td>
                                <asp:Label ID="lblViewTime" runat="server" Text="觀看時間" meta:resourcekey="viewTimeResource1"></asp:Label>
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rdpViewStartDate" runat="server"></telerik:RadDatePicker>
                                <asp:Label ID="Label5" runat="server" Text="~"></asp:Label>
                                <telerik:RadDatePicker ID="rdpViewEndDate" runat="server"></telerik:RadDatePicker>
                            </td>
                                                        <td>
                                <asp:Label ID="lblViewUser" runat="server" Text="觀看人員" meta:resourcekey="viewUserResource1"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSearchViewUser" Width="400px" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <Ede:Grid ID="grdView" runat="server" Width="100%" DataKeyNames="LOG_GUID"
                        EmptyDataText="沒有資料" PageSize="15" EnhancePager="True" AutoGenerateColumns="False"
                        AllowPaging="True" AllowSorting="True" 
                        AutoGenerateCheckBoxColumn="False" 
                        OnSorting="grdView_Sorting" 
                        OnRowDataBound="grdView_RowDataBound"
                        OnBeforeExport="grdView_BeforeExport"
                        OnPageIndexChanging="grdView_PageIndexChanging"
                        DefaultSortColumnName="VIEW_DATETIME" DefaultSortDirection="Descending" CustomDropDownListPage="False" 
                        DataKeyOnClientWithCheckBox="False" KeepSelectedRows="False" 
                        SelectedRowColor="" UnSelectedRowColor="">
                        <ExportExcelSettings AllowExportToExcel="True"/>
                        <EnhancePagerSettings ShowHeaderPager="True"/>
                        <HeaderStyle Wrap="False"/>
                        <Columns>
                            <asp:BoundField DataField="LOG_GUID" HeaderText="LOG代碼hidden">
                                <HeaderStyle CssClass="cssHidden" />
                                <ItemStyle CssClass="cssHidden" />
                            </asp:BoundField>
                                                        
                            <asp:BoundField DataField="FORM_ID" HeaderText="表單代碼hidden" SortExpression="FORM_ID">
                                <HeaderStyle CssClass="cssHidden" />
                                <ItemStyle CssClass="cssHidden" />
                            </asp:BoundField>
                                                                       
                            <asp:BoundField DataField="FORM_NAME" HeaderText="表單名稱" SortExpression="FORM_NAME" meta:resourcekey="bfFormNameResource1">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:BoundField>

                            <asp:BoundField DataField="TASK_ID" HeaderText="表單工作代碼hidden">
                                <HeaderStyle CssClass="cssHidden" />
                                <ItemStyle CssClass="cssHidden" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="表單編號" SortExpression="DOC_NBR" meta:resourcekey="tfDocNbrResource1">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDocNbr" runat="server"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>            
                                                        
                            <asp:TemplateField HeaderText="觀看人員" SortExpression="VIEW_USER_NAME" meta:resourcekey="tfViewUserResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblViewUserName" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                                                        
                            <asp:TemplateField HeaderText="觀看時間" SortExpression="VIEW_DATETIME" meta:resourcekey="tfViewTimeResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblViewDateTime" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="VIEW_FROM" HeaderText="登入IP" SortExpression="VIEW_FROM" meta:resourcekey="bfViewFormResource1">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                    </Ede:Grid>
                </telerik:RadPageView>

                <telerik:RadPageView ID="rpvSet" runat="server" >
                    <uc1:UC_ChoiceList ID="uc_ChoiceList" runat="server" ExpandToUser="true" ShowMember="False" />
                </telerik:RadPageView>
            </telerik:RadMultiPage>
            <asp:Label ID="lblViewFormLog" runat="server" Text="觀看記錄" Visible="False" meta:resourcekey="lblViewFormLogResource1"></asp:Label>
            <asp:Label ID="lblAuthorizationLevelSetUp" runat="server" Text="權限設定" Visible="False" meta:resourcekey="lblAuthorizationLevelSetUpResource1"></asp:Label>
            <asp:Label ID="lblView" runat="server" Text="觀看" Visible="False" meta:resourcekey="lblViewResource1"></asp:Label>
            
            <asp:HiddenField ID="hfViewPageIndex" runat="server" Value="0" />
            <asp:HiddenField ID="hfNowSortColumnName" runat="server" />
            <asp:HiddenField ID="hfNowSortDirection" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>