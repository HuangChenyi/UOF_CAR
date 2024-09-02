<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_Information_Default" Title="個人資訊設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="UC_Member.ascx" TagName="UC_Member" TagPrefix="uc5" %>
<%@ Register Src="UC_Employee.ascx" TagName="UC_Employee" TagPrefix="uc4" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc3" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Basic/Personal/Information/Common/UC_DeviceInfo.ascx" TagPrefix="uc2" TagName="UC_DeviceInfo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script id="personaljs" type="text/javascript">
        var authwindow;
        var revokewindow;
        var flag = false;
        var flag2 = false;
        var myVar;
        var myVar2;

        function OpenDialogResult(returnValue) {
            if( typeof(returnValue)=="undefined")
                return false;
            else
                return true;
        }

        function Infomation_Default_RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "Create") {
                args.set_cancel(true);
                $uof.dialog.open2("~/Basic/Personal/Information/FavoriteUserSet.aspx", args.get_item(), 
               "title", 500, 500, OpenDialogResult);                
            }
            else if (value == "Delete") {
                var checkIcsData = $uof.fastGrid.getChecked('<%=Grid1.ClientID%>');
                if(typeof (checkIcsData) == 'undefined' || checkIcsData == null || checkIcsData == ''){
                    alert('<%=lblselectDeleteDoc.Text %>');//請選擇要刪除的資料
                    args.set_cancel(true);
                }
                else{
                    args.set_cancel(!confirm('<%=msgDeleteUserSet.Text %>'));
                }
            }
        }

        function linkGooglePlay() {
            var googlePlayUrl = '<%=hidGooglePlayUrl.Value%>';
            window.open(googlePlayUrl, '_blank');
        }

        function linkAppStore() {
            var AppleStoreUrl = '<%=hidAppleStoreUrl.Value%>';
             window.open(AppleStoreUrl, '_blank');
        }

        function linkWindowUM() {
            var WindowUMUrl = '<%=hidWindowUMUrl.Value%>';
            window.open(WindowUMUrl, '_blank');
        }

        function linkMacUM() {
            var MacUMUrl = '<%=hidMacUMUrl.Value%>';
            window.open(MacUMUrl, '_blank');
         }
        
        function OpenGoogleRevoke(url) {
            flag = false;
            flag2 = false;
            myVar2 = setInterval(function () { checkrevoke(); }, 300);
            revokewindow = $uof.window.open(url, 300, 100);
        }

        function OpenGoogleAuth(url) {
            flag = false;
            flag2 = false;
            myVar = setInterval(function () { checkauth(); }, 300);
            authwindow = $uof.window.open(url, 500, 600);
            
        }

        function checkauth() {
            if (authwindow) {
                if (authwindow.closed) {
                    if (authwindow && !flag) {
                        var result = $uof.pageMethod.sync("UpdateGoogleInfo", []);
                       
                        $("#<%=hideBindGoogle.ClientID %>").val(result);
                        __doPostBack("<%=LinkBtnBind2.UniqueID %>", 'OnClick');
                        
                        flag = true;
                        stopCheckauth();
                    }
                }
            }
        }

        function checkrevoke() {
            if (revokewindow) {
                if (revokewindow.closed ) {
                    if ( !flag2) {
                        $uof.pageMethod.sync("RevokeGoogleInfo", []);
                __doPostBack("<%=LinkBtnRevoke2.UniqueID %>", 'OnClick');
                flag2 = true;  
                stopCheckrevoke();
                    }
                }
            }         

        }

        function stopCheckauth() {
            clearInterval(myVar);
        }

        function stopCheckrevoke() {
            clearInterval(myVar2);
        }

        //訂閱行事曆
        function RadToolBar_ButtonClicking(sender, args) {
            var Key = args.get_item().get_value();
            var checkIcsData = $uof.fastGrid.getChecked('<%=grdSubCalendar.ClientID%>');
            var hfCurrentGuid = $('#<%=hfUserGuid.ClientID %>').val();
            var isDeleteIcsSetting = false;
            var needDeleteSyncData = false;

            args.set_cancel(true);
            if (Key == "Insert") {
                $uof.dialog.open2("~/Basic/Personal/Information/CalendarSyncSetting.aspx", args.get_item(), "<%=lblCalendarLinkSet.Text %>", 770, 300, OpenDialogResult);
            }
            else if (Key == "Delete") {
                if (typeof (checkIcsData) == 'undefined' || checkIcsData == null || checkIcsData == '') {
                    alert('<%=lblselectDeleteDoc.Text %>');//請選擇要刪除的資料
                }
                else if (confirm('<%=lblConfirmDelete.Text %>')) { //確認是否只要刪除連結                 

                   isDeleteIcsSetting = true;
                }
            }
            else if (Key == "DeleteLinkAndSyncData") {
                if (typeof (checkIcsData) == 'undefined' || checkIcsData == null || checkIcsData == '') {
                    alert('<%=lblselectDeleteDoc.Text %>');//請選擇要刪除的資料
                }
                else if (confirm('<%=lblConfirmDeleteLinkAndSyncData.Text %>')) { //確認是否要刪除連結與同步的資料

                    isDeleteIcsSetting = true;
                    needDeleteSyncData = true;
                }
            }

            if (isDeleteIcsSetting == true) {
                if (typeof (checkIcsData) != 'undefined' && checkIcsData != null && checkIcsData != '') {
                    var data = [checkIcsData, needDeleteSyncData, hfCurrentGuid];
                    $uof.pageMethod.sync("DeleteIcsSetting", data);
                    args.set_cancel(false);
                }
            }
        }

        function OnClientClickingCalendar(sender, args) {
            args.set_cancel(true);
            $uof.dialog.open2("~/Basic/Personal/Information/CalendarLink.aspx", sender, "", 500, 200, OpenDialogResult);
           
        }

        function OnClientClickingCalendarCancel(sender, args) {
            var shortcode = $("#<%=lblSubscribeShort.ClientID %>").text();
            var data = [shortcode];
            $uof.pageMethod.sync("CalendarSubscribeCancel", data);
        }

        function OnPayEnvClick(s,e) {
            var data = [''];
            var result = $uof.pageMethod.sync("GetCommonKey", data);
            if (result.indexOf("!@#")!=0) {
                window.open(result, 'PayEnvelope', "height=960,width=1280");
            }
            else {
                $("#<%=lbl104Exceptions.ClientID%>").text(result.replace("!@#", ""));
                $("#<%=lbl104Exceptions.ClientID%>").css("display", "");
                e.set_cancel(true);
            }
        }

    </script>

    <table width="100%" cellpadding="5">
        <tr>            
            <td>
                <telerik:RadTabStrip ID="rts1" MultiPageID="rmp1" runat="server"
                    SelectedIndex="0" meta:resourcekey="rts1Resource3">
                    <Tabs>
                        <telerik:RadTab runat="server" Text="基本資料設定" Value="BaseData" PageViewID="rpvBaseData" meta:resourcekey="RadTabResource1" Selected="True">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="設定" Value="Setup" PageViewID="rpvSetup" meta:resourcekey="RadTabResource2">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="App設定" Value="Device" PageViewID="rpvDevice" meta:resourcekey="RadTabResource3">
                        </telerik:RadTab>
                        <telerik:RadTab runat="server" Text="電子薪資袋" Value="Salary" PageViewID ="rpvSalary" meta:resourcekey="RadTabResource4"></telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage ID="rmp1" runat="server" BackColor="White"
                    SelectedIndex="1" meta:resourcekey="rmp1Resource3">
                    <telerik:RadPageView ID="rpvBaseData" runat="server" meta:resourcekey="rpvBaseDataResource3"></telerik:RadPageView>
                    
                    <telerik:RadPageView ID="rpvSetup" runat="server" meta:resourcekey="rpvSetupResource3" Selected="True">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table class="PopTable" cellspacing="1" width="100%">
                                  <asp:Panel ID="panUM" runat="server" meta:resourcekey="panUMResource1">  
                                    <tr>
                                        <td class="PopTableHeader">
                                            <asp:Label ID="lblUOFMessenger" runat="server" Text="即時通訊(UOF Messenger)" meta:resourcekey="lblUOFMessengerResource1"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; vertical-align: middle">
                                            <table>                
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblUMdownload" runat="server" Text="下載並完成安裝後即可於個人電腦上使用UChat聊天功能與UMii智慧助理" meta:resourcekey="lblUMdownloadResource1"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left: 20px">
                                                        <asp:ImageButton ID="ibtnWindowUM" runat="server" ImageUrl="~/Common/Images/windows.png" OnClientClick="linkWindowUM()" meta:resourcekey="ibtnWindowUMResource1" />
                                                        <asp:ImageButton ID="ibtnMacUM" runat="server" ImageUrl="~/Common/Images/mac.png" OnClientClick="linkMacUM()" meta:resourcekey="ibtnMacUMResource1" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                     </tr>
                                   </asp:Panel>
                                    <tr>
                                        <td class="PopTableHeader">
                                            <asp:Label ID="Label27" runat="server" Text="通知" meta:resourcekey="Label27Resource1"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; vertical-align: middle">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblGotMessage" runat="server" Text="收到私人訊息時" meta:resourcekey="lblGotMessageResource1"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left: 20px;">
                                                        <asp:CheckBox ID="cbEmail" runat="server" Text="寄信至我的e-mail" AutoPostBack="True" OnCheckedChanged="cbEmail_CheckedChanged" meta:resourcekey="cbEmailResource1" />
                                                            <asp:Label runat="server" ID="lblForceTransEmail" Text="*系統管理員已啟用強制轉發Mail功能" Visible="False" CssClass="SizeMemo" meta:resourcekey="lblForceTransEmailResource1"></asp:Label>
                                                        <asp:Panel runat="server" ID="panelAfterTransMail" style="padding-left: 13px;display: flex;" meta:resourcekey="panelAfterTransMailResource1">
                                                            <asp:Label runat="server" ID="lblAfterTransMail" Text="轉發成功後" meta:resourcekey="lblAfterTransMailResource1"></asp:Label>
                                                            <asp:Panel runat="server" ID="panelAfterTransMailMode" style="padding-left: 10px;" meta:resourcekey="panelAfterTransMailModeResource1">
                                                                <asp:RadioButton runat="server" ID="rbAfterTransMailModeSave" GroupName="rbgAfterTransMailMode" Text="保留私人訊息，並標示為" Checked="True" AutoPostBack="True" OnCheckedChanged="rbAfterTransMailModeSave_CheckedChanged" meta:resourcekey="rbAfterTransMailModeSaveResource1" />
                                                                <asp:DropDownList runat="server" ID="ddlAfterTransMailModeSave" AutoPostBack="True" OnSelectedIndexChanged="ddlAfterTransMailModeSave_SelectedIndexChanged" meta:resourcekey="ddlAfterTransMailModeSaveResource1">
                                                                    <asp:ListItem Value="UnRead" Text="未讀" Selected="True" meta:resourcekey="liAfterTransMailUnReadResource1"></asp:ListItem>
                                                                    <asp:ListItem Value="Readed" Text="已讀" meta:resourcekey="liAfterTransMailReadedResource1"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <br />
                                                                <asp:RadioButton runat="server" ID="rbAfterTransMailModeDelete" GroupName="rbgAfterTransMailMode" Text="刪除私人訊息" AutoPostBack="True" OnCheckedChanged="rbAfterTransMailModeDelete_CheckedChanged" meta:resourcekey="rbAfterTransMailModeDeleteResource1" />
                                                            </asp:Panel>
                                                        </asp:Panel>
                                                        <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="請先至基本資料設定填寫電子郵件" ForeColor="Red" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                                                        <br />
                                                        <asp:CheckBox ID="cbPush" runat="server" Visible="False" Text="傳送至我的行動裝置" AutoPostBack="True" Enabled="False" ForeColor="#999999" Height="100%" OnCheckedChanged="cbPush_CheckedChanged" meta:resourcekey="cbPushResource1" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblGetApp" runat="server" Text="也可以使用行動裝置接收通知" meta:resourcekey="lblGetAppResource1"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-left: 20px">
                                                        <asp:ImageButton ID="imgGoogle" runat="server" ImageUrl="~/Common/Images/googlePlay.png" OnClientClick="linkGooglePlay()" meta:resourcekey="imgGoogleResource1" />
                                                        <asp:ImageButton ID="imgApple" runat="server" ImageUrl="~/Common/Images/AppStore.png" OnClientClick="linkAppStore()" meta:resourcekey="imgAppleResource1" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <asp:Panel ID="panEmpl" runat="server" meta:resourcekey="panEmplResource1">
                                        <tr>
                                            <td class="PopTableHeader">
                                                <asp:Label ID="Label7" runat="server" Text="私人訊息簽名檔設定" meta:resourcekey="Label7Resource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; vertical-align: middle">
                                                <asp:CheckBox ID="cbIsNewMessSign" runat="server" Text="在我撰寫的新訊息上自動包含我的簽名" AutoPostBack="True" OnCheckedChanged="cbIsNewMessSign_CheckedChanged" meta:resourcekey="cbIsNewMessSignResource1" />
                                                <br />
                                                <asp:CheckBox ID="cbIsReplyMessSign" runat="server" Text="在我轉寄或回覆的訊息上自動包含我的簽名" AutoPostBack="True" OnCheckedChanged="cbIsReplyMessSign_CheckedChanged" meta:resourcekey="cbIsReplyMessSignResource1" />
                                            </td>
                                        </tr>
                                         <tr>
                                            <td class="PopTableHeader">
                                                <asp:Label ID="Label1" runat="server" Text="與Google帳號連結" meta:resourcekey="Label1Resource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label2" runat="server" Text="Google帳號：" meta:resourcekey="Label2Resource1"></asp:Label><asp:Label ID="lblGoogleAcc" runat="server" meta:resourcekey="lblGoogleAccResource1"></asp:Label>
                                                <asp:Label ID="lblInvalidAcc" runat="server" Text="連結帳號資訊不完全，請重新作連結" ForeColor="Red" Visible="False"  meta:resourcekey="lblInvalidAccResource1"></asp:Label>
                                                <br />
                                                 <telerik:RadButton ID="RadBtnBind" runat="server" Text="連結" meta:resourcekey="RadBtnBindResource1"></telerik:RadButton>
                                                <telerik:RadButton ID="RadBtnRevoke" runat="server" Text="解除" meta:resourcekey="RadBtnRevokeResource1"></telerik:RadButton><br />
                                                <asp:Label ID="Label3" runat="server" Text="1.設定完成後可將UOF行事曆顯示於Google行事曆上。" CssClass="SizeMemo" meta:resourcekey="Label3Resource1"></asp:Label><br />
                                                <asp:Label ID="Label4" runat="server" Text="2.請勿將同一個Google帳號連結到不同的UOF帳號上，會導致資料處理異常。" CssClass="SizeMemo" meta:resourcekey="Label4Resource1"></asp:Label>
                                                <asp:LinkButton ID="LinkBtnBind2" runat="server" OnClick="LinkBtnBind2_Click" meta:resourcekey="LinkBtnBind2Resource1"></asp:LinkButton>
                                                <asp:LinkButton ID="LinkBtnRevoke2" runat="server" OnClick="LinkBtnRevoke2_Click" meta:resourcekey="LinkBtnRevoke2Resource1"></asp:LinkButton>
                                                <asp:CustomValidator ID="CustomValidator1" Display="Dynamic"  runat="server" ErrorMessage="綁定帳號中斷或是發生錯誤，請重新作綁定" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                                <asp:Label ID="lblBindAgain" runat="server" Text="變更連結" Visible="False" meta:resourcekey="lblBindAgainResource1"></asp:Label>
                                                <asp:Label ID="lblBind" runat="server" Text="連結" Visible="False" meta:resourcekey="lblBindResource1"></asp:Label>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td class="PopTableHeader">
                                                <asp:Label ID="Label5" runat="server" Text="共用行事曆" meta:resourcekey="Label5Resource1"></asp:Label>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td style="text-align: left">
                                                 <telerik:RadButton ID="RadButton1" runat="server" Text="共用" OnClientClicking="OnClientClickingCalendar" OnClick="RadButton1_Click" meta:resourcekey="RadButton1Resource1"></telerik:RadButton>
                                                <asp:Label ID="lblSubscribeShort" Visible="False" runat="server" meta:resourcekey="lblSubscribeShortResource1" ></asp:Label>
                                                 <telerik:RadButton ID="RadButton2" runat="server" Text="取消共用"  OnClick="RadButton2_Click" meta:resourcekey="RadButton2Resource1"></telerik:RadButton>
                                                <br />
                                                <asp:Label ID="Label6"  runat="server"  CssClass="SizeMemo" Text="讓不同的軟體或裝置共用您的行事曆，例如iphone或outlook" meta:resourcekey="Label6Resource1"></asp:Label>
                                            </td>
                                        </tr>

                                         <tr>
                                            <td class="PopTableHeader">
                                                <asp:Label ID="lblSubscribeCalendar" runat="server" Text="訂閱行事曆" meta:resourcekey="lblSubscribeCalendarResource1"></asp:Label>
                                            </td>
                                        </tr>
                                         <tr>
                                           <td>
                                           <table style="width:100%">
                                            <tr>
                                             <td>
                                                <telerik:RadToolBar ID="RadToolSubCalendar" runat="server" Width="100%" OnButtonClick="RadToolSubCalendar_ButtonClick"  OnClientButtonClicking="RadToolBar_ButtonClicking"
                                                    meta:resourcekey="RadToolBarDomainResource1" SingleClick="None">
                                                    <Items>
                                                        <telerik:RadToolBarButton runat="server" Value="Insert" Text="新增" meta:resourcekey="TBarButtonResource1"
                                                           ClickedImageUrl="~/Common/Images/Icon/icon_m17.png" DisabledImageUrl="~/Common/Images/Icon/icon_m17.png"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m17.png" ImageUrl="~/Common/Images/Icon/icon_m17.png" >
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True"
                                                            meta:resourcekey="RadToolBarButtonResource1">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Value="Delete" Text="刪除連結" meta:resourcekey="TBarButtonResource2"
                                                            DisabledImageUrl="~/Common/Images/Icon/icon_m03.png" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                                                            ImageUrl="~/Common/Images/Icon/icon_m03.png" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton> 
                                                        <telerik:RadToolBarButton runat="server" Value="DeleteLinkAndSyncData" Text="刪除連結與同步資料" meta:resourcekey="TBarButtonResource3"
                                                            DisabledImageUrl="~/Common/Images/Icon/icon_m03.png" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png"
                                                            ImageUrl="~/Common/Images/Icon/icon_m03.png" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>                                                         
                                                        </Items>
                                                </telerik:RadToolBar>
                                             </td>
                                            </tr>
                                            <tr>
                                            <td style="text-align: left ; white-space: nowrap"">
                                               <Fast:Grid ID="grdSubCalendar" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" CustomDropDownListPage="False"
                                                   DataKeyOnClientWithCheckBox="True" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" DataKeyNames="ICS_GUID"
                                                   OnRowDataBound="grdSubCalendar_RowDataBound" width="100%" meta:resourcekey="grdSubCalendarResource1" AllowSorting="True" DefaultSortDirection="Ascending" PageSize="15" SelectedRowColor="" UnSelectedRowColor="">
                                                    <EnhancePagerSettings ShowHeaderPager="False" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                                                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                                     <Columns>
                                                           <asp:TemplateField HeaderText="行事曆名稱" meta:resourcekey="CalendarNameResource1">
                                                            <ItemTemplate>
                                                                <asp:LinkButton runat="server" ID="lbtnICSName" meta:resourcekey="lbtnICSNameResource1" ></asp:LinkButton>
                                                            </ItemTemplate>
                                                               <ItemStyle Width="24%" />
                                                        </asp:TemplateField>              
                                                         <asp:BoundField DataField="ICS_LINK" HeaderText="行事曆連結" meta:resourcekey="CalendarLinkResource1" >                                
                                                           <ItemStyle Width="75%" />
                                                           </asp:BoundField>
                                                    </Columns>
                                                </Fast:Grid>
                                                 <br />
                                                <asp:Label ID="lblSubCalendarInfo" Text="支援訂閱Outlook、Google或iCloud行事曆顯示於UOF行事曆上" runat="server"  CssClass="SizeMemo" meta:resourcekey="lblSubCalendarInfoResource1"></asp:Label>
                                             </td>
                                            </tr>
                                           </table>
                                           </td>
                                        </tr>

                                        <tr>
                                            <td class="PopTableHeader">
                                                <asp:Label ID="lbLeftOpen" runat="server" Text="開放別人編輯我的行事曆" meta:resourcekey="lbLeftOpenResource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <uc2:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="false" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="PopTableHeader">
                                                <asp:Label ID="Label25" runat="server" Text="設定代理人" meta:resourcekey="Label25Resource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="lblSettingAgentMsg" runat="server" Text="目前由管理者設定代理人" ForeColor="Red" meta:resourcekey="lblSettingAgentMsgResource1"></asp:Label>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label42" runat="server" Text="第一代理人" meta:resourcekey="Label42Resource1"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbFirstAgent" runat="server" meta:resourcekey="lbFirstAgentResource1"></asp:Label></td>
                                                        <td>
                                                            <asp:Panel ID="settingAgentPanel1" runat="server" meta:resourcekey="settingAgentPanel1Resource1">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <uc3:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce1" runat="server" />
                                                                        </td>
                                                                        <td>
                                                                            <telerik:RadButton ID="rbtnDeleteAgent1" OnClick="rbtnDeleteAgent1_Click" runat="server" meta:resourcekey="btnDeleteAgent1Resource1">
                                                                            </telerik:RadButton>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator3" Display="Dynamic"  runat="server" ErrorMessage="代理人不可設定為自己" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label43" runat="server" Text="第二代理人" meta:resourcekey="Label43Resource1"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbSecondAgent" runat="server" meta:resourcekey="lbSecondAgentResource1"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Panel ID="settingAgentPanel2" runat="server" meta:resourcekey="settingAgentPanel2Resource1">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <uc3:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce2" runat="server" />
                                                                        </td>
                                                                        <td>
                                                                            <telerik:RadButton ID="rbtnDeleteAgent2" runat="server" OnClick="rbtnDeleteAgent2_Click" meta:resourcekey="btnDeleteAgent2Resource1">
                                                                            </telerik:RadButton>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator4" Display="Dynamic"  runat="server" ErrorMessage="代理人不可設定為自己" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label44" runat="server" Text="第三代理人" meta:resourcekey="Label44Resource1"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lbThirdAgent" runat="server" meta:resourcekey="lbThirdAgentResource1"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Panel ID="settingAgentPanel3" runat="server" meta:resourcekey="settingAgentPanel3Resource1">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <uc3:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce3" runat="server" />
                                                                        </td>
                                                                        <td>
                                                                            <telerik:RadButton ID="rbtnDeleteAgent3" runat="server" Text="RadButton" OnClick="rbtnDeleteAgent3_Click" meta:resourcekey="btnDeleteAgent3Resource1">
                                                                            </telerik:RadButton>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                        <td>
                                                            <asp:CustomValidator ID="CustomValidator5" Display="Dynamic"  runat="server" ErrorMessage="代理人不可設定為自己" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="PopTableHeader">
                                                <asp:Label ID="lblfavoriteUserSet" runat="server" Text="常用人員設定" meta:resourcekey="lblfavoriteUserSetResource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="Infomation_Default_RadToolBar1_ButtonClicking" OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1" SingleClick="None">
                                                    <Items>
                                                        <telerik:RadToolBarButton runat="server" Text="新增" Value="Create"
                                                            ClickedImageUrl="~/Common/Images/Icon/icon_m17.png" DisabledImageUrl="~/Common/Images/Icon/icon_m17.png"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m17.png" ImageUrl="~/Common/Images/Icon/icon_m17.png" meta:resourcekey="RadToolBarButtonResource1">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete"
                                                            ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="RadToolBarButtonResource3">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                                                    </Items>
                                                </telerik:RadToolBar>
                                                <Fast:Grid ID="Grid1" runat="server" DataKeyNames="FAVORITE_GUID"
                                                    AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                                                    Width="100%"
                                                    OnRowDataBound="Grid1_RowDataBound" DataSourceID="odsFavoUserSet" DataKeyOnClientWithCheckBox="False" meta:resourcekey="Grid1Resource1"  DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" PageSize="15" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""  >
                                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                                    <ExportExcelSettings AllowExportToExcel="False" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="名稱" meta:resourcekey="TemplateFieldResource1">
                                                            <ItemTemplate>
                                                                <asp:LinkButton runat="server" ID="LinkButton1" Text='<%# Eval("FAVORITE_NAME") %>' meta:resourcekey="LinkButton1Resource1"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="人員設定" meta:resourcekey="TemplateFieldResource2">
                                                            <ItemTemplate>
                                                                <uc2:UC_ChoiceList runat="server" ID="UC_ChoiceFavUserSet"></uc2:UC_ChoiceList>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="FAVORITE_GUID" HeaderText="FAVORITE_GUID" Visible="False" meta:resourcekey="BoundFieldResource1" />
                                                    </Columns>
                                                </Fast:Grid>
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
                                <asp:AsyncPostBackTrigger ControlID="LinkBtnBind2" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="LinkBtnRevoke2" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </telerik:RadPageView>

                    <telerik:RadPageView ID="rpvDevice" runat="server" meta:resourcekey="rpvDeviceResource1">
                        <uc2:UC_DeviceInfo runat="server" ID="UC_DeviceInfo" />
                    </telerik:RadPageView>

                    <telerik:RadPageView ID="rpvSalary" runat="server" meta:resourcekey="rpvSalaryResource1">
                        <asp:UpdatePanel ID="updatePanelSalary" runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblPayEnvErrors" runat="server" Visible="False" ForeColor="Red" />
                                <table style="width:100%" class="PopTable">
                                    <tr>
                                        <td class="PopTableHeader" colspan="2">
                                            <asp:Label ID="lblPayEnvHeader" runat="server" Text="電子薪資袋" meta:resourcekey="lblPayEnvResource1"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPayEnv" runat="server" Text="電子薪資袋" meta:resourcekey="lblPayEnvResource1"></asp:Label>
                                        </td>
                                        <td>
                                            <telerik:RadButton id="btnPayEnv" Text="查詢"  runat="server" OnClientClicking="OnPayEnvClick"  meta:resourcekey="btnPayEnvResource1"></telerik:RadButton>
                                            <asp:Label ID="lbl104Exceptions" runat="server" style="display:none" ForeColor="Red" ></asp:Label>

                                            <br />
                                            <asp:Label ID="lblPayEnvMemo" runat="server" Text="點按後將另開視窗顯示查詢結果，提醒觀看後應關閉查詢視窗" CssClass="SizeMemo" meta:resourcekey="lblPayEnvMemoResource1"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </td>
        </tr>
    </table>

    <script language="javascript">
        function CheckSignLength(s, a) {
            if (a.Value.length > 255) {
                a.IsValid = false;
            }
        }

        function TestPushState(returnValue) {           
            if (returnValue === 'true') {
                   alert('<%=msgSuccessStop.Text %>');               
            }
            else {
                  alert('<%=msgfailStop.Text %>');              
            }
        }
    </script>

    <asp:Label ID="msgBasesetup" runat="server" Text="基本資料設定" Visible="False" meta:resourcekey="msgBasesetupResource1"></asp:Label>
    <asp:Label ID="msgSetup" runat="server" Text="設定" Visible="False" meta:resourcekey="msgSetupResource1"></asp:Label>
    <asp:Label ID="msgDelete" runat="server" meta:resourcekey="msgDeleteResource1" Text="刪除" Visible="False"></asp:Label>
    <asp:Label ID="lblConfirmDelete" runat="server" Text="將刪除行事曆連結，確定要刪除？" Visible="False" meta:resourcekey="lblConfirmDeleteResource1"></asp:Label>
    <asp:Label ID="lblConfirmDeleteLinkAndSyncData" runat="server" Text="將刪除連結與該連結所有已同步至行事曆的內容，確定要刪除？" Visible="False" meta:resourcekey="lblConfirmDeleteLinkAndSyncDataResource1"></asp:Label>
    <asp:Label ID="lblselectDeleteDoc" runat="server" Text="請選擇要刪除的資料" Visible="False" meta:resourcekey="lblselectDeleteDocResource1"></asp:Label>
    <asp:Label ID="lbUpdate" runat="server" Text="修改" Visible="False" meta:resourcekey="lbUpdateResource1"></asp:Label>
    <asp:Label ID="msgDeleteUserSet" runat="server" Text="確定要刪除嗎？" Visible="False" meta:resourcekey="msgDeleteUserSetResource1"></asp:Label>
    <asp:Label ID="lblDeviceNull" runat="server" Text="無法辨識的裝置" Visible="False" meta:resourcekey="lblDeviceNullResource1" ></asp:Label>
    <asp:Label ID="msgStopPushSet" runat="server" Text="確定要停用推播功能?" Visible="False" meta:resourcekey="msgStopPushSetResource1" ></asp:Label>
    <asp:Label ID="msgLogoutSet" runat="server" Text="確定要解除嗎?" Visible="False" meta:resourcekey="lblMessageResource1" ></asp:Label>
    <asp:Label ID="msgfailStop" runat="server" Text="推播測試失敗" Visible="False" meta:resourcekey="lblMessageResource2" ></asp:Label>
    <asp:Label ID="msgSuccessStop" runat="server" Text="推播測試成功" Visible="False"   meta:resourcekey="lblMessageResource3" ></asp:Label>
    <asp:Label ID="msgVerifyAdded" runat="server" Text="未通過" Visible="False"  meta:resourcekey="msgVerifyAdded"></asp:Label>
    <asp:Label ID="msgVerifyVerified" runat="server" Text="通過" Visible="False"  meta:resourcekey="msgVerifyVerified" ></asp:Label>
    <asp:Label ID="lblEnable" runat="server" Text="啟用" Visible="False" meta:resourcekey="lblEnable" ></asp:Label>
    <asp:Label ID="lblDisable" runat="server" Text="未啟用" Visible="False" meta:resourcekey="lblDisable"  ></asp:Label>
    <asp:Label ID="lbl104PortalUrlRequired" Text="未設定104Portal站台網址，請洽系統管理員" Visible="False" meta:resourcekey ="lbl104PortalUrlRequiredResource1" runat="server"></asp:Label>
    <asp:Label ID="lblCalendarLinkSet" runat="server" Text="行事曆連結設定" Visible="False" meta:resourcekey="lblCalendarLinkSetResource1"  ></asp:Label>
    <asp:Label ID="lblAppDeviceCountMsg" runat="server" Text="行動裝置限制綁定數量：" Visible="False" meta:resourcekey="lblAppDeviceCountMsgResource1"></asp:Label>
    <asp:Label ID="lblIsDeleteICSData" runat ="server" text="按[確定]將已同步的行事曆內容刪除，按[取消]只刪除訂閱連結" Visible="False" meta:resourcekey="lblIsDeleteICSDataResource1"/>
    
    <asp:HiddenField ID="hideBindGoogle" runat="server" />    
    <asp:HiddenField ID="hideUser" runat="server" />
    <asp:HiddenField ID="hidAppleStoreUrl" runat="server" />
    <asp:HiddenField ID="hidGooglePlayUrl" runat="server" />
    <asp:HiddenField ID="hidWindowUMUrl" runat="server" />
    <asp:HiddenField ID="hidMacUMUrl" runat="server" />
    <asp:HiddenField ID="hfUserGuid" runat="server" />
    <asp:ObjectDataSource ID="odsFavoUserSet" runat="server" TypeName="Ede.Uof.EIP.Organization.FavoriteUserSetUCO" SelectMethod="GetAllFavoriteUserSet">
        <SelectParameters>
            <asp:Parameter Name="userGUID" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
