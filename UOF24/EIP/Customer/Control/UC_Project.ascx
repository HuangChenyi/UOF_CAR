<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Customer_WKFOptionalFields_UC_Project" Codebehind="UC_Project.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>


<table>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="關鍵字" meta:resourcekey="Label1Resource1"></asp:Label></td>
        <td><asp:TextBox ID="txtSearchProject" runat="server" meta:resourcekey="txtSearchProjectResource1"></asp:TextBox></td>
        <td><asp:Button ID="btnSearchProject" runat="server" Text="搜尋" OnClick="btnSearchProject_Click" meta:resourcekey="btnSearchProjectResource1" /></td>
    </tr>
</table>

<Fast:Grid ID="Grid1" runat="server" DataKeyNames="PROJ_GUID" AllowSorting="True"  DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="No data found" EnhancePager="True" KeepSelectedRows="False" OnRowDataBound="Grid1_RowDataBound" PageSize="15"   AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" OnSorting="Grid1_Sorting" Width="100%" DefaultSortColumnName="PROJ_NBR" meta:resourcekey="Grid1Resource1" OnRowCommand="Grid1_RowCommand">
<EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

<ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
    <Columns>
        <asp:TemplateField HeaderText="專案編號" SortExpression="PROJ_NBR" meta:resourcekey="TemplateFieldResource1">
            <ItemTemplate>
                <asp:Label ID="lblNumber" runat="server" Text='<%# Eval("PROJ_NBR") %>' meta:resourcekey="lblNumberResource1"></asp:Label>                
                <asp:LinkButton ID="likbtnNumber" runat="server" Text='<%# Eval("PROJ_NBR")%>' ></asp:LinkButton>                
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="PROJ_NAME" HeaderText="專案名稱" SortExpression="PROJ_NAME" meta:resourcekey="BoundFieldResource1"/>
        <asp:TemplateField HeaderText="專案負責人" SortExpression="PM_NAME" meta:resourcekey="TemplateFieldResource2">
            <ItemTemplate>
                <asp:Label ID="lblLeader" runat="server" meta:resourcekey="lblLeaderResource1"></asp:Label>
                <asp:Label ID="lblPMID" runat="server" Text='<%# Eval("PM_RM_ID") %>' Visible="False" meta:resourcekey="lblPMIDResource1"></asp:Label>
                <asp:Label ID="lblDBLeaderGuid" runat="server" Text='<%# Eval("PM_GUID") %>' Visible="False" meta:resourcekey="lblDBLeaderGuidResource1"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="專案代理人" SortExpression="AGENT_NAME" meta:resourcekey="TemplateFieldResource3">
            <ItemTemplate>
                <asp:Label ID="lblAgent" runat="server" meta:resourcekey="lblAgentResource1"></asp:Label>
                <asp:Label ID="lblAgentID" runat="server" Text='<%# Eval("PROJ_AGENT_RM_ID") %>' Visible="False" meta:resourcekey="lblAgentIDResource1"></asp:Label>
                <asp:Label ID="lblDBAgentGuid" runat="server" Text='<%# Eval("AGENT_GUID") %>' Visible="False" meta:resourcekey="lblDBAgentGuidResource1"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>        
    </Columns>
</Fast:Grid>
    </ContentTemplate>
</asp:UpdatePanel>
