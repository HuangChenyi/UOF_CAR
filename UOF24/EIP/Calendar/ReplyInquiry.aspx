<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_ReplyInquiry" Title="回覆徵詢" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ReplyInquiry.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register src="../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" tagname="UC_BtnChoiceOnce" tagprefix="uc1" %>
<%@ Register src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" tagname="UC_ChoiceList" tagprefix="uc2" %>
<%@ Register assembly="Ede.Uof.Utility.Component.Grid" namespace="Ede.Uof.Utility.Component" tagprefix="Fast" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:CustomValidator ID="cvReadAuthority" runat="server" ErrorMessage="您不是該徵詢預計參加人員，因此不允許回覆" Visible="False" meta:resourcekey="cvReadAuthorityResource1"></asp:CustomValidator>
    <telerik:RadTabStrip ID="rdTab" runat="server" MultiPageID="RadMultiPage1" Width="100%" SelectedIndex="0">
        <Tabs>            
            <telerik:RadTab runat="server" Text="回覆徵詢" PageViewID="rdPage1" Selected="True">
            </telerik:RadTab>                       
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0">
        <telerik:RadPageView ID="rdPage1" runat="server">
            <table width="100%">
                    <tr>
                        <td valign="top" style="width: 45%">
                            <table class="PopTable" cellspacing="1" width="100%">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblChair" runat="server" Text="主席" meta:resourcekey="lblChairResource2" ></asp:Label></td>
                                    <td>
                                        <asp:Label ID="lblSelChair" runat="server" meta:resourcekey="lblSelChairResource2" ></asp:Label>
                                        <asp:Label ID="lblSelChairGUID" runat="server" Visible ="false" meta:resourcekey="lblSelChairGUIDResource2" ></asp:Label>
                                        <uc1:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="white-space:nowrap;">
                                        <span style="color: #ff0000">*</span><asp:Label ID="Label1" runat="server" Text="預計參加人員" meta:resourcekey="Label1Resource2" ></asp:Label>
                                    </td>
                                    <td>
                                        <uc2:UC_ChoiceList ID="UC_ChoiceList1" runat="server" TreeHeight="100px"/>
                                        <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="參加人員不允許空白" meta:resourcekey="CustomValidator4Resource2" ></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span style="color: #ff0000">*</span><asp:Label ID="Label2" runat="server" Text="主旨" meta:resourcekey="Label2Resource2" ></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txbSubject" runat="server" Width="100%" MaxLength="200" meta:resourcekey="txbSubjectResource2" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbSubject" Display="Dynamic" ErrorMessage="不允許空白" meta:resourcekey="RequiredFieldValidator1Resource2" ></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span style="color: #ff0000">*</span><asp:Label ID="Label3" runat="server" Text="地點" meta:resourcekey="Label3Resource2" ></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txbLocation" runat="server" Width="100%" MaxLength="50" meta:resourcekey="txbLocationResource2" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbLocation" Display="Dynamic" ErrorMessage="不允許空白" meta:resourcekey="RequiredFieldValidator2Resource2" ></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="說明" meta:resourcekey="Label4Resource2" ></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txbDescription" runat="server" Height="100px" TextMode="MultiLine" Width="100%" meta:resourcekey="txbDescriptionResource2"  ></asp:TextBox>
                                    </td>
                                </tr>                                                                   
                                <tr>
                                    <td>
                                        <asp:Label ID="lblContact" runat="server" Text="會議連絡人" meta:resourcekey="lblContactResource2" ></asp:Label>
                                    </td>
                                    <td>
                                        <uc2:UC_ChoiceList ID="UC_ChoiceList2" runat="server" ChioceType="User"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="white-space:nowrap;">
                                        <span style="color: #ff0000">*</span><asp:Label ID="Label7" runat="server" Text="徵詢截止時間" meta:resourcekey="Label7Resource2" ></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblInquiryTimeEnd" runat="server" Visible="false"></asp:Label>
                                        <telerik:RadDateTimePicker Runat="server" id="rdDateTime"></telerik:RadDateTimePicker>
                                        <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ErrorMessage="請填入徵詢截止時間" meta:resourcekey="CustomValidator5Resource2" ></asp:CustomValidator>
                                    </td>
                                </tr>                                                        
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFile" runat="server" Text="附件" meta:resourcekey="lblFileResource2" ></asp:Label>
                                    </td>
                                    <td>
                                        <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" />
                                    </td>
                                </tr>                                        
                                <tr>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text="建立人員" meta:resourcekey="Label9Resource2" ></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lbCreateUser" runat="server" meta:resourcekey="lbCreateUserResource2" ></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width:45%; vertical-align:top;">
                            <asp:Label ID="lblNotReplyMsg" runat="server" ForeColor="Red" Visible="false" Text="徵詢己結束,無法回覆" meta:resourcekey="lblNotReplyMsgResource2" ></asp:Label>
                            <table class="PopTable" cellspacing="1" width="100%">
                                <tr>
                                    <td colspan="2" style="height: 24px;" class="PopTableHeader">
                                        <div style=" text-align:center;">
                                            <asp:Label ID="Label5" runat="server" Text="會議徵詢" meta:resourcekey="Label5Resource2" ></asp:Label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="回覆" meta:resourcekey="Label6Resource2"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal" meta:resourcekey="RadioButtonList1Resource2" >
                                                            <asp:ListItem Selected="True" Value="true" meta:resourcekey="ListItemResource1" Text="參加"></asp:ListItem>
                                                            <asp:ListItem Value="false" meta:resourcekey="ListItemResource2" Text="不參加"></asp:ListItem>
                                                            </asp:RadioButtonList>                                                        
                                    </td>
                                </tr>
                                <tr runat="server" id="trGrid">
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <table style="width:100%;">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label8" runat="server" Text="請勾選可參加的時間" meta:resourcekey="Label8Resource1"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="參加時間至少要勾選一筆" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                                                                            DataKeyNames="INQUIRY_TIME_GUID"   
                                                                            Width="100%" AllowSorting="True"  
                                                                            DataKeyOnClientWithCheckBox="False" 
                                                                            PageSize="5" EnhancePager="True" onrowdatabound="Grid1_RowDataBound" 
                                                                                DefaultSortDirection="Ascending">
                                                                              <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                                                                              <ExportExcelSettings AllowExportToExcel="False" />
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="時段" meta:resourcekey="TemplateFieldResource1">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblNum" runat="server" meta:resourcekey="lblNumResource1"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle Wrap="false" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="會議時間" meta:resourcekey="TemplateFieldResource2">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblInquiryTime" runat="server" 
                                                                                            meta:resourcekey="lblInquiryTimeResource1"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="會議開始時間" Visible="False" 
                                                                                    meta:resourcekey="TemplateFieldResource3">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblStartTime" runat="server" Text='<%# Eval("START_TIME") %>' 
                                                                                            meta:resourcekey="lblStartTimeResource1"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="會議結束時間" Visible="False" 
                                                                                    meta:resourcekey="TemplateFieldResource4">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblEndTime" runat="server" Text='<%# Eval("END_TIME") %>' 
                                                                                            meta:resourcekey="lblEndTimeResource1"></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                        </Fast:Grid>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label15" runat="server" Text="回覆說明" meta:resourcekey="Label15Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txbReturnDesc" runat="server" Height="100px" TextMode="MultiLine" Width="100%" meta:resourcekey="txbReturnDescResource1" ></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="height: 24px; text-align: left;">
                                        <asp:LinkButton ID="lbtnQueryResult" runat="server" CausesValidation="False" meta:resourcekey="lbtnQueryResultResource1" Text="查詢徵詢結果"></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </td>                         
                    </tr>
                </table>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <asp:Label ID="lbUserGuid" runat="server" Visible="false"  meta:resourcekey="lbUserGuidResource1" ></asp:Label> 
    <asp:Label ID="lblInquireGUID" runat="server" Visible="false"  meta:resourcekey="lblInquireGUIDResource1"></asp:Label>
    <asp:Label ID="lblInquiryTimeNum" Text=0 runat="server" Visible="false"  meta:resourcekey="lblInquiryTimeNumResource1"></asp:Label>
    <asp:Label ID="lblInquire" runat="server" Text="確定回覆" Visible="false"  meta:resourcekey="lblInquireResource1"></asp:Label>
    <asp:Label ID="lblInquireContent" runat="server" Text="回覆徴詢" Visible="false" meta:resourcekey="lblInquireContentResource1"></asp:Label>
    <asp:Label ID="lblLoginAlert" runat="server" Text = "登入者非此會議徵詢參與人員,所以無法回覆 !" Visible="false" meta:resourcekey="lblLoginAlertResource2"></asp:Label> 
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

