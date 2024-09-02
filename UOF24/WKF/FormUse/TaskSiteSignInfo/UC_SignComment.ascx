<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="WKF_FormUse_TaskSiteSignInfo_UC_SignComment" Codebehind="UC_SignComment.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<script type="text/javascript">
    //20130912 簽名檔過大時，限制大小為100*100
    function CheckSize(imageID) {
        var img = $('#' + imageID);
        var width = img.width();
        var height = img.height();

        if (width > 100)
            img.width(100);
        if (height > 100)
            img.height(100);
    }


    function GoTo(url) {
        location.replace(url);
        return false;
    }
</script>
<asp:Panel ID="pnlComment" runat="server" meta:resourcekey="pnlCommentResource1">
    
<asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1" Visible="false">
</asp:Panel>
<div id="pcSignCommentGrid" runat="server">

<table style="width:100%">
    <tr>
        <td style="text-align:left" >
            <asp:Label ID="lblFormResultMsg" runat="server" Text="表單審核結果：" meta:resourcekey="lblFormResultMsgResource1"></asp:Label>
            <asp:Label ID="lblFormResult" runat="server" meta:resourcekey="lblFormResultResource1"></asp:Label>
        </td>
        <td style="text-align: right">
            <asp:Label ID="Label1" runat="server" Text="*點擊兩下可複製意見內容" CssClass="SizeMemo" meta:resourcekey="Label1Resource1" Visible="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td  style="text-align:left"  colspan=2>
            <asp:Label ID="lblCancelFormReasonMsg" runat="server" Text="作廢原因：" Visible=False meta:resourcekey="lblCancelFormReasonMsgResource1"></asp:Label>
            <asp:Label ID="lblCancelFormReason" runat="server" Visible=False meta:resourcekey="lblCancelFormReasonResource1"></asp:Label>
            <asp:Image ID="Image1" runat="server"   
                ImageUrl="~/Common/images/icon/email.png" 
                meta:resourcekey="Image1Resource1"  />
            <asp:Label ID="Label2" runat="server" Text="表單副本" 
                meta:resourcekey="Label2Resource1"></asp:Label>
            <asp:Image ID="Image2" runat="server"   
                ImageUrl="~/Common/images/icon/icon_m61.gif" 
                meta:resourcekey="Image2Resource1"  />
            <asp:Label ID="Label3" runat="server" Text="個人站點附件" 
                meta:resourcekey="Label3Resource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2"  style="text-align:left" >
            <Fast:Grid ID="SignCommentGrid" runat="server" AutoGenerateCheckBoxColumn="False" Width="100%"
                AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EnhancePager="True"
                PageSize="15"   OnRowDataBound="SignCommentGrid_RowDataBound"
                EmptyDataText="沒有資料" KeepSelectedRows="False"
                meta:resourcekey="SignCommentGridResource3" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                <EnhancePagerSettings
                    ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                <ExportExcelSettings AllowExportToExcel="False" />
                <Columns>
                    <asp:BoundField HeaderText="站點" meta:resourcekey="BoundFieldResource2" DataField="SITE" ItemStyle-Wrap="false">
                        <ItemStyle Width="1%" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <HeaderStyle Wrap="false" />
                    </asp:BoundField>
                   <asp:BoundField >
                       <ItemStyle Width="1%" />
                        <ItemStyle Width="1%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="簽核者" meta:resourcekey="TemplateFieldResource1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%#: Bind("ORIGINAL_SIGNER_NAME") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSigner" runat="server" meta:resourceKey="lblSignerResource1" Text='<%#: Bind("ORIGINAL_SIGNER_NAME") %>'></asp:Label>
                            &nbsp;&nbsp;
                            <asp:ImageButton ID="imgCC" runat="server" meta:resourceKey="imgCCResource1" />
                            <asp:ImageButton ID="ibtnAttach" runat="server" CausesValidation="False" ImageUrl="~/Common/images/icon/icon_m61.gif" meta:resourceKey="ibtnAttachResource1" />
                        </ItemTemplate>
                        <ItemStyle Width="35%" Wrap="True" />
                    </asp:TemplateField>
                  
                 
                    <asp:TemplateField HeaderText="簽核意見" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <asp:Label ID="lblCOMMENT" runat="server" meta:resourcekey="lblCOMMENTResource1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="簽核時間" meta:resourcekey="TemplateFieldResource4">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%#: Bind("BEGIN_TIME") %>' 
                                meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBeginTime" runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="10%" Wrap="False" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="簽核狀態" meta:resourcekey="TemplateFieldResource5">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%#: Bind("SIGN_STATUS") %>' 
                                meta:resourcekey="TextBox3Resource1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblSignStatus" runat="server" meta:resourceKey="lblSignStatusResource1" Text='<%#: Bind("SIGN_STATUS") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="8%" Wrap="False" />
                    </asp:TemplateField>
                 <asp:TemplateField HeaderText="電子簽章" meta:resourcekey="TemplateFieldResource6" >
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" meta:resourcekey="Image1Resource1" ImageAlign="Middle" />
                                </ItemTemplate>
                                 <ItemStyle Width="105px" Wrap="True" />
                            </asp:TemplateField>
                     <asp:TemplateField  meta:resourcekey="BoundFieldResource1" Visible="false">
                         <ItemTemplate>
                            <asp:Label ID="lblSite" runat="server"  Text='<%#: Bind("SITE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle Wrap="False" />
            </Fast:Grid>
        </td>
    </tr>
</table>

    </div>
<asp:Label ID="lblAttach" runat="server" Text="附件" Visible="False" meta:resourcekey="lblAttachResource1"></asp:Label>
<asp:Label ID="lblCC" runat="server" Text="副本" meta:resourcekey="TemplateFieldResource2" Visible=False  ></asp:Label>
<asp:Label ID="lblOriginalSigner" runat="server" Text="原簽核者" Visible="False" meta:resourcekey="lblOriginalSignerResource1"></asp:Label>
<asp:Label ID="lblSubFlow" runat="server" Text="副流程：" Visible="False" meta:resourcekey="lblSubFlowResource1"></asp:Label>
<asp:Label ID="lblAgree" runat="server" Text="核准" Visible="False" meta:resourcekey="lblAgreeResource1"></asp:Label>
<asp:Label ID="lblDisagree" runat="server" Text="不同意" Visible="False" meta:resourcekey="lblDisagreeResource1"></asp:Label>
<asp:Label ID="lblBack" runat="server" Text="退簽" Visible="False" meta:resourcekey="lblBackResource1"></asp:Label>
<asp:Label ID="lblNoComment" runat="server" Text="沒意見" Visible="False" meta:resourcekey="lblNoCommentResource1"></asp:Label>
<asp:Label ID="lblapplication" runat="server" Text="申請" Visible="False" meta:resourcekey="lblapplicationResource1"></asp:Label>
<asp:Label ID="lblNull" runat="server" Text="未簽核" Visible="False" meta:resourcekey="lblNullResource1"></asp:Label>
<asp:Label ID="lblOrSigned" runat="server" Text="已由他人簽核" Visible="False" meta:resourcekey="lblOrSignedResource1"></asp:Label>
<asp:Label ID="lblCancelMsg" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblCancelMsgResource1"></asp:Label>
<asp:Label ID="lblAddtionalMsg" runat="server" Text="加簽" Visible="False" meta:resourcekey="lblAddtionalMsgResource1"></asp:Label>
<asp:Label ID="lblSkipped" runat="server" Text="(自動簽核)" Visible="False" meta:resourcekey="lblSkippedResource1"></asp:Label>
<asp:Label ID="lblAddtionalFlowMsg" runat="server" Text="加簽流程" Visible="False" meta:resourcekey="lblAddtionalFlowMsgMsgResource1"></asp:Label>
<asp:Label ID="lblPass" runat="server" Text="同意" Visible="False" meta:resourcekey="lblPassResource1"></asp:Label>
<asp:Label ID="lblReject" runat="server" Text="否決" Visible="False" meta:resourcekey="lblRejectResource1"></asp:Label>
<asp:Label ID="lblInvalid" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblInvalidResource1"></asp:Label>
<asp:Label ID="lblException" runat="server" Text="異常" Visible="False" meta:resourcekey="lblExceptionResource2"></asp:Label>
<asp:Label ID="lblCopeed" runat="server" Text="處理中" Visible="False" meta:resourcekey="lblCopeedResource1"></asp:Label>
<asp:Label ID="lblSend" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSendResource1"></asp:Label>
<asp:Label ID="lblEleSign" runat="server" Text="電子簽章" Visible="False" meta:resourcekey="lblEleSignResource1" ></asp:Label>
<asp:Label ID="lblAutoSign" runat="server" Text="(逾時自動送出)" Visible="False" meta:resourcekey="lblAutoSignResource1" ></asp:Label>
<asp:Label ID="lblSiteSeq" runat="server" Text="站點" Visible="False" meta:resourcekey="lblSiteSeqResource1" ></asp:Label>
<asp:Label ID="lblAgentSign" runat="server" Text="由 {#User} 代理簽核" Visible="False" meta:resourcekey="lblAgentSignResource1" ></asp:Label>
<asp:Label ID="lblCancelSign" runat="server" Text="由 {#User} 作廢" Visible="False" meta:resourcekey="lblCancelSignResource1" ></asp:Label>
<asp:Label ID="lblAdditionalSign" runat="server" Text="由 {#User} 加簽" Visible="False" meta:resourcekey="lblAdditionalSignResource1" ></asp:Label>
<asp:Label ID="lblAgentSign2" runat="server" Text="代理簽核" Visible="False" meta:resourcekey="lblAgentSign2Resource1" ></asp:Label>
<asp:Label ID="lblForcedClosure" runat="server" Text="強制結案" Visible="False" meta:resourcekey="lblForcedClosureResource1" ></asp:Label>
</asp:Panel>