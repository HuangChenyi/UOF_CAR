<%@ Page Title="新增/修改文件編號字軌" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master"
    AutoEventWireup="true" Inherits="DMS_DocStore_AddAutoSerial" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="AddAutoSerial.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table width="100%" class="PopTable" cellspacing="1">
                <colgroup class="PopTableLeftTD">
                </colgroup>
                <colgroup class="PopTableRightTD">
                </colgroup>
                <tr>
                    <td style="width: 25%">
                        <font color="red">*</font><asp:Label ID="lblTrackId" runat="server" Text="字軌" 
                            meta:resourcekey="lblTrackIdResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTrackId" runat="server" Width="200px" MaxLength="20" 
                            meta:resourcekey="txtTrackIdResource1" ></asp:TextBox>
                        <asp:Label ID="labTrackId" runat="server" meta:resourcekey="labTrackIdResource1"></asp:Label><asp:RequiredFieldValidator ID="RequiredFieldValidatorTrackId" runat="server" 
                            ErrorMessage="請輸入字軌編號" ControlToValidate="txtTrackId" Display="Dynamic" 
                            meta:resourcekey="RequiredFieldValidatorTrackIdResource1"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="CustomValidatorTrackId" runat="server" ErrorMessage="字軌編號重複"
                            Display="Dynamic" meta:resourcekey="CustomValidatorTrackIdResource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 25%">
                        <asp:Label ID="Label1" runat="server" Text="編碼原則" meta:resourcekey="Label1Resource1"></asp:Label>
                    </td>
                    <td >
                        <table style="width:100%;">
                            <tr>
                                <td>
                                    <asp:CheckBox ID="cbEnableYear" Text="加上年份" AutoPostBack="True" runat="server" OnCheckedChanged="cbEnableYear_CheckedChanged" meta:resourcekey="cbEnableYearResource1" />
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rblYearDigit" Enabled="False" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rblYearDigitResource1">
                                        <asp:ListItem Value="2" meta:resourcekey="ListItemResource1">西元年後2位</asp:ListItem>
                                        <asp:ListItem Value="4" meta:resourcekey="ListItemResource2">西元年4位</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:CustomValidator ID="cvNoYearDigitError" runat="server"  ErrorMessage="請選擇西元年位數" Display="Dynamic" meta:resourcekey="cvNoYearDigitErrorResource1"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CheckBox ID="cbEnableMonth" Text="加上月份" runat="server" meta:resourcekey="cbEnableMonthResource1" />
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="Label2" runat="server" Text="註:字軌+西元年+月份(2碼)+流水號" CssClass="SizeMemo" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 25%">
                        <font color="red">*</font><asp:Label ID="lblTrackLength" runat="server" 
                            Text="流水號位數" meta:resourcekey="lblTrackLengthResource1"></asp:Label>
                    </td>
                    <td >
                        <telerik:RadNumericTextBox ID="txtTrackLength" runat="server" Width="200px" Value="1" MinValue="1" MaxValue="25" DataType="System.Int32" Culture="zh-TW" DbValueFactor="1" LabelCssClass="" LabelWidth="64px" meta:resourcekey="txtTrackLengthResource2">
                            <NumberFormat ZeroPattern="n" DecimalDigits="0"></NumberFormat>
                        </telerik:RadNumericTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLength" runat="server" 
                            ErrorMessage="請輸入流水號長度" ControlToValidate="txtTrackLength" Display="Dynamic" 
                            meta:resourcekey="RequiredFieldValidatorLengthResource1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
