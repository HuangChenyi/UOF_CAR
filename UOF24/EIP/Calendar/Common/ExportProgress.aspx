<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_Common_ExportProgress" Title="匯出Excel" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ExportProgress.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/jscript">
        var fileID;
        $(function () {

            $.ajax({
                url: 'ExportProgress.aspx',
                timeout: 60000,
                success: function (responseText, textStatus, XMLHttpRequest) { },
                error: function (XMLHttpRequest, textStatus) {
                    if (textStatus === "timeout") {
                        var labHelp = $("#<%=labHelp.ClientID%>");
                        labHelp.html("<font color='red'>" + "<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(lblTimeOut.Text, true) %>" + "</font>");

                        var imgProcess = $("#<%=imgProcess.ClientID%>");
                        imgProcess.css("visibility", "hidden")
                    }
        }
            });

        var meetingIDs;            
        var curwindow = $uof.dialog.getOpener();
        var pd;
        if (curwindow) {
            pd = curwindow.document;
        }
        else if (typeof (dialogArguments) != "undefined") {
            pd = dialogArguments.document;
        }

        var meetingClientId = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["hideClientID"],true)%>');
       
        if (pd) {
            meetingIDs = $("#" + meetingClientId, pd).val();         
        }

    var userID = '<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["userID"], true)%>';

    var lblAll = '<%=lblAll.Text %>';
    var lblChair = '<%=lblChair.Text %>';
    var lblRealAttend = '<%=lblRealAttend.Text %>';
    var lblSubject = '<%=lblSubject.Text %>';
    var lblLocation = '<%=lblLocation.Text %>';
    var lblDescription = '<%=lblDescription.Text %>';
    var lblStart = '<%=lblStart.Text %>';
    var lblEnd = '<%=lblEnd.Text %>';
    var lblCreateUser = '<%=lblCreateUser.Text %>';
    var lblMinute = '<%=lblMinute.Text %>';
    var lblDecision = '<%=lblDecision.Text %>';
    var lblMeetingrecorder = '<%=lblMeetingrecorder.Text %>';
    var lblDevolve2 = '<%=lblDevolve2.Text %>';
    var lblDevolve = '<%=lblDevolve.Text %>';
    var lblAssignTo = '<%=lblAssignTo.Text %>';
    var lblStatus = '<%=lblStatus.Text %>';
    var lblComplete = '<%=lblComplete.Text %>';
    var lblUnfinish = '<%=lblUnfinish.Text %>';
    var data = [userID, meetingIDs, lblAll, lblChair, lblRealAttend, lblSubject, lblLocation, lblDescription, lblMeetingrecorder, lblStart, lblEnd, lblCreateUser, lblMinute, lblDecision, lblDevolve2, lblDevolve, lblAssignTo, lblStatus, lblComplete, lblUnfinish];
    var result = $uof.pageMethod.sync("ExportMyMeeting", data);

    fileID = result;

    var imgProcess = $("#<%=imgProcess.ClientID%>");
    imgProcess.css("visibility", "hidden");

    var labHelp = $("#<%=labHelp.ClientID%>");

        if (fileID != null && fileID != "") {
            labHelp.html("<font color='blue'>" + "<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(lblSuccess.Text, true) %>" + "</font>");
    }
    else
        labHelp.html("<font color='red'>" + "<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(lblError.Text, true) %>" + "</font>");
});

        function ProcessEXCEL(result) {
            fileID = result.value;

            var imgProcess = $("#<%=imgProcess.ClientID%>");
            imgProcess.css("visibility", "hidden");

            var labHelp = $("#<%=labHelp.ClientID%>");

            if (fileID != null && fileID != "") {
                labHelp.html("<font color='blue'>" + "<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(lblSuccess.Text, true) %>" + "</font>");
                DialogMasterPageWebImageButton1.setVisible(true);
            }
            else
                labHelp.html("<font color='red'>" + "<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(lblError.Text, true) %>" + "</font>");

            DialogMasterPageWebImageButton1.setVisible(true);
        }

        function downloadFile() {

            var curwindow = window.parent.parent.document;
            var pd;
            if (curwindow) {
                pd = curwindow;
            } else if (typeof (dialogArguments) != "undefined") {
                pd = dialogArguments.document;
            }

            if (pd) {
                $("body", pd).after("<iframe style=display:none src=Common/DownloadFile.aspx?dlFileName=MyMeeting.xls&id=" + fileID + "></iframe>")
            }

            $uof.dialog.close();
            return false;
        }
    </script>

    <center>
        <br/><br/>
        <asp:Image ID="imgProcess" runat="server" meta:resourcekey="imgProcessResource1" />
        <br/><br />
        <asp:Label ID="labHelp" runat="server" ForeColor="Red" Text="產生EXCEL檔案中...請稍待~~~" meta:resourcekey="labHelpResource1"></asp:Label>        
    <center/>
    <br /><br />
    </center>

    <asp:Label ID="lblDownload" runat="server" Text="下載EXCEL" Visible="False" meta:resourcekey="lblDownloadResource1"></asp:Label>
    <asp:Label ID="lblTimeOut" runat="server" Text="逾時..發生錯誤!" Visible="False" meta:resourcekey="lblTimeOutResource1"></asp:Label>
    <asp:Label ID="lblError" runat="server" Text="發生錯誤!" Visible="False" meta:resourcekey="lblErrorResource1"></asp:Label>
    <asp:Label ID="lblSuccess" runat="server" Text="EXCEL報表產生成功!" Visible="False" meta:resourcekey="lblSuccessResource1"></asp:Label>

    <asp:Label ID="lblAll" runat="server" Text="總表" Visible="False" meta:resourcekey="lblAllResource1"></asp:Label>
    <asp:Label ID="lblChair" runat="server" Text="主席" Visible="False" meta:resourcekey="lblChairResource1"></asp:Label>
    <asp:Label ID="lblRealAttend" runat="server" Text="實際參加人員" Visible="False" meta:resourcekey="lblRealAttendResource1"></asp:Label>
    <asp:Label ID="lblSubject" runat="server" Text="主旨" Visible="False" meta:resourcekey="lblSubjectResource1"></asp:Label>
    <asp:Label ID="lblLocation" runat="server" Text="地點" Visible="False" meta:resourcekey="lblLocationResource1"></asp:Label>
    <asp:Label ID="lblDescription" runat="server" Text="說明" Visible="False" meta:resourcekey="lblDescriptionResource1"></asp:Label>
    <asp:Label ID="lblMeetingrecorder" runat="server" Text="會議記錄人員" Visible="False" meta:resourcekey="lblMeetingrecorderResource1"></asp:Label>
    <asp:Label ID="lblStart" runat="server" Text="開始時間" Visible="False" meta:resourcekey="lblStartResource1"></asp:Label>
    <asp:Label ID="lblEnd" runat="server" Text="結束時間" Visible="False" meta:resourcekey="lblEndResource1"></asp:Label>
    <asp:Label ID="lblCreateUser" runat="server" Text="建立人員" Visible="False" meta:resourcekey="lblCreateUserResource1"></asp:Label>
    <asp:Label ID="lblMinute" runat="server" Text="會議記錄" Visible="False" meta:resourcekey="lblMinuteResource1"></asp:Label>
    <asp:Label ID="lblDecision" runat="server" Text="決議" Visible="False" meta:resourcekey="lblDecisionResource1"></asp:Label>
    <asp:Label ID="lblDevolve2" runat="server" Text="待辦" Visible="False" meta:resourcekey="lblDevolve2Resource1"></asp:Label>
    <asp:Label ID="lblDevolve" runat="server" Text="待辦事項" Visible="False" meta:resourcekey="lblDevolveResource1"></asp:Label>
    <asp:Label ID="lblAssignTo" runat="server" Text="交辦對象" Visible="False" meta:resourcekey="lblAssignToResource1"></asp:Label>
    <asp:Label ID="lblStatus" runat="server" Text="狀態" Visible="False" meta:resourcekey="lblStatusResource1"></asp:Label>
    <asp:Label ID="lblComplete" runat="server" Text="完成" Visible="False" meta:resourcekey="lblCompleteResource1"></asp:Label>
    <asp:Label ID="lblUnfinish" runat="server" Text="未完成" Visible="False" meta:resourcekey="lblUnfinishResource1"></asp:Label>
</asp:Content>

