<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Calendar_Common_UC_ScheduleTypeList" Codebehind="UC_ScheduleTypeList.ascx.cs" %>
<style>
      /*Main menu*/
    .mainMenu {
        text-transform: uppercase;
    } 
    .mainMenu .rmRootGroup .rmRootLink {
        padding: 4px 20px;
        line-height: 20px;
        height: 15px;
    } 
    .mainMenu .rmRootGroup .rmRootLink .rmToggle {
        height: 15px;
    }  
</style>
<script  type="text/javascript">

    function OnCbAllChecked() {
        var menu = $find("<%=radMenuType.ClientID%>");
        var menuItem = menu.findItemByValue("radMenuTypeList");   
   
        var checAll = $telerik.findElement(menuItem.get_element(), "cbAll");
        var isChecked = checAll.checked

        var typeList = $telerik.findElement(menuItem.get_element(), "cblTypeList");
        var typeListCount = typeList.getElementsByTagName("input");

        for (var i = 0; i < typeListCount.length; i++) {
            typeListCount[i].checked = isChecked;
        } 
    }

    function OnCbTypelistChecked() {
        var menu = $find("<%=radMenuType.ClientID%>");
        var menuItem = menu.findItemByValue("radMenuTypeList");
        var checAll = $telerik.findElement(menuItem.get_element(), "cbAll");
        var typeList = $telerik.findElement(menuItem.get_element(), "cblTypeList");
        var typeListCount = typeList.getElementsByTagName("input");
        var checkCount = 0
        for (var i = 0; i < typeListCount.length; i++) {
            if (typeListCount[i].checked == false) {
                checAll.checked = false;
                break;
            }
            checkCount++;
        } 
        if (checkCount == typeListCount.length) {
            checAll.checked = true;
        }
    }
</script>

<telerik:RadMenu  ShowToggleHandle="true" ID="radMenuType"  runat="server" CssClass="mainMenu" >
    <Items>     
        <telerik:RadMenuItem runat="server"  Text="類別"  meta:resourcekey="RadMenuItemResource1">          
            <Items>
                <telerik:RadMenuItem runat="server" Value="radMenuTypeList" Width="250px">
                    <ItemTemplate>
                        <table border="1" style="table-layout: fixed; width:100%;">
                            <tr>
                                <td style="padding-bottom:5px;border-bottom:1px solid gray">   
                                    <asp:CheckBox ID="cbAll" Text="全部顯示" runat="server"   onclick="OnCbAllChecked()"  meta:resourcekey="ListItemResource1"></asp:CheckBox>
                                </td>
                            </tr>                                          
                            <tr>
                                <td style="padding-bottom:5px;border-bottom:1px solid gray;vertical-align:middle">  
                                    <asp:CheckBoxList  runat="server" ID="cblTypeList" onclick="OnCbTypelistChecked()"  Border=1 RepeatDirection="Vertical">                                   
                                        <asp:ListItem Text="工作" runat="server"   Value="Work" meta:resourcekey="ListItemResource2"></asp:ListItem>                               
                                        <asp:ListItem Text="會議" runat="server" Value="Meeting" meta:resourcekey="ListItemResource3"></asp:ListItem>   
                                        <asp:ListItem Text="會議(未回覆)" runat="server" Value="InvMeeting"  meta:resourcekey="InvMeetingResource1"></asp:ListItem>                                                                     
                                        <asp:ListItem Text="備忘" runat="server" Value="Memorandum"  meta:resourcekey="ListItemResource4"></asp:ListItem>                               
                                        <asp:ListItem Text="交辦事項" runat="server" Value="Devolve"  meta:resourcekey="ListItemResource5"></asp:ListItem>                               
                                        <asp:ListItem Text="借用" runat="server" Value="Borrow"  meta:resourcekey="ListItemResource6"></asp:ListItem>                               
                                        <asp:ListItem Text="個人休假" runat="server" Value="MyHoliday" meta:resourcekey="ListItemResource7"></asp:ListItem>                               
                                        <asp:ListItem Text="部門休假" runat="server" Value="CorporationHoliday"  meta:resourcekey="ListItemResource8"></asp:ListItem>                                
                                        <asp:ListItem Text="部門事件" runat="server"  Value="Event"  meta:resourcekey="ListItemResource9"></asp:ListItem>                                   
                                    </asp:CheckBoxList>   
                                </td>
                            </tr>
                            <tr style="text-align:center;">
                                <td style="padding-top:5px;padding-bottom:5px">
                                    <telerik:RadButton ID="rdBtnConfirm" runat="server" Width="30%"  Text="確定" OnClick="rdBtnConfirm_Click" meta:resourcekey="rdBtnConfirmResource1"/>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </telerik:RadMenuItem>
            </Items>   
        </telerik:RadMenuItem>
    </Items>     
</telerik:RadMenu>

