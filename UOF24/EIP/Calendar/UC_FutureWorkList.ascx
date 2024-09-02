<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Calendar_UC_FutureWorkList" Codebehind="UC_FutureWorkList.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc1" %>

<script id="FutureWorkjs" type="text/javascript">

    function bar5_Click(sender, args) {
        var key = args.get_item().get_value();
        if (key == "CreateWork") {
            var UserGuid = $uof.tool.htmlDecode('<%= System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Page.User.Identity.Name, true)%>');
            var date = '<%= Ede.Uof.EIP.Organization.Util.UserTime.SetZone(Ede.Uof.EIP.SystemInfo.Current.UserGUID).GetNowForUi().ToString("yyyy/MM/dd HH:mm:dd") %>';
            args.set_cancel(true);
            $uof.dialog.open2("~/EIP/Calendar/CreateWork.aspx", args.get_item(), "", 600, 600, openDialogResult, { "OwnerGuid": UserGuid, "Date": date });
        }
    }

    function openDialogResult(returnValue) {
        if (typeof (returnValue) == 'undefined' || returnValue == null)
            return false;
        else {
            return true;
        }
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <contenttemplate>
<table width="100%" cellpadding="0" cellspacing="0">
    <tr>
        <td style="height:30px; vertical-align :top">
            <telerik:RadToolBar ID="RadToolBar1" runat="server" 
                onbuttonclick="RadToolBar1_ButtonClick" 
                OnClientButtonClicking="bar5_Click" Width="100%" 
                meta:resourcekey="RadToolBar1Resource1">
                
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="新增工作" DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
                                    HoveredImageUrl="~/Common/Images/Icon/icon_m71.png" ImageUrl="~/Common/Images/Icon/icon_m71.png"
                                    CheckedImageUrl="~/Common/Images/Icon/icon_m71.png" 
                        Value="CreateWork" meta:resourcekey="RadToolBarButtonResource1" Owner="">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="Button 1" IsSeparator="True" 
                        meta:resourcekey="RadToolBarButtonResource2" Owner="">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="Button 2" Value="SelectDays" 
                        meta:resourcekey="RadToolBarButtonResource3" Owner="">
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="menuList" runat="server" AutoPostBack="True" 
                                            OnSelectedIndexChanged="ddlSelectDays_SelectedIndexChanged" Width="60px" 
                                            meta:resourcekey="menuListResource1">
                                            <asp:ListItem Value="7" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                            <asp:ListItem Value="30" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                            <asp:ListItem Value="60" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                            <asp:ListItem Value="90" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="天"  meta:resourcekey="Label1Resource1"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="Button 1" IsSeparator="True" 
                        meta:resourcekey="RadToolBarButtonResource4" Owner="">
                    </telerik:RadToolBarButton>
                </Items>
                
            </telerik:RadToolBar>
         </td>
    </tr>   
</table>

<Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
    AutoGenerateColumns="False"  
    ShowHeader="False"  Width="100%" BorderStyle="None" 
            BorderWidth="0px" OnRowDataBound="Grid1_RowDataBound" AllowPaging="True" 
            SkinID="HomepageBlockStyle"  OnPageIndexChanging="Grid1_PageIndexChanging" 
            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
            EnhancePager="True" PageSize="15" Visible="False" 
             EmptyDataText="沒有資料" 
            KeepSelectedRows="False" meta:resourcekey="Grid1Resource2"  
            >
      <EnhancePagerSettings ShowHeaderPager="True" />
      <ExportExcelSettings AllowExportToExcel="False" /><Columns>
        <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
            <itemtemplate>
            <table width="100%" border="0">
                <tr>
                <td width="16px" style="min-width:16px">
                <img height="16px" src="<%=ResolveUrl("~/common/images/icon/icon02.png")%>" width="16px" /> 
               </td>
                <td width="70%">
                <asp:LinkButton runat="server" ID="LinkButton1" Text='<%#: Eval("SUBJECT") %>' meta:resourcekey="LinkButton1Resource1" OnClick="LinkButton1_Click"></asp:LinkButton>

                </td>
                <td width="10%">
                <asp:Label runat="server" Text='<%# Bind("START_TIME", "{0:g}") %>' ID="lblStarttime"></asp:Label>

                </td>
                <td width="20%" align="left">
                <asp:Label runat="server" ID="lblStatus" meta:resourcekey="lblStatusResource1"></asp:Label>

                </td>
                </tr>
            </table> 
            
</itemtemplate>
        </asp:TemplateField>
    </Columns>
</Fast:Grid>

 <Fast:Grid ID="GridAll" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
    AutoGenerateColumns="False"  
    ShowHeader="False"  Width="100%" BorderStyle="None" 
            BorderWidth="0px" AllowPaging="True" 
            SkinID="HomepageBlockStyle" OnPageIndexChanging="GridAll_PageIndexChanging"
            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
            EnhancePager="True" PageSize="15" OnRowDataBound="GridAll_RowDataBound" 
             EmptyDataText="沒有資料" 
            KeepSelectedRows="False" meta:resourcekey="GridAllResource1" 
             >
      <EnhancePagerSettings ShowHeaderPager="True" />
      <ExportExcelSettings AllowExportToExcel="False" /><Columns>
        <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
            <itemtemplate>
            <table width="100%" border="0">
                <tr>
                <td width="16px" style="min-width:16px">
                <img height="16px" src="<%=ResolveUrl("~/common/images/icon/icon02.png")%>" width="16px" /> 
                </td>
                <td width="48%">
                <asp:LinkButton runat="server" ID="LinkButton1" Text='<%#: Eval("SUBJECT") %>' meta:resourcekey="LinkButton1Resource1" OnClick="LinkButton1_Click"></asp:LinkButton>

                </td>                
                <td width="10%">
                <asp:Label runat="server"  ID="lblType" ></asp:Label>
                </td>    
                <td width="21%">
                <asp:Label runat="server" Text='<%# Bind("START_TIME", "{0:g}") %>' ID="lblStarttime" ></asp:Label>
                </td>              
                 <td width="21%">
                <asp:Label runat="server" Text='<%# Bind("END_TIME", "{0:g}") %>' ID="lblEndtime" 
                         meta:resourcekey="lblEndtimeResource1"></asp:Label>
                </td>
                 <td width="10%">
                     
                 </td>
                </tr>
            </table> 
            
</itemtemplate>
        </asp:TemplateField>
    </Columns>
</Fast:Grid> 

<asp:Label ID="lbStartDate" runat="server"  style="display:none" 
            meta:resourcekey="lbStartDateResource1"></asp:Label>
<asp:Label ID="lbEndDate" runat="server"   style="display:none" 
            meta:resourcekey="lbEndDateResource1"></asp:Label>               
                                   
    </contenttemplate>
    <triggers>
        <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
    </triggers>
</asp:UpdatePanel>

<asp:Label ID="msgProcessing" runat="server" Text="進行中" Visible="False" meta:resourcekey="msgProcessingResource1"></asp:Label>
<asp:Label ID="msgComplete" runat="server" Text="已完成" Visible="False" meta:resourcekey="msgCompleteResource1"></asp:Label>
<asp:Label ID="msgNotbegin" runat="server" Text="尚未開始" Visible="False" meta:resourcekey="msgNotbeginResource1"></asp:Label>

<asp:Label ID="lblCHoliday" runat="server" Text="公司假日" Visible="False" meta:resourcekey="lblCHolidayResource1"></asp:Label>
<asp:Label ID="lblPHoliday" runat="server" Text="個人假日" Visible="False" meta:resourcekey="lblPHolidayResource1"></asp:Label>
<asp:Label ID="lblEvent" runat="server" Text="事件" Visible="False" meta:resourcekey="lblEventResource1"></asp:Label>
<asp:Label ID="lblWork" runat="server" Text="工作" Visible="False" meta:resourcekey="lblWorkResource1"></asp:Label>
<asp:Label ID="lblMemo" runat="server" Text="備忘" Visible="False" meta:resourcekey="lblMemoResource1"></asp:Label>
<asp:Label ID="lblMeeting" runat="server" Text="會議" Visible="False" meta:resourcekey="lblMeetingResource1"></asp:Label>
<asp:Label ID="lblDevolve" runat="server" Text="交辦" Visible="False" meta:resourcekey="lblDevolveResource1"></asp:Label>
<asp:Label ID="lblBorrow" runat="server" Text="借用" Visible="False" meta:resourcekey="lblBorrowResource1"></asp:Label>

<asp:HiddenField runat="server" ID="hideIsInferior" Value="false"></asp:HiddenField>
<asp:HiddenField runat="server" ID="hideDatePeriod"></asp:HiddenField>
<asp:HiddenField runat="server" ID="hideAllowCreats"></asp:HiddenField>
<asp:HiddenField runat="server" ID="hideCustTypes"></asp:HiddenField>
<asp:HiddenField runat="server" ID="hideFirstDay"></asp:HiddenField>
<asp:HiddenField runat="server" ID="hideTotalDays"></asp:HiddenField>
