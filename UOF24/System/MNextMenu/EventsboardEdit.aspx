<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="EventsboardEdit.aspx.cs" Inherits="System_MNextMenu_EventsboardEdit" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <script type="text/javascript">
        function cvCheckFileCenter(source, args) {           
            var file = $find('<%=UC_FileCenter.ClientID%>'); 
           
            if (file.get_count() == 0 ) {
                args.IsValid = false;
                return;
            }
        }                
    </script>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <table border="0" class="PopTable" style="width: 100%">
                <tr>
                    <td style="white-space: nowrap; text-align: right" class="PopTableLeftTD">
                        <asp:Label ID="lblmark1" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblmark1Resource1" />
                        <asp:Label ID="lblName" runat="server" Text="名稱" meta:resourcekey="lblNameResource1" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtname" runat="server" MaxLength="50" meta:resourcekey="txtnameResource1" />
                        <br>
                         <asp:RequiredFieldValidator ID="rvValidname" ControlToValidate="txtname" Display="Dynamic" runat="server" ErrorMessage="請輸入名稱" meta:resourcekey="cvValidnameResource1"></asp:RequiredFieldValidator>        
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap; text-align: right" class="PopTableLeftTD">
                        <asp:Label ID="lblmark2" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblmark2Resource1" />
                        <asp:Label ID="lblInfo" runat="server" Text="內容" meta:resourcekey="lblInfoResource1" />
                    </td>
                    <td colspan="3">
                        <table>
                            <tr>
                                <td>
                                    <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedFileType="Image" AllowedMultipleFileSelection="false" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic"  ClientValidationFunction="cvCheckFileCenter" ErrorMessage="請選擇檔案" meta:resourcekey="cvFileCenterResource1"></asp:CustomValidator>                                  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblmsg" runat="server" Text="【使用限制】" ForeColor="Blue" meta:resourcekey="lblmsgResource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblmsg1" runat="server" Text="1.支援文件格式：jpg、png、bmp、gif。" ForeColor="Blue" meta:resourcekey="lblmsg1Resource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblmsg2" runat="server" Text="2.建議圖片大小：750(w)*400(h)。" ForeColor="Blue" meta:resourcekey="lblmsg2Resource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblmsg3" runat="server" Text="3.只能上傳一個檔案。" ForeColor="Blue" meta:resourcekey="lblmsg3Resource1"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap; text-align: right" class="PopTableLeftTD">
                        <asp:Label ID="lblmark3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblmark3Resource1" />
                        <asp:Label ID="lblPunlishDate" runat="server" Text="上架時間" meta:resourcekey="lblPunlishDateResource1" />
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="radPunlishDate" runat="server" meta:resourcekey="radPunlishDateResource1">
                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

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
                        <br>
                        <asp:CustomValidator ID="cvVaildPunlishDate" runat="server" Display="Dynamic" ErrorMessage="請輸入日期" meta:resourcekey="cvVaildPunlishDateResource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap; text-align: right" class="PopTableLeftTD">
                        <asp:Label ID="lblmark4" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblmark4Resource1" />
                        <asp:Label ID="lblExpireDate" runat="server" Text="下架時間" meta:resourcekey="lblExpireDateResource1" />
                    </td>
                    <td>
                        <asp:RadioButton ID="rbtnPermanent" runat="server" GroupName="expire" Text="永久開放" AutoPostBack="True" OnCheckedChanged="rbtnPermanent_CheckedChanged" meta:resourcekey="rbtnPermanentResource1" />
                        <asp:RadioButton ID="rbtnSetTimeExpire" runat="server" GroupName="expire" Text="開放終止時間" AutoPostBack="True" OnCheckedChanged="rbtnPermanent_CheckedChanged" meta:resourcekey="rbtnSetTimeExpireResource1" />
                        <telerik:RadDatePicker ID="radSetTimeExpire" runat="server" meta:resourcekey="radSetTimeExpireResource1">
                            <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

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
                        <br>
                        <asp:CustomValidator ID="cvVaildSetTimeExpireDate" runat="server" Display="Dynamic" ErrorMessage="請輸入日期" meta:resourcekey="cvVaildSetTimeExpireDateResource1"></asp:CustomValidator>
                        <asp:CustomValidator ID="cvVaildCompareDate" runat="server" Display="Dynamic" ErrorMessage="下架時間不可早於上架時間" meta:resourcekey="cvVaildCompareDateResource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap; text-align: right" class="PopTableLeftTD">
                        <asp:Label ID="lblUserSetTitle" runat="server" Text="可觀看人員" meta:resourcekey="lblUserSetTitleResource1" />
                    </td>
                    <td>
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceListUsers" ExpandToUser="false" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="hfCurrentUserGuid" runat="server" />
            <asp:HiddenField ID="hfEventsboardGuid" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
