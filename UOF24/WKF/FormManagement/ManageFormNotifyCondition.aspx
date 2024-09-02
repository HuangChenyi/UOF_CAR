<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_ManageFormNotifyCondition" Title="設定表單起結案通知" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ManageFormNotifyCondition.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Src="../FlowManagement/UC_SelectSubFlow.ascx" TagName="UC_SelectSubFlow" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Reference Control="../../Common/ChoiceCenter/UC_ChoiceList.ascx" %>
<%@ Register src="../../Common/ChoiceCenter/UC_ChoiceListByView.ascx" tagname="UC_ChoiceListByView" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<script id="btnjs" type="text/javascript">

    function btnAdd_Clicking(oButton, oEvent) {
        //如果把Butten Disable掉，會造成不執行後端事件
    }

</script>

    <table width="100%">
        <tr>
            <td valign="top" width="40%" style="height: 361px">
                <table height="500px" cellspacing="0" cellpadding="0" width="100%" class="PopTable">
                            <tbody>
                                <tr>
                                    <td style="width: 50%; text-align: center; height: 18px;" 
                                        class="PopTableLeftTD" align="center" height="20">
                                        <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="條件式通知人員"></asp:Label>
                                        <asp:CustomValidator ID="CustomValidatorBranchRemove" runat="server" meta:resourcekey="CustomValidatorBranchRemoveResource1" ErrorMessage="請選擇欲移除之判斷條件" Display="Dynamic"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 505px; text-align:left" class="PopTableRightTD" valign="top" width="50%">
                                        <asp:Panel ID="Panel3" runat="server" meta:resourcekey="Panel3Resource1" ScrollBars="Auto" Width="340px" Height="500px">
                                            <Fast:Grid ID="Grid1" runat="server" 
                                                Width="100%"   DataKeyNames="NOTIFY_ID" 
                                                 AutoGenerateCheckBoxColumn="True" 
                                                DataKeyOnClientWithCheckBox="True" 
                                                EnhancePager="True" PageSize="15" AutoGenerateColumns="False" 
                                                OnRowDataBound="Grid1_RowDataBound" AllowSorting="True" 
                                                DefaultSortDirection="Ascending">
                                                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" 
                                                    FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" 
                                                    NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" 
                                                    PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" 
                                                    PreviousImageUrl="" />
                                                <ExportExcelSettings AllowExportToExcel="False" />
                                                <Columns>
                                                    <asp:BoundField DataField="COND_ID" HeaderText="判斷條件" 
                                                        meta:resourceKey="BoundFieldResource1" />
                                                    <asp:BoundField DataField="NOTIFY_ID" HeaderText="通知人員" 
                                                        meta:resourceKey="BoundFieldResource2" />
                                                </Columns>
                                            </Fast:Grid>    
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </tbody>
                        </table> 
            </td>
            <td style="vertical-align:middle;text-align:center;min-width:50px">
                <telerik:RadButton ID="btnAdd" runat="server" CausesValidation="False" meta:resourcekey="btnAddResource1" Text="<--" OnClick="btnAdd_Click1" OnClientClicking="btnAdd_Clicking"></telerik:RadButton>
                &nbsp;
                <br />
                <br />
                <telerik:RadButton ID="btnRemove" runat="server" meta:resourcekey="btnRemoveResource1" Text="-->" OnClick="btnRemove_Click1"></telerik:RadButton>
            </td>
            <td valign="top"  style="width:60%;height:500px" >
                <table height="525" cellspacing="0" cellpadding="0" width="100%"  class="PopTable">
                            <tbody>
                                <tr>
                                    <td style="width: 50%; text-align: center" class="PopTableLeftTD" align="center" height="20">
                                        <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="判斷條件"></asp:Label>
                                        <asp:CustomValidator ID="CustomValidatorCondition" runat="server" meta:resourcekey="CustomValidatorConditionResource1" ErrorMessage="請選擇判斷條件" Display="Dynamic"></asp:CustomValidator>
                                    </td>
                                    <td style="width: 50%; text-align: center" class="PopTableLeftTD" align="center" height="20">
                                         <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="通知人員"></asp:Label><br />
                                        <asp:CustomValidator ID="CustomValidatorNotifyEmp" runat="server" meta:resourcekey="CustomValidatorNotifyEmpResource1" ErrorMessage="請選擇通知人員" Display="Dynamic"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="PopTableRightTD" valign="top"style="width:54%;height:500px;text-align:left;" >
                                        <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1" ScrollBars="Auto"  Width="260px" Height="100%">
                                            <telerik:RadTreeView ID="RadTreeView1" runat="server" Width="100%" Height="100%"></telerik:RadTreeView>
                                        </asp:Panel>
                                    </td>
                                    <td class="PopTableRightTD" valign="top">
                                        <asp:Panel ID="Panel2" runat="server" meta:resourcekey="Panel2Resource1" ScrollBars="Auto"  Width="250px" Height="500">
                                            <uc2:UC_ChoiceList ID="UC_ChoiceList1" runat="server"  
                                                ChioceType="All" ExpandToUser="False" TreeHeight="100%" ShowMember="False" />
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </tbody>
                        </table> 
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hiddenSourceNodeId" runat="server" />
</asp:Content>
