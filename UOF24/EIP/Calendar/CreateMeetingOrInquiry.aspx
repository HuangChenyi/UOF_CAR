<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_CreateMeetingOrInquiry" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CreateMeetingOrInquiry.aspx.cs" %>

<%@ Register Src="Common/UC_SearchInquiry.ascx" TagName="UC_SearchInquiry" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function CreateSourceChange() {

            var rbtCheckValue = $("#<%=rbtCreateSource.ClientID%>").find("input[type=radio]:checked").val();
            var panCopy = $("#CreateSource_panCopy");

            if (rbtCheckValue != "undefined") {
                if (rbtCheckValue == "New" || rbtCheckValue == "Inquiry") {
                    panCopy.hide();
                }
                else {
                    panCopy.show();
                }
            }
            else {
                panCopy.hide();
            }
        }
    </script>
    <asp:CustomValidator ID="cvMessage" runat="server" Display="Dynamic" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
        <table class="PopTable" cellspacing="1">
            <tr>
                <td style="white-space:nowrap;">
                    <asp:Label ID="Label2" runat="server" Text="資料來源" meta:resourcekey="Label2Resource1"></asp:Label></td>
                <td>
                    <asp:RadioButtonList ID="rbtCreateSource" runat="server" onClick="CreateSourceChange()" meta:resourcekey="rbtCreateSourceResource1">
                        <asp:ListItem Value="New" Selected="True" meta:resourcekey="ListItemResource1">直接召開會議</asp:ListItem>
                        <asp:ListItem Value="Inquiry" meta:resourcekey="ListItemResource2">進行徵詢</asp:ListItem>
                        <asp:ListItem Value="Copy" meta:resourcekey="ListItemResource3">從已徵詢召開會議</asp:ListItem>
                    </asp:RadioButtonList>
                    <div id="CreateSource_panCopy" style="display: none">
                        <asp:Label ID="Label1" runat="server" Text="選擇來源徵詢:" meta:resourcekey="Label1Resource1"></asp:Label>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <contenttemplate>
                              <uc1:UC_SearchInquiry ID="UC_SearchInquiry1" runat="server" />
                        </contenttemplate>
                        </asp:UpdatePanel>
                        <%--                  
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <uc1:UC_SearchProject id="UC_SearchProject1" runat="server">
                                </uc1:UC_SearchProject>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="UC_ProjectStatusDDL1" EventName="OnSelectChanged" />
                                <asp:AsyncPostBackTrigger ControlID="WebImageButton1" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>--%>
                        <asp:Label ID="lblNextMsg" runat="server" Text="下一步" Visible="False" meta:resourcekey="lblNextMsgResource1"></asp:Label>
                        <asp:Label ID="lblInquiryGUID" runat="server" Visible="False" meta:resourcekey="lblInquiryGUIDResource1"></asp:Label>
                        <asp:Label ID="lblInquiryGUIDEmptyMsg" runat="server" Text="請選擇現有徵詢 " Visible="False" meta:resourcekey="lblInquiryGUIDEmptyMsgResource1"></asp:Label>
                    </div>
                </td>
            </tr>
        </table>
</asp:Content>

