<%@ Page Title="相簿維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Album_Admin_MaintainAlbum" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MaintainAlbum.aspx.cs" %>

<%@ Register src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable" cellpadding=0 cellspacing=1>
                <tr>
                    <td style="width:20%">
                        <asp:Label ID="Label1" runat="server" Text="相簿分類" 
                            meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblAlbumClass" runat="server" 
                            meta:resourcekey="lblAlbumClassResource1"></asp:Label>
                    </td>                    
                </tr>
                <tr>
                    <td style=" white-space:nowrap;">
                        <asp:Label ID="Label6" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text="相簿主題" 
                            meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtAlbumTopic" runat="server" MaxLength="20" Width="300px" 
                            meta:resourcekey="txtAlbumTopicResource1"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                            ControlToValidate="txtAlbumTopic" Display="Dynamic" 
                            ErrorMessage="相簿主題不可空白" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                    </td>                    
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="相簿描述" 
                            meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td class="PopTableRightTD">
                        <asp:TextBox ID="txtAlbumDesc" runat="server" Height="100px" 
                            TextMode="MultiLine" Width="100%" 
                            meta:resourcekey="txtAlbumDescResource1"></asp:TextBox>
                    </td>                    
                </tr>       
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="可觀看人員" 
                            meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                    <td>

                        <uc2:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="False" />
                        

                    </td>                    
                </tr>                                               
            </table>
            <asp:Label ID="Label5"  runat="server" class="SizeMemo" Text="註：相簿主題限制為20字" ForeColor="Blue" meta:resourcekey="Label5Resource1"></asp:Label>
            <input id="hidUserSet" type="hidden" runat=server >
                <asp:HiddenField ID="hfRmID" runat="server" />
            </input>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

