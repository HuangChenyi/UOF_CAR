<%@ Control Language="C#" AutoEventWireup="true" Inherits="PMS_Common_UC_ProjectContent" Codebehind="UC_ProjectContent.ascx.cs" %>
<%@ Register Src="UC_ProjectWorkItem.ascx" TagName="UC_ProjectWorkItem" TagPrefix="uc1" %>


<asp:CustomValidator ID="cvWarnning" runat="server" Display="Dynamic" ForeColor="Blue" meta:resourcekey="cvWarnningResource1" ></asp:CustomValidator>
<asp:Panel ID="panProj" runat="server" meta:resourcekey="panProjResource1">
<table id="table1" class="PopTable" cellspacing="1" cellpadding="0" border="0" width="100%" style=" text-align:left;">
    <tr>
        <td style="width:20%; white-space:nowrap">
            <asp:Label ID="Label1" runat="server" Text="專案名稱" meta:resourcekey="Label1Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblProjName" runat="server" meta:resourcekey="lblProjNameResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space:nowrap">
            <asp:Label ID="Label2" runat="server" Text="專案負責人" meta:resourcekey="Label2Resource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="lblPM" runat="server" meta:resourcekey="lblPMResource1"></asp:Label>
        </td>
    </tr>
</table>
    
<uc1:UC_ProjectWorkItem id="ucProjectWorkItem" runat="server"></uc1:UC_ProjectWorkItem>
</asp:Panel>
<asp:HiddenField ID="hidReadOnly" runat="server" value="False"/>
<asp:HiddenField ID="hidProjGUID" runat="server" />
<asp:HiddenField ID="hidPmRmId" runat="server" />
<asp:HiddenField ID="hidAuditorGUID" runat="server" />
<asp:HiddenField ID="hidProjStatus" runat="server" />
<asp:Label ID="lblNoProjMsg" runat="server" Text="您沒有選擇專案" Visible="False" meta:resourcekey="lblNoProjMsgResource1"></asp:Label>
<asp:Label ID="lblNoAuthorityMsg" runat="server" Text="您沒有權限維護此專案" Visible="False" meta:resourcekey="lblNoAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblDeletedProjMsg" runat="server" Text="找不到此專案，可能已被刪除" Visible="False" meta:resourcekey="lblDeletedProjMsgResource1"></asp:Label>
<asp:CustomValidator ID="CustomValidator1" runat="server" Display="None" ErrorMessage="您沒有瀏覽此專案的權限"  ValidationGroup="Maintain" meta:resourcekey="CustomValidator1Resource1" ></asp:CustomValidator>