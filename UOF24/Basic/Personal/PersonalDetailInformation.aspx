<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_PersonalDetailInformation" Title="個人詳細資訊" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="PersonalDetailInformation.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .personal-detail-uchat .rtbIcon {
            width: 22px;
        }
    </style>
    <script type="text/javascript">

        function RadToolBar1_ButtonClicking(sender, args) {
            var value = args.get_item().get_value();
            if (value == "SendMessage") {

                args.set_cancel(true);
                $uof.dialog.open2("~/Basic/Personal/PrivateMessage/ReplyMessage.aspx", args.get_item(),
                    "", 1024, 768, OpenDialogResult, {
                    "userId": $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["userid"],true)%>')
                });
            }
            else if (value == "UChat") {
                args.set_cancel(true);
                //JSON data
                var data2 =
                {
                    UofUrl: window.location.href,
                    SourceDomainAccount: $uof.tool.htmlDecode($("#<%=hfSourceDomainAccount.ClientID%>").val()),
                    TargetUserId: $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["userid"],true)%>')
                };
                var umUrl = 'http://localhost:24114/api/chat';
                if (location.protocol === 'https:') {
                    // page is secure
                    umUrl = 'https://localhost:24114/api/chat';
                }

                $.ajax({
                    url: umUrl,
                    type: 'POST',
                    data: JSON.stringify(data2)
                })
                    .done(function (res) {
                                //alert($("#<%=lblOpenUChatDone.ClientID%>").text());//開成功不需要提醒, UM會修改一定會把聊天室窗彈到前景
                            })
                            .fail(function ($xhr) {
                                console.dir($xhr);
                                if ($xhr.responseJSON) {
                                    if ($xhr.responseJSON.Message == "E01") {
                                        alert($("#<%=lblErrMsgE01.ClientID%>").text());
                                    }
                                    else if ($xhr.responseJSON.Message == "E02") {
                                        alert($("#<%=lblErrMsgE02.ClientID%>").text());
                                    }
                                }
                                else {
                                    alert($("#<%=lblErrMsgNoUChat.ClientID%>").text());
                                }
                            });

            }
        }

        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == "undefined")
                return false;
            else
                return true;
        }
    </script>
    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking" meta:resourcekey="RadToolBar1Resource1">
        <Items>
            <telerik:RadToolBarButton runat="server" Text="發送訊息" Value="SendMessage"
                ClickedImageUrl="~/EIP/Personal/icon_images/icon_m10.gif" DisabledImageUrl="~/EIP/Personal/icon_images/icon_m10.gif"
                HoveredImageUrl="~/EIP/Personal/icon_images/icon_m10.gif" ImageUrl="~/EIP/Personal/icon_images/icon_m10.gif" meta:resourcekey="RadToolBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="UChat" Value="UChat" Visible="false" CssClass="personal-detail-uchat"
                ClickedImageUrl="~/EIP/Personal/icon_images/icon-pn-uchat.png" DisabledImageUrl="~/EIP/Personal/icon_images/icon-pn-uchat.png"
                HoveredImageUrl="~/EIP/Personal/icon_images/icon-pn-uchat.png" ImageUrl="~/EIP/Personal/icon_images/icon-pn-uchat.png" meta:resourcekey="rtbtnUChatResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Value="s2" IsSeparator="true" Visible="false" meta:resourcekey="rtbtns2Resource1">
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>

    <asp:Panel ID="Panel2" runat="server" meta:resourcekey="Panel2Resource1">
        <table width="100%" class="PopTable" cellspacing="1">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="帳號" meta:resourcekey="Label1Resource1"></asp:Label></td>
                <td colspan="3" style="white-space: nowrap;">
                    <asp:Label ID="LBLaccount" runat="server" meta:resourcekey="LBLaccountResource1"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="名稱" meta:resourcekey="Label2Resource1"></asp:Label></td>
                <td style="white-space: nowrap;">
                    <asp:Label ID="LBLname" runat="server" meta:resourcekey="LBLnameResource2"></asp:Label></td>
                <td style="white-space: nowrap;">
                    <asp:Label ID="Label47" runat="server" Text="身分證字號" meta:resourcekey="Label47Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblSID" runat="server" meta:resourcekey="lblSIDResource1"></asp:Label></td>
            </tr>
            <tr>
                <td style="word-wrap: break-word; width: 20%;">
                    <asp:Label ID="Label25" runat="server" Text="部門" meta:resourcekey="Label25Resource1"></asp:Label>
                </td>
                <td style="word-wrap: break-word; width: 30%;" colspan="3">
                    <asp:Label ID="LBLGroup" runat="server" meta:resourcekey="LBLGroupResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="性別" meta:resourcekey="Label3Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LBLsex" runat="server" meta:resourcekey="LBLsexResource1"></asp:Label>
                </td>
                <td style="white-space: nowrap; width: 20%;" rowspan="4">
                    <asp:Label ID="Label24" runat="server" Text="照片" meta:resourcekey="Label24Resource1"></asp:Label>
                </td>
                <td style="white-space: nowrap; width: 30%" rowspan="4">
                    <asp:Image ID="imgBigPictureEmployee" runat="server" Height="100px" Width="100px" />
                    <uc1:UC_FileCenter runat="server" ID="UC_FileCenterEmployee" Editable="false" AllowedMultipleFileSelection="false" UploadEnabled="false" AllowedFileType="Image" Visible="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="生日" meta:resourcekey="Label4Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LBLbirthday" runat="server" meta:resourcekey="LBLbirthdayResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label12" runat="server" Text="行動電話" meta:resourcekey="Label12Resource1"></asp:Label></td>
                <td>
                    <asp:Label ID="LBLmobile" runat="server" meta:resourcekey="LBLmobileResource1" Visible="False"></asp:Label>
                    <asp:HyperLink ID="hlmobile" runat="server" Target="CalltoFrame" Text="[hlmobile]" meta:resourcekey="hlmobileResource1"></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="到職日" meta:resourcekey="Label6Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LBLarriveDate" runat="server" meta:resourcekey="LBLarriveDateResource1"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label16" runat="server" Text="學歷" meta:resourcekey="Label16Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LBLeducation" runat="server" meta:resourcekey="LBLeducationResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="Label15" runat="server" Text="地址" meta:resourcekey="Label15Resource1"></asp:Label></td>
                <td>
                    <asp:Label ID="LBLaddress" runat="server" meta:resourcekey="LBLaddressResource1"></asp:Label></td>
            </tr>


            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="電子郵件" meta:resourcekey="Label7Resource1"></asp:Label>
                </td>
                <td style="word-break: break-all">
                    <asp:HyperLink ID="hlEmail" runat="server" Target="_blank" meta:resourcekey="hlEmailResource1" Text="[hlEmail]"></asp:HyperLink></td>
                <td>
                    <asp:Label ID="Label27" runat="server" Text="電子郵件1" meta:resourcekey="Label27Resource1"></asp:Label></td>
                <td style="word-break: break-all">
                    <asp:HyperLink ID="hlEmailA" runat="server" Target="_blank" meta:resourcekey="hlEmailAResource1"></asp:HyperLink></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label29" runat="server" Text="電子郵件2" meta:resourcekey="Label29Resource1"></asp:Label></td>
                <td style="word-break: break-all">
                    <asp:HyperLink ID="hlEmailB" runat="server" Target="_blank" meta:resourcekey="hlEmailBResource1"></asp:HyperLink></td>
                <td>
                    <asp:Label ID="Label31" runat="server" Text="電子郵件3" meta:resourcekey="Label31Resource1"></asp:Label></td>
                <td style="word-break: break-all">
                    <asp:HyperLink ID="hlEmailC" runat="server" Target="_blank" meta:resourcekey="hlEmailCResource1"></asp:HyperLink></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label32" runat="server" Text="電子郵件4" meta:resourcekey="Label32Resource1"></asp:Label></td>
                <td style="word-break: break-all">
                    <asp:HyperLink ID="hlEmailD" runat="server" Target="_blank" meta:resourcekey="hlEmailDResource1"></asp:HyperLink></td>
                <td>
                    <asp:Label ID="Label8" runat="server" CssClass="HiddenUserUnusedColumn" Text="MSN信箱" meta:resourcekey="Label8Resource1"></asp:Label></td>
                <td style="word-break: break-all">
                    <asp:HyperLink ID="hlMsn" runat="server" CssClass="HiddenUserUnusedColumn" Target="_blank" meta:resourcekey="hlMsnResource1" Text="[hlMsn]"></asp:HyperLink></td>
            </tr>
            <tr class="HiddenUserUnusedColumn">
                <td>
                    <asp:Label ID="Label9" runat="server" Text="QQ" meta:resourcekey="Label9Resource1"></asp:Label>
                </td>
                <td style="word-break: break-all">
                    <asp:Label ID="LBLqq" runat="server" meta:resourcekey="LBLqqResource1"></asp:Label></td>
                <td style="white-space: nowrap;">
                    <asp:Label ID="Label10" runat="server" Text="Yahoo即時通" meta:resourcekey="Label10Resource1"></asp:Label>
                </td>
                <td style="word-break: break-all">
                    <asp:HyperLink ID="hlYahoo" runat="server" Target="_blank" meta:resourcekey="hlYahooResource1" Text="[hlYahoo]"></asp:HyperLink></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="BLOG" meta:resourcekey="Label11Resource1"></asp:Label>
                </td>
                <td style="word-break: break-all">
                    <asp:HyperLink ID="hlBolg" runat="server" Target="_blank" meta:resourcekey="hlBolgResource1" Text="[hlBolg]"></asp:HyperLink></td>
                <td>
                    <asp:Label ID="Label18" runat="server" Text="Skype" meta:resourcekey="Label18Resource1"></asp:Label></td>
                <td style="word-break: break-all">
                    <asp:HyperLink ID="hlSkype" runat="server" Target="_blank" meta:resourcekey="hlSkypeResource1" Text="[hlSkype]"></asp:HyperLink></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label13" runat="server" Text="緊急電話" meta:resourcekey="Label13Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LBLtel" runat="server" meta:resourcekey="LBLtelResource1" Visible="False"></asp:Label>
                    <asp:HyperLink ID="hltel" runat="server" Target="CalltoFrame" Text="[hltel]" meta:resourcekey="hltelResource1"></asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label14" runat="server" Text="分機" meta:resourcekey="Label14Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LBLext" runat="server" meta:resourcekey="LBLextResource1"></asp:Label></td>
            </tr>
            <tr id="trWebphone" runat="server">
                <td style="white-space: nowrap;">
                    <asp:Label ID="Label46" runat="server" Text="網路分機1" meta:resourcekey="Label46Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LBLwebphone1" runat="server" Visible="False" meta:resourcekey="LBLwebphone1Resource1"></asp:Label>
                    <asp:HyperLink ID="hlwebphone1" runat="server" Target="CalltoFrame" Text="[hlwebphone1]" meta:resourcekey="hlwebphone1Resource1"></asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label49" runat="server" Text="網路分機2" meta:resourcekey="Label49Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LBLwebphone2" runat="server" Visible="False" meta:resourcekey="LBLwebphone2Resource1"></asp:Label>
                    <asp:HyperLink ID="hlwebphone2" runat="server" Target="CalltoFrame" Text="[hlwebphone2]" meta:resourcekey="hlwebphone2Resource1"></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label17" runat="server" Text="專長" meta:resourcekey="Label17Resource1"></asp:Label></td>
                <td>
                    <asp:Label ID="LBLskill" runat="server" Width="100%" meta:resourcekey="LBLskillResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="Label19" runat="server" Text="討論區簽名" meta:resourcekey="Label19Resource1"></asp:Label></td>
                <td style="word-break: break-all">
                    <pre><asp:Label ID="LBLsign" runat="server" meta:resourcekey="LBLsignResource1"></asp:Label></pre>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label50" runat="server" Text="電子簽章" meta:resourcekey="Label50Resource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblElecSign" runat="server" meta:resourcekey="lblElecSignResource1"></asp:Label>

                    <Fast:Grid ID="grdElecSign" runat="server" AutoGenerateColumns="false" AutoGenerateCheckBoxColumn="false"
                        Width="100%"
                        DataKeyOnClientWithCheckBox="False"
                        PageSize="5"
                        EnhancePager="True" DataKeyNames="SIGN_GUID"
                        OnRowDataBound="grdElecSign_RowDataBound" AllowSorting="True"
                        DefaultSortDirection="Ascending"
                        EmptyDataText="沒有資料"
                        KeepSelectedRows="False" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" meta:resourcekey="grdElecSignResource1">
                        <EnhancePagerSettings ShowHeaderPager="true" />
                        <ExportExcelSettings AllowExportToExcel="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="預設" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblChecked" runat="server"
                                        meta:resourcekey="lblCheckedResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="電子簽章" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:Image ID="imgElecSign" runat="server" Height="75px" Width="75px"
                                        meta:resourcekey="imgElecSignResource1" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="建立時間" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <asp:Label ID="lblCreateDate" runat="server" Text='<%# Eval("CREATE_DATE") %>'
                                        meta:resourcekey="lblCreateDateResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DEFAULT_SIGN" Visible="False"
                                meta:resourcekey="TemplateFieldResource5">
                                <ItemTemplate>
                                    <asp:Label ID="lblDefaultSign" runat="server"
                                        meta:resourcekey="lblDefaultSignResource1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <SelectedRowStyle BackColor="#FFC0C0" />
                    </Fast:Grid>
                </td>
                <td>
                    <asp:Label ID="Label51" runat="server" Text="私人訊息簽名" meta:resourcekey="Label51Resource1"></asp:Label></td>
                <td style="word-break: break-all">
                    <pre><asp:Label ID="lblMessageSign" runat="server" meta:resourcekey="lblMessageSignResource1"></asp:Label></pre>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblOption1Name" runat="server" Text="其它1"
                        meta:resourcekey="lblOption1NameResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOption1Value" runat="server"
                        meta:resourcekey="lblOption1ValueResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOption2Name" runat="server" Text="其它2"
                        meta:resourcekey="lblOption2NameResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOption2Value" runat="server"
                        meta:resourcekey="lblOption2ValueResource1"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblOption3Name" runat="server" Text="其它3"
                        meta:resourcekey="lblOption3NameResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOption3Value" runat="server"
                        meta:resourcekey="lblOption3ValueResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOption4Name" runat="server" Text="其它4"
                        meta:resourcekey="lblOption4NameResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOption4Value" runat="server"
                        meta:resourcekey="lblOption4ValueResource1"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblOption5Name" runat="server" Text="其它5"
                        meta:resourcekey="lblOption5NameResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOption5Value" runat="server"
                        meta:resourcekey="lblOption5ValueResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOption6Name" runat="server" Text="其它6"
                        meta:resourcekey="lblOption6NameResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOption6Value" runat="server"
                        meta:resourcekey="lblOption6ValueResource1"></asp:Label></td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1">
        <table width="100%" class="PopTable" cellspacing="1">
            <tr>
                <td>
                    <asp:Label ID="Label20" runat="server" Text="帳號" meta:resourcekey="Label20Resource1"></asp:Label></td>
                <td style="white-space: nowrap;">
                    <asp:Label ID="lblAccount2" runat="server" meta:resourcekey="lblAccount2Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label44" runat="server" Text="會員類別" meta:resourcekey="Label44Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblClass" runat="server" meta:resourcekey="lblClassResource1"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label28" runat="server" Text="姓名" meta:resourcekey="Label28Resource1"></asp:Label></td>
                <td style="white-space: nowrap;">
                    <asp:Label ID="lblName2" runat="server" meta:resourcekey="lblName2Resource1"></asp:Label></td>
                <td style="white-space: nowrap;">
                    <asp:Label ID="Label45" runat="server" Text="身分證字號"
                        meta:resourcekey="Label45Resource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblSID2" runat="server" meta:resourcekey="lblSID2Resource1"></asp:Label></td>
            </tr>
            <tr>
                <td style="word-wrap: break-word; width: 20%;">
                    <asp:Label ID="Label38" runat="server" Text="群組" meta:resourcekey="Label38Resource1"></asp:Label></td>
                <td style="word-wrap: break-word; width: 30%;">
                    <asp:Label ID="lblGroup2" runat="server" meta:resourcekey="lblGroup2Resource1"></asp:Label></td>
                <td style="white-space: nowrap; width: 20%;">
                    <asp:Label ID="Label40" runat="server" Text="照片" meta:resourcekey="Label40Resource1"></asp:Label></td>
                <td style="white-space: nowrap; width: 30%">
                    <asp:Image ID="imgBigPictureMember" runat="server" Height="100px" Width="100px" />
                    <uc1:UC_FileCenter runat="server" ID="UC_FileCenterMember" Editable="false" AllowedMultipleFileSelection="false" UploadEnabled="false" Visible="false" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label21" runat="server" Text="性別" meta:resourcekey="Label21Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LBLsex2" runat="server" meta:resourcekey="LBLsex2Resource1"></asp:Label></td>
                <td>
                    <asp:Label ID="Label23" runat="server" Text="生日" meta:resourcekey="Label23Resource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LBLbirth2" runat="server" meta:resourcekey="LBLbirth2Resource1"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label30" runat="server" Text="電子郵件" meta:resourcekey="Label30Resource1"></asp:Label></td>
                <td style="word-break: break-all">
                    <asp:HyperLink ID="hlEmail2" runat="server" Target="_blank" meta:resourcekey="hlEmail2Resource1" Text="[hlEmail2]"></asp:HyperLink></td>
                <td>
                    <asp:Label ID="Label22" runat="server" Text="電子郵件1" meta:resourcekey="Label22Resource1"></asp:Label></td>
                <td style="word-break: break-all">
                    <asp:HyperLink ID="hlEmail2A" runat="server" Target="_blank" meta:resourcekey="hlEmail2AResource1"></asp:HyperLink></td>
            </tr>
            <tr>
                <td style="white-space: nowrap;">
                    <asp:Label ID="Label26" runat="server" Text="電子郵件2" meta:resourcekey="Label26Resource1"></asp:Label></td>
                <td style="word-break: break-all">
                    <asp:HyperLink ID="hlEmail2B" runat="server" Target="_blank" meta:resourcekey="hlEmail2BResource1"></asp:HyperLink></td>
                <td>
                    <asp:Label ID="Label42" runat="server" Text="電子郵件3" meta:resourcekey="Label42Resource1"></asp:Label></td>
                <td style="word-break: break-all">
                    <asp:HyperLink ID="hlEmail2C" runat="server" Target="_blank" meta:resourcekey="hlEmail2CResource1"></asp:HyperLink></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label43" runat="server" Text="電子郵件4" meta:resourcekey="Label43Resource1"></asp:Label></td>
                <td style="word-break: break-all">
                    <asp:HyperLink ID="hlEmail2D" runat="server" Target="_blank" meta:resourcekey="hlEmail2DResource1"></asp:HyperLink></td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Skype" meta:resourcekey="Label5Resource1"></asp:Label></td>
                <td style="word-break: break-all">
                    <asp:HyperLink ID="hlSkype2" runat="server" Target="_blank" meta:resourcekey="hlSkype2Resource1" Text="[hlSkype]"></asp:HyperLink></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label48" runat="server" meta:resourcekey="Label12Resource1"
                        Text="行動電話"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LBLmobile2" runat="server" Visible="False" meta:resourcekey="LBLmobile2Resource1"></asp:Label>
                    <asp:HyperLink ID="hlmobile2" runat="server" Target="_blank" Text="[hlmobile2]" meta:resourcekey="hlmobile2Resource1"></asp:HyperLink>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label39" runat="server" meta:resourcekey="Label39Resource1"
                        Text="公司名稱"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LBLCompname" runat="server"
                        meta:resourcekey="LBLCompnameResource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label34" runat="server" meta:resourcekey="Label34Resource1"
                        Text="分機"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LBLExtension2" runat="server"
                        meta:resourcekey="LBLExtension2Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label33" runat="server" Text="公司電話" meta:resourcekey="Label33Resource1"></asp:Label></td>
                <td>
                    <asp:Label ID="LBLtel2" runat="server" meta:resourcekey="LBLtel2Resource1" Visible="False"></asp:Label>
                    <asp:HyperLink ID="hltel2" runat="server" Target="_blank" Text="[hltel2]" meta:resourcekey="hltel2Resource1"></asp:HyperLink>
                </td>
                <td>
                    <asp:Label ID="Label36" runat="server" Text="公司傳真" meta:resourcekey="Label36Resource1"></asp:Label></td>
                <td>
                    <asp:Label ID="LBLFax" runat="server" meta:resourcekey="LBLFaxResource1"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label35" runat="server" Text="統一編號" meta:resourcekey="Label35Resource1"></asp:Label></td>
                <td>
                    <asp:Label ID="LBLNumber" runat="server" meta:resourcekey="LBLNumberResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="Label37" runat="server" Text="地址" meta:resourcekey="Label37Resource1"></asp:Label></td>
                <td>&nbsp;<asp:Label ID="LBLaddress2" runat="server" meta:resourcekey="LBLaddress2Resource1"></asp:Label></td>
            </tr>
            <tr>

                <td>
                    <asp:Label ID="Label41" runat="server" Text="簽名" meta:resourcekey="Label41Resource1"></asp:Label></td>
                <td colspan="3" style="word-break: break-all">
                    <pre><asp:Label ID="LBLSign2" runat="server" meta:resourcekey="LBLSign2Resource1"></asp:Label></pre>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblOptionAName" runat="server" Text="其它1"
                        meta:resourcekey="lblOptionANameResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOptionAValue" runat="server"
                        meta:resourcekey="lblOptionAValueResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOptionBName" runat="server" Text="其它2"
                        meta:resourcekey="lblOptionBNameResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOptionBValue" runat="server"
                        meta:resourcekey="lblOptionBValueResource1"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblOptionCName" runat="server" Text="其它3"
                        meta:resourcekey="lblOptionCNameResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOptionCValue" runat="server"
                        meta:resourcekey="lblOptionCValueResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOptionDName" runat="server" Text="其它4"
                        meta:resourcekey="lblOptionDNameResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOptionDValue" runat="server"
                        meta:resourcekey="lblOptionDValueResource1"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblOptionEName" runat="server" Text="其它5"
                        meta:resourcekey="lblOptionENameResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOptionEValue" runat="server"
                        meta:resourcekey="lblOptionEValueResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOptionFName" runat="server" Text="其它6"
                        meta:resourcekey="lblOptionFNameResource1"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOptionFValue" runat="server"
                        meta:resourcekey="lblOptionFValueResource1"></asp:Label></td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Label ID="msgMale" runat="server" Text="男" Visible="False" meta:resourcekey="msgMaleResource1"></asp:Label>
    <asp:Label ID="msgFemale" runat="server" Text="女" Visible="False" meta:resourcekey="msgFemaleResource1"></asp:Label>
    <asp:Label ID="msgMaster" runat="server" Text="主要 : " Visible="False" meta:resourcekey="msgMasterResource1"></asp:Label>
    <asp:Label ID="msgGroup1" runat="server" Text="兼任一 : " Visible="False" meta:resourcekey="msgGroup1Resource1"></asp:Label>
    <asp:Label ID="msgGroup2" runat="server" Text="兼任二 : " Visible="False" meta:resourcekey="msgGroup2Resource1"></asp:Label>
    <asp:Label ID="msgGroup3" runat="server" Text="兼任三 : " Visible="False" meta:resourcekey="msgGroup3Resource1"></asp:Label>
    <asp:Label ID="msgGroup4" runat="server" Text="兼任四 : " Visible="False" meta:resourcekey="msgGroup4Resource1"></asp:Label>
    <asp:Label ID="msgGroup5" runat="server" Text="兼任五 : " Visible="False" meta:resourcekey="msgGroup5Resource1"></asp:Label>
    <asp:Label ID="msgGroup6" runat="server" Text="兼任六 : " Visible="False" meta:resourcekey="msgGroup6Resource1"></asp:Label>
    <asp:Label ID="msgGroup7" runat="server" Text="兼任七 : " Visible="False" meta:resourcekey="msgGroup7Resource1"></asp:Label>
    <asp:Label ID="msgGroup8" runat="server" Text="兼任八 : " Visible="False" meta:resourcekey="msgGroup8Resource1"></asp:Label>
    <asp:Label ID="msgGroup9" runat="server" Text="兼任九 : " Visible="False" meta:resourcekey="msgGroup9Resource1"></asp:Label>
    <asp:Label ID="lblDoNotDisplay" runat="server" Text="不顯示" Visible="False" meta:resourcekey="lblDoNotDisplayResource1"></asp:Label>
    <asp:Label ID="msgTitle" runat="server" Text="職級 : " Visible="False" meta:resourcekey="msgTitleResource1"></asp:Label>
    <asp:Label ID="msgFunction" runat="server" Text="職務 : " Visible="False" meta:resourcekey="msgFunctionResource1"></asp:Label>
    <iframe id="CalltoFrame" name="CalltoFrame" height="0" width="0"></iframe>
    <asp:Label ID="lblErrMsgNoUChat" runat="server" Text="噢噢！沒有可用的UChat，請確認(1)已開啟UM (2)UOF與UM版本相同" Style="display: none" meta:resourcekey="lblErrMsgNoUChatResource1"></asp:Label>
    <asp:Label ID="lblErrMsgE01" runat="server" Text="請確認UOF站台網址與UM相同且已登入UM" Style="display: none" meta:resourcekey="lblErrMsgE01Resource1"></asp:Label>
    <asp:Label ID="lblErrMsgE02" runat="server" Text="請確認UOF使用者帳號與UM相同" Style="display: none" meta:resourcekey="lblErrMsgE02Resource1"></asp:Label>
    <asp:Label ID="lblOpenUChatDone" runat="server" Text="已開啟聊天室" Style="display: none" meta:resourcekey="lblOpenUChatDoneResource1"></asp:Label>
    <asp:HiddenField ID="hfSourceDomainAccount" runat="server" />
    <asp:HiddenField ID="hfViewingUserGuid" runat="server" />
</asp:Content>
