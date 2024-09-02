<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master"
    AutoEventWireup="true" Inherits="WKF_FormUse_Superior_QueryFormBySuperior"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QueryFormBySuperior.aspx.cs" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Src="../UC_FormList.ascx" TagName="UC_FormList" TagPrefix="uc2" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <telerik:RadToolBar ID="webToolBar" runat="server" OnButtonClick="webToolBar_ButtonClick" Width="100%">
                <Items>
                    <telerik:RadToolBarButton runat="server" Value="CustomDate">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td style="padding-left: 3px; padding-right: 2px">
                                        <asp:Label ID="Label2" runat="server" Text="申請日期：" meta:resourcekey="TBLabelResource1"></asp:Label>
                                    </td>
                                    <td style="padding-left: 3px; padding-right: 2px">
                                        <telerik:RadDatePicker ID="rdpBeginDataChooser" runat="server" >
                                        </telerik:RadDatePicker>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="rdpBeginDataChooser"
                                            ErrorMessage="請輸入申請時間(起)" Display="Dynamic" ID="rfvAlertStartDate" meta:resourceKey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                    </td>
                                    <td style="padding-left: 3px; padding-right: 2px">
                                        <asp:Label ID="Label4" runat="server" Text="~"></asp:Label>
                                    </td>
                                    <td style="padding-left: 3px; padding-right: 2px">
                                        <telerik:RadDatePicker ID="rdpEndDateChooser" runat="server" >
                                        </telerik:RadDatePicker>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="rdpEndDateChooser" ErrorMessage="請輸入申請時間(迄)" Display="Dynamic" ID="rfvAlertEndDate" meta:resourceKey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator runat="server" ControlToCompare="rdpBeginDataChooser" Operator="GreaterThanEqual" Type="Date" ControlToValidate="rdpEndDateChooser" ErrorMessage="結束時間需晚於開始時間" Display="Dynamic" ID="CompareValidator1" meta:resourceKey="CompareValidator3Resource1"></asp:CompareValidator>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sCustomDate">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="Keyword">
                        <ItemTemplate>
                            <table id="Table1" border="0" cellpadding="0" cellspacing="0" style="width: 100%"
                                runat="server">
                                <tr id="Tr1" runat="server">
                                    <td id="Td1" runat="server" style="padding-left: 3px; padding-right: 2px">
                                        <asp:Label ID="Label9" runat="server" Text="關鍵字" meta:resourcekey="TBLabelResource5"></asp:Label>
                                    </td>
                                    <td id="Td2" runat="server" style="padding-left: 3px; padding-right: 2px">
                                        <asp:TextBox ID="txtKeywords" runat="server" Style="margin-left: 0px;"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sKeyword">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="SelectDept">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td style="padding-left: 3px; padding-right: 2px">
                                        <asp:Label ID="Label6" runat="server" Text="部門" meta:resourcekey="TBLabelResource6"></asp:Label>
                                    </td>
                                    <td style="padding-left: 3px; padding-right: 2px">
                                        <asp:Image ID="imgSubDept" runat="server" ImageUrl="~/Common/Images/Icon/icon_m22.png"
                                            meta:resourcekey="Image1Resource1" />
                                        <asp:Image ID="imgDept" runat="server" ImageUrl="~/Common/Images/Icon/icon_m01.png"
                                            meta:resourcekey="Image2Resource1" />
                                    </td>
                                    <td style="padding-left: 3px; padding-right: 2px">
                                        <asp:Label ID="lblDept" runat="server" meta:resourcekey="lblDeptResource1"></asp:Label>
                                    </td>
                                    <td style="padding-left: 3px; padding-right: 2px">
                                        <telerik:RadButton ID="rbSelectDept" runat="server" OnClick="rbSelectDept_Click" meta:resourcekey="TBarButtonResource1" Text="挑選">
                                        </telerik:RadButton>
                                        <asp:Label ID="lblReturnGroup" runat="server" Visible="False" meta:resourcekey="lblReturnGroupResource1"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sSelectDept">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" Value="Query" meta:resourceKey="TBarButtonResource2">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" IsSeparator="true" Value="sQuery">
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <uc2:UC_FormList ID="UC_FormList1" runat="server" UseSource="SuperiorQuery" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <table class="PopTable" border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
            <td style="text-align: left; background-image: url(<%=themePath %>/images/tree_bg.gif); width: 100%; border: 1px solid #006699">
                <asp:Label ID="Label8" runat="server" Text="*關鍵字查詢可查詢表單編號、標題、申請者、內容" CssClass="SizeMemo" meta:resourcekey="Label8Resource1"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" AllowPaging="True"
                AllowSorting="True" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
                DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnableModelValidation="True"
                EnhancePager="True" KeepSelectedRows="False" OnRowDataBound="Grid1_RowDataBound"
                PageSize="15" OnPageIndexChanging="Grid1_PageIndexChanging" OnBeforeExport="Grid1_BeforeExport"
                Width="100%" OnSorting="Grid1_Sorting" meta:resourcekey="Grid1Resource1">
                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                <ExportExcelSettings AllowExportToExcel="True"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField HeaderText="表單編號" SortExpression="DOC_NBR" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#:Bind("DOC_NBR") %>' meta:resourcekey="Label1Resource1"></asp:Label>
                            <asp:Label ID="Label10" runat="server" Text="&nbsp;" meta:resourcekey="Label10Resource1"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%#:Bind("DOC_NBR") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="FORM_NAME" HeaderText="表單名稱" SortExpression="FORM_NAME"
                        meta:resourcekey="BoundFieldResource1" />
                    <asp:TemplateField HeaderText="標題" meta:resourcekey="BoundFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblDisplayTitle" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="NAME" HeaderText="申請人" SortExpression="NAME" meta:resourcekey="BoundFieldResource3" />
                    <asp:BoundField DataField="TASK_RESULT" HeaderText="表單結果" Visible="False" meta:resourcekey="BoundFieldResource4" />
                    <asp:TemplateField HeaderText="表單結果" SortExpression="TASK_RESULT" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <asp:Label ID="lblResult" runat="server" meta:resourcekey="lblResultResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText ="申請日期" SortExpression="BEGIN_TIME" meta:resourcekey="BoundFieldResource5">
                        <ItemTemplate>
                            <asp:Label ID="lblBeginTime" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="結案日期" SortExpression="END_TIME" meta:resourcekey="BoundFieldResource6">
                        <ItemTemplate>
                             <asp:Label ID="lblEndTime" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource3">
                        <ItemStyle HorizontalAlign="Center" />
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnView" runat="server" meta:resourcekey="lbtnViewResource1">觀看</asp:LinkButton>
                            <asp:LinkButton ID="lbtnprint" runat="server" meta:resourcekey="lbtnprintResource1">列印</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblAdopt" runat="server" Text="通過" Visible="False" meta:resourcekey="lblint0Resource1"></asp:Label>
    <asp:Label ID="lblVeto" runat="server" Text="否決" Visible="False" meta:resourcekey="lblint1Resource1"></asp:Label>
    <asp:Label ID="lblInvalid" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblint2Resource1"></asp:Label>
    <asp:Label ID="lblMsg" runat="server" Text="請點選欲查詢表單" Visible="False" meta:resourcekey="lblMsgResource1"></asp:Label>
    <asp:Label ID="lblTitleSelectDept" runat="server" Text="挑選部門" Visible="False" meta:resourcekey="lblTitleSelectDeptResource1"></asp:Label>
    <asp:Label ID="lblList" runat="server" Text="可查詢表單列表" meta:resourcekey="Label7Resource1" Visible="false"></asp:Label>
</asp:Content>