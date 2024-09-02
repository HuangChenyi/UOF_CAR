<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="TspSearchMain.aspx.cs" Inherits="Ede.Uof.Web.Common.TspSearchMain" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="javascript/jQuery/jQueryUI/jquery-ui.css">
    <style>
        .tablecenter {
            position: absolute;
            left: 50%;
            margin-left: -300px;
        }

        .tablecenter2 {
            position: absolute;
            left: 50%;
            top: 50%;
            margin-top: -90px;
        }
    </style>
    <script src="javascript/jQuery/jQueryUI/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#<%=txtKeyword.ClientID%>').keypress(function (event) {
                if (event.keyCode == 10 || event.keyCode == 13) {
                    $("#<%=SearchBtn.ClientID%>").click();
                }
            });

            $('#contenttb').height($(window).height() - 46);
            var w = ($(window).width());
            if (w <= 1024)
                $('#centertb').addClass("tablecenter2");
            //var position = ($(window).width() * 0.3) ;
            //if (w > 1024) {
            //    $('#centertb').css('margin-left', position)
            //}
            //else
            //{
            //    var p = ($(window).width() * 0.2);
            //    $('#centertb').css('margin-left', p)
            //}
            $("#<%=txtKeyword.ClientID%>").autocomplete({               
                source: function (request, response) {
                    var keyword = $("#<%=txtKeyword.ClientID %>").val();
                    var msg = checkStrPass(keyword, "Normal");
                    if (msg == "PASS") {
                        $.ajax({
                            url: "TspSearchMain.aspx/GetSearchSource",
                            data: "{ 'word':'" + request.term + "'}",
                            dataType: "json",
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                response($.map(data.d, function (item) {
                                    return { value: item }
                                }
                                ))
                            },
                            error: function (XMLHttpRequest, textStatus, errorThrown) {
                                if (errorThrown == null || errorThrown == "")
                                    return;
                                alert(errorThrown);
                            }
                        })
                    }
                }
            });
        });

        Sys.Application.add_load(function () {


            CheckShowDatePicker();

        });
        function CheckShowDatePicker() {

             var ddlDatepart = $("#<%=ddlDateSelect.ClientID %>");
             if (ddlDatepart.val() != "specdate")
                 $("#dateTb").hide();
             else
                 $("#dateTb").show();
         }

        function OnClientClicked(sender, args) {
            var keyword = $("#<%=txtKeyword.ClientID %>").val();

            //如果都沒選擇模組則跳出 請選擇要查詢的模組
            if ($("#<%=chkBulletin.ClientID %>").prop('checked')
                || $("#<%=chkForum.ClientID %>").prop('checked')
                || $("#<%=chkDMS.ClientID %>").prop('checked')
                || $("#<%=chkBRIEFCASE.ClientID %>").prop('checked')
                || $("#<%=chkWKF.ClientID %>").prop('checked')
                || $("#<%=chkPRIVATEMSG.ClientID %>").prop('checked')) { }
            else {
                //跳訊息
                    alert('<%=lblNullMsg.Text %>');
                    args.set_cancel(true);
            }

            if (keyword.trim() == "") {
                    alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty", Ede.Uof.EIP.SystemInfo.Current.Culture) %>');
                    args.set_cancel(true);
                }
                else {
                    var msg = checkStrPass(keyword, "Normal");
                    if (msg != "PASS") {
                        alert('<%=lblErrmsg.Text %>' + msg);
                        args.set_cancel(true);
                    }
            }
        }

        function LinkBtnClick() {
            var keyword = $("#<%=txtKeyword.ClientID %>").val();
             if (keyword.trim() == "") {
                 alert('<%=Ede.Uof.Utility.Page.Common.Resource.GetResource("Common","ErrorNotAllowEmpty", Ede.Uof.EIP.SystemInfo.Current.Culture) %>');
                 return false;
             }
             else
                 return true;
         }

         /// <summary> 
         /// 檢查是否有特殊字元
         /// </summary> 
         function checkStrPass(str, source) {
             var illegalch;
             if (source == "Normal")
                 illegalCh = new Array("\'", "\''\'", "\"\"", ">", "<", ";", "+", "--", "/\"", ":", "/", "\\"); // 特殊字元
             else {

                 illegalCh = new Array("\'", "\''\'", "\"\"", ">", "<", ";", "+", "--", "*", "/\"", "?", "|", "\"", "*", ":", "/", "\\", "&"); // 特殊字元
             }
             var sqlCmd = new Array("select", "update", "insert", "union", "delete", "drop"); // sql指令
             var msg = "";

             if (typeof (str) !== 'undefined' && str != "" && str.length > 0) {
                 for (var key in illegalCh) { // 先檢查特殊字元
                     if (str.indexOf(illegalCh[key]) != -1) {
                         if (msg == "") {
                             msg += illegalCh[key];
                         } else {
                             msg += (" " + illegalCh[key]);
                         } // end else

                     } // end if
                 } // end for()

                 str = str.toLowerCase(); // 統一轉小寫比較
                 for (var key in sqlCmd) { // 再檢查sql指令
                     var address = str.indexOf(sqlCmd[key]);
                     if (address == 0) { // 在起始位置發現，檢查下個字元是否為空白
                         if (str.charAt(sqlCmd[key].length) == " ") { // 是空白
                             if (msg == "") {
                                 msg += sqlCmd[key];
                             } else {
                                 msg += (" " + sqlCmd[key]);
                             } // end else
                         } // end if
                     } else if (address > 0) { // 在中間發現，分別檢查上下字元是否為空白
                         if (str.charAt(address - 1) == " ") { // 上個字元是空白
                             if (str.length == address + sqlCmd[key].length) { // 他在字串最末端，後面不用檢查了
                                 if (msg == "") {
                                     msg += sqlCmd[key];
                                 } else {
                                     msg += (" " + sqlCmd[key]);
                                 } // end else
                             } else { // 在字串中間，要檢查下一個
                                 if (str.charAt(address + sqlCmd[key].length) == " ") { // 前後都空白-->非法
                                     if (msg == "") {
                                         msg += sqlCmd[key];
                                     } else {
                                         msg += (" " + sqlCmd[key]);
                                     } // end else
                                 } // end if
                             } // end else
                         } // end if
                     } // end else if
                 } // end for()

                 // 有找到可疑輸入回傳msg，否則回傳true
                 if (msg != "") {
                     return msg;
                 } else {
                     return "PASS";
                 } // end else
             } else {
                 return "PASS";
             } // end else

         } // end checkStrPass()
    </script>



    <table id="contenttb" style="background-color: white; width: 100%;">
        <tr>
            <td colspan="2" style="height: 10%;"></td>
        </tr>


        <tr>
            <td></td>
            <td>
                <table id="centertb" class="tablecenter">
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/img_search.png" meta:resourcekey="Image1Resource1" />
                            <br />
                            <br />
                            <div class="ui-widget">
                                <table>
                                    <tr>
                                        <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtKeyword" runat="server" Width="560px" Height="25px" meta:resourcekey="txtKeywordResource1"></asp:TextBox>&nbsp;<telerik:RadButton ID="SearchBtn" runat="server" Text="搜尋" OnClientClicked="OnClientClicked" OnClick="SearchBtn_Click" meta:resourcekey="SearchBtnResource1" Style="position: relative;"></telerik:RadButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%;"></td>
                                        <td>
                                            <br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="Label2" runat="server" Text="時間範圍：" meta:resourcekey="Label2Resource1"></asp:Label></td>
                                        <td style="white-space:nowrap">
                                            <asp:DropDownList ID="ddlDateSelect" runat="server" onchange="CheckShowDatePicker();" meta:resourcekey="ddlDateSelectResource1">
                                                <asp:ListItem Text="不限時間" Selected="True" Value="Notset" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                                <asp:ListItem Text="過去1天" Value="24hour" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                                <asp:ListItem Text="過去1周" Value="week" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                                <asp:ListItem Text="過去1個月" Value="month" meta:resourcekey="ListItemResource5"></asp:ListItem>
                                                <asp:ListItem Text="過去1年" Value="year" meta:resourcekey="ListItemResource6"></asp:ListItem>
                                                <asp:ListItem Text="日期範圍" Value="specdate" meta:resourcekey="ListItemResource7"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:LinkButton ID="lbtnInfo" runat="server" Text="使用說明" meta:resourcekey="lbtnInfoResource1"></asp:LinkButton>
                                         </td>                                                                               
                                    </tr>
                                    <tr>
                                        <td align="right"></td>
                                        <td>
                                            <table id="dateTb">
                                                <tr>
                                                    <td style="padding-left: 2px; padding-right: 1px">
                                                        <telerik:RadDatePicker ID="WebDateChooserBegin" runat="server"  meta:resourcekey="WebDateChooserBeginResource1">
                                                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>
                                                            <DateInput DisplayDateFormat="yyyy/M/d" DateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                                                <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                                                <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                                                <FocusedStyle Resize="None"></FocusedStyle>
                                                                <DisabledStyle Resize="None"></DisabledStyle>
                                                                <InvalidStyle Resize="None"></InvalidStyle>
                                                                <HoveredStyle Resize="None"></HoveredStyle>
                                                                <EnabledStyle Resize="None"></EnabledStyle>
                                                            </DateInput>
                                                            <DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                                                        </telerik:RadDatePicker>
                                                    </td>
                                                    <td style="padding-left: 2px; padding-right: 1px">
                                                        <asp:Label runat="server" ID="Label3" meta:resourcekey="Label3Resource1" Text="~"></asp:Label>
                                                    </td>
                                                    <td style="padding-left: 2px; padding-right: 1px">
                                                        <telerik:RadDatePicker ID="WebDateChooserEnd" runat="server"  meta:resourcekey="WebDateChooserEndResource1">
                                                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>
                                                            <DateInput DisplayDateFormat="yyyy/M/d" DateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                                                <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                                                                <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                                                                <FocusedStyle Resize="None"></FocusedStyle>
                                                                <DisabledStyle Resize="None"></DisabledStyle>
                                                                <InvalidStyle Resize="None"></InvalidStyle>
                                                                <HoveredStyle Resize="None"></HoveredStyle>
                                                                <EnabledStyle Resize="None"></EnabledStyle>
                                                            </DateInput>
                                                            <DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                                                        </telerik:RadDatePicker>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>

                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="Label1" runat="server" Text="模組：" meta:resourcekey="Label1Resource1"></asp:Label></td>
                                        <td>
                                            <%--                                   <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="5" Width="500px">
                                                <asp:ListItem Value="BULLETIN" Selected="True">公告</asp:ListItem>
                                                <asp:ListItem Value="FORUM" Selected="True">討論</asp:ListItem>
                                                <asp:ListItem Value="DMS" Selected="True">文件管理</asp:ListItem>
                                                <asp:ListItem Value="PRIVATEMESSAGE" Selected="True">私人訊息</asp:ListItem>
                                                <asp:ListItem Value="BRIEFCASE" Selected="True">公事包</asp:ListItem>
                                                <asp:ListItem Value="WKF" Selected="True">電子簽核</asp:ListItem>
                                            </asp:CheckBoxList>--%>
                                            <asp:CheckBox ID="chkBulletin" ValidationGroup="Module" Text="公告" Checked="True" runat="server" meta:resourcekey="chkBulletinResource1" />&nbsp;&nbsp;&nbsp;
          <asp:CheckBox ID="chkForum" ValidationGroup="Module" Text="討論" Checked="True" runat="server" meta:resourcekey="chkForumResource1" />&nbsp;&nbsp;&nbsp;
          <asp:CheckBox ID="chkDMS" ValidationGroup="Module" Text="文件管理" Checked="True" runat="server" meta:resourcekey="chkDMSResource1" /><asp:LinkButton ID="LinkButton1" Visible="False" runat="server" OnClick="LinkButton1_Click" meta:resourcekey="LinkButton1Resource1" Text="Advance"></asp:LinkButton>&nbsp;&nbsp;&nbsp;
          
          <asp:CheckBox ID="chkBRIEFCASE" ValidationGroup="Module" Text="公事包" Checked="True" runat="server" meta:resourcekey="chkBRIEFCASEResource1" />&nbsp;&nbsp;&nbsp;
          <asp:CheckBox ID="chkWKF" ValidationGroup="Module" Text="電子簽核" Checked="True" runat="server" meta:resourcekey="chkWKFResource1" />&nbsp;&nbsp;&nbsp;
          <asp:CheckBox ID="chkPRIVATEMSG" ValidationGroup="Module" Text="私人訊息" runat="server" meta:resourcekey="chkPRIVATEMSGResource1" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="Label4" runat="server" Text="搜尋模式：" meta:resourcekey="Label4Resource1"></asp:Label></td>
                                        <td>
                                            <%--                                           <asp:RadioButtonList ID="rdoSearch" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" meta:resourcekey="rdoSearchResource1">
                                        <asp:ListItem Text="完全符合" Value="Normal" meta:resourcekey="ListItemResource8"></asp:ListItem>
                                        <asp:ListItem Text="模糊搜尋" Value="Fuzzy" Selected="True" meta:resourcekey="ListItemResource9"></asp:ListItem>
                                        <asp:ListItem Text="英文詞性代換" Value="" meta:resourcekey="ListItemResource10"></asp:ListItem>
                                        <asp:ListItem Text="同音字搜尋" Value="Homophone" meta:resourcekey="ListItemResource11"></asp:ListItem>
                                        <asp:ListItem Text="同義詞搜尋" Value="Synonym" meta:resourcekey="ListItemResource12"></asp:ListItem>
                                        <asp:ListItem Text="簡繁對譯搜尋" Value="ChineseConvert" meta:resourcekey="ListItemResource13"></asp:ListItem>
                                    </asp:RadioButtonList>--%>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:RadioButton ID="RadioButton1" runat="server" Text="完全符合" Checked="True" GroupName="rdoSearch" meta:resourcekey="RadioButton1Resource1" />&nbsp;&nbsp;
                                                    </td>
                                                    <td style="white-space: nowrap">
                                                        <asp:RadioButton ID="RadioButton2" runat="server" Text="模糊搜尋" GroupName="rdoSearch" meta:resourcekey="RadioButton2Resource1" />&nbsp;&nbsp;
                                                    </td>
                                                    <td style="white-space: nowrap">
                                                        <asp:RadioButton ID="RadioButton3" runat="server" Text="英文詞性代換" GroupName="rdoSearch" meta:resourcekey="RadioButton3Resource1" />&nbsp;&nbsp;
                                                    </td>
                                                    <td style="white-space: nowrap">
                                                        <asp:RadioButton ID="RadioButton4" runat="server" Text="同音字搜尋" GroupName="rdoSearch" meta:resourcekey="RadioButton4Resource1" />&nbsp;&nbsp;
                                                    </td>
                                                    <td style="white-space: nowrap">
                                                        <asp:RadioButton ID="RadioButton5" runat="server" Text="同義詞搜尋" GroupName="rdoSearch" meta:resourcekey="RadioButton5Resource1" />&nbsp;&nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="white-space: nowrap">
                                                        <asp:RadioButton ID="RadioButton6" runat="server" Text="簡繁對譯搜尋" GroupName="rdoSearch" meta:resourcekey="RadioButton6Resource1" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>

                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

    </table>
    <asp:Label ID="lblErrmsg" runat="server" Text="關鍵字請勿輸入符號或指令" Visible="False" meta:resourcekey="lblErrmsgResource1"></asp:Label>
    <asp:Label ID="lblInfoMsg" runat="server" Text="使用說明" Visible="False" meta:resourcekey="lblInfoMsgResource1"></asp:Label>
    <asp:Label ID="lblNullMsg" runat="server" Text="請選擇要查詢的模組" Visible="False" meta:resourcekey="lblNullMsgResource1"></asp:Label>
</asp:Content>
