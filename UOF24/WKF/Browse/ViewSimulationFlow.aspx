<%@ Page Title="觀看模擬流程" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Browse_ViewSimulationFlow" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="ViewSimulationFlow.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <table>
                <tr>
                    <td style="padding: 5px 0px 5px 0px">
                        <asp:Label ID="lblFlowResultSetting" runat="server" Text="流程結果顯示：" meta:resourcekey="lblFlowResultSettingResource1"></asp:Label>
                    </td>
                    <td style="padding: 5px 0px 5px 0px">
                        <asp:RadioButtonList ID="rbtnlFlowResultSetting" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" meta:resourcekey="rbtnlFlowResultSettingResource1" OnSelectedIndexChanged="rbtnlFlowResultSetting_SelectedIndexChanged">
                            <asp:ListItem Value="FlowEnd" Text="流程結束站點" Selected="True" meta:resourcekey="ListItemResource3"></asp:ListItem>
                            <asp:ListItem Value="Default" Text="所有簽核者站點" meta:resourcekey="ListItemResource4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>

            <asp:Panel ID="pnlActual" runat="server" meta:resourcekey="pnlActualResource1">
                <table class="PopTable" cellpadding="0" cellspacing="1">
                    <tr>
                        <td class="PopTableHeader" style="text-align: center">
                            <div style="text-align: center">
                                <asp:Label ID="Label2" runat="server" Text="實際簽核流程"
                                    meta:resourcekey="Label2Resource1"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="PopTableRightTD" style="text-align: left">
                            <Fast:Grid ID="gridActual" runat="server" AutoGenerateCheckBoxColumn="False"
                                AllowSorting="True" AutoGenerateColumns="False"
                                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                EmptyDataText="沒有資料" EnableModelValidation="True" EnhancePager="True"
                                KeepSelectedRows="False" PageSize="15" Width="100%"
                                OnRowDataBound="gridActual_RowDataBound"
                                meta:resourcekey="gridActualResource1">
                                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

                                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                <Columns>
                                    <asp:BoundField HeaderText="站點" DataField="SITE_SEQ"
                                        meta:resourcekey="BoundFieldResource1" HeaderStyle-HorizontalAlign="Center">
                                        <ItemStyle Width="50px" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="預計簽核者" DataField="ORIGINAL_SIGNER_NAME"
                                        meta:resourcekey="BoundFieldResource2" HeaderStyle-HorizontalAlign="Center">
                                        <ItemStyle Width="150px" HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="實際簽核者" DataField="ACTUAL_SIGNER_NAME"
                                        meta:resourcekey="BoundFieldResource3" HeaderStyle-HorizontalAlign="Center">
                                        <ItemStyle Width="150px" HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="簽核意見" meta:resourcekey="TemplateFieldResource1" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblComment" runat="server" Text='<%#: Bind("COMMENT") %>'
                                                meta:resourcekey="lblCommentResource1"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="150px" HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="簽核時間" meta:resourcekey="BoundFieldResource4" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSignTime" runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="120px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="簽核狀態" meta:resourcekey="TemplateFieldResource2" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSignStatus" runat="server"
                                                meta:resourcekey="lblSignStatusResource1" Text='<%#: Bind("SIGN_STATUS") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="120px" HorizontalAlign="Center" />

                                    </asp:TemplateField>
                                </Columns>
                            </Fast:Grid>
                        </td>
                    </tr>
                </table>
            </asp:Panel>

            <asp:Panel ID="pnlSimulation" runat="server"
                meta:resourcekey="pnlSimulationResource1">
                <table class="PopTable" cellpadding="0" cellspacing="1">
                    <tr>
                        <td class="PopTableHeader" style="text-align: center">
                            <div style="text-align: center">
                                <asp:Label ID="Label1" runat="server" Text="預計簽核流程"
                                    meta:resourcekey="Label1Resource1"></asp:Label>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="PopTableRightTD" style="text-align: left">

                            <Fast:Grid ID="gridSimulation" runat="server" AutoGenerateCheckBoxColumn="False" Width="100%"
                                AllowSorting="True" AutoGenerateColumns="False"
                                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                                EmptyDataText="沒有資料" EnableModelValidation="True" EnhancePager="True"
                                KeepSelectedRows="False" PageSize="15"
                                OnRowDataBound="Grid1_RowDataBound" RowStyle-HorizontalAlign="Left"
                                meta:resourcekey="gridSimulationResource1">
                                <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>

                                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                <Columns>
                                    <asp:BoundField HeaderText="站點" DataField="SITE_SEQ"
                                        meta:resourcekey="BoundFieldResource5" HeaderStyle-HorizontalAlign="Center">
                                        <ItemStyle Width="50px" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="預計簽核者" DataField="ORIGINAL_SIGNER"
                                        meta:resourcekey="BoundFieldResource6" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" />
                                    <asp:TemplateField HeaderText="簽核型態" meta:resourcekey="TemplateFieldResource3" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSignType" runat="server"
                                                meta:resourcekey="lblSignTypeResource1" Text='<%# Bind("SIGN_TYPE") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="表單結案" meta:resourcekey="TemplateFieldResource4" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Image ID="imgAllowEnd" runat="server"
                                                meta:resourcekey="imgAllowEndResource1" Visible="False" />
                                            <asp:Image ID="imgNotEnd" runat="server" meta:resourcekey="imgNotEndResource1"
                                                Visible="False" />
                                            <asp:Image ID="imgAllowEndSubFlow" runat="server"
                                                meta:resourcekey="imgAllowEndSubFlowResource1" Visible="False" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </Fast:Grid>

                        </td>
                    </tr>
                </table>
                <asp:Label ID="lblSimulationException" ForeColor="Red" runat="server" Text="系統無法正確取得組織流程資訊，所以不能進行流程模擬!" Visible="false" meta:resourcekey="lblSimulationExceptionResource1"></asp:Label>
                <asp:Label ID="lblSimulationTitleException" ForeColor="Red" runat="server" Text="系統無法正確取得職級，所以不能進行流程模擬!" Visible="false" meta:resourcekey="lblSimulationTitleExceptionResource1"></asp:Label>
                <asp:Label ID="lblTaskException" runat="server" ForeColor="Red" Visible="false" Text="目前表單為異常狀態，須由表單負責人指定下一站簽核人員，所以不能進行流程模擬!" meta:resourcekey="lblTaskExceptionResource1"></asp:Label>
            </asp:Panel>

            <asp:Label ID="lblExtemalFlow" runat="server" Text="應用程式站點" Visible="False"
                meta:resourcekey="lblExtemalFlowResource1"></asp:Label>
            <asp:Label ID="lblCustGroupFlowSite" runat="server" Text="自選流程站點"
                Visible="False" meta:resourcekey="lblCustGroupFlowSiteResource1"></asp:Label>
            <asp:Label ID="lblCustDesignFlowSite" runat="server" Text="自訂流程站點"
                Visible="False" meta:resourcekey="lblCustDesignFlowSiteResource1"></asp:Label>
            <asp:Label ID="lblNotFindSignerException" runat="server" Text="找不到簽核者，無法往下模擬"
                Visible="False" meta:resourcekey="lblNotFindSignerExceptionResource1"></asp:Label>
            <asp:Label ID="lblConditionExceptSite" runat="server"
                Text="條件式站點找不到符合條件，無法往下模擬" Visible="False"
                meta:resourcekey="lblConditionExceptSiteResource1"></asp:Label>
            <asp:Label ID="lblSubFlow" runat="server" Text="副流程" Visible="False"
                meta:resourcekey="lblSubFlowResource1"></asp:Label>
            <asp:Label ID="lblParallelFlow" runat="server" Text="平行流程" Visible="False"
                meta:resourcekey="lblParallelFlowResource1"></asp:Label>
            <asp:Label ID="lblApplicant" runat="server" Text="申請" Visible="False"
                meta:resourcekey="lblApplicantResource1"></asp:Label>
            <asp:Label ID="lblSimulation" runat="server" Text="流程模擬" Visible="False"
                meta:resourcekey="lblSimulationResource1"></asp:Label>
            <asp:Label ID="lblAllowEndFlow" runat="server" Text="可在此結案" Visible="False"
                meta:resourcekey="lblAllowEndFlowResource1"></asp:Label>
            <asp:Label ID="lblNoAllowEndFlow" runat="server" Text="不可在此結案" Visible="False"
                meta:resourcekey="lblNoAllowEndFlowResource1"></asp:Label>
            <asp:Label ID="lblAllowEndSubFlow" runat="server" Text="可在此結束副流程"
                Visible="False" meta:resourcekey="lblAllowEndSubFlowResource1"></asp:Label>
            <asp:Label ID="lblNoAllowEndSubFlow" runat="server" Text="不可在此結束副流程"
                Visible="False" meta:resourcekey="lblNoAllowEndSubFlowResource1"></asp:Label>
            <asp:Label ID="lblAdditionalSiteMsg" runat="server" Text="加簽" Visible="False"
                meta:resourcekey="lblAdditionalSiteMsgResource1"></asp:Label>
            <asp:Label ID="lblOrSigned" runat="server" Text="已由他人簽核" Visible="False"
                meta:resourcekey="lblOrSignedResource1"></asp:Label>
            <asp:Label ID="lblapplication" runat="server" Text="申請" Visible="False"
                meta:resourcekey="lblapplicationResource1"></asp:Label>
            <asp:Label ID="lblAgree" runat="server" Text="核准" Visible="False"
                meta:resourcekey="lblAgreeResource1"></asp:Label>
            <asp:Label ID="lblDisagree" runat="server" Text="不同意" Visible="False"
                meta:resourcekey="lblDisagreeResource1"></asp:Label>
            <asp:Label ID="lblBack" runat="server" Text="退簽" Visible="False"
                meta:resourcekey="lblBackResource1"></asp:Label>
            <asp:Label ID="lblNoComment" runat="server" Text="沒意見" Visible="False"
                meta:resourcekey="lblNoCommentResource1"></asp:Label>
            <asp:Label ID="lblNull" runat="server" Text="未簽核" Visible="False"
                meta:resourcekey="lblNullResource1"></asp:Label>
            <asp:Label ID="lblCancelMsg" runat="server" Text="作廢" Visible="False"
                meta:resourcekey="lblCancelMsgResource1"></asp:Label>
            <asp:Label ID="lblgeneralSign" runat="server" Text="一般" Visible="False"
                meta:resourcekey="lblgeneralSignResource1"></asp:Label>
            <asp:Label ID="lblOrSign" runat="server" Text="並簽" Visible="False"
                meta:resourcekey="lblOrSignResource1"></asp:Label>
            <asp:Label ID="lblAndSign" runat="server" Text="會簽" Visible="False"
                meta:resourcekey="lblAndSignResource1"></asp:Label>
            <asp:Label ID="lblPrevSiteAssign" runat="server" Text="上一站點指定" Visible="False"
                meta:resourcekey="lblPrevSiteAssignResource1"></asp:Label>
            <asp:Label ID="lblAddtionalFlowMsg" runat="server" Text="加簽流程" Visible="False" meta:resourcekey="lblAddtionalFlowMsgMsgResource1"></asp:Label>
            <asp:Label ID="lblOriginalSigner" runat="server" Text="原簽核者" Visible="False" meta:resourcekey="lblOriginalSignerResource1"></asp:Label>
            <asp:Label ID="lblFieldFlowSite" runat="server" Text="組織欄位站點" Visible="false" meta:resourcekey="lblFieldFlowSiteResource1"></asp:Label>
            <asp:Label ID="lblAlertSite" runat="server" Text="知會站點" Visible="false" meta:resourcekey="lblAlertSiteResource1"></asp:Label>
            <asp:Label ID="lblSkipped" runat="server" Text="(自動簽核)" Visible="false" meta:resourcekey="lblSkippedResource1"></asp:Label>
            <asp:Label ID="lblAlertNotFound" runat="server" Text="(無符合條件之知會人員)" Visible="false" meta:resourcekey="lblAlertNotFoundResource1"></asp:Label>
            <asp:Label ID="lblAdditionalSign" runat="server" Text="由 {#User} 加簽" Visible="False" meta:resourcekey="lblAdditionalSignResource1" ></asp:Label>
            
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

