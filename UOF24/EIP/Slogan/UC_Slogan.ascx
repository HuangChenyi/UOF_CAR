<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Slogan_UC_Slogan" Codebehind="UC_Slogan.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<style type="text/css">
td.JustAddBorder table tr td {
    border-width:1px;
    border-style:solid;
    line-height:normal;
}

</style>
<script type="text/javascript">
    function OpenMonie(e)
    {
        window.open(e);
    }
    function OnClientClicked(sender, args)
    {
        OpenMonie(sender.get_value());
    }
</script>
   <table width="99%" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td style="width:100%" class="JustAddBorder">
                <Fast:Grid ID="SloganGrid" runat="server" AutoGenerateCheckBoxColumn="False"
                    AllowSorting="True" AutoGenerateColumns="False"
                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                    EnhancePager="True" PageSize="15"
                    Width="100%" ShowHeader="False"
                    BorderStyle="None" BorderWidth="0px" OnRowDataBound="SloganGrid_RowDataBound">
                    <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                    <Columns>
                        <asp:TemplateField HeaderText="語錄" meta:resourcekey="BoundFieldResource1" ItemStyle-BorderStyle="None" ItemStyle-CssClass="editorcontentstyle JustAddBorder">
                            <ItemTemplate>
                                <asp:Label ID="lblSLOGAN_CONTENT" runat="server" Text=""></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </Fast:Grid>
            </td>
        </tr>
        <tr>
            <td style="width: 100%; text-align:right">
                 <telerik:RadButton ID="rdbtnPlay" runat="server" Visible="false"></telerik:RadButton>
            </td>
        </tr>
    </table>
