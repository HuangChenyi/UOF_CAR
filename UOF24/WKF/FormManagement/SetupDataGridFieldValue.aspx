<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupDataGridFieldValue"
    Title="新增明細" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupDataGridFieldValue.aspx.cs" %>

<%@ Register Src="VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" TagName="VersionFieldCollectionUsingUC"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        $(function() {
            var isAlertLockedMsg = "<%=isAlertLockedMsg %>"
            var alertMsg = "<%=lblLockedMsg.Text %>"
            var firstLoad = "<%=firstLoad %>"
            //表單計算欄位
            try {
                if (firstLoad == "true") {
                    SetDivZero();
                }
                else {
                    calculate();
                    SetDivZero();
                }
            } catch(e) {
            }

            if (isAlertLockedMsg == "true") {
                alert(alertMsg);
                $uof.dialog.close();
            }
        });

function CopyToClipBoard() {
    clipboardData.setData("Text", event.srcElement.innerText);
}


</script>

    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td align="center" class="PopTableHeader">
                <center>
                    <asp:Label ID="lblDataGridTitle" runat="server" Text="新增明細子欄位" meta:resourcekey="lblDataGridTitleResource1"></asp:Label>
                </center>
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="18"></td>
                        <td style="text-align: right">
                            <asp:Label ID="lblDetailCountName" runat="server" Font-Bold="True" Text="項次:" meta:resourcekey="lblDetailCountNameResource1"></asp:Label>
                            <asp:Label ID="lblIndex" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                        <td width="18"></td>
                    </tr>
                    <tr>
                        <td style="height: 27px">&nbsp;</td>
                        <td style="height: 27px" valign="top">&nbsp;
                            <uc1:VersionFieldCollectionUsingUC ID="VersionFieldCollectionUsingUC1" runat="server" />
                            <asp:LinkButton ID="lbtnClear" CausesValidation="false" runat="server" Font-Underline=true onclick="lbtnClear_Click" 
                                Text="清空資料" meta:resourcekey="lbtnClearResource1">
                            </asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 27px"></td>
                        <td style="height: 27px;" align="right" valign="bottom"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblCopy" runat="server" Text="新增後複製上一筆資料" Visible=false meta:resourcekey="lblCopyResource1"></asp:Label>
    <asp:Label ID="lblClear" runat="server" Text="確定後繼續" Visible=false meta:resourcekey="lblClearResource1"></asp:Label> 
    <asp:Label ID="lblLockedMsg" runat="server" Visible=False Text="表單目前有他人正在處理，請稍後再進行簽核！" meta:resourcekey="lblLockedMsgResource1" ></asp:Label>
</asp:Content>
