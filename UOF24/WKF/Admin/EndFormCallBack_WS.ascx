<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Admin_EndFormCallBack_WS" Codebehind="EndFormCallBack_WS.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>


<script type="text/javascript" id="telerikClientEvents1">

	function RadToolBar1_ButtonClicking(sender,args)
	{
	    if (args.get_item().get_value() == "insert") {
	        args.set_cancel(true);
	        $uof.dialog.open2("~/WKF/Admin/EndFormCallBackInsert_WS.aspx", args.get_item(), "", 600, 300, openDialogResult);
	    }
	    else if (args.get_item().get_value() == "delete") {
	        if (confirm('<%=lblDelete.Text %>') == false)
	            args.set_cancel(true);
	    }
	}

    function openDialogResult(returnValue) {
        if (typeof (returnValue) == "undefined") {
            return false;
        }
        return true;
    }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <contenttemplate>
        <table width="100%">
            <tr>
                <td valign="middle" style="vertical-align:middle;" >

                    <telerik:RadToolBar ID="RadToolBar1" Runat="server" Width="100%" meta:resourcekey="barEditResource1" OnButtonClick="RadToolBar1_ButtonClick" OnClientButtonClicking="RadToolBar1_ButtonClicking">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Text="新增網址" ImageUrl="~/System/icon_images/icon_m02.gif" HoveredImageUrl="~/System/icon_images/icon_m02.gif" DisabledImageUrl="~/System/icon_images/icon_m02.gif" CheckedImageUrl="~/System/icon_images/icon_m02.gif" Value="insert" meta:resourcekey="TBarButtonResource1"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Image = "~/App_Themes/DefaultTheme/images/toolbarSp.jpg"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="刪除網址" ImageUrl="~/System/icon_images/icon_m03.gif" HoveredImageUrl="~/System/icon_images/icon_m03.gif" DisabledImageUrl="~/System/icon_images/icon_m03.gif" CheckedImageUrl="~/System/icon_images/icon_m03.gif" Value="delete" meta:resourcekey="TBarButtonResource2"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Image = "~/App_Themes/DefaultTheme/images/toolbarSp.jpg"></telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>                    
                </td>
            </tr>
            <tr>
                <td>

                    <Fast:Grid ID="dgWebServiceList" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                        AutoGenerateColumns="False"  DataKeyOnClientWithCheckBox="False"
                         EnhancePager="True" 
                         DataKeyNames="WS_ID" 
                        OnRowCommand="dgWebServiceList_RowCommand" 
                        OnRowDataBound="dgWebServiceList_RowDataBound" AllowPaging="True" 
                        OnPageIndexChanging="dgWebServiceList_PageIndexChanging" 
                        PageSize="15" Width="100%" 
                        DefaultSortDirection="Ascending">
                        <EnhancePagerSettings
                            ShowHeaderPager="True" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="名稱" meta:resourcekey="TemplateFieldResource1"  >
                                <itemtemplate>
                                    <SPAN style="word-break: break-all">   
                                        <asp:LinkButton runat="server" CommandName="lbtnName" CommandArgument='<%#: Bind("WS_ID") %>' Text='<%#: Bind("WS_NAME") %>' ID="lbtnName" meta:resourceKey="lbtnNameResource1" __designer:wfdid="w19"></asp:LinkButton>
                                    </SPAN>
 
                                </itemtemplate>
                                <headerstyle wrap="True" width="25%" />
                                <itemstyle wrap="True" width="25%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="網址" meta:resourcekey="BoundFieldResource1">
                                <edititemtemplate>
                                    <asp:TextBox runat="server" Text='<%#: Bind("WS_URL") %>' id="TextBox1"></asp:TextBox>
                                </edititemtemplate>
                                <itemtemplate>
                                    <SPAN style="word-break: break-all">   
                                        <asp:Label runat="server" Text='<%#: Bind("WS_URL") %>' id="Label1"></asp:Label>
                                    </SPAN>
                                </itemtemplate>
                                <headerstyle width="50%" wrap="True" />
                                <itemstyle width="50%" wrap="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="呼叫方法" meta:resourcekey="BoundFieldResource2" >
                                <edititemtemplate>
                                    <asp:TextBox runat="server" Text='<%#: Bind("WS_METHOD") %>' id="TextBox2"></asp:TextBox>
                                </edititemtemplate>
                                <itemtemplate>
                                    <SPAN style="word-break: break-all">   
                                        <asp:Label runat="server" Text='<%#: Bind("WS_METHOD") %>' id="Label2"></asp:Label>
                                    </SPAN>
                                </itemtemplate>
                                <headerstyle width="25%" wrap="True" />
                                <itemstyle width="25%" wrap="True" />
                            </asp:TemplateField>
                        </Columns> 
                    </Fast:Grid>
                    <asp:Label ID="lblErroeMsg" runat="server" ForeColor="Red" meta:resourcekey="lblErroeMsgResource1"></asp:Label></td>
            </tr>
        </table>
        <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>        
    </contenttemplate>
    <triggers>
        <asp:AsyncPostBackTrigger ControlID="dgWebServiceList" EventName="RowCommand" />
        <asp:AsyncPostBackTrigger ControlID="RadToolBar1" EventName="ButtonClick" />
        <asp:AsyncPostBackTrigger ControlID="dgWebServiceList" EventName="PageIndexChanging" />
    </triggers>
</asp:UpdatePanel>
<asp:Label ID="lblForm" runat="server" Text="己被表單" Visible="False" meta:resourcekey="lblFormResource1"></asp:Label>
<asp:Label ID="lbluser" runat="server" Text="使用" Visible="False" meta:resourcekey="lbluserResource1"></asp:Label>
<asp:Label ID="lblNoDel" runat="server" Text="故無法刪除" Visible="False" meta:resourcekey="lblNoDelResource1"></asp:Label>
&nbsp;
