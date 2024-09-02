<%@ Page Title="審核公告" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Bulletin_ViewBulletinByExamine" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ViewBulletinByExamine.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        span.JustAddBorder table tr td {
            border-width: 1px;
            border-style: solid;
        }
    </style>
    <script type="text/javascript">

function CopyText(){
	//Add code to handle your event here.
	    var target = $("#<%= lblContext.ClientID%>");
	    var data = target.text();
	    clipboardData.setData("Text",data);
}

function PrintFriently() {
        var BULLETINE_ID = '<%=lblBulletinID.Text%>';
        $uof.dialog.open2("~/EIP/Bulletin/BulletinPrintFriendly.aspx", this, '<%=lblPrintMsg.Text%>', 600, 500, openDialogResult, { "BULLETINEID": BULLETINE_ID });
        return false;

<%--        var printJS = 'javascript:';
        printJS = printJS + 'window.print();window.location.reload();';
        var fontsize = $uof.cookie.get("FontSize");

        var printHTML = "<html><title>" + $("title") + "-" + "<%=lblPrintMsg.Text %>" + "</title><center>";
        printHTML = printHTML + "<input id='btPrint' type='button' value='" + '<%=lblPrintMsg2.Text %>' + "' onclick='" + printJS + "'  />";
        printHTML = printHTML + "<table style='font-size:@@' width='95%' border='1' cellspacing='0' ><tr><td align='right' style='white-space:nowrap' width='15%'>" + "<%=Label1.Text %>" + "</td><td align='left'>" + $("#<%=LBLannouncer.ClientID %>").text() + "</td></tr>";  //張貼者
        printHTML = printHTML + "<tr><td align='right' style='white-space:nowrap'>" + "<%=Label14.Text %>" + "</td><td align='left'>" + $("#<%=LBDepartment.ClientID %>").text() + "</td></tr>"; //張貼部門
        printHTML = printHTML + "<tr><td align='right' style='white-space:nowrap'>" + "<%=Label2.Text %>" + "</td><td align='left'>" + $("#<%=LBLclass.ClientID %>").text() + "</td></tr>"; //分類
        printHTML = printHTML + "<tr><td align='right' style='white-space:nowrap'>" + "<%=Label3.Text %>" + "</td><td align='left'>" + $("#<%=ltTopic.ClientID %>").text() + "</td></tr>"; //主題 
        printHTML = printHTML + "<tr><td align='right' style='white-space:nowrap'>" + "<%=Label4.Text %>" + "</td><td align='left'>" + $("#<%=lblContext.ClientID %>").html() + "</td></tr>"; //內容 
        printHTML = printHTML + "</table></center></html> ";
        printHTML = printHTML.replace('@@', fontsize)
        var oWindow = window.open("", "_blank", "scrollbars=yes,menubar=no,toolbar=no");
        oWindow.document.write(printHTML);--%>
}
        function checkDeny()
        {
            var comment = $('#<% = txtComment.ClientID %>');
            var lblDenyComment = $('#<% = lblDenyComment.ClientID %>');

            if(comment.val().length ==0)
            {
                lblDenyComment.css('display', 'block');
                setTimeout(function () {
                    comment.focus();
                }, 0);
                return false;
            }
        }

    </script>
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="無權限瀏覽" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <table class="PopTable" cellspacing="1">
        <tr>
            <td style="width: 180px; white-space: nowrap;">
                <asp:Label ID="Label1" runat="server" Text="張貼者" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td style="white-space: nowrap; width: 42%">
                <asp:Label ID="LBLannouncer" runat="server" meta:resourcekey="LBLannouncerResource1"></asp:Label>
            </td>
            <td style="width: 180px; white-space: nowrap;">
                <asp:Label ID="Label14" runat="server" Text="張貼部門" meta:resourcekey="Label14Resource1"></asp:Label>
            </td>
            <td style="white-space: nowrap; width: 42%">
                <asp:Label ID="LBDepartment" runat="server"></asp:Label>
            </td>
        </tr>

        <tr>
            <td style="width: 180px; white-space: nowrap;">
                <asp:Label ID="Label2" runat="server" Text="分類" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td colspan="3">
                <asp:Label ID="LBLclass" runat="server" meta:resourcekey="LBLclassResource1"></asp:Label></td>
        </tr>
        <tr>
            <td style="width: 180px; white-space: nowrap;">
                <asp:Label ID="Label3" runat="server" Text="主題" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td colspan="3">
                <asp:Label ID="ltTopic" runat="server" meta:resourcekey="ltTopicResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 180px; white-space: nowrap;">
                <asp:Label ID="Label8" runat="server" Text="跑馬燈"
                    meta:resourcekey="Label8Resource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:Label ID="lblShowMarkquee" runat="server" Text="顯示於跑馬燈" Visible="False"
                    meta:resourcekey="lblShowMarkqueeResource1"></asp:Label>
                <asp:Label ID="lblNoShowMarkque" runat="server" Text="不顯示於跑馬燈" Visible="False"
                    meta:resourcekey="lblNoShowMarkqueResource1"></asp:Label>
            </td>
        </tr>

        <tr>
            <td style="width: 180px; white-space: nowrap;">
                <asp:Label ID="Label10" runat="server" Text="發佈對象"
                    meta:resourcekey="Label10Resource1"></asp:Label>
            </td>
            <td colspan="3">

                <uc2:UC_ChoiceList ID="UC_ChoiceListPublish" runat="server" IsAllowEdit="false" />

            </td>
        </tr>
        <tr>
            <td style="width: 180px; white-space: nowrap;">
                <asp:Label ID="Label9" runat="server" Text="發佈通知"
                    meta:resourcekey="Label9Resource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:Label ID="lblSendAllUser" runat="server" Text="所有發佈對象"
                    Visible="False" meta:resourcekey="lblSendAllUserResource1"></asp:Label>
                <asp:Label ID="lblSendIQYuser" runat="server" Text="發佈對象中的訂閱者"
                    Visible="False" meta:resourcekey="lblSendIQYuserResource1"></asp:Label>
                <asp:Label ID="lblNoSend" runat="server" Text="不通知" Visible="False" meta:resourcekey="lblNoSendResource1"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="(只有異動分類、主題、內容、附件才會發送)" Visible="false"
                    meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 180px; white-space: nowrap;">
                <asp:Label ID="lblMsgAutoPublic" runat="server" Text="上架"
                    meta:resourcekey="lblMsgAutoPublicResource1"></asp:Label>
            </td>
            <td style="white-space: nowrap; width: 42%">
                <asp:Label ID="lblMsgPublicNow" runat="server" Text="立即上架" Visible="False"
                    meta:resourcekey="lblMsgPublicNowResource1"></asp:Label>
                <asp:Label ID="lblMsgPubliced" runat="server" Text="時間" Visible="False"
                    meta:resourcekey="lblMsgPublicedResource1"></asp:Label>
                <asp:Label ID="lblPublicDate" runat="server"
                    meta:resourcekey="lblPublicDateResource1"></asp:Label>
            </td>
            <td style="width: 180px; white-space: nowrap;">
                <asp:Label ID="Label7" runat="server" Text="下架"
                    meta:resourcekey="Label7Resource1"></asp:Label>
            </td>
            <td style="white-space: nowrap; width: 42%">
                <asp:Label ID="lblMsgNeverExpired" runat="server" Text="永不下架" Visible="False"
                    meta:resourcekey="lblMsgNeverExpiredResource1"></asp:Label>
                <asp:Label ID="lblMsgExpired" runat="server" Text="時間" Visible="False"
                    meta:resourcekey="lblMsgExpiredResource1"></asp:Label>
                <asp:Label ID="lblExpireDate" runat="server"
                    meta:resourcekey="lblExpireDateResource1"></asp:Label>
            </td>
        </tr>


        <tr>
            <td style="width: 180px; white-space: nowrap;">
                <asp:Label ID="Label11" runat="server" Text="列印控制"
                    meta:resourcekey="Label11Resource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:Label ID="lblAllowSomeUser" runat="server" Text="只允許下列人員列印"
                    Visible="False" meta:resourcekey="lblAllowSomeUserResource1"></asp:Label>
                <asp:Label ID="lblAllowAllUser" runat="server" Text="所有人皆可列印" Visible="False"
                    meta:resourcekey="lblAllowAllUserResource1"></asp:Label>
                <asp:Label ID="lblNoUser" runat="server" Text="不可列印" Visible="False"
                    meta:resourcekey="lblNoUserResource1"></asp:Label>
                <div id="divChoiceList">
                    <uc2:UC_ChoiceList ID="UC_ChoiceListPrint" runat="server" IsAllowEdit="false" />
                </div>
            </td>
        </tr>

        <tr>
            <td style="width: 180px; white-space: nowrap;">
                <asp:Label ID="Label4" runat="server" Text="內容" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td colspan="3" style="width: 100%; height: 530px; vertical-align:baseline">
                <asp:Label ID="lblContext" runat="server" class="editorcontentstyle JustAddBorder" meta:resourcekey="lblContextResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 180px; white-space: nowrap;">
                <asp:Label ID="Label5" runat="server" Text="附件" meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td colspan="3">                
                <uc2:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedMultipleFileSelection="false" Editable="false" />
            </td>
        </tr>
        <tr>
            <td style="width: 180px; white-space: nowrap;">
                <asp:Label ID="Label13" runat="server" Text="審發佈意見內容"
                    meta:resourcekey="Label13Resource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:TextBox ID="txtComment" runat="server" Rows="4" TextMode="MultiLine"
                    Width="100%" meta:resourcekey="txtCommentResource1"></asp:TextBox>
                <asp:Label ID="lblDenyComment" runat="server" Text="拒絕發佈請填寫意見內容" style="display:none;" ForeColor="red" meta:resourcekey="lblDenyCommentResource1"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblCopyMsg" runat="server" Text="IE欲複製內容請於文字上連點二下即可" ForeColor="Blue" meta:resourcekey="lblCopyMsgResource1" Visible="false"></asp:Label>

    <asp:Panel ID="Panel1" runat="server" Visible="False" Style="width: 99%"
        meta:resourcekey="Panel1Resource1">
        <fieldset style="padding: 2; width: 100%;">
            <legend>
                <asp:Label ID="Label12" runat="server" Text="審核意見"
                    meta:resourcekey="Label12Resource1"></asp:Label></legend>
            <Fast:Grid ID="logGrid" runat="server" AllowPaging="True" AllowSorting="True" DefaultSortColumnName="CREATE_DATE"
                AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                DataKeyOnClientWithCheckBox="True"
                DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False"
                OnRowDataBound="logGrid_RowDataBound"
                PageSize="15"
                Width="100%"
                OnPageIndexChanging="logGrid_PageIndexChanging" OnSorting="logGrid_Sorting"
                meta:resourcekey="logGridResource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings ShowHeaderPager="True" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:TemplateField HeaderText="審核者" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%#: Bind("CREATE_USER") %>'
                                meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblUser" runat="server" Text='<%#: Bind("CREATE_USER") %>'
                                meta:resourcekey="lblUserResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="150px" />
                        <ItemStyle Width="150px" Wrap="False"/>
                    </asp:TemplateField>
                    <asp:BoundField DataField="COMMENT" HeaderText="審核意見" meta:resourcekey="BoundFieldResource1">
                        <HeaderStyle Width="300px" Wrap="False" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="審核時間">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%#: Bind("CREATE_DATE") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCreateDate" runat="server" Text='<%#: Bind("CREATE_DATE") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="150px" />
                        <ItemStyle Width="150px" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="審核狀態" meta:resourcekey="TemplateFieldResource2">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%#: Bind("STATUS") %>'
                                meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%#: Bind("STATUS") %>'
                                meta:resourcekey="lblStatusResource1"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="80px" Wrap="False"/>
                        <ItemStyle Width="80px"  Wrap="False"/>
                    </asp:TemplateField>
                </Columns>
            </Fast:Grid>
        </fieldset>
    </asp:Panel>

    <asp:Label ID="lblPrintMsg" runat="server" Text="友善列印" Visible="False" meta:resourcekey="lblPrintMsgResource1"></asp:Label>
    <asp:Label ID="lblPrintMsg2" runat="server" Text="列印" Visible="False" meta:resourcekey="lblPrintMsg2Resource1"></asp:Label>
    <asp:Label ID="lblLoginAlert" runat="server" Text="登入者非該公告發佈對象,所以無法連結此公告 !" Visible="False" meta:resourcekey="lblLoginAlertResource1"></asp:Label>
    <asp:Label ID="lblMsgBullProcessing" runat="server" Text="公告審核中，所以無法連結此公告!"
        Visible="False" meta:resourcekey="lblMsgBullProcessingResource1"></asp:Label>
    <asp:Label ID="lblMsgBullDeny" runat="server" Text="公告發佈拒絕，所以無法連結此公告!"
        Visible="False" meta:resourcekey="lblMsgBullDenyResource1"></asp:Label>
    <asp:Label ID="lblMsgBullPublishing" runat="server" Text="公告未發佈，所以無法連結此公告!"
        Visible="False" meta:resourcekey="lblMsgBullPublishingResource1"></asp:Label>
    <asp:Label ID="lblMsgPulish" runat="server" Text="同意發佈" Visible="False"
        meta:resourcekey="lblMsgPulishResource1"></asp:Label>
    <asp:Label ID="lblMsgProcess" runat="server" Text="審核中" Visible="False"
        meta:resourcekey="lblMsgProcessResource1"></asp:Label>
    <asp:Label ID="lblMsgDeny" runat="server" Text="發佈拒絕" Visible="False"
        meta:resourcekey="lblMsgDenyResource1"></asp:Label>
    <asp:Label ID="lblMsgPublishing" runat="server" Text="未發佈" Visible="False"></asp:Label>
    <asp:Label ID="lblbtnTitlePublish" runat="server" Text="允許" Visible="False"
        meta:resourcekey="lblbtnTitlePublishResource1"></asp:Label>
    <asp:Label ID="lblbtnTitleDeny" runat="server" Text="拒絕" Visible="False"
        meta:resourcekey="lblbtnTitleDenyResource1"></asp:Label>
    <asp:Label ID="lblHasExamine" runat="server" Text="該公告已審核過" Visible="False"
        meta:resourcekey="lblHasExamineResource1"></asp:Label>
    <asp:Label ID="lblMsgDelete" runat="server" Text="確定要拒絕發佈?" Visible="False"
        meta:resourcekey="lblMsgDeleteResource1"></asp:Label>
    <asp:Label ID="lblMsgPublish" runat="server" Text="確定要允許發佈?" Visible="False"
        meta:resourcekey="lblMsgPublishResource1"></asp:Label>
    <asp:Label ID="lblNoExaminer" runat="server" Text="登入者非該公告審核者,所以無法連結此公告!" Visible="false" meta:resourcekey="lblNoExaminerResource1"></asp:Label>
    <asp:Label ID="lblBulletinID" runat="server" Visible="false"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
