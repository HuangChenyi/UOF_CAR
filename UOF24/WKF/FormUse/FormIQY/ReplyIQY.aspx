<%@ Page Title="回覆徵詢" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_FormIQY_ReplyIQY" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ReplyIQY.aspx.cs" %>
<%@ Register src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc1" %>
<%@ Register src="UC_QueryIqySingle.ascx" tagname="UC_QueryIqySingle" tagprefix="uc2" %>
<%@ Register src="UC_QueryIqyUp.ascx" tagname="UC_QueryIqyUp" tagprefix="uc4" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script type="text/javascript">
 
    function CopyToClipBoard()
    {				
        clipboardData.setData("Text",event.srcElement.innerText);
    }

    //$(
    function IQYOtherClick() {
        try {
            if ($uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["IS_SCRIPT_IQY"],true)%>') == "1") {
                $('#defaultIQYUser').hide();
            }
            var o = $('#<%=chkIQYOtherPeople.ClientID%>');
            if (o.prop('checked')) {
                $('#replyInfo').show();
            } else {
                $('#replyInfo').hide();
            }
        } catch (e) {
        }
    }
    //);
</script>

<table width="100%" class="PopTable" border="0" cellpadding="0" cellspacing="1" style="vertical-align: top">
    <tr>
        <td colspan="2" class="PopTableHeader" align="center">
        <center>
        <asp:Label ID="Label4" runat="server" Text="回覆徵詢" meta:resourcekey="Label4Resource1"></asp:Label>
        </center>
        </td>
    </tr>
    <tr>
        <td width="15%" nowrap="nowrap" class="PopTableLeftTD"><asp:Label ID="Label2" runat="server" Text="徵詢者" meta:resourcekey="Label2Resource1"></asp:Label></td>
        <td  width="85%" nowrap="nowrap" class="PopTableRightTD"><asp:Label ID="lblSendIqyPersonForTask" runat="server" meta:resourcekey="lblSendIqyPersonForTaskResource1"></asp:Label><asp:Label ID="lblSendIqyPersonForScript" runat="server" meta:resourcekey="lblSendIqyPersonForScriptResource1"></asp:Label></td>
    </tr>
    <tr>
        <td width="15%" nowrap="nowrap" class="PopTableLeftTD"><asp:Label ID="Label11" runat="server" Text="徵詢原因與內容" meta:resourcekey="Label11Resource1"></asp:Label></td>
        <td  width="85%" nowrap="nowrap" class="PopTableRightTD"><asp:Label ID="Label14" 
                runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td width="15%" nowrap="nowrap" class="PopTableLeftTD"><asp:Label ID="Label3" runat="server" Text="回覆意見" meta:resourcekey="Label3Resource1"></asp:Label></td>
        <td width="85%" nowrap="nowrap" class="PopTableRightTD">
            <asp:RadioButton ID="rbApprove" runat="server" GroupName="opinipn" Text="贊同" meta:resourcekey="rbApproveResource1" />
            <asp:RadioButton ID="rbOppose" runat="server" GroupName="opinipn" Text="反對" meta:resourcekey="rbOpposeResource1" />
            <asp:RadioButton ID="rbOther" runat="server" GroupName="opinipn" Text="其他" meta:resourcekey="rbOtherResource1" />
            <asp:CustomValidator ID="cvMessage" runat="server" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
            <br />
            <asp:TextBox ID="txtContent" runat="server"  Rows="5" TextMode="MultiLine" Width="100%" meta:resourcekey="txtContentResource1"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td width="15%" nowrap="nowrap" class="PopTableLeftTD"><asp:Label ID="Label5" runat="server" Text="附件" meta:resourcekey="Label5Resource1"></asp:Label></td>
        <td width="85%" nowrap="nowrap" class="PopTableRightTD">
            <table>
                <tr>
                    <td>
                        <asp:Panel ID="plUploadFile" runat="server" Height="100px" ScrollBars="Auto" meta:resourcekey="plUploadFileResource1">
                            <uc1:UC_FileCenter runat="server" ID="UC_FileCenter1" ModuleName="WKF" ProxyEnabled="true" />
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblLimitDiscription" runat="server" CssClass="SizeMemo" Visible="False" meta:resourcekey="lblLimitDiscriptionResource1"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2" class="PopTableRightTD" style="text-align:left"><asp:CheckBox ID="chkIQYOtherPeople" 
                runat="server" Text="轉他人繼續徵詢" onclick="IQYOtherClick()" EnableViewState="False" 
                Font-Bold="True" ForeColor="#3333FF" 
                meta:resourcekey="chkIQYOtherPeopleResource1" /></td>
    </tr>
    <tbody id="replyInfo" style="display:none">
            <tr>
                <td width="15%" nowrap="nowrap" class="PopTableLeftTD"><asp:Label ID="Label7" runat="server" Text="徵詢他人原因與內容" meta:resourcekey="Label7Resource1"></asp:Label></td>
                <td width="85%" nowrap="nowrap" class="PopTableRightTD"><asp:TextBox ID="TextBox1" runat="server"  Rows="5" TextMode="MultiLine" Width="100%" meta:resourcekey="txtContentResource1"></asp:TextBox></td>
            </tr>
            <tr>
                <td width="15%" nowrap="nowrap" class="PopTableLeftTD"><asp:Label ID="Label8" runat="server" Text="部門主管" meta:resourcekey="Label8Resource1"></asp:Label></td>
                <td width="85%" nowrap="nowrap" class="PopTableRightTD">
                    <asp:Panel ID="Panel4" runat="server" Height="65px" ScrollBars="Auto" meta:resourcekey="Panel4Resource1">
                        <asp:CheckBoxList ID="cblSuperiorForScript" runat="server" meta:resourcekey="cblSuperiorForScriptResource1"></asp:CheckBoxList>
                    </asp:Panel>
                </td>
            </tr>
            <tr id="defaultIQYUser">
                <td width="15%" nowrap="nowrap" class="PopTableLeftTD"><asp:Label ID="Label9" runat="server" Text="申請者建議可徵詢人員" meta:resourcekey="Label9Resource1"></asp:Label></td>
                <td width="85%" nowrap="nowrap" class="PopTableRightTD">
                    <asp:Panel ID="Panel2" runat="server" Height="100px" ScrollBars="Auto" meta:resourcekey="Panel2Resource1">
                        <asp:CheckBoxList ID="cblDefaultIqyUser" runat="server" meta:resourcekey="cblDefaultIqyUserResource1"></asp:CheckBoxList>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td width="15%" nowrap="nowrap" class="PopTableLeftTD"><asp:Label ID="Label10" runat="server" Text="新增徵詢人員" meta:resourcekey="Label10Resource1"></asp:Label></td>
                <td width="85%" nowrap="nowrap" class="PopTableRightTD">
                    <asp:Panel ID="Panel3" runat="server" Height="100px" ScrollBars="Auto" meta:resourcekey="Panel3Resource1">
                        <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" TreeHeight="60px" 
                            ShowMember="False" />
                    </asp:Panel>
                </td>
            </tr>
    </tbody>
</table>

<table width="100%">
    <tr>
        <td colspan="2" bgcolor="white">
        <br />
            <asp:Label ID="Label12" runat="server" Text="來自上層徵詢者的徵詢原因："  meta:resourcekey="Label12Resource1"></asp:Label>
            <asp:Label ID="Label15" runat="server" Text="(使用滑鼠左鍵在意見文字上點兩下即可複製內容。)"  CssClass="SizeMemo" meta:resourcekey="Label15Resource1" Visible="false"></asp:Label>
            <uc4:UC_QueryIqyUp ID="UC_QueryIqyUp1" runat="server" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="被我徵詢的目前回覆情形："  meta:resourcekey="Label1Resource1"></asp:Label>
            <uc2:UC_QueryIqySingle ID="UC_QueryIqySingle1" runat="server" />
            <br />            
        </td>
    </tr>
    
</table>

<asp:Label ID="lblSave" runat="server" meta:resourcekey="lblSaveResource1" Visible="False" Text="暫存"></asp:Label>
<asp:Label ID="lblSend" runat="server" meta:resourcekey="lblSendResource1" Visible="False" Text="送出"></asp:Label>
<asp:Label ID="lblNullOpinipn" runat="server" Text="未選取回覆意見" Visible="False" meta:resourcekey="lblNullOpinipnResource1"></asp:Label>
<asp:Label ID="lblNoSelect" runat="server" Text="請選擇要徵詢人員" Visible="False" meta:resourcekey="lblNoSelectResource1"></asp:Label>
<asp:Label ID="lblAlreadySend" runat="server" Text="在此站點已被徵詢過了" Visible="False" meta:resourcekey="lblAlreadySendResource1"></asp:Label>
<asp:Label ID="lblSendSelf" runat="server" Text="不允許徵詢自己" Visible="False" meta:resourcekey="lblSendSelfResource1"></asp:Label>
<asp:Label ID="lblLimitDiscriptionText" runat="server" Text="※單一檔案大小不可超出 {0}" CssClass="SizeMemo" Visible="False" meta:resourcekey="lblLimitDiscriptionTextResource1"></asp:Label>
</asp:Content>

