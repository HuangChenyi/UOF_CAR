<%@ Page Title="新增/維護聊天室" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="EditUChatRoom.aspx.cs" Inherits="Ede.Uof.Web.EIP.Chat.EditUChatRoom" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="~/Common/ImageEditor/UC_ImageEditor.ascx" TagPrefix="uc1" TagName="UC_ImageEditor" %>




<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="PopTable">
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label6Resource1"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="名稱" meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtRoomName" MaxLength="255" Width="100%" runat="server" meta:resourcekey="txtRoomNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNeedRoomName" runat="server" ControlToValidate="txtRoomName" ErrorMessage="請輸入聊天室名稱" Display="Dynamic" meta:resourcekey="rfvNeedRoomNameResource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="描述" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtRoomDesc" Rows="5" MaxLength="255" Width="100%" TextMode="MultiLine" runat="server" meta:resourcekey="txtRoomDescResource1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="啟用" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbEnable" runat="server" meta:resourcekey="cbEnableResource1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="成員" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" ExpandToUser="false"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="圖片" meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td>                
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" ModuleName="UCHAT" AllowedMultipleFileSelection="false"  AllowedFileType="Image" ScannerDisabled="true"/>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblRemark" runat="server" ForeColor="Blue" Text="備註：上傳檔案只限圖檔(格式限gif、jpg、bmp、png)" meta:resourcekey="lblRemarkResource1"></asp:Label>

    <asp:HiddenField ID="hfRoomID" runat="server" />
</asp:Content>
