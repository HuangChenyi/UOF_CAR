<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Calendar_Common_UC_CalendarMenu" Codebehind="UC_CalendarMenu.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<script type="text/javascript" id="telerikClientEvents1">

	function RadPanelBar1_ItemClicked(sender,args)
	{
	    var item = args.get_item(); 
	    var val = item.get_value();

	    if(val=='MyCalendar' || val=='ModifyOtherCalendar')
	    {
	        SetTabsVisible(true);
	        ClearSiteMapNode(); 
	        if(val=='ModifyOtherCalendar')
	        { 
	            AddOtherCalenderSiteMap();
	        } 
	        else
	        {
	            __doPostBack('ctl00_ctl00_ContentPlaceHolder1_MainContentPlaceHolder_ctl01_UC_CalendarMenu1_lbtPostback',''); 
	        }
	        AddActiveTabText(); 
	    }
	    else if( val=='ViewOthersCalendar' )
	        SetTabsVisible(false);
	}

	function GetDialogStr(Key, args)
	{
	    var selectDate = $('#ctl00_ctl00_ContentPlaceHolder1_MainContentPlaceHolder_HiddenSelectedTime').val();
	    GetCalendarDialogStr(Key, selectDate, args);	    
	    return false;
	}

	function GetCalendarDialogStr(Key, date, args)
	{
        var UserGuid = $('#ctl00_ctl00_ContentPlaceHolder1_MainContentPlaceHolder_hfOwnerGuid').val();
	    if(Key=='ModifyOtherCalendar')
	    {
	        $uof.dialog.open2("~/EIP/Calendar/Common/OpenEditScheduleUser.aspx",'', "",500,450,openDialogResultOther);
	    }	
	    else if(Key=='ViewOthersCalendar')
	    {
	        var hiddenXMLID = 'ctl00_ctl00_ContentPlaceHolder1_MainContentPlaceHolder_hiddenXML';

	        $uof.dialog.open2("~/Common/ChoiceCenter/ChoiceCenter.aspx",'', "",935,750,openDialogResultViewOthers,
                {"NeedPostBack":"1",
                    "ShowMember":"0",
                    "ShowSubDept":"1",
                    "ShowEmployee":"1",
                    "ExpandToUser":"1",
                    "ChioceType":"All",
                    "DisplayAllDept":"0",
                    "hf":hiddenXMLID});
	    }
	    else if(Key=='MyCalendar')
	    {
	        $('#ctl00_ctl00_ContentPlaceHolder1_MainContentPlaceHolder_hiddenXML').val('');
	        $('#ctl00_ctl00_ContentPlaceHolder1_MainContentPlaceHolder_hiddenDecodeXML').val('');        
	        SetReturnType('MyCalendar');
	        return;
	    }
	    else if(Key=='CreateMeeting')
	    {	    
	        $uof.dialog.open2("~/EIP/Calendar/CreateMeetingOrInquiry.aspx", args, "", 950, 700, openDialogResult, { "OwnerGuid": UserGuid, "Date": date });
	    }
	    else if(Key=='CreateMoreMeeting')
	    {	    
	        $uof.dialog.open2("~/EIP/Calendar/CreateMoreMeeting.aspx",args, "",950,700,openDialogResult,{"OwnerGuid": UserGuid, "Date": date });
	    }
	    else if(Key=='CreateWork')
	    {	   
	        $uof.dialog.open2("~/EIP/Calendar/CreateWork.aspx",args, "",600,600,openDialogResult,{"OwnerGuid": UserGuid, "Date": date});
	    }		
	    else if(Key=='CreateMemo')
	    {	   
	        $uof.dialog.open2("~/EIP/Calendar/CreateReminder.aspx",args, "",600,550,openDialogResult,{"OwnerGuid": UserGuid, "Date": date});
	    }	
	    else if(Key=='CreateBorrow')
	    {	   
	        $uof.dialog.open2("~/EIP/Plant/CreateBorrow.aspx",args, "",700,800,openDialogResult,{"OwnerGuid": UserGuid, "Date": date}); 
	    }	
	    else if(Key=='CreateHoliday')
	    {	   
	        $uof.dialog.open2("~/EIP/Calendar/CreateHoliday.aspx",args, "",600,570,openDialogResult,{"OwnerGuid": UserGuid, "Date": date});       
	    }	
	    else if(Key=='CreateDevolve')
	    {	   
	        $uof.dialog.open2("~/EIP/Calendar/CreateDevolve.aspx",args, "",500,600,openDialogResult,{"OwnerGuid": UserGuid, "Date": date});
	    }		
	    else
	    {
            DialogCustomSchedule(Key, UserGuid, date);
	    }
	}

	function RadPanelBar1_ItemClicking(sender,args)
	{
	    var item = args.get_item();
	    var val = item.get_value();
        var UserGuid = $('#ctl00_ctl00_ContentPlaceHolder1_MainContentPlaceHolder_hfOwnerGuid').val();
	    var date = '<%= Ede.Uof.EIP.Organization.Util.UserTime.SetZone(Ede.Uof.EIP.SystemInfo.Current.UserGUID).GetNowForUi().ToString("yyyy/MM/dd HH:mm:dd") %>';

	    args.set_cancel(true);

	    GetCalendarDialogStr(val, date, item);    
	   
	    if(val=='MyCalendar' )
	    {
	        __doPostBack('ctl00_ctl00_ContentPlaceHolder1_MainContentPlaceHolder_ctl01_UC_CalendarMenu1_lbtPostback',''); 
	    }
	}
    function openDialogResultOther(returnValue) {
        if (typeof (returnValue) == 'undefined' || returnValue == null)
            return false;
        else {
            var selectedUserGuid=returnValue.split(',')[0];
            if(selectedUserGuid.length>0)
            {
                SetOtherOwner(selectedUserGuid);
                setTimeout(function() {
                    $('form').submit();
                }, 500);    
            }
            else
            {
                return false;
            }            
        }
    }

    function openDialogResult(returnValue) {
        if (typeof (returnValue) == 'undefined' || returnValue == null)
            return false;
        else {
            setTimeout(function() {
                $('form').submit();
            }, 500);            
        }
    }

    function openDialogResultViewOthers(returnValue) {        
        if (typeof (returnValue) == 'undefined' || returnValue == null)
            return false;
        else {
            SetManyOthers();
            setTimeout(function() {
                $('form').submit();
            }, 500);    
        }
    }

    function SetOtherOwner(userGuid)
    {
        SetReturnType('<%=Ede.Uof.Utility.Page.Common.Enums.CalendarActList.OtherCalender.ToString()%>');
        $('#ctl00_ctl00_ContentPlaceHolder1_MainContentPlaceHolder_hfOwnerGuid').val(userGuid);
    }

    function SetReturnType(newType)
    {
        $('#ctl00_ctl00_ContentPlaceHolder1_MainContentPlaceHolder_Hidden2').val(newType); 
        if( newType == 'SetDay' || newType == 'OtherCalender' 
            || newType == 'MyCalendar' || newType == 'ManyOthersCalendar'  )
        {
            $('#ctl00_ctl00_ContentPlaceHolder1_MainContentPlaceHolder_hideWhosCalendar').val(newType);            
        } 
    }

    function SetManyOthers()
    {
        SetReturnType('<%=Ede.Uof.Utility.Page.Common.Enums.CalendarActList.ManyOthersCalendar.ToString() %>');
        $('#ctl00_ctl00_ContentPlaceHolder1_MainContentPlaceHolder_hfOwnerGuid').val('');
        $('#ctl00_ctl00_ContentPlaceHolder1_MainContentPlaceHolder_hiddenDecodeXML').val($('#ctl00_ctl00_ContentPlaceHolder1_MainContentPlaceHolder_hiddenXML').val());
    }
</script>

<telerik:RadPanelBar ID="RadPanelBar1" runat="server" OnClientItemClicking="RadPanelBar1_ItemClicking" OnClientItemClicked="RadPanelBar1_ItemClicked" OnItemClick="RadPanelBar1_ItemClick">
    <Items>
        <telerik:RadPanelItem runat="server" Expanded="True" Text="新增" meta:resourcekey="RadPanelItem1Resouce1">
            <Items>
                <telerik:RadPanelItem runat="server"  Value="CreateWork" Tag="Work">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Value="CreateMemo" Tag="Memorandum">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Value="CreateMeeting" Tag="Meeting">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Value="CreateMoreMeeting" Tag="Work">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Value="CreateBorrow" Tag="Borrow">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Value="CreateHoliday" Tag="MyHoliday">
                </telerik:RadPanelItem>
                 <telerik:RadPanelItem runat="server" Value="CreateDevolve" Tag="Devolve">
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelItem>
        <telerik:RadPanelItem runat="server" Expanded="True" Text="他人行事曆" meta:resourcekey="RadPanelItem2Resouce1">
            <Items>
                <telerik:RadPanelItem runat="server" Value="ModifyOtherCalendar" ForeColor="HotPink">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Value="ViewOthersCalendar" ForeColor="CornflowerBlue">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Value="MyCalendar" ForeColor="HotPink">
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelItem>
    </Items>
</telerik:RadPanelBar>

&nbsp;&nbsp;
<br />
   <div class="contextMenu" id="contextRoleC" style="display: none; left: 870px; top: 69px;" >
        <table cellspacing="0" cellpadding="0" border="0">
            <tbody>
                <tr>
                    <td align="center" colspan="2" style="background-color: darkolivegreen" valign="top">
                        <nobr><span style="COLOR: #ffffff"><asp:Label id="Label1" runat="server" Text="新增" meta:resourcekey="Label1Resource1"></asp:Label></span></nobr>
                    </td>
                </tr>
                <tr>
                    <td class="menuItem" onclick="SetDialogType('DialogWork')" valign="top" style="background-color:#ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="MenuWrok">&nbsp;
                                </td>
                                <td>&nbsp;<asp:LinkButton ID="lbtnWork" runat="server" Text="工作" meta:resourcekey="HyperLink1Resource1"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                     </td>
                </tr>
                <tr>
                    <td class="menuItem" onclick="SetDialogType('DialogMemo')" valign="top" style="background-color:#ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="MenuMeno">&nbsp;
                                </td>
                                 <td>&nbsp;<asp:LinkButton ID="lbtnMemo" runat="server" Text="備忘" meta:resourcekey="HyperLink7Resource1"></asp:LinkButton></td>
                            </tr>
                        </table>                       
                      </td>
                </tr>                
                <tr>
                     <td class="menuItem" onclick="SetDialogType('DialogMeeting')" valign="top" align="center" style="background-color:#ececec">   
                         <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="MenuMeeting">&nbsp;
                                </td>
                                 <td align="left">
                                 &nbsp;<asp:LinkButton ID="lbtnMeeting" runat="server" Text="會議" meta:resourcekey="HyperLink3Resource1"></asp:LinkButton>
                                 </td>
                            </tr>
                        </table>                       
                     </td>
                </tr>
                <tr>
                     <td class="menuItem" onclick="SetDialogType('DialogMoreMeeting')" valign="top" align="center" style="background-color:#ececec">   
                         <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="MenuMoreMeeting">&nbsp;
                                </td>
                                 <td>&nbsp;<asp:LinkButton ID="lbtnMoreMetting" runat="server" Text="週期會議" meta:resourcekey="lbtnMoreMettingResource1"></asp:LinkButton></td>
                            </tr>
                        </table>
                     </td>
                </tr>
                <tr>
                    <td class="menuItem" onclick="SetDialogType('DialogBorrow')" valign="top" style="background-color:#ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="MenuBorrow">&nbsp;
                                </td>
                                 <td>&nbsp;<asp:LinkButton ID="lbtnBorrow" runat="server" Text="借用" meta:resourcekey="HyperLink2Resource1"></asp:LinkButton></td>
                            </tr>
                        </table>
                      </td>
                </tr>
                <tr>
                    <td class="menuItem" onclick="SetDialogType('DialogHoliday')" valign="top" style="background-color:#ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="MenuHoliday">&nbsp;
                                </td>
                                 <td>&nbsp;<asp:LinkButton ID="lbtnHolliday" runat="server" Text="休假" meta:resourcekey="HyperLink4Resource1"></asp:LinkButton></td>
                            </tr>
                        </table>
                      </td>
                </tr>
                <tr>
                    <td class="menuItem" onclick="SetDialogType('DialogDevolve')" valign="top" style="background-color:#ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="MenuDevolve">&nbsp;
                                </td>
                                 <td>&nbsp;<asp:LinkButton ID="lbtnDevolve" runat="server" Text="交辦" meta:resourcekey="HyperLink5Resource1"></asp:LinkButton></td>
                            </tr>
                        </table>
                    </td>
                </tr>    
                <asp:Literal ID="literCustSche" runat="server"></asp:Literal>
                </tbody>                
                </table>
    </div>
   <script type="text/javascript">
        <asp:Literal ID="literCustScheScript" runat="server"></asp:Literal>
   </script>  
   <script type="text/javascript" id="popCreateScheduleMenu">
        <asp:Literal ID="literPopMenuScript" runat="server"></asp:Literal>
   </script>  
<asp:Label ID="msgCreatework" runat="server" Text="新增工作" Visible="False" meta:resourcekey="msgCreateworkResource1"></asp:Label>
<asp:Label ID="msgCreatememo" runat="server" Text="新增備忘" Visible="False" meta:resourcekey="msgCreatememoResource1"></asp:Label>
<asp:Label ID="msgCreatemeeting" runat="server" Text="新增會議" Visible="False" meta:resourcekey="msgCreatemeetingResource1"></asp:Label>
<asp:Label ID="msgCreateborrow" runat="server" Text="新增借用" Visible="False" meta:resourcekey="msgCreateborrowResource1"></asp:Label>
<asp:Label ID="msgCreateholiday" runat="server" Text="新增休假" Visible="False" meta:resourcekey="msgCreateholidayResource1"></asp:Label>
<asp:Label ID="msgCreatedevolve" runat="server" Text="新增交辦" Visible="False" meta:resourcekey="msgCreatedevolveResource1"></asp:Label>
<asp:Label ID="msgModifyOther" runat="server" Text="維護他人行事曆" Visible="False" meta:resourcekey="msgModifyOtherResource1"></asp:Label>
<asp:Label ID="msgBackmycalendar" runat="server" Text="返回自己的行事曆" Visible="False" meta:resourcekey="msgBackmycalendarResource1"></asp:Label>
<asp:Label ID="msgViewOthers" runat="server" Text="查看他人行事曆" Visible="False" meta:resourcekey="msgViewOthersResource1"></asp:Label>
<asp:Label ID="msgCreateMoremetting" runat="server" Text="新增週期會議" Visible="False" meta:resourcekey="msgCreateMoremettingResource1"></asp:Label>
<asp:HiddenField ID="hideCustTypes" runat="server" />
