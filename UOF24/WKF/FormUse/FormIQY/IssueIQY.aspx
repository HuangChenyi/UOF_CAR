<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_FormIQY_IssueIQY" Title="發出徵詢" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="IssueIQY.aspx.cs" %>
<%@ Register src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc1" %>
<%@ Register src="UC_QueryIqySingle.ascx" tagname="UC_QueryIqySingle" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script language="javascript">
			
	function CopyToClipBoard()
	{				
	    clipboardData.setData("Text",event.srcElement.innerText);
	}
</script>

            <table cellpadding="0" cellspacing="1" style=" border:0; width:100%;" class="PopTable">
                <tr style="vertical-align:top;">
                    <td class="PopTableHeader" style="text-align:center;">
                    <center><asp:Label ID="Label2" runat="server" 
                            Text="選擇人員" meta:resourcekey="Label2Resource1"></asp:Label></center></td>
                </tr>
                <tr style=" vertical-align:top; background-color:white;">
                    <td style="text-align:left;" >
                        <asp:Panel ID="plTask" runat="server" meta:resourcekey="plTaskResource1">
                            <table cellpadding="0" cellspacing="1" border="0" width="100%" class="PopTable">
                            <colgroup class="PopTableLeftTD" width="20%"></colgroup>
                            <colgroup class="PopTableRightTD" width="80%"></colgroup> 
                            <tr>
                                <td nowrap="nowrap">
                                    <asp:Label ID="lblTaskIQYComment" runat="server" Text="徵詢原因" meta:resourcekey="lblTaskIQYCommentResource1"></asp:Label></td>
                            <td style="padding-right: 7px"><asp:TextBox ID="tbxTaskComment" runat="server" Rows="5" TextMode="MultiLine" Width="100%"></asp:TextBox></td>
                            </tr>
                            <tr>
                            <td nowrap="nowrap"><asp:Label ID="Label6" runat="server" Text="單位主管" 
                                    meta:resourcekey="Label6Resource1"></asp:Label></td>
                            <td style=" text-align:left;padding-right:8px;"><asp:Panel ID="Panel1" runat="server" Height="65px" ScrollBars="Vertical"
                                    meta:resourcekey="Panel1Resource1">                                  
                                    <asp:CheckBoxList ID="cblSuperior" runat="server" meta:resourcekey="cblSuperiorResource1" Width="100%"></asp:CheckBoxList></asp:Panel></td>
                            </tr>
                            <tr>
                            <td nowrap="nowrap"><asp:Label ID="Label7" runat="server" Text="建議徵詢人員" 
                                    meta:resourcekey="Label7Resource1"></asp:Label></td>
                            <td><asp:Panel ID="Panel2" runat="server" Height="100px" ScrollBars="Auto" 
                                    meta:resourcekey="Panel2Resource1"><asp:CheckBoxList ID="cblDefaultIqyUser" 
                                    runat="server" meta:resourcekey="cblDefaultIqyUserResource1"></asp:CheckBoxList></asp:Panel></td>
                            </tr>
                            <tr>
                            <td nowrap="nowrap"><asp:Label ID="Label8" runat="server" Text="新增人員" 
                                    meta:resourcekey="Label8Resource1"></asp:Label></td>
                            <td><asp:Panel ID="Panel3" runat="server"  
                                    meta:resourcekey="Panel3Resource1"><uc1:UC_ChoiceList ID="UC_ChoiceList1" 
                                    runat="server" TreeHeight="60px" ShowMember="False" TreeWidth="100%"/></asp:Panel></td>
                            </tr>
                            </table>      
                        </asp:Panel>
                        <asp:Panel ID="plScript" runat="server" meta:resourcekey="plScriptResource1">
                            <table cellpadding="0" cellspacing="1" border="0" width="100%" class="PopTable">
                            <colgroup class="PopTableLeftTD" width="20%"></colgroup>
                            <colgroup class="PopTableRightTD" width="80%"></colgroup> 
                            <tr>
                                <td nowrap="nowrap">
                                    <asp:Label ID="lblScriptIQYComment" runat="server" Text="徵詢原因" meta:resourcekey="lblScriptIQYCommentResource1"></asp:Label></td>
                            <td style="padding-right: 8px"><asp:TextBox ID="tbxScriptComment" runat="server" Rows="5" TextMode="MultiLine" Width="100%"></asp:TextBox></td>
                            </tr>
                            <tr>
                            <td nowrap="nowrap"><asp:Label ID="Label3" runat="server" Text="單位主管" 
                                    meta:resourcekey="Label3Resource1"></asp:Label></td>
                            <td style=" text-align:left;padding-right:9px;"><asp:Panel ID="Panel4" runat="server" Height="65px" ScrollBars="Auto" 
                                    meta:resourcekey="Panel4Resource1">
                                <asp:CheckBoxList ID="cblSuperiorForScript" runat="server" 
                                    meta:resourcekey="cblSuperiorForScriptResource1"></asp:CheckBoxList></asp:Panel></td>
                            </tr>
                            <tr>
                            <td nowrap="nowrap" " >
                           
                            <asp:Label ID="Label9" runat="server" Text="新增人員" 
                                    meta:resourcekey="Label9Resource1"></asp:Label>
                                    
                                    </td>
                            <td class="PopTableRightTD" style="text-align:left"> <div style="text-align:left;">
                            
                            <asp:Panel ID="Panel5" runat="server" Height="100px"
                                    meta:resourcekey="Panel5Resource1" HorizontalAlign="Left" >
                                    <uc1:UC_ChoiceList ID="UC_ChoiceList2" 
                                    runat="server" TreeHeight="60px" ShowMember="False" TreeWidth="100%" /></asp:Panel></div></td>
                            </tr>
                            </table>      
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        
        <table width="100%">
        <tr>
            <td bgcolor="white">
            <br />
                <asp:Label ID="Label4" runat="server" Text="目前回覆情形：" 
                    meta:resourcekey="Label4Resource1"></asp:Label>
                <br />
                <uc2:UC_QueryIqySingle ID="UC_QueryIqySingle1" runat="server" />
                <br />
            </td>
        </tr>
    </table>
<asp:Label ID="lblSendIQY" runat="server" Text="送出徵詢" Visible="False" 
        meta:resourcekey="lblSendIQYResource1"></asp:Label>
<asp:Label ID="lblOpinipnEnd" runat="server" Text="表單已結案" Visible="False" 
        ForeColor="Red" meta:resourcekey="lblOpinipnEndResource1"></asp:Label>
<asp:Label ID="lblAlreadySend" runat="server" Text="在此站點已被徵詢過了" Visible="False" 
        meta:resourcekey="lblAlreadySendResource1"></asp:Label>
<asp:Label ID="lblSendSelf" runat="server" Text="不允許徵詢自己" Visible="False" 
        meta:resourcekey="lblSendSelfResource1"></asp:Label>
<asp:Label ID="lblNoSelect" runat="server" Text="請選擇要徵詢人員" Visible="False" 
        meta:resourcekey="lblNoSelectResource1"></asp:Label>
</asp:Content>

