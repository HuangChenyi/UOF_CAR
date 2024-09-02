<%@ Page Title="文件置換" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="DocChange.aspx.cs" Inherits="Ede.Uof.Web.DMS.DocStore.DocChange" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function PageValid(docMode) {
            if (docMode === "FILE") {
                var fs = $find("<%=UC_FileCenter.ClientID%>");

                if (fs != null && fs.get_count() == 0) {
                    alert($("#<%= lblUploadMsg.ClientID%>").text());

                    return false;
                }

                // 檔案類型的置換，主檔只能選一個檔案 (因為有兩個FileCenter物件存在同一個page，所以才沒用屬性控制這個邏輯，改用javascript驗證)
                if (fs != null && fs.get_count() > 1) {
                    alert($("#<%= lblOneFile.ClientID%>").text());
                    return false;
                }
            }
            else if (docMode === "CONT") {
                var editor = $find("<%=UC_HtmlEditor.ClientID%>");
                if (editor.get_content() === '') {
                    alert($("#<%= lblContentMsg.ClientID%>").text());

                    return false;
                }
            }

            var reason = $('#<%= txtReason.ClientID%>').val();
            if (reason === '') {
                alert($("#<%= lblErrorMsg.ClientID%>").text());

                return false;
            }

            // 最後提醒: 如果原有附件，但按下確定要置換時，沒有任何附件，讓user做最後確認
            if (docMode === "FILE" && $("#<%= hfInitHasAttach.ClientID%>").val() === "true" && $find("<%= UC_FileAttachment.ClientID %>").get_count() == 0) {
                return confirm($("#<%= lblNoAttach.ClientID%>").text());
            }
        }
    </script>
    <table class="PopTable">
        <tr>
            <td  class="PopTableLeftTD">
                <asp:Label ID="lblDocNameTitle" runat="server" Text="名稱" meta:resourcekey="lblDocNameTitleResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblDocName" runat="server" meta:resourcekey="lblDocNameResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="lblDocVerTitle" runat="server" Text="版本" meta:resourcekey="lblDocVerTitleResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblDocVer" runat="server" meta:resourcekey="lblDocVerResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="lblFolderPathTitle" runat="server" Text="目錄" meta:resourcekey="lblFolderPathTitleResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblFolderPath" runat="server" meta:resourcekey="lblFolderPathResource1"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trFileUpload" visible ="false">
            <td class="PopTableLeftTD">
                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label3Resource1"></asp:Label>
                <asp:Label ID="lblFileUploadTitle" runat="server" Text="文件內容" meta:resourcekey="lblFileUploadTitleResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" ModuleName="DMS" ProxyEnabled="true"/>
            </td>
        </tr>
        <tr runat="server" id="trAttachUpload" visible ="false">
            <td class="PopTableLeftTD">
                <asp:Label ID="lblAttachTitle" runat="server" Text="附件" meta:resourcekey="lblAttachTitleResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <uc1:UC_FileCenter runat="server" ID="UC_FileAttachment" ModuleName="DMS" ProxyEnabled="true"/>
            </td>
        </tr>
        <tr runat="server" id="trContentEditor" visible="false">
            <td class="PopTableLeftTD">
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label1Resource1"></asp:Label>
                <asp:Label ID="lblContentEditorTitle" runat="server" Text="編輯本文" meta:resourcekey="lblContentEditorTitleResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <uc1:UC_HtmlEditor runat="server" Width="100%" Height="500px" ID="UC_HtmlEditor" ProxyEnabled="true" />
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:Label ID="lblReasonTitle" runat="server" Text="原因" meta:resourcekey="lblReasonTitleResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="height:150px">
                <asp:TextBox ID="txtReason" runat="server" Width="100%" Height="100%" TextMode="MultiLine" meta:resourcekey="txtReasonResource1"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblMemo" runat="server" Text="*預設會帶出原文件與附件，若移除附件檔，則該文件就沒有對應的附件檔。" Visible="false" ForeColor="Blue" meta:resourcekey="lblMemoResource1"></asp:Label>

    <asp:HiddenField ID="hfInitHasAttach" runat="server" />

    <asp:Label ID="lblErrorMsg" runat="server" Text="原因欄位必填" style="display:none;" meta:resourcekey="lblErrorMsgResource1"></asp:Label>
    <asp:Label ID="lblUploadMsg" runat="server" Text="請上傳要置換的文件內容" style="display:none;" meta:resourcekey="lblUploadMsgResource1"></asp:Label>
    <asp:Label ID="lblContentMsg" runat="server" Text="請輸入本文內容" style="display:none;" meta:resourcekey="lblContentMsgResource1"></asp:Label>
    <asp:Label ID="lblOneFile" runat="server" Text="文件內容只能上傳一個檔案" style="display:none;" meta:resourcekey="lblOneFileResource1"></asp:Label>
    <asp:Label ID="lblNoAttach" runat="server" Text="原文件有附件檔，確定本次文件置換要清除所有附件檔?" style="display:none;" meta:resourcekey="lblNoAttachResource1"></asp:Label>
</asp:Content>
