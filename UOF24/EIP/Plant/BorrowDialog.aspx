<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Test_Borrow_BorrowDialog" Title="預約時間" meta:resourcekey="PageResource1" Culture="auto" UICulture="auto" CodeBehind="BorrowDialog.aspx.cs" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            var isPostBack = $("#<%=hfIsPostBack.ClientID%>");
            if (isPostBack.val() == 'false') {
                isPostBack.val('true');
                var curwindow = $uof.dialog.getOpener();
                var pd;
                if (curwindow) {
                    pd = curwindow.document;
                } else if (typeof (dialogArguments) != "undefined") {
                    pd = dialogArguments.document;
                }
                var borrowPlants = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["borrowPlants"],true)%>');
                var hfVal = $("#" + borrowPlants, pd).val();
                if (pd) {
                    $("#<%=hfborrowplant.ClientID%>").val(hfVal);
                }
                $("#<%=btnPostBack.ClientID%>").click();
            }
        });
    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="設備已被預訂,無法新增借用" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="結束時間需大於開始時間"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage=""></asp:CustomValidator>
            <table cellspacing="0" class="PopTable">
                <tr>
                    <td style="white-space: nowrap;">
                        <span style="color: #ff0000">*</span><asp:Label ID="lbLeftBegin" runat="server" Text="開始時間" meta:resourcekey="lbLeftBeginResource1"></asp:Label></td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <telerik:RadDateTimePicker ID="RadDateTimePicker1" runat="server">
                                    </telerik:RadDateTimePicker>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="請填寫開始時間" ForeColor="Red" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator></td>

                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span style="color: #ff0000">*</span><asp:Label ID="lbLeftEnd" runat="server" Text="結束時間" meta:resourcekey="lbLeftEndResource1"></asp:Label></td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <telerik:RadDateTimePicker ID="RadDateTimePicker2" runat="server">
                                    </telerik:RadDateTimePicker>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="請填寫結束時間" ForeColor="Red" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator></td>

                            </tr>

                        </table>
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnPostBack" runat="server" style="display:none;" OnClick="btnPostBack_Click" />
            <asp:HiddenField ID="hfborrowplant" runat="server" />
            <asp:HiddenField ID="hfIsPostBack" runat="server" Value="false" /> 
            <asp:Label ID="lblSampleShowLimitMsg" runat="server" Text="設備{0}只開放今天後{1}天內借用(可借用到{2})。" Visible="false" meta:resourcekey="lblSampleShowLimitMsgResource1"></asp:Label>
            <asp:Label ID="lblLimitMsg" runat="server" Text="{0}只開放借用到{1}，無法新增。" Visible="false" meta:resourcekey="lblLimitMsgResource1"></asp:Label>
            <asp:Label ID="lblRangeLimitMsg" runat="server" Text="{0}{1}~{2}不開放借用，無法新增。" Visible="false" meta:resourcekey="lblRangeLimitMsgResource1"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

