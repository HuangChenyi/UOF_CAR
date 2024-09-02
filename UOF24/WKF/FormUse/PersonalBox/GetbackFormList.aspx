<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="WKF_FormUse_PersonalBox_GetbackFormList"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="GetbackFormList.aspx.cs" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI.HtmlControls" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="System.Web.UI" TagPrefix="cc2" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="Server">
    <script id="igClientScript" type="text/javascript">

    function CannotGetbackAlert() {
        alert('<%=lblCannotget.Text %>');
        }

        function BackgoundProcessingAlert() {
            alert('<%=lblFormGetBackForBackgoundProcessing.Text %>');
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="Server">
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="2" MultiPageID="RadMultiPage1" OnTabClick="RadTabStrip1_TabClick" Width="100%">
        <Tabs>
            <telerik:RadTab runat="server" Value="MyFormList">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Value="ApplyFormList">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Selected="True" Value="GetbackFormList">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Value="SetAgent">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Value="custFlow">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadToolBar ID="webToolBar" runat="server" OnButtonClick="webToolBar_ButtonClick"
        Width="100%" meta:resourcekey="toolbarResource1">
        <Items>
            <telerik:RadToolBarButton>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text="申請日期:" meta:resourceKey="TBLabelResource1"></asp:Label>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton Value="Keyword">
                <ItemTemplate>
                    <table runat="server" id="Table2">
                        <tr runat="server" id="Tr3">
                            <td runat="server" id="Td7">
                                <telerik:RadDatePicker runat="server" ID="rdpExaminedStartDate"></telerik:RadDatePicker>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="rdpExaminedStartDate" ForeColor="Red"
                                    ErrorMessage="請輸入申請時間(起)" Display="Dynamic" ID="rfvExaminedStartDate" meta:resourceKey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                            </td>
                            <td runat="server" id="Td8" style="padding-left: 3px; padding-right: 3px;">
                                <asp:Label runat="server" Text="~" ID="Label5"></asp:Label>
                            </td>
                            <td runat="server" id="Td9">
                                <telerik:RadDatePicker runat="server" ID="rdpExaminedEndDate"></telerik:RadDatePicker>
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="rdpExaminedEndDate" ForeColor="Red"
                                    ErrorMessage="請輸入申請時間(迄)" Display="Dynamic" ID="rfvExaminedEndDate" meta:resourceKey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr runat="server" id="Tr1">
                            <td runat="server" id="Td1" colspan="3">
                                <asp:CompareValidator runat="server" ControlToCompare="rdpExaminedStartDate" Operator="GreaterThanEqual"
                                    Type="Date" ControlToValidate="rdpExaminedEndDate" ErrorMessage="結束時間需晚於開始時間" ForeColor="Red"
                                    Display="Dynamic" ID="CompareValidator2" meta:resourceKey="CompareValidator3Resource1"></asp:CompareValidator>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true" runat="server" Value="sDate"></telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                ImageUrl="~/Common/Images/Icon/icon_m39.gif" Text="查詢" Value="Query" meta:resourceKey="TBarButtonResource1">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton IsSeparator="true" runat="server" Value="sQuery"></telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="Server">
    <telerik:RadTreeView ID="classTree" runat="server" OnNodeClick="classTree_NodeClick"></telerik:RadTreeView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="Server">
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="2">
        <telerik:RadPageView ID="RadPageView1" runat="server">RadPageView</telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView2" runat="server">RadPageView</telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView3" runat="server">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline" UpdateMode="Conditional">
                <ContentTemplate>
                    <table style="height: 100%; border: 0; width: 100%" cellspacing="0" cellpadding="0" class="tbbg01">
                        <tbody>
                            <tr>
                                <td style="vertical-align: top; text-align: left; height: 100%;">
                                    <asp:Panel ID="Panel1" runat="server" Width="100%" Height="100%" meta:resourcekey="Panel1Resource2">
                                        <table class="PopTable" cellspacing="1" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td class="PopTableHeader" style="text-align: center;">
                                                        <center>
                                                            <asp:Label ID="lblGetbackSigned" runat="server" meta:resourcekey="Label1Resource1" Text="簽核表單取回"></asp:Label>
                                                        </center>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <Fast:Grid ID="DGFormList" runat="server" Width="100%" Height="100%" EnhancePager="True"
                                            DataKeyOnClientWithCheckBox="False" OnRowCommand="DGFormList_RowCommand" PageSize="12"
                                            OnSorting="DGFormList_Sorting" OnRowDataBound="DGFormList_RowDataBound" OnPageIndexChanging="DGFormList_PageIndexChanging"
                                            AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="False" AllowSorting="True"
                                            AllowPaging="True">
                                            <EnhancePagerSettings ShowHeaderPager="True" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="表單編號" meta:resourcekey="BoundFieldResource1" SortExpression="DOC_NBR">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lblNbrFormList" runat="server"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="表單名稱" meta:resourceKey="TemplateFieldResource4">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblFormname" Text='<%#: Bind("FORM_NAME") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="120px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="標題"  meta:resourcekey="BoundFieldResource4">
                                                    <ItemTemplate>
                                                        <asp:Label id="lblDisplayTitle" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="200px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="送出時間" meta:resourcekey="BoundFieldResource3" SortExpression="FINISH_TIME">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSendTime" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle Wrap="False" />
                                                    <ItemStyle HorizontalAlign="Center" Width="100px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="申請人" meta:resourceKey="TemplateFieldResource5">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblUser" meta:resourceKey="lblUserResource1"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="140px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="操作" meta:resourceKey="TemplateFieldResource2">
                                                    <ItemTemplate>
                                                        <asp:LinkButton runat="server" ID="lbtnCheckForm" Text="取回" CommandName="Getback" meta:resourceKey="lbtnCheckFormResource1"></asp:LinkButton>
                                                        <asp:LinkButton runat="server" ID="lbtnView" Text="觀看" CommandName="Getback" meta:resourceKey="lbtnViewResource1"></asp:LinkButton>
                                                        <asp:LinkButton runat="server" ID="lbtnPrint" Text="列印" meta:resourceKey="lbtnPrintResource1"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="80px" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </Fast:Grid>
                                    </asp:Panel>
                                    <asp:Panel ID="Panel2" runat="server" Width="100%" Height="100%" meta:resourcekey="Panel2Resource2">
                                        <table class="PopTable" cellspacing="1" width="100%">
                                            <tbody>
                                                <tr>
                                                    <td class="PopTableHeader" style="text-align: center; width: 100%;">
                                                        <center>
                                                                    <asp:Label ID="lblGetbackApply" runat="server" meta:resourcekey="Label6Resource1"
                                                                        Text="申請表單作廢" ></asp:Label>
                                                                </center>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <Fast:Grid ID="grdFormExamined" runat="server" Width="100%" EnhancePager="True" Height="100%"
                                            DataKeyOnClientWithCheckBox="False" PageSize="12" OnSorting="grdFormExamined_Sorting"
                                            OnRowDataBound="grdFormExamined_RowDataBound" OnPageIndexChanging="grdFormExamined_PageIndexChanging"
                                            AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="False" AllowSorting="True"
                                            AllowPaging="True" DataKeyNames="DOC_NBR">
                                            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl=""
                                                LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                                                PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl=""
                                                PreviousImageUrl="" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="表單編號" meta:resourcekey="BoundFieldResource1" SortExpression="DOC_NBR">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lblNbrExamined" runat="server"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource1">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFormnameExamined" runat="server" meta:resourcekey="lblFormnameExaminedResource1"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="標題" meta:resourcekey="BoundFieldResource4">
                                                    <ItemTemplate>
                                                        <asp:Label id="lblDisplayTitle" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="200px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="表單狀態" meta:resourcekey="TemplateFieldResource6">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblStatusExamined" meta:resourcekey="lblStatusExaminedResource1"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="10%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="申請時間" SortExpression="BEGIN_TIME" meta:resourcekey="BoundFieldResource2">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBeginTime" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="結案時間" SortExpression="END_TIME" Visible="false" meta:resourcekey="BoundFieldResource3">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEndTime" runat="server"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource3">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbtnGetBackExamined" runat="server" meta:resourcekey="lbtnGetBackExaminedResource1" Text="作廢"></asp:LinkButton>
                                                        <asp:LinkButton runat="server" ID="lbtnView" Text="觀看" CommandName="Getback" meta:resourceKey="lbtnViewResource1"></asp:LinkButton>
                                                        <asp:LinkButton ID="lbtnPrintExamined" runat="server" meta:resourcekey="lbtnPrintExaminedResource1" Text="列印"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                                                </asp:TemplateField>
                                            </Columns>
                                        </Fast:Grid>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView4" runat="server">RadPageView</telerik:RadPageView>
        <telerik:RadPageView ID="RadPageView5" runat="server">RadPageView</telerik:RadPageView>
    </telerik:RadMultiPage>
    <asp:Label ID="lblCustFlow" runat="server" Text="定義自訂流程" Visible="False" meta:resourcekey="lblCustFlowResource1"></asp:Label>
    <asp:Label ID="lblCheckForm" runat="server" meta:resourcekey="lblCheckFormResource1"
        Text="確定要取回表單?" Visible="False"></asp:Label>
    <asp:Label ID="lblCannotget" runat="server" meta:resourcekey="lblCannotgetResource1"
        Text="表單已由下一站人員簽核或鎖定，故無法取回" Visible="False"></asp:Label>
    <asp:Label ID="lblProcessed" runat="server" Text="處理中" Visible="False" meta:resourcekey="lblProcessedResource1"></asp:Label>
    <asp:Label ID="lblException" runat="server" Text="異常" Visible="False" meta:resourcekey="lblExceptionResource1"></asp:Label>
    <asp:Label ID="lblMyFormList" runat="server" Text="個人表單" Visible="False" meta:resourcekey="lblMyFormListResource1"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="表單申請" Visible="False" meta:resourcekey="Label1Resource2"></asp:Label>
    <asp:Label ID="lblGetbackList" runat="server" Text="表單取回" Visible="False" meta:resourcekey="lblGetbackListResource1"></asp:Label>
    <asp:Label ID="lblSetAgent" runat="server" Text="設定代理人" Visible="False" meta:resourcekey="lblSetAgentResource1"></asp:Label>
    <asp:Label ID="lblClassList" runat="server" meta:resourcekey="lblClassListResource1" Text="分類列表" Visible="false"></asp:Label>
    <asp:Label ID="lblFormGetBackForBackgoundProcessing" runat="server" Text="此表單正在進行背景簽核，無法取回" Visible="False" meta:resourcekey="lblFormGetBackForBackgoundProcessingResource1"></asp:Label>

</asp:Content>


