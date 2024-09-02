<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Forum_SubjectDetail" Title="主題文章" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SubjectDetail.aspx.cs" %>
<%@ Register Src="UC_SubjectDetail.ascx" TagName="UC_SubjectDetail" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script id="ForumSubjectDetail_pageLoaded" type="text/javascript">
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_pageLoaded(pageLoaded);
    
    function pageLoaded(sender, args) {
       var BoardChanged = $("#<% =UC_SubjectDetail1.BoardChangedClientID %>").val();  
       var SubjectChanged = $("#<% =UC_SubjectDetail1.SubjectChangedClientID %>").val();
       if(BoardChanged == "1" || SubjectChanged=="1")
       {
            ClearSiteMapNode();
            AddForumBoardSiteMapNode();
            $("#<% =UC_SubjectDetail1.BoardChangedClientID %>").val("0");
            $("#<% =UC_SubjectDetail1.SubjectChangedClientID %>").val("0");       
       }    
    }
</script>
    <asp:CustomValidator ID="cvReadAuthority" runat="server" ErrorMessage="您沒有觀看此文章的權限" Visible="False" meta:resourcekey="cvReadAuthorityResource1"></asp:CustomValidator>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="conditional">
        <ContentTemplate>
            <uc1:UC_SubjectDetail ID="UC_SubjectDetail1" runat="server" />
    </ContentTemplate> 
    </asp:UpdatePanel>
    <br />
    <asp:Label ID="msgDelconfirm" runat="server" Text="確定要刪除?" Visible="False" meta:resourcekey="msgDelconfirmResource1"></asp:Label>
    <asp:Label ID="msgLockconfirm" runat="server" Text="確定要鎖定?" Visible="False" meta:resourcekey="msgLockconfirmResource1"></asp:Label>
    <asp:Label ID="msgContentdeleted" runat="server" Text="內容已被作者或版主刪除" Visible="False"
        meta:resourcekey="msgContentdeletedResource1"></asp:Label>
<script type="text/javascript">
    var GridObj = $('#' + GetGridKey());
    var rowObj = GridObj.get(0).rows;
    var count;
    var hyperlinks;

    for (k = 3; k < rowObj.length; k++) {
        count = k - 1;
        if (k < 11) {
            hyperlinks = $("#ctl00_ContentPlaceHolder1_UC_SubjectDetail1_Grid1_ctl0" + count + "_div1 a");
        }
        else {
            hyperlinks = $("#ctl00_ContentPlaceHolder1_UC_SubjectDetail1_Grid1_ctl" + count + "_div1 a");
        }

        for (i = 0; i < hyperlinks.length; i++) {
            hyperlinks[i].setAttribute('target', '_blank');
        }
    }

    function setBlank() {
        var GridObj = $('#' + GetGridKey());
        var rowObj = GridObj.get(0).rows;
        var count;
        var hyperlinks;

        for (k = 3; k < rowObj.length; k++) {
            count = k - 1;
            if (k < 11) {
                hyperlinks = $("#ctl00_ContentPlaceHolder1_UC_SubjectDetail1_Grid1_ctl0" + count + "_div1 a");
            }
            else {
                hyperlinks = $("#ctl00_ContentPlaceHolder1_UC_SubjectDetail1_Grid1_ctl" + count + "_div1 a");
            }

            for (i = 0; i < hyperlinks.length; i++) {
                hyperlinks[i].setAttribute('target', '_blank');
            }
        }
    }
</script>
    <asp:HiddenField ID="hidPageDown" runat="server" />
      <asp:HiddenField ID="hidShowPageIndex" runat="server" />
</asp:Content>
