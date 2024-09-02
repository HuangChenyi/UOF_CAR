<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocPermission" Title="文件權限設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocPermission.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="labDescript" runat="server" ForeColor="Blue" Text="如有設定下列文件可讀取者，則此文件的讀取權將不受目錄權限的影響。" meta:resourcekey="labDescriptResource"></asp:Label><br />
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="修改權限發生錯誤" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator><br />
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:CheckBox ID="chkUseDocPermiss" runat="server" AutoPostBack="True" OnCheckedChanged="chkUseDocPermiss_CheckedChanged"
            Text="自訂文件讀者" meta:resourcekey="chkUseDocPermissResource1"/>
            <div style="overflow: auto; width: 100%; height:260px">
            <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="false"  />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:CustomValidator ID="cvNoChoiceUser" runat="server" ErrorMessage="請選擇人員" Visible="False"></asp:CustomValidator><br />
</asp:Content>

