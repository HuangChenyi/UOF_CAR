<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_ManageSubFlowNotifyCondition" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ManageSubFlowNotifyCondition.aspx.cs" %>
<%@ Register Src="UC_SelectSubFlow.ascx" TagName="UC_SelectSubFlow" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Reference Control="../../Common/ChoiceCenter/UC_ChoiceList.ascx" %>
<%@ Register src="../../Common/ChoiceCenter/UC_ChoiceListByView.ascx" tagname="UC_ChoiceListByView" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<script id="treejs" type="text/javascript">

    function btnAdd_ClientClick(oButton, oEvent) {
        //如果把按鈕Disable=false，會無法觸發後端click事件
    }

    function treeBranchSiteNode_DragStart(oTree, oNode, oDataTransfer, oEvent) {
 

        $("#<%=hiddenSourceNodeId.ClientID%>").val(oNode.getTag());

        if (oNode.getLevel() == 1) {
            oDataTransfer.dataTransfer.effectAllowed = 'none';
        }
        else {
            oDataTransfer.dataTransfer.effectAllowed = 'move';
        }
    }

    function treeBranchSiteNode_DragOver(oTree, oNode, oDataTransfer, oEvent) {
        if (oNode.getLevel() == 1) {
            oDataTransfer.dataTransfer.dropEffect = 'none';
        }
    }

    function treeBranchSiteNode_Drop(oTree, oNode, oDataTransfer, oEvent) {
        return false;
    }
</script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <table width="100%">
        <tr>
            <td valign="top" width="40%" style="height:525px">
                        <table class="PopTable" style="width:100%;height:525px" cellspacing="1" cellpadding="0" >
                            <tbody>
                                <tr>
                                    <td style="width: 50%; text-align: center" class="PopTableLeftTD" align="center" height="20">
                                        <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="條件式通知人員"></asp:Label>
                                        <asp:CustomValidator ID="CustomValidatorBranchRemove" runat="server" meta:resourcekey="CustomValidatorBranchRemoveResource1" ErrorMessage="請選擇欲移除之判斷條件" Display="Dynamic"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height:525px;text-align:left" class="PopTableRightTD" valign="top" width="50%">
                                        <asp:Panel ID="Panel3" runat="server" meta:resourcekey="Panel3Resource1" ScrollBars="Auto" Width="340px" Height="100%">
                                            <Fast:Grid ID="Grid1" runat="server" 
                                                Width="100%"   DataKeyNames="NOTIFY_ID" 
                                                 AutoGenerateCheckBoxColumn="True" 
                                                DataKeyOnClientWithCheckBox="True" 
                                                EnhancePager="True" PageSize="15" AutoGenerateColumns="False" 
                                                OnRowDataBound="Grid1_RowDataBound" AllowSorting="True" 
                                                DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False" CustomDropDownListPage="False" meta:resourcekey="Grid1Resource1" SelectedRowColor="" UnSelectedRowColor="">
                                                <EnhancePagerSettings ShowHeaderPager="True" />
                                                <ExportExcelSettings AllowExportToExcel="False" />
                                                <Columns>
                                                    <asp:BoundField DataField="COND_ID" HeaderText="判斷條件"
                                                        meta:resourceKey="BoundFieldResource1" >
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="通知人員" meta:resourcekey="TemplateFieldResource1">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NOTIFY_ID") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <uc3:UC_ChoiceListByView ID="uc_ChoiceListByView" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataRowStyle HorizontalAlign="Left" />
                                            </Fast:Grid>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
 
            </td>
            <td style="vertical-align:middle;min-width:50px">
                <telerik:RadButton ID="btnAdd" runat="server" CausesValidation="False"
                    meta:resourcekey="btnAddResource1" Text="<--" OnClick="btnAdd_Click1"></telerik:RadButton>
                &nbsp;
                <br />
                <br />
                <telerik:RadButton ID="btnRemove" runat="server" meta:resourcekey="btnRemoveResource1"
                     Text="-->" OnClick="btnRemove_Click1"></telerik:RadButton>
            </td>
            <td valign="top" width="56%">

                        <table class="PopTable" style="width:100%;height:525px" cellspacing="1" cellpadding="0" >
                            <tbody>
                                <tr>
                                    <td style="width: 50%; text-align: center" class="PopTableLeftTD" align="center" height="20">
                                        <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="判斷條件"></asp:Label>
                                        <asp:CustomValidator ID="CustomValidatorCondition" runat="server" meta:resourcekey="CustomValidatorConditionResource1" ErrorMessage="請選擇判斷條件" Display="Dynamic"></asp:CustomValidator>
                                    </td>
                                    <td style="width: 50%; text-align: center" class="PopTableLeftTD" align="center">
                                        <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="通知人員"></asp:Label>
                                        <asp:CustomValidator ID="CustomValidatorNotifyEmp" runat="server" meta:resourcekey="CustomValidatorNotifyEmpResource1" ErrorMessage="請選擇通知人員" Display="Dynamic"></asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="PopTableRightTD" valign="top" style="width:54%;height:525px;text-align:left;" >
                                        <asp:Panel ID="Panel1" runat="server" meta:resourcekey="Panel1Resource1" ScrollBars="Auto"  Width="250px" Height="100%">
                                            <telerik:RadTreeView ID="treeCondition" runat="server" Width="100%"  Height="100%" meta:resourcekey="treeConditionResource1"></telerik:RadTreeView>
                                        </asp:Panel>
                                    </td>
                                    <td class="PopTableRightTD" valign="top">
                                        <asp:Panel ID="Panel2" runat="server" meta:resourcekey="Panel2Resource1" ScrollBars="Auto"  Width="250px" Height="525px">
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
                    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

