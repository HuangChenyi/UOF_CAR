<%@ Page Title="行程資訊" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="MaintainTravelDetails.aspx.cs" Inherits="Ede.Uof.Web.HR104.Duty.Form.MaintainTravelDetails" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Panel ID="plTravel" runat="server" Visible="true">
                <table class="PopTable">
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label2" runat="server" Text="啟程時間" meta:resourcekey="Label2Resource1"></asp:Label>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <telerik:RadDatePicker ID="rdStartDate" runat="server" AutoPostBack="True" OnSelectedDateChanged="rdStartDate_SelectedDateChanged" meta:resourcekey="rdStartDateResource1">
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblStartDate" runat="server" Visible="False" meta:resourcekey="lblStartDateResource1"></asp:Label>
                                        <telerik:RadTimePicker ID="rdStartTime" runat="server" meta:resourcekey="rdStartTimeResource1">
                                        </telerik:RadTimePicker>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label4" runat="server" Text="迄程時間" meta:resourcekey="Label4Resource1"></asp:Label>
                        </td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <telerik:RadDatePicker ID="rdEndDate" runat="server" meta:resourcekey="rdEndDateResource1">
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblEndDate" runat="server" Visible="False" meta:resourcekey="lblEndDateResource1"></asp:Label>
                                        <telerik:RadTimePicker ID="rdEndTime" runat="server" meta:resourcekey="rdEndTimeResource1">
                                        </telerik:RadTimePicker>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label5" runat="server" Text="出發地點" meta:resourcekey="Label5Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlDepature" runat="server" meta:resourcekey="ddlDepatureResource1"></asp:DropDownList>
                            <telerik:RadDropDownList ID="rddlDepature" runat="server" style="display: none" meta:resourcekey="rddlDepatureResource1"></telerik:RadDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label6" runat="server" Text="停留地點" meta:resourcekey="Label6Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlDestnation" runat="server" meta:resourcekey="ddlDestnationResource1"></asp:DropDownList>
                            <telerik:RadDropDownList ID="rddlDestnation" runat="server" style="display: none" meta:resourcekey="rddlDestnationResource1"></telerik:RadDropDownList>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
             <asp:Label ID="lblNotFoundView" runat="server" Text="取得資料發生問題，請回報系統管理員。" Visible="false" ForeColor="Red" meta:resourcekey="lblNotFoundViewResource1"></asp:Label>
            <asp:TextBox ID="txtDetail" runat="server" Style="display: none" meta:resourcekey="txtDetailResource1"></asp:TextBox>
            <asp:HiddenField ID="hfUI" runat="server" />
            <asp:Label ID="lblGoBack" runat="server" Text="返回" Visible="False" meta:resourcekey="lblGoBackResource1"></asp:Label>
            <asp:CustomValidator ID="cvCheckDate" runat="server" ErrorMessage="結束日期早於開始日期，請重新選擇。" Display="Dynamic" meta:resourcekey="cvCheckDateResource1"></asp:CustomValidator>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
