<%@ Page Language="C#" AutoEventWireup="true" Title="列印" Inherits="WKF_FormUse_FreeTask_FormPrint" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="FormPrint.aspx.cs" %>

<%@ Register Src="../FormManagement/UC_FormFileCenter.ascx" TagName="UC_FormFileCenter" TagPrefix="uc2" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="FormIQY/UC_QueryIqyTask.ascx" TagName="UC_QueryIqyTask" TagPrefix="uc3" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc4" TagName="UC_FileCenter" %>
<%@ Register Src="~/WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollectionUsing.ascx" TagPrefix="uc1" TagName="UC_VersionFieldCollectionUsing" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" TagPrefix="uc2" TagName="VersionFieldCollectionUsingUC" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="referrer" content="no-referrer" />
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>
    <link id="Link4" href="~/Common/Style/cssReset.css" rel="stylesheet" runat="server" />
    <link id="Link2" href="~/Common/Style/uof-fixed.css" rel="stylesheet" runat="server" />
    <link id="Link3" href="~/Common/Style/telerik.css" rel="stylesheet" runat="server" />
</head>
<body runat="server" id="Body">
    <form id="form1" runat="server">



        <script type="text/javascript">

            Sys.Application.add_load(function () {
                //20200618 brian新增，讓列印時檔案不再可開啟超連結
                //20210129 brian修改，將移除超連結功能移至add_load
                $('.uploaderv3item a').removeAttr("href").removeAttr("target").removeAttr("onclick");
                try {
                    //隱藏所有欄位的填寫者Label
                    $('.FillerVisible').hide();
                    //因進入此頁面的路徑不同，會影響[顯示填寫者]預設勾選或不勾選，故於此處再判斷一次[顯示填寫者]的勾選狀態，決定顯示/隱藏所有欄位的填寫者
                    oncbShowFillerChecked();
                }
                catch (e) {
                }
            });

            $(function () {
                //表單計算欄位
                try {
                    calculate();
                    SetDivZero();
                } catch (e) {
                }
            });

            //20130912 簽名檔過大時，限制大小為100*100
            function CheckSize(imageID) {
                var img = $('#' + imageID);
                var width = img.width();
                var height = img.height();

                if (width > 100)
                    img.width(100);
                if (height > 100)
                    img.height(100);
            }


            function PrintPage(o) {
                $("#PrintStatus").hide();
                
                $("#<%=PrintInfo.ClientID %>").hide();
                $(o).hide();
                if($("#hfFieldStyle").val() != "Tradition")
                {
                    $(".TableLayout > tbody > tr > td > table[class*='PrintHide']").each(
                        function()
                        {
                            var tds = $(this).parent("td").parent("tr").children("td");
                            var allPrintHide = true;
                            var tmpTds = [];
                            tds.each(
                                function()
                                {
                                    var tmpClass = $(this).children("table").prop("class");
                                    if(tmpClass.indexOf("fieldEmpty") == -1 && tmpClass.indexOf("PrintHide") == -1)
                                    {
                                        allPrintHide = false;
                                    }

                                    if (tmpClass.indexOf("fieldEmpty") >= 0) 
                                    { 
                                        $(this).children("table").addClass("PrintHide");
                                    }

                                    tmpTds.push($(this));
                                }
                        
                            );

                            if(allPrintHide)
                            {
                                if ($("#hfFieldStyle").val() == "Simple") {

                                    $.each(tmpTds, function () {
                                        tr = $(this).addClass("PrintHideLine");
                                    });
                                }
                                else {
                                    tds.each(
                                        function()
                                        {
                                            $(this).addClass("PrintHideLine");
                                        }
                                    );
                                }
                            }                        
                        }
                    );
                }
                $(".PrintHide").hide();
                window.print();
                $(".fieldEmpty").removeClass("PrintHide");
                $(".PrintHideLine").removeClass("PrintHideLine");
                $("#<%=PrintInfo.ClientID %>").show();
                $(o).show();
                $("#PrintStatus").show();
                $(".PrintHide").show();
            }

            //加印簽核資訊
            function cbPrintFlow_CheckedChanged() {
                if ($("#<%=cbPrintFlow.ClientID %>").prop('checked')) {
                    $('#<%=pnlSignInfo.ClientID%>').show();
                    $('#<%=pnlSubSignInfo.ClientID%>').show();
                    $('#<%=tr1.ClientID%>').show();
                    $('#<%=tr2.ClientID%>').show();
                    $("#<%=cbSignature.ClientID %>").removeAttr("disabled");
                    $("#<%=cbComment.ClientID %>").removeAttr("disabled");
                }
                else {
                    $('#<%=pnlSignInfo.ClientID%>').hide();
                    $('#<%=pnlSubSignInfo.ClientID%>').hide();
                    $('#<%=tr1.ClientID%>').hide();
                    $('#<%=tr2.ClientID%>').hide();
                    $("#<%=cbSignature.ClientID %>").prop("disabled", true);
                    $("#<%=cbComment.ClientID %>").prop("disabled", true);
                }
            }

            function cbPrintRemark_CheckedChanged() {
                if (document.all["<%=cbPrintRemark.ClientID %>"].checked == true) {

                    for (i = 0; i < $("div[id='DvRemark']").length; i++) {
                        div = $("div[id='DvRemark']")[i];

                        $(div).show();
                    }
                }
                else {
                    for (i = 0; i < $("div[id='DvRemark']").length; i++) {
                        div = $("div[id='DvRemark']")[i];

                        $(div).hide();
                    }
                }
            }

            //Grid是否顯示電子簽章
            function signClick() {
                if ($("#<%=cbSignature.ClientID %>").prop('checked')) {
                    $(".formPrintSignature").show();
                }
                else
                    $(".formPrintSignature").hide();
            }

            //Grid是否顯示簽核意見
            function commentClick() {
                if ($("#<%=cbComment.ClientID %>").prop('checked')) {
                    $(".formPrintSignComment").show();
                }
                else
                    $(".formPrintSignComment").hide();
            }

            //完整顯示單複選項目
            function onFullOptionClick() {
                if ($("#<%=cbShowFullOption.ClientID %>").prop('checked')) {
                    $(".printSimpleLabel").hide();
                    $(".printFullOption").show();
                }
                else {
                    $(".printSimpleLabel").show();
                    $(".printFullOption").hide();
                }
            }
            //顯示填寫者
            function oncbShowFillerChecked() {
                if ($('#<%=cbShowFiller.ClientID %>').is(':checked')) {
                    $('.FillerVisible').show();
                }
                else {
                    $('.FillerVisible').hide();
                }
            }
        </script>
        <link rel="home" id="ApplicationRoot" href="" runat="server" enableviewstate="False" clientidmode="Static" />
        <div id="divBackground" runat="server">
            <telerik:RadScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
                <Scripts>
	                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
                    <asp:ScriptReference Path="~/Common/javascript/json2.min.js" />
                    <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery-ui.min.js" />
                    <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.blockUI.js" />
                    <asp:ScriptReference Path="~/Common/javascript/uofScript.js" />
                </Scripts>
            </telerik:RadScriptManager>
            <table style="width: 100%">
                <tr>
                    <td valign="top" style="height: 377px">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 19px; height: 19px;"></td>
                                <td style="height: 19px; text-align: right;">
                                    <asp:Label ID="lblNoAuthMessage"
                                        runat="server" ForeColor="Red" Text="*無此表單列印權限"
                                        meta:resourcekey="lblNoAuthMessageResource1"></asp:Label></td>
                                <td width="18" style="height: 19px"></td>
                            </tr>
                            <tr>
                                <td style="width: 19px">&nbsp;</td>
                                <td valign="top">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <table width="100%">
                                                                <tr id="PrintStatus">
                                                                    <td align="right" colspan="6">
                                                                        <asp:Panel ID="PrintInfo" runat="server" meta:resourcekey="PrintInfoResource1">
                                                                            <asp:CheckBox ID="cbPrintFlow" runat="server" Checked="True" onclick="cbPrintFlow_CheckedChanged();"
                                                                                Text="加印簽核意見" meta:resourcekey="cbPrintFlowResource1" />
                                                                            <asp:CheckBox ID="cbComment" runat="server" Checked="True" Text="顯示簽核意見" onclick="commentClick();" meta:resourcekey="cbCommentResource1" />
                                                                            <asp:CheckBox ID="cbSignature" runat="server" Checked="True" Text="顯示電子簽章" onclick="signClick();" meta:resourcekey="cbSignatureResource1" />
                                                                            <asp:CheckBox ID="cbPrintRemark" runat="server" Checked="True" onclick="cbPrintRemark_CheckedChanged();"
                                                                                Text="加印欄位備註" meta:resourcekey="cbPrintRemarkResource1" />
                                                                            <asp:CheckBox ID="cbShowFullOption" runat="server" Checked="True" onclick="onFullOptionClick();"
                                                                                Text="完整顯示單複選項目" meta:resourcekey="cbShowFullOptionResource1" />
                                                                            <asp:CheckBox ID="cbShowFiller" onclick="oncbShowFillerChecked()" runat="server" meta:resourcekey="cbShowFillerResource1" />
                                                                            <asp:Label ID="lblShowFiller" runat="server" Text="顯示填寫者" meta:resourcekey="lblShowFillerResource1"></asp:Label>
                                                                            <input id="Button1" onclick="PrintPage(this);" type="button" value="列印本畫面" runat="server" />
                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        </asp:Panel>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="30%">
                                                                        <asp:Label ID="Label1" runat="server" Text="申請人：" meta:resourcekey="Label1Resource1"></asp:Label>&nbsp;<asp:Label ID="lblApplicant" runat="server" meta:resourcekey="lblApplicantResource1"></asp:Label></td>
                                                                    <td width="10%"></td>
                                                                    <td style="text-align: right" width="20%">&nbsp;</td>
                                                                    <td width="30%">
                                                                        <asp:Label ID="Label7" runat="server" Text="列印者：" meta:resourcekey="Label7Resource1"></asp:Label>&nbsp;
                                                                        <asp:Label ID="lblPrinter" runat="server"
                                                                            meta:resourcekey="lblPrinterResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr id="agentLableDisplayTR" runat="server">
                                                                    <td class="auto-style1">
                                                                        <asp:Label ID="lblAgentApplicant" runat="server" Text="代理填寫者：" meta:resourcekey="lblAgentApplicantResource1"></asp:Label>&nbsp;
                                                                        <asp:Label ID="lblAgentUser" runat="server" meta:resourcekey="lblAgentUserResource1"></asp:Label>
                                                                    </td>
                                                                    <td class="auto-style1"></td>
                                                                    <td style="text-align: right" class="auto-style1"></td>
                                                                    <td class="auto-style1"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label2" runat="server" Text="申請時間：" meta:resourcekey="Label2Resource1"></asp:Label>&nbsp;
                                                                        <asp:Label ID="lblApplyTime" runat="server"
                                                                            meta:resourcekey="lblApplyTimeResource1"></asp:Label></td>
                                                                    <td></td>
                                                                    <td style="text-align: right">&nbsp;</td>
                                                                    <td>
                                                                        <asp:Label ID="Label5" runat="server" Text="列印時間：" meta:resourcekey="Label5Resource2"></asp:Label>&nbsp;
                                                                        <asp:Label ID="lblPrintTime" runat="server" meta:resourcekey="lblPrintTimeResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="height: 21px">&nbsp;</td>
                                                                    <td></td>
                                                                    <td style="text-align: right">&nbsp;</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                            <asp:Panel ID="Panel4" runat="server" Width="100%" meta:resourcekey="Panel1Resource2">
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                    <tr id="tr1" runat="server">
                                                        <td style="height: 19px"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Panel ID="pnlSignInfo" runat="server" Width="100%" meta:resourcekey="pnlSignInfoResource1">

                                                                <table cellpadding="0" cellspacing="0" style="width: 98%">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="lblSignInfo" runat="server" Font-Bold="True" Text="簽核資訊" meta:resourcekey="lblSignInfoResource1"></asp:Label>
                                                                            <asp:Label ID="lblTaskResult" runat="server" Font-Bold="True" ForeColor="Red" meta:resourcekey="lblTaskResultResource3"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="lblCancelFormReasonMsg" runat="server" Text="作廢原因：" Visible="False" meta:resourcekey="lblCancelFormReasonMsgResource1"></asp:Label>
                                                                            <asp:Label ID="lblCancelFormReason" runat="server" Visible="False" meta:resourcekey="lblCancelFormReasonResource1"></asp:Label>
                                                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/images/icon/email.png" meta:resourcekey="Image1Resource2" />
                                                                            <asp:Label ID="Label3" runat="server" Text="表單副本" meta:resourcekey="Label3Resource1"></asp:Label>
                                                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/images/icon/icon_m61.gif" meta:resourcekey="Image2Resource1" />
                                                                            <asp:Label ID="Label4" runat="server" Text="個人站點附件" meta:resourcekey="Label4Resource1"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <Fast:Grid ID="DGSignCommentList" runat="server" AllowSorting="True"
                                                                                AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                                                                                Width="100%" EnableTheming="True"
                                                                                OnRowDataBound="DGSignCommentList_RowDataBound"
                                                                                DataKeyOnClientWithCheckBox="False"
                                                                                EnhancePager="True" PageSize="15" DefaultSortDirection="Ascending"
                                                                                EmptyDataText="沒有資料"
                                                                                KeepSelectedRows="False" meta:resourcekey="DGSignCommentListResource3" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                                                                                <EnhancePagerSettings ShowHeaderPager="True" />
                                                                                <ExportExcelSettings AllowExportToExcel="False" />
                                                                                <Columns>
                                                                                    <asp:BoundField DataField="SITE" HeaderText="站點" meta:resourcekey="BoundFieldResource1">
                                                                                        <HeaderStyle Wrap="False" />
                                                                                        <ItemStyle HorizontalAlign="Center" Width="40px" />
                                                                                    </asp:BoundField>
                                                                                    <asp:TemplateField HeaderText="簽核者" meta:resourcekey="BoundFieldResource3">
                                                                                        <EditItemTemplate>
                                                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ORIGINAL_SIGNER_NAME") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                                                                        </EditItemTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSigner" runat="server" meta:resourcekey="lblSignerResource1" Text='<%# Bind("ORIGINAL_SIGNER_NAME") %>'></asp:Label>
                                                                                            <asp:ImageButton ID="imgCC" runat="server" meta:resourcekey="imgCCResource1" />
                                                                                            <asp:ImageButton ID="ibtnAttach" runat="server" ImageUrl="~/Common/images/icon/icon_m61.gif" meta:resourcekey="ibtnAttachResource1" />
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle Width="35%" Wrap="True" HorizontalAlign="Left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="簽核意見" meta:resourcekey="BoundFieldResource4">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblComment" runat="server" meta:resourcekey="lblCommentResource2"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle Wrap="False" CssClass="formPrintSignComment" />
                                                                                        <ItemStyle Width="35%" Wrap="True" HorizontalAlign="Left" CssClass="formPrintSignComment" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="簽核時間" meta:resourcekey="TemplateFieldResource4">
                                                                                        <EditItemTemplate>
                                                                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("BEGIN_TIME") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                                                                                        </EditItemTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblBeginTime" runat="server" meta:resourcekey="lblBeginTimeResource2"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle HorizontalAlign="Center" Width="10%" Wrap="False" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="結果" meta:resourcekey="TemplateFieldResource1">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSignStatus" runat="server" meta:resourceKey="lblSignStatusResource1"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle Wrap="False" />
                                                                                        <ItemStyle HorizontalAlign="Center" Wrap="False" Width="60px" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="電子簽章" meta:resourcekey="TemplateFieldResource2">
                                                                                        <ItemTemplate>
                                                                                            <asp:Image ID="Image1" runat="server" meta:resourcekey="Image1Resource1" ImageAlign="Middle" />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle CssClass="formPrintSignature" />
                                                                                        <ItemStyle Width="105px" Wrap="True" CssClass="formPrintSignature" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                            </Fast:Grid>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                    <tr id="tr2" runat="server">
                                                        <td style="height: 19px"></td>
                                                    </tr>
                                                </table>
                                                <asp:Panel ID="pnlSubSignInfo" runat="server" Height="100%" Width="100%" meta:resourcekey="pnlSubSignInfoResource1">
                                                    <asp:Table ID="Table1" runat="server" Width="100%" meta:resourcekey="Table1Resource1">
                                                    </asp:Table>
                                                    <table border="0" width="100%">
                                                        <tr>
                                                            <td valign="top" width="15%" nowrap="nowrap">
                                                                <asp:Label runat="server" ID="lblFile" meta:resourceKey="lblFileResource1" Text="相關附件(表單)："></asp:Label></td>
                                                            <td valign="top">
                                                                <uc4:UC_FileCenter runat="server" ID="UC_FileCenter" ProxyEnabled="true" ModuleName="WKF" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" valign="top" width="100%">
                                                                <uc3:UC_QueryIqyTask ID="UC_QueryIqyTask1" runat="server" width="100%" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>

                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <asp:HiddenField ID="hfFieldStyle" runat="server"/>
        <asp:Label ID="lblAttach" runat="server" Text="附件" Visible="False" meta:resourcekey="lblAttachResource1"></asp:Label>
        <asp:Label ID="lblOriginalSigner" runat="server" Text="原簽核者" Visible="False" meta:resourcekey="lblOriginalSignerResource1"></asp:Label>
        <asp:Label ID="lblCC" runat="server" Text="副本" Visible="False" meta:resourcekey="lblCCResource1"></asp:Label>
        <asp:Label ID="lblOrSigned" runat="server" Text="已由他人簽核" Visible="False" meta:resourcekey="lblOrSignedResource1"></asp:Label>
        <asp:Label ID="lblapplication" runat="server" Text="申請" Visible="False" meta:resourcekey="lblapplicationResource1"></asp:Label>
        <asp:Label ID="lblAgree" runat="server" Text="核准" Visible="False" meta:resourcekey="lblAgreeResource1"></asp:Label>
        <asp:Label ID="lblDisagree" runat="server" Text="不同意" Visible="False" meta:resourcekey="lblDisagreeResource1"></asp:Label>
        <asp:Label ID="lblBack" runat="server" Text="退簽" Visible="False" meta:resourcekey="lblBackResource1"></asp:Label>
        <asp:Label ID="lblNoComment" runat="server" Text="沒意見" Visible="False" meta:resourcekey="lblNoCommentResource1"></asp:Label>
        <asp:Label ID="lblNull" runat="server" Text="未簽核" Visible="False" meta:resourcekey="lblNullResource1"></asp:Label>
        <asp:Label ID="lblSite" runat="server" Text="站點" Visible="False" meta:resourcekey="lblSiteResource1"></asp:Label>
        <asp:Label ID="lblOSName" runat="server" Text="應簽核者" Visible="False" meta:resourcekey="lblOSNameResource1"></asp:Label>
        <asp:Label ID="lblASName" runat="server" Text="簽核者" Visible="False" meta:resourcekey="lblASNameResource1"></asp:Label>
        <asp:Label ID="lblSSStatus" runat="server" Text="簽核狀態" Visible="False" meta:resourcekey="lblSSStatusResource1"></asp:Label>
        <asp:Label ID="lblCommentText" runat="server" Text="簽核意見" Visible="False" meta:resourcekey="lblCommentResource2"></asp:Label>
        <asp:Label ID="lblSubFlow" runat="server" Text="副流程：" Visible="False" meta:resourcekey="lblSubFlowResource1"></asp:Label>
        <asp:Label ID="lblSubSignInfo0" runat="server" Text="的簽核資訊" Visible="False" meta:resourcekey="lblSubSignInfo0Resource1"></asp:Label>
        <asp:Label ID="lblPrint" runat="server" Text="列印本畫面" Visible='False' meta:resourcekey="lblPrintResource1"></asp:Label>
        <asp:Label ID="lblCanelForm" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblCanelFormResource3"></asp:Label>
        <asp:Label ID="lblApplicantResult" runat="server" Text="申請結果：" Visible="False" meta:resourcekey="lblApplicantResultResource1"></asp:Label>
        <asp:Label ID="lblCancelMsg" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblCancelMsgResource1"></asp:Label>
        <asp:Label ID="lblAdditionalSiteMsg" runat="server" Text="加簽" Visible="False" meta:resourcekey="lblAdditionalSiteMsgResource1"></asp:Label>
        <asp:Label ID="lblSend" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSendResource1"></asp:Label>
        <asp:Label ID="lblNodata" runat="server" Text="表單已被刪除，無法找到表單相關資訊" Visible="False" meta:resourcekey="lblNodataResource1"></asp:Label>
        <asp:Label ID="lblAgentSign" runat="server" Text="由 {#User} 代理簽核" Visible="False" meta:resourcekey="lblAgentSignResource1" ></asp:Label>
        <asp:Label ID="lblCancelSign" runat="server" Text="由 {#User} 作廢" Visible="False" meta:resourcekey="lblCancelSignResource1" ></asp:Label>
        <asp:Label ID="lblAgentSign2" runat="server" Text="代理簽核" Visible="False" meta:resourcekey="lblAgentSign2Resource1" ></asp:Label>
        <asp:Label ID="lblForcedClosure" runat="server" Text="強制結案" Visible="False" meta:resourcekey="lblForcedClosureResource1" ></asp:Label>
        <asp:Label ID="lblAddtionalMsg" runat="server" Text="加簽" Visible="False" meta:resourcekey="lblAddtionalMsgResource1"></asp:Label>
         <asp:Label ID="lblAdditionalSign" runat="server" Text="由 {#User} 加簽" Visible="False" meta:resourcekey="lblAdditionalSignResource1"></asp:Label>
    </form>
</body>
</html>
