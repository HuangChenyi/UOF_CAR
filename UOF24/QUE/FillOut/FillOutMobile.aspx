<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="FillOutMobile.aspx.cs" Inherits="QUE_FillOut_FillOutMobile" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Src="../Common/UC_QusMobile.ascx" TagName="UC_QusMobile" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" id="igClientScript">
        function Button2Click() {
            var userGuid = $('#<%=this.hdUserGuid.ClientID %>').val();
            var aa = $('#ctl00_ContentPlaceHolder1_HiddenField1');
            var hidItem = $('#ctl00_ContentPlaceHolder1_UC_Qus1_hiddenFillPropery');
            var oDetailGuid = '<%= hidDetailGuid.Value %>';
            var data = [aa.val(), oDetailGuid, hidItem.val(), userGuid];

            var oReturn = $uof.pageMethod.sync("checkProperty", data);
            if (oReturn == 'nono') {
                alert('<%=  lblProperty.Text %>');
                return false;
            }
            else {
                if (oReturn == 'SM') {
                    alert('<%= hidQusSM.Value  %>');
                    var ohidFlag = $('#ctl00_ContentPlaceHolder1_hidQusSMFlag');
                    ohidFlag.val('Close');
                    return true;
                }
                if (oReturn == 'WithOutPermission') {
                    alert('<%= lblWithoutPremssion.Text  %>');
                    return false;
                }

                if (oReturn == 'QusHasDelete') {
                    alert('<%= lblQusDetailDelete.Text  %>');
                    var ohidFlag = $('#ctl00_ContentPlaceHolder1_hidQusSMFlag');
                    ohidFlag.val('Close');
                    return true;
                }
            }
        }

        window.history.forward();
        var ajaxManager;
        function SaveClick() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "SaveClick", "Value": "" }));
            return false;
        }
        function SaveCloseClick() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            Button2Click();
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "SaveCloseClick", "Value": "" }));
            
            return false;
        }
        function SubmitClick() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            Button2Click();
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "SubmitClick", "Value": "" }));
            
            return false;
        }
        function SendClick() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "SendClick", "Value": "" }));
            return false;
        }
        function DeleteClick() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            if (confirm('<%= lblCancelMsg.Text%>')) {
                ajaxManager.ajaxRequest(JSON.stringify({ "Key": "DeleteClick", "Value": "" }));
            }
            return false;
        }
        function ReturnClick() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "ReturnClick", "Value": "" }));
            return false;
        }
    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest"></telerik:RadAjaxManager>
    <div>
        <uc1:UC_QusMobile ID="UC_Qus1" runat="server" />
    </div>
    <asp:Label ID="lblDesignName" runat="server" Font-Bold="True" Font-Size="Medium" Visible="False" ForeColor="#D36E2A" meta:resourcekey="lblDesignNameResource1"></asp:Label>
    <asp:Label ID="lblTime" runat="server" Font-Size="Medium" Visible="False" ForeColor="#130D79" meta:resourcekey="lblTimeResource1"></asp:Label>
    <asp:Label ID="QueTime" Visible="False" runat="server" Text="(發起人:{0}  起始時間:{1} 結束時間:{2})" meta:resourcekey="QueTimeResource1"></asp:Label>
    <asp:Label ID="lblSaveClose" runat="server" Text="儲存後返回" Visible="False"  meta:resourcekey="lblSaveCloseResource1"></asp:Label>
    <asp:Label ID="lblSave" runat="server" Text="儲存" Visible="False" meta:resourcekey="lblSaveResource1"></asp:Label>
    <asp:Label ID="lblSubmit" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSubmitResource1"></asp:Label>
    <asp:Label ID="lblItem" runat="server" Text="题目" Visible="False" meta:resourcekey="lblItemResource1"></asp:Label>
    <asp:Label ID="lblRequire" runat="server" Text="必填" Visible="False" meta:resourcekey="lblRequireResource1"></asp:Label>
    <asp:Label ID="lblDesignMasterGuid" runat="server" Visible="False" meta:resourcekey="lblDesignMasterGuidResource1"></asp:Label>
    <asp:Label ID="lblClose" runat="server" Text="問卷已關閉" Visible="False" Font-Size="Large" meta:resourcekey="lblCloseResource1"></asp:Label>
    <asp:Label ID="lblStartTime" runat="server" Text="此問卷調查時間未開始, 問卷調查開始時間:" Visible="False" meta:resourcekey="lblStartTimeResource1"></asp:Label>
    <asp:Label ID="lblEndTime" runat="server" Text="問卷調查結束時間:" Visible="False" meta:resourcekey="lblEndTimeResource1"></asp:Label>
    <asp:Label ID="lblMaxAnsCountOverflow" runat="server" Text="選項勾選數量超出." Visible="False" meta:resourcekey="lblMaxAnsCountOverflowResource1"></asp:Label>
    
    <asp:Label ID="lblUserError" runat="server" Text="目前登入者不是此問卷的調查對象." Visible="False"  meta:resourcekey="lblUserErrorResource1"></asp:Label>
    <asp:HiddenField ID="hidItems" runat="server" />
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="hidDetailGuid" runat="server" />
    <asp:HiddenField ID="hidMasterGuid" runat="server" />
    <asp:HiddenField ID="hidProperty" runat="server" Value="請完整填寫填寫人屬性" meta:resourcekey="hidPropertyResource1" />    
    <asp:HiddenField ID="hidQusSM" runat="server" Value="問卷調查已送出,不允許重復送出." meta:resourcekey="hidQusSMResource1"  />
    <asp:HiddenField ID="hidQusSMFlag" runat="server" />
    <asp:HiddenField ID="hdUserGuid" runat="server" />
<div style="display:none">
    <asp:Label ID="lblProperty" runat="server" Text="請完整填寫填寫人屬性" meta:resourcekey="lblPropertyResource1"></asp:Label>
    <asp:Label ID="lblQusDetailDelete" runat="server" Text="問卷已被刪除"  meta:resourcekey="lblQusDetailDeleteResource1"></asp:Label>
    <asp:Label ID="lblWithoutPremssion" runat="server" Text="您沒有權限填寫該問卷" meta:resourcekey="lblWithoutPremssionResource1"></asp:Label>
    <asp:Label ID="lblModifyTitle" runat="server" Text="修改"  meta:resourcekey="lblModifyTitleResource1"></asp:Label>
    <asp:Label ID="lblDeleteTitle" runat="server" Text="取消"  meta:resourcekey="lblDeleteTitleResource1"></asp:Label>
    <asp:Label ID="lblCancelMsg" runat="server" Text="確定要取消嗎?" meta:resourcekey="lblCancelMsgResource1" Visible="False" ></asp:Label>
    <asp:Label ID="lblSaveSuccess" runat="server" Text="儲存成功" Visible="False" meta:resourcekey="lblSaveSuccessResource1"></asp:Label>
    <asp:Label ID="lblback" runat="server" Text="返回" Visible="False" meta:resourcekey="lblbackResource1"></asp:Label>
    <asp:HiddenField ID="hidErrorMessage" runat="server" />
</div>
    
</asp:Content>
