<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_ViewFormHistory" Title="站點歷史內容" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ViewFormHistory.aspx.cs" %>

<%@ Register Src="~/WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollectionUsing.ascx" TagPrefix="uc1" TagName="UC_VersionFieldCollectionUsing" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" TagPrefix="uc2" TagName="VersionFieldCollectionUsingUC" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    $(function() {
        //表單計算欄位
        try {
            calculate();
            SetDivZero();
        } catch(e) {

        }
    });
</script>
    <asp:Panel ID="Panel4" runat="server" Width="100%" meta:resourcekey="Panel1Resource2">
    </asp:Panel>
    
    <asp:Label ID="lbl_Msg" runat="server" Text="歷史記錄已遺失!!" Visible="False" 
        meta:resourcekey="lbl_MsgResource1"></asp:Label>
</asp:Content>

