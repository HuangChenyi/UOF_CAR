<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="PMS_Audit_Default" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="../Common/UC_MyAudit.ascx" TagName="UC_MyAudit" TagPrefix="uc4" %>
<%@ Register Src="../Common/UC_WaitAudit.ascx" TagName="UC_WaitAudit" TagPrefix="uc3" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc2" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A" Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=B03F5F7F11D50A3A" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc2" %>
<%@ Register Src="../Common/UC_ProjectStatusDDL.ascx" TagName="UC_ProjectStatusDDL" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

   
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function OnValueChanging(sender, args)
        {
            if (args.get_newValue() == "")
            {
                args.set_newValue(args.get_oldValue());
            }
        }
    </script>
    <div style="padding-left: 0px; padding-top: 0px">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="Red" ForeColor="White" meta:resourcekey="ValidationSummary1Resource1" />
    </div>
    <table width="100%"><tr><td valign="top">
        <telerik:RadTabStrip ID="rtsTab" MultiPageID="rmpTab" runat="server" SelectedIndex="0" meta:resourcekey="rtsTabResource1">
            <Tabs>
                <telerik:RadTab runat="server" Text="待審核" Value="wait" PageViewID="rpvWait" Selected="True" meta:resourcekey="RadTabResource1">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="我送審的" Value="my" PageViewID="rpvMy" meta:resourcekey="RadTabResource2">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage ID="rmpTab" runat="server" Width="100%" BackColor="White" meta:resourcekey="rmpTabResource1">
            <telerik:RadPageView ID="rpvWait" runat="server" Selected="true" meta:resourcekey="rpvWaitResource1">
                 <uc3:UC_WaitAudit id="UC_WaitAudit1" runat="server">
                    </uc3:UC_WaitAudit>
            </telerik:RadPageView>
            <telerik:RadPageView ID="rpvMy" runat="server" meta:resourcekey="rpvMyResource1">
                    <telerik:RadToolBar ID="toolBarMyAudit" runat="server" Width="100%" OnButtonClick="toolBarMyAudit_ButtonClick" meta:resourcekey="toolBarMyAuditResource1">
                        <Items>
                            <telerik:RadToolBarButton runat="server" Value="ProjStatus" meta:resourcekey="RadToolBarButtonResource1">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text="專案狀態" meta:resourcekey="Label1Resource1"></asp:Label>
                                            </td>
                                            <td>
                                                <uc1:UC_ProjectStatusDDL runat="server" ID="ucProjectStatusDDL"></uc1:UC_ProjectStatusDDL>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Value="AuditDate" meta:resourcekey="RadToolBarButtonResource3">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text="送審期間" meta:resourcekey="Label2Resource1"></asp:Label>
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="rdpAuditStart" Runat="server">
                                                    <DateInput ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                                                </telerik:RadDatePicker>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label3" runat="server" Text="~" meta:resourcekey="Label3Resource1"></asp:Label>
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="rdpAuditEnd" Runat="server">
                                                    <DateInput ClientEvents-OnValueChanging="OnValueChanging"></DateInput>
                                                </telerik:RadDatePicker>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Text="查詢" Value="btnQuery"
                                 ClickedImageUrl="~/Common/Images/Icon/icon_m39.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                                 HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif" ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource5">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6">
                            </telerik:RadToolBarButton>
                        </Items>
                    </telerik:RadToolBar>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <uc4:UC_MyAudit id="UC_MyAudit1" runat="server">
                            </uc4:UC_MyAudit>
                        </ContentTemplate>
                        <Triggers>
<asp:AsyncPostBackTrigger ControlID="toolBarMyAudit" EventName="ButtonClick"></asp:AsyncPostBackTrigger>
</Triggers>
                    </asp:UpdatePanel>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </td></tr></table>
    <asp:CustomValidator ID="cvMessage" runat="server" BackColor="Red" Display="None"
        ForeColor="White" Visible="False" Width="80px" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
</asp:Content>
