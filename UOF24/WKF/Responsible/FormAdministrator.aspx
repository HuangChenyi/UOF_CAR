<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="WKF_Responsible_FormAdministrator" Title="表單負責人管理" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="FormAdministrator.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .CustomFieldWrap {
            word-break:break-word;
        }
    </style>
<script type="text/javascript">

    Sys.Application.add_load(function () {
        SelectedChange();
    })

    var scrollPosX = 0;
    var scrollPosY = 0;

    function OpenWin(m)
    {
        var signWindowWidth = '<%=signWindowWidth%>';
        var signWindowHeight = '<%=signWindowHeight%>';
        var taskId = $uof.tool.htmlDecode($("#<%=Hidden1.ClientID%>").val());
        var SaveFormLog = true;
        

        Window_OnClick();
        //觀看表單
        if (m == 1) {
            scrollPosX = window.scrollX;
            scrollPosY = window.scrollY;
            window.scrollTo(0, 0);
            $uof.dialog.open2('~/WKF/FormUse/ViewForm.aspx', '', '', signWindowWidth, signWindowHeight, function () { window.scrollTo(scrollPosX, scrollPosY); return false; }, { "TASK_ID": taskId });
        }
        //觀看流程
        if (m == 2)
        {
            scrollPosX = window.scrollX;
            scrollPosY = window.scrollY;
            window.scrollTo(0,0);
            $uof.dialog.open2('~/WKF/FormUse/SiteSignInfo.aspx','','',800,600,function(){  window.scrollTo(scrollPosX,scrollPosY); return false;},{"TASK_ID":taskId});
        }
        //表單列印
        if (m == 3)
        {
        //改用Window.open
            //$uof.dialog.open2('~/WKF/FormUse/FormPrint.aspx','','',800,768,function(){return false;},{"TASK_ID":taskId});
            var w=$uof.tool.printScreenSize('w', 800);
            var h=$uof.tool.printScreenSize('h', 768);
            var url = '../FormUse/FormPrint.aspx?TASK_ID=' + taskId;

            $uof.window.open(url, w, h, true); 

            return false;
        }
        //表單作廢
        if (m == 4)
        {         
            scrollPosX = window.scrollX;
            scrollPosY = window.scrollY;
            window.scrollTo(0,0);
            $uof.dialog.open2('~/WKF/Responsible/CancelForm.aspx','','',550,120,menuResult,{"TASK_ID":taskId});
        }
        //強制結案
        if (m == 5)
        {
            scrollPosX = window.scrollX;
            scrollPosY = window.scrollY;
            window.scrollTo(0,0);
            $uof.dialog.open2('~/WKF/Responsible/EndForm.aspx','','',500,350,menuResult,{"TASK_ID":taskId});
        }
        //結案復原
        if ( m == 6)
        {
            scrollPosX = window.scrollX;
            scrollPosY = window.scrollY;
            window.scrollTo(0,0);
            $uof.dialog.open2('~/WKF/Responsible/ReturnForm.aspx','','',500,350,menuResult,{"TASK_ID":taskId});
        }
        //解除鎖定
        if ( m == 7)
        {
            scrollPosX = window.scrollX;
            scrollPosY = window.scrollY;
            window.scrollTo(0,0);
            $uof.dialog.open2('~/WKF/Responsible/unLock.aspx','','',500,350,menuResult,{"TASK_ID":taskId});
        }
        //送往下一站
        if ( m == 8 )
        {
            scrollPosX = window.scrollX;
            scrollPosY = window.scrollY;
            window.scrollTo(0,0);
            $uof.dialog.open2('~/WKF/Admin/SendNextSite.aspx','','',620,380,menuResult,{"TASK_ID":taskId,"SaveFormLog":SaveFormLog});
        }
        //指定簽核(設定代理人)
        if ( m == 9)
        {
            scrollPosX = window.scrollX;
            scrollPosY = window.scrollY;
            window.scrollTo(0,0);
            $uof.dialog.open2('~/WKF/Admin/ListNodeSigner.aspx','','',800,600,function(){return false;},{"TASK_ID":taskId,"SaveFormLog":SaveFormLog});
        }
        //跟催
        if ( m == 10 )
        {
            scrollPosX = window.scrollX;
            scrollPosY = window.scrollY;
            window.scrollTo(0,0);
            $uof.dialog.open2('~/WKF/FormUse/hurryToSign.aspx','','',500,500,function(){return false;},{"TASK_ID":taskId,"SaveFormLog":SaveFormLog});
        }
        //變更審核結果
        if ( m == 11 )
        {
            scrollPosX = window.scrollX;
            scrollPosY = window.scrollY;
            window.scrollTo(0,0);
            $uof.dialog.open2('~/WKF/Responsible/ChangeSignResult.aspx','','',400,300,menuResult,{"TASK_ID":taskId});
        }
    }
    
    function menuResult (returnValue){
        window.scrollTo(scrollPosX,scrollPosY);

        if(typeof(returnValue)=="undefined")
            return false;
        else
        {
            SetDialogType('DialogOrgEvent');
            return true;
        }
    }

    function CancelFormFailAlert()
    {
        alert('<%=lblRemoveLockFail.Text %>');
    }

    //按查詢後，表單名稱會跳回所有類別的表單，所以加這段，讓最後再跑一次OnCategorySelectedChange()
    Sys.Application.add_load(function() {
        OnCategorySelectedChange();
    });


    function OnCategorySelectedChange() {
        
        //取得原本的資訊
        var originalFormId = $("#<%=DropDownListFormName.ClientID%> > option:selected").val()        
        var originalCategoryId = $("#<%=hfOriginalCategoryId.ClientID%>").val();

        //清空表單名稱下拉選單
        $("#<%=DropDownListFormName.ClientID%>").html("");

        //取得所選擇的表單類別Id
        var categoryId = $("#<%=ddlFormCategory.ClientID%> > option:selected").val();
        var data = [categoryId];

        //呼叫後端method取得該類別下有權限的表單名稱
        var formList = $uof.pageMethod.sync("GetFormList", data);

        //將回傳值轉回物件才可以跑回圈抓出資料
        var obj = JSON.parse(formList);
        
        //跑迴圈把JSON的內容組成DropDownListFormName的HTML
        $.each(obj, function(i,val) {
            if(categoryId != originalCategoryId){
                //有變換類別，要讓預設值回到第一筆
                $("#<%=DropDownListFormName.ClientID%>").append($("<option></option>").val(i).html(val));
            }
            else {
                if(originalFormId == i)  //查詢完表單名稱還要是查詢前所指定的
                    $("#<%=DropDownListFormName.ClientID%>").append($("<option></option>").val(i).html(val).attr('selected', 'selected'));
                else
                    $("#<%=DropDownListFormName.ClientID%>").append($("<option></option>").val(i).html(val));
            }
        });
        
        //將原本類別Id寫到HiddenField
        $("#<%=hfOriginalCategoryId.ClientID%>").val($("#<%=ddlFormCategory.ClientID%> > option:selected").val());
    }

</script>

<script id="selectjs" type="text/javascript">

    

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

    .minWidth{
        min-width: 200px;
    }
</style>
        <asp:UpdatePanel ID="UpdatePanelTab" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="1" Width="100%" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick">
        <Tabs>
            <telerik:RadTab runat="server" Value="FormAdmin" Selected="True">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Value="FormSet" >
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
            </ContentTemplate>
            </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanelGrid" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
   
                <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="1" Width="100%" Height="100%">
                    <telerik:RadPageView ID="RadPageView1" runat="server">
                        <table cellpadding="0" cellspacing="0" style="border: 0; width: 100%; vertical-align:top;" class="tbbg01">
                            <tr valign="top">
                                <td width="100%" align="center">
                                    <div onclick="Window_OnClick()">

                                        <table width="70%" style="text-align: left;">
                                            <tr>
                                                <td>
                                                    <table class="PopTable" cellspacing="1">
                                                        <tr>
                                                            <td colspan="4" class="PopTableHeader" align="center">
                                                                <center>
                                                    <asp:Label ID="Label7" 
                                                            runat="server" Text="查詢條件" meta:resourcekey="Label7Resource1"></asp:Label>
                                                            </center>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td style="white-space:nowrap; text-align:right">
                                                                <asp:Label ID="Label10" runat="server" Text="表單類別：" meta:resourcekey="Label10Resource1"></asp:Label>
                                                            </td>
                                                            <td style="white-space:nowrap; text-align:left" colspan="3">
                                                                <asp:DropDownList ID="ddlFormCategory" runat="server" CssClass="minWidth" onchange="OnCategorySelectedChange()" meta:resourcekey="ddlFormCategoryResource1">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td nowrap="nowrap" align="right" width="25%" class="PopTableLeftTD">
                                                                <asp:Label ID="Label1" runat="server" Text="表單名稱：" meta:resourcekey="Label1Resource1"></asp:Label>
                                                            </td>
                                                            <td width="25%" class="PopTableRightTD">
                                                                <asp:DropDownList ID="DropDownListFormName" CssClass="minWidth" runat="server" meta:resourcekey="DropDownListFormNameResource1">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td nowrap="nowrap" align="right" width="25%" class="PopTableLeftTD">
                                                                <asp:Label ID="Label2" runat="server" Text="表單狀態：" meta:resourcekey="Label2Resource1"></asp:Label></td>
                                                            <td width="25%" class="PopTableRightTD">
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
                                                            <td nowrap="nowrap" align="right" width="25%" class="PopTableLeftTD">
                                                                <asp:Label ID="Label3" runat="server" Text="申請者："
                                                                    meta:resourcekey="Label3Resource1"></asp:Label></td>
                                                            <td colspan="3" width="75%" class="PopTableRightTD">
                                                                <asp:TextBox ID="tbx_Applicant"
                                                                    runat="server" meta:resourcekey="tbx_ApplicantResource1"></asp:TextBox>
                                                                <asp:Label ID="Label8" runat="server" Text="(可輸入姓名、帳號、身分證字號)"
                                                                    CssClass="SizeMemo" meta:resourcekey="Label8Resource1"></asp:Label></td>
                                                        </tr>

                                                        <tr>
                                                            <td nowrap="nowrap" align="right" width="25%" class="PopTableLeftTD">
                                                                <asp:Label ID="Label4" runat="server" Text="申請時間："
                                                                    meta:resourcekey="Label4Resource1"></asp:Label></td>
                                                            <td colspan="3" width="75%" class="PopTableRightTD">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <telerik:RadDatePicker ID="ApplicantBeginDate" runat="server" Width="170px" ></telerik:RadDatePicker>
                                                                        </td>

                                                                        <td>&nbsp;~&nbsp;</td>
                                                                        <td>
                                                                            <telerik:RadDatePicker ID="ApplicantEndDate" runat="server" Width="170px"></telerik:RadDatePicker>
                                                                        </td>
                                                                        <td>
                                                                            <asp:RequiredFieldValidator ID="RaApplicantBeginDate" runat="server"
                                                                                ControlToValidate="ApplicantBeginDate" Display="Dynamic"
                                                                                meta:resourcekey="RaApplicantBeginDateResource1" Text="申請開始日期不可空白"></asp:RequiredFieldValidator>
                                                                            <asp:RequiredFieldValidator ID="RaApplicantEndDate" runat="server"
                                                                                ControlToValidate="ApplicantEndDate" Display="Dynamic"
                                                                                meta:resourcekey="RaApplicantEndDateResource1" Text="申請結束日期不可空白"></asp:RequiredFieldValidator>


                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>

                                                        <tr id="endTimeTD" style="display: none">
                                                            <td nowrap="nowrap" align="right" width="25%" class="PopTableLeftTD">
                                                                <asp:Label ID="Label5" runat="server" Text="結案時間：" meta:resourcekey="Label5Resource1"></asp:Label>
                                                            </td>
                                                            <td colspan="3" width="75%" class="PopTableRightTD">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <telerik:RadDatePicker ID="EndFormBeginDate" runat="server" Width="170px"></telerik:RadDatePicker>
                                                                        </td>
                                                                        <td>&nbsp;~&nbsp;</td>
                                                                        <td>
                                                                            <telerik:RadDatePicker ID="EndFormEndDate" runat="server" Width="170px"></telerik:RadDatePicker>
                                                                        </td>
                                                                        <td>
                                                                            <asp:RequiredFieldValidator ID="RaEndFormBeginDate" runat="server"
                                                                                ControlToValidate="EndFormBeginDate" Display="Dynamic"
                                                                                meta:resourcekey="RaEndFormBeginDateResource1" 
                                                                                Text="結案開始日期不可空白">
                                                                            </asp:RequiredFieldValidator>
                                                                            <asp:RequiredFieldValidator ID="RaEndFormEndDate" runat="server"
                                                                                ControlToValidate="EndFormEndDate" Display="Dynamic"
                                                                                meta:resourcekey="RaEndFormEndDateResource1" 
                                                                                Text="結案結束日期不可空白">
                                                                            </asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td nowrap="nowrap" align="right" width="25%" class="PopTableLeftTD">
                                                                <asp:Label ID="Label6" runat="server" Text="單號條件：" 
                                                                    meta:resourcekey="Label6Resource1">
                                                                </asp:Label>
                                                            </td>
                                                            <td colspan="3" width="75%" class="PopTableRightTD" style="white-space: nowrap;">
                                                                <asp:RadioButton ID="searchKeyword" runat="server" Text="單號關鍵字" 
                                                                    Checked="True" GroupName="SearchGroup" onclick="rbClick(0)" 
                                                                    meta:resourcekey="searchKeywordResource1" />
                                                                <asp:TextBox ID="tbx_Keyword" runat="server" Width="120px"></asp:TextBox>
                                                                <asp:RadioButton ID="searchSE" runat="server" Text="起迄" 
                                                                    GroupName="SearchGroup" onclick="rbClick(1)" 
                                                                    meta:resourcekey="searchSEResource1" />
                                                                <asp:TextBox ID="tbx_BeginDocNbr" runat="server" Width="120px"></asp:TextBox>
                                                                &nbsp;~&nbsp;
                                                                <asp:TextBox ID="tbx_EndDocNbr" runat="server" Width="120px"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td nowrap="nowrap" align="right" width="25%" class="PopTableLeftTD">
                                                                <asp:Label ID="lbl_SignJobTitle" runat="server" Text="簽核者職級："
                                                                    meta:resourcekey="lbl_SignJobTitleResource1">
                                                                </asp:Label>
                                                            </td>
                                                            <td width="25%" class="PopTableRightTD" colspan="3">
                                                                <asp:DropDownList ID="ddlSignJobTitle" runat="server"
                                                                    meta:resourcekey="ddlSignJobTitleResource1">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <asp:Button ID="btn_Search" runat="server" Text="查詢" OnClick="btn_Search_Click" 
                                            CssClass="CursorHand" meta:resourcekey="btn_SearchResource1" />
                                        <br />

                                        <div style="text-align: left">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline">
                                                <ContentTemplate>
                                                    <Fast:Grid ID="DGDraftList" runat="server" Width="100%" PageSize="15" EnhancePager="True" DataKeyOnClientWithCheckBox="False" AllowPaging="True" CustomDropDownListPage="True" AutoGenerateCheckBoxColumn="False" AllowSorting="True" OnPageIndexChanging="DGDraftList_PageIndexChanging" AutoGenerateColumns="False" OnRowDataBound="DGDraftList_RowDataBound" OnSorting="DGDraftList_Sorting" DataKeyNames="TASK_ID" DefaultSortDirection="Ascending" OnBeforeExport="DGDraftList_BeforeExport">
                                                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl=""
                                                            FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl=""
                                                            NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
                                                            PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                                                            PreviousImageUrl="" />
                                                        <ExportExcelSettings AllowExportToExcel="True" DataSourceType="ObjectDataSource"/>
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource1">
                                                                <ItemTemplate></ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </Fast:Grid>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btn_Search" EventName="Click"></asp:AsyncPostBackTrigger>
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>

                                        <div class="contextMenu" id="contextRoleView" style="display: none; left: 870px; top: 69px;">
                                            <table cellspacing="0" cellpadding="0" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="center" style="background-color: darkolivegreen" valign="top">
                                                            <nobr><SPAN style="COLOR: #ffffff"><asp:Label id="Label9" runat="server" Text="功能表" meta:resourcekey="Label9Resource1"></asp:Label></SPAN></nobr>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="menuItem" valign="top" style="background-color: #ececec">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td width="3" runat="server" id="ViewForm">&nbsp;</td>
                                                                    <td nowrap>&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="#" Text="觀看內容" meta:resourcekey="HyperLink1Resource1" onclick="OpenWin(1);return;"></asp:HyperLink></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="menuItem" valign="top" style="background-color: #ececec">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td width="3" runat="server" id="ViewFlow">&nbsp;</td>
                                                                    <td nowrap>&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="#" Text="觀看流程" meta:resourcekey="HyperLink2Resource1" onclick="OpenWin(2);return;"></asp:HyperLink></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="menuItem" valign="top" style="background-color: #ececec">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td width="3" runat="server" id="PrintForm">&nbsp;</td>
                                                                    <td nowrap>&nbsp;<asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="#" Text="列印表單" meta:resourcekey="HyperLink3Resource1" onclick="OpenWin(3);return;"></asp:HyperLink></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>

                                                    <tr id="CancelFormTR" style="display: none">
                                                        <td class="menuItem" valign="top" style="background-color: #ececec">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td width="3" runat="server" id="CancelForm">&nbsp;</td>
                                                                    <td nowrap>&nbsp;<asp:Label ID="lblCancelForm" runat="server" Text="作廢"  meta:resourcekey="hand_CancelFormTRResource1"></asp:Label><asp:HyperLink ID="hand_CancelFormTR" runat="server" NavigateUrl="#" Text="作廢" meta:resourcekey="hand_CancelFormTRResource1" onclick="OpenWin(4);"></asp:HyperLink></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>

                                                    <tr id="EndFormTR" style="display: none">
                                                        <td class="menuItem" valign="top" style="background-color: #ececec">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td width="3" runat="server" id="EndForm">&nbsp;</td>
                                                                    <td nowrap>&nbsp;<asp:Label ID="lblEndForm" runat="server" Text="強制結案"  meta:resourcekey="hand_EndFormTRResource1"></asp:Label><asp:HyperLink ID="hand_EndFormTR" runat="server" NavigateUrl="#" Text="強制結案" meta:resourcekey="hand_EndFormTRResource1" onclick="OpenWin(5);"></asp:HyperLink></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>

                                                    <tr id="ReturnFormTR" style="display: none">
                                                        <td class="menuItem" valign="top" style="background-color: #ececec">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td width="3" runat="server" id="ReturnForm">&nbsp;</td>
                                                                    <td nowrap>&nbsp;<asp:Label ID="lblReturnForm" runat="server" Text="結案復原"  meta:resourcekey="hand_ReturnFormTRResource1"></asp:Label><asp:HyperLink ID="hand_ReturnFormTR" runat="server" NavigateUrl="#" Text="結案復原" meta:resourcekey="hand_ReturnFormTRResource1" onclick="OpenWin(6);"></asp:HyperLink></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>

                                                    <tr id="unLockFormTR" style="display: none">
                                                        <td class="menuItem" valign="top" style="background-color: #ececec">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td width="3" runat="server" id="unLockForm">&nbsp;</td>
                                                                    <td nowrap>&nbsp;<asp:Label ID="lblunLockForm" runat="server" Text="解除鎖定"  meta:resourcekey="hand_unLockFormTRResource1"></asp:Label><asp:HyperLink ID="hand_unLockFormTR" runat="server" NavigateUrl="#" Text="解除鎖定" meta:resourcekey="hand_unLockFormTRResource1" onclick="OpenWin(7);"></asp:HyperLink></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>

                                                    <tr id="AssignNextSingerTR" style="display: none">
                                                        <td class="menuItem" valign="top" style="background-color: #ececec">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td width="3" runat="server" id="AssignNextSinger">&nbsp;</td>
                                                                    <td nowrap>&nbsp;<asp:Label ID="lblAssignNextSigner" runat="server" Text="送下一站"  meta:resourcekey="hand_AssignNextSingerTRResource1"></asp:Label><asp:HyperLink ID="hand_AssignNextSingerTR" runat="server" NavigateUrl="#" Text="送下一站" meta:resourcekey="hand_AssignNextSingerTRResource1" onclick="OpenWin(8);"></asp:HyperLink></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>

                                                    <tr id="AssignSingerTR" style="display: none">
                                                        <td class="menuItem" valign="top" style="background-color: #ececec">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td width="3" runat="server" id="AssignSinger">&nbsp;</td>
                                                                    <td nowrap>&nbsp;<asp:Label ID="lblAssignSigner" runat="server" Text="指定簽核"  meta:resourcekey="hand_AssignSingerTRResource1"></asp:Label><asp:HyperLink ID="hand_AssignSingerTR" runat="server" NavigateUrl="#" Text="指定簽核" meta:resourcekey="hand_AssignSingerTRResource1" onclick="OpenWin(9);"></asp:HyperLink></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>

                                                    <tr id="HurryFormTR" style="display: none">
                                                        <td class="menuItem" valign="top" style="background-color: #ececec">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td width="3" runat="server" id="HurryForm">&nbsp;</td>
                                                                    <td nowrap>&nbsp;<asp:Label ID="lblHurryForm" runat="server" Text="跟催"  meta:resourcekey="hand_HurryFormTRResource1"></asp:Label><asp:HyperLink ID="hand_HurryFormTR" runat="server" NavigateUrl="#" Text="跟催" meta:resourcekey="hand_HurryFormTRResource1" onclick="OpenWin(10);"></asp:HyperLink></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>

                                                    <tr id="ChangeResultTR" style="display: none">
                                                        <td class="menuItem" valign="top" style="background-color: #ececec">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td width="3" runat="server" id="ChangeResult">&nbsp;</td>
                                                                    <td nowrap>&nbsp;<asp:Label ID="lblChangeResult" runat="server" Text="變更審核結果"  meta:resourcekey="hand_ChangeResultTRResource1"></asp:Label><asp:HyperLink ID="hand_ChangeResultTR" runat="server" NavigateUrl="#" Text="變更審核結果" meta:resourcekey="hand_ChangeResultTRResource1" onclick="OpenWin(11);"></asp:HyperLink></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>

                                            </table>
                                        </div>
                                        <asp:HiddenField ID="Hidden1" runat="server" />
                                        <asp:HiddenField ID="Hidden2" runat="server" />
                                    </div>

                                    <asp:Label ID="lblRemoveLockFail" runat="server" Text="表單作廢失敗，可能同時間有人異動表單狀態" Visible="False" meta:resourcekey="lblRemoveLockFailResource1"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="RadPageView2" runat="server">
                        <asp:Label ID="lbConfirmDelete" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
                        <asp:Label ID="lblYes" runat="server" Text="是" Visible="False" meta:resourcekey="lblYesResource1"></asp:Label>
                        <asp:Label ID="lblNo" runat="server" Text="否" Visible="False" meta:resourcekey="lblNoResource1"></asp:Label>
                        <asp:Label ID="lblDay" runat="server" Text="日" Visible="False" meta:resourcekey="lblDayResource1"></asp:Label>
                        <asp:Label ID="lblHour" runat="server" Text="時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </ContentTemplate>
        </asp:UpdatePanel>
    <asp:Label ID="lblTabName1" runat="server" Text=" 表單負責人管理 " Visible="False" meta:resourcekey="lblTabName1Resource1"></asp:Label>
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
    <asp:Label ID="lblLabel10" runat="server" Text="停留時間" Visible="False" meta:resourcekey="lblLabel10Resource1"></asp:Label>
    <asp:Label ID="lblLabel11" runat="server" Text="表單標題" Visible="False" meta:resourcekey="lblLabel11Resource1"></asp:Label>

    <asp:Label ID="lblLabelStatus1" runat="server" Text="處理中" Visible="False" meta:resourcekey="lblLabelStatus1Resource1"></asp:Label>
    <asp:Label ID="lblLabelStatus2" runat="server" Text="結案(通過)" Visible="False" meta:resourcekey="lblLabelStatus2Resource1"></asp:Label>
    <asp:Label ID="lblLabelStatus3" runat="server" Text="結案(否決)" Visible="False" meta:resourcekey="lblLabelStatus3Resource1"></asp:Label>
    <asp:Label ID="lblLabelStatus4" runat="server" Text="結案(作廢)" Visible="False" meta:resourcekey="lblLabelStatus4Resource1"></asp:Label>
    <asp:Label ID="lblLabelStatus5" runat="server" Text="異常" Visible="False" meta:resourcekey="lblLabelStatus5Resource1" ForeColor="Red"></asp:Label>
    <asp:Label ID="lblLabelStatus6" runat="server" Text="退回申請者" Visible="False" meta:resourcekey="lblLabelStatus6Resource1"></asp:Label>
    <asp:HiddenField ID="hfOriginalCategoryId" runat="server" />
    <asp:Label ID="lblAllCategoryText" runat="server" Text="所有表單類別" Visible="False" meta:resourcekey="lblAllCategoryTextResource1"></asp:Label>

    <%--站點停留時間使用--%>
    <asp:Label ID="labDay" runat="server" Text="天" Visible="False" meta:resourcekey="labDayResource1"></asp:Label>
    <asp:Label ID="labHour" runat="server" Text="時" Visible="False" meta:resourcekey="labHourResource1"></asp:Label>
    <asp:Label ID="labMin" runat="server" Text="分" Visible="False" meta:resourcekey="labMinResource1"></asp:Label>

</asp:Content>


