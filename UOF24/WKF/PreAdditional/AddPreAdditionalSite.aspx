<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_PreAdditional_AddPreAdditionalSite" Codebehind="AddPreAdditionalSite.aspx.cs" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>
<%@ Register assembly="Ede.Uof.Utility.Component.Grid" namespace="Ede.Uof.Utility.Component" tagprefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table>
                <tr>
                    <td style="padding: 5px 0px 5px 0px">
                        <asp:Label ID="lblFlowResultSetting" runat="server" Text="流程結果顯示：" meta:resourcekey="lblFlowResultSettingResource1"></asp:Label>
                    </td>
                    <td style="padding: 5px 0px 5px 0px">
                        <asp:RadioButtonList ID="rbtnlFlowResultSetting" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" meta:resourcekey="rbtnlFlowResultSettingResource1" OnSelectedIndexChanged="rbtnlFlowResultSetting_SelectedIndexChanged">
                            <asp:ListItem Value="FlowEnd" Text="流程結束站點" Selected="True" meta:resourcekey="ListItemResource3"></asp:ListItem>
                            <asp:ListItem Value="Default" Text="所有簽核者站點" meta:resourcekey="ListItemResource4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
        <Fast:Grid runat="server" AutoGenerateCheckBoxColumn="False" 
            PageSize = "3" ID="grid1" AllowSorting="True" AutoGenerateColumns="False" 
             DataKeyOnClientWithCheckBox="False" 
            DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" 
              Width="100%" 
            onrowdatabound="grid1_RowDataBound" onrowcommand="grid1_RowCommand" 
            onrowdeleting="grid1_RowDeleting" CustomDropDownListPage="False" meta:resourcekey="grid1Resource2" SelectedRowColor="" UnSelectedRowColor="" >
        
            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""  />
            <ExportExcelSettings AllowExportToExcel="False" />
            <Columns>
                <asp:BoundField HeaderText="站點" DataField="SITE_SEQ" meta:resourcekey="BoundFieldResource1" >
                <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderText="簽核者" DataField="ORIGINAL_SIGNER" HtmlEncode="False" meta:resourcekey="BoundFieldResource2" >
                <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderText="知會者" DataField="SIGN_ALERT" HtmlEncode="False" meta:resourcekey="BoundFieldResource3" >
                <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderText="簽核後知會者" DataField="SIGNED_ALERT" HtmlEncode="False" meta:resourcekey="BoundFieldResource4" >
                <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderText="簽核型態" DataField="SIGN_TYPE" meta:resourcekey="BoundFieldResource5" >
                <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField HeaderText="站點新增者" DataField="PREADDITIONAL_SITE_OWNER" HtmlEncode="False" meta:resourcekey="BoundFieldResource6" >
                <HeaderStyle Wrap="False" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="表單結案" meta:resourcekey="TemplateFieldResource4">
                                        <ItemTemplate>
                                            <asp:Image ID="imgAllowEnd" runat="server"
                                                meta:resourcekey="imgAllowEndResource1" Visible="False" />
                                            <asp:Image ID="imgNotEnd" runat="server" meta:resourcekey="imgNotEndResource1"
                                                Visible="False" />
                                            <asp:Image ID="imgAllowEndSubFlow" runat="server"
                                                meta:resourcekey="imgAllowEndSubFlowResource1" Visible="False" />
                                        </ItemTemplate>
                                        <HeaderStyle Wrap="False" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                        <asp:Button ID="btnAddSite" runat="server" Text="插入站點" meta:resourcekey="btnAddSiteResource1" />
                        <asp:Button ID="btnSetup" runat="server" Text="設定" meta:resourcekey="btnSetupResource1" />
                        <asp:Button ID="btnDelete" runat="server" Text="刪除" meta:resourcekey="btnDeleteResource1" />
                        <asp:Label ID="lblFlowError" runat="server" Text="系統無法正確取得組織流程資訊，故無法加簽與往下模擬" Visible="False" ForeColor="Red" meta:resourcekey="lblFlowErrorResource1"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Width="20%" />
                </asp:TemplateField>
            </Columns>
        
        </Fast:Grid>
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblExtemalFlow" runat="server" Text="應用程式站點" Visible =False
    meta:resourcekey="lblExtemalFlowResource1"  ></asp:Label>
    <asp:Label ID="lblCustGroupFlowSite" runat="server" Text="自選流程站點" 
        Visible =False meta:resourcekey="lblCustGroupFlowSiteResource1" ></asp:Label>
    <asp:Label ID="lblCustDesignFlowSite" runat="server" Text="自訂流程站點" 
        Visible =False meta:resourcekey="lblCustDesignFlowSiteResource1" ></asp:Label>
    <asp:Label ID="lblNotFindSignerException" runat="server" Text="找不到簽核者，無法往下模擬" 
        Visible =False meta:resourcekey="lblNotFindSignerExceptionResource1" ></asp:Label>
    <asp:Label ID="lblConditionExceptSite" runat="server" 
        Text="條件式站點" Visible =False meta:resourcekey="lblConditionExceptSiteResource1"  ></asp:Label>
    <asp:Label ID="lblSubFlow" runat="server" Text="副流程" Visible =False 
        meta:resourcekey="lblSubFlowResource1" ></asp:Label>
    <asp:Label ID="lblParallelFlow" runat="server" Text="平行流程" Visible =False 
        meta:resourcekey="lblParallelFlowResource1" ></asp:Label>
    <asp:Label ID="lblApplicant" runat="server" Text="申請" Visible =False 
        meta:resourcekey="lblApplicantResource1" ></asp:Label>
    <asp:Label ID="lblSimulation" runat="server" Text="流程模擬" Visible =False 
        meta:resourcekey="lblSimulationResource1" ></asp:Label>
    <asp:Label ID="lblAllowEndFlow" runat="server" Text="可在此結案" Visible =False 
        meta:resourcekey="lblAllowEndFlowResource1" ></asp:Label>
    <asp:Label ID="lblNoAllowEndFlow" runat="server" Text="不可在此結案" Visible =False 
        meta:resourcekey="lblNoAllowEndFlowResource1" ></asp:Label>
    <asp:Label ID="lblAllowEndSubFlow" runat="server" Text="可在此結束副流程" 
        Visible =False meta:resourcekey="lblAllowEndSubFlowResource1" ></asp:Label>
    <asp:Label ID="lblNoAllowEndSubFlow" runat="server" Text="不可在此結束副流程" 
        Visible =False meta:resourcekey="lblNoAllowEndSubFlowResource1" ></asp:Label>
    <asp:Label ID="lblAdditionalSiteMsg" runat="server" Text="(加簽)" Visible="False" 
        meta:resourcekey="lblAdditionalSiteMsgResource1" ></asp:Label>
    <asp:Label ID="lblOrSigned" runat="server" Text="已由他人簽核" Visible="False" 
        meta:resourcekey="lblOrSignedResource1" ></asp:Label>    
    <asp:Label ID="lblapplication" runat="server" Text="申請" Visible="False" 
        meta:resourcekey="lblapplicationResource1" ></asp:Label> 
    <asp:Label ID="lblAgree" runat="server" Text="核准" Visible="False" 
        meta:resourcekey="lblAgreeResource1" ></asp:Label>
    <asp:Label ID="lblDisagree" runat="server" Text="不同意" Visible="False" 
        meta:resourcekey="lblDisagreeResource1" ></asp:Label>
    <asp:Label ID="lblBack" runat="server" Text="退簽" Visible="False" 
        meta:resourcekey="lblBackResource1" ></asp:Label>
    <asp:Label ID="lblNoComment" runat="server" Text="沒意見" Visible="False" 
        meta:resourcekey="lblNoCommentResource1" ></asp:Label>
    <asp:Label ID="lblNull" runat="server" Text="未簽核" Visible="False" 
        meta:resourcekey="lblNullResource1" ></asp:Label>
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
    <asp:Label ID="lblDeleteMsg" runat="server" Visible="False" Text="確定要刪除?" meta:resourcekey="lblDeleteMsgResource1"></asp:Label>
    <asp:Label ID="lblCurrentSite" runat="server" Text="目前站點" Visible="False" meta:resourcekey="lblCurrentSiteResource1"></asp:Label>
    <asp:Label ID="lblAdditional" runat="server" Text="(加簽)" Visible="False" meta:resourcekey="lblAdditionalResource1"></asp:Label>
    <asp:Label ID="lblFieldFlowSite" runat="server" Text="組織欄位站點" Visible="False" meta:resourcekey="lblFieldFlowSiteResource1"></asp:Label>
    <asp:Label ID="lblNotifySite" runat="server" Text="知會站點" Visible="False" meta:resourcekey="lblNotifySiteResource1"></asp:Label>
    <asp:Label ID="lblFlowSimulationError" runat="server" ForeColor="Red" Text="系統無法正確取得組織流程資訊，所以不能進行流程模擬!" Visible="False"  meta:resourcekey="lblFlowSimulationErrorResource1"></asp:Label>
    <asp:Label ID="lblAdditionalSign" runat="server" Text="由 {#User} 加簽" Visible="False" meta:resourcekey="lblAdditionalSignResource1" ></asp:Label>
</asp:Content>

