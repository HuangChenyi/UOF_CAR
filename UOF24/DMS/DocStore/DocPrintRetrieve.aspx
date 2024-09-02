<%@ Page Title="回收分發紀錄" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocPrintRetrieve" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="DocPrintRetrieve.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        Sys.Application.add_load(
            function () {
                var curwindow = $uof.dialog.getOpener();
                var pd;
                if (curwindow) {
                    $("#<%=hidPrintCount.ClientID%>").val(curwindow.$telerik.findNumericTextBox('<%=Request.QueryString["printObj"] %>').get_value());
                }
            }
            );
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table class="PopTable">
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="回收時間" meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadDateTimePicker ID="rdtRetrieveTime" runat="server" meta:resourcekey="rdtRetrieveTimeResource1">
                        </telerik:RadDateTimePicker>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap">
                        <asp:Label ID="Label2" runat="server" Text="回收份數" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="rnumRetrieveCount" runat="server" DataType="System.Int32" Width="50px" MaxLength="2" MinValue="0" MaxValue="99" Culture="zh-TW" DbValueFactor="1" LabelCssClass="" LabelWidth="64px" meta:resourcekey="rnumRecycleCountResource1">
                            <NegativeStyle Resize="None" />
                            <NumberFormat ZeroPattern="n" DecimalDigits="0" ></NumberFormat>
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </telerik:RadNumericTextBox>
                       
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="遺失份數" meta:resourcekey="Label5Resource1"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadNumericTextBox ID="rnumVoidCount" runat="server" Width="50px" MaxLength="2" MinValue="0" MaxValue="99" Culture="zh-TW" DbValueFactor="1" LabelCssClass="" LabelWidth="64px" meta:resourcekey="rnumVoidCountResource1">
                            <NegativeStyle Resize="None" />
                            <NumberFormat ZeroPattern="n" DecimalDigits="0" ></NumberFormat>
                            <EmptyMessageStyle Resize="None" />
                            <ReadOnlyStyle Resize="None" />
                            <FocusedStyle Resize="None" />
                            <DisabledStyle Resize="None" />
                            <InvalidStyle Resize="None" />
                            <HoveredStyle Resize="None" />
                            <EnabledStyle Resize="None" />
                        </telerik:RadNumericTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="備註" meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" Rows="5" Width="100%" meta:resourcekey="txtRemarkResource1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="建立人員" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCreator" runat="server" meta:resourcekey="lblCreatorResource1"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="hidVoidCount" runat="server" />
            <asp:HiddenField ID="hidRetrieveCount" runat="server" />
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:Label ID="lblCountErr" runat="server" Text="總回收份數(含遺失份數)大於分發份數" Visible="False" meta:resourcekey="lblCountErrResource1"></asp:Label>
            <asp:HiddenField ID="hidPrintCount" runat="server" />
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

