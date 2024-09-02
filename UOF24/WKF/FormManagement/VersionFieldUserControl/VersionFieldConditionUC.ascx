<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormManagement_VersionFieldUserControl_VersionFieldConditionUC" Codebehind="VersionFieldConditionUC.ascx.cs" %>
<%@ Register Src="VersionFieldUC.ascx" TagName="VersionFieldUC" TagPrefix="uc1" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc2" %>

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
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/AggregateTextUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/ProposerUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/hiddenFieldUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/AllUserSetUC.ascx" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/CanvasUC.ascx" %>

<table border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
                RepeatDirection="Horizontal" meta:resourcekey="RadioButtonList1Resource1">
                <asp:ListItem Selected="True" Value="Normal" meta:resourcekey="ListItemResource1" Text="一般條件"></asp:ListItem>
                <asp:ListItem Value="Range" meta:resourcekey="ListItemResource2" Text="範圍條件"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td valign="bottom">
            <asp:CustomValidator ID="CustomValidatorNormal" runat="server" Display="Dynamic" ErrorMessage="目前無可設定條件" meta:resourcekey="CustomValidatorNormalResource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidatorRange" runat="server" Display="Dynamic" ErrorMessage="目前無可設定範圍條件" meta:resourcekey="CustomValidatorRangeResource1"></asp:CustomValidator>
            <asp:CustomValidator ID="cvRangeNotAllowNull" runat="server" ErrorMessage="請輸入條件範圍" Display="Dynamic" meta:resourcekey="cvRangeNotAllowNullResource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="範圍最大值需大於最小值" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="你沒有選擇或輸入條件的值！" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
        </td>
    </tr>
</table>

<table cellspacing="1" class="PopTable" width="50%" id="TableNormal" runat="server" visible="true" enableviewstate="true">
    <tr>
        <td style="width: 30%; height: 25px; text-align: center" class="PopTableLeftTD">
            <asp:Label ID="Label3" runat="server" Text="條件設定" meta:resourcekey="Label3Resource1"></asp:Label>
        </td>
        <td style="padding: 0 0 0 0; width: 50px;" class="PopTableLeftTD">
            <table width="50px" style="height: 100%">
                <tr>
                    <td style="height: 100%; width: 50px; text-align: center">
                        <asp:Label ID="Label4" runat="server" Text="OP" meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                </tr>
            </table>
        </td>
        <td align="center" class="PopTableLeftTD" style="text-align: center; width: 100%">
            <asp:Label ID="Label5" runat="server" Text="比較資料" meta:resourcekey="Label5Resource1"></asp:Label>
        </td>
    </tr>
    <tr style="background-color: white">
        <td style="height: 40px; background-color: White; vertical-align: middle">
            <center>
                <asp:DropDownList
                    ID="ddlFieldNameNormal" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCenterValue_SelectedIndexChanged" meta:resourcekey="ddlFieldNameNormalResource1">
                </asp:DropDownList>
            </center>
        </td>
        <td align="center" style="height: 40px; vertical-align: middle">
            <asp:DropDownList ID="ddlOpNormal" runat="server" meta:resourcekey="ddlOpNormalResource1"></asp:DropDownList>
        </td>
        <td style="height: 40px; text-align: center; background-color: White; vertical-align: middle">
            <center>
                <asp:Panel ID="PanelNormal" runat="server" meta:resourcekey="PanelNormalResource1">
                    <asp:Label ID="lblDialogResult" runat="server" ForeColor="Blue" Visible="false"></asp:Label>
                    <asp:Label ID="lblDialogResultValue" runat="server" Visible="false"></asp:Label>
                    <uc2:UC_BtnChoiceOnce ID="ucBtnChoiceOnce" runat="server" ShowMember="False" Visible="false" />
                </asp:Panel>
            </center>
        </td>
    </tr>
</table>

<table cellspacing="1" class="PopTable" width="100%" id="TableRange" runat="server" visible="false">
    <tr>
        <td align="center" class="PopTableLeftTD" style="text-align: center;">
            <asp:Label ID="lblLeftValue" runat="server" Text="比較資料" meta:resourcekey="lblLeftValueResource1"></asp:Label></td>
        <td style="width: 9%; height: 25px; text-align: center" class="PopTableLeftTD">
            <asp:Label ID="lblLeftOp" runat="server" Text="OP" meta:resourcekey="lblLeftOpResource1"></asp:Label>
        </td>
        <td style="width: 24%; height: 25px; text-align: center" class="PopTableLeftTD">
            <asp:Label ID="lblCenterValue" runat="server" Text="條件設定" meta:resourcekey="lblCenterValueResource1"></asp:Label>
        </td>
        <td style="width: 9%; height: 25px; text-align: center" class="PopTableLeftTD">
            <asp:Label ID="lblRightOp" runat="server" Text="OP" meta:resourcekey="lblRightOpResource1"></asp:Label>
        </td>
        <td align="center" class="PopTableLeftTD" style="text-align: center;">
            <asp:Label ID="lblRightValue" runat="server" Text="比較資料" meta:resourcekey="lblRightValueResource1"></asp:Label>
        </td>
    </tr>
    <tr style="background-color: white">
        <td style="height: 40px; text-align: center; background-color: white; vertical-align: middle;">
            <center>
                <asp:Panel ID="PanelRangeA" runat="server" meta:resourcekey="PanelRangeAResource1"></asp:Panel>
            </center>
        </td>
        <td style="height: 40px; text-align: center; background-color: white; vertical-align: middle">
            <center>
                <asp:DropDownList ID="ddlLeftOpRange" runat="server" meta:resourcekey="ddlLeftOpRangeResource1">
                    <asp:ListItem Value="Less" meta:resourcekey="ListItemResource3" Text="&lt;"></asp:ListItem>
                    <asp:ListItem Value="LessEqual" meta:resourcekey="ListItemResource4" Text="&lt;="></asp:ListItem>
                </asp:DropDownList>
            </center>
        </td>
        <td align="center" style="height: 40px; text-align: center; background-color: white; vertical-align: middle">
            <asp:DropDownList
                ID="ddlFieldNameRange" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCenterValue_SelectedIndexChanged" meta:resourcekey="ddlFieldNameRangeResource1">
            </asp:DropDownList>
        </td>
        <td align="center" style="height: 40px; text-align: center; background-color: white; vertical-align: middle">
            <asp:DropDownList ID="ddlRightOpRange" runat="server" meta:resourcekey="ddlRightOpRangeResource1">
                <asp:ListItem Value="Less" meta:resourcekey="ListItemResource5" Text="&lt;"></asp:ListItem>
                <asp:ListItem Value="LessEqual" meta:resourcekey="ListItemResource6" Text="&lt;="></asp:ListItem>
            </asp:DropDownList>
        </td>
        <td align="center" style="height: 40px; text-align: center; background-color: white; vertical-align: middle;">
            <center>          
                 <asp:Panel ID="PanelRangeB" runat="server" meta:resourcekey="PanelRangeBResource1"></asp:Panel>
            </center>
        </td>
    </tr>
</table>


<asp:Label ID="lblTextDept" runat="server" Text="選取部門" Visible="false" meta:resourcekey="lblTextDeptResource1"></asp:Label>
<asp:Label ID="lblTextMemberGroup" runat="server" Text="選取群組" Visible="false" meta:resourcekey="lblTextMemberGroupResource1"></asp:Label>
<asp:Label ID="lblChooseFunction" runat="server" Text="選取職務" Visible="false" meta:resourcekey="lblChooseFunctionResource1"></asp:Label>
<%-- 申請資訊用 --%>
<asp:Label ID="lblApplyInformation" runat="server" Text="申請資訊" Visible="false" meta:resourcekey="lblApplyInformationResource1"></asp:Label>
<asp:Label ID="lblApplicant" runat="server" Text="申請者" Visible="false" meta:resourcekey="lblApplicantResource1"></asp:Label>
<asp:Label ID="lblApplicantDep" runat="server" Text="申請者部門" Visible="false" meta:resourcekey="lblApplicantDepResource1"></asp:Label>
<asp:Label ID="lblApplicantTitle" runat="server" Text="申請者職級" Visible="false" meta:resourcekey="lblApplicantTitleResource1"></asp:Label>
<asp:Label ID="lblUrgentLevel" runat="server" Text="緊急程度" Visible="false" meta:resourcekey="lblUrgentLevelResource1"></asp:Label>
<asp:Label ID="lblNormal" runat="server" Text="普通" Visible="false" meta:resourcekey="lblNormalResource1"></asp:Label>
<asp:Label ID="lblUrgent" runat="server" Text="急" Visible="false" meta:resourcekey="lblUrgentResource1"></asp:Label>
<asp:Label ID="lblMostUrgent" runat="server" Text="緊急" Visible="false" meta:resourcekey="lblMostUrgentResource1"></asp:Label>
