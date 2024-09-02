<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_Common_UC_VariableList" Codebehind="UC_VariableList.ascx.cs" %>
<script  type="text/javascript">


    function CopyText(ClientID) {
        //Add code to handle your event here.

        clipboardData.setData("Text",  $('#'+ClientID).text());

    }


</script>

<table width = "300px" class = "PopTable" cellspacing ="0" align="center" cellpadding="0" >
    <colgroup class = "PopTableLeftTD" ></colgroup>
    <colgroup class = "PopTableRightTD"></colgroup>
    <tr>
        <td class = "PopTableHeader" colspan = 2  style="text-align:center!important" >
            <asp:Label ID="Label1" runat="server" Text="可用變數列表" 
                meta:resourcekey="Label1Resource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class = "PopTableHeader" style="text-align:center!important" >
            <asp:Label ID="Label2" runat="server" Text="變數名稱" 
                meta:resourcekey="Label2Resource1"></asp:Label>
        </td>
        <td class = "PopTableHeader" style="text-align:center!important">
            <asp:Label ID="Label3" runat="server" Text="變數說明" 
                meta:resourcekey="Label3Resource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td >
            <asp:TextBox ID="txtFormName" runat="server" Text="{#formName}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td style="text-align:left">
            <asp:TextBox ID="TextBox1" runat="server" Text="表單名稱" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>

    <tr>
        <td >
            <asp:TextBox ID="txtFormVersion" runat="server" Text="{#formVersion}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td style="text-align:left">
            <asp:TextBox ID="TextBox2" runat="server" Text="表單版本" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td >
            <asp:TextBox ID="txtFormNo" runat="server" Text="{#formNo}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td style="text-align:left">
            <asp:TextBox ID="TextBox3" runat="server" Text="表單單號" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td >
            <asp:TextBox ID="txtFormTitle" runat="server" Text="{#formTitle}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td style="text-align:left">
            <asp:TextBox ID="TextBox12" runat="server" Text="表單標題" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td >
            <asp:TextBox ID="txtApplicant" runat="server" Text="{#applicant}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td style="text-align:left">
            <asp:TextBox ID="TextBox4" runat="server" Text="申請者" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td >
            <asp:TextBox ID="txtApplyTime" runat="server" Text="{#applyTime}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td style="text-align:left">
            <asp:TextBox ID="TextBox5" runat="server" Text="申請時間" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td >
            <asp:TextBox ID="txtFormStatus" runat="server" Text="{#formStatus}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td style="text-align:left">
            <asp:TextBox ID="TextBox6" runat="server" Text="表單狀態" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td >
            <asp:TextBox ID="txtFormResult" runat="server" Text="{#formResult}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td style="text-align:left">
            <asp:TextBox ID="TextBox7" runat="server" Text="申請結果" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>       
    <tr id="lastSignerTr" runat="server">
        <td >
            <asp:TextBox ID="txtLastSigner" runat="server" Text="{#lastSigner}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td style="text-align:left">
            <asp:TextBox ID="TextBox8" runat="server" Text="上一站簽核者" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>      
    <tr id="discussionTr" runat="server">
        <td>
            <asp:TextBox ID="txtFormDiscussion" runat="server" Text="{#formForumReply}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="TextBox9" runat="server" Text="表單討論回覆內容" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:TextBox ID="txtFormSignHistory" runat="server" Text="{#formSignHistory}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="TextBox11" runat="server" Text="簽核明細" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:TextBox ID="txtPriority" runat="server" Text="{#priority}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="TextBox10" runat="server" Text="緊急程度" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>     
    <tr id="retrieverTr" runat="server" visible="false">
        <td>
            <asp:TextBox ID="txtRetriever" runat="server" Text="{#retriever}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="TextBox13" runat="server" Text="取回者" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>
    <tr id="inquiryerTr" runat="server" visible="false">
        <td>
            <asp:TextBox ID="txtInquiryer" runat="server" Text="{#inquiryer}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="TextBox15" runat="server" Text="徵詢者" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>
        <tr id="unlockerTr" runat="server" visible="false">
        <td>
            <asp:TextBox ID="txtUnlocker" runat="server" Text="{#unlocker}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="TextBox14" runat="server" Text="解除者" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>
        <tr id="agentTr" runat="server" visible="false">
        <td>
            <asp:TextBox ID="txtAgent" runat="server" Text="{#agent}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="TextBox17" runat="server" Text="代填者" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>
    <tr id="cancelTr" runat="server" visible="false">
        <td>
            <asp:TextBox ID="txtCancel" runat="server" Text="{#cancelReason}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="TextBox16" runat="server" Text="作廢原因" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>
    <tr id="returnReasonTr" runat="server" visible="false">
        <td>
            <asp:TextBox ID="txtReturnReason" runat="server" Text="{#returnReason}" ReadOnly="true" Style="text-align: right; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
        <td>
            <asp:TextBox ID="TextBox19" runat="server" Text="退簽原因" ReadOnly="true" Style="text-align: left; border-width: 0px; background-color: initial"></asp:TextBox>
        </td>
    </tr>
</table>
<asp:Label ID="Label4" runat="server" Text="*點擊變數名稱可複製變數名稱"  CssClass="SizeMemo" Visible="False"
    meta:resourcekey="Label4Resource1" ></asp:Label>

<asp:Label ID="lblFormName" runat="server" Visible="false" meta:resourcekey="lblFormNameResource1"></asp:Label>
<asp:Label ID="lblFormVersion" runat="server" Visible="false" meta:resourcekey="lblFormVersionResource1"></asp:Label>
<asp:Label ID="lblFormNo" runat="server" Visible="false" meta:resourcekey="lblFormNoResource1"></asp:Label>
<asp:Label ID="lblFormTitle" runat="server" Visible="false" meta:resourcekey="lblFormTitleResource1"></asp:Label>
<asp:Label ID="lblApplicant" runat="server" Visible="false" meta:resourcekey="lblApplicantResource1"></asp:Label>
<asp:Label ID="lblApplyTime" runat="server" Visible="false" meta:resourcekey="lblApplyTimeResource1"></asp:Label>
<asp:Label ID="lblFormStatus" runat="server" Visible="false" meta:resourcekey="lblFormStatusResource1"></asp:Label>
<asp:Label ID="lblFormResult" runat="server" Visible="false" meta:resourcekey="lblFormResultResource1"></asp:Label>
<asp:Label ID="lblLastSigner" runat="server" Visible="false" meta:resourcekey="lblLastSignerResource1"></asp:Label>
<asp:Label ID="lblFormDiscussion" runat="server" Visible="false" meta:resourcekey="lblFormDiscussionResource1"></asp:Label>
<asp:Label ID="lblFormSignHistory" runat="server" Visible="false" meta:resourcekey="lblFormSignHistoryResource1"></asp:Label>
<asp:Label ID="lblPriority" runat="server" Visible="false" meta:resourcekey="lblPriorityResource1"></asp:Label>
<asp:Label ID="lblRetriever" runat="server" Visible="false" meta:resourcekey="lblRetrieverResource1"></asp:Label>
<asp:Label ID="lblInquiryer" runat="server" Visible="false" meta:resourcekey="lblInquiryerResource1"></asp:Label>
<asp:Label ID="lblUnlocker" runat="server" Visible="false" meta:resourcekey="lblUnlockerResource1"></asp:Label>
<asp:Label ID="lblAgent" runat="server" Visible="false" meta:resourcekey="lblAgentResource1"></asp:Label>
<asp:Label ID="lblCancel" runat="server" Visible="false" meta:resourcekey="lblCancelResource1"></asp:Label>
<asp:Label ID="lblReturnReason" runat="server" Visible="false" meta:resourcekey="lblReturnReasonResource1"></asp:Label>