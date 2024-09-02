<%@ Page Title="待簽表單批次指定簽核人員" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SendHandoverAgent.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.SendHandoverAgent" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagPrefix="uc1" TagName="UC_BtnChoiceOnce" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .required {
            color:white !important;
        }
    </style>

    <table class="PopTable" style="width:99.9%">
        <tr>
            <td class="PopTableHeader" style="text-align: center !important;" colspan="2">
                <asp:Label ID="lblSetAgentTime" runat="server" Text ="設定代理時間"  meta:resourcekey="lblSetAgentTimeResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                <asp:Label ID="lblAgentTimeStart" runat="server" Text="時間(起)"  meta:resourcekey="lblAgentTimeStartResource1"></asp:Label>
            </td>
            <td>
                <telerik:RadDateTimePicker ID="dateAgentStart" runat="server"></telerik:RadDateTimePicker>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
                <asp:Label ID="lblAgentTimeEnd" runat="server" Text="時間(訖)"  meta:resourcekey="lblAgentTimeEndResource1"></asp:Label>
            </td>
            <td>
                <telerik:RadDateTimePicker ID="dateAgentEnd" runat="server"></telerik:RadDateTimePicker>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblHandOverStar" runat="server" Text="*" ForeColor="Red"></asp:Label>
                <asp:Label ID="lblAgent" runat="server" Text="代理人"  meta:resourcekey="lblAgentResource1"></asp:Label>
            </td>
            <td>
                <uc1:UC_BtnChoiceOnce runat="server" ID="UC_BtnChoiceOnce" ChoiceOnceKind="Employee" ButtonText="選取人員" meta:resourcekey="UC_BtnChoiceOnceResource1" />
                <asp:Label ID="lblSetAgent" runat="server"></asp:Label>
                <asp:CustomValidator ID="validateChoice" runat="server" ErrorMessage="*請選擇人員"  Display="Dynamic"  meta:resourcekey="validateChoiceResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblReasonStar" runat="server" Text="*" ForeColor="Red"></asp:Label>
                <asp:Label ID="lblReason" runat="server" Text="代理原因" meta:resourcekey="lblReasonResource1"></asp:Label>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Width="600px" Height="100px" MaxLength="500"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CustomValidator ID="reasonValidator" runat="server" ErrorMessage="*請填寫交接原因" Display="Dynamic" meta:resourcekey="reasonValidatorResource1"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:CustomValidator ID="dateValidator" runat="server" ErrorMessage="代理時間起迄有誤" BackColor="Red" ForeColor="White" 
        Display="Dynamic" Width="100%" CssClass="required"  meta:resourcekey="dateValidatorResource1"></asp:CustomValidator>
    <asp:CustomValidator ID="gridValidator" runat="server" ErrorMessage="請勾選資料" BackColor="Red" ForeColor="White" 
        Display="Dynamic" Width="100%" CssClass="required"  meta:resourcekey="gridValidatorResource1"></asp:CustomValidator>
    <br />
    <span><asp:Label ID="lblGroup" runat="server" CssClass="SizeMemo"></asp:Label>&nbsp;<asp:Label ID="lblUser" runat="server" CssClass="SizeMemo"></asp:Label></span>
    
    <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
        CustomDropDownListPage="False" DataKeyNames="TASK_ID,SITE_ID,NODE_SEQ" DataKeyOnClientWithCheckBox="true" DefaultSortDirection="Ascending"
        EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" meta:resourcekey="Grid1Resource3"
        OnPageIndexChanging="Grid1_PageIndexChanging" OnRowDataBound="Grid1_RowDataBound" OnSorting="Grid1_Sorting" PageSize="15" SelectedRowColor="" UnSelectedRowColor="" Width="100%">
        <EnhancePagerSettings FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" ShowHeaderPager="True" />
        <ExportExcelSettings AllowExportToExcel="False" />
        <Columns>
            <asp:BoundField Visible="false" DataField="TASK_ID" />
            <asp:BoundField Visible="false" DataField="SITE_ID" />
            <asp:BoundField Visible="false" DataField="NODE_SEQ" />
            <asp:TemplateField HeaderText="表單單號"  SortExpression="DOC_NBR" HeaderStyle-Width="10%"  meta:resourcekey="TemplateField1Resource1" >
                <ItemTemplate>
                    <asp:Label ID="lblDocNbr" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="表單名稱" HeaderStyle-Width="10%" SortExpression="FORM_NAME"  meta:resourcekey="TemplateField2Resource1">
                <ItemTemplate>
                    <asp:Label ID="lblFormName" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="標題" HeaderStyle-Width="20%"  meta:resourcekey="TemplateField3Resource1">
                <ItemTemplate>
                    <asp:Label ID="lblDisplayTitle" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="申請者" HeaderStyle-Width="10%"  SortExpression="USER_NAME"  meta:resourcekey="TemplateField4Resource1">
                <ItemTemplate>
                    <asp:Label ID="lblApplicant" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="申請時間"  SortExpression="BEGIN_TIME" HeaderStyle-Width="10%"  meta:resourcekey="TemplateField5Resource1">
                <ItemTemplate>
                    <asp:Label ID="lblApplyTime" runat="server" ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="狀態" HeaderStyle-Width="10%"  meta:resourcekey="TemplateField6Resource1">
                <ItemTemplate>
                    <asp:Label ID="lblTaskStatus" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="代理人" HeaderStyle-Width="10%"  meta:resourcekey="TemplateField7Resource1">
                <ItemTemplate>
                    <asp:Label ID="lblAgent" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="代理時間" HeaderStyle-Width="10%" SortExpression="AGENT_START_TIME"  meta:resourcekey="TemplateField8Resource1">
                <ItemTemplate>
                    <asp:Label ID="lblAgentTime" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="代理原因" HeaderStyle-Width="18%"  meta:resourcekey="TemplateField9Resource1">
                <ItemTemplate>
                    <asp:Label ID="lblAgentReason" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle Wrap="False" />
    </Fast:Grid>

    <asp:HiddenField ID="hfUserGuid" runat="server" />
    <asp:HiddenField ID="hfGroupId" runat="server" />
    <asp:HiddenField ID="hfDateStart" runat="server" />
    <asp:HiddenField ID="hfDateEnd" runat="server" />
    <asp:HiddenField ID="hfFormId" runat="server" />
    <asp:HiddenField ID="hfType" runat="server" />
    <asp:HiddenField ID="hfTaskStatus" runat="server" />
    <asp:HiddenField ID="hfAgent" runat="server" />
    <asp:Label ID="lblApproved" runat="server" Text="結案(通過)" visible="False"  meta:resourcekey="lblApprovedResource1"></asp:Label>
    <asp:Label ID="lblDenied" runat="server" Text="結案(否決)"   visible="False"  meta:resourcekey="lblDeniedResource1"></asp:Label>
    <asp:Label ID="lblProcessing" runat="server" Text="處理中"   visible="False"  meta:resourcekey="lblProcessingResource1"></asp:Label>
    <asp:Label ID="lblExceptional" runat="server" Text="異常"   visible="False" meta:resourcekey="lblExceptionalResource1" ></asp:Label>
    <asp:Label ID="lblReturnToApplicant" runat="server" Text="退回申請者"   visible="False" meta:resourcekey="lblReturnToApplicantResource1" ></asp:Label>
</asp:Content>
