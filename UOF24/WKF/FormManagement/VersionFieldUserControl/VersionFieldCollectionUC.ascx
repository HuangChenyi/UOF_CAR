<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUCs_VersionFieldCollectionUC" Codebehind="VersionFieldCollectionUC.ascx.cs" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/hiddenFieldUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/SingleLineTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/MultiLineTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/AutoNumberUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/CalculateTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/CheckBoxUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DataGridUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DateSelectUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DropDownListUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/FileButtonUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/HyperLinkUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/MultiLineTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/NumberTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/SingleLineTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/RadioButtonUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/TimeSelectUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/ProposerUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/AllUserSetUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/AggregateTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/hiddenFieldUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/LimitUserSetUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/UserAgentUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/HtmlEditorUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/DisplayUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/CanvasUC.ascx" %>
<style>
.ul
{
    border-bottom:1px dotted silver;
    vertical-align:middle;
}
</style>

<div style="vertical-align:middle;">
<asp:Table ID="tbFieldCollection" runat="server" EnableViewState="False"  BorderWidth="0px" CellPadding="2" Width="100%" meta:resourcekey="tbFieldCollectionResource1"/>
</div>
<asp:Label ID="lblSelectAll" runat="server" Text="全選" Visible="False" meta:resourcekey="lblSelectAllResource1"></asp:Label>
<asp:Label ID="lblFormNumfield" runat="server" Text=" * 表單編號欄位  " Visible="False" meta:resourcekey="lblFormNumfieldResource1"></asp:Label>
<asp:Label ID="lblMemo" runat="server" Text="註：" Visible="False" meta:resourcekey="lblMemoResource1"></asp:Label>
<asp:Label ID="lblhiddenFieldNote" runat="server" Text="隱藏欄位" Visible="False"  meta:resourcekey="lblhiddenFieldNoteResource1"></asp:Label>