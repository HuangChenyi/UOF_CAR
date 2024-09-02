<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="FreeFirstSiteSend.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormUse.Mobile.FreeFirstSiteSend" %>

<%@ Register Src="../../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceListMobile.ascx" TagPrefix="uc1" TagName="UC_ChoiceListMobile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css"> 
            
        .formTitle {background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);text-align:center;height:20px}
        .formInfo {background-color:White;vertical-align:top}
             /*common*/

        .RadForm_MetroTouch  .rfdSelect  , .RadForm_Silk .rfdSelect,.RadForm_Silk .rfdSelectBox {     
            font-size:100% !important;
        }

            
        .rfdSelectBox li {
            height : 1.8em;
            line-height : 1em;
        }
             
        .RadForm_MetroTouch label {
            font-size: 100% !important;
        }

        .RadForm_MetroTouch label.title {
            font-size: 100% !important;
            font-weight: 700 !important;
            margin: 0 0 .28571429rem !important;
        }

        .pageLayout {}

        .pageLayout h1,
        .pageLayout h2 {
            font-weight: normal;
        }

        .pageLayout h1 {
            margin: 0;
            font-size: 200%;
        }

        .pageLayout h2 {
            font-size: 180%;
        }

        .pageLayout h3 {
            font-size: 133%;
        }

        .pageLayout .riTextBox {
            width: 100%;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        .pageLayout .radios td {
            padding-right: 15px;
        }

        .pageLayout .t-row {
            padding-bottom: 15px;
        }
        /*header*/
        .pageLayout .header {
            /*background-color: #e2e2dc;*/
            /*background-color: #ee6e73;*/
            background-color:#F6511D;
            color: #ffffff;
            line-height: 40px;
            width: 100%;
        }

        .pageLayout .header p {
            font-size: 1.43em;
        }

        .pageLayout .header img {
            width: 100%;
            display: block;
        }

        /*content*/
        /*.content {
    text-align: center;
}*/
        .blockheader {
            padding: .5rem 1rem;           
            box-shadow: none;
            border-top: 1px solid #d4d4d5;
            border-left:1px solid #d4d4d5;
            border-right:1px solid #d4d4d5;
            margin: 20px 0 0 0 ;
            border-radius: .28571429rem .28571429rem 0 0;
            background: #7FB800;
            color:#fff;
        }

        .blockheader+.content{
           border: 1px solid #d4d4d5;
           border-radius: 0 0 .28571429rem .28571429rem ;
           padding:1em;
        }

        .content.nopadding{
           padding:1em 0;
        }

        .content .t-container {
            padding: 0;
        }

        .t-container .t-container-static .t-col {
            padding: 0px;
        }

        .t-container.t-container-static {
            padding: 15px 0px 0px 0px !important;
        }

        @media only screen and (min-width: 769px) {

            /*.pageLayout .header {
                padding: 4% 4% 0;
            }*/
            .pageLayout .header {
                text-align: center;
            }
        }

        @media only screen and (max-width: 768px) {

            .pageLayout .header {
                text-align: center;
            }
        }

    </style>
    <script>
        var ajaxManager;
        function Send() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Send", "Value": "" }));
            return false;
         }
        function Return() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Return", "Value": "" }));
            return false;
        }
    </script>

    <div class="pageLayout" id="layout" runat="server" >
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest"></telerik:RadAjaxManager>
        <asp:UpdatePanel ID="updatepanel1" runat="server"><ContentTemplate>
        <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="true" HtmlTag="None">
            <telerik:LayoutRow RowType="Generic">
                <Rows>
                    <telerik:LayoutRow RowType="Generic" CssClass="content">
                        <Rows>
                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                <Columns>
                                    <telerik:CompositeLayoutColumn Span="12">
                                        <Content>
                                            <h3 class="blockheader">
                                                <asp:Label ID="Label5" runat="server" Text="下一站點資訊" meta:resourcekey="Label5Resource1"></asp:Label>
                                            </h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content">
                                                <Rows>     
                                                    <telerik:LayoutRow ID="SiteType" runat="server">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="lblSiteType" runat="server" EnableViewState="False" Text="型態"
                                                                        meta:resourcekey="lblSiteTypeResource2"></asp:Literal>
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                               <asp:RadioButtonList ID="rblSiteType" runat="server" RepeatDirection="Vertical" meta:resourcekey="rblSiteTypeResource1">
                                                                   <asp:ListItem Selected="True" Value="0" meta:resourcekey="ListItemResource1" Text="一般"></asp:ListItem>
                                                                   <asp:ListItem Value="1" meta:resourcekey="ListItemResource2" Text="並簽"></asp:ListItem>
                                                                   <asp:ListItem Value="2" meta:resourcekey="ListItemResource3" Text="會簽"></asp:ListItem>
                                                               </asp:RadioButtonList>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>                                               
                                                    <telerik:LayoutRow ID="PanelNextSite" runat="server">
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                <label class="title">
                                                                    <asp:Literal ID="Literal2" runat="server" EnableViewState="False" Text="簽核" meta:resourcekey="Label3Resource2"></asp:Literal>                                                                    
                                                                </label>
                                                            </telerik:LayoutColumn>
                                                            <telerik:LayoutColumn Span="12">
                                                                <uc1:UC_ChoiceListMobile runat="server" ID="UC_ChoiceList1" ChoiceType="User"/>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12">
                                                                 <asp:Label ID="lblSiteGeneralMsg" runat="server" EnableViewState="False" ForeColor="Red"
                                                                     Text="一般簽核只能有一個人" Visible="False" meta:resourcekey="lblSiteGeneralMsgResource1"></asp:Label>
                                                                
                                                                <asp:Label ID="lblNoSignerMsg" runat="server" Text="至少需有一名簽核人員" EnableViewState="False"
                                                                    ForeColor="Red" Visible="False" meta:resourcekey="lblNoSignerMsgResource1"></asp:Label>
                                                                
                                                                <asp:Label ID="lblNoAuth" runat="server" meta:resourcekey="lblNoAuthResource1" Text="無權限處理或觀看此表單" Visible="False"></asp:Label>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                </Rows>
                                            </telerik:LayoutRow>
                                        </Rows>
                                    </telerik:CompositeLayoutColumn>
                                </Columns>
                            </telerik:LayoutRow>
                        </Rows>
                    </telerik:LayoutRow>
                </Rows>
            </telerik:LayoutRow>
        </telerik:RadPageLayout>
        </ContentTemplate></asp:UpdatePanel>
    </div>


    <table width="100%" class="PopTable" cellspacing="1" style="display:none">
        <colgroup class="PopTableLeftTD" style="width: 70px; text-align: right">
        </colgroup>
        <colgroup class="PopTableRightTD" style="width: 200px">
        </colgroup>
        <colgroup class="PopTableLeftTD" style="width: 70px; text-align: right">
        </colgroup>
        <colgroup class="PopTableRightTD" style="width: 200px">
        </colgroup>
        <tr>
            <td colspan="4" class="PopTableHeader" style="height: 25px; text-align: center">
                <asp:Label ID="lblNextSiteInfo" runat="server" EnableViewState="False" 
                    Text="下一站點資訊" meta:resourcekey="lblNextSiteInfoResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
                <asp:Label ID="lblTimeout" runat="server" EnableViewState="False" Text="逾時" meta:resourcekey="lblTimeoutResource2" ></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tbTimeoutCount" runat="server" MaxLength="4" Width="40px" Style="text-align: right"
                    meta:resourcekey="tbTimeoutCountResource1" Text="0"></asp:TextBox><asp:Label ID="Label2"
                        runat="server" Text="小時" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbTimeoutCount"
                    Display="Dynamic" ErrorMessage="此數字需介於0-1000" MaximumValue="1000" MinimumValue="0"
                    Type="Integer" meta:resourcekey="RangeValidator1Resource1"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" EnableViewState="False" Text="簽核" meta:resourcekey="Label3Resource2" ></asp:Label>
            </td>
            <td></td>
            <td>
                <asp:Label ID="Label4" runat="server" EnableViewState="False" Text="知會" 
                    meta:resourcekey="Label4Resource2" >
                </asp:Label>
            </td>
            <td>
                <uc1:UC_ChoiceList ID="UC_ChoiceList_AlertUsers" runat="server" 
                    ShowMember="False" />
            </td>
        </tr>
    </table>
    
    <asp:Panel ID="panelAgent" runat="server" Width="100%" Visible="False" meta:resourcekey="panelAgentResource1">
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <asp:Label ID="lbeAgentMsg" runat="server" ForeColor="Red" Text="下列人員有啟動代理設定，但系統找不到他的代理人，表單將只會送給原簽核者!"
                        EnableViewState="False" meta:resourcekey="lbeAgentMsgResource1">
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td style="height: 54px">
                    <asp:TextBox ID="tbAgent" runat="server" Width="100%" Height="50px" EnableViewState="False"
                        meta:resourcekey="tbAgentResource1" TextMode="MultiLine">
                    </asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Label ID="lblSendMsg" runat="server" Text="表單 {0} 已建立" Visible="False" meta:resourcekey="lblSendMsgResource1"></asp:Label>
    <asp:Label ID="lblFormNum" runat="server" Text="表單編號為:" Visible="False" meta:resourcekey="lblFormNumResource1"></asp:Label>
    <asp:Label ID="lblSubmitTxt" runat="server" Text="確定" Visible="False" meta:resourcekey="lblSubmitTxtResource1"></asp:Label>
    <asp:Label ID="lblReturnTxt" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnTxtResource1"></asp:Label>
    <asp:Label ID="lblCustomAutoNumberCreateFailed" runat="server" Text="自訂編號錯誤：" Visible="False" meta:resourcekey="lblCustomAutoNumberCreateFailedResource1"></asp:Label>
    <asp:Label ID="lblNoAllowApply" runat="server" Text="此張表單目前不允許申請" Visible="False" meta:resourcekey="lblNoAllowApplyResource1"></asp:Label>
</asp:Content>
