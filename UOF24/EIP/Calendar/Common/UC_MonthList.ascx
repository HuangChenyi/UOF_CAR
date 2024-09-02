<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="Ede.Uof.EIP.Schedule.UI.UC_MonthList" Codebehind="UC_MonthList.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register Src="UC_ScheduleTypeList.ascx" TagName="UC_ScheduleTypeList" TagPrefix="uc3" %>
<link type="text/css" href='<%=Page.ResolveClientUrl("~/Common/Style/font-awesome/css/font-awesome.min.css")%>' rel="stylesheet" />   

<script type="text/javascript">
    function MyImage(Img) {
        var image = new Image();
        image.src = Img.src;
        width = 16; //預先設置的所期望的寬的值
        height = 16; //預先設置的所期望的高的值
        if (image.width > width || image.height > height) {//現有圖片只有寬或高超了預設值就進行js控制
            w = image.width / width;
            h = image.height / height;
            if (w > h) {//比值比較大==>寬比高大
                Img.width = width; //定下寬度為width的寬度
                Img.height = image.height / w; //以下為計算高度
                Img.style.margin = Math.floor((16 - (image.height / w)) / 2) + 'px '
                                   + Math.floor((16 - width) / 2) + 'px';

            } else {//高比寬大
                Img.height = height; //定下寬度為height高度
                Img.width = image.width / h; //以下為計算高度
                Img.style.margin = Math.floor((16 - height) / 2) + 'px '
                                   + Math.floor((16 - (image.width / h)) / 2) + 'px';
            }
        }       
    }

    function checkBox_cbCompleteSign_Click() {
        var toolbarbutton = $find("<%=RadToolBar1.ClientID%>").findItemByValue("btnbCompleteSign");
        var settingCheckBox = $telerik.findElement(toolbarbutton.get_element(), ("cbCompleteSign")); 

        if (settingCheckBox.checked) {
            $('.work-line-off').removeClass('work-line-off').addClass('work-line').addClass('IsCompleteWorkNolink').addClass('IsCompleteWork');
        }
        else {
            $('.work-line').removeClass('work-line').removeClass('IsCompleteWork').removeClass('IsCompleteWorkNolink').addClass('work-line-off');
        }        
    }

    function RadToolBar1_MonthList_ButtonClicking(sender, args) {

        var Key = args.get_item().get_value();

        if (Key == "Sync") {
            args.set_cancel(true);
            $("#<%=btnSyncCalendar.ClientID%>").click();
        }
        if (Key == "Renew") {
            args.set_cancel(true);
            $("#<%=btnRenew.ClientID%>").click();
         }
    }

</script>
<style>    
    .numberCircle
    {   
        background: #fabb4c;        
        width: 2.5em;
        border: 0.1em solid #fabb4c;
        text-align: center;    
    } 
     .btnAlign
    {
      margin-top :5px;
    }
</style>
<div onclick="Window_OnClick()">
    <table width="100%" cellpadding="0" cellspacing="0" style="background-color:white">
        <tr>
            <td>
                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td colspan="3">
                            <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" AutoPostBack="true"
                                OnButtonClick="RadToolBar1_ButtonClick"  OnClientButtonClicking="RadToolBar1_MonthList_ButtonClicking" > 
                                    <Items>
                                    <telerik:RadToolBarButton runat="server" Value="Status" Visible="false">
                                        <ItemTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text="狀態："  meta:resourcekey="Label1Resource1" ></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" meta:resourcekey="ddlStateResource1">
                                                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource1" Text="全部"></asp:ListItem>
                                                            <asp:ListItem Value="1" meta:resourcekey="ListItemResource2" Text="預約"></asp:ListItem>
                                                            <asp:ListItem Value="2" meta:resourcekey="ListItemResource3" Text="審核中"></asp:ListItem>
                                                            <asp:ListItem Value="3" meta:resourcekey="ListItemResource4" Text="已借出"></asp:ListItem>
                                                            <asp:ListItem Value="4" meta:resourcekey="ListItemResource5" Text="已歸還"></asp:ListItem>
                                                            <asp:ListItem Value="5" meta:resourcekey="ListItemResource6" Text="被拒絕"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s3" Visible="false"></telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Value="btnExportPDF" Text="匯出PDF" DisabledImageUrl="~/Common/Images/Icon/pdf.gif"
                                        HoveredImageUrl="~/Common/Images/Icon/pdf.gif" ImageUrl="~/Common/Images/Icon/pdf.gif"
                                        CheckedImageUrl="~/Common/Images/Icon/pdf.gif" meta:resourcekey="TBarButtonResource1">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" Value="btnExportExcel" Text="匯出Excel" DisabledImageUrl="~/Common/Images/Icon/icon_m177.gif"
                                        HoveredImageUrl="~/Common/Images/Icon/icon_m177.gif" ImageUrl="~/Common/Images/Icon/icon_m177.gif"
                                        CheckedImageUrl="~/Common/Images/Icon/icon_m177.gif" meta:resourcekey="TBarButtonResource2">
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2">
                                    </telerik:RadToolBarButton>  
                                    <telerik:RadToolBarButton runat="server" Value="btnbCompleteSign">
                                         <ItemTemplate>
                                              <div class="btnAlign">
                                                <asp:CheckBox ID="cbCompleteSign" Text="標記已完成的工作" runat="server" onClick="checkBox_cbCompleteSign_Click()" OnCheckedChanged="cbCompleteSign_CheckedChanged" AutoPostBack="true"  meta:resourcekey="cbCompleteSignResource1" />  
                                              </div>
                                         </ItemTemplate>
                                    </telerik:RadToolBarButton>
                                    <telerik:RadToolBarButton runat="server" IsSeparator="True" value="s4">
                                    </telerik:RadToolBarButton>  
                                      <telerik:RadToolBarButton runat="server" value="Sync" Text="同步訂閱的行事曆" meta:resourcekey="rdSyncCalendarResource1"
                                                ClickedImageUrl="~/Common/Images/Icon/icon_m38.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m38.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m38.gif" ImageUrl="~/Common/Images/Icon/icon_m38.gif">
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s5"></telerik:RadToolBarButton>  
                                         <telerik:RadToolBarButton runat="server" value="Renew" Text="更新狀態" meta:resourcekey="rdRefreshCalendarResource1"
                                                ClickedImageUrl="~/Common/Images/Icon/icon_m82.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m82.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m82.gif" ImageUrl="~/Common/Images/Icon/icon_m82.gif">
                                        </telerik:RadToolBarButton>
                                         <telerik:RadToolBarButton runat="server" value="Viewer"  > 
                                            <ItemTemplate>
                                                <div class="btnAlign">
                                                  <asp:Label ID="lblCalendarSyncViewer" runat="server"></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </telerik:RadToolBarButton>
                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s6"></telerik:RadToolBarButton>                                     
                                </Items>
                            </telerik:RadToolBar>                       
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 33%">
                            <table>
                                <tr>                                   
                                    <td>
                                        <uc3:UC_ScheduleTypeList ID="UC_ScheduleTypeList3" runat="server" Visible="False" />
                                    </td>
                                    <td style="display: none">
                                        <telerik:RadButton ID="rbtnExportPdf" runat="server" Text="匯出PDF" 
                                            Visible="False" meta:resourcekey="btnExportPdfResource1" 
                                            onclick="rbtnExportPdf_Click">
                                        </telerik:RadButton>
                                    </td>
                                    <td style="display: none">
                                        <telerik:RadButton ID="rbtnExportExcel" runat="server" Text="匯出Excel" 
                                            Visible="False" meta:resourcekey="btnExportExcelResource1" 
                                            onclick="rbtnExportExcel_Click" >
                                        </telerik:RadButton>
                                    </td>
                                    <td style="white-space:nowrap">
                                        <asp:LinkButton ID="lbtnImgDesc" runat="server" Text="圖示說明" meta:resourcekey="lbtnImgDescResource2"></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 34%" align="center">
                            <table width="100%" height="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 15%" align="right">
                                        <asp:ImageButton ID="leftImgButton" runat="server" ImageUrl="~/EIP/Calendar/images/pre.jpg"
                                            OnClick="leftImgButton_Click" meta:resourcekey="leftImgButtonResource1"></asp:ImageButton>
                                    </td>
                                    <td align="center">
                                        <asp:Label ID="lbMonth" runat="server" Font-Bold="True" meta:resourcekey="lbMonthResource1"></asp:Label>
                                    </td>
                                    <td style="width: 15%" align="left">
                                        <asp:ImageButton ID="rightImgButton" runat="server" ImageUrl="~/EIP/Calendar/images/next.jpg"
                                            OnClick="rightImgButton_Click" meta:resourcekey="rightImgButtonResource1"></asp:ImageButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 33%;white-space:nowrap" align="right">
                            <asp:Label ID="lbOwner" runat="server" Font-Bold="True" ForeColor="Maroon" meta:resourcekey="lbOwnerResource1"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:Image ID="imgDetail" runat="server" ImageUrl="~/Common/Images/Icon/icon_m60.gif"
                                Visible="false" />
                        </td>
                        <td>
                            <asp:Label ID="lblDetail" runat="server" Text="為多人共有事件，在行事曆中點選後可查看詳細人員。" CssClass="SizeMemo"
                                Visible="false" meta:resourcekey="lblDetailResource1"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr valign="top">
            <td>               
                <asp:Table ID="Table1" runat="server" meta:resourcekey="Table1Resource1" BackColor="White">
                </asp:Table>                  
            </td>
        </tr>
    </table>
</div>
<asp:Label ID="lblMultiUsers" runat="server" Visible="False" Text="為多人共有事件，點選後可查看詳細人員"
    meta:resourcekey="lblMultiUsersResource1"></asp:Label>
<asp:Label ID="lblNotDisplay" runat="server" Visible="False" Text="當別人查閱我的行事曆時不顯示事件"
    meta:resourcekey="lblNotDisplayResource1"></asp:Label>
<asp:Label ID="lblBooking" runat="server" Visible="False" Text="預約" meta:resourcekey="lblBookingResource1"></asp:Label>
<asp:Label ID="lblLoaned" runat="server" Visible="False" Text="借出" meta:resourcekey="lblLoanedResource1"></asp:Label>
<asp:Label ID="lblReturned" runat="server" Visible="False" Text="歸還" meta:resourcekey="lblReturnedResource1"></asp:Label>
<asp:Label ID="lblSinging" runat="server" Visible="False" Text="審核中" meta:resourcekey="lblSingingResource1"></asp:Label>
<asp:Label ID="lblRejected" runat="server" Visible="False" Text="被拒絕" meta:resourcekey="lblRejectedResource1"></asp:Label>
<asp:Label ID="lbReaderGuid" runat="server" Visible="False" meta:resourcekey="lbReaderGuidResource1"></asp:Label>
<asp:Label ID="lbOwnerGuid" runat="server" Visible="False" meta:resourcekey="lbOwnerGuidResource1"></asp:Label>&nbsp;
<asp:Label ID="lbShowDate" runat="server" Font-Bold="True" Visible="False" meta:resourcekey="lbShowDateResource1"></asp:Label>
<asp:Label ID="lbListType" runat="server" Visible="False" meta:resourcekey="lbListTypeResource1"></asp:Label>
<asp:Label ID="lbIsEditable" runat="server" Visible="False" meta:resourcekey="lbIsEditableResource1"></asp:Label>
<asp:Label ID="lbIsClass" runat="server" Visible="False" meta:resourcekey="lbIsClassResource1"></asp:Label>
<asp:Label ID="lbBorrowTagId" runat="server" Visible="False" meta:resourcekey="lbBorrowTagIdResource1"></asp:Label>
<asp:Label ID="lbBorrowTreeLevel" runat="server" Visible="False" meta:resourcekey="lbBorrowTreeLevelResource1"></asp:Label>
<asp:Label ID="lbGroupGuid" runat="server" Visible="False" meta:resourcekey="lbGroupGuidResource1"></asp:Label>
<asp:Label ID="lbIsOrgScheEditable" runat="server" Visible="False" meta:resourcekey="lbIsOrgScheEditableResource1"></asp:Label>
<asp:Label ID="lblOwnMsg" runat="server" Text="共{0}人的行事曆" Visible="False" meta:resourcekey="lblOwnMsgResource1"></asp:Label>
<asp:Label ID="lblAlert" runat="server" Text="未選擇任一類別，將顯示所有事件" Visible="False"></asp:Label>
<asp:Label ID="lblSyncTime" runat="server" Text="更新時間 :" Visible="False" meta:resourcekey="lblSyncTimeResource1"></asp:Label>  
<asp:Label ID="lblCalendarSyncTitle" runat="server" meta:resourceKey="lblCalendarSyncTitleResource1" Text="更新狀態" Visible="False"></asp:Label>
<telerik:RadButton ID="btnSyncCalendar" runat="server" Text="同步訂閱的行事曆"  Style="display: none" AutoPostBack="true" OnClick="btnSyncCalendar_Click"></telerik:RadButton>            
<telerik:RadButton ID="btnRenew" runat="server" Text=""  Style="display: none" AutoPostBack="true" ></telerik:RadButton>            
<asp:HiddenField ID="hideIsInferior" runat="server" Value="false" />
<asp:HiddenField ID="hideDatePeriod" runat="server" />
<asp:HiddenField ID="hideAllowCreats" runat="server" />
<asp:HiddenField ID="hideCustTypes" runat="server" />
<asp:HiddenField ID="hideFirstDay" runat="server" />
<asp:HiddenField ID="hideTotalDays" runat="server" />
<asp:HiddenField ID="hideuserguid" runat="server" />
<asp:HiddenField ID="hideCalendarActList" runat="server" />
                  

<%--<asp:Label ID="lblLunarMonth1" runat="server" Visible="False" Text="一月"></asp:Label>
<asp:Label ID="lblLunarMonth2" runat="server" Visible="False" Text="二月"></asp:Label>
<asp:Label ID="lblLunarMonth3" runat="server" Visible="False" Text="三月"></asp:Label>
<asp:Label ID="lblLunarMonth4" runat="server" Visible="False" Text="四月"></asp:Label>
<asp:Label ID="lblLunarMonth5" runat="server" Visible="False" Text="五月"></asp:Label>
<asp:Label ID="lblLunarMonth6" runat="server" Visible="False" Text="六月"></asp:Label>
<asp:Label ID="lblLunarMonth7" runat="server" Visible="False" Text="七月"></asp:Label>
<asp:Label ID="lblLunarMonth8" runat="server" Visible="False" Text="八月"></asp:Label>
<asp:Label ID="lblLunarMonth9" runat="server" Visible="False" Text="九月"></asp:Label>
<asp:Label ID="lblLunarMonth10" runat="server" Visible="False" Text="十月"></asp:Label>
<asp:Label ID="lblLunarMonth11" runat="server" Visible="False" Text="十一月"></asp:Label>
<asp:Label ID="lblLunarMonth12" runat="server" Visible="False" Text="十二月"></asp:Label>
<asp:Label ID="lblLunarDay1" runat="server" Visible="False" Text="初一"></asp:Label>
<asp:Label ID="lblLunarDay2" runat="server" Visible="False" Text="初二"></asp:Label>
<asp:Label ID="lblLunarDay3" runat="server" Visible="False" Text="初三"></asp:Label>
<asp:Label ID="lblLunarDay4" runat="server" Visible="False" Text="初四"></asp:Label>
<asp:Label ID="lblLunarDay5" runat="server" Visible="False" Text="初五"></asp:Label>
<asp:Label ID="lblLunarDay6" runat="server" Visible="False" Text="初六"></asp:Label>
<asp:Label ID="lblLunarDay7" runat="server" Visible="False" Text="初七"></asp:Label>
<asp:Label ID="lblLunarDay8" runat="server" Visible="False" Text="初八"></asp:Label>
<asp:Label ID="lblLunarDay9" runat="server" Visible="False" Text="初九"></asp:Label>
<asp:Label ID="lblLunarDay10" runat="server" Visible="False" Text="初十"></asp:Label>
<asp:Label ID="lblLunarDay11" runat="server" Visible="False" Text="十一"></asp:Label>
<asp:Label ID="lblLunarDay12" runat="server" Visible="False" Text="十二"></asp:Label>
<asp:Label ID="lblLunarDay13" runat="server" Visible="False" Text="十三"></asp:Label>
<asp:Label ID="lblLunarDay14" runat="server" Visible="False" Text="十四"></asp:Label>
<asp:Label ID="lblLunarDay15" runat="server" Visible="False" Text="十五"></asp:Label>
<asp:Label ID="lblLunarDay16" runat="server" Visible="False" Text="十六"></asp:Label>
<asp:Label ID="lblLunarDay17" runat="server" Visible="False" Text="十七"></asp:Label>
<asp:Label ID="lblLunarDay18" runat="server" Visible="False" Text="十八"></asp:Label>
<asp:Label ID="lblLunarDay19" runat="server" Visible="False" Text="十九"></asp:Label>
<asp:Label ID="lblLunarDay20" runat="server" Visible="False" Text="廿"></asp:Label>
<asp:Label ID="lblLunarDay21" runat="server" Visible="False" Text="廿一"></asp:Label>
<asp:Label ID="lblLunarDay22" runat="server" Visible="False" Text="廿二"></asp:Label>
<asp:Label ID="lblLunarDay23" runat="server" Visible="False" Text="廿三"></asp:Label>
<asp:Label ID="lblLunarDay24" runat="server" Visible="False" Text="廿四"></asp:Label>
<asp:Label ID="lblLunarDay25" runat="server" Visible="False" Text="廿五"></asp:Label>
<asp:Label ID="lblLunarDay26" runat="server" Visible="False" Text="廿六"></asp:Label>
<asp:Label ID="lblLunarDay27" runat="server" Visible="False" Text="廿七"></asp:Label>
<asp:Label ID="lblLunarDay28" runat="server" Visible="False" Text="廿八"></asp:Label>
<asp:Label ID="lblLunarDay29" runat="server" Visible="False" Text="廿九"></asp:Label>
<asp:Label ID="lblLunarDay30" runat="server" Visible="False" Text="三十"></asp:Label>
<asp:Label ID="lblBeginningOfSpring" runat="server" Visible="False" Text="立春"></asp:Label>
<asp:Label ID="lblRainWater" runat="server" Visible="False" Text="雨水"></asp:Label>
<asp:Label ID="lblWakingOfInsects" runat="server" Visible="False" Text="驚蟄"></asp:Label>
<asp:Label ID="lblSpringEquinox" runat="server" Visible="False" Text="春分"></asp:Label>
<asp:Label ID="lblPureBrightness" runat="server" Visible="False" Text="清明"></asp:Label>
<asp:Label ID="lblGrainRain" runat="server" Visible="False" Text="穀雨"></asp:Label>
<asp:Label ID="lblBeginninOfSummer" runat="server" Visible="False" Text="立夏"></asp:Label>
<asp:Label ID="lblGrainFull" runat="server" Visible="False" Text="小滿"></asp:Label>
<asp:Label ID="lblGrainInBread" runat="server" Visible="False" Text="芒種"></asp:Label>
<asp:Label ID="lblSummerSolstice" runat="server" Visible="False" Text="夏至"></asp:Label>
<asp:Label ID="lblLesserHeat" runat="server" Visible="False" Text="小暑"></asp:Label>
<asp:Label ID="lblGreaterHeat" runat="server" Visible="False" Text="大暑"></asp:Label>
<asp:Label ID="lblBeginningOfAutumn" runat="server" Visible="False" Text="立秋"></asp:Label>
<asp:Label ID="lblEndOfHeat" runat="server" Visible="False" Text="處暑"></asp:Label>
<asp:Label ID="lblWhiteDew" runat="server" Visible="False" Text="白露"></asp:Label>
<asp:Label ID="lblAutumnEquinox" runat="server" Visible="False" Text="秋分"></asp:Label>
<asp:Label ID="lblColdDew" runat="server" Visible="False" Text="寒露"></asp:Label>
<asp:Label ID="lblFrostDescent" runat="server" Visible="False" Text="霜降"></asp:Label>
<asp:Label ID="lblBeginningOfWinter" runat="server" Visible="False" Text="立冬"></asp:Label>
<asp:Label ID="lblLesserSnow" runat="server" Visible="False" Text="小雪"></asp:Label>
<asp:Label ID="lblGreaterSnow" runat="server" Visible="False" Text="大雪"></asp:Label>
<asp:Label ID="lblWinterSolstice" runat="server" Visible="False" Text="冬至"></asp:Label>
<asp:Label ID="lblLesserCold" runat="server" Visible="False" Text="小寒"></asp:Label>
<asp:Label ID="lblGreaterCold" runat="server" Visible="False" Text="大寒"></asp:Label>--%>
