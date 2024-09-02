<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" Title="被知會表單"
    AutoEventWireup="true" Inherits="WKF_FormUse_FormHandle_FormAlert"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="FormAlert.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="../../Browse/UC_Query.ascx" TagName="UC_Query" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <table width="100%">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td style="width: 450px" align="center">
                                <table class="PopTable" cellspacing="1">
                                    <tr>
                                        <td class="PopTableHeader" style="height: 25px" align="center" colspan="2">
                                            <asp:Label ID="lblBasicQuery" runat="server" Text="基本查詢" meta:resourcekey="lblBasicQueryResource1"></asp:Label>
                                        </td>
                                    </tr>
                                    <colgroup class="PopTableLeftTD">
                                    </colgroup>
                                    <colgroup class="PopTableRightTD">
                                    </colgroup>
                                    <tr>
                                        <td style="height: 25px;" align="right"><font color=red>*</font>
                                            <asp:Label ID="lblTaskResult" runat="server" Text="表單狀態" meta:resourcekey="lblTaskResultResource1"></asp:Label></td>
                                        <td style="height: 25px;" align="left">&nbsp;<asp:DropDownList ID="DropDownList1"
                                            runat="server" meta:resourcekey="DropDownList1Resource1">
                                            <asp:ListItem Value="all" meta:resourcekey="ListItemResource1" Text="全部"></asp:ListItem>
                                            <asp:ListItem Value="1" meta:resourcekey="ListItemResource2" Text="已讀取"></asp:ListItem>
                                            <asp:ListItem Value="0" meta:resourcekey="ListItemResource3" Text="未讀取"></asp:ListItem>
                                        </asp:DropDownList></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 25px;" align="right"><font color=red>*</font>
                                            <asp:Label ID="lblBeginTime" runat="server" Text="申請日期" meta:resourcekey="lblBeginTimeResource1"></asp:Label></td>
                                        <td style="height: 25px;" align="left">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <telerik:RadDatePicker ID="rdpStartDate" runat="server"></telerik:RadDatePicker>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rdpStartDate"
                                                            Display="Dynamic" ErrorMessage="請輸入申請日期(起)" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator></td>
                                                    <td>～</td>
                                                    <td>
                                                        <telerik:RadDatePicker ID="rdpEndDate" runat="server"></telerik:RadDatePicker>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rdpEndDate"
                                                            Display="Dynamic" ErrorMessage="請輸入申請日期(迄)" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator></td>
                                                </tr>
                                            </table>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="wdcStartDate"
                                                ControlToValidate="wdcEndDate" Display="Dynamic" ErrorMessage="結束時間需晚於開始時間" Operator="GreaterThanEqual"  meta:resourcekey="CustomValidator1Resource1"
                                                Type="Date"></asp:CompareValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 25px;" align="right">
                                            <asp:Label ID="lblDocNbr" runat="server" Text="表單編號起訖" meta:resourcekey="lblDocNbrResource1"></asp:Label></td>
                                        <td style="height: 25px;" align="left">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="tbDocNbrStart" runat="server" Width="120px" meta:resourcekey="tbDocNbrStartResource1"></asp:TextBox></td>
                                                    <td>～</td>
                                                    <td>
                                                        <asp:TextBox ID="tbDocNbrEnd" runat="server" Width="120px" meta:resourcekey="tbDocNbrEndResource1"></asp:TextBox></td>
                                                </tr>
                                            </table>
                                            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="請輸入表單編號(起)"
                                                OnServerValidate="CustomValidator2_ServerValidate" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
                                            <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="請輸入表單編號(迄)"
                                                OnServerValidate="CustomValidator3_ServerValidate" meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 25px;" align="right">
                                            <asp:Label ID="lblFormName" runat="server" Text="表單名稱" meta:resourcekey="lblFormNameResource1"></asp:Label></td>
                                        <td style="height: 25px;" align="left">&nbsp;<asp:DropDownList ID="ddlFormName" runat="server"
                                            AutoPostBack="True" OnSelectedIndexChanged="ddlFormName_SelectedIndexChanged"
                                            meta:resourcekey="ddlFormNameResource1">
                                            <asp:ListItem Value="all" meta:resourcekey="ListItemResource4" Text="所有表單"></asp:ListItem>
                                        </asp:DropDownList></td>
                                    </tr>
                                </table>
                                <asp:UpdatePanel id="UpdatePanel2" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                                    <contenttemplate>
                                <uc1:UC_Query ID="UC_Query1" runat="server" /></contenttemplate>
                                    <triggers>
<asp:AsyncPostBackTrigger ControlID="ddlFormName" EventName="SelectedIndexChanged"></asp:AsyncPostBackTrigger>
<asp:AsyncPostBackTrigger ControlID="wibShowSpecial" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                                </asp:UpdatePanel>
                                <table>
                                    <tr>
                                        <td align="center" colspan="4" style="height: 25px">
                                            <telerik:RadButton ID="wibQuery" runat="server" meta:resourcekey="wibQueryResource1" 
                                                OnClick="wibQuery_Click1"></telerik:RadButton>
                                            &nbsp;
                                            <telerik:RadButton ID="wibShowSpecial" runat="server" meta:resourcekey="wibShowSpecialResource1" 
                                                OnClick="wibShowSpecial_Click1"></telerik:RadButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table width="100%" class="PopTable" cellspacing="1">
                        <tr>
                            <td class="PopTableHeader" align="center">
                                <asp:Label ID="lblFormListTitle" runat="server" Text="表單列表" meta:resourcekey="lblFormListTitleResource1"></asp:Label></td>
                        </tr>
                    </table>
                    <asp:UpdatePanel id="UpdatePanel1" runat="server" RenderMode="Inline">
                        <contenttemplate>
                    <Fast:Grid ID="DGFormList" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" 
                        meta:resourcekey="DGFormListResource1" OnPageIndexChanging="DGFormList_PageIndexChanging"
                        OnRowCommand="DGFormList_RowCommand" OnRowDataBound="DGFormList_RowDataBound"
                        OnSorting="DGFormList_Sorting"   Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="讀取狀態" meta:resourcekey="TemplateFieldResource1">
                                <itemstyle horizontalalign="Center" />
                                <itemtemplate>
<asp:Label runat="server" ID="lblReadstatus" meta:resourceKey="lblReadstatusResource1" __designer:wfdid="w6"></asp:Label>




</itemtemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="DOC_NBR" HeaderText="表單編號" meta:resourcekey="BoundFieldResource1"
                                SortExpression="DOC_NBR" />
                            <asp:TemplateField HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource5">
                                <itemtemplate>
<asp:Label id="lblFormname" runat="server" __designer:wfdid="w10"></asp:Label>
</itemtemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="申請人" meta:resourcekey="TemplateFieldResource2">
                                <itemtemplate>
<asp:Label runat="server" ID="lblUser" meta:resourceKey="lblUserResource1" __designer:wfdid="w7"></asp:Label>




</itemtemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="申請結果" meta:resourcekey="TemplateFieldResource3">
                                <itemstyle horizontalalign="Center" />
                                <itemtemplate>
<asp:Label runat="server" ID="lblResult" meta:resourceKey="lblResultResource1" __designer:wfdid="w8"></asp:Label>




</itemtemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="BEGIN_TIME" HeaderText="申請日期" meta:resourcekey="BoundFieldResource3"
                                SortExpression="BEGIN_TIME">
                                <itemstyle horizontalalign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="END_TIME" HeaderText="結案日期" meta:resourcekey="BoundFieldResource4">
                                <itemstyle horizontalalign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource4">
                                <itemstyle horizontalalign="Center" />
                                <itemtemplate>
<asp:LinkButton runat="server" ID="lbtnLook" Text="觀看" CommandName="Modify" meta:resourceKey="lbtnLookResource1" __designer:wfdid="w7"></asp:LinkButton>
 &nbsp; <asp:LinkButton runat="server" ID="lbtnPrint" Text="列印" meta:resourceKey="lbtnPrintResource1" __designer:wfdid="w8"></asp:LinkButton>
 
</itemtemplate>
                            </asp:TemplateField>
                        </Columns><EmptyDataRowStyle BackColor="White" ForeColor="Red" HorizontalAlign="Center"></EmptyDataRowStyle>
                    </Fast:Grid></contenttemplate>
                        <triggers>
<asp:AsyncPostBackTrigger ControlID="wibQuery" EventName="Click"></asp:AsyncPostBackTrigger>
</triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
    <asp:Label ID="lblUnread" runat="server" Text="未讀取" Visible="False" meta:resourcekey="lblUnreadResource1"></asp:Label>
    <asp:Label ID="lblRead" runat="server" Text="讀取" Visible="False" meta:resourcekey="lblReadResource1"></asp:Label>
    <asp:Label ID="lblPass" runat="server" Text="通過" Visible="False" meta:resourcekey="lblPassResource1"></asp:Label>
    <asp:Label ID="lblReject" runat="server" Text="否決" Visible="False" meta:resourcekey="lblRejectResource1"></asp:Label>
    <asp:Label ID="lblInvalid" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblInvalidResource1"></asp:Label>
    <asp:Label ID="lblQuery" runat="server" Text="查詢" Visible="False" meta:resourcekey="lblQueryResource1"></asp:Label>
    <asp:Label ID="lblSpecQuery" runat="server" Text="進階查詢" Visible="False" meta:resourcekey="lblSpecQueryResource1"></asp:Label>
</asp:Content>
