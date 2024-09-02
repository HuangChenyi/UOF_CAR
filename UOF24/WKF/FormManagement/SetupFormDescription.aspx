<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SetupFormDescription.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.SetupFormDescription" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>
<%@ Register Src="~/Common/HtmlEditor/UC_HtmlEditor.ascx" TagPrefix="uc1" TagName="UC_HtmlEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script id="redirectjs" type="text/javascript">
        //導頁
        function RedirectPage(url) {
            window.location = url;
            return false;
        }
        function SetRadioName() {

        }
    </script>
    <table style="width:100%">
        <tr>
            <td colspan="2">
                <table>
                    <tr>
                        <td>
                            <telerik:RadButton ID="ibtnDesignField" runat="server" Text="1.設計欄位>>" CausesValidation="False"
                                meta:resourcekey="ibtnDesignFieldResource1" AutoPostBack="false" Style="position: relative;">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupCondition" runat="server" Text="2.設定條件>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupConditionResource1" AutoPostBack="false" Style="position: relative;">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupNotify" runat="server" Text="3.設定起結案通知>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupNotifyResource1" AutoPostBack="false" Style="position: relative;">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnDesignFlow" runat="server" Text="4.設定流程>>" CausesValidation="False"
                                meta:resourcekey="ibtnDesignFlowResource1" AutoPostBack="false" Style="position: relative;">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupRelease" runat="server" Text="5.設定發佈資訊>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupReleaseResource1" AutoPostBack="false" Style="position: relative;">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupMail" runat="server" Text="6.設定郵件樣板>>" CausesValidation="False"
                                meta:resourcekey="ibtnSetupMailResource1" AutoPostBack="false" Style="position: relative;">
                            </telerik:RadButton>
                        </td>
                        <td>
                            <telerik:RadButton ID="ibtnSetupDes" runat="server" Text="7.設定使用說明>>" CausesValidation="False" 
                                AutoPostBack="false" meta:resourcekey="ibtnSetupDesResource1" Style="position: relative;">
                            </telerik:RadButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:UpdatePanel runat="server" ID="updatepanel1">
                    <ContentTemplate>
                        <telerik:RadToolBar ID="toolbar" runat="server" Width="100%"
                            OnButtonClick="toolbar_ButtonClick"
                            meta:resourcekey="toolbarResource1" SingleClick="None">
                            <Items>
                                <telerik:RadToolBarButton Value="dropdownlist" runat="server" meta:resourcekey="RadToolBarButtonResource4">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td style="vertical-align: middle">&nbsp;
                                                    <asp:Label ID="lblLanguage" runat="server" Text="語系：" meta:resourcekey="lblLanguageResource1"></asp:Label>
                                                </td>
                                                <td style="vertical-align: middle">
                                                    <asp:DropDownList ID="ddlLanguage" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlLanguage_SelectedIndexChanged" meta:resourcekey="ddlLanguageResource1">

                                                    </asp:DropDownList>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="checkbox" meta:resourcekey="RadToolBarButtonResource5">
                                    <ItemTemplate>
                                        &nbsp;
                                        <asp:CheckBox ID="cbEnable" runat="server" Text="啟用" AutoPostBack="True" meta:resourcekey="cbEnableResource1" />
                                        &nbsp;                                                                              
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="save" Text="儲存" ImageUrl="~/Common/Images/Icon/icon_m66.png" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" ImageUrl="~/App_Themes/DefaultTheme/images/toolbarSp.jpg" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="label" meta:resourcekey="RadToolBarButtonResource3">
                                    <ItemTemplate>
                                        &nbsp;
                                        <asp:Label ID="lblSaveSuccess" runat="server" Text="儲存成功!" ForeColor="Red" Visible="False" meta:resourcekey="lblSaveSuccessResource1"></asp:Label>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:UpdatePanel runat="server" ID="updatepanel2">
                    <ContentTemplate>
                        <uc1:UC_HtmlEditor runat="server" ID="htmlEditor" EnableInsertFiles="false" EnableInsertDMS="false" ModuleName="WKF" Width="100%" Height="600px" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblConfirm1" runat="server" Text="取消預設後，將以「" Visible="False" meta:resourcekey="lblConfirm1Resource1"></asp:Label>
    <asp:Label ID="lblConfirm2" runat="server" Text="」作為預設語系" Visible="False" meta:resourcekey="lblConfirm2Resource1"></asp:Label>
    <asp:Label ID="lblConfirm3" runat="server" Text="至少要設定一個預設語系" Visible="False" meta:resourcekey="lblConfirm3Resource1"></asp:Label>
</asp:Content>
