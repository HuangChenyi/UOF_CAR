<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_Configuration_Default" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="Default.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register src="Leave/UC_Leave.ascx" tagname="UC_Leave" tagprefix="uc2" %>
<%@ Register src="LeaveDays/UC_LeaveDays.ascx" tagname="UC_LeaveDays" tagprefix="uc3" %>
<%@ Register src="Setting/UC_Setting.ascx" tagname="UC_Setting" tagprefix="uc4" %>
<%@ Register src="TourAllowance/UC_TourAllowance.ascx" tagname="UC_TourAllowance" tagprefix="uc5" %>
<%@ Register Src="~/Common/Organization/UC_DeptManagerTree.ascx" TagPrefix="uc1" TagName="UC_DeptManagerTree" %>
<%@ Register Src="OverTime/UC_OverTimeParameter.ascx" tagName="UC_OverTimeParameter" tagPrefix="uc6" %>
<%@ Register Src="OverTime/UC_OverTimeCarrySetting.ascx" tagName="UC_OverTimeCarrySetting" tagPrefix="uc7"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <uc1:UC_DeptManagerTree runat="server" ID="UC_DeptManagerTree" ShowSuperiorTree="false" ShowDeptManagerTree="true" DisplayActiveControl="true"/>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="部門" Visible="false"></asp:Label>
       <telerik:RadTabStrip ID="rdTab" runat="server" SelectedIndex="0" MultiPageID="rdmultiPage" CausesValidation="False" meta:resourcekey="rdTabResource1">
                    <Tabs>                       
                        <telerik:RadTab runat="server" Text="假別" Value="tab0" PageViewID="rdPage1" meta:resourcekey="RadTabResource1" Selected="True"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="年休天(時)數" Value="tab1" PageViewID="rdPage2" meta:resourcekey="RadTabResource2"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="旅遊補助" Value="tab2" PageViewID="rdPage3" meta:resourcekey="RadTabResource3"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="加班參數" Value="tab4" PageViewID="rdPage5" meta:resourcekey="RadTabResource5"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="加班進位設定" Value="tab5" PageViewID="rdPage6" meta:resourcekey="RadTabResource6"></telerik:RadTab>
                        <telerik:RadTab runat="server" Text="其他參數" Value="tab3" PageViewID="rdPage4" meta:resourcekey="RadTabResource4"></telerik:RadTab>                       
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage ID="rdmultiPage" runat="server" BackColor="White" meta:resourcekey="rdmultiPageResource1" SelectedIndex="0">
                    <telerik:RadPageView ID="rdPage1" runat="server" Width="100%" meta:resourcekey="rdPage1Resource1">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline" >
                            <ContentTemplate>
                                <uc2:UC_Leave ID="UC_Leave1" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="rdPage2" runat="server" Width="100%" meta:resourcekey="rdPage2Resource1">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" RenderMode="Inline">
                            <ContentTemplate>
                                <uc3:UC_LeaveDays ID="UC_LeaveDays1" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="rdPage3" runat="server" Width="100%" meta:resourcekey="rdPage3Resource1">
                        <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional" RenderMode="Inline">
                            <ContentTemplate>
                                <uc5:UC_TourAllowance ID="UC_TourAllowance1" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="rdPage4" runat="server" Width="100%" meta:resourcekey="rdPage4Resource1">
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional" RenderMode="Inline">
                            <ContentTemplate>
                                <uc4:UC_Setting ID="UC_Setting1" runat="server" />
                            </ContentTemplate>
                            </asp:UpdatePanel>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="rdPage5" runat="server" Width="100%">
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional" RenderMode="Inline">
                            <ContentTemplate>
                                <uc6:UC_OverTimeParameter runat="server" id="UC_OverTimeParameter1" />
                            </ContentTemplate>
                            </asp:UpdatePanel>
                    </telerik:RadPageView>
                    <telerik:RadPageView ID="rdPage6" runat="server" Width="100%">
                        <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional" RenderMode="Inline">
                            <ContentTemplate>
                                <uc7:UC_OverTimeCarrySetting runat="server" id="UC_OverTimeCarrySetting1" />
                            </ContentTemplate>
                            </asp:UpdatePanel>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>                                        
</asp:Content>


