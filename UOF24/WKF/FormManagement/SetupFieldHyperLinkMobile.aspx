<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="SetupFieldHyperLink.aspx.cs" Inherits="WKF_FormManagement_SetupFieldHyperLink" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<style type="text/css"> 
            .formTitle {background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);text-align:center;height:20px}
            .formInfo {background-color:White;vertical-align:top}
             /*common*/

              .RadForm_MetroTouch  .rfdSelect  , .RadForm_Silk .rfdSelect,.RadForm_Silk .rfdSelectBox {
                  font-size:100% !important;
              }

             .rfdSelectBox li{
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

        .pageLayout {
            
        }

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
         function Sure() {
            var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Sure", "Value": "" }));
            return false;
         }
        function Return() {
            var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Return", "Value": "" }));
            return false;
        }
    </script>
    <div class="pageLayout" ID="layout"  runat="server">
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest" ></telerik:RadAjaxManager>
        <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="true" HtmlTag="None">
            <telerik:LayoutRow RowType="Generic">
                <Rows>
                    <telerik:LayoutRow RowType="Generic" CssClass="content">
                        <Rows>
                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                <Columns>
                                    <telerik:CompositeLayoutColumn Span="12">
                                        <Content>
                                            <h3 class="blockheader"><asp:Label ID="Label5" runat="server" Text="連結資訊"></asp:Label></h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Generic" CssClass="content">
                                                <Rows>
                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12" >
                                                                <label class="title">
                                                                    <asp:Literal ID="lblURLName1" runat="server" Text="連結文字" ></asp:Literal>
                                                                </label><font color="red">*</font>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12" >
                                                                <asp:TextBox ID="txtURLName" runat="server"  meta:resourcekey="txtURLNameResource1" Width="97%"></asp:TextBox><br />
           <asp:RequiredFieldValidator ID="RequiredFieldValidatorLinkText" runat="server" ErrorMessage="連結文字不允許空白" ControlToValidate="txtURLName" meta:resourcekey="RequiredFieldValidatorLinkTextResource1" EnableTheming="true"></asp:RequiredFieldValidator>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                    </telerik:LayoutRow>
                                                    <telerik:LayoutRow>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12" >
                                                                <label class="title"><asp:Literal ID="lblURL1" runat="server" Text="連結位置" ></asp:Literal></label><font color="red">*</font>
                                                            </telerik:LayoutColumn>
                                                        </Columns>
                                                        <Columns>
                                                            <telerik:LayoutColumn Span="12" >
                                                                <asp:TextBox ID="txtURL" runat="server"  meta:resourcekey="txtURLResource1" Width="97%"></asp:TextBox><br />
           <asp:RequiredFieldValidator ID="RequiredFieldValidatorLinkUrl" runat="server" ErrorMessage="連結網址不允許空白" meta:resourcekey="RequiredFieldValidatorLinkUrlResource1"  ControlToValidate="txtURL" EnableTheming="true"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtURL"
               ErrorMessage="輸入網址格式錯誤" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?" Display="Dynamic" Enabled="False"></asp:RegularExpressionValidator>
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
    </div>
    <asp:Label ID="lblReturnTxt" runat="server" Text="返回" Visible="False" ></asp:Label>

<table width="100%" class="PopTable" cellspacing="1" style="display:none">
    <colgroup class="PopTableLeftTD"></colgroup>
    <colgroup class="PopTableRightTD"></colgroup>
    <tr>
       <td nowrap>
           <font color="red">*</font><asp:Label ID="lblURLName" runat="server" Text="請輸入顯示文字" meta:resourcekey="lblURLNameResource1"></asp:Label></td>
       <td>
           
    </tr>
    <tr>
       <td style="height: 21px">
           <font color="red">*</font><asp:Label ID="lblURL" runat="server" Text="請輸入連結" meta:resourcekey="lblURLResource1"></asp:Label></td>
       <td style="height: 21px">
           
    </tr>
</table>

</asp:Content>
