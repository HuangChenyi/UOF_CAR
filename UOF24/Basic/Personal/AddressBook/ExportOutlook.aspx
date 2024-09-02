<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Basic_Personal_AddressBook_ExportOutlook" Title="匯出通訊錄資料" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ExportOutlook.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="White" BackColor="Red" resourcekey="ValidationSummary1Resource1" />
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table  class ="PopTable" cellspacing="1" cellpadding="1"  width="100%">
            <tr>
                <td style="text-align:left; white-space:nowrap">
                    <asp:Label ID="Label1" runat="server" Text="匯出資料範圍" meta:resourcekey="Label1Resource1"></asp:Label></td>
                <td>
                    <table width="100%">
                        <tr>
                            <td>
                                 <asp:RadioButtonList ID="RadioButtonList1" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"   
                                        meta:resourcekey="RadioButtonList1Resource1">
                                     <asp:ListItem Value="ALL" meta:resourcekey="ListItemResource1">全部通訊錄資料</asp:ListItem>
                                    <asp:ListItem Value="ByClass" meta:resourcekey="ListItemResource2">依據通訊錄類別</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <telerik:RadTreeView ID="rtvTreeMyAddr" runat="server" Height="200px"  CheckBoxes="true" TriStateCheckBoxes="true" EnableNodeTextHtmlEncoding="true">
                                </telerik:RadTreeView>
                            </td>
                        </tr>
                    </table> 
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>       

    <asp:Label ID="lblSelect" runat="server" Text="請選擇通訊錄類別" Visible="False" meta:resourcekey="Label2Resource1"></asp:Label>
    <asp:CustomValidator ID="cvMessage" runat="server" BackColor="Red" Display="None"
        ForeColor="White" Visible="False" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
    <asp:Label ID="lblExportToExcellMsg" runat="server" Text="匯出至Excel" Visible = "False" 
        meta:resourcekey="lblExportToExcellMsgResource1"></asp:Label>       
    
    <asp:Label ID="lblName" runat="server" Text="*Name" Visible = "False" 
        meta:resourcekey="lblNameResource1"></asp:Label>
    <asp:Label ID="lblEmail" runat="server" Text="Email" Visible = "False" 
        meta:resourcekey="lblEmailResource1"></asp:Label>
    <asp:Label ID="lblClass" runat="server" Text="*Class" Visible = "False" 
        meta:resourcekey="lblClassResource1"></asp:Label>
    <asp:Label ID="lblBirthday" runat="server" Text="Birthday" Visible = "False" 
        meta:resourcekey="lblBirthdayResource1"></asp:Label>
    <asp:Label ID="lblAddress" runat="server" Text="Address" Visible = "False" 
        meta:resourcekey="lblAddressResource1"></asp:Label>
    <asp:Label ID="lblSex" runat="server" Text="Gender(M,F)" Visible = "False" 
        meta:resourcekey="lblSexResource1"></asp:Label>
    <asp:Label ID="lblTelephone" runat="server" Text="Telephone" Visible = "False" 
        meta:resourcekey="lblTelephoneResource1"></asp:Label>
    <asp:Label ID="lblMobile" runat="server" Text="Mobile" Visible = "False" 
        meta:resourcekey="lblMobileResource1"></asp:Label>
    <asp:Label ID="lblSKYPE" runat="server" Text="Skype" Visible = "False" 
        meta:resourcekey="lblSKYPEResource1"></asp:Label>
    <asp:Label ID="lblMSN" runat="server" Text="Msn" Visible = "False" 
        meta:resourcekey="lblMSNResource1"></asp:Label>
    <asp:Label ID="lblYAHOO" runat="server" Text="Yahoo" Visible = "False" 
        meta:resourcekey="lblYAHOOResource1"></asp:Label>
    <asp:Label ID="lblQQ" runat="server" Text="QQ" Visible = "False" 
        meta:resourcekey="lblQQResource1"></asp:Label>
    <asp:Label ID="lblBLOG" runat="server" Text="Blog" Visible = "False" 
        meta:resourcekey="lblBLOGResource1"></asp:Label>
</asp:Content>

