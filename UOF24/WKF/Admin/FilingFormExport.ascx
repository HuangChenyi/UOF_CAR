<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Admin_FilingFormExport" CodeBehind="FilingFormExport.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../Browse/UC_Query.ascx" TagName="UC_Query" TagPrefix="uc1" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>

<script type="text/javascript" id="telerikClientEvents1">
    //<![CDATA[

    function RadToolBar1_ButtonClicking(sender, args) {
        alert('<%=lblProcessMsg.Text %>');
    }
    //]]>
</script>

<script type="text/javascript">
    function SendProcessMsg() {
        alert('<%=lblProcessMsg.Text %>');
    }

</script>

<table style="width: 100%; height: 100%" class="tbbg01">
    <tr>
        <td style="width: 100%; height: 100%" valign="top">
            <table style="width: 100%">
                <tr>
                    <td>
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" meta:resourcekey="UltraWebToolbar1Resource1" OnButtonClick="RadToolBar1_ButtonClick">
                            <Items>
                                <telerik:RadToolBarButton runat="server" meta:resourcekey="TBarButtonResource1"
                                    Text="匯出統計Excel"
                                    ImageUrl="~/Common/Images/Icon/icon_m174.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m174.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m174.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m174.gif"
                                    Value="ExportStatistics">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 1" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg"></telerik:RadToolBarButton>

                                <telerik:RadToolBarButton runat="server" meta:resourcekey="TBarButtonResource2"
                                    Text="匯出單據Excel"
                                    ImageUrl="~/Common/Images/Icon/icon_m144.gif"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m144.gif"
                                    DisabledImageUrl="~/Common/Images/Icon/icon_m144.gif"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m144.gif"
                                    Value="ExportFormList">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="Button 3" Image="~/App_Themes/DefaultTheme/images/toolbarSp.jpg"></telerik:RadToolBarButton>

                                <telerik:RadToolBarButton runat="server" Text="處理狀態" Value="FormStatus"  meta:resourcekey="TBarButtonResource3">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlStatus" AutoPostBack="True" meta:resourcekey="ddlStatusResource1"
                                            OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" runat="server" >
                                            <asp:ListItem Value="False" meta:resourcekey="ListItemResource7">未處理</asp:ListItem>
                                            <asp:ListItem Value="True" meta:resourcekey="ListItemResource8">已處理</asp:ListItem>
                                            <asp:ListItem Value="All" meta:resourcekey="ListItemResource9">全部</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                        &nbsp;
                    </td>
                </tr>
                <tr style="text-align: center">
                    <td style="text-align: center">
                        <center>
                    <table style="text-align: center">
                        <tr  style="text-align: center">
                            <td    style="width: 650px; text-align: center">
                           
                                <table cellspacing="1" class="PopTable" style="text-align: center">
                                  <colgroup class="PopTableLeftTD" width="80px">
                                    </colgroup>
                                    <colgroup class="PopTableRightTD">
                                    </colgroup>
                                    <colgroup class="PopTableLeftTD"  width="120px">
                                    </colgroup>
                                    <colgroup class="PopTableRightTD">
                                    </colgroup>
                                    <tr>
                                        <td align="center" class="PopTableHeader" colspan="4" style="height: 25px">
                                        <center>
                                            <asp:Label ID="lblBasicQuery" Text="基本查詢" runat="server" meta:resourcekey="lblBasicQueryResource1"></asp:Label>&nbsp;
                                        </center>
                                        </td>
                                    </tr>
                                  
                                    <tr>
                                        <td align="right" style="height: 25px;"  nowrap="nowrap">
                                            <asp:Label ID="lblTaskResult" Text="*審核結果" runat="server" meta:resourcekey="lblTaskResultResource1" ></asp:Label>
                                        </td>

                                        <td align="left" style="height:25px;width:80px" >
                                            <asp:DropDownList ID="ddlFormResult" runat="server" meta:resourcekey="ddlFormResultResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource1" Text="所有結果" Value="all"></asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource2" Text="通過" Value="0"></asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource3" Text="否決" Value="1"></asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource6" Text="處理中" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>

                                        <td align="right" style="height: 25px;"nowrap="nowrap">
                                            <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="*"></asp:Label>
                                            <asp:DropDownList ID="ddlBegintimeOrEndtime" runat="server" meta:resourcekey="ddlBegintimeOrEndtimeResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource4" Value="BeginTime" Text="申請時間"></asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource5" Value="EndTime" Text="結案時間"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>

                                        <td align="left" style="height: 25px">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <telerik:RadDatePicker ID="rdpStartDate" Runat="server"></telerik:RadDatePicker>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rdpStartDate"
                                                            Display="Dynamic" ErrorMessage="請輸入申請日期(起)" meta:resourcekey="RequiredFieldValidator1Resource1">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                    <td style="padding-left:3px; padding-right:3px;">~</td>
                                                    <td>
                                                        <telerik:RadDatePicker ID="rdpEndDate" Runat="server"></telerik:RadDatePicker>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rdpEndDate"
                                                            Display="Dynamic" ErrorMessage="請輸入申請日期(迄)" meta:resourcekey="RequiredFieldValidator2Resource1">
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="rdpStartDate"
                                                ControlToValidate="rdpEndDate" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間" 
                                                meta:resourcekey="CompareValidator1Resource1"
                                                Operator="GreaterThanEqual" Type="Date">
                                            </asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="height: 25px"  nowrap="nowrap">
                                            <asp:Label ID="lblApplicant" runat="server" meta:resourcekey="lblApplicantResource1" Text="申請人"></asp:Label>
                                        </td>
                                        <td align="left" colspan="3" style="height: 25px">
                                            <uc2:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ShowMember="False" />
                                            <asp:Label ID="lblApplicantRemark" runat="server" CssClass="SizeMemo"
                                                Text="使用申請者查詢時，無法查到過期或停用之申請者的表單資料" meta:resourcekey="lblApplicantRemarkResource1">
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="height: 25px"  nowrap="nowrap">
                                            <asp:Label ID="lblFormName" runat="server" meta:resourcekey="lblFormNameResource1" Text="*表單名稱"></asp:Label>
                                        </td>
                                        <td align="left" style="height: 25px;">
                                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                <ContentTemplate>
                                                  <div style=" width:150px">
                                                    <asp:DropDownList ID="ddlFormName" AutoPostBack="True"
                                                        runat="server"  meta:resourcekey="ddlFormNameResource1"                                    
                                                        OnSelectedIndexChanged="ddlFormName_SelectedIndexChanged" Width="150px">
                                                    </asp:DropDownList>
                                                  </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td align="right" style="height: 25px"  nowrap="nowrap">
                                            <asp:Label ID="lblDocNumbers" runat="server" meta:resourcekey="lblDocNumbersResource1" Text="表單編號起訖"></asp:Label>
                                        </td>
                                        <td align="left" style="height: 25px">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="tbNumberStart" runat="server" meta:resourcekey="tbNumberStartResource1" Width="120px"></asp:TextBox>
                                                    </td>
                                                    <td style="padding-left:3px; padding-right:3px;">~</td>
                                                    <td>
                                                        <asp:TextBox ID="tbNumberEnd" runat="server" meta:resourcekey="tbNumberEndResource1"
                                                            Width="120px">
                                                        </asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="請輸入表單編號(起)"
                                                meta:resourcekey="CustomValidator2Resource1" OnServerValidate="CustomValidator2_ServerValidate">
                                            </asp:CustomValidator>
                                            <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="請輸入表單編號(迄)"
                                                meta:resourcekey="CustomValidator3Resource1" OnServerValidate="CustomValidator3_ServerValidate">
                                            </asp:CustomValidator></td>
                                    </tr>
                                </table>
                              
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <uc1:UC_Query ID="UC_Query1" runat="server" />
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="wibShowSpecial" EventName="Click" />
                                        <asp:AsyncPostBackTrigger ControlID="ddlFormName" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <center>
                                    <table style="text-align:center">
                                        <tr>
                                            <td  colspan="4" style="height: 25px;text-align:center">
                                                &nbsp;
                                                <telerik:RadButton ID="wibQuery" runat="server" Text="RadButton" 
                                                    meta:resourcekey="wibQueryResource1" OnClick="wibQuery_Click1">
                                                </telerik:RadButton>
                                                <telerik:RadButton ID="wibShowSpecial" runat="server" Text="RadButton" 
                                                    meta:resourcekey="wibShowSpecialResource1" OnClick="wibShowSpecial_Click1">
                                                </telerik:RadButton>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </center>
                            </td>
                        </tr>
                    </table>
                    </center>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellspacing="1" class="PopTable" width="100%">
                            <tr>
                                <td align="center" class="PopTableHeader" style="width: 1332px">
                                    <center>
                                        <asp:Label ID="lblFormListTitle" Text="表單列表" runat="server" meta:resourcekey="lblFormListTitleResource1"></asp:Label>
                                    </center>
                                </td>
                            </tr>
                        </table>
                        <div style="text-align: center">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <Fast:Grid ID="DGFormList" runat="server" AllowPaging="True" AllowSorting="True"
                                        AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                                        DataKeyOnClientWithCheckBox="False" EnhancePager="True"
                                        OnPageIndexChanging="DGFormList_PageIndexChanging"
                                        OnRowDataBound="DGFormList_RowDataBound" OnSorting="DGFormList_Sorting" PageSize="15"
                                        Width="100%">
                                        <EmptyDataRowStyle BackColor="White" ForeColor="Red" />
                                        <EnhancePagerSettings ShowHeaderPager="True" />
                                        <Columns>                                           
                                            <asp:TemplateField meta:resourcekey="TemplateFieldResource4">
                                                <ItemTemplate>
                                                    <asp:Image runat="server" ID="Image1" meta:resourcekey="Image1Resource1"></asp:Image>
                                                </ItemTemplate>
                                                <ItemStyle Width="20px" HorizontalAlign="Left" />
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="DOC_NBR" HeaderText="表單編號" SortExpression="DOC_NBR" meta:resourcekey="BoundFieldResource1" >
                                                <ItemStyle HorizontalAlign="Left"/>
                                            </asp:BoundField>

                                            <asp:TemplateField HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource1">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFormname" __designer:wfdid="w55" runat="server" meta:resourceKey="lblFormnameResource2"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="申請人" meta:resourcekey="TemplateFieldResource2">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUser" __designer:wfdid="w13" runat="server" meta:resourceKey="lblUserResource1"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="審核結果" meta:resourcekey="TemplateFieldResource3">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblResult" __designer:wfdid="w14" runat="server" meta:resourceKey="lblResultResource1"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="申請日期" meta:resourcekey="BoundFieldResource2" SortExpression="BEGIN_TIME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGridBeginTime" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="結案日期" meta:resourcekey="BoundFieldResource3" SortExpression="END_TIME">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGridEndTime" runat="server"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </Fast:Grid>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="wibQuery" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<asp:Label ID="lblQuery" runat="server" meta:resourcekey="lblQueryResource1" Text="查詢" Visible="False"></asp:Label>
<asp:Label ID="lblSpecQuery" runat="server" meta:resourcekey="lblSpecQueryResource1" Text="進階查詢" Visible="False"></asp:Label>
<asp:Label ID="lblExportAnalysis" runat="server" meta:resourcekey="lblExportAnalysisResource1" Text="表單統計" Visible="False"></asp:Label>
<asp:Label ID="lblExportForm" runat="server" meta:resourcekey="lblExportFormResource1" Text="表單單據" Visible="False"></asp:Label>
<asp:Label ID="lblPass" runat="server" meta:resourcekey="lblPassResource1" Text="通過" Visible="False"></asp:Label>
<asp:Label ID="lblReject" runat="server" meta:resourcekey="lblRejectResource1" Text="否決" Visible="False"></asp:Label>
<asp:Label ID="lblFilingStatus" runat="server" meta:resourcekey="lblFilingStatusResource1" Text="處理狀態" Visible="False"></asp:Label>
<asp:Label ID="lblProccess" runat="server" meta:resourcekey="lblProccessResource1" Text="處理中" Visible="False" ></asp:Label>
<asp:Label ID="lblAllResult" runat="server" meta:resourcekey="lblAllResultResource1" Text="所有結果" Visible="False"></asp:Label>
<asp:Label ID="lblBeginTime" runat="server" meta:resourcekey="lblBeginTimeResource1" Text="申請時間" Visible="False"></asp:Label>
<asp:Label ID="lblEndTime" runat="server" meta:resourcekey="lblEndTimeResource1" Text="結案時間" Visible="False"></asp:Label>
<asp:Label ID="lblVersion" runat="server" meta:resourcekey="lblVersionResource1" Text="版本" Visible="False"></asp:Label>
<asp:Label ID="lblCondition" runat="server" meta:resourcekey="lblConditionResource1" Text="欄位條件" Visible="False"></asp:Label>
<asp:Label ID="lblQueryCondition" runat="server" meta:resourcekey="lblQueryConditionResource1" Text="查詢條件" Visible="False"></asp:Label>
<asp:Label ID="lblProcessMsg" runat="server" meta:resourcekey="lblProcessMsgResource1" Text="報表匯出已進入系統排程，請於五分鐘後至[下載匯出報表]中下載" Visible="False"></asp:Label>