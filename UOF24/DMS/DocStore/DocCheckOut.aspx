<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocCheckOut" Title="文件取出" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DocCheckOut.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/jscript">

        //2012-5-24 ELTON, add for download file by [FileCenterV2 FileControlHandler]
        function DownloadFileWithHandler(sHandlerUrl, sUserProxyIndex) {
            $uof.download(sHandlerUrl, sUserProxyIndex);
        }

        function OpenCheckOutPublish(docId) {
          
            $uof.dialog.open2("~/DMS/DocStore/DocOutPublish.aspx", "", "", 1024, 900, function (returnValue) { $uof.dialog.set_returnValue("ok"); $uof.dialog.close(); return false; }, { "docid": docId, "ischeckout": "true" });
    
            return false;
        }

    </script>

      <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="該文件不是存回或發佈狀態,無法取出" meta:resourcekey="CustomValidator1Resource1" Visible="false"></asp:CustomValidator>
      <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="文件取出失敗" meta:resourcekey="CustomValidator2Resource1" Visible="false"></asp:CustomValidator>
      <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="手動版本已存在" meta:resourcekey="CustomValidator3Resource1" Visible="false"></asp:CustomValidator>

    <table class="PopTable" cellpadding="0" cellspacing="0" style="width: 100%;">
        <tr>
            <td >
                <asp:Label ID="Label1" runat="server" Text="文件" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td >
                <span style="word-break: break-all; width: 205px;">
                    <asp:Label ID="lblDocname" runat="server"></asp:Label>
                </span>
            </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label2" runat="server" Text="目前實際版本" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td >
                <asp:Label ID="lblActualVer" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style=" white-space:nowrap;">
                <asp:Label ID="Label3" runat="server" Text="取出後實際版本變更為" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtHandVer" runat="server" MaxLength="15" ForeColor="Red"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="請輸入手動版本" meta:resourcekey="RequiredFieldValidator1Resource1" Visible="false"></asp:CustomValidator>
                <br />
                <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ErrorMessage="輸入的內容不能包括以下符號「,」、「'」、「|」、「@」、「 \」、「＂」、「、」、「{}」" meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator>                                  
            </td>
        </tr>
        <tr style="display:none;">
            <td >
                <asp:Label ID="Label4" runat="server" Text="目前系統版本" meta:resourcekey="Label4Resource1"></asp:Label></td>
            <td >
                <asp:Label ID="lblSysActualVer" runat="server"></asp:Label></td>
        </tr>
        <tr style="display:none;">
            <td >
                <asp:Label ID="Label5" runat="server" Text="取出後系統版本變更為" meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td >
                <asp:Label ID="lblSysNewVer" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>

        <tr>
            <td colspan="2" class="PopTableRightTD" style=" text-align:left;">
                <asp:CheckBox ID="chkTempInact" runat="server" Text="前一公佈版本文件，暫時下架" ForeColor="Red" meta:resourcekey="chkTempInactResource1" />
            </td>
        </tr>
    </table>
    
    <asp:Label ID="lblCheckout" runat="server" Text="取出" Visible="False" meta:resourcekey="lblCheckoutResource1"></asp:Label>
    <asp:HiddenField ID="hideStatus" runat="server" />
    <asp:HiddenField ID="hdAppPath" runat="server" />
    <asp:HiddenField ID="hidFileID" runat="server" />
    <asp:Literal ID="scriptZone" runat="server"></asp:Literal>    
    <asp:HiddenField ID="hidDocMode" runat="server" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
