<%@ Page Title="待簽表單批次指定簽核人員" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_ExpSusSetWkfUser" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ExpSusSetWkfUser.aspx.cs" %>
<%@ Register Src="../../../Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagName="UC_BtnChoiceOnce" TagPrefix="uc1" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width:100%">
                <tr>
                    <td>
                        <table class="PopTable" style="width:100%">
                            <tr>
                                <td  class="PopTableHeader" colspan="3" style="height: 25px; text-align:center;">
                                <div style="text-align:center">
                                    <asp:Label ID="lblSetTime" runat="server" Text="設定代理時間" meta:resourcekey="lblSetTimeResource1"></asp:Label>
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td style="white-space:nowrap">
                                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*" 
                                        meta:resourcekey="Label1Resource1"></asp:Label>
                                    <asp:Label ID="lblStart" runat="server" Text="時間(起)" meta:resourcekey="lblStartResource1"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadDateTimePicker ID="RadDateTimeStart" runat="server" meta:resourcekey="RadDateTimeStartResource1"></telerik:RadDateTimePicker>
                                </td>
                            </tr>
                            <tr>
                                <td style="white-space:nowrap">
                                    <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*" 
                                        meta:resourcekey="Label2Resource1"></asp:Label>
                                    <asp:Label ID="lblEnd" runat="server" Text="時間(訖)" meta:resourcekey="lblEndResource1"></asp:Label>
                                </td>
                                <td>
                                    <telerik:RadDateTimePicker ID="RadDateTimeEnd" runat="server" meta:resourcekey="RadDateTimeEndResource1"></telerik:RadDateTimePicker>
                                </td>
                            </tr>
                            <tr>
                                <td style="white-space:nowrap">
                                    <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*" 
                                        meta:resourcekey="Label3Resource1"></asp:Label>
                                    <asp:Label ID="lblAgentShow" runat="server" Text="代理人" meta:resourcekey="lblAgentShowResource1"></asp:Label>
                                </td>
                                <td>
                                    <uc1:UC_BtnChoiceOnce ID="UC_BtnChoiceOnce1" runat="server" />
                                    <asp:Label ID="lblAgent" runat="server"
                                        meta:resourcekey="lblAgentResource1"></asp:Label>
                                    <asp:Label ID="lblAgentGuid" runat="server" Visible="False" 
                                        meta:resourcekey="lblAgentGuidResource2"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="white-space:nowrap">
                                    <asp:Label ID="lblMemo" runat="server" Text="代理原因" meta:resourcekey="lblMemoResource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtMemo" runat="server" Height="79px" TextMode="MultiLine" 
                                        Width="421px" meta:resourcekey="txtMemoResource1"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" meta:resourcekey="ValidationSummary1Resource1" />
            
            <br />
            <table style="width:100%">
                <tr>
                    <td>
                        <asp:Label ID="lblTaskListTitle" runat="server" 
                            meta:resourcekey="lblTaskListTitleResource1"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <Fast:Grid ID="grdTaskList" runat="server" AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False"
                            Width="100%" AllowSorting="True"  DataKeyNames="NODE_SEQ,SITE_ID,AGENT_USER_GUID,DOC_NBR,TASK_ID"
                            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" DefaultSortColumnName="DOC_NBR"
                            EnhancePager="True" PageSize="15"   AllowPaging="True"
                            OnRowDataBound="grdTaskList_RowDataBound" OnPageIndexChanging="grdTaskList_PageIndexChanging"
                            KeepSelectedRows="False" meta:resourcekey="grdTaskListResource1" EmptyDataText="沒有資料"
                            OnSorting="grdTaskList_Sorting" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""   >
                            <EnhancePagerSettings
                                ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                            <Columns>
                                <asp:BoundField HeaderText="表單名稱" DataField="FORM_NAME" meta:resourcekey="BoundFieldResource1"
                                    SortExpression="FORM_NAME" >
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="True" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="表單單號" SortExpression="DOC_NBR" 
                                    meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnDocNbr" runat="server" Text='<%# Bind("DOC_NBR") %>' 
                                            meta:resourcekey="lbtnDocNbrResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="申請者" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUserNM" runat="server" Text='<%# Eval("USER_NM") %>' meta:resourcekey="lblUserNMResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="申請時間" SortExpression="BEGIN_TIME" meta:resourcekey="TemplateFieldResource5">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BEGIN_TIME") %>' meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblBeginTime" runat="server" Text='<%# Bind("BEGIN_TIME") %>' meta:resourcekey="lblBeginTimeResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="代理人" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAgentNM" runat="server" meta:resourcekey="lblAgentNMResource1"></asp:Label>
                                        <asp:Label ID="lblAgentGuid" runat="server" Text='<%# Eval("AGENT_USER_GUID") %>'
                                            Visible="False" meta:resourcekey="lblAgentGuidResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource6" SortExpression="NODE_STATUS">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNodeStatus" runat="server" meta:resourcekey="lblNodeStatusResource1" Text='<%# Bind("NODE_STATUS") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="代理時間" meta:resourcekey="TemplateFieldResource3" SortExpression="AGENT_START_TIME">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStart" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="NODE_SEQ" HeaderText="NODE_SEQ" Visible="False" meta:resourcekey="BoundFieldResource4" />
                                <asp:BoundField DataField="目前站點" HeaderText="CURRENT_SITE_ID" Visible="False" meta:resourcekey="BoundFieldResource5" />
                                <asp:BoundField DataField="APPLICANT" HeaderText="APPLICANT" Visible="False" meta:resourcekey="BoundFieldResource6" />
                                <asp:BoundField DataField="TASK_ID" HeaderText="TASK_ID" Visible="False" meta:resourcekey="BoundFieldResource7" />
                            </Columns>
                        </Fast:Grid>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:CustomValidator ID="CustomValidator1" runat="server" Visible="False" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
    <asp:Label ID="lblTimeError" runat="server" Text="結束時間必須晚於起始時間" Visible="False" meta:resourcekey="lblTimeErrorResource1"></asp:Label>
    <asp:Label ID="lblTimeNullError" runat="server" Text="請選擇時間" Visible="False" meta:resourcekey="lblTimeNullErrorResource1"></asp:Label>
    <asp:Label ID="lblChoiceError" runat="server" Text="請選取人員" Visible="False" meta:resourcekey="lblChoiceErrorResource1"></asp:Label>
    <asp:Label ID="lblCheckError" runat="server" Text="請勾選資料" Visible="False" meta:resourcekey="lblCheckErrorResource1"></asp:Label>
    <asp:Label ID="Label4" runat="server" Text="選取人員" Visible="False" meta:resourcekey="Label4Resource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" runat="server" />

    <asp:Label ID="lblLabelStatus1" runat="server" Text="處理中" Visible="False" meta:resourcekey="lblLabelStatus1Resource1"></asp:Label>    
    <asp:Label ID="lblLabelStatus6" runat="server" Text="退回申請者" Visible="False" meta:resourcekey="lblLabelStatus6Resource1"></asp:Label>
</asp:Content>
