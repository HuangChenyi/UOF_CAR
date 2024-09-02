<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_UC_RemoteFileCenter" Codebehind="UC_RemoteFileCenter.ascx.cs" %>


<table cellpadding=0 cellspacing=0 width=100%>
<tr><td align="center">
    <asp:LinkButton ID="lbtnModifyFile" runat="server" ForeColor="OliveDrab" 
        OnClick="lbtnModifyFile_Click" CausesValidation="False" Text="檔案操作" 
        meta:resourcekey="lbtnModifyFileResource1"></asp:LinkButton>
    </td></tr>
<tr><td align="left">
            <asp:DataList ID="FileList1" runat="server" 
                onitemdatabound="FileList1_ItemDataBound" 
                meta:resourcekey="FileList1Resource1">
                <ItemTemplate>
                    <asp:Image ID="Image" runat="server" meta:resourcekey="ImageResource1" />
                    <asp:HyperLink ID="linkFileName" runat="server" 
                        meta:resourcekey="linkFileNameResource1"></asp:HyperLink>
                    <asp:Label ID="lblCreator" runat="server" 
                        meta:resourcekey="lblCreatorResource1"></asp:Label>
                    <asp:Label ID="lblSiteName" runat="server" 
                        meta:resourcekey="lblSiteNameResource1"></asp:Label>
                </ItemTemplate>
            </asp:DataList>
</td></tr>

</table>
<asp:Label ID="lblLocalhost" runat="server" Text="本地端" Visible="False" 
    meta:resourcekey="lblLocalhostResource1"></asp:Label>
<asp:Label ID="lblCopyMsg" runat="server" Text="檔案複製中" Visible="False" 
    meta:resourcekey="lblCopyMsgResource1"></asp:Label>
<asp:Label ID="lblFileNotFound" runat="server" Text="原始檔案已被刪除" Visible="False" 
    meta:resourcekey="lblFileNotFoundResource1"></asp:Label>

<asp:HiddenField ID="hfFileGroupID" runat="server" />
<asp:HiddenField ID="bool_IsUploadFile" runat="server" Value="false" />
