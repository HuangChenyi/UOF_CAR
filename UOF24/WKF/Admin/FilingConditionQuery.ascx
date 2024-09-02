<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Admin_FilingConditionQuery" CodeBehind="FilingConditionQuery.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Src="../Browse/UC_Query.ascx" TagName="UC_Query" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<table style="width: 100%; height: 100%" class="tbbg01">
    <tr>
        <td style="width: 100%; height: 100%; vertical-align: top;">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="vertical-align: top;">
                        <div>
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%"
                                        meta:resourcekey="UltraWebToolbar1Resource1" OnButtonClick="RadToolBar1_ButtonClick">
                                        <Items>
                                            <telerik:RadToolBarButton runat="server"
                                                Text="標示為已處理"
                                                meta:resourcekey="TBarButtonResource2"
                                                ImageUrl="~/Common/Images/Icon/icon_m132.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m132.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m132.gif"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m132.gif"
                                                Value="DoneSet">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg"></telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server"
                                                Text="標記為未處理"
                                                meta:resourcekey="TBarButtonResource3"
                                                ImageUrl="~/Common/Images/Icon/icon_m133.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m133.gif"
                                                DisabledImageUrl="~/Common/Images/Icon/icon_m133.gif"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m133.gif"
                                                Value="UntreatedSet">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg"></telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Text="Button 4" Value="FormStatus">
                                                <ItemTemplate>
                                                    <asp:DropDownList runat="server" AutoPostBack="True" ID="ddlStatus" meta:resourcekey="ddlStatusResource1" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                                        <asp:ListItem Value="False" meta:resourcekey="ListItemResource5">未處理</asp:ListItem>
                                                        <asp:ListItem Value="True" meta:resourcekey="ListItemResource6">已處理</asp:ListItem>
                                                        <asp:ListItem Value="All" meta:resourcekey="ListItemResource7">全部</asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 5" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg"></telerik:RadToolBarButton>
                                        </Items>
                                    </telerik:RadToolBar>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table>
                            <tr>
                                <td style="width: 450px">
                                    <table>
                                        <tr>
                                            <td style="width: 450px" align="center">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <table class="PopTable" cellspacing="1">
                                                                <tr>
                                                                    <td class="PopTableHeader" style="height: 25px" align="center" colspan="2">
                                                                        <center>
                              <asp:Label ID="lblBasicQuery" runat="server" Text="基本查詢" meta:resourcekey="lblBasicQueryResource1"></asp:Label>                                                    　
                              </center>
                                                                    </td>
                                                                </tr>
                                                                <colgroup class="PopTableLeftTD"></colgroup>
                                                                <colgroup class="PopTableRightTD"></colgroup>
                                                                <tr>
                                                                    <td style="height: 25px;" align="right" nowrap="nowrap">
                                                                        <asp:Label ID="lblTaskResult" runat="server" Text="*審核結果" meta:resourcekey="lblTaskResultResource1"></asp:Label></td>
                                                                    <td style="height: 25px;" align="left">
                                                                        <asp:DropDownList ID="ddlTaskResult" runat="server" meta:resourcekey="ddlTaskResultResource1">
                                                                            <asp:ListItem Value="all" meta:resourcekey="ListItemResource1" Text="所有狀態"></asp:ListItem>
                                                                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource2" Text="通過"></asp:ListItem>
                                                                            <asp:ListItem Value="1" meta:resourcekey="ListItemResource3" Text="否決"></asp:ListItem>
                                                                            <asp:ListItem Value="2" meta:resourcekey="ListItemResource8" Text="處理中"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="height: 25px;" align="right" nowrap="nowrap">
                                                                        <asp:Label ID="lblBeginTime" runat="server" Text="*申請日期" meta:resourcekey="lblBeginTimeResource1"></asp:Label></td>
                                                                    <td style="height: 25px;" align="left">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <telerik:RadDatePicker ID="rdpStartDate" runat="server"></telerik:RadDatePicker>
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rdpStartDate"
                                                                                        Display="Dynamic" ErrorMessage="請輸入申請日期(起)" meta:resourcekey="RequiredFieldValidator1Resource1">
                                                                                    </asp:RequiredFieldValidator></td>
                                                                                <td style="padding-left: 3px; padding-right: 3px;">~</td>
                                                                                <td>
                                                                                    <telerik:RadDatePicker ID="rdpEndDate" runat="server"></telerik:RadDatePicker>
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rdpEndDate"
                                                                                        Display="Dynamic" ErrorMessage="請輸入申請日期(迄)" meta:resourcekey="RequiredFieldValidator2Resource1">
                                                                                    </asp:RequiredFieldValidator></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間"
                                                                            OnServerValidate="CustomValidator1_ServerValidate" meta:resourcekey="CustomValidator1Resource1">
                                                                        </asp:CustomValidator></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="height: 25px;" align="right" nowrap="nowrap">
                                                                        <asp:Label ID="lblDocNbr" runat="server" Text="表單編號起訖" meta:resourcekey="lblDocNbrResource1"></asp:Label></td>
                                                                    <td style="height: 25px;" align="left">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:TextBox ID="tbDocNbrStart" runat="server" Width="100px" meta:resourcekey="tbDocNbrStartResource1"></asp:TextBox></td>
                                                                                <td style="padding-left: 3px; padding-right: 3px;">~</td>
                                                                                <td>
                                                                                    <asp:TextBox ID="tbDocNbrEnd" runat="server" Width="100px" meta:resourcekey="tbDocNbrEndResource1"></asp:TextBox></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="請輸入表單編號(起)"
                                                                            OnServerValidate="CustomValidator2_ServerValidate" meta:resourcekey="CustomValidator2Resource1">
                                                                        </asp:CustomValidator>
                                                                        <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="請輸入表單編號(迄)"
                                                                            OnServerValidate="CustomValidator3_ServerValidate" meta:resourcekey="CustomValidator3Resource1">
                                                                        </asp:CustomValidator></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="height: 25px;" align="right" nowrap="nowrap">
                                                                        <asp:Label ID="lblFormName" runat="server" Text="表單名稱" meta:resourcekey="lblFormNameResource1"></asp:Label></td>
                                                                    <td style="height: 25px;" align="left">
                                                                        <asp:DropDownList ID="ddlFormName" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFormName_SelectedIndexChanged" meta:resourcekey="ddlFormNameResource1">
                                                                            <asp:ListItem Value="all" meta:resourcekey="ListItemResource4" Text="所有表單"></asp:ListItem>
                                                                        </asp:DropDownList></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                <ContentTemplate>
                                                                    <uc1:UC_Query ID="UC_Query1" runat="server" />
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="wibShowSpecial" EventName="Click" />
                                                                    <asp:AsyncPostBackTrigger ControlID="ddlFormName"
                                                                        EventName="SelectedIndexChanged" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <table>
                                                                <tr>
                                                                    <td align="center" colspan="4" style="height: 45px">
                                                                        <table style="height: 45px">
                                                                            <tr>
                                                                                <td>
                                                                                    <telerik:RadButton ID="wibQuery" runat="server" meta:resourcekey="wibQueryResource1" OnClick="wibQuery_Click1"></telerik:RadButton>
                                                                                </td>
                                                                                <td>&nbsp; &nbsp;</td>
                                                                                <td>
                                                                                    <telerik:RadButton ID="wibShowSpecial" runat="server" meta:resourcekey="wibShowSpecialResource1" OnClick="wibShowSpecial_Click1"></telerik:RadButton>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <table width="100%" class="PopTable" cellspacing="1">
                                        <tr>
                                            <td class="PopTableHeader" align="center" style="height: 21px">
                                                <center>
                                                    <asp:Label ID="lblFormListTitle" runat="server" Text="表單列表" meta:resourcekey="lblFormListTitleResource1"></asp:Label>
                                                </center>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <Fast:Grid ID="DGFormList" runat="server"
                                                AllowSorting="True" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="True"
                                                DataKeyOnClientWithCheckBox="False" DataKeyNames="TASK_ID"
                                                EnhancePager="True" EmptyDataText="No data found"
                                                Width="98%" PageSize="15"
                                                OnPageIndexChanging="DGFormList_PageIndexChanging"
                                                OnRowDataBound="DGFormList_RowDataBound"
                                                OnSorting="DGFormList_Sorting"
                                                OnBeforeExport="DGFormList_BeforeExport"
                                                meta:resourcekey="DGFormListResource1">
                                                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                                                <ExportExcelSettings AllowExportToExcel="true" DataSourceType="ObjectDataSource" />
                                                <Columns>
                                                    <asp:TemplateField meta:resourcekey="TemplateFieldResource4">
                                                        <ItemTemplate>
                                                            <asp:Image runat="server" ID="Image1" meta:resourcekey="Image1Resource1"></asp:Image>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="20px" HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="表單編號" meta:resourceKey="BoundFieldResource1" SortExpression="DOC_NBR">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbtnDocNumber" runat="server"></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <HeaderStyle Wrap="false" />
                                                        <ItemStyle HorizontalAlign="Left" Width="80px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource5">
                                                        <ItemStyle HorizontalAlign="Left" Width="100px" />
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblFormname123" __designer:wfdid="w6" meta:resourcekey="lblFormname123Resource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="標題" meta:resourcekey="TemplateFieldResource6">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTitle" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="200px" HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="申請人" meta:resourcekey="TemplateFieldResource1">
                                                        <ItemStyle HorizontalAlign="Left" Width="140px" />
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblUser" meta:resourceKey="lblUserResource1" __designer:wfdid="w1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="審核結果" meta:resourcekey="TemplateFieldResource2">
                                                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblResult" meta:resourceKey="lblResultResource1" __designer:wfdid="w2"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="申請日期" meta:resourcekey="BoundFieldResource3" SortExpression="BEGIN_TIME">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBeginTime" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="結案日期" meta:resourcekey="BoundFieldResource4" SortExpression="END_TIME">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEndTime" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource3">
                                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" ID="lbtnPrint" Text="列印" meta:resourceKey="lbtnPrintResource1" __designer:wfdid="w24"></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <PagerStyle HorizontalAlign="Left" />
                                            </Fast:Grid>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="wibQuery" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<asp:Label ID="lblPass" runat="server" Text="通過" Visible="False" meta:resourcekey="lblPassResource1"></asp:Label>
<asp:Label ID="lblReject" runat="server" Text="否決" Visible="False" meta:resourcekey="lblRejectResource1"></asp:Label>
<asp:Label ID="lblProccess" runat="server" Text="處理中" Visible="False" meta:resourcekey="lblProccessResource1"></asp:Label>
<asp:Label ID="lblInvalid" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblInvalidResource1"></asp:Label>
<asp:Label ID="lblQuery" runat="server" Text="查詢" Visible="False" meta:resourcekey="lblQueryResource1"></asp:Label>
<asp:Label ID="lblSpecialQuery" runat="server" Text="進階查詢" Visible="False" meta:resourcekey="lblSpecialQueryResource1"></asp:Label>
<asp:Label ID="lblDone" runat="server" Text="已處理" Visible="False" meta:resourcekey="lblDoneResource1"></asp:Label>
<asp:Label ID="lblUntreated" runat="server" Text="未處理" Visible="False" meta:resourcekey="lblUntreatedResource1"></asp:Label>
