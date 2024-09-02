<%@ Page Title="新增/維護活動內容" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="EventsBoardEdit.aspx.cs" Inherits="Ede.Uof.Web.EIP.EventsBoard.CreateEventsBoard" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        function cvCheckName(source, args) {
            var name = $('#<%=txtName.ClientID %>').val();           
            if (name == '' || name == null) {
                args.IsValid = false;
                return;
            }
        }

        function cvCheckPublishDate(source, args) {          
            var publishDate = $find('<%=radDPPublishDate.ClientID %>').get_selectedDate();        

            if (publishDate == '' || publishDate == null) {
                 args.IsValid = false;
                 return;
             }
        }

        function cvCheckExpireDate(source, args) {          
            var selectItem = $("input[id^='<%=rdoExpire.ClientID %>']:checked").val() ;      
            if (selectItem==1) {
                var expireDate = $find('<%=radDPExpireDate.ClientID %>').get_selectedDate();
                if (expireDate == '' || expireDate == null) {
                    args.IsValid = false;
                    return;
                }
                else {
                    // 判斷下架時間是否小於上架時間
                    if ($find('<%=radDPExpireDate.ClientID %>').get_selectedDate() <= $find('<%=radDPPublishDate.ClientID %>').get_selectedDate()) {
                        source.innerText = $("#<%=lblDateCompareError.ClientID%>").text();
                        args.IsValid = false;
                        return;
                    }
                }
            }
        }

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
            <table class ="PopTable" style="width:100%">
                <tr>
                    <td style="width:20%">
                        <asp:Label ID="lblMarkOne" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblMarkOneResource1"></asp:Label>
                        <asp:Label ID="lblEventsName" runat="server" Text="名稱" meta:resourcekey="lblEventsNameResource1" ></asp:Label>
                    </td>
                    <td style="width:80%">
                        <asp:TextBox ID="txtName" runat="server" Width="100%" meta:resourcekey="txtNameResource1"></asp:TextBox>
                         <asp:CustomValidator ID="cvName" runat="server" Display="Dynamic" ErrorMessage="請填入名稱" ClientValidationFunction="cvCheckName" meta:resourcekey="cvNameResource1"></asp:CustomValidator>                  
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblMarkTwo" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblMarkTwoResource1"></asp:Label>
                        <asp:Label ID="lblContent" runat="server" Text="內容" meta:resourcekey="lblContentResource1" ></asp:Label>
                    </td>        
                    <td colspan="3">
                        <table>
                            <tr>
                                <td>
                                    <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" AllowedFileType="Image" AllowedMultipleFileSelection="false" />
                                    <asp:CustomValidator ID="cvFileCenter" runat="server" Display="Dynamic" ErrorMessage="請上傳照片" ClientValidationFunction="cvCheckFileCenter" meta:resourcekey="cvFileCenterResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblRemind" runat="server" Text="【使用限制】" ForeColor="Blue" meta:resourcekey="lblRemindResource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblNoteOne" runat="server" Text="1.支援文件格式：jpg、png、bmp、gif。" ForeColor="Blue" meta:resourcekey="lblNoteOneResource1"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblNoteTwo" runat="server" Text="2.只能上傳一個檔案。" ForeColor="Blue" meta:resourcekey="lblNoteTwoResource1"></asp:Label>
                                </td>
                            </tr>
                        </table>                  
                    </td>
                </tr>
                  <tr>
                    <td style="white-space:nowrap;" >
                        <asp:Label ID="lblMarkThee" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblMarkTheeResource1"></asp:Label>
                        <asp:Label ID="lblPublishDate" runat="server" Text="上架時間" meta:resourcekey="lblPublishDateResource1" ></asp:Label>
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="radDPPublishDate" runat="server" meta:resourcekey="radDPPublishDateResource1">
                            <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                            </Calendar>
                            <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                <EmptyMessageStyle Resize="None" />
                                <ReadOnlyStyle Resize="None" />
                                <FocusedStyle Resize="None" />
                                <DisabledStyle Resize="None" />
                                <InvalidStyle Resize="None" />
                                <HoveredStyle Resize="None" />
                                <EnabledStyle Resize="None" />
                            </DateInput>
                            <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                        </telerik:RadDatePicker>
                        <asp:CustomValidator ID="cvPublishDate" runat="server" Display="Dynamic" ErrorMessage="請輸入日期" ClientValidationFunction="cvCheckPublishDate" meta:resourcekey="cvPublishDateResource1"></asp:CustomValidator>
                    </td>
                </tr>
                  <tr>
                    <td>
                        <asp:Label ID="lblMarkFour" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblMarkFourResource1"></asp:Label>
                        <asp:Label ID="lblExpireDate" runat="server" Text="下架時間" meta:resourcekey="lblExpireDateResource1" ></asp:Label>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:RadioButtonList ID="rdoExpire" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rdoExpire_SelectedIndexChanged" AutoPostBack="True" meta:resourcekey="rdoExpireResource1">
                                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource1" >永久開放</asp:ListItem>
                                        <asp:ListItem Value="1" meta:resourcekey="ListItemResource2">開放終止時間</asp:ListItem>
                                    </asp:RadioButtonList> 
                                </td>
                                <td>
                                    <telerik:RadDatePicker ID="radDPExpireDate" runat="server" meta:resourcekey="radDPExpireDateResource1">
                                        <Calendar Culture="zh-TW" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                                        </Calendar>
                                        <DateInput DateFormat="yyyy/M/d" DisplayDateFormat="yyyy/M/d" LabelWidth="64px" Width="">
                                            <EmptyMessageStyle Resize="None" />
                                            <ReadOnlyStyle Resize="None" />
                                            <FocusedStyle Resize="None" />
                                            <DisabledStyle Resize="None" />
                                            <InvalidStyle Resize="None" />
                                            <HoveredStyle Resize="None" />
                                            <EnabledStyle Resize="None" />
                                        </DateInput>
                                        <DatePopupButton CssClass="" HoverImageUrl="" ImageUrl="" />
                                    </telerik:RadDatePicker>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="cvExpireDate" runat="server" Display="Dynamic" ErrorMessage="請輸入日期" ClientValidationFunction="cvCheckExpireDate" meta:resourcekey="cvExpireDateResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                        </table>          
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
         </ContentTemplate>
      </asp:UpdatePanel>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:Label ID="lblDateCompareError" runat="server" Text="下架時間不可早於上架時間" style="display: none;" meta:resourcekey="lblDateCompareErrorResource1"></asp:Label>
</asp:Content>
