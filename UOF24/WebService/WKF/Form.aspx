<%@ Page Language="C#" AutoEventWireup="true" Inherits="Ede.Uof.Web.WebService.WKF.Form" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="Form.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register src="../../WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" tagname="VersionFieldCollectionUsingUC" tagprefix="uc1" %>
<%@ Register src="../../WKF/FormUse/FormIQY/UC_QueryIqyTask.ascx" tagname="UC_QueryIqyTask" tagprefix="uc2" %>

<head id="Head1" runat="server">
    <title></title>
    <style>
    .ul{border-bottom:1px dotted silver}
    .bigT 
    {
	color:#ffffff;	font-size:25px; font-weight: bolder; 
    }
    </style>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td id="formInfo" runat="server"></td>
            </tr>
            <tr>
                <td><uc1:VersionFieldCollectionUsingUC ID="VersionFieldCollectionUsingUC1" runat="server" /></td>
            </tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td align="left"><asp:Label ID="lblSignInfo" runat="server" Font-Bold="True" Text="表單流程" meta:resourcekey="lblSignInfoResource1"></asp:Label><asp:Label ID="lblTaskResult" runat="server" Font-Bold="True" ForeColor="Red" meta:resourcekey="lblTaskResultResource3"></asp:Label></td>
            </tr>
            <tr>
                <td>

                    <Fast:Grid ID="DGSignCommentList" runat="server" AllowSorting="True" SelectedRowCssClass="GridItemSelected"
                                            AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False" 
                                               
                                            EnableTheming="True" 
                                            OnRowDataBound="DGSignCommentList_RowDataBound" 
                                            meta:resourcekey="DGSignCommentListResource1" 
                                            DataKeyOnClientWithCheckBox="False"
                                            EnhancePager="True" PageSize="15" 
                        DefaultSortDirection="Ascending"   CssClass="GridItemAlternating2" 
                        EmptyDataText="沒有資料" 
                        KeepSelectedRows="False" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                        <ExportExcelSettings AllowExportToExcel="False" />
 <HeaderStyle CssClass="GridHeader"/>    
    <RowStyle CssClass="GridItem2" />        
    <PagerStyle CssClass="GridPager2"   />
    <EnhancePagerSettings 
     FirstAltImageUrl="~/App_Themes/defaultTheme/images/grid/arrow_first_alt.gif"
     FirstImageUrl="~/App_Themes/defaultTheme/images/grid/arrow_first.gif" 
     LastAltImage="~/App_Themes/defaultTheme/images/grid/arrow_last_alt.gif" 
     LastImageUrl="~/App_Themes/defaultTheme/images/grid/arrow_last.gif" 
     NextImageUrl="~/App_Themes/defaultTheme/images/grid/arrow_next.gif"
     PreviousImageUrl="~/App_Themes/defaultTheme/images/grid/arrow_previous.gif" 
     NextIAltImageUrl="~/App_Themes/defaultTheme/images/grid/arrow_next_alt.gif"  
     PreviousAltImageUrl="~/App_Themes/defaultTheme/images/grid/arrow_previous_alt.gif" 
     PageInfoCssClass="GridPagerPagerInfo" 
     PageNumberCssClass="GridPagerNumber" 
     PageNumberCurrentCssClass="GridPagerCurrentNumber" 
     PageRedirectCssClass="GridPagerPagerInfoRedirect"
     ShowHeaderPager="false"
     />
                        <Columns>
                            <asp:BoundField DataField="SITE" HeaderText="站點" 
                                meta:resourcekey="BoundFieldResource1">
                            <HeaderStyle Wrap="False" />
                            <itemstyle horizontalalign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="應簽核者" meta:resourcekey="TemplateFieldResource4">
                                <ItemTemplate>
                                    <asp:Label ID="lblOSigner" runat="server" Text='<%# Bind("ORIGINAL_SIGNER_NAME") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="簽核者" meta:resourcekey="TemplateFieldResource5">
                                <ItemTemplate>
                                    <asp:Label ID="lblSigner" runat="server" Text='<%# Bind("ACTUAL_SIGNER_NAME") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="結果" meta:resourcekey="TemplateFieldResource1">
                                <itemtemplate>
                                    <asp:Label ID="lblSignStatus" runat="server" 
                                        meta:resourceKey="lblSignStatusResource1"></asp:Label>
                                </itemtemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="簽核意見" meta:resourcekey="BoundFieldResource4">
                                <ItemTemplate>
                                    <asp:Label ID="lblComment" runat="server" 
                                        meta:resourcekey="lblCommentResource2"></asp:Label>
                                </ItemTemplate>
                                <headerstyle wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="電子簽章" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" 
                                        meta:resourcekey="Image1Resource1" />
                                </ItemTemplate>
                                <HeaderStyle Width="105px" />
                            </asp:TemplateField>
                        </Columns>
                        <EnhancePagerSettings
                            ShowHeaderPager="True" />
                    </Fast:Grid>
                                     </td>
            </tr>
        </table>
        <br />
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblIQYInfo" runat="server" Text="徵詢資訊" Font-Bold="True" meta:resourcekey="lblIQYInfoResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <Fast:Grid ID="DGIqySingleList" runat="server" Width="100%"
                        PageSize="15" EnhancePager="False"
                        DataKeyOnClientWithCheckBox="False"
                        AutoGenerateColumns="False" 
                        AutoGenerateCheckBoxColumn="False" DefaultSortDirection="Ascending"
                        OnRowDataBound="DGIqySingleList_RowDataBound" CssClass="GridItemAlternating2"
                        AllowSorting="True" EmptyDataText="沒有資料" CustomDropDownListPage="False" KeepSelectedRows="False" meta:resourcekey="DGIqySingleListResource3" SelectedRowColor="" UnSelectedRowColor="">
                        <HeaderStyle CssClass="GridHeader" />
                        <RowStyle CssClass="GridItem2" />
                        <PagerStyle CssClass="GridPager2" />

                        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                        <Columns>
                            <asp:TemplateField HeaderText="被徵詢者" meta:resourcekey="TemplateFieldResource3" >
                                <itemtemplate>
                <asp:Label ID="lblIqyUser" runat="server" Text='<%# Bind("IQY_USER_ID") %>' meta:resourcekey="lblIqyUserResource1" ></asp:Label>
            </itemtemplate>
                                <itemstyle width="10%" Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="CONTENT" HeaderText="回覆意見" meta:resourcekey="BoundFieldResource5">
                                <itemstyle width="20%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="IQY_RESULT" HeaderText="結果" meta:resourcekey="BoundFieldResource6">
                                <HeaderStyle Wrap="False" />
                                <itemstyle width="5%" horizontalalign="Center" Wrap="False" />
                            </asp:BoundField>
                            <asp:TemplateField  HeaderText="回覆時間" meta:resourcekey="BoundFieldResource7" >
                                <itemtemplate>
                                     <asp:Label ID="lblResponseTime" runat="server"></asp:Label>
                                 </itemtemplate>
                                <itemstyle width="12%" horizontalalign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="FORM_USER_ID" HeaderText="徵詢者" meta:resourcekey="BoundFieldResource8">
                                <itemstyle width="10%" Wrap="False"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="IQY_COMMENT" HeaderText="徴詢原因" meta:resourcekey="BoundFieldResource9">
                                <itemstyle width="18%" />
                            </asp:BoundField>
                        </Columns>

                        <EnhancePagerSettings FirstAltImageUrl="~/App_Themes/defaultTheme/images/grid/arrow_first_alt.gif"
     FirstImageUrl="~/App_Themes/defaultTheme/images/grid/arrow_first.gif" 
     LastAltImage="~/App_Themes/defaultTheme/images/grid/arrow_last_alt.gif" 
     LastImageUrl="~/App_Themes/defaultTheme/images/grid/arrow_last.gif" 
     NextImageUrl="~/App_Themes/defaultTheme/images/grid/arrow_next.gif"
     PreviousImageUrl="~/App_Themes/defaultTheme/images/grid/arrow_previous.gif" 
     NextIAltImageUrl="~/App_Themes/defaultTheme/images/grid/arrow_next_alt.gif"  
     PreviousAltImageUrl="~/App_Themes/defaultTheme/images/grid/arrow_previous_alt.gif" 
     PageInfoCssClass="GridPagerPagerInfo" 
     PageNumberCssClass="GridPagerNumber" 
     PageNumberCurrentCssClass="GridPagerCurrentNumber" 
     PageRedirectCssClass="GridPagerPagerInfoRedirect"
     ShowHeaderPager="false" />

                    </Fast:Grid>
                </td>
            </tr>
        </table>

    <asp:Label ID="lblCancelMsg" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblCancelMsgResource1"></asp:Label>
            <asp:Label ID="lblOrSigned" runat="server" Text="已由他人簽核" Visible="False" meta:resourcekey="lblOrSignedResource1"></asp:Label>    
        <asp:Label ID="lblapplication" runat="server" Text="申請" Visible="False" meta:resourcekey="lblapplicationResource1"></asp:Label> 
        <asp:Label ID="lblAgree" runat="server" Text="核准" Visible="False" meta:resourcekey="lblAgreeResource1"></asp:Label>
        <asp:Label ID="lblDisagree" runat="server" Text="不同意" Visible="False" meta:resourcekey="lblDisagreeResource1"></asp:Label>
        <asp:Label ID="lblBack" runat="server" Text="退簽" Visible="False" meta:resourcekey="lblBackResource1"></asp:Label>
        <asp:Label ID="lblNoComment" runat="server" Text="沒意見" Visible="False" meta:resourcekey="lblNoCommentResource1"></asp:Label>
        <asp:Label ID="lblNull" runat="server" Text="未簽核" Visible="False" meta:resourcekey="lblNullResource1"></asp:Label>
        <asp:Label ID="lblSite" runat="server" Text="站點" Visible="False" meta:resourcekey="lblSiteResource1"></asp:Label>
        <asp:Label ID="lblOSName" runat="server" Text="應簽核者" Visible="False" meta:resourcekey="lblOSNameResource1"></asp:Label>
        <asp:Label ID="lblASName" runat="server" Text="簽核者" Visible="False" meta:resourcekey="lblASNameResource1"></asp:Label>
        <asp:Label ID="lblSSStatus" runat="server" Text="簽核狀態" Visible="False" meta:resourcekey="lblSSStatusResource1"></asp:Label>
        <asp:Label ID="lblComment" runat="server" Text="簽核意見" Visible="False" meta:resourcekey="lblCommentResource1"></asp:Label>
        <asp:Label ID="lblSubFlow" runat="server" Text="副流程：" Visible="False" meta:resourcekey="lblSubFlowResource1"></asp:Label>
        <asp:Label ID="lblSubSignInfo0" runat="server" Text="的簽核資訊" Visible="False" meta:resourcekey="lblSubSignInfo0Resource1"></asp:Label>
        <asp:Label ID="lblPrint" runat="server" Text="列印" Visible='False' meta:resourcekey="lblPrintResource1"></asp:Label>
        <asp:Label ID="lblCanelForm" runat="server" Text="作廢" Visible="False" meta:resourcekey="lblCanelFormResource3"></asp:Label>
        <asp:Label ID="lblApplicantResult" runat="server" Text="申請結果：" Visible="False" meta:resourcekey="lblApplicantResultResource1"></asp:Label>
        <asp:Label ID="lblAdditionalSiteMsg" runat="server" Text="加簽" Visible="False" meta:resourcekey="lblAdditionalSiteMsgResource1" ></asp:Label>
        <asp:Label ID="lblSend" runat="server" Text="送出" Visible="False" meta:resourcekey="lblSendResource1"  ></asp:Label>
        <asp:Label ID="lblAutoSign" runat="server" Text="(逾時自動送出)"  Visible="False" meta:resourcekey="lblAutoSignResource1"></asp:Label>
        <asp:Label ID="lblLanApproval" runat="server" Text="贊成" Visible="False" meta:resourcekey="lblLanApprovalResource1"></asp:Label>
        <asp:Label ID="lblLanDisapproval" runat="server" Text="反對" Visible="False" meta:resourcekey="lblLanDisapprovalResource1"></asp:Label>
        <asp:Label ID="lblLanOtherOpinion" runat="server" Text="其他" Visible="False" meta:resourcekey="lblLanOtherOpinionResource1"></asp:Label>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    </form>
</body>
</html>
