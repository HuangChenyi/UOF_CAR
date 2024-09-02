<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="PMS_Query_QueryTask" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QueryTask.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../Common/UC_ProjectStatusDDL.ascx" TagName="UC_ProjectStatusDDL" TagPrefix="uc4" %>
<%@ Register Src="../Common/UC_GridTask.ascx" TagName="UC_GridTask" TagPrefix="uc3" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>   
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript">
    function CheckChoiceAttendUsers(source, arguments)
    {
        var hidCount = $uof.tool.htmlDecode($('#<%=hidAttendUsersItemCount.ClientID %>').val());
        if(hidCount != null)
        { 
             if (hidCount == 0) 
             {
                 arguments.IsValid = false;
             }
             else 
             {
                 arguments.IsValid = true;
             }
        }
    }
    function OnValueChanging(sender, args) {
        if (args.get_newValue() == "") {
            args.set_newValue(args.get_oldValue());
        }
    }
</script>
        <table  cellspacing="0" cellpadding="0" border="0" width="100%">
            <tr>
                <td valign="top" align="center" class="PopTableHeader">
                <center>
                    <asp:Label ID="Label1" runat="server" Text="查詢" meta:resourcekey="Label1Resource1"></asp:Label>
                </center>
                </td>
            </tr>
            <tr>
                <td style="background-color:White;">
                    <table class="PopTable" cellspacing="1" cellpadding="0" border="0" width="100%">
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="專案狀態" meta:resourcekey="Label5Resource1"></asp:Label></td>
                            <td>
                                <uc4:UC_ProjectStatusDDL ID="UC_ProjectStatusDDL1" runat="server" />
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="期間" meta:resourcekey="Label2Resource1"></asp:Label></td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <telerik:RadDatePicker ID="rdpTaskStart" runat="server"  
                                                meta:resourcekey="rdpTaskStartResource1">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>

<DateInput  LabelWidth="64px" Width="" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                                            </telerik:RadDatePicker>
                                        </td>
                                        <td>~
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker ID="rdpTaskEnd" runat="server" 
                                                meta:resourcekey="rdpTaskEndResource1">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False"></Calendar>

<DateInput  LabelWidth="64px" Width="" ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
 
<DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                                            </telerik:RadDatePicker>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="專案名稱" meta:resourcekey="Label3Resource1"></asp:Label></td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txtProjName" runat="server" 
                                            meta:resourcekey="txtProjNameResource1"></asp:TextBox>
                                <asp:Label ID="labNoDataDisplaytask" runat="server" ForeColor="Red" Text="沒有任何專案"
                                    Visible="False" meta:resourcekey="labNoDataDisplaytaskResource1"></asp:Label>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="UC_ProjectStatusDDL1" EventName="OnSelectChanged" />
                                    </Triggers>
                                </asp:UpdatePanel></td>
                            <td>
                                <span style="color: #ff0000">*</span>
                                <asp:Label ID="Label4" runat="server" Text="專案參與者" meta:resourcekey="Label4Resource1"></asp:Label></td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <uc2:UC_ChoiceList ID="ucChoiceAttendUsers" runat="server"/>
                                        <asp:HiddenField ID="hidAttendUsersItemCount" runat="server" value="0" />
                                        <asp:CustomValidator ID="cvAttendUsers" runat="server" 
                                            ClientValidationFunction="CheckChoiceAttendUsers" Display="Dynamic" 
                                            ErrorMessage="請選擇專案參與者" meta:resourceKey="cvAttendUsersResource1"></asp:CustomValidator>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style=" text-align:center; vertical-align:top; background-color:White;">
                <telerik:RadButton ID="rbtnQuery" runat="server" Text="查詢"  meta:resourcekey="btnQueryResource1"
                    onclick="rbtnQuery_Click">
                </telerik:RadButton>
            </tr>
            <tr>
                <td valign="top">
                    <asp:Label ID="labQueryNoDataDisplay" runat="server" ForeColor="Red"   
                        Text="沒有任何資料" Visible="False" 
                        meta:resourcekey="labQueryNoDataDisplayResource1"></asp:Label>
                    </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <uc3:UC_GridTask ID="UC_GridTask1" runat="server" GenerateCheckBox="false" 
                                    GenerateProjectColumn="false" />
                            </td>
                        </tr>
                    </table>
                    <br />
            </ContentTemplate> 
           <Triggers>
            <asp:AsyncPostBackTrigger ControlID="rbtnQuery" EventName="Click" />
           </Triggers> 
        </asp:UpdatePanel>
    <asp:Label ID="lblAllProjMsg" runat="server" Text="所有專案" Visible="False" meta:resourcekey="lblAllProjMsgResource1"></asp:Label>
</asp:Content>

