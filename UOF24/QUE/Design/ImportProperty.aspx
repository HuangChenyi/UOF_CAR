<%@ Page Title="設定填寫人屬性" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="QUE_Design_ImportProperty" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" Codebehind="ImportProperty.aspx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Fast:Grid ID="gridProperty" runat="server" AutoGenerateColumns="False"
     DataKeyOnClientWithCheckBox="False" 
     Width="100%" DataKeyNames="PROPERTY_GUID,PROPERTY_TYPE" AllowPaging="True"
     EnhancePager="True"  PageSize="15"
    OnRowDataBound="gridProperty_RowDataBound" HorizontalAlign="Center" 
        AutoGenerateCheckBoxColumn="False" 
    onrowcommand="gridProperty_RowCommand" AllowSorting="True" 
                >
                <EnhancePagerSettings
        ShowHeaderPager="True">
                </EnhancePagerSettings>
                <Columns>
                    <asp:TemplateField HeaderText="屬性" meta:resourcekey="TemplateFieldResource1" >
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnProperty" runat="server" Text='<%#: Eval("PROPERTY_NAME") %>'
                    OnClick="lbtnProperty_Click" meta:resourcekey="lbtnPropertyResource1"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Width="30%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="屬性值" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <table>
                            <tr>
                                <td style="padding-right:5px">
                                    <asp:LinkButton ID="lbtnSelect" runat="server" Text="全選" 
                            CommandName="selectAll" meta:resourcekey="lbtnSelectResource1"></asp:LinkButton>
                                </td>
                                <td  style="padding-right:5px">
                                    <asp:LinkButton ID="lbtnCancel" runat="server" Text="取消" 
                            CommandName="cancelAll" meta:resourcekey="lbtnCancelResource1"></asp:LinkButton>
                                </td>
                                <td>
                                    <asp:CheckBoxList ID="cbItems" runat="server" RepeatDirection="Horizontal" 
                                        meta:resourcekey="cbItemsResource1">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            </table>
                        </ItemTemplate>
                        <ItemStyle Width="70%" Wrap="False"/>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PROPERTY_TYPE" Visible="False" 
                        meta:resourcekey="BoundFieldResource1" />
                </Columns>
            </Fast:Grid>
        </ContentTemplate>
    </asp:UpdatePanel>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" EnablePaging="True" MaximumRowsParameterName="intMaxRows"
    OldValuesParameterFormatString="original_{0}" SelectCountMethod="GetProperties_Count"
    SelectMethod="GetProperties" SortParameterName="strSortExpression" StartRowIndexParameterName="intStartIndex"
    TypeName="Ede.Uof.EIP.QUE.PropertiesUCO">
    <SelectParameters>
        <asp:Parameter Name="intStartIndex" Type="Int32" />
        <asp:Parameter Name="intMaxRows" Type="Int32" />
        <asp:Parameter Name="strSortExpression" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:Label ID="lblType" runat="server" Text="新增/維護填寫人屬性" Visible="False" 
        meta:resourcekey="lblTypeResource1"></asp:Label>
<asp:Label ID="lblDesignID" runat="server" Visible="False" 
        meta:resourcekey="lblDesignIDResource1"></asp:Label>
</asp:Content>


