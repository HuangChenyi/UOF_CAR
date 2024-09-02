<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_ManageFormCondition"
    Title="維護條件" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="ManageFormCondition.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td style="text-align: left;">
                <asp:RadioButton ID="rbAnd" runat="server" Checked="True" GroupName="grpAndOr" Text="並且(AND)"
                    meta:resourcekey="rbAndResource1" /><asp:RadioButton ID="rbOr" runat="server" GroupName="grpAndOr"
                        Text="或者(OR)" meta:resourcekey="rbOrResource1" />
                <asp:CustomValidator ID="CustomValidatorCombine" runat="server" Display="Dynamic"
                    ErrorMessage="條件至少要選取兩個以上" meta:resourcekey="CustomValidatorCombineResource1"></asp:CustomValidator>

            </td>
        </tr>
        <tr>
            <td>
                <Fast:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                    AutoGenerateColumns="False" DataKeyNames="COND_ID"
                    Width="100%"
                    DataKeyOnClientWithCheckBox="False"
                    DefaultSortDirection="Ascending"
                    EnhancePager="True" PageSize="15">
                    <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                    <Columns>
                        <asp:BoundField DataField="COND_NAME" HeaderText="可用的判斷式或條件" meta:resourcekey="BoundFieldResource1" />
                        <asp:TemplateField Visible="False" meta:resourcekey="TemplateFieldResource1">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("COND_ID") %>' ID="TextBox1" __designer:wfdid="w2" meta:resourcekey="TextBox1Resource1"></asp:TextBox>

                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("COND_ID") %>' ID="lblCondId" __designer:wfdid="w1" meta:resourcekey="lblCondIdResource1"></asp:Label>

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </Fast:Grid>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <center>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                </center>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblInfiniteLoop" runat="server" Text="錯誤！條件不允許互相引用！" Visible="False" meta:resourcekey="lblInfiniteLoopResource1"></asp:Label>
</asp:Content>
