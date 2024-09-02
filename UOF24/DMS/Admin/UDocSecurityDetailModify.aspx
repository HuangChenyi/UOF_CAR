<%@ Page Title="離線文件資訊維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="UDocSecurityDetailModify.aspx.cs" Inherits="Ede.Uof.Web.DMS.Admin.UDocSecurityDetailModify" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        
        Sys.Application.add_load(cbwatermarkClick);
        function cbwatermarkClick() {
            var txtDefText = $("#<%= txtDefText.ClientID %>");
            var ischkDefText = $("#<%=cbwatermark.ClientID %>").is(":checked");
            if (ischkDefText) {
                $("#<%=txtDefText.ClientID %>").prop("disabled", false);
            } else {
                $("#<%=txtDefText.ClientID %>").prop("disabled", true);
            }
        }

        $(function () {
            ChangeInvalid();
        });
        function ChangeInvalid() {
            var rbtnNoExpiry = $("#<%=rbtnNoExpiry.ClientID%>");
            var rdpExpiryDate = $find("<%= rdpExpiryDate.ClientID %>");
            if (rdpExpiryDate) {
                if (typeof (rbtnNoExpiry) != "undefined" && typeof (rdpExpiryDate) != "undefined") {
                    if ($("#<%=rbtnNoExpiry.ClientID%>").is(":checked"))        //rdoInvalid1.checked
                        rdpExpiryDate.set_enabled(false);  //WebDateChooser2.disabled = true;        
                    else
                        rdpExpiryDate.set_enabled(true);   //WebDateChooser2.disabled = false;             
                }
            }
        }      
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable">
                <tr>
                    <td style="width: 10%">
                        <span style="color: #ff0000">*</span>
                        <asp:Label ID="lblDocPW" runat="server" Text="密碼" meta:resourcekey="lblDocPWResource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" autocomplete="off" MaxLength="20" Width="200px" BorderStyle="Groove" meta:resourcekey="txtPasswordResource1"></asp:TextBox>
                        <asp:CustomValidator ID="cvRequiredPassword" runat="server" Display="Dynamic" ErrorMessage="必填" meta:resourcekey="cvRequiredPasswordResource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 10%">
                        <span style="color: #ff0000">*</span>
                        <asp:Label ID="Label1" runat="server" Text="確認密碼" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" autocomplete="off" MaxLength="20" Width="200px" BorderStyle="Groove" meta:resourcekey="txtConfirmPasswordResource1"></asp:TextBox>
                        <asp:CompareValidator ID="CompareConfirmPassword" runat="server" ControlToCompare="txtPassword"
                            ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="密碼不符,請重新輸入密碼" ForeColor="Red"
                            SetFocusOnError="True" meta:resourcekey="CompareConfirmPasswordResource1"></asp:CompareValidator>
                        <asp:CustomValidator ID="cvRequiredConfirmPassword" runat="server" Display="Dynamic" ErrorMessage="必填" meta:resourcekey="cvRequiredConfirmPasswordResource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 10%">
                        <asp:Label ID="lblDocOpenTimes" runat="server" Text="可開啟次數" meta:resourcekey="lblDocOpenTimesResource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <telerik:RadNumericTextBox ID="rntxDocOpenTimes" runat="server" Width="200px" DataType="System.Int32" Culture="zh-TW" DbValueFactor="1" LabelCssClass="" LabelWidth="64px" meta:resourcekey="rntxDocOpenTimesResource1">
                            <NegativeStyle Resize="None"></NegativeStyle>
                            <NumberFormat ZeroPattern="n" AllowRounding="False" DecimalDigits="0" GroupSeparator="" GroupSizes="3"></NumberFormat>
                            <EmptyMessageStyle Resize="None"></EmptyMessageStyle>
                            <ReadOnlyStyle Resize="None"></ReadOnlyStyle>
                            <FocusedStyle Resize="None"></FocusedStyle>
                            <DisabledStyle Resize="None"></DisabledStyle>
                            <InvalidStyle Resize="None"></InvalidStyle>
                            <HoveredStyle Resize="None"></HoveredStyle>
                            <EnabledStyle Resize="None"></EnabledStyle>
                        </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td rowspan="2" style="width: 10%">
                        <asp:Label ID="lblExpiryDate" runat="server" Text="有效日期" meta:resourcekey="lblExpiryDateResource1"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:RadioButton ID="rbtnNoExpiry" Text="永不過期" GroupName="Invalid" Checked="True" runat="server" meta:resourcekey="rbtnNoExpiryResource1" />
                    </td>
                </tr>
                <tr>
                    <td class="PopTableRightTD" style="width: 80%; text-align: left;" colspan="3">
                        <asp:RadioButton ID="rbtnDateSetting" Text="日期設定" GroupName="Invalid" runat="server" meta:resourcekey="rbtnDateSettingResource1" />
                        <telerik:RadDatePicker ID="rdpExpiryDate" runat="server" meta:resourcekey="rdpExpiryDateResource1">
                            <Calendar EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" Culture="zh-TW">
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
                        <asp:CustomValidator ID="cvExpiryDateError" runat="server" Display="Dynamic" ErrorMessage="有效日期不能小於系統時間" meta:resourcekey="cvExpiryDateErrorResource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 10%">
                        <asp:Label ID="lblLimitIP" runat="server" Text="IP限定" meta:resourcekey="lblLimitIPResource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <table>
                            <tr>
                                <td style="resize: vertical;">
                                    <asp:Repeater ID="IPRangerRepeater" runat="server" OnItemDataBound="IPRangerRepeater_ItemDataBound">
                                        <HeaderTemplate>
                                            <table>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <telerik:RadTextBox ID="rtxtIPStart" runat="server" Width="200px" LabelCssClass="" LabelWidth="64px" Resize="None" meta:resourcekey="rtxtIPStartResource1">
                                                        <EmptyMessageStyle Resize="None" />
                                                        <ReadOnlyStyle Resize="None" />
                                                        <FocusedStyle Resize="None" />
                                                        <DisabledStyle Resize="None" />
                                                        <InvalidStyle Resize="None" />
                                                        <HoveredStyle Resize="None" />
                                                        <EnabledStyle Resize="None" />
                                                    </telerik:RadTextBox>
                                                    <asp:RegularExpressionValidator
                                                        ID="RegularExpressionValidator4" runat="server" ControlToValidate="rtxtIPStart"
                                                        Display="Dynamic" ErrorMessage="IP格式不正確" SetFocusOnError="True" ValidationExpression="^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$" meta:resourcekey="RegularExpressionValidator4Resource1"></asp:RegularExpressionValidator>
                                                    <asp:CustomValidator ID="cvFillInIPStart" runat="server" Display="Dynamic" ErrorMessage="請填入ip位址" meta:resourcekey="cvFillInIPStartResource1"></asp:CustomValidator>
                                                    <asp:Label ID="Label2" runat="server" Text="~" meta:resourcekey="Label2Resource1"></asp:Label>
                                                    <telerik:RadTextBox ID="rtxtIPEnd" runat="server" Width="200px" LabelCssClass="" LabelWidth="64px" Resize="None" meta:resourcekey="rtxtIPEndResource1">
                                                        <EmptyMessageStyle Resize="None" />
                                                        <ReadOnlyStyle Resize="None" />
                                                        <FocusedStyle Resize="None" />
                                                        <DisabledStyle Resize="None" />
                                                        <InvalidStyle Resize="None" />
                                                        <HoveredStyle Resize="None" />
                                                        <EnabledStyle Resize="None" />
                                                    </telerik:RadTextBox>
                                                    <asp:RegularExpressionValidator
                                                        ID="RegularExpressionValidator1" runat="server" ControlToValidate="rtxtIPEnd"
                                                        Display="Dynamic" ErrorMessage="IP格式不正確" SetFocusOnError="True" ValidationExpression="^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
                                                    <asp:CustomValidator ID="cvFillInIPEnd" runat="server" Display="Dynamic" ErrorMessage="請填入ip位址" meta:resourcekey="cvFillInIPEndResource1"></asp:CustomValidator>
                                                    <asp:CustomValidator ID="cvRangeCheck" runat="server" Display="Dynamic" ErrorMessage="IP區段設定不正確" SetFocusOnError="True" meta:resourcekey="cvRangeCheckResource1"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </td>
                                <td style="vertical-align: bottom;">
                                    <table>
                                        <tr>
                                            <td style="padding: 0px 0px 5px 1px;">
                                                <asp:ImageButton ID="ibtnAddLimitIP" runat="server" ImageUrl="~/Common/Images/Icon/icon_j13.gif" ToolTip="新增" OnClick="ibtnAddLimitIP_Click" meta:resourcekey="ibtnAddLimitIPResource1" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 10%">
                        <asp:Label ID="lblCustomFileName" runat="server" Text="自訂檔名" meta:resourcekey="lblCustomFileNameResource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:Label ID="lblRealCustomFileName" runat="server" meta:resourcekey="lblRealCustomFileNameResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 10%">
                        <asp:Label ID="lblwatermark" runat="server" Text="文字浮水印" meta:resourcekey="lblwatermarkResource1"></asp:Label>
                    </td>
                    <td colspan="1" style="width: 10%">
                        <table>
                            <tr>
                                <td>
                                    <tr>
                                        <td colspan="2">
                                            <asp:CheckBox ID="cbwatermark" Text="加入自訂內容" runat="server" OnClick="cbwatermarkClick()" meta:resourcekey="cbwatermarkResource1" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbltextcontent" runat="server" Text="文字內容:" meta:resourcekey="lbltextcontentResource1" />
                                        </td>
                                        <td>
                                           <asp:TextBox ID="txtDefText" runat="server" MaxLength="150" meta:resourceKey="txtDefTextResource1" Rows="5" TextMode="MultiLine" Width="280px"></asp:TextBox>
                                        </td>                             
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:CustomValidator ID="cvDefText" runat="server" Display="Dynamic" ErrorMessage="請填寫文字內容" meta:resourcekey="cvDefTextResource1"></asp:CustomValidator><br>
                                            <asp:Label ID="lblwatermarkinfo" runat="server" Text="可於此處設定要增加顯示的文字浮水印" ForeColor="Blue" meta:resourcekey="lblwatermarkinfoResource1" />                                           
                                        </td>
                                    </tr>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td colspan="2" style="width: 30%" class="PopTableRightTD">
                        <table style="text-align: left">
                            <tr>
                                <td>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblRotation" runat="server" Text="旋轉角度:" meta:resourcekey="lblRotationResource1" />
                                            <asp:DropDownList ID="ddlTxtRotation" runat="server" meta:resourcekey="ddlTxtRotationResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource1" Selected="True">0</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource2">5</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource4">10</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource7">15</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource8">20</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource9">25</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource10">30</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource11">35</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource12">40</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource13">45</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource14">50</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource15">55</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource16">60</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource17">65</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource18">70</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource19">75</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource20">80</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource21">85</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource22">90</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblWatrMarkColor" runat="server" Text="文字顏色:" meta:resourcekey="lblWatrMarkColorResource1" />
                                                    </td>
                                                    <td  style="padding-left:5px">
                                                        <telerik:RadColorPicker ID="RadWatrMarkColor" runat="server" Preset="Standard" ShowIcon="True" EnableCustomColor="True" ShowRecentColors="True" ShowEmptyColor="False" Width="300px" Columns="12" SelectedColor="" meta:resourcekey="ColorPicker1Resource1"></telerik:RadColorPicker>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblTxtSize" runat="server" Text="文字大小:" meta:resourcekey="lblTxtSizeResource1" />
                                            <asp:DropDownList ID="ddlTxtSize" runat="server" meta:resourcekey="ddlTxtSizeResource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource83">5</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource84">10</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource85">15</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource86" Selected="True">20</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource87">25</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource88">30</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource89">35</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource90">40</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource91">45</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource92">50</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource93">55</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource94">60</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource95">65</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource96">70</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource97">75</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource98">80</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-left:20px">
                                            <asp:Label ID="lblTransparency" runat="server" Text="透明度:" meta:resourcekey="lblTransparencyResource1" />
                                            <asp:DropDownList ID="ddlTransparency1" runat="server" meta:resourcekey="ddlTransparency1Resource1">
                                                <asp:ListItem meta:resourcekey="ListItemResource99">0</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource100">10</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource101">20</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource102">30</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource103">40</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource104">50</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource105">60</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource106">70</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource107" Selected="True">80</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource108">90</asp:ListItem>
                                                <asp:ListItem meta:resourcekey="ListItemResource109">100</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="white-space: nowrap">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblTxtPosition" runat="server" Text="顯示位置:" meta:resourcekey="lblTxtPositionResource1" />
                                                    </td>
                                                    <td>
                                                        <div id="txtPosition">
                                                            <asp:RadioButtonList ID="rdlTxtPosition" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rdoTxtPositionResource1" RepeatColumns="2">
                                                                <asp:ListItem Value="PosAll" meta:resourcekey="ListItemResource34" Text="全部填滿" Selected="True"></asp:ListItem>
                                                                <asp:ListItem Value="PosCenter" meta:resourcekey="ListItemResource35" Text="置中"></asp:ListItem>
                                                                <asp:ListItem Value="PosLeftUp" meta:resourcekey="ListItemResource36" Text="左上角"></asp:ListItem>
                                                                <asp:ListItem Value="PosRightUp" meta:resourcekey="ListItemResource37" Text="右上角"></asp:ListItem>
                                                                <asp:ListItem Value="PosLeftDown" meta:resourcekey="ListItemResource38" Text="左下角"></asp:ListItem>
                                                                <asp:ListItem Value="PosRightDown" meta:resourcekey="ListItemResource39" Text="右下角"></asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 10%">
                        <asp:Label ID="lblComment" runat="server" Text="備註" meta:resourcekey="lblCommentResource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <telerik:RadTextBox ID="txtComment" runat="server" TextMode="MultiLine" Width="100%" Height="150px" LabelCssClass="" LabelWidth="64px" Resize="None" meta:resourcekey="txtCommentResource1">
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </telerik:RadTextBox>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblUDocViewerDL" runat="server" Text="離線文件檢視器下載 http://www.edetw.com/office/UDocViewer.zip" CssClass="SizeMemo" meta:resourcekey="lblUDocViewerDLResource1"></asp:Label>
            <br />
            <asp:Label ID="lblViewerDLMemo" runat="server" Text="請將此位址寄送給需要觀看離線文件的使用者" CssClass="SizeMemo" meta:resourcekey="lblViewerDLMemoResource1"></asp:Label>
            <asp:HiddenField ID="hidIPValue" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
