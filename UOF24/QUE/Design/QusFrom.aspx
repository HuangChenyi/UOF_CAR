<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_QusFrom" Title="" Culture="auto"  meta:resourcekey="PageResource1" UICulture="auto" Codebehind="QusFrom.aspx.cs" %>
   
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%" cellspacing="1" class="PopTable">       
        <tr>
            <td  style="text-align:left;">
                <telerik:RadButton ID="ibtnAddQue" runat="server" Text="新增問卷" OnClick="ibtnAddQue_Click" meta:resourcekey="ibtnAddQueResource1"></telerik:RadButton>
                
            </td>
        </tr>
        <tr>
            <td>
                <Fast:Grid ID="gridProperty" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" 
                    DataKeyNames="DESIGN_MASTER_GUID" DataKeyOnClientWithCheckBox="False" 
                    EnhancePager="True" PageSize="15"   Width="100%"
                    OnRowDataBound="gridProperty_RowDataBound" OnRowCommand="gridProperty_RowCommand"
                    >
                    <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl=""
                        NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass=""
                        PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""
                        ShowHeaderPager="True" />
                    <Columns>
                        <asp:TemplateField meta:resourcekey="TemplateFieldResource1" HeaderText="" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <telerik:RadButton ID="ibtnSelect" runat="server"  CommandName="CopyQue" CommandArgument='<%#: Eval("DESIGN_MASTER_GUID") %>'
                                    Text="選取" meta:resourcekey="ibtnSelectResource1"></telerik:RadButton>                                                            
                            </ItemTemplate>
                            <ItemStyle Width="80px" HorizontalAlign="Center"/>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="問卷名稱" meta:resourcekey="TemplateFieldResource2" SortExpression="DESIGN_NAME" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnName" runat="server" Text='<%#: Eval("DESIGN_NAME") %>' meta:resourcekey="lbtnNameResource1"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Width="500px" HorizontalAlign="Center"/>
                            <ItemStyle Width="500px" />
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="狀態" DataField="QUS_MASTER_STATUS" SortExpression="QUS_MASTER_STATUS" HeaderStyle-HorizontalAlign="Center"
                             HeaderStyle-Width="80px" ItemStyle-HorizontalAlign="Left" meta:resourcekey="BoundFieldResource1" />
                        <asp:BoundField HeaderText="公開" DataField="IS_PUBLISH" SortExpression="IS_PUBLISH" HeaderStyle-Width="80px" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Left" meta:resourcekey="BoundFieldResource2" />
                        <asp:BoundField HeaderText="記名" DataField="IS_REGISTERED" SortExpression="IS_REGISTERED" HeaderStyle-Width="80px" HeaderStyle-HorizontalAlign="Center" 
                            ItemStyle-HorizontalAlign="Left" meta:resourcekey="BoundFieldResource3" />
                    </Columns>
                </Fast:Grid>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
                    OldValuesParameterFormatString="original_{0}" SelectCountMethod="QueryCopyQus_Count"
                    SelectMethod="QueryCopyQus" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
                    TypeName="Ede.Uof.EIP.QUE.QusUCO">
                    <SelectParameters>
                        <asp:Parameter Name="condition" Type="Object" />
                        <asp:Parameter Name="intStartIndex" Type="Int32" />
                        <asp:Parameter Name="intMaxRows" Type="Int32" />
                        <asp:Parameter Name="strSortExpression" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblPublishY" runat="server" Text="公開" Visible="False" meta:resourcekey="lblPublishYResource1"></asp:Label>
    <asp:Label ID="lblPublishN" runat="server" Text="不公開" Visible="False" meta:resourcekey="lblPublishNResource1"></asp:Label>
    <asp:Label ID="lblRegisteredY" runat="server" Text="記名" Visible="False" meta:resourcekey="lblRegisteredYResource1"></asp:Label>
    <asp:Label ID="lblRegisteredN" runat="server" Text="不記名" Visible="False" meta:resourcekey="lblRegisteredNResource1"></asp:Label>
    <asp:Label ID="lblQueryQus" runat="server" Text="瀏覽問卷" Visible="False" meta:resourcekey="lblQueryQusResource1"></asp:Label>
    <asp:Label ID="lblDS" runat="server" Text="製作中" Visible="False" meta:resourcekey="lblDSResource1"></asp:Label>
    <asp:Label ID="lblEM" runat="server" Text="調查中" Visible="False" meta:resourcekey="lblEMResource1"></asp:Label>
    <asp:Label ID="lblCL" runat="server" Text="結束" Visible="False" meta:resourcekey="lblCLResource1"></asp:Label>
    <asp:Label ID="lblSP" runat="server" Text="中止" Visible="False" meta:resourcekey="lblSPResource1"></asp:Label>
    <asp:Label ID="lblAddQue" runat="server" Text="新增問卷" Visible="False" meta:resourcekey="lblAddQueResource1"></asp:Label>
</asp:Content>
