<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="ReceiveEdocDetailDialog.aspx.cs" Inherits="Ede.Uof.Web.Edoc.ReceiveDoc.ReceiveEdocDetailDialog" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .cssHidden {
            display: none;
        }
    </style>
    <script type="text/javascript">
        function CheckDeleteEdoc() {
            return confirm($('#<%=lblDeleteMsg.ClientID%>').text());
        }

        function CheckUploadEdoc() {
            return confirm($('#<%=lblUploadMsg.ClientID%>').text());
        }
    </script>
    <asp:Image ID="imgAttachLostTip" runat="server" ImageUrl="~/Common/Images/Edoc/icon_m248.png" Visible="false" />
    <asp:Label ID="lblAttachLostTip" Text="：未收到此附件" ForeColor="Red" Visible="false" runat="server"></asp:Label>

    <asp:Image ID="imgAttachLostPassTip" runat="server" ImageUrl="~/Common/Images/Edoc/icon_m253.png" Visible="false" />
    <asp:Label ID="lblAttachLostPassTip" Text="：不需收到此附件" ForeColor="Blue" Visible="false" runat="server"></asp:Label>

    <table class="PopTable">
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label3" runat="server" Text="表單編號"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblDocNbr" runat="server"></asp:Label>
                <asp:LinkButton ID="lbtnDocNbr" runat="server" Visible="false"></asp:LinkButton>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="Label1" runat="server" Text="表單狀態"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblFormStatusName" runat="server"></asp:Label>
                <asp:LinkButton ID="lbtnFormStatusName" runat="server"></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label5" runat="server" Text="發文機關代碼"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblFromUnitId" runat="server"></asp:Label>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="Label7" runat="server" Text="發文機關"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblFromUnitName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label9" runat="server" Text="受文機關代碼"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblToUnitId" runat="server"></asp:Label>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="Label11" runat="server" Text="受文機關"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblToUnitName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label13" runat="server" Text="公文類型"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblDocType" runat="server"></asp:Label>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="Label15" runat="server" Text="發文日期"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblSendDate" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label17" runat="server" Text="速別"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblSpeedType" runat="server"></asp:Label>
            </td>
            <td style="white-space: nowrap">
                <asp:Label ID="Label19" runat="server" Text="密等"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblSecretType" runat="server"></asp:Label>
            </td>
        </tr>

        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label21" runat="server" Text="發文字號"></asp:Label>
            </td>
            <td colspan="3">
                <asp:Label ID="lblNumberString" runat="server"></asp:Label>
            </td>
        </tr>

        <asp:Panel ID="pnlLetterTr" runat="server">
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label23" runat="server" Text="主旨"></asp:Label>
                </td>
                <td colspan="3">
                    <asp:Label ID="lblSubject" runat="server"></asp:Label>
                </td>
            </tr>
        </asp:Panel>

        <asp:Panel ID="pnlMeetingNoticeTr" runat="server">
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label2" runat="server" Text="開會事由"></asp:Label>
                </td>
                <td colspan="3">
                    <asp:Label ID="lblMnSubject" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label6" runat="server" Text="開會時間"></asp:Label>
                </td>
                <td colspan="3">
                    <asp:Label ID="lblMnTime" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label27" runat="server" Text="開會地點"></asp:Label>
                </td>
                <td colspan="3">
                    <asp:Label ID="lblMnLocation" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label29" runat="server" Text="主持人"></asp:Label>
                </td>
                <td colspan="3">
                    <asp:Label ID="lblMnHost" runat="server"></asp:Label>
                </td>
            </tr>
        </asp:Panel>

        <asp:Panel ID="pnlSiteMeetingNoticeTr" runat="server">
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label8" runat="server" Text="會勘事由"></asp:Label>
                </td>
                <td colspan="3">
                    <asp:Label ID="lblSmnSubject" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label12" runat="server" Text="會勘時間"></asp:Label>
                </td>
                <td colspan="3">
                    <asp:Label ID="lblSmnTime" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label16" runat="server" Text="會勘地點"></asp:Label>
                </td>
                <td colspan="3">
                    <asp:Label ID="lblSmnLocation" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="white-space: nowrap">
                    <asp:Label ID="Label20" runat="server" Text="主持人"></asp:Label>
                </td>
                <td colspan="3">
                    <asp:Label ID="lblSmnHost" runat="server"></asp:Label>
                </td>
            </tr>
        </asp:Panel>

        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label25" runat="server" Text="公文內容"></asp:Label>
            </td>
            <td colspan="3">
                <asp:LinkButton ID="lbtnShowEdoc" Text="觀看" runat="server"></asp:LinkButton>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <Ede:Grid ID="grdAttachment" runat="server" Width="100%" DataKeyNames="FILE_ID"
                EmptyDataText="沒有資料" AutoGenerateColumns="false" AutoGenerateCheckBoxColumn="false"
                OnRowDataBound="grdAttachment_RowDataBound">
                <HeaderStyle Wrap="false" />
                <Columns>
                    <asp:BoundField DataField="FILE_ID" HeaderText="FILEIDHIDDEN"
                        ItemStyle-CssClass="cssHidden" HeaderStyle-CssClass="cssHidden" />
                    <asp:TemplateField HeaderText="附件">
                        <ItemTemplate>
                            <asp:Image ID="imgType" runat="server" />
                            <asp:LinkButton ID="lbtnAttachment" OnClick="lbtnAttachment_Click" runat="server"></asp:LinkButton>
                            <asp:Label ID="Label2" runat="server" Text="("></asp:Label>
                            <asp:Label ID="lblFileSize" Text='<%#:Eval("FILE_SIZE")%>' runat="server"></asp:Label>
                            <asp:Label ID="Label4" runat="server" Text=")"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </Ede:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblUpload" runat="server" Text="起單" Visible="false"></asp:Label>
    <asp:Label ID="lblDeleteEdoc" runat="server" Text="刪除公文" Visible="false"></asp:Label>
    <asp:Label ID="lblReUpload" runat="server" Text="重新起單" Visible="false"></asp:Label>
    <asp:Label ID="lblFormStatus" runat="server" Text="表單狀態" Visible="false"></asp:Label>
    <asp:Label ID="lblEdocContent" runat="server" Text="公文內容" Visible="false"></asp:Label>
    <asp:Label ID="lblView" runat="server" Text="觀看" Visible="False"></asp:Label>

    <!-- SecretType中文字串 -->
    <asp:Label ID="lblLevel0" runat="server" Text="無機密" Visible="False"></asp:Label>
    <asp:Label ID="lblLevel1" runat="server" Text="密" Visible="False"></asp:Label>
    <asp:Label ID="lblLevel2" runat="server" Text="機密" Visible="False"></asp:Label>
    <asp:Label ID="lblLevel3" runat="server" Text="極機密" Visible="False"></asp:Label>
    <asp:Label ID="lblLevel4" runat="server" Text="絕對機密" Visible="False"></asp:Label>

    <!-- SpeedType中文字串 -->
    <asp:Label ID="lblTop" runat="server" Text="最速件" Visible="False"></asp:Label>
    <asp:Label ID="lblFast" runat="server" Text="速件" Visible="False"></asp:Label>
    <asp:Label ID="lblNormal" runat="server" Text="普通件" Visible="False"></asp:Label>
    <asp:Label ID="lblSpecial" runat="server" Text="特別件" Visible="False"></asp:Label>
    <asp:Label ID="lblNone" runat="server" Text="無" Visible="False"></asp:Label>

    <!-- DocType中文字串 -->
    <asp:Label ID="lblLetter" runat="server" Text="函" Visible="False"></asp:Label>
    <asp:Label ID="lblMeetingNotice" runat="server" Text="開會通知單" Visible="False"></asp:Label>
    <asp:Label ID="lblSiteMeetingNotice" runat="server" Text="會勘通知單" Visible="False"></asp:Label>

    <%-- 多組受文機關顯示用 --%>
    <asp:Label ID="lblMultipleLetterUnit" runat="server" Text="如行文單位" Visible="false"></asp:Label>
    <asp:Label ID="lblMultipleMeetingNoticeUnit" runat="server" Text="如出列席者" Visible="false"></asp:Label>

    <asp:Label ID="lblDeleteMsg" runat="server" Text="刪除後將無法查詢到此張公文，確定刪除 ?" CssClass="cssHidden"></asp:Label>
    <asp:Label ID="lblUploadMsg" runat="server" Text="確定要為所選擇的公文建立電子表單並送出申請 ?" CssClass="cssHidden"></asp:Label>

    <asp:HiddenField ID="hfToUnitId" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="hfToUnitName" runat="server"></asp:HiddenField>
</asp:Content>
