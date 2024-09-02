<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_OMS_OnlineLookMAEdit" Title="影音資料維護" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="OnlineLookMAEdit.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .lookMAEditTable td {
            border: 1px solid black;
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        function OnValueChanging(sender, args) {

            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
            }
        }
        function CheckDate(sender, args) {
            var time = $find("<%= rdpFrom.ClientID%>");
            if (time.get_selectedDate() == null) {
                args.IsValid = false;
            }
        }

    </script>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="Red" ForeColor="White" Style="text-align: left" meta:resourcekey="ValidationSummary1Resource1" />
    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="無影音維護權限" Visible="False" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="無上傳檔案" Visible="False" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="開放終止日期不允許空白" Visible="False" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator>
    <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="起始日不可晚於終止日" Visible="False" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
    <table id="table1" class="PopTable" cellspacing="1" width="100%">
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label3Resource1"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="檔案名稱"
                    meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td style="white-space: nowrap">
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtTopic" runat="server" MaxLength="20" meta:resourcekey="txtTopicResource1"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="rfTopic" runat="server" ErrorMessage="檔案名稱不允許空白" ForeColor="Red"
                                ControlToValidate="txtTopic" Text="*" meta:resourcekey="rfTopicResource1">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label5" runat="server" Text="簡介"
                    meta:resourcekey="Label5Resource1"></asp:Label></td>
            <td style="white-space: nowrap">
                <asp:TextBox ID="txtContext" runat="server"
                    TextMode="MultiLine" Rows="5" Width="100%"
                    meta:resourcekey="txtContextResource1">
                </asp:TextBox></td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label4Resource1"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="開放起始"
                    meta:resourcekey="Label6Resource1"></asp:Label></td>
            <td style="white-space: nowrap">
                <table>
                    <tr>
                        <td>
                            <telerik:RadDatePicker ID="rdpFrom" runat="server"  meta:resourcekey="rdpFromResource1">
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True"></Calendar>

                                <DateInput runat="server" ClientEvents-OnValueChanging="OnValueChanging" LabelWidth="64px" Width="">
                                    <ClientEvents OnValueChanging="OnValueChanging"></ClientEvents>

                                    <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                                    <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                                    <FocusedStyle Resize="None"></FocusedStyle>

                                    <DisabledStyle Resize="None"></DisabledStyle>

                                    <InvalidStyle Resize="None"></InvalidStyle>

                                    <HoveredStyle Resize="None"></HoveredStyle>

                                    <EnabledStyle Resize="None"></EnabledStyle>
                                </DateInput>

                                <DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                            </telerik:RadDatePicker>
                        </td>
                        <td>
                            <asp:CustomValidator ID="rfOpenDate" runat="server" ErrorMessage="開放起始日期不允許空白" Text="*" meta:resourcekey="rfOpenDateResource1" ClientValidationFunction="CheckDate" ForeColor="Red"></asp:CustomValidator>

                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label9Resource1"></asp:Label>
                <asp:Label ID="Label7" runat="server" Text="開放終止"
                    meta:resourcekey="Label7Resource1"></asp:Label></td>
            <td style="white-space: nowrap">
                <table>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:RadioButton ID="rbOpenNoLimit" runat="server" Text="永久開放" GroupName="OpenLimit" Checked="True" meta:resourcekey="rbOpenNoLimitResource1" />
                        </td>
                        <td style="white-space: nowrap">
                            <asp:RadioButton ID="rbOpenLimit" runat="server" Text="開放終止日期"
                                GroupName="OpenLimit" meta:resourcekey="rbOpenLimitResource1" />
                        </td>
                        <td style="white-space: nowrap">
                            <telerik:RadDatePicker ID="rdpTo" runat="server"  meta:resourcekey="rdpToResource1">
                                <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True"></Calendar>

                                <DateInput DisplayDateFormat="yyyy/M/d" DateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                    <EmptyMessageStyle Resize="None"></EmptyMessageStyle>

                                    <ReadOnlyStyle Resize="None"></ReadOnlyStyle>

                                    <FocusedStyle Resize="None"></FocusedStyle>

                                    <DisabledStyle Resize="None"></DisabledStyle>

                                    <InvalidStyle Resize="None"></InvalidStyle>

                                    <HoveredStyle Resize="None"></HoveredStyle>

                                    <EnabledStyle Resize="None"></EnabledStyle>
                                </DateInput>

                                <DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                            </telerik:RadDatePicker>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label10" runat="server" Text="*" ForeColor="Red"
                    meta:resourcekey="Label10Resource1"></asp:Label>
                <asp:Label ID="Label1" runat="server" Text="影音檔案"
                    meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td style="white-space: nowrap">
                <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedMultipleFileSelection="false" AllowedFileType="Video" />
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">
                <asp:Label ID="Label8" runat="server" Text="影音連結網址"
                    meta:resourcekey="Label8Resource1"></asp:Label></td>
            <td style="white-space: nowrap">

                <asp:TextBox ID="txtMovieLink" runat="server" Width="100%"
                    meta:resourcekey="txtMovieLinkResource1">
                </asp:TextBox>
            </td>
        </tr>
    </table>

    <br />
    <table>
        <td>&nbsp;</td>
        <td>
            <asp:Label ID="lblReminderMsg" runat="server" Text="各瀏覽器支援播放格式：" ForeColor="Blue" meta:resourcekey="lblReminderMsgResource1"></asp:Label>
            <table class="lookMAEditTable" style="width: 400px; border: 2px solid black">
                <tr style="background-color: lightgrey">
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="Browser"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text="MP4"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="WMV"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label14" runat="server" Text="WebM"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label15" runat="server" Text="Ogg"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label16" runat="server" Text="MOV"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: lightgrey">
                        <asp:Label ID="Label17" runat="server" Text="IE"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label18" runat="server" Text="YES"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label19" runat="server" Text="YES"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label20" runat="server" Text="NO" ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label21" runat="server" Text="NO" ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label22" runat="server" Text="YES"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: lightgrey">
                        <asp:Label ID="Label23" runat="server" Text="Chrome"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label24" runat="server" Text="YES"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label25" runat="server" Text="NO" ForeColor="Red"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label26" runat="server" Text="YES"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label27" runat="server" Text="YES"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label28" runat="server" Text="YES"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="background-color: lightgrey">
                        <asp:Label ID="Label29" runat="server" Text="Firefox"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label30" runat="server" Text="YES"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label31" runat="server" Text="YES"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label32" runat="server" Text="YES"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label33" runat="server" Text="YES"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label34" runat="server" Text="NO" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblMp4Limit" runat="server" Text="備註：MP4編碼Code須為H.264才能正常播放" ForeColor="Blue" meta:resourcekey="lblMp4LimitResource1"></asp:Label>
        </td>
        <td></td>
    </table>
    <asp:HiddenField ID="hidFileGroupID" runat="server" />
    <asp:HiddenField ID="hidMovieID" runat="server" />
    <asp:HiddenField runat="server" ID="hfCurrentUser"></asp:HiddenField>
</asp:Content>
