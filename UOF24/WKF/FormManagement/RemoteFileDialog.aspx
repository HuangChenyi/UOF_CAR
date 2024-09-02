<%@ Page Title="上傳檔案" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_RemoteFileDialog" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="RemoteFileDialog.aspx.cs" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register TagPrefix="cc2" Namespace="Ede.Uof.Controls.Upload" Assembly="Ede.Uof.Utility.Controls" %>
<%@ Register Src="~/WKF/Common/UC_FileOnlinePreview.ascx" TagPrefix="uc9" TagName="UC_FileOnlinePreview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">


</script>
    <telerik:radajaxmanager id="RadAjaxManager1" runat="server" onajaxrequest="RadAjaxManager1_AjaxRequest"></telerik:radajaxmanager>
    <asp:Panel ID="pnlMultiSite" runat="server">

        <asp:HiddenField ID="hfFileGroupID" runat="server" />
        <asp:HiddenField ID="hfLinkUrl" runat="server" />
        <iframe id="dmsDLFrame" style="display: none; width: 87px; height: 33px;"></iframe>

        <asp:Label ID="lblLocalhost" runat="server" Text="本地端" Visible="False"
            meta:resourcekey="lblLocalhostResource1"></asp:Label>
        <asp:Label ID="lblDeleteErrorMsg" runat="server" Text="異地檔案刪除失敗!!"
            Visible="False" meta:resourcekey="lblDeleteErrorMsgResource1"></asp:Label>
        <asp:Label ID="lblCopyMsg" runat="server" Text="檔案複製中" Visible="False"
            meta:resourcekey="lblCopyMsgResource1"></asp:Label>
        <asp:Label ID="lblFileNotFound" runat="server" Text="原始檔案已被刪除"
            Visible="False" meta:resourcekey="lblFileNotFoundResource1"></asp:Label>
    </asp:Panel>

    <asp:Panel ID="pnlProxy" runat="server">
        <div id="Div1" runat="server"></div>
        <table cellpadding="0" cellspacing="1" class="PopTable">
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="檔案上傳" style="white-space: nowrap" meta:resourcekey="Label2Resource1"></asp:Label>
                </td>
                <td>
                    <table>
                        <tr>
                            <td>
                                <div id="divFC" runat="server" style="text-align:left;">
                                    <uc1:uc_filecenter runat="server" id="ucFileProxy" proxyenabled="true" />
                                </div>
                                <div id="divFOP" runat="server" style="text-align:left;">
                                    <uc9:UC_FileOnlinePreview runat="server" ID="UC_FileOnlinePreviewPersonal" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblLimitDiscription" runat="server" CssClass="SizeMemo" Visible="False" meta:resourcekey="lblLimitDiscriptionResource1"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Label ID="lblFileType" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblReturn" runat="server" Text="返回" Visible="false" meta:resourcekey="lblReturnResource1"></asp:Label>
    <asp:Label ID="lblLimitDiscriptionText" runat="server" Text="※單一檔案大小不可超出 {0}" CssClass="SizeMemo" Visible="False" meta:resourcekey="lblLimitDiscriptionTextResource1"></asp:Label>
</asp:Content>

