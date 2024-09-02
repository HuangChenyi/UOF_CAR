<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_FillOut_FillOut" Culture="auto" UICulture="auto" Codebehind="FillOut.aspx.cs" %>

<%@ Register Src="../Common/UC_Qus.ascx" TagName="UC_Qus" TagPrefix="uc1" %>
<%@ Register Src="../Common/UC_QusItem.ascx" TagName="UC_QusItem" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .style1
        {
            color: #FFFFFF;
            font-size: 12px;
        }
        .style3
        {
            color: #FFFFFF;
            font-weight: bold;
        }
        .style5
        {
            color: #FFFFFF;
            font-size: 15px;
            font-weight: bold;
        }
        .style6
        {
            font-size: 12px;
        }
    </style>

    <script type="text/javascript" id="igClientScript">
<!--
// -->
        function Delete_Click() {
            return confirm('<%= lblCancelMsg.Text%>');
        }
        
        function Button2Click() {
            var userGuid = $('#<%=this.hdUserGuid.ClientID %>').val();
            var aa = $('#ctl00_ContentPlaceHolder1_HiddenField1');
            var hidItem = $('#ctl00_ContentPlaceHolder1_UC_Qus1_hiddenFillPropery');
            var oDetailGuid = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hidDetailGuid.Value,true)%>');
            
            var endTime = $('#<%=this.hfEndTime.ClientID %>').val();
            var data = [userGuid, endTime];
            var timeIsUp = $uof.pageMethod.sync("checkEndTime", data);

            if (timeIsUp == "true") {
                data = [aa.val(), oDetailGuid, hidItem.val(), userGuid];
                var oReturn = $uof.pageMethod.sync("checkProperty", data);
                if (oReturn == 'nono') {
                    alert('<%=  lblProperty.Text %>');
                    return false;
                }
                else {
                    if (oReturn == 'SM') {
                        var msg = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hidQusSM.Value,true)%>');
                        alert(msg);
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
            } else {
                if (timeIsUp == "false") {
                    alert('<%= lblTimeIsUp.Text  %>');
                    return false;
                }
            }            
        }
    </script>

    <asp:CustomValidator ID="cvMessage" runat="server" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
    <asp:Label ID="lblDesignName" runat="server" Font-Bold="True" Font-Size="Medium" Visible="false" ForeColor="#D36E2A" meta:resourcekey="lblDesignNameResource1"></asp:Label>
    <asp:Label ID="lblTime" runat="server" Font-Size="Medium" Visible="false" ForeColor="#130D79" meta:resourcekey="lblTimeResource1"></asp:Label>
    <asp:Label ID="QueTime" Visible="false" runat="server" Text="(發起人:{0}  起始時間:{1} 結束時間:{2})" meta:resourcekey="QueTimeResource1"></asp:Label>
    <div>
        <asp:Label ID="lblWriterTime" Text="" runat="server" Visible="false"></asp:Label>
    </div>
    <div style="margin-left:8px;">
        <uc1:UC_Qus ID="UC_Qus1" runat="server" />
    </div>
    <asp:Label ID="lblSave" runat="server" Text="儲存" Visible="False" meta:resourcekey="lblSaveResource1"></asp:Label>
    <asp:Label ID="lblSaveClose" runat="server" Text="儲存後關閉" Visible ="false" meta:resourcekey="lblSaveCloseResource1"></asp:Label>
    <asp:Label ID="lblSubmit" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSubmitResource1"></asp:Label>
    <asp:Label ID="lblItem" runat="server" Text="题目" Visible="False" meta:resourcekey="lblItemResource1"></asp:Label>
    <asp:Label ID="lblRequire" runat="server" Text="必填" Visible="False" meta:resourcekey="lblRequireResource1"></asp:Label>
    <asp:Label ID="lblDesignMasterGuid" runat="server" Visible="False" meta:resourcekey="lblDesignMasterGuidResource1"></asp:Label>

    <asp:Label ID="lblWriter" runat="server" Visible="false" Text="填寫人" meta:resourcekey="lblWriterResource1"></asp:Label>
    <asp:Label ID="lblWriteTime" runat="server" Visible="false" Text="填寫時間" meta:resourcekey="lblWriteTimeResource1"></asp:Label>
    <asp:Label ID="lblHiddenName" runat="server" Visible="false" Text="不記名" meta:resourcekey="lblHiddenNameResource1"></asp:Label>
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
    <asp:HiddenField ID="hidQusSMFlag" runat="server" Value="" />
    <asp:HiddenField ID="hdUserGuid" runat="server" />
    <asp:HiddenField ID="hfEndTime" runat="server" />

<div style="display:none">
    <asp:Label ID="lblProperty" runat="server" Text="請完整填寫填寫人屬性" meta:resourcekey="lblPropertyResource1"></asp:Label>
    <asp:Label ID="lblQusDetailDelete" runat="server" Text="問卷已被刪除"  meta:resourcekey="lblQusDetailDeleteResource1"></asp:Label>
    <asp:Label ID="lblWithoutPremssion" runat="server" Text="您沒有權限填寫該問卷" meta:resourcekey="lblWithoutPremssionResource1"></asp:Label>
    <asp:Label ID="lblModifyTitle" runat="server" Text="修改"  meta:resourcekey="lblModifyTitleResource1"></asp:Label>
    <asp:Label ID="lblDeleteTitle" runat="server" Text="取消"  meta:resourcekey="lblDeleteTitleResource1"></asp:Label>
    <asp:Label ID="lblCancelMsg" runat="server" Text="確定要取消嗎?" meta:resourcekey="lblCancelMsgResource1" Visible="False" ></asp:Label>
    <asp:Label ID="lblTimeIsUp" runat="server" Text="已超過問卷調查結束時間,不可送出." meta:resourcekey="lblTimeIsUpResource1" Visible="False" ></asp:Label>

</div>
</asp:Content>
