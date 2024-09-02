<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormUse_ViewResponsibleLog" Codebehind="ViewResponsibleLog.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<table  class="PopTable" cellspacing="1">
<tr>
    <td class="PopTableLeftTD" style="height:25px"><asp:Label ID="lbl_FormName" 
            runat="server" Text="表單名稱" meta:resourcekey="lbl_FormNameResource1"></asp:Label></td>
    <td class="PopTableRightTD"><asp:Label ID="lblFormName" runat="server" 
            meta:resourcekey="lblFormNameResource1"></asp:Label></td>
</tr>
<tr>
    <td class="PopTableLeftTD" style="height:25px"><asp:Label ID="lbl_FormNo" 
            runat="server" Text="表單編號" meta:resourcekey="lbl_FormNoResource1"></asp:Label></td>
    <td class="PopTableRightTD"><asp:Label ID="lblFormNo" runat="server" 
            meta:resourcekey="lblFormNoResource1"></asp:Label></td>
</tr>
</table>
<br />

            <Fast:Grid runat="server"   EnhancePager="True" Width="100%" DataKeyOnClientWithCheckBox="False" AllowSorting="True"  AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" ID="DGFormList"   DefaultSortDirection="Ascending" onrowdatabound="DGFormList_RowDataBound">
            <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
            <Columns>
            <asp:BoundField HeaderText="變更日期" meta:resourcekey="BoundFieldResource1">
                <HeaderStyle Width="15%" />
            </asp:BoundField>
            <asp:BoundField HeaderText="變更者" meta:resourcekey="BoundFieldResource2">
                <HeaderStyle Width="20%" />
            </asp:BoundField>
            <asp:BoundField HeaderText="操作方式" meta:resourcekey="BoundFieldResource3">
                <HeaderStyle Width="15%" />
            </asp:BoundField>
            <asp:BoundField HeaderText="變更前" meta:resourcekey="BoundFieldResource4">
                <HeaderStyle Width="10%" />
            </asp:BoundField>
            <asp:BoundField HeaderText="變更後" meta:resourcekey="BoundFieldResource5">
                <HeaderStyle Width="10%" />
            </asp:BoundField>
                <asp:BoundField HeaderText="操作說明" meta:resourcekey="BoundFieldResource6" >
                <HeaderStyle Width="30%" />
                </asp:BoundField>
            </Columns>

            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>

            <PagerStyle HorizontalAlign="Left"></PagerStyle>
            </Fast:Grid>
   
<asp:Label runat="server" ID="lblCancelForm" Text="作廢" Visible="False" 
    meta:resourcekey="lblCancelFormResource1"></asp:Label>
<asp:Label runat="server" ID="lblEndForm" Text="強制結案" Visible="False" 
    meta:resourcekey="lblEndFormResource1"></asp:Label>
<asp:Label runat="server" ID="lblReturnForm" Text="結案復原" Visible="False" 
    meta:resourcekey="lblReturnFormResource1"></asp:Label>
<asp:Label runat="server" ID="lblunLock" Text="解除鎖定" Visible="False" 
    meta:resourcekey="lblunLockResource1"></asp:Label>
<asp:Label runat="server" ID="lblSendNextSite" Text="送往下一站" Visible="False" 
    meta:resourcekey="lblSendNextSiteResource1"></asp:Label>
<asp:Label runat="server" ID="lblAssignSigner" Text="指定簽核" Visible="False" 
    meta:resourcekey="lblAssignSignerResource1"></asp:Label>
<asp:Label runat="server" ID="lblChangeResult" Text="結案狀態變更" Visible="False" 
    meta:resourcekey="lblChangeResultResource1"></asp:Label>

<asp:Label runat="server" ID="lblProccess" Text="處理中" Visible="False" 
    meta:resourcekey="lblProccessResource1"></asp:Label>
<asp:Label runat="server" ID="lblApprove" Text="同意" Visible="False" 
    meta:resourcekey="lblApproveResource1"></asp:Label>
<asp:Label runat="server" ID="lblReject" Text="否決" Visible="False" 
    meta:resourcekey="lblRejectResource1"></asp:Label>
<asp:Label runat="server" ID="lblReturn" Text="退簽" Visible="False" 
    meta:resourcekey="lblReturnResource1"></asp:Label>
