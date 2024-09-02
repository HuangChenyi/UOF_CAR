<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocLend_DocLendLog" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocLendLog.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadTabStrip ID="uwtLendTab" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage1">
                <Tabs>
                    <telerik:RadTab runat="server" Text="目前調閱中" meta:resourcekey="TabResource1">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="調閱歷程" meta:resourcekey="TabResource2">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0">
                <telerik:RadPageView runat="server" ID="RadPageView1">
                    <Fast:Grid ID="gridNowLend" runat="server" AutoGenerateCheckBoxColumn="False" Width="100%" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
                        EnhancePager="True" PageSize="15" OnRowDataBound="gridNowLend_RowDataBound" AllowPaging="True" OnSorting="gridNowLend_Sorting"  DefaultSortDirection="Ascending" EmptyDataText="No data found" KeepSelectedRows="False"  >
                        <EnhancePagerSettings
                            ShowHeaderPager="True" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:BoundField DataField="DOC_VERSION" HeaderText="版本" SortExpression="DOC_VERSION" meta:resourcekey="BoundFieldResource1">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="35px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="調閱者" SortExpression="LEND_USER" meta:resourcekey="TemplateFieldResource1">
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" Text='<%# Bind("LEND_USER") %>' ID="TextBox1" ></asp:TextBox>

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Bind("LEND_USER") %>' ID="lblLendUsering" ></asp:Label>

                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="調閱開始" SortExpression="LEND_START" meta:resourcekey="TemplateFieldResource2">
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" Text='<%# Bind("LEND_START") %>' ID="TextBox4" ></asp:TextBox>

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" Text="" ID="labLendStart" ></asp:Label>

                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="70px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="調閱結束" SortExpression="LEND_END" meta:resourcekey="TemplateFieldResource3">
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" Text='<%# Bind("LEND_END") %>' ID="TextBox5" ></asp:TextBox>

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" Text="" ID="labLendEnd" ></asp:Label>

                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="70px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="調閱理由" meta:resourcekey="TemplateFieldResource13">
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" Text='<%# Bind("LEND_REASON") %>' ID="TextBox6"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <span style="word-break: break-all; width: 260px;">
                                        <asp:Label runat="server" Text='<%# Bind("LEND_REASON") %>' ID="Label1"></asp:Label></span>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                <ItemStyle Width="260px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="審核結果" SortExpression="APPROVE_STATUS" meta:resourcekey="TemplateFieldResource4">
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" Text='<%# Bind("APPROVE_STATUS") %>' ID="TextBox3"></asp:TextBox>

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Bind("APPROVE_STATUS") %>' ID="lblApproveStatusing"></asp:Label>

                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle ForeColor="#FF8000" Width="70px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="申請日" SortExpression="ADD_TIME" meta:resourcekey="BoundFieldResource3">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text="" ID="lblAddTime"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="100px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="流程" meta:resourcekey="TemplateFieldResource5">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbtnShowFlow" runat="server" ></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle Height="30px" />
                    </Fast:Grid>
                </telerik:RadPageView>
                <telerik:RadPageView runat="server" ID="RadPageView2">
                    <Fast:Grid ID="gridLendHistory" runat="server" AutoGenerateCheckBoxColumn="False" Width="100%"
                        AllowSorting="True" DataKeyOnClientWithCheckBox="False"
                        EnhancePager="True" PageSize="15" AutoGenerateColumns="False"
                        OnRowDataBound="gridLendHistory_RowDataBound" AllowPaging="True" OnSorting="gridLendHistory_Sorting"  DefaultSortDirection="Ascending" EmptyDataText="No data found" KeepSelectedRows="False"  >
                        <EnhancePagerSettings
                            ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:BoundField DataField="DOC_VERSION" HeaderText="版本" SortExpression="DOC_VERSION" meta:resourcekey="TemplateFieldResource12">
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="35px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="調閱者" SortExpression="LEND_USER" meta:resourcekey="TemplateFieldResource6">
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" Text='<%# Bind("LEND_USER") %>' ID="TextBox7"></asp:TextBox>

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Bind("LEND_USER") %>' ID="lblLendUsered"></asp:Label>

                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="調閱開始" SortExpression="LEND_START" meta:resourcekey="TemplateFieldResource9">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("LEND_START") %>' ></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="labHisStart" runat="server" Text="" ></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="70px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="調閱結束" SortExpression="LEND_END" meta:resourcekey="TemplateFieldResource10">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("LEND_END") %>' ></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="labHisEnd" runat="server" Text="" ></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="70px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="調閱理由" meta:resourcekey="TemplateFieldResource13">
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" Text='<%# Bind("LEND_REASON") %>' ID="TextBox10"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <span style="word-break: break-all; width: 260px;">
                                        <asp:Label runat="server" Text='<%# Bind("LEND_REASON") %>' ID="Label2"></asp:Label></span>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="260px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="審核結果" SortExpression="APPROVE_STATUS" meta:resourcekey="TemplateFieldResource7">
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" Text='<%# Bind("APPROVE_STATUS") %>' ID="TextBox11"></asp:TextBox>

                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Bind("APPROVE_STATUS") %>' ID="lblApproveStatused"></asp:Label>

                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="70px" Wrap="False"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="申請日" SortExpression="ADD_TIME" meta:resourcekey="BoundFieldResource6">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text="" ID="lblHisAddTime"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="100px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="流程" meta:resourcekey="TemplateFieldResource8">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox12" runat="server" ></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbtnHisFlow" runat="server" ></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle Height="30px" />
                    </Fast:Grid>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblApproving" runat="server" meta:resourcekey="lblApprovingResource1" Text="調閱審核中" Visible="False"></asp:Label>
    <asp:Label ID="lblAccept" runat="server" meta:resourcekey="lblAcceptResource1" Text="允許調閱" Visible="False"></asp:Label>
    <asp:Label ID="lblDeny" runat="server" meta:resourcekey="lblDenyResource1" Text="拒絕調閱" Visible="False"></asp:Label>
    <asp:Label ID="labLendFlow" runat="server" Text="調閱流程" Visible="False" meta:resourcekey="labLendFlowResource1"></asp:Label>
    <asp:Label ID="labLendOverDue" runat="server" Text="調閱過期" Visible="False" meta:resourcekey="labLendOverDueResource"></asp:Label>
    <asp:Label ID="lblCancel" runat="server" Text="調閱取消" Visible="False" meta:resourcekey="labLendCancelesource"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
