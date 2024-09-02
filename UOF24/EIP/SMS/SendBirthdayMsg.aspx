<%@ Page Title="預約發送" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SendBirthdayMsg.aspx.cs" Inherits="Ede.Uof.Web.EIP.SMS.SendBirthdayMsg" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
    <style type="text/css">

        #SMSTipTable {
            border: solid 1px #000000;
            border-collapse: collapse;
            white-space: nowrap;
            font-family: "Segoe UI", "Arial", "Helvetica","文泉驛正黑", "WenQuanYi Zen Hei", "微軟正黑體", "Microsoft JhengHei", "黑體-繁","Heiti TC","微软雅黑","Microsoft YaHei", "sans-serif" !important;
        }

        #SMSTipTable > tbody > tr > td {
            border: solid 1px #336699;
            color: #000000;
            text-align: center;
            padding: 5px 5px 2px 2px;
        }

        #SMSTipTable > tbody > tr:first-child {
            background-color: rgb(232, 242, 255);
        }

        .SMSTipTitle {
            color: #000000;
            font-weight: bold;
            text-align: center;
            width: 130px;
        }
    </style>

    <script type="text/javascript">
        Sys.Application.add_load(function () {
            chkSMSLen(0);
            GetSelectData();
        });

        function GetSelectData() {
            var curwindow = $uof.dialog.getOpener();
            var pd;
            if (curwindow) {
                pd = curwindow.document;
            } else if (typeof (dialogArguments) != "undefined") {
                pd = dialogArguments.document;
            }

            if (pd) {
                $("#<%=hfGetSendUsers.ClientID%>").val($("#<%=Request.QueryString["ClientID"]%>", pd).val());
                $("#<%=hfStartDate.ClientID%>").val("<%=Request.QueryString["StartDate"]%>");
            }
        }
        function chkSMSLen(kind) {
            var handle = $("#<%=txtContent.ClientID%>");
            var handlecount = $("#<%=lbcounter.ClientID%>");
            var handleneed = $("#<%=lbsmscnts_need.ClientID%>");

            var msgR = handle.val();

            handlecount.text(msgR.length);
            var maxlen = hasChinese(msgR) ? 70 : 160;
            var len = maxlen;
            var chtlmt1 = 66;
            var englmt1 = 156;

            if (handlecount.text() == 0) //無簡訊內容
            {
                handlecount.text("0");
                return null;
            }

            if (handlecount.text() <= maxlen) //如果輸入字數<=最大限制字數
            {
                handleneed.text("1");
            }
            else {
                handleneed.text("2");
            }
        }

        // == 檢查是否有中文 ....
        function hasChinese(str) {
            var i;
            var ch, cch;
            if (str.length > 0) {
                for (i = 0; i < str.length; i++) {
                    ch = '';
                    if (str.charCodeAt(i) > 127) {
                        return true;
                    }
                }
            }
            return false;
        }

        function rbClick(i) {
            var rdDate = $find("<%= rdDate.ClientID %>");
            if (i == 0) {
                rdDate.set_enabled(false);
            }
            else {
                rdDate.set_enabled(true);
            }
        }
    </script>
    <table class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td style="white-space: nowrap;">
                <asp:Label ID="Label1" runat="server" Text="發送日期" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td style="white-space: nowrap;">
                <table>
                    <tr>
                        <td colspan="2">
                            <asp:RadioButton ID="rdbtnCurrent" runat="server" GroupName="sendDate" Text="生日當天" Checked="True" onclick="rbClick(0)" meta:resourcekey="rdbtnCurrentResource1" />
                            <asp:Label ID="lblYear" runat="server" Text="({0}年)" meta:resourcekey="lblYearResource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <asp:RadioButton ID="rdbtnOther" runat="server" GroupName="sendDate" Text="指定日期" onclick="rbClick(1)" meta:resourcekey="rdbtnOtherResource1" />
                        </td>
                        <td>
                            <telerik:RadDatePicker ID="rdDate" runat="server" Enabled="false">
                                <DateInput runat="server" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                            </telerik:RadDatePicker>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="發送時間" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadTimePicker ID="rdTime" runat="server">
                    <DateInput runat="server">
                        <ClientEvents OnValueChanging="OnValueChanging" />
                    </DateInput>
                </telerik:RadTimePicker>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="內容" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtContent" runat="server" Height="195px" Width="100%"
                                TextMode="MultiLine" onkeyup="chkSMSLen(0)" meta:resourcekey="txtContentResource1"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvContent" runat="server" Display="Dynamic" ForeColor="Red"
                                ErrorMessage="簡訊內容不可空白" ControlToValidate="txtContent" meta:resourcekey="rfvContentResource1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label5" runat="server" Text="共輸入了" meta:resourcekey="Label5Resource1"></asp:Label>
                            <asp:Label ID="lbcounter" runat="server" Text="0" meta:resourcekey="lbcounterResource1"></asp:Label>
                            <asp:Label ID="Label9" runat="server" Text="個字。" meta:resourcekey="Label9Resource1"></asp:Label>
                            <asp:Label ID="lbsmscnts_need" runat="server" Text="0" Visible="false" meta:resourcekey="lbsmscnts_needResource1"></asp:Label>
                            <asp:Label ID="Label7" runat="server" Text="則訊息傳送。" Visible="false" meta:resourcekey="Label7Resource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <telerik:RadButton ID="btnInsertCanMSG" runat="server" Text="插入罐頭簡訊" CausesValidation="False" OnClick="btnInsertCanMSG_Click" meta:resourcekey="btnInsertCanMSGResource1"></telerik:RadButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="SizeMemo">
                            <asp:Label ID="lblSendSMSTipTitle" runat="server" ForeColor="Blue" Text="說明" meta:resourcekey="lblSendSMSTipTitleResource1"></asp:Label>
                            <br />
                            <asp:Label ID="lblSendSMSTip1" runat="server" ForeColor="Blue"
                                Text="1. {#user} 為變數,發送時會由選取的人員姓名所取代" meta:resourcekey="lblSendSMSTip1Resource1">
                            </asp:Label>
                            <br />
                            <asp:Label ID="lblSendSMSTip2" runat="server" ForeColor="Blue"
                                Text="2.為使簡訊內容正常呈現於手機中，請勿在簡訊內容中填入~ ` ^ { } [ ] | < >等特殊符號。"
                                meta:resourcekey="lblSendSMSTip2Resource1">
                            </asp:Label>
                            <br />
                            <asp:Label ID="Label4" runat="server" ForeColor="Blue"
                                Text="3.一則簡訊最多333字，超過將會拆則發送。"
                                meta:resourcekey="lblSendSMSTip3Resource1">
                            </asp:Label>
                            <br />
                            <asp:Label ID="Label8" runat="server" ForeColor="Blue"
                                Text="4.國際簡訊(非+886開頭)一則是以三倍的通數來計算。"
                                meta:resourcekey="lblSendSMSTip4Resource1">
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left:5px;">
                            <table id="SMSTipTable">
                                <tbody>
                                    <tr>
                                        <td class="SMSTipTitle">
                                            <div>
                                                <asp:Label ID="lblTipTitle1" runat="server" Text="內容字數" meta:resourcekey="lblTipTitle1Resource1"></asp:Label>
                                            </div>
                                        </td>
                                        <td class="SMSTipTitle">
                                            <div>
                                                <asp:Label ID="lblTipTitle2" runat="server" Text="使用通數" meta:resourcekey="lblTipTitle2Resource1"></asp:Label>
                                            </div>
                                        </td>
                                        <td class="SMSTipTitle">
                                            <div>
                                                <asp:Label ID="lblTipTitle3" runat="server" Text="內容字數" meta:resourcekey="lblTipTitle1Resource1"></asp:Label>
                                            </div>
                                        </td>
                                        <td class="SMSTipTitle">
                                            <div>
                                                <asp:Label ID="lblTipTitle4" runat="server" Text="使用通數" meta:resourcekey="lblTipTitle2Resource1"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div>
                                                <asp:Label ID="lblTipText1" runat="server" Text="1~70字" meta:resourcekey="lblTipText1Resource1"></asp:Label>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <asp:Label ID="lblTipPoint1" runat="server" Text="1通" meta:resourcekey="lblTipPoint1Resource1"></asp:Label>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <asp:Label ID="lblTipText2" runat="server" Text="71~134字" meta:resourcekey="lblTipText2Resource1"></asp:Label>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <asp:Label ID="lblTipPoint2" runat="server" Text="2通" meta:resourcekey="lblTipPoint2Resource1"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div>
                                                <asp:Label ID="lblTipText3" runat="server" Text="135~201字" meta:resourcekey="lblTipText3Resource1"></asp:Label>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <asp:Label ID="lblTipPoint3" runat="server" Text="3通" meta:resourcekey="lblTipPoint3Resource1"></asp:Label>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <asp:Label ID="lblTipText4" runat="server" Text="202~268字" meta:resourcekey="lblTipText4Resource1"></asp:Label>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <asp:Label ID="lblTipPoint4" runat="server" Text="4通" meta:resourcekey="lblTipPoint4Resource1"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div>
                                                <asp:Label ID="lblTipText5" runat="server" Text="269~333字" meta:resourcekey="lblTipText5Resource1"></asp:Label>
                                            </div>
                                        </td>
                                        <td>
                                            <div>
                                                <asp:Label ID="lblTipPoint5" runat="server" Text="5通" meta:resourcekey="lblTipPoint5Resource1"></asp:Label>
                                            </div>
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfGetSendUsers" runat="server" />
    <asp:HiddenField ID="hfStartDate" runat="server" />
    <asp:HiddenField ID="hfMsgID" runat="server" />
    <asp:HiddenField ID="hfBirthday" runat="server" />
    <asp:HiddenField ID="hfPhone" runat="server" />
    <asp:HiddenField ID="hfYear" runat="server" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:Label ID="lblSMSConnectFail" runat="server" Text="預約發送失敗，請至簡訊管理確認連線是否正常。" Visible="False" meta:resourcekey="lblSMSConnectFailResource1"></asp:Label>
</asp:Content>
