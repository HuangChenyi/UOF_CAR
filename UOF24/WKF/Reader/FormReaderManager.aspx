<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="WKF_Reader_FormReaderManager" Title="查看他人表單" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="FormReaderManager.aspx.cs" %>
<%@ Register Src="~/WKF/Browse/UC_Query.ascx" TagName="UC_Query" TagPrefix="uc1" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .CustomFieldWrap {
            word-break:break-word;
        }
    </style>
<script id="selectjs" type="text/javascript">

    Sys.Application.add_load(function () {
        SelectedChange();
        InitAdvQuery();
    });

    function SelectedChange() {
        var index = $("#<%=DropDownListFormStatus.ClientID%>");

        var td = $("#endTimeTD")

        if (index.val() == 1 || index.val() == 3) {
            td.show();
        }
        else {
            td.hide();
        }
    }

    function InitAdvQuery() {
        var showAdv = $("#<%=hfShowAdv.ClientID%>").val();
        if (showAdv === "true")
            $("#<%=Query.ClientID%>").show();
    }

    function showAdvQuery() {
        if ($("#<%=hfShowAdv.ClientID%>").val() == "" || $("#<%=hfShowAdv.ClientID%>").val() == "false") {
            $("#<%=Query.ClientID%>").show();
            $("#<%=hfShowAdv.ClientID%>").val("true");
        }
        else {
            $("#<%=Query.ClientID%>").hide();
            $("#<%=hfShowAdv.ClientID%>").val("false")
        }
        return false;
    }

    function rbClick(i)
    {      
        var tbxKeyword = $('#<%= tbx_Keyword.ClientID %>');        
        var tbxBeginDocNbr = $('#<%= tbx_BeginDocNbr.ClientID %>');
        var tbxEndDocNbr = $('#<%= tbx_EndDocNbr.ClientID %>');  

        if (i == 0)
        {
            
            tbxKeyword.attr('disabled',false);

            tbxBeginDocNbr.attr('disabled',true);
            tbxEndDocNbr.attr('disabled',true);
        }
       
        if (i == 1)
        {
            tbxKeyword.attr('disabled',true);

            tbxBeginDocNbr.attr('disabled',false);
            tbxEndDocNbr.attr('disabled',false);
        }
        else
        {
            if($('#<%=searchKeyword.ClientID%>').prop("checked"))
            {
                tbxKeyword.attr('disabled',false);

                tbxBeginDocNbr.attr('disabled',true);
                tbxEndDocNbr.attr('disabled',true);
            }
            else
            {
                tbxKeyword.attr('disabled',true);

                tbxBeginDocNbr.attr('disabled',false);
                tbxEndDocNbr.attr('disabled',false);
            }
        }

    }
    
</script>

<style type="text/css">
    .CursorHand
    {
        cursor: hand;
    }
</style>
    <asp:UpdatePanel ID="UpdatePanelTab" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" Width="100%" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick" meta:resourcekey="RadTabStrip1Resource2">
                <Tabs>
                    <telerik:RadTab runat="server" Value="FormAdmin" Selected="True" meta:resourcekey="RadTabResource3">
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Value="FormSet" meta:resourcekey="RadTabResource4">
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="1" Width="100%" Height="100%" meta:resourcekey="RadMultiPage1Resource1">
                    <telerik:RadPageView ID="RadPageView1" runat="server" meta:resourcekey="RadPageView1Resource1">
                        <table cellpadding="0" cellspacing="0" style="border: 0; width: 100%; vertical-align:top;" class="tbbg01">
                            <tr valign="top">
                                <td width="100%" align="center">
                                    <div>
                                        <asp:UpdatePanel ID="UpdatePanelGrid" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <table width="70%" style="text-align: left;">
                                                    <tr>
                                                <td>
                                                    <table class="PopTable" cellspacing="1">
                                                        <tr>
                                                            <td colspan="4" class="PopTableHeader" align="center">
                                                                <center>
                                                                    <asp:Label ID="Label7" runat="server" Text="查詢條件" meta:resourcekey="Label7Resource1"></asp:Label>
                                                                </center>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space:nowrap; text-align:right">
                                                                <asp:Label ID="Label11" runat="server" Text="表單類別："  meta:resourcekey="Label1Resource2"></asp:Label>
                                                            </td>
                                                            <td style="white-space:nowrap; text-align:left" colspan="3">
                                                                <asp:DropDownList ID="ddlFormCategory" runat="server" OnSelectedIndexChanged="ddlFormCategory_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td nowrap="nowrap" align="right" width="20%" class="PopTableLeftTD">
                                                                <asp:Label ID="Label1" runat="server" Text="表單名稱："
                                                                    meta:resourcekey="Label1Resource1"></asp:Label></td>
                                                            <td width="30%" class="PopTableRightTD">
                                                                <asp:DropDownList ID="DropDownListFormName" OnSelectedIndexChanged="ddlFormNameQuery_SelectedIndexChanged" AutoPostBack="True"
                                                                    runat="server"  meta:resourcekey="DropDownListFormNameResource1">
                                                                    
                                                                </asp:DropDownList>
                                                                <asp:CheckBox ID="cbIncludeFormCTL" runat="server" Text="包含停用表單" OnCheckedChanged="cbIncludeFormCTL_CheckedChanged" AutoPostBack="true" meta:resourcekey="cbIncludeFormCTLResource1" />
                                                            </td>
                                                            <td nowrap="nowrap" align="right" width="20%" class="PopTableLeftTD">
                                                                <asp:Label ID="Label2" runat="server" Text="表單狀態："
                                                                    meta:resourcekey="Label2Resource1"></asp:Label></td>
                                                            <td width="30%" class="PopTableRightTD">
                                                                <asp:DropDownList ID="DropDownListFormStatus" runat="server" onchange="SelectedChange()"
                                                                    meta:resourcekey="DropDownListFormStatusResource1">
                                                                    <asp:ListItem Text="全部" Value="all" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                                                    <asp:ListItem Text="處理中" Value="0" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                                                    <asp:ListItem Text="退回申請者" Value="4" meta:resourcekey="ListItemResource6"></asp:ListItem>
                                                                    <asp:ListItem Text="已結案" Value="1" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                                                    <asp:ListItem Text="異常" Value="2" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                                                    <asp:ListItem Text="作廢" Value="3" meta:resourcekey="ListItemResource5"></asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td nowrap="nowrap" align="right" width="20%" class="PopTableLeftTD">
                                                                <asp:Label ID="Label3" runat="server" Text="申請者：" meta:resourcekey="Label3Resource1"></asp:Label></td>
                                                            <td colspan="3" width="80%" class="PopTableRightTD">
                                                                <asp:TextBox ID="tbx_Applicant" runat="server" meta:resourcekey="tbx_ApplicantResource1"></asp:TextBox>
                                                                <asp:Label ID="Label8" runat="server" Text="(可輸入姓名、帳號、身分證字號)" CssClass="SizeMemo" meta:resourcekey="Label8Resource1"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td nowrap="nowrap" align="right" width="20%" class="PopTableLeftTD">
                                                                <asp:Label ID="Label4" runat="server" Text="申請時間：" meta:resourcekey="Label4Resource1"></asp:Label></td>
                                                            <td colspan="3" width="80%" class="PopTableRightTD">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <telerik:RadDatePicker ID="rdpBeginTime" runat="server" Width="170px"></telerik:RadDatePicker>
                                                                        </td>
                                                                        <td>&nbsp;~&nbsp;</td>
                                                                        <td>
                                                                            <telerik:RadDatePicker ID="rdpEndTime" runat="server" Width="170px"></telerik:RadDatePicker>
                                                                        </td>
                                                                        <td>
                                                                            <asp:RequiredFieldValidator ID="RaApplicantBeginDate" runat="server"
                                                                                ControlToValidate="rdpBeginTime" Display="Dynamic"
                                                                                meta:resourcekey="RaApplicantBeginDateResource1" Text="申請開始日期不可空白"></asp:RequiredFieldValidator>
                                                                            <asp:RequiredFieldValidator ID="RaApplicantEndDate" runat="server"
                                                                                ControlToValidate="rdpEndTime" Display="Dynamic"
                                                                                meta:resourcekey="RaApplicantEndDateResource1" Text="申請結束日期不可空白"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr id="endTimeTD" style="display: none">
                                                            <td nowrap="nowrap" align="right" width="20%" class="PopTableLeftTD">
                                                                <asp:Label ID="Label5" runat="server" Text="結案時間：" meta:resourcekey="Label5Resource1"></asp:Label></td>
                                                            <td colspan="3" width="80%" class="PopTableRightTD">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <telerik:RadDatePicker ID="rdpEndFormStart" runat="server" Width="170px" ></telerik:RadDatePicker>
                                                                        </td>
                                                                        <td>&nbsp;~&nbsp;</td>
                                                                        <td>
                                                                            <telerik:RadDatePicker ID="rdpEndFormEnd" runat="server"  Width="170px" ></telerik:RadDatePicker>
                                                                        </td>
                                                                        <td>
                                                                            <asp:RequiredFieldValidator ID="RaEndFormBeginDate" runat="server"
                                                                                ControlToValidate="rdpEndFormStart" Display="Dynamic"
                                                                                meta:resourcekey="RaEndFormBeginDateResource1" Text="結案開始日期不可空白"></asp:RequiredFieldValidator>
                                                                            <asp:RequiredFieldValidator ID="RaEndFormEndDate" runat="server"
                                                                                ControlToValidate="rdpEndFormEnd" Display="Dynamic"
                                                                                meta:resourcekey="RaEndFormEndDateResource1" Text="結案結束日期不可空白"></asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td nowrap="nowrap" align="right" width="20%" class="PopTableLeftTD">
                                                                <asp:Label ID="Label6" runat="server" Text="單號條件：" meta:resourcekey="Label6Resource1"></asp:Label></td>
                                                            <td colspan="3" width="80%" class="PopTableRightTD" style="white-space: nowrap;">
                                                                <asp:RadioButton ID="searchKeyword" runat="server" Text="單號關鍵字" Checked="True" GroupName="SearchGroup" onclick="rbClick(0)" meta:resourcekey="searchKeywordResource1" />
                                                                <asp:TextBox ID="tbx_Keyword" runat="server" Width="120px" meta:resourcekey="tbx_KeywordResource1"></asp:TextBox>
                                                                <asp:RadioButton ID="searchSE" runat="server" Text="起迄" GroupName="SearchGroup" onclick="rbClick(1)" meta:resourcekey="searchSEResource1" />
                                                                <asp:TextBox ID="tbx_BeginDocNbr" runat="server" Width="120px" meta:resourcekey="tbx_BeginDocNbrResource2"></asp:TextBox>
                                                                &nbsp;~&nbsp;
                                                                <asp:TextBox ID="tbx_EndDocNbr" runat="server" Width="120px" meta:resourcekey="tbx_EndDocNbrResource2"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td nowrap="nowrap" align="right" width="20%" class="PopTableLeftTD">
                                                                <asp:Label ID="lbl_SignJobTitle" runat="server" Text="簽核者職級：" meta:resourcekey="lbl_SignJobTitleResource1"></asp:Label></td>
                                                            <td width="80" class="PopTableRightTD" colspan="3">
                                                                <asp:DropDownList ID="ddlSignJobTitle" runat="server" meta:resourcekey="ddlSignJobTitleResource1">
                                                                </asp:DropDownList></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                                </table>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <div style="width:70%; display:none" id="Query" runat="server">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <uc1:UC_Query ID="UC_Query1" runat="server"></uc1:UC_Query>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnAdvSearch" EventName="Click"></asp:AsyncPostBackTrigger>
                                                    <asp:AsyncPostBackTrigger ControlID="DropDownListFormName" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlFormCategory" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btn_Search" runat="server" Text="查詢"
                                            OnClick="btn_Search_Click" CssClass="CursorHand"
                                            meta:resourcekey="btn_SearchResource1" />
                                                    <asp:Button ID="btnAdvSearch" runat="server" Text="進階查詢" OnClientClick="return showAdvQuery()"
                                            CssClass="CursorHand" meta:resourcekey="btnAdvSearchResource1"/>
                                                </td>
                                            </tr>
                                        </table>                                        
                                        <br />
                                        <div style="text-align: left">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <Fast:Grid ID="DGDraftList" runat="server" Width="100%" PageSize="15" EnhancePager="True" DataKeyOnClientWithCheckBox="False" AllowPaging="True" CustomDropDownListPage="True" AutoGenerateCheckBoxColumn="False" AllowSorting="True" OnPageIndexChanging="DGDraftList_PageIndexChanging" AutoGenerateColumns="False" OnRowDataBound="DGDraftList_RowDataBound" OnSorting="DGDraftList_Sorting" DataKeyNames="TASK_ID" DefaultSortDirection="Ascending" OnBeforeExport="DGDraftList_BeforeExport" EmptyDataText="No data found" KeepSelectedRows="False" meta:resourcekey="DGDraftListResource2" SelectedRowColor="" UnSelectedRowColor="">
                                                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                                                        <ExportExcelSettings AllowExportToExcel="True" DataSourceType="ObjectDataSource"/>
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource12" >
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" Text="跟催" meta:resourcekey="LinkButton1Resource1"></asp:LinkButton>
                                                                    <asp:LinkButton ID="LinkButton2" runat="server" Text="觀看" meta:resourcekey="LinkButton2Resource1"></asp:LinkButton>
                                                                    <asp:LinkButton ID="LinkButton3" runat="server" Text="列印" meta:resourcekey="LinkButton3Resource1"></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </Fast:Grid>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btn_Search" EventName="Click"></asp:AsyncPostBackTrigger>
                                                    
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                    <asp:Label ID="lblRemoveLockFail" runat="server" Text="表單作廢失敗，可能同時間有人異動表單狀態" Visible="False" meta:resourcekey="lblRemoveLockFailResource1"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView2" runat="server" meta:resourcekey="RadPageView2Resource1" Selected="True">
                        <asp:Label ID="lbConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
                        <asp:Label ID="lblYes" runat="server" Text="是" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
                        <asp:Label ID="lblNo" runat="server" Text="否" Visible="False" meta:resourcekey="lblNoResource1"></asp:Label>
                        <asp:Label ID="lblDay" runat="server" Text="日" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
                        <asp:Label ID="lblHour" runat="server" Text="時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblTabName3" runat="server" Text=" 表單查閱者查詢 " Visible="False" meta:resourcekey="lblTabName3Resource1" ></asp:Label>
    <asp:Label ID="lblTabName2" runat="server" Text="表單欄位顯示設定" Visible="False" meta:resourcekey="lblTabName2Resource1"></asp:Label>
    <asp:Label ID="lblLabel1" runat="server" Text="申請者" Visible="False" meta:resourcekey="lblLabel1Resource1"></asp:Label>
    <asp:Label ID="lblLabel2" runat="server" Text="申請時間" Visible="False" meta:resourcekey="lblLabel2Resource1"></asp:Label>
    <asp:Label ID="lblLabel3" runat="server" Text="結案時間" Visible="False" meta:resourcekey="lblLabel3Resource1"></asp:Label>
    <asp:Label ID="lblLabel4" runat="server" Text="表單編號" Visible="False" meta:resourcekey="lblLabel4Resource1"></asp:Label>
    <asp:Label ID="lblLabel5" runat="server" Text="狀態" Visible="False" meta:resourcekey="lblLabel5Resource1"></asp:Label>
    <asp:Label ID="lblLabel6" runat="server" Text="目前簽核者" Visible="False" meta:resourcekey="lblLabel6Resource1"></asp:Label>
    <asp:Label ID="lblLabel7" runat="server" Text="操作" Visible="False" meta:resourcekey="lblLabel7Resource1"></asp:Label>
    <asp:Label ID="lblLabel8" runat="server" Text="簽核者職級" Visible="False" meta:resourcekey="lblLabel8Resource1"></asp:Label>
    <asp:Label ID="lblLabel9" runat="server" Text="全部" Visible="False" meta:resourcekey="lblLabel9Resource1"></asp:Label>

    <asp:Label ID="lblLabelStatus1" runat="server" Text="處理中" Visible="False" meta:resourcekey="lblLabelStatus1Resource1"></asp:Label>
    <asp:Label ID="lblLabelStatus2" runat="server" Text="結案(通過)" Visible="False" meta:resourcekey="lblLabelStatus2Resource1"></asp:Label>
    <asp:Label ID="lblLabelStatus3" runat="server" Text="結案(否決)" Visible="False" meta:resourcekey="lblLabelStatus3Resource1"></asp:Label>
    <asp:Label ID="lblLabelStatus4" runat="server" Text="結案(作廢)" Visible="False" meta:resourcekey="lblLabelStatus4Resource1"></asp:Label>
    <asp:Label ID="lblLabelStatus5" runat="server" Text="異常" Visible="False" meta:resourcekey="lblLabelStatus5Resource1" ForeColor="Red"></asp:Label>
    <asp:Label ID="lblLabelStatus6" runat="server" Text="退回申請者" Visible="False" meta:resourcekey="lblLabelStatus6Resource1"></asp:Label>
    <asp:Label ID="lblHurryToSign" runat="server" Text="跟催" Visible="False" meta:resourcekey="lblHurryToSignResource1" ></asp:Label>
    <asp:Label ID="lblView" runat="server" Text="觀看" Visible="False" meta:resourcekey="lblViewResource1" ></asp:Label>
    <asp:Label ID="lblPrint" runat="server" Text="列印" Visible="False" meta:resourcekey="lblPrintResource1" ></asp:Label>
    <asp:HiddenField ID="hfShowAdv" runat="server" />
    <asp:Label ID="lblAllCategoryText" runat="server" Text="所有表單類別" Visible="False" meta:resourcekey="lblAllCategoryTextResource1"></asp:Label>
    <asp:Label ID="lblSuspend" runat="server" Text="(停用)" Style="display: none" meta:resourcekey="lblSuspendResource1"></asp:Label>
</asp:Content>

