<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="PlantExceptionDialog.aspx.cs" Inherits="Ede.Uof.Web.EIP.Plant.PlantExceptionDialog" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <table cellspacing="0" class="PopTable">
        <tr>
            <td style="white-space: nowrap;">

                <asp:Label ID="lblPlantName" runat="server" Text="名稱" meta:resourcekey="lblPlantNameResource1"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
            </td>

        </tr>
        <tr>
            <td style="white-space: nowrap;">
                <span style="color: #ff0000">*</span>
                <asp:Label ID="lblNotBorrow" runat="server" Text="不可借用日期" meta:resourcekey="lblNotBorrowResource1"></asp:Label>

            </td>
            <td>
                <telerik:RadDatePicker ID="rdpStartDate" runat="server" meta:resourcekey="rdpStartDateResource1">
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

                <asp:Label ID="Label1" runat="server" Text="~" meta:resourcekey="Label1Resource1"></asp:Label>

                <telerik:RadDatePicker ID="rdpEndDate" runat="server" meta:resourcekey="rdpEndDateResource1">
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

                <asp:CustomValidator ID="CustomValidator1" runat="server"  ForeColor="Red" Display="Dynamic"
                    ErrorMessage="不允許空白" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator><br />
                <asp:CustomValidator ID="CustomValidator2" runat="server" ForeColor="Red" Display="Dynamic"
                    ErrorMessage="結束日需晚於開始日" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap;">
                <asp:Label ID="lblDescription" runat="server" Text="原因" meta:resourcekey="lblDescriptionResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDescription" Rows="3" runat="server" TextMode="MultiLine" Style="width: 90%;" MaxLength="255" meta:resourcekey="txtDescriptionResource1"></asp:TextBox>
            </td>
        </tr>
    </table>

    <asp:HiddenField ID="hfPlantId" runat="server" />

</asp:Content>
