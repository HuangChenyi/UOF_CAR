<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="WKF_Reader_SetFormFieldDisplay" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" Codebehind="SetFormFieldDisplay.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" Runat="Server">
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="1" Width="100%" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick" meta:resourcekey="RadTabStrip1Resource1">
        <Tabs>
            <telerik:RadTab runat="server" Value="FormAdmin" Text="表單查閱者查詢" meta:resourcekey="RadTabResource3" >
            </telerik:RadTab>
            <telerik:RadTab runat="server" Value="FormSet" Text="表單欄位顯示設定" Selected="True" meta:resourcekey="RadTabResource2">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" Runat="Server">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" RenderMode="Inline" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadTreeView ID="treeFormList" runat="server"
                OnNodeClick="treeFormList_NodeClick" meta:resourcekey="treeFormListResource1">
            </telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="tbbg01" style="border: 0; width: 100%; height: 100%; text-align: left;">
        <tr>
            <td valign="top" width="100%" style="text-align: left;">
                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%">
                    <Items>
                        <telerik:RadToolBarButton Value="checkbox">
                            <ItemTemplate>
                                &nbsp;
                                <asp:CheckBox ID="cbIncludeFormCTL" runat="server" Text="包含停用表單" AutoPostBack="true" OnCheckedChanged="cbIncludeFormCTL_CheckedChanged" meta:resourcekey="cbIncludeFormCTLResource1" />
                                &nbsp;
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton>
                            <ItemTemplate>
                                &nbsp;
                                <asp:Label ID="lblMassage" runat="server" Text="設定好的欄位，會顯示在表單查閱者的查詢結果中。"
                                    CssClass="SizeMemo" meta:resourcekey="lblMassageResource2"></asp:Label>
                            </ItemTemplate>
                        </telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>
                <asp:UpdatePanel ID="UpdatePanelGrid" runat="server" UpdateMode="Conditional" RenderMode="Inline">
                    <ContentTemplate>
                        <asp:Panel ID="PanelDesignForm" runat="server" meta:resourcekey="PanelDesignFormResource1" Visible="False" Width="100%">
                            <table cellspacing="0" cellpadding="0" style="width: 100%; border: 0; text-align: left;">
                                <tbody style="vertical-align: top">
                                    <tr>
                                        <td style="height: 42px; text-align: left;">
                                            <table cellspacing="1" class="PopTable" width="100%" style="text-align: left">
                                                <colgroup class="PopTableLeftTD"></colgroup>
                                                <colgroup class="PopTableRightTD"></colgroup>
                                                <colgroup class="PopTableLeftTD"></colgroup>
                                                <colgroup class="PopTableRightTD"></colgroup>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblTitleFormType" runat="server" meta:resourcekey="lblTitleFormTypeResource1" Text="表單類別"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblFormTypeByForm" runat="server" meta:resourcekey="lblFormTypeByFormResource1"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <div style="text-align: left">
                                                <Fast:Grid ID="FormGrid" runat="server" AllowSorting="True"
                                                    AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                                                    DataKeyNames="FORM_ID"
                                                    Width="100%" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                                    EnhancePager="True" PageSize="15" EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="FormGridResource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                                    <ExportExcelSettings AllowExportToExcel="False" />
                                                    <Columns>
                                                        <asp:TemplateField meta:resourcekey="TemplateFieldResource1" Visible="False">
                                                            <EditItemTemplate>
                                                                <asp:Label ID="lblFormId2" runat="server" meta:resourceKey="lblFormId2Resource1" Text='<%#: Bind("FORM_ID") %>'></asp:Label>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFormId" runat="server" meta:resourceKey="lblFormIdResource1" Text='<%#: Bind("FORM_ID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource2">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkBtnFromName" runat="server" meta:resourceKey="LinkBtnFromNameResource1" Text='<%#: Bind("FORM_NAME") %>'></asp:LinkButton>
                                                                <itemstyle horizontalalign="Left" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="表單逾時" meta:resourcekey="TemplateFieldResource3">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox1" runat="server" meta:resourceKey="TextBox1Resource1"></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDELAY_HOUR" runat="server" meta:resourceKey="lblDELAY_HOURResource1" Text='<%#: Bind("DELAY_HOUR") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="表單停用" meta:resourcekey="TemplateFieldResource4">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox2" runat="server" meta:resourceKey="TextBox2Resource1"></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFORM_CTL" runat="server" meta:resourceKey="lblFORM_CTLResource1" Text='<%#: Bind("FORM_CTL") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField meta:resourcekey="TemplateFieldResource5" Visible="False">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox3" runat="server" meta:resourceKey="TextBox3Resource1" Text='<%#: Bind("VERSION_CNT") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="dgItemlblVersionCnt" runat="server" meta:resourceKey="dgItemlblVersionCntResource1" Text='<%#: Bind("VERSION_CNT") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </Fast:Grid>
                                            </div>
                                        </td>
                                        <td height="2px"></td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="height: 166px" valign="top">
                                            <br />
                                            &#160;</td>
                                    </tr>
                                </tbody>
                            </table>
                        </asp:Panel>

                        <asp:Panel ID="PanelDesignFormVersion" runat="server" meta:resourcekey="PanelDesignFormVersionResource1" Visible="False" Width="100%">
                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                <tbody>
                                    <tr>
                                        <td style="height: 65px; text-align: left">
                                            <table class="PopTable" cellspacing="1" style="width: 100%">
                                                <tbody>
                                                    <tr>
                                                        <td style="height: 11px" class="PopTableLeftTD">
                                                            <asp:Label ID="Label11" runat="server" meta:resourcekey="Label1Resource2" Text="表單類別"></asp:Label>
                                                        </td>
                                                        <td style="height: 11px" class="PopTableRightTD">
                                                            <asp:Label ID="lblFormVersion_formType" runat="server" meta:resourcekey="lblFormVersion_formTypeResource1"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 11px" class="PopTableLeftTD">
                                                            <asp:Label ID="lblFormName" runat="server" meta:resourcekey="lblFormNameResource1" Text="表單名稱"></asp:Label>
                                                        </td>
                                                        <td style="height: 11px" class="PopTableRightTD">
                                                            <asp:Label ID="lblFormVersion_formName" runat="server" meta:resourcekey="lblFormVersion_formNameResource1"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left">
                                            <Fast:Grid ID="FormVersionGrid" runat="server"
                                                Width="100%"
                                                OnRowDataBound="FormVersionGrid_RowDataBound"
                                                DataKeyNames="FORM_VERSION_ID" AutoGenerateColumns="False"
                                                AutoGenerateCheckBoxColumn="False"
                                                AllowSorting="True" DataKeyOnClientWithCheckBox="False"
                                                DefaultSortDirection="Ascending"
                                                EnhancePager="True" PageSize="15" EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="FormVersionGridResource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                                                <EnhancePagerSettings ShowHeaderPager="True" />
                                                <ExportExcelSettings AllowExportToExcel="False" />
                                                <Columns>
                                                    <asp:TemplateField Visible="False" meta:resourcekey="TemplateFieldResource6">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("FLOW_ID") %>' ID="TextBox4" meta:resourceKey="TextBox4Resource1"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("FLOW_ID") %>' ID="lblFLOW_ID" meta:resourceKey="lblFLOW_IDResource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField FooterText="[FORM_VERSION_ID]" Visible="False" meta:resourcekey="TemplateFieldResource7">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("FORM_VERSION_ID") %>' ID="TextBox5" meta:resourceKey="TextBox3Resource2"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("FORM_VERSION_ID") %>' ID="lblFORM_VERSION_ID" meta:resourceKey="lblFORM_VERSION_IDResource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="版本" HeaderStyle-HorizontalAlign="Center" meta:resourcekey="TemplateFieldResource8">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="linkBtnVERSION" Text='<%# Bind("VERSION") %>' meta:resourceKey="linkBtnVERSIONResource1"></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="狀態" HeaderStyle-HorizontalAlign="Center" meta:resourcekey="TemplateFieldResource9">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("ISSUE_CTL") %>' ID="TextBox6" meta:resourceKey="TextBox1Resource2"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("ISSUE_CTL") %>' ID="lblISSUE_CTL" meta:resourceKey="lblISSUE_CTLResource1"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="自動發佈時間" HeaderStyle-HorizontalAlign="Center" meta:resourcekey="TemplateFieldResource10">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblISSUE_TIME" ></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="禁止發表" Visible="False" meta:resourcekey="TemplateFieldResource11">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("IS_ALLOW_ISSUE") %>' ID="lblIS_ALLOW_ISSUE" meta:resourceKey="lblIS_ALLOW_ISSUEResource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </Fast:Grid>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </asp:Panel>

                        <Fast:Grid ID="Grid1" runat="server"
                                                Width="100%" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="FORM_ID"
                                                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                                EnhancePager="True" PageSize="15"  EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="Grid1Resource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""  >
                                                <EnhancePagerSettings ShowHeaderPager="True" />
                                                <ExportExcelSettings AllowExportToExcel="False" />
                                                <Columns>
                                                    <asp:TemplateField Visible="False" meta:resourcekey="TemplateFieldResource1">
                                                        <EditItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("FORM_ID") %>' ID="Label12" meta:resourceKey="lblFormId2Resource1"></asp:Label>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("FORM_ID") %>' ID="Label13" meta:resourceKey="lblFormIdResource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource2">
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="LinkButton1" Text='<%# Bind("FORM_NAME") %>' meta:resourceKey="LinkBtnFromNameResource1"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="表單逾時" meta:resourcekey="TemplateFieldResource3">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" ID="TextBox8" meta:resourceKey="TextBox1Resource1"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("DELAY_HOUR") %>' ID="Label14" meta:resourceKey="lblDELAY_HOURResource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="表單停用" meta:resourcekey="TemplateFieldResource4">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" ID="TextBox9" meta:resourceKey="TextBox2Resource1"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("FORM_CTL") %>' ID="Label15" meta:resourceKey="lblFORM_CTLResource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="False" meta:resourcekey="TemplateFieldResource5">
                                                        <EditItemTemplate>
                                                            <asp:TextBox runat="server" Text='<%# Bind("VERSION_CNT") %>' ID="TextBox10" meta:resourceKey="TextBox3Resource1"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" Text='<%# Bind("VERSION_CNT") %>' ID="Label16" meta:resourceKey="dgItemlblVersionCntResource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </Fast:Grid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblLeftTitle" runat="server" Text="負責表單列表" Visible="False" meta:resourcekey="lblLeftTitleResource1"></asp:Label>
    <asp:Label ID="lblNoBridle" runat="server" Text="不限制" Visible="False" meta:resourcekey="lblNoBridleResource1"></asp:Label>
    <asp:Label ID="lblPosted" runat="server" Text="已發佈" Visible="False" meta:resourcekey="lblPostedResource1"></asp:Label>
    <asp:Label ID="lblNoPost" runat="server" Text="未發佈" Visible="False" meta:resourcekey="lblNoPostResource1"></asp:Label>
    <asp:Label ID="lblNoAllowIssue" runat="server" Text="禁止發佈" Visible="False" meta:resourcekey="lblNoAllowIssueResource1"></asp:Label>
    <asp:Label ID="lblSetDisplayField" runat="server" Text="設定顯示欄位" Visible="False" meta:resourcekey="lblSetDisplayFieldResource1"></asp:Label>
    <asp:Label ID="lblSuspend" runat="server" Text="(停用)" Style="display: none" meta:resourcekey="lblSuspendResource1"></asp:Label>
</asp:Content>


