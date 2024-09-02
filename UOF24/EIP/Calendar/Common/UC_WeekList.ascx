<%@ Control Language="C#" AutoEventWireup="true" Inherits="Ede.Uof.EIP.Schedule.UI.UC_WeekList" Codebehind="UC_WeekList.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="UC_CalendarMenu.ascx" TagName="UC_CalendarMenu" TagPrefix="uc2" %>
<%@ Register Src="UC_Calendar.ascx" TagName="UC_Calendar" TagPrefix="uc1" %>
<%@ Register Src="UC_ScheduleTypeList.ascx" TagName="UC_ScheduleTypeList" TagPrefix="uc3" %>

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

    function btnChangeView_Clicking(sender, args) {
        if ($("#<%=lblWeekType.ClientID %>").get_text() == "DateWeek") {
            $("#<%=lblWeekType.ClientID %>").set_text("PersonWeek");
        }
        else {
            $("#<%=lblWeekType.ClientID %>").set_text("DateWeek");
        }
    }


    function RadToolBar1_WeekList_ButtonClicking(sender, args) {

        var Key = args.get_item().get_value();

        if (Key == "btnChangeView") {
            if ($("#<%=lblWeekType.ClientID %>").get(0).innerText == "DateWeek") {
                $("#<%=lblWeekType.ClientID %>").get(0).innerText = "PersonWeek";

            }
            else {
                $("#<%=lblWeekType.ClientID %>").get(0).innerText = "DateWeek";
            }
        }

        if (Key == "btnExportExcel") {
            args.set_cancel(true);
            $("#<%=btnExportExcel.ClientID%>").click();
        }       

        if (Key == "Sync") {
            args.set_cancel(true);
            $("#<%=btnSyncCalendar.ClientID%>").click();
        }
        if (Key == "Renew") {
            args.set_cancel(true);
            $("#<%=btnRenew.ClientID%>").click();
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
    
</script>
<style>
      .btnAlign
    {
      margin-top :5px;
    }
</style>
<div onclick="Window_OnClick()">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table border="0"  style="background-color:white;width:100%;vertical-align:top ;text-align:left">
                <tr>
                    <td  style="width: 180px;vertical-align:top ;text-align:left" >
                        <uc1:UC_Calendar ID="UC_Calendar1" runat="server" />
                        <uc2:UC_CalendarMenu ID="UC_CalendarMenu1" runat="server" />
                    </td>
                    <td style="width:100%;vertical-align:top ;text-align:left">
                        <table style="width:100%;vertical-align:top ;text-align:left" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnButtonClick="RadToolBar1_ButtonClick"
                                        OnClientButtonClicking="RadToolBar1_WeekList_ButtonClicking">
                                        <Items>
                                            <telerik:RadToolBarButton runat="server" Value="btnChangeView" Text="切換檢視模式" DisabledImageUrl="~/Common/Images/Icon/icon_m10.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m10.gif" ImageUrl="~/Common/Images/Icon/icon_m10.gif"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m10.gif" meta:resourcekey="TBarButtonResource1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="btnExportExcel" Text="匯出Excel" DisabledImageUrl="~/Common/Images/Icon/icon_m177.gif"
                                                HoveredImageUrl="~/Common/Images/Icon/icon_m177.gif" ImageUrl="~/Common/Images/Icon/icon_m177.gif"
                                                CheckedImageUrl="~/Common/Images/Icon/icon_m177.gif" meta:resourcekey="TBarButtonResource2">
                                            </telerik:RadToolBarButton>
                                             <telerik:RadToolBarButton runat="server" Value="NotDisplay">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cbExportNotDisplay" runat="server" Text="匯出Excel時隱藏行事曆中的不顯示事件"
                                                        meta:resourcekey="cbExportNotDisplayResource1" />
                                                </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s3">
                                            </telerik:RadToolBarButton>
                                            <telerik:RadToolBarButton runat="server" Value="btnbCompleteSign"> 
                                                    <ItemTemplate>
                                                      <div class="btnAlign">
                                                        <asp:CheckBox ID="cbCompleteSign" Text="標記已完成的工作" Checked="false" runat="server" onClick="checkBox_cbCompleteSign_Click()" OnCheckedChanged="cbCompleteSign_CheckedChanged" AutoPostBack="true" meta:resourcekey="cbCompleteSignResource1" />   
                                                      </div>
                                                    </ItemTemplate>
                                            </telerik:RadToolBarButton>
                                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s4">
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
                                <td>
                                    <table width="100%" height="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="33%">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <uc3:UC_ScheduleTypeList ID="UC_ScheduleTypeList2" runat="server" />
                                                        </td>
                                                        <td style="white-space:nowrap">
                                                            <asp:LinkButton ID="lbtnImgDesc" runat="server" Text="圖示說明" meta:resourcekey="lbtnImgDescResource2"></asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="34%" align="center">
                                                <table width="100%" height="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="15%" align="right">
                                                            <asp:ImageButton ID="leftImgButton" runat="server" ImageUrl="~/EIP/Calendar/images/pre.jpg"
                                                                OnClick="leftImgButton_Click" meta:resourcekey="leftImgButtonResource1"></asp:ImageButton>
                                                        </td>
                                                        <td align="center">
                                                            <asp:Label ID="lbWeek" runat="server" Font-Bold="True" meta:resourcekey="lbWeekResource1"></asp:Label>
                                                        </td>
                                                        <td width="15%" align="left">
                                                            <asp:ImageButton ID="rightImgButton" runat="server" ImageUrl="~/EIP/Calendar/images/next.jpg"
                                                                OnClick="rightImgButton_Click" meta:resourcekey="rightImgButtonResource1"></asp:ImageButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="33%" align="right">
                                                <table>
                                                    <tr>
                                                        <td>
                                                        </td>
                                                        <td style="white-space:nowrap">
                                                            <asp:Label ID="lbOwner" runat="server" Font-Bold="True" ForeColor="Maroon" meta:resourcekey="lbOwnerResource1"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td>
                                    <div id="table1Div">
                                        <asp:Table ID="Table1" runat="server" meta:resourcekey="Table1Resource1">
                                        </asp:Table>
                                    </div>
                                    <div id="table2Div">
                                        <asp:Table ID="Table2" runat="server" Visible="False" meta:resourcekey="Table2Resource1">
                                        </asp:Table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblWeekType" runat="server" Style="display: none" meta:resourcekey="lblWeekTypeResource1"></asp:Label>
            <asp:Label ID="lblNotDisplay" runat="server" Visible="False" Text="當別人查閱我的行事曆時不顯示事件" meta:resourcekey="lblNotDisplayResource1"></asp:Label>
            <asp:Label ID="lbReaderGuid" runat="server" Visible="False" meta:resourcekey="lbReaderGuidResource1"></asp:Label>
            <asp:Label ID="lbOwnerGuid" runat="server" Visible="False" meta:resourcekey="lbOwnerGuidResource1"></asp:Label>&nbsp;
            <asp:Label ID="lbShowDate" runat="server" Font-Bold="True" Visible="False" meta:resourcekey="lbShowDateResource1"></asp:Label>
            <asp:Label ID="lblXML" runat="server" Visible="False" meta:resourcekey="lblXMLResource1"></asp:Label>
            <asp:Label ID="lblOwnMsg" runat="server" Text="共{0}人的行事曆" meta:resourcekey="lblOwnMsgResource1" Visible="False"></asp:Label>
            <asp:Label ID="lblAlert" runat="server" Text="未選擇任一類別，將顯示所有事件" Visible="False"></asp:Label>
            <asp:Label ID="lblSyncTime" runat="server" Text="更新時間 :" Visible="False" meta:resourcekey="lblSyncTimeResource1"></asp:Label>    
            <asp:HiddenField ID="hideIsInferior" runat="server" Value="false" />
            <asp:HiddenField ID="HiddenXML" runat="server" />
            <asp:HiddenField ID="hideStartDate" runat="server" />
            <asp:HiddenField ID="hideDatePeriod" runat="server" />
            <asp:HiddenField ID="hideAllowCreats" runat="server" />
            <asp:HiddenField ID="hideWeekType" runat="server" />
            <asp:HiddenField ID="hideuserguid" runat="server" />
            <asp:HiddenField ID="hideCalendarActList" runat="server" />
            <telerik:RadButton ID="btnExportExcel" runat="server" Text="匯出Excel" meta:resourcekey="btnExportExcelResource1" Style="display: none" OnClick="btnExportExcel_Click"></telerik:RadButton>
            <telerik:RadButton ID="btnChangeView" runat="server" Text="切換檢視模式" OnClick="btnChangeView_Click" meta:resourcekey="btnChangeViewResource1" Style="display: none" OnClientClicking="btnChangeView_Clicking"></telerik:RadButton>
            <telerik:RadButton ID="btnRenew" runat="server" Text=""  Style="display: none" AutoPostBack="true" ></telerik:RadButton>            
            <asp:Label ID="lblCalendarSyncTitle" runat="server" meta:resourceKey="lblCalendarSyncTitleResource1" Text="更新狀態" Visible="False"></asp:Label>
            <telerik:RadButton ID="btnSyncCalendar" runat="server" Text="同步訂閱的行事曆"  Style="display: none" AutoPostBack="true" OnClick="btnSyncCalendar_Click"></telerik:RadButton>            
       </ContentTemplate>
    </asp:UpdatePanel>
</div>
