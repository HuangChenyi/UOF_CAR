<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SetupExternalFlowSiteUrl" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="SetupExternalFlowSite.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <table cellspacing="1" class="PopTable" style="width: 100%">
        <tr >
            <td class="PopTableLeftTD">
                 <asp:Label ID="Label2" runat="server" Text="組件分類" 
                     meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <table>
                    <tr>
                        <td>
                            <asp:DropDownList ID="ddlExternalDllClass" runat="server" AutoPostBack="True" 
                                onselectedindexchanged="ddlExternalDllClass_SelectedIndexChanged" 
                                meta:resourcekey="ddlExternalDllClassResource1">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <telerik:RadButton ID="btnSetting" runat="server" Text="設定" meta:resourcekey="btnSettingResource1" OnClick="btnSetting_Click1"></telerik:RadButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="Label1" runat="server" Text="組件名稱" 
                    meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <table>
                    <tr>
                        <td>
                            <asp:DropDownList ID="ddlExternalSetting" runat="server" 
                                meta:resourcekey="ddlExternalSettingResource1">
                            </asp:DropDownList>
                            <asp:CustomValidator ID="cvSelectDll" runat="server" Display="Dynamic" 
                                ErrorMessage="請選擇組件" meta:resourcekey="cvSelectDllResource1"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>
                
            </td>
        </tr>
    </table>
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblNoSetup" runat="server" Text="不設定" Visible="False" 
        meta:resourcekey="lblNoSetupResource1" ></asp:Label>
</asp:Content>

