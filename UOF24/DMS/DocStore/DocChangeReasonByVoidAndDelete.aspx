<%@ Page Title="文件變更原因" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocChangeReasonByVoidAndDelete" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="DocChangeReasonByVoidAndDelete.aspx.cs" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
            <script type="text/javascript">

                function VoidAndDeleteDoc() {

                    var scriptId = $("#<%= hfScriptId.ClientID%>").val();
                    var formId = $("#<%= hfFormId.ClientID%>").val();
                    var formVersionId = $("#<%= hfFormVersionId.ClientID%>").val();

                    $uof.dialog.open2("~/WKF/ExternalModule/ExternalFormScript.aspx", "", "", 0, 0,
                        signDialogResult, { "scriptId": scriptId, "formId": formId, "formVersionId": formVersionId });
                }

                function signDialogResult(returnValue) {

                    if ((typeof (returnValue) == 'undefined' || returnValue == null || returnValue == "NeedPostBack"))
                        return false;
                    else {
                        //電子簽核頁成功回來後，觸發後端事件設定Dialog的Return值與Close掉(Dialog.Close(this.Page)後，DocInform才能觸發CallBack事件)
                        $('#<%= btnOK.ClientID%>').click();
                        return true;
                    }
                };

            </script>
    </telerik:RadScriptBlock>

    <asp:Panel ID="PanelVoid" Visible="False" runat="server" meta:resourcekey="PanelVoidResource1">
        <table width="100%" class="PopTable" cellspacing="1">
            <tr>
                <td style="height: 35px;text-align:right;vertical-align:middle;width:90px;" class="PopTableLeftTD" nowrap="nowrap">
                    <asp:Label ID="lblVoidReason" runat="server" Text="作廢原因" meta:resourcekey="lblVoidReasonResource1" ></asp:Label>
                </td>
                <td style="height: 35px;" class="PopTableRightTD" nowrap="nowrap">
                    <asp:TextBox ID="txtVoidReason" runat="server" Height="100px" TextMode="MultiLine" Width="100%" meta:resourcekey="txtVoidReasonResource1"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="rfvVoidReason1" runat="server" ControlToValidate="txtVoidReason" Display="Dynamic" 
                        ErrorMessage="請填寫作廢原因" SetFocusOnError="True" Visible="False" meta:resourcekey="rfvVoidReason1Resource1"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Panel ID="PanelDelete" Visible="False" runat="server" meta:resourcekey="PanelDeleteResource1">
        <table width="100%" class="PopTable" cellspacing="1">
            <tr>
                <td style="height: 35px; text-align:right; vertical-align:middle; width:90px;" class="PopTableLeftTD" nowrap="nowrap">
                    <asp:Label ID="lblDeleteReason" runat="server" Text="銷毀原因" meta:resourcekey="lblDeleteReasonResource1" ></asp:Label>
                </td>
                <td style="height: 35px;" class="PopTableRightTD" nowrap="nowrap">
                    <asp:TextBox ID="txtDeleteReason" runat="server" Height="100px" TextMode="MultiLine" Width="100%" meta:resourcekey="txtVoidReasonResource1"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="rfvDeleteReason1" runat="server" ControlToValidate="txtDeleteReason" Display="Dynamic" 
                        ErrorMessage="請填寫銷毀原因" SetFocusOnError="True" Visible="False" meta:resourcekey="rfvDeleteReason1Resource1"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Label ID="lblVoidTip" runat="server" Text="點按確定後會作廢此文件" Visible="False" ForeColor="Blue" meta:resourcekey="lblVoidTipResource1" ></asp:Label>                
    <asp:Label ID="lblDeleteTip" runat="server" Text="點按確定後會銷毀此文件" Visible="False" ForeColor="Blue" meta:resourcekey="lblDeleteTipResource1" ></asp:Label>                
    
    <asp:CheckBoxList ID="cblPublishNotice" runat="server" Visible="False" RepeatDirection="Horizontal" Width="400px" Enabled="False" meta:resourcekey="cblPublishNoticeResource1">
        <asp:ListItem Value="publishUnit" Text="發行單位" meta:resourcekey="publishUnitResource1"></asp:ListItem>
        <asp:ListItem Value="custodyUser" Text="保管者" meta:resourcekey="custodyUserResource1"></asp:ListItem>
        <asp:ListItem Value="authDep" Text="權責部門" meta:resourcekey="authDepResource1"></asp:ListItem>
        <asp:ListItem Value="suitableDep" Text="適用部門" meta:resourcekey="suitableDepResource1"></asp:ListItem>
    </asp:CheckBoxList>

    <asp:Label ID="lblSecretm" runat="server" Text="密" Visible="False" meta:resourcekey="lblSecretmResource1"></asp:Label>
    <asp:Label ID="lblXSecret" runat="server" Text="機密" Visible="False" meta:resourcekey="lblXSecretResource1"></asp:Label>
    <asp:Label ID="lblXXSecret" runat="server" Text="極機密" Visible="False" meta:resourcekey="lblXXSecretResource1"></asp:Label>
    <asp:Label ID="lblTopSecret" runat="server" Text="絕對機密" Visible="False" meta:resourcekey="lblTopSecretResource1"></asp:Label>

    <asp:Label ID="lblUrgencyNormal" runat="server" Text="普通" Visible="False" meta:resourcekey="lblUrgencyNormalResource1"></asp:Label>
    <asp:Label ID="lblUrgencyHigh" runat="server" Text="急" Visible="False" meta:resourcekey="lblUrgencyHighResource1"></asp:Label>
    <asp:Label ID="lblUrgencyExHigh" runat="server" Text="緊急" Visible="False" meta:resourcekey="lblUrgencyExHighResource1"></asp:Label>

    <asp:Label ID="lblVoidError" runat="server" Text="文件作廢時發生錯誤" Visible="False" meta:resourcekey="lblVoidErrorResource1"></asp:Label>
    <asp:Label ID="lblDeleteError" runat="server" Text="文件銷毀時發生錯誤" Visible="False" meta:resourcekey="lblDeleteErrorResource1"></asp:Label>

    <asp:Label ID="lblNormal" runat="server" Text="一般" Visible="False" meta:resourcekey="labNormalResource1"></asp:Label>
    <asp:Label ID="lblDocLink" runat="server" Text="文件連結" Style="display: none;" meta:resourcekey="lblDocLinkResource1"></asp:Label>
    <asp:Label ID="lblHistory" runat="server" Text="觀看版本歷程" Style="display: none;" meta:resourcekey="lblHistoryResource1"></asp:Label>
    <asp:Label ID="lblRef" runat="server" Text="觀看參考文件" Style="display: none;" meta:resourcekey="lblRefResource1"></asp:Label>
    <asp:Label ID="lblInfo" runat="server" Text="文件資訊" Style="display: none;" meta:resourcekey="lblInfoResource1"></asp:Label>
    <asp:Label ID="lblNoPrivilege" Visible="False" runat="server" Text="無文件觀看權限" meta:resourcekey="lblNoPrivilegeResource1"></asp:Label>
    <asp:Label ID="lblDraft" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftResource1"></asp:Label>     
    <asp:Label ID="lblNoAuthorityError" runat="server" Visible="False" Text="僅有管理者權限的文件才可維護，因此以下文件無法維護：" meta:resourcekey="lblNoAuthorityErrorResource1" ></asp:Label>
    <asp:Label ID="lblStatusErrorTip" runat="server" Text='僅有狀態為"已公佈"、"未生效"及"已失效"的文件才可作廢，因此以下文件無法作廢：' Visible="False" meta:resourcekey="lblStatusErrorTipResource1" ></asp:Label>

    <asp:HiddenField ID="hfDocChangeType" runat="server" />
    <asp:HiddenField ID="hfUserGuid" runat="server" />
    <asp:HiddenField ID="hfIsBatch" runat="server"/>
    <asp:HiddenField ID="hfVoidError" runat="server" />
    <asp:HiddenField id="hfActualVer" runat="server"/>
    <asp:HiddenField id="hfSecretRank" runat="server"/>
    <asp:HiddenField ID="hfPublishNoticeFieldValue" runat="server" />
    <asp:HiddenField ID="hfScriptId" runat="server" />
    <asp:HiddenField ID="hfFormId" runat="server" />
    <asp:HiddenField ID="hfFormVersionId" runat="server" />
    <asp:HiddenField ID="hfOpenExternalFormUrl" runat="server" />
    <asp:HiddenField ID="hfCopyDocAttachId" runat="server" />

    <asp:Button ID="btnOK" runat="server" Text="btnOK" Style="display: none;" OnClick="btnOK_Click" />

</asp:Content>
    