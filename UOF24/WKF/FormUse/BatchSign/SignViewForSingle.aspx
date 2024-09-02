<%@ Page Title="批次簽核" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_BatchSign_SignViewForSingle" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="SignViewForSingle.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <script type="text/javascript" src="BatchSignForSingle.js"></script>
    <script type="text/javascript">

        Sys.Application.add_load(function () {
            formFilter();
        })

        function CustSign(labelId, sender) {
            var signWindowWidth = <%=signWindowWidth%>;
            var signWindowHeight = <%=signWindowHeight%>;
            var taskId = labelId.split("_")[1];
            var siteId = labelId.split("_")[2];
            var nodeSeq = labelId.split("_")[3];
            var agent = labelId.split("_")[4];
            this.enabled = false;
            $uof.dialog.open2("~/WKF/FormUse/FreeTask/SignNodeForm.aspx", sender, '',<%=signWindowWidth%>,<%=signWindowHeight%>, function () { $('#<%=hfIsRefresh.ClientID%>').val("true"); return true; }, { 'TASK_ID': taskId, 'SITE_ID': siteId, 'NODE_SEQ': nodeSeq, 'isBatchSign': 'true', 'AGENT': agent });
            return false;
        }

        function SetDropDownListStatus(status) {
            var ddlformList = $("#<%=radToolbar1.Items.FindItemByValue("radBtnItems").FindControl("ddlFormList").ClientID%>");
            if (ddlformList != null) {
                ddlformList.prop("disabled", status);
            }
        }

        function NoCheckRefresh() {
            var allChecks = $("input:checkbox");
            alert("<%=lbl_NoChoiseForm.Text%>");
            for (var i = 0; i < allChecks.length; i++) {
                allChecks.prop("disabled", false);
            }
        }

        function callSet(s) {
            var objForm = $("input:checkbox");

            for (var i = 0; i < objForm.length; i++) {
                var objEle = $(objForm[i]);
                if (objEle.prop("name") == s) {
                    var labelId = taskIdInfo[signedNum - 1];
                    var label = $('#' + labelId);
                    if (label.text() == "") {
                        label.html( "<br><img src='../../../Common/Images/loading.gif' border='0' id='Imgs'>  <%=lbl_Running.Text%>....");
                    }
                }

            }
        }

        function callback(e) {
            var s = $uof.json.toObject(e);
            var objForm = $("input:checkbox");
            for (var i = 0; i < objForm.length; i++) {
                var objEle = $(objForm[i]);

                if (objEle.prop("name") == s[0]) {

                    var labelId = taskIdInfo[signedNum - 1];
                    var label = $('#' + labelId);
                    $('#Layer1').scrollTop($('#Layer1').scrollTop() + 10 + (m_count * 0.9));

                    if (s[1] == "1") {
                        //  label.className = "Finish";
                        switch (s[2]) {
                            case "1":
                                {
                                    label.html("<br><%=lbl_Finish.Text%><%=lbl_NextSinger.Text%>");
                                        break;
                                    }
                                case "2": label.html( "<br><%=lbl_Finish.Text%><%=lbl_EndForm.Text%>"); break;
                                case "3": label.html( "<br><%=lbl_Finish.Text%><%=lbl_NonResult.Text%>"); break;
                            }
                        }
                        else {
                            //label.className = "Fail";
                            switch (s[2]) {
                                case "1": label.html( "<br><%=lbl_Fail.Text%><%=lbl_FormLocked.Text%>"); break;
                                case "2": label.html( "<br><%=lbl_Fail.Text%><%=lbl_FreeFlow.Text%>"); break;
                                case "3": label.html( "<br><%=lbl_Fail.Text%><%=lbl_NotCurrentSite.Text%>"); break;
                                case "4": label.html( "<br><%=lbl_Fail.Text%><%=lbl_FlowException.Text%>"); break;
                                case "5": label.html( "<br><%=lbl_Fail.Text%><%=lbl_CustSite.Text%>"); break;
                                case "6": label.html( "<br><%=lbl_Fail.Text%><%=lbl_GroupSite.Text%>"); break;
                                case "7": label.html( "<br><%=lbl_Fail.Text%><%=lbl_FreeSite.Text%>"); break;
                                case "8": label.html( "<br><%=lbl_Fail.Text%><%=lbl_NoCondition.Text%>"); break;
                                case "9": label.html( "<br><%=lbl_Fail.Text%><%=lbl_NoSinger.Text%>"); break;
                                case "10" : label.html( "<br><%=lbl_Fail.Text%><%=lbl_GeneralMsg.Text%>"); break;
                                case "12" : label.html("<br><%=lbl_Fail.Text%><%=lbl_SignerIsSuspendedorNonActive.Text%>"); break;
                                case "14" : label.html("<br><%=lbl_Fail.Text%><%=lbl_FlowException.Text%>"); break;
                                case "15" : label.html("<br><%=lbl_Fail.Text%><%=lbl_FlowException.Text%>"); break;
                                default: label.html( "<br><%=lbl_Fail.Text%>" + s[2]); break;
                            }
                        }
                        m_SignCount++;
                        SignForm();
                    }
                
            }

            if (m_SignCount >= m_count) 
            {
                EnableRefreshButton();
                ShowProccessMsg();
                SetDropDownListStatus(false);
            }
        }
        
        function ShowProccessMsg()
        {
            alert("<%=lbl_ProccessEndMsg.Text%>");
        }
        
        //ddlFormList OnChange
        function changeFormCategory(sender, args) {
            var ddlSelected = args.get_item();
            var hfFormId = $('#<%=hfFormId.ClientID%>');
            hfFormId.val(ddlSelected.get_value());
            formFilter();
            
        }

        ///JQuery控制表單顯示與否
        function formFilter() {
            var hfFormId = $('#<%=hfFormId.ClientID%>');
            if ($uof.tool.htmlDecode(hfFormId.val()) == "all")
                $(".NormalPopTable").show();
            else {
                $(".NormalPopTable").hide();
                $("table[formId='" + hfFormId.val() + "']").show();
            }
        }


        function OpenSignComment(e) {
            $uof.dialog.open2('~/WKF/FormUse/BatchSign/SignComment.aspx', '', '', 1000, 600, function () { return false; }, { 'TASK_ID': e });
            return false;
        }

    </script>

    <div id="layer0" style="width: 100%; height: 5%; border: 0px;">
        <telerik:RadToolBar ID="radToolbar1" runat="server" Width="100%" OnClientButtonClicking="EnableRefreshButton" OnButtonClick="radToolbar1_ButtonClick">
            <Items>
                <telerik:RadToolBarButton runat="server" Value="radBtnItems">
                    <ItemTemplate>
                        <table border="0">
                            <tr>
                                <td>
                                    <asp:Label ID="lblFormList" runat="server" Text="過濾表單：" meta:resourcekey="lblFormListResource1"></asp:Label></td>
                                <td>
                                    <telerik:RadDropDownList ID="ddlFormList" runat="server" OnClientItemSelected="changeFormCategory"></telerik:RadDropDownList>
                                    &nbsp;&nbsp;&nbsp;
                    <img src='<%=themePath %>/Images/Icon_m10211.gif' border='0' title='<%=Label2.Text%>'>&nbsp;:&nbsp;<%=Label2.Text%>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton IsSeparator="true" runat="server"></telerik:RadToolBarButton>
                <telerik:RadToolBarButton runat="server" Value="refresh" Text="重新整理" ImageUrl="~/common/images/icon/icon_m38.png" meta:resourcekey="lbl_RefreshResource1"></telerik:RadToolBarButton>
                <telerik:RadToolBarButton IsSeparator="true" runat="server"></telerik:RadToolBarButton>
            </Items>
        </telerik:RadToolBar>
    </div>
    <div id="Layer1" style="width: 100%; height: 94%; overflow: auto; visibility: visible; border: 0px">

        <asp:Table ID="TB_SIGN" runat="server" meta:resourcekey="TB_SIGNResource1"></asp:Table>

    </div>
    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="SignCheck" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:Label ID="lbl_Running" Text="簽核中...." Visible="False" runat="server" meta:resourcekey="lbl_RunningResource1"></asp:Label>
    <asp:Label ID="lbl_Finish" Text="完成－" Visible="False" runat="server" meta:resourcekey="lbl_FinishResource1"></asp:Label>
    <asp:Label ID="lbl_Fail" Text="失敗－" Visible="False" runat="server" meta:resourcekey="lbl_FailResource1"></asp:Label>
    <asp:Label ID="lbl_FormLocked" Text="表單由他人處理中" Visible="False" runat="server" meta:resourcekey="lbl_FormLockedResource1"></asp:Label>
    <asp:Label ID="lbl_FreeFlow" Text="自由流程" Visible="False" runat="server" meta:resourcekey="lbl_FreeFlowResource1"></asp:Label>
    <asp:Label ID="lbl_NotCurrentSite" Text="此站點非可處理站點" Visible="False" runat="server" meta:resourcekey="lbl_NotCurrentSiteResource1"></asp:Label>
    <asp:Label ID="lbl_FlowException" Text="讀取組織流程有出現錯誤" Visible="False" runat="server" meta:resourcekey="lbl_FlowExceptionResource1"></asp:Label>
    <asp:Label ID="lbl_CustSite" Text="自訂站點" Visible="False" runat="server" meta:resourcekey="lbl_CustSiteResource1"></asp:Label>
    <asp:Label ID="lbl_GroupSite" Text="自選站點" Visible="False" runat="server" meta:resourcekey="lbl_GroupSiteResource1"></asp:Label>
    <asp:Label ID="lbl_FreeSite" Text="自由流程站點" Visible="False" runat="server" meta:resourcekey="lbl_FreeSiteResource1"></asp:Label>
    <asp:Label ID="lbl_NoCondition" Text="條件不符" Visible="False" runat="server" meta:resourcekey="lbl_NoConditionResource1"></asp:Label>
    <asp:Label ID="lbl_NoSinger" Text="找不到簽核者" Visible="False" runat="server" meta:resourcekey="lbl_NoSingerResource1"></asp:Label>
    <asp:Label ID="lbl_NoChoiseForm" Text="請選擇表單" Visible="False" runat="server" meta:resourcekey="lbl_NoChoiseFormResource1"></asp:Label>
    <asp:Label ID="lbl_NoFormSign" Text="沒有可簽核表單" Visible="False" runat="server" meta:resourcekey="lbl_NoFormSignResource1"></asp:Label>
    <asp:Label ID="lbl_GeneralMsg" Text="一般站點不允許多人簽核" Visible="False" runat="server" meta:resourcekey="lbl_GeneralMsgResource1"></asp:Label>
    <asp:Label ID="lbl_EndForm" Text="表單已結案" Visible="False" runat="server" meta:resourcekey="lbl_EndFormResource1"></asp:Label>
    <asp:Label ID="lbl_NextSinger" Text="表單送往下一站" Visible="False" runat="server" meta:resourcekey="lbl_NextSingerResource1"></asp:Label>
    <asp:Label ID="lbl_NonResult" Text="簽核結果未達成共識" Visible="False" runat="server" meta:resourcekey="lbl_NonResultResource1"></asp:Label>
    <asp:Label ID="lbl_CustSign" Text="單筆簽核" Visible="False" runat="server" meta:resourcekey="lbl_CustSignResource1"></asp:Label>
    <asp:Label ID="lbl_Accept" Text="同意" Visible="False" runat="server" meta:resourcekey="lbl_AcceptResource1"></asp:Label>
    <asp:Label ID="lbl_Refresh" Text="重新整理" Visible="False" runat="server" meta:resourcekey="lbl_RefreshResource1"></asp:Label>
    <asp:Label ID="lbl_FormName" Text="表單名稱 － " Visible="False" runat="server" meta:resourcekey="lbl_FormNameResource1"></asp:Label>
    <asp:Label ID="lbl_FormTitle" Text="標題" Visible="False" runat="server" meta:resourcekey="lbl_FormTitleResource1"></asp:Label>
    <asp:Label ID="lbl_FormAccplication" Text="申請者" Visible="False" runat="server" meta:resourcekey="lbl_FormAccplicationResource1"></asp:Label>
    <asp:Label ID="lbl_SignStatus" Text="簽核狀態" Visible="False" runat="server" meta:resourcekey="lbl_SignStatusResource1"></asp:Label>
    <asp:Label ID="lbl_ProccessEndMsg" Text="批次簽核作業已完成\r\r如果您想再繼續，請按上方『重新整理』按鈕即可繼續操作。" Visible="False" runat="server" meta:resourcekey="lbl_ProccessEndMsgResource1"></asp:Label>
    <asp:Label ID="lbl_allForm" Text="全部" Visible="False" runat="server" meta:resourcekey="lbl_allFormResource1"></asp:Label>
    <asp:Label ID="lbl_RowClickMsg" Text="點選空白處可顯示簽核歷程" Visible="False" runat="server" meta:resourcekey="lbl_RowClickMsgResource1"></asp:Label>
    <asp:Label ID="lbl_SignerIsSuspendedorNonActive" runat="server" Text="下一站簽核者被停用" Visible="false" meta:resourcekey="lbl_SignerIsSuspendedorNonActiveResource1"></asp:Label>
    <asp:Label ID="Label1" Text="待簽表單" Visible="False" runat="server" meta:resourcekey="Label1Resource1"></asp:Label>
    <asp:Label ID="Label2" Text="代理簽核表單" Visible="False" runat="server" meta:resourcekey="Label2Resource1"></asp:Label>
    <asp:HiddenField ID="hfIsRefresh" runat="server" Value="false" />
    <asp:HiddenField ID="hfFormId" runat="server" Value="all" />
</asp:Content>

