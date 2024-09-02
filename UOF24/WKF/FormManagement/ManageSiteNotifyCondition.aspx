<%@ Page Title="設定知會人員" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_ManageSiteNotifyCondition" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ManageSiteNotifyCondition.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="../FlowManagement/UC_SelectSubFlow.ascx" TagName="UC_SelectSubFlow" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Reference Control="../../Common/ChoiceCenter/UC_ChoiceList.ascx" %>
<%@ Register src="../../Common/ChoiceCenter/UC_ChoiceListByView.ascx" tagname="UC_ChoiceListByView" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script id="btnjs" type="text/javascript">

    function btnAdd_ClientClick(oButton, oEvent) {
        //如果把Butten Disable掉，會造成不執行後端事件
    }
</script>

    <table width="100%" >
        <tr>
            <td valign="top" width="40%" style="height: 525px;text-align: left; margin-left:0px;">
                        <table height="525" cellspacing="0" cellpadding="0" width="100%"  class="PopTable">
                            <tbody>
                                <tr style="width: 100%">
                                    <td style="width: 50%; text-align: center" class="PopTableLeftTD" align="center" height="20">
                                        <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="條件式通知人員"></asp:Label>
                                        <asp:CustomValidator ID="CustomValidatorBranchRemove" runat="server" meta:resourcekey="CustomValidatorBranchRemoveResource1" ErrorMessage="請選擇欲移除之判斷條件" Display="Dynamic"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 600px;text-align: left;  padding-left: 0px;" class="PopTableRightTD" valign="top" width="50%">
                                        <asp:Panel ID="Panel3" runat="server" meta:resourcekey="Panel3Resource1" ScrollBars="Auto" Width="400px" Height="100%" >
                                            <Fast:Grid ID="Grid1" runat="server" 
                                                Width="100%"   DataKeyNames="NOTIFY_ID" 
                                                 AutoGenerateCheckBoxColumn="True" 
                                                DataKeyOnClientWithCheckBox="True" 
                                                EnhancePager="True" PageSize="15" AutoGenerateColumns="False" 
                                                OnRowDataBound="Grid1_RowDataBound" AllowSorting="True" 
                                                DefaultSortDirection="Ascending" EmptyDataText="沒有資料" 
                                                EnableModelValidation="True" KeepSelectedRows="False" 
                                                meta:resourcekey="Grid1Resource1">
                                                <EnhancePagerSettings ShowHeaderPager="True" />
                                                <ExportExcelSettings AllowExportToExcel="False" />
                                                <Columns>
                                                    <asp:BoundField DataField="COND_ID" HeaderText="條件" 
                                                        meta:resourcekey="BoundFieldResource1" />
                                                    <asp:TemplateField HeaderText="特殊知會" meta:resourcekey="TemplateFieldResource1">
                                                        <ItemTemplate >
                                                            <asp:Label ID="lblSpecialAlter" runat="server" 
                                                                meta:resourcekey="lblSpecialAlterResource1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="一般知會" meta:resourcekey="TemplateFieldResource2">
                                                        <ItemTemplate >
                                                            <uc3:UC_ChoiceListByView ID="uc_ChoiceListByView" runat="server" /> 
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                            </Fast:Grid>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
 
            </td>
            <td style="vertical-align:middle;text-align:center;min-width:50px">
                <telerik:RadButton ID="btnAdd" runat="server" CausesValidation="False" 
                    meta:resourcekey="btnAddResource1" Text="<--" OnClientClicking="btnAdd_ClientClick" OnClick="btnAdd_Click1">
                </telerik:RadButton>
                &nbsp;
                <br />
                <br />
                <telerik:RadButton ID="btnRemove" runat="server" meta:resourcekey="btnRemoveResource1"
                    Text="-->" OnClick="btnRemove_Click1"></telerik:RadButton>
            </td>
            <td valign="top" width="60%" style="height: 525px;text-align: left; margin-left:0px;">

                        <table height="525" cellspacing="0" cellpadding="0" width="100%" class="PopTable">
                            <tbody>
                                <tr>
                                    <td style="width: 50%; text-align: center" class="PopTableLeftTD" align="center" height="20">
                                        <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="判斷條件"></asp:Label>
                                        <asp:CustomValidator ID="CustomValidatorCondition" runat="server" meta:resourcekey="CustomValidatorConditionResource1" ErrorMessage="請選擇判斷條件" Display="Dynamic"></asp:CustomValidator>
                                    </td>
                                    <td style="width: 50%; text-align: center" class="PopTableLeftTD">
                                        <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="通知人員"></asp:Label>
                                        <asp:CustomValidator ID="CustomValidatorNotifyEmp" runat="server" meta:resourcekey="CustomValidatorNotifyEmpResource1" ErrorMessage="請選擇通知人員" Display="Dynamic"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="PopTableRightTD" valign="top" style="width:54%;height:600px;text-align:left;" >

                                        <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1" ScrollBars="Auto"  Width="280px" Height="100%">
                                            <telerik:RadTreeView ID="treeCondition" runat="server" Width="100%" Height="100%" ></telerik:RadTreeView>
                                        </asp:Panel>
                                    </td>
                                    <td class="PopTableRightTD" style="vertical-align:top;width: 100%; padding-bottom:0;padding-right:0;padding-top:0;padding-left:0;"> 
                                        <table class="NormalPopTable" cellpadding="0" cellspacing="0" style="width: 100%;">
                                            <tr>
                                                <td  style="width: 100%; padding:0; margin:0; border-left-width:0px; border-top-width:0px;  border-right-width:0px;" class="PopTableLeftTD">
                                                    <div align="center">
                                                        <asp:Label ID="lblAlertSpecialSingers" runat="server" Text="特殊知會" meta:resourcekey="lblAlertSpecialSingersResource1"></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100%;background-color: white;text-align: left; border:0;"  class="PopTableRightTD">
                                                    <asp:CheckBoxList ID="cblAlertSpecialSingers" runat="server" RepeatColumns="1" Width="100%" RepeatDirection="Vertical"
                                                        meta:resourcekey="cblAlertSpecialSingersResource1" >
                                                        <asp:ListItem Value="IS_APPLYER_ALERT" meta:resourcekey="ListItemResource6" Text="申請者"></asp:ListItem>
                                                        <asp:ListItem Value="IS_LAST_AGENT_ALERT" meta:resourcekey="ListItemResource8" Text="上一站點代理人"></asp:ListItem>
                                                        <asp:ListItem Value="IS_APPLYER_SUPERIOR_ALERT" meta:resourcekey="ListItemResource9"
                                                            Text="申請者直屬主管"></asp:ListItem>
                                                        <asp:ListItem Value="IS_LAST_SUPERIOR_ALERT" meta:resourcekey="ListItemResource10"
                                                            Text="上一站直屬主管"></asp:ListItem>
                                                    </asp:CheckBoxList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100%; padding:0; margin:0; border-left-width:0px;   border-right-width:0px;"  class="PopTableLeftTD">
                                                    <div align="center">
                                                        <asp:Label ID="lblAlertGeneralSingers" runat="server" Text="一般知會" meta:resourcekey="lblAlertGeneralSingersResource1"></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100%;background-color: white;text-align: left; padding-left: 0px; border:0;" class="PopTableRightTD">
                                                     <uc2:UC_ChoiceList ID="UC_ChoiceList_Alert" runat="server" ShowMember="False" 
                                                         ExpandToUser="False" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
 
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hiddenSourceNodeId" runat="server" />
    <asp:Label ID="lblDefault" runat="server" Text="其他" Visible=false meta:resourcekey="lblDefaultResource1" ></asp:Label>

</asp:Content>

