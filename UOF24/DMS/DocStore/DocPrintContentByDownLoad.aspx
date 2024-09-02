<%@ Page Title="列印" Language="C#" AutoEventWireup="true"
    Inherits="DMS_DocStore_DocPrintContentByDownLoad" Culture="auto" meta:resourcekey="PageResource1"
    UICulture="auto" Codebehind="DocPrintContentByDownLoad.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head runat="server">
    <script src="../../Common/javascript/jQuery/jquery.js?v=19.50"></script>
</head>
<body>
        <style type="text/css">
        div.JustAddBorder table tr td {
            border-width: 1px;
            border-style: solid;
        }
    </style>

    <script type="text/javascript">

        function printPage() {
           $("#PrintStatus").hide();
            window.print();
            $("#PrintStatus").show();
        }

        //顯示文件資訊
        function ShowInform(args) {
            if ($(args).prop("checked")) {
                
                $("#information").show();
            }
            else {
                $("#information").hide();
            }
        }

        //顯示表單流程
        function ShowFormFlow(args) {
            var flow = $("#<%=flow.ClientID %>");

            if (flow.length > 0 && $(args).prop("checked")) {
                $("#<%=flow.ClientID %>").show();
            }
            else {
                $("#<%=flow.ClientID %>").hide();
            }
        }
    </script>
    <form id="form1" runat="server">
        <table style="width: 100%; height: 100%;">
            <tr>
                <td valign="top" style="height: 758px">
                    <div id="PrintStatus" style="text-align: right;">
                        <asp:CheckBox ID="chkDocInform" runat="server" Text="顯示文件資訊" onclick="ShowInform(this);"
                            Checked="True" meta:resourcekey="chkDocInformResource1" />
                        <asp:CheckBox ID="chkFormFlow" runat="server" Text="顯示簽核流程" onclick="ShowFormFlow(this);"
                            Checked="True" meta:resourcekey="chkFormFlowResource1" />
                        <asp:Button ID="btnPrint" runat="server" Text="列印" OnClientClick="printPage(); return false;"
                            meta:resourcekey="btnPrintResource1" />
                    </div>
                    <div id="information">
                        <table border="1" cellpadding="0" cellspacing="0" style="width: 100%;" class="PopTable">
                            <colgroup class="PopTableLeftTD">
                            </colgroup>
                            <colgroup class="PopTableRightTD">
                            </colgroup>
                            <colgroup class="PopTableLeftTD">
                            </colgroup>
                            <colgroup class="PopTableRightTD">
                            </colgroup>
                            <tr>
                                <td align="right" style="height: 25px; width: 20%;" nowrap>
                                    <asp:Label ID="Label1" runat="server" Text="文件標題" meta:resourcekey="Label1Resource1"></asp:Label>
                                </td>
                                <td style="height: 25px; width: 80%; word-wrap: break-word" colspan="3">
                                    <asp:Label ID="labDocName" runat="server" meta:resourcekey="labDocNameResource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 25px; width: 20%;">
                                    <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource2" Text="目錄"></asp:Label>
                                </td>
                                <td colspan="3" style="height: 25px">
                                    <span style="word-break: break-all; width: 80%;">
                                        <img src="../../DMS/images/closed.gif" />
                                        <asp:Label ID="lblFolderName" runat="server" meta:resourcekey="lblFolderNameResource1"></asp:Label>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 25px; width: 20%;">&nbsp;<asp:Label ID="Label2" runat="server" Text="版本" meta:resourcekey="Label2Resource1"></asp:Label>
                                </td>
                                <td style="height: 25px; width: 30%;">&nbsp;<asp:Label ID="labDocVersion" runat="server" meta:resourcekey="labDocVersionResource1"></asp:Label>
                                </td>
                                <td align="right" style="height: 25px; width: 20%;">
                                    <asp:Label ID="Label6" runat="server" Text="狀態" meta:resourcekey="Label6Resource1"></asp:Label>
                                </td>
                                <td style="height: 25px; width: 30%;">
                                    <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="height: 25px; width: 20%;white-space:nowrap;">
                                    <asp:Label ID="lblSeriesText" runat="server" Text="文件編號" meta:resourcekey="lblSeriesTextResource1"></asp:Label>
                                </td>
                                <td style="height: 25px; width: 30%;">&nbsp;<asp:Label ID="lblSeries" runat="server" meta:resourcekey="labDocVersionResource1"></asp:Label>
                                </td>
                                <td align="right" style="height: 25px; width: 20%; white-space:nowrap;">
                                    <asp:Label ID="lblPublishDateText" runat="server" Text="公佈日期" meta:resourcekey="lblPublishDateTextResource1"></asp:Label>
                                </td>
                                <td style="height: 25px; width: 30%;">
                                    <asp:Label ID="lblPublishDate" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label>&nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="editorcontentstyle JustAddBorder" style="width: 100%; text-align: left; vertical-align: text-top;">
                        <asp:Label ID="lblContent" runat="server" meta:resourcekey="lblContentResource1" Height="100%" Width="100%"></asp:Label>
                    </div>
                    <table id="flow" runat="server" style="height: 152px; width: 100%">
                        <tr>
                            <td>
                                <br />
                                <asp:Label ID="lblSignInfo" runat="server" Font-Bold="True" Text="簽核資訊" meta:resourcekey="lblSignInfoResource1"></asp:Label>
                                <asp:Label ID="lblTaskResult" runat="server" Font-Bold="True" ForeColor="Red" meta:resourcekey="lblTaskResultResource3"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <Fast:Grid ID="DGSignCommentList" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                    AutoGenerateColumns="False"  
                                     Width="100%" EnableTheming="True" OnRowDataBound="DGSignCommentList_RowDataBound"
                                    DataKeyOnClientWithCheckBox="False" EnhancePager="True" PageSize="15" DefaultSortDirection="Ascending"
                                    EmptyDataText="No data found" EnableModelValidation="True" KeepSelectedRows="False"
                                    meta:resourcekey="DGSignCommentListResource3">
                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                    <ExportExcelSettings AllowExportToExcel="False" />
                                    <Columns>
                                        <asp:BoundField DataField="SITE" HeaderText="站點" meta:resourcekey="BoundFieldResource1">
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ORIGINAL_SIGNER_NAME" HeaderText="應簽核者" meta:resourcekey="BoundFieldResource2">
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ACTUAL_SIGNER_NAME" HeaderText="簽核者" meta:resourcekey="BoundFieldResource3">
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="結果" meta:resourcekey="TemplateFieldResource1">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSignStatus" runat="server" meta:resourceKey="lblSignStatusResource1"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="簽核意見" meta:resourcekey="BoundFieldResource4">
                                            <ItemTemplate>
                                                <asp:Label ID="lblComment" runat="server" meta:resourcekey="lblCommentResource2"></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="電子簽章" meta:resourcekey="TemplateFieldResource2">
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" meta:resourcekey="Image1Resource1" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="105px" />
                                        </asp:TemplateField>
                                    </Columns>
                                </Fast:Grid>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <asp:Label ID="lblCheckin" runat="server" Text="已存回" Visible="False" meta:resourcekey="lblCheckinResource1"></asp:Label>
        <asp:Label ID="lblCheckOut" runat="server" Text="已取出" Visible="False" meta:resourcekey="lblCheckOutResource1"></asp:Label>
        <asp:Label ID="lblApproval" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovalResource1"></asp:Label>
        <asp:Label ID="lblPublish" runat="server" Text="已公佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
        <asp:Label ID="lblInactive" runat="server" Text="已失效" Visible="False" meta:resourcekey="lblInactiveResource1"></asp:Label>
        <asp:Label ID="lblVoid" runat="server" Text="已作廢" Visible="False" meta:resourcekey="lblVoidResource1"></asp:Label>
        <asp:Label ID="lblTempInact" runat="server" Text="已下架" Visible="False" meta:resourcekey="lblTempInactResource1"></asp:Label>
        <asp:Label ID="lblOldVer" runat="server" Text="舊版本" Visible="False" meta:resourcekey="lblOldVerResource1"></asp:Label>
        <asp:Label ID="lblReAct" runat="server" Text="已上架" Visible="False" meta:resourcekey="lblReActResource1"></asp:Label>
        <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1"></asp:Label>
        <asp:Label ID="lblVioding" runat="server" Text="(作廢審核中)" Visible="False" meta:resourcekey="lblViodingResource1"></asp:Label>
        <asp:Label ID="labNoActive" runat="server" meta:resourcekey="labNoActiveResource1"
            Text="未生效" Visible="False"></asp:Label>
        <asp:Label ID="labDocStore" runat="server" meta:resourcekey="labDocStoreResource1"
            Text="文件庫" Visible="False"></asp:Label>
        <asp:Label ID="labDocDeny" runat="server" Text="發佈拒絕" Visible="False" meta:resourcekey="labDocDenyResource1"></asp:Label>
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
        <asp:Label ID="lblPrint" runat="server" Text="列印" Visible='False' meta:resourcekey="lblPrintResource1"></asp:Label>
        <asp:Label ID="lblCanelForm" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblCanelFormResource3"></asp:Label>
        <asp:Label ID="lblApplicantResult" runat="server" Text="申請結果：" Visible="False" meta:resourcekey="lblApplicantResultResource1"></asp:Label>
        <asp:Label ID="lblCancelMsg" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblCancelMsgResource1"></asp:Label>
        <asp:Label ID="lblAdditionalSiteMsg" runat="server" Text="(加簽)" Visible="False" meta:resourcekey="lblAdditionalSiteMsgResource1"></asp:Label>
        <asp:Label ID="lblSend" runat="server" Text="送出" Visible="False"
            meta:resourcekey="lblSendResource1"></asp:Label>
    </form>
</body>
</html>
