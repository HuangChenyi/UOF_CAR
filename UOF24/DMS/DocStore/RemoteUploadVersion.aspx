<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_RemoteUploadVersion" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="RemoteUploadVersion.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table width="100%" class="PopTable">
        <tr>
            <td class="PopTableLeftTD" style=" width:30%">
                <asp:Label ID="Label1" runat="server" Text="目前實際版本：" 
                    meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblActualVer" runat="server" 
                    meta:resourcekey="lblActualVerResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style=" width:30%">
                <asp:Label ID="Label2" runat="server" Text="發佈後實際版本：" 
                    meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD"> 
                <asp:TextBox ID="txtHandVer" runat="server" ForeColor="Red" 
                    meta:resourcekey="txtHandVerResource1"></asp:TextBox>
            </td>
        </tr>
        <%--11.3尚未有該功能，先mark %>
        <%--<tr>
            <td class="PopTableLeftTD" style=" width:30%">
                <asp:Label ID="Label3" runat="server" Text="目前系統版本：" 
                    meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">--%>
                <asp:Label ID="lblSysActualVer" runat="server" 
                    meta:resourcekey="lblSysActualVerResource1" Visible="false"></asp:Label>
            <%--</td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style=" width:30%">
                <asp:Label ID="Label4" runat="server" Text="發佈後系統版本：" 
                    meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">--%>
                <asp:Label ID="lblSysNewVer" runat="server" ForeColor="Red" 
                    meta:resourcekey="lblSysNewVerResource1" Visible="false"></asp:Label>
            <%--</td>
        </tr>--%>
    </table>
    <asp:Label ID="lblEnterVer" runat="server" 
        
        Text="*此為手動版本，請輸入發佈後實際版本。" 
        ForeColor="Blue" meta:resourcekey="lblEnterVerResource1"></asp:Label>

<asp:Label ID="lblFileNotExist" runat="server" Text="檔案不存在" Visible="False" 
        meta:resourcekey="lblFileNotExistResource1"></asp:Label>
<asp:Label ID="lblAddTask" runat="server" Text="已加入動態排程，於5分鐘後發佈。" Visible="False" 
        meta:resourcekey="lblAddTaskResource1"></asp:Label>
<asp:Label ID="lblmanualVersionExist" runat="server" Text="手動版本已存在" Visible="False" 
        meta:resourcekey="lblmanualVersionExistResource1"></asp:Label>
</asp:Content>

