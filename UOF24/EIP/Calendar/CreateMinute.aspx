<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_CreateMinute" Title="新增會議記錄" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="CreateMinute.aspx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagPrefix="uc1" TagName="UC_BtnChoiceOnce" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
        <tr>
            <td valign="top" style="width:50%">
                 <table class="PopTable" cellspacing="1" width="100%">
                    <tr>
                        <td >
                            <span style="color: #ff0000">*</span><asp:Label ID="Label1" runat="server" Text="主旨" meta:resourcekey="Label1Resource1"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txbSubject" runat="server" Width="100%" meta:resourcekey="txbSubjectResource1" MaxLength="200"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbSubject"
                                Display="Dynamic" ErrorMessage="不允許空白" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td >
                            <span style="color: #ff0000">*</span><asp:Label ID="Label2" runat="server" Text="說明" meta:resourcekey="Label2Resource1"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txbDesc" runat="server" Height="140px" TextMode="MultiLine" Width="100%" meta:resourcekey="txbDescResource1"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txbDesc"
                                Display="Dynamic" ErrorMessage="不允許空白" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator></td>
                    </tr>
                     <tr>
                        <td style="white-space:nowrap;">
                           <asp:Label ID="lblFile" runat="server" Text="附件" meta:resourcekey="lblFileResource1"></asp:Label></td>
                        <td>
                            <uc2:UC_FileCenter runat="server" ID="UC_FileCenter" /></td>
                    </tr>
                    <tr>
                        <td style="white-space:nowrap;">
                            <asp:Label ID="Label4" runat="server" Text="是否為決議" meta:resourcekey="Label4Resource1"></asp:Label></td>
                        <td>
                            <asp:CheckBox ID="cbResolution" runat="server" Text="決議" meta:resourcekey="cbResolutionResource1" /></td>
                    </tr>
                    <tr>
                        <td >
                            <asp:Label ID="Label3" runat="server" Text="維護人員" meta:resourcekey="Label3Resource1"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblModifier" runat="server" meta:resourcekey="lbCreatorResource1"></asp:Label></td>
                    </tr>  
                     <asp:Panel ID="plModifyDate" runat="server" Visible="false">                    
                     <tr>
                        <td >
                            <asp:Label ID="lblModifyDateTitle" runat="server" Text="維護時間" meta:resourcekey="lblCreateTimeTitleResource1"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblModifyDate" runat="server" meta:resourcekey="lblCreateTimeResource1"></asp:Label></td>
                    </tr>
                     </asp:Panel>
                      <tr>
                        <td >
                            <asp:Label ID="lblCreatorTitle" runat="server" Text="建立人員" meta:resourcekey="lblCreatorTitleResource1"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblCreator" runat="server" meta:resourcekey="lbCreatorResource1"></asp:Label></td>
                    </tr>
                     <asp:Panel ID="plCreateDate" runat="server" Visible="false">     
                     <tr>
                        <td >
                            <asp:Label ID="lblCreateDateTitle" runat="server" Text="建立時間" meta:resourcekey="lblCreateDateTitleResource1"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblCreateDate" runat="server" meta:resourcekey="lblCreateDateResource1"></asp:Label></td>
                    </tr>
                    </asp:Panel>
                </table>
                  <asp:Label ID="lblModifierInfo" runat="server" Text="最近一次維護人員為交辦人" Visible="false" ForeColor="Blue" meta:resourcekey="lblModifierInfoResource1"></asp:Label>               
            </td>
            <td style="width:45%; vertical-align:top;" >
                 <table class="PopTable" cellspacing="1" width="100%">
                    <tr>
                        <td colspan="2" style="height: 24px; text-align: left;">
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="成為待辦事項" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged" meta:resourcekey="CheckBox1Resource1" /></td>
                    </tr>
                    <tr>
                        <td >
                            <asp:Label ID="lblStart" runat="server" ForeColor="Red" Text="*" Visible="false"></asp:Label>
                            <asp:Label ID="Label5" runat="server" Text="負責人" meta:resourcekey="Label5Resource1"></asp:Label></td>
                        <td >
                            <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" IsAllowEdit="false" />
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請選取負責人" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                        </td>
                    </tr>
                     <tr>
                         <td>
                             <asp:Label ID="lblCompInfoUserSet" runat="server" Text="知會人員" meta:resourcekey="lblCompInfoUserSetResource1"></asp:Label></td>
                         <td>
                             <uc1:UC_ChoiceList ID="UC_ChoiceList2" runat="server" IsAllowEdit ="False" />
                         </td>
                     </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblRequired" runat="server" ForeColor="Red" Text="*" Visible="false"></asp:Label>
                            <asp:Label ID="lblDirectorTitle" runat="server" Text="交辦人" meta:resourcekey="lblDirectorTitleResource1"></asp:Label>
                        </td>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <input id="hideDirector" type="hidden" runat="server" />
                                    <asp:Label ID="lblDirector" runat="server"></asp:Label>
                                    <uc1:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce1" runat="server" ButtonText="選擇" Editable="false" meta:resourcekey="UC_BtnChoiceOnce1Resource1" />                                    
                                    <asp:CustomValidator ID="cusValiDirector" runat="server" ErrorMessage="交辦人不允許空白" Display="Dynamic" meta:resourcekey="cusValiDirectorResource1"></asp:CustomValidator>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="開始時間" meta:resourcekey="Label6Resource1"></asp:Label></td>
                        <td>
                            <%--<telerik:RadDateTimePicker ID="rdStart" runat="server"></telerik:RadDateTimePicker>--%>

                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <telerik:RadDatePicker ID="rdpDateStart" runat="server"></telerik:RadDatePicker>
                                        <asp:Label ID="lblStartTime" runat="server" Visible="false"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadTimePicker ID="rdpTimeStart" runat="server"></telerik:RadTimePicker>
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="cbxAllDay" runat="server" Text="全天" AutoPostBack="True" OnCheckedChanged="cbxAllDay_CheckedChanged" style="margin-left:5px" meta:resourcekey="cbxAllDayResource1" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space:nowrap;">
                            <asp:Label ID="Label7" runat="server" Text="結束時間" meta:resourcekey="Label7Resource1"></asp:Label></td>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <telerik:RadDatePicker ID="rdpDateEnd" runat="server"></telerik:RadDatePicker>
                                    </td>
                                    <td>
                                        <telerik:RadTimePicker ID="rdpTimeEnd" runat="server"></telerik:RadTimePicker>
                                        <asp:Label ID="lblEndTime" runat="server" Visible="false"></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="請填入開始時間" OnServerValidate="CustomValidator4_ServerValidate" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>
                                        <asp:CustomValidator ID="CustomValidator6" runat="server" Display="Dynamic" ErrorMessage="請填入結束時間" OnServerValidate="CustomValidator6_ServerValidate" meta:resourcekey="CustomValidator6Resource1"></asp:CustomValidator>
                                        <asp:CustomValidator ID="CustomValidator7" runat="server" Display="Dynamic" ErrorMessage="開始時間需早於結束時間" OnServerValidate="CustomValidator7_ServerValidate" meta:resourcekey="CustomValidator7Resource1"></asp:CustomValidator>
                                    </td>
                                </tr>
                            </table>  


                            <%--<telerik:RadDateTimePicker ID="rdEnd" runat="server"></telerik:RadDateTimePicker>--%>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lbMinuteGuid" runat="server" Visible="False" meta:resourcekey="lbMinuteGuidResource1"></asp:Label>
    <asp:Label ID="lbMeetingGuid" runat="server" Visible="False" meta:resourcekey="lbMeetingGuidResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
</asp:Content>

