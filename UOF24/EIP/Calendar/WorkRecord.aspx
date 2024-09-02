<%@ Page Title="工作回報歷程" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_WorkRecord" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="WorkRecord.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab runat="server" Text="工作回報歷程" Value="workhistory" PageViewID="pageView1" meta:resourcekey="RadTabResource1"></telerik:RadTab>
            <telerik:RadTab runat="server" Text="審核意見" Value="examinelog" PageViewID="pageView2" Visible="false" meta:resourcekey="RadTabResource2"></telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" Width="100%">
        <telerik:RadPageView ID="pageView1" runat="server">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                        AutoGenerateColumns="False"
                        AllowPaging="True"
                        Width="100%"
                        OnRowDataBound="Grid1_RowDataBound"
                        DataKeyOnClientWithCheckBox="False"
                        DefaultSortDirection="Ascending" EnhancePager="True" PageSize="15"
                        OnPageIndexChanging="Grid1_PageIndexChanging" KeepSelectedRows="False"
                        meta:resourcekey="Grid1Resource1" EmptyDataText="No data found">
                        <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                        <Columns>
                            <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("WORK_STATE") %>' meta:resourcekey="lblStatusResource1"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("WORK_STATE") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle Width="100px" Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="說明" meta:resourcekey="BoundFieldResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblDesc" runat="server" Style="word-wrap: normal; word-break: break-word;"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="True" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="時間" meta:resourcekey="BoundFieldResource2">
                                <ItemTemplate>
                                    <asp:Label ID="lblCreateTime" runat="server"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="140px" Wrap="False" />
                                <ItemStyle Width="140px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="附件" meta:resourcekey="BoundFieldResource4">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                        </Columns>
                    </Fast:Grid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView ID="pageView2" runat="server">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <Fast:Grid ID="grdExamineLog" runat="server" AutoGenerateCheckBoxColumn="false" AutoGenerateColumns="false" AllowPaging="True"
                        Width="100%" DataKeyOnClientWithCheckBox="False"
                        DefaultSortDirection="Ascending" DefaultSortColumnName="CREATE_DATE"
                        EnhancePager="True" PageSize="15"
                        EmptyDataText="沒有資料" OnRowDataBound="grdExamineLog_RowDataBound" OnPageIndexChanging="grdExamineLog_PageIndexChanging"
                        OnSorting="grdExamineLog_Sorting" meta:resourcekey="grdExamineLogResource1">
                        <Columns>
                            <asp:TemplateField HeaderText="審核者" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:Label ID="lblCreator" runat="server" meta:resourcekey="lblCreatorResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="100px" Wrap="false" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="COMMENT" HeaderText="審核意見" meta:resourcekey="BoundFieldResource3">
                                <HeaderStyle Width="100px" Wrap="false" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="審核時間" SortExpression="CREATE_DATE" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <asp:Label ID="lblCreateDate" runat="server" meta:resourcekey="lblCreateDateResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="100px" Wrap="false" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="審核狀態" meta:resourcekey="TemplateFieldResource4">
                                <ItemTemplate>
                                    <asp:Label ID="lblExamineStatus" runat="server" meta:resourcekey="lblExamineStatusResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="100px" Wrap="false" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                    </Fast:Grid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
    </telerik:RadMultiPage>

    <asp:Label ID="lblApprove" runat="server" Text="同意" Visible="False" meta:resourcekey="lblApproveResource1"></asp:Label>
    <asp:Label ID="lblDeny" runat="server" Text="拒絕" Visible="False" meta:resourcekey="lblDenyResource1"></asp:Label>
    <asp:Label ID="lblProceeding" runat="server" Text="進行中" Visible="False"
        meta:resourcekey="lblProceedingResource1"></asp:Label>
    <asp:Label ID="lblCompleted" runat="server" Text="完成" Visible="False" meta:resourcekey="lblCompletedResource1"></asp:Label>
</asp:Content>


