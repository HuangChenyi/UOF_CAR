<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_CreateInquiry" Title="新增徵詢" Culture="auto" UICulture="auto" meta:resourcekey="PageResource2" Codebehind="CreateInquiry.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc1" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script id="CreateInquiryjs" type="text/javascript">
    function DialogCreatePre() {
        var owner = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(hidOwnerGuid.Value, true) %>');
        var date = $("#<%= hidDate.ClientID %>").val();
        window.location.href = "CreateMeetingOrInquiry.aspx?OwnerGuid=" + owner + "&Date=" + date;
        return false;
    }

    </script>
    <telerik:RadTabStrip ID="rts1" runat="server" MultiPageID="rmp1" SelectedIndex="0" meta:resourcekey="rts1Resource1">
        <Tabs>
            <telerik:RadTab runat="server" Text="徴詢內容" Value="Content" Selected="True" meta:resourcekey="RadTabResource1">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" meta:resourcekey="RadMultiPage1Resource1">
        <telerik:RadPageView ID="RadPageView1" runat="server" meta:resourcekey="RadPageView1Resource1" Selected="True">
            <table width="100%">
                <tr>
                    <td style="width: 85%; vertical-align: top;">
                        <table class="PopTable" cellspacing="1" width="100%">
                            <tr>
                                <td>
                                    <asp:Label ID="lblChair" runat="server" Text="主席" meta:resourcekey="lblChairResource2"></asp:Label></td>
                                <td>
                                    <asp:Label ID="lblSelChair" runat="server" meta:resourcekey="lblSelChairResource2"></asp:Label>
                                    <asp:Label ID="lblSelChairGUID" runat="server" Visible="False" meta:resourcekey="lblSelChairGUIDResource2"></asp:Label>
                                    <uc1:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce1" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td style="white-space: nowrap;">
                                    <span style="color: #ff0000">*</span><asp:Label ID="Label1" runat="server"
                                        Text="預計參加人員" meta:resourcekey="Label1Resource2"></asp:Label></td>
                                <td>
                                    <uc2:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ShowMember="False" TreeHeight="100px" />
                                    <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic"
                                        ErrorMessage="參加人員不允許空白" meta:resourcekey="CustomValidator4Resource2">
                                    </asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="color: #ff0000">*</span><asp:Label ID="Label2" runat="server"
                                        Text="主旨" meta:resourcekey="Label2Resource2"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="txbSubject" runat="server" Width="100%"
                                        MaxLength="200" meta:resourcekey="txbSubjectResource2">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                        runat="server" ControlToValidate="txbSubject" Display="Dynamic"
                                        ErrorMessage="不允許空白" meta:resourcekey="RequiredFieldValidator1Resource2">
                                    </asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="color: #ff0000">*</span><asp:Label ID="Label3" runat="server"
                                        Text="地點" meta:resourcekey="Label3Resource2"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="txbLocation" runat="server" Width="100%"
                                        MaxLength="50" meta:resourcekey="txbLocationResource2">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                        runat="server" ControlToValidate="txbLocation" Display="Dynamic"
                                        ErrorMessage="不允許空白" meta:resourcekey="RequiredFieldValidator2Resource2">
                                    </asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text="說明" meta:resourcekey="Label4Resource2"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="txbDescription" runat="server" Height="100px" TextMode="MultiLine"
                                        Width="100%" meta:resourcekey="txbDescriptionResource2">
                                    </asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="white-space: nowrap;">
                                    <span style="color: #ff0000">*</span><asp:Label ID="Label5" runat="server" Text="預計召開時間" meta:resourcekey="Label5Resource2"></asp:Label>
                                </td>
                                <td>
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <table width="100%">
                                                <tr>
                                                    <td>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <telerik:RadToolBar ID="RadToolBar1" runat="server" Width="100%"
                                                                        OnButtonClick="RadToolBar1_ButtonClick" meta:resourcekey="RadToolBar1Resource1">
                                                                        <Items>
                                                                            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/EIP/Personal/icon_images/icon_m31.gif" ImageUrl="~/EIP/Personal/icon_images/icon_m31.gif"
                                                                                Value="create" CheckedImageUrl="~/EIP/Personal/icon_images/icon_m31.gif"
                                                                                Text="新增" meta:resourcekey="TBarButtonResource3" CausesValidation="False">
                                                                            </telerik:RadToolBarButton>
                                                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource1">
                                                                            </telerik:RadToolBarButton>
                                                                            <telerik:RadToolBarButton runat="server" HoveredImageUrl="~/EIP/Personal/icon_images/icon_m03.gif" ImageUrl="~/EIP/Personal/icon_images/icon_m03.gif"
                                                                                Value="delete" CheckedImageUrl="~/EIP/Personal/icon_images/icon_m03.gif"
                                                                                Text="刪除" meta:resourcekey="TBarButtonResource4" CausesValidation="False">
                                                                            </telerik:RadToolBarButton>
                                                                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s2" meta:resourcekey="RadToolBarButtonResource2">
                                                                            </telerik:RadToolBarButton>
                                                                        </Items>

                                                                    </telerik:RadToolBar>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td>
                                                                    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                                                                        DataKeyNames="INQUIRY_TIME_GUID"
                                                                        Width="100%" AllowSorting="True"
                                                                        DataKeyOnClientWithCheckBox="False"
                                                                        PageSize="5" EnhancePager="True" OnRowDataBound="Grid1_RowDataBound"
                                                                        DefaultSortDirection="Ascending"  EmptyDataText="沒有資料" KeepSelectedRows="False" meta:resourcekey="Grid1Resource3"  >
                                                                        <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                                                                        <ExportExcelSettings AllowExportToExcel="False" />
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="會議開始時間" meta:resourcekey="TemplateFieldResource5">
                                                                                <ItemTemplate>
                                                                                    <telerik:RadDateTimePicker runat="server" ID="rdStartDateTime"></telerik:RadDateTimePicker>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="會議結束時間" meta:resourcekey="TemplateFieldResource6">
                                                                                <ItemTemplate>
                                                                                    <telerik:RadDateTimePicker runat="server" ID="rdEndDateTime"></telerik:RadDateTimePicker>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="INQUIRY_TIME_GUID" Visible="False" meta:resourcekey="TemplateFieldResource7">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblInquiryTimeGUID" runat="server" meta:resourceKey="lblInquiryTimeGUIDResource2" Text='<%#:Eval("INQUIRY_TIME_GUID") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="STATE" Visible="False" meta:resourcekey="TemplateFieldResource8">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblState" runat="server" meta:resourceKey="lblStateResource2" Text='<%#:Eval("STATE") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </Fast:Grid>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left">
                                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic"
                                                                        ErrorMessage="請填入開始時間" meta:resourcekey="CustomValidator1Resource2">
                                                                    </asp:CustomValidator>
                                                                    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic"
                                                                        ErrorMessage="請填入結束時間" meta:resourcekey="CustomValidator2Resource2">
                                                                    </asp:CustomValidator>
                                                                    <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic"
                                                                        ErrorMessage="結束時間需晚於開始時間" meta:resourcekey="CustomValidator3Resource2">
                                                                    </asp:CustomValidator>
                                                                    <asp:CustomValidator ID="CustomValidator6" runat="server" Display="Dynamic"
                                                                        ErrorMessage="會議時間不得重複" meta:resourcekey="CustomValidator6Resource2">
                                                                    </asp:CustomValidator>
                                                                    <asp:CustomValidator ID="CustomValidator7" runat="server" Display="Dynamic"
                                                                        ErrorMessage="預計召開時間至少要有一筆資料"
                                                                        meta:resourcekey="CustomValidator7Resource2">
                                                                    </asp:CustomValidator>
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblContact" runat="server" Text="會議連絡人" meta:resourcekey="lblContactResource2"></asp:Label></td>
                                <td>
                                    <uc2:UC_ChoiceList ID="UC_ChoiceList2" runat="server" ChioceType="User" ShowMember="False" TreeHeight="100px" />
                                </td>
                            </tr>
                            <tr>
                                <td style="white-space: nowrap;">
                                    <span style="color: #ff0000">*</span><asp:Label ID="Label7" runat="server"
                                        Text="徵詢截止時間" meta:resourcekey="Label7Resource2"></asp:Label></td>
                                <td>
                                    <table>
                                        <tr>

                                            <td>
                                                <telerik:RadDateTimePicker runat="server" ID="rdIqyDateTime"></telerik:RadDateTimePicker>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic"
                                                    ErrorMessage="請填入徵詢截止時間" meta:resourcekey="CustomValidator5Resource2">
                                                </asp:CustomValidator>
                                                <asp:CustomValidator ID="CustomValidator8" runat="server" Display="Dynamic"
                                                    ErrorMessage="徵詢截止時間不可晚於最早預計召開時間" meta:resourcekey="CustomValidator8Resource1">
                                                </asp:CustomValidator>
                                            </td>

                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:Label ID="lblFile" runat="server" Text="附件" meta:resourcekey="lblFileResource2"></asp:Label></td>
                                <td>
                                    <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label9" runat="server" Text="建立人員" meta:resourcekey="Label9Resource2"></asp:Label></td>
                                <td>
                                    <asp:Label ID="lbCreateUser" runat="server" meta:resourcekey="lbCreateUserResource2"></asp:Label></td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 15%; text-align: left; vertical-align: top;">
                        <asp:LinkButton ID="lbtnQueryResult" runat="server" CausesValidation="False" Enabled="False" meta:resourcekey="lbtnQueryResultResource2" Text="查詢徵詢結果">
                        </asp:LinkButton>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
    </telerik:RadMultiPage>

    <asp:Label ID="lbOwnerGuid" runat="server" Visible="False" meta:resourcekey="lbOwnerGuidResource2"></asp:Label>
    <asp:Label ID="lbDate" runat="server" Visible="False" meta:resourcekey="lbDateResource2"></asp:Label>
    <asp:Label ID="lbUserGuid" runat="server" Visible="False" meta:resourcekey="lbUserGuidResource2"></asp:Label>
    <asp:Label ID="lblInquireGUID" runat="server" Visible="False" meta:resourcekey="lblInquireGUIDResource2"></asp:Label>
    <asp:Label ID="lblInquire" runat="server" Text="徴詢" Visible="False" meta:resourcekey="lblInquireResource2"></asp:Label>
    <asp:Label ID="lblPreMsg" runat="server" Text="上一步" Visible="False" meta:resourcekey="lblPreMsgResource2"></asp:Label>
    <asp:Label ID="lblDelMsg" runat="server" Text="刪除徵詢" Visible="False" meta:resourcekey="lblDelMsgResource2"></asp:Label>
    <asp:Label ID="lblAddMsg" runat="server" Text="召開會議" Visible="False" meta:resourcekey="lblAddMsgResource2"></asp:Label>
    <asp:HiddenField ID="hidOwnerGuid" runat="server" />
    <asp:HiddenField ID="hidDate" runat="server" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>
