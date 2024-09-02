<%@ Page Title="行程資訊" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="MaintainTravelDetails.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.WKFOptionalFields104.MaintainTravelDetails" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .formTitle {
            background-image: url(../../App_Themes/DefaultTheme/images/po_06.gif);
            text-align: center;
            height: 20px;
        }

        .formInfo {
            background-color: White;
            vertical-align: top;
        }
        /*common*/

        .RadForm_MetroTouch .rfdSelect, .RadForm_Silk .rfdSelect, .RadForm_Silk .rfdSelectBox {
            font-size: 100% !important;
        }

        .rfdSelectBox li {
            height: 1.8em;
            line-height: 1em;
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
                font-size: 133%;
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
                background-color: #F6511D;
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
            border-left: 1px solid #d4d4d5;
            border-right: 1px solid #d4d4d5;
            margin: 20px 0 0 0;
            border-radius: .28571429rem .28571429rem 0 0;
            background: #7FB800;
            color: #fff;
        }

            .blockheader + .content {
                border: 1px solid #d4d4d5;
                border-radius: 0 0 .28571429rem .28571429rem;
                padding: 1em;
            }

        .content.nopadding {
            padding: 1em 0;
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

        .MobileFormList {
            background-clip: padding-box;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            color: rgb(51, 51, 51);
            display: block;
            font-family: sans-serif;
            font-size: 14px;
            line-height: 20.8px;
            list-style-image: none;
            list-style-position: outside;
            list-style-type: none;
            margin-bottom: 0px;
            margin-left: 0px;
            margin-right: 0px;
            margin-top: 0px;
            padding-bottom: 0px;
            padding-left: 0px;
            padding-right: 0px;
            padding-top: 0px;
            text-shadow: rgb(243, 243, 243) 0px 1px 0px;
        }

            .MobileFormList .group {
                cursor: default;
                display: block;
                font-size: 1.0em;
                font-weight: bold;
                line-height: 1.3em;
                list-style-image: none;
                list-style-position: outside;
                list-style-type: none;
                margin-bottom: 0px;
                margin-left: 0px;
                margin-right: 0px;
                margin-top: 0px;
                outline-color: rgb(51, 51, 51);
                outline-style: none;
                outline-width: 0px;
                overflow-x: hidden;
                overflow-y: hidden;
                padding-bottom: 7px;
                padding-left: 4px;
                padding-right: 8px;
                padding-top: 7px;
                position: relative;
                text-align: left;
                border-bottom-color: #999;
                border-bottom-style: solid;
                border-bottom-width: 1.5px;
            }

            .MobileFormList .item {
                font-size: 1em;
                line-height: 1.0em;
                display: block;
                list-style-image: none;
                list-style-position: outside;
                list-style-type: none;
                margin-bottom: 0px;
                margin-left: 0px;
                margin-right: 0px;
                margin-top: 0px;
                overflow-x: visible;
                overflow-y: visible;
                padding-bottom: 0px;
                padding-left: 0px;
                padding-right: 0px;
                padding-top: 0px;
                position: relative;
                text-align: left;
                text-shadow: rgb(243, 243, 243) 0px 1px 0px;
            }

                .MobileFormList .item div {
                    border-top-color: rgb(221, 221, 221);
                    border-top-style: solid;
                    border-top-width: 1px;
                    color: rgb(51, 51, 51);
                    display: block;
                    font-size: 16px;
                    line-height: 20.8px;
                    list-style-image: none;
                    list-style-position: outside;
                    list-style-type: none;
                    margin-bottom: 0px;
                    margin-left: 0px;
                    margin-right: 0px;
                    margin-top: 0px;
                    overflow-x: hidden;
                    overflow-y: hidden;
                    padding-bottom: 11.2px;
                    padding-left: 16px;
                    padding-right: 8px;
                    padding-top: 11.2px;
                    position: relative;
                    text-align: left;
                    text-decoration: none;
                }

                    .MobileFormList .item div span:nth-child(1) {
                        display: block;
                        font-size: 95%;
                        float: left;
                        margin-bottom: 3px;
                        text-shadow: rgb(243, 243, 243) 0px 1px 0px;
                        font-weight: 600;
                    }

                    .MobileFormList .item div span:nth-child(2) {
                        display: block;
                        font-size: 95%;
                        float: right;
                        font-weight: normal;
                    }

                    .MobileFormList .item div span:nth-child(3) {
                        display: block;
                        font-size: 90%;
                        clear: both;
                        color: rgba(51,51,51,0.9);
                    }

                    .MobileFormList .item div span:nth-child(4) {
                        display: block;
                        font-size: 90%;
                        font-weight: normal;
                    }
    </style>
    <asp:Panel ID="plTravel" runat="server">
    <div class="pageLayout">
        <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="True" HtmlTag="None" meta:resourcekey="RadPageLayoutResource1">
            <telerik:LayoutRow RowType="Generic">
                <Rows>
                    <telerik:LayoutRow RowType="Generic" CssClass="content">
                        <Rows>
                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                <Columns>
                                    <telerik:CompositeLayoutColumn Span="12">
                                        <Content>
                                            <h3 class="blockheader">
                                                <asp:Label ID="Label1" runat="server" Text="明細" meta:resourcekey="Label1Resource1"></asp:Label>
                                            </h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Container" CssClass="content">
                                                <Columns>
                                                    <telerik:CompositeLayoutColumn Span="12">
                                                        <Content>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label2" runat="server" Text="啟程時間" meta:resourcekey="Label2Resource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-left: 17px">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <telerik:RadDatePicker ID="rdStartDate" runat="server" AutoPostBack="True" OnSelectedDateChanged="rdStartDate_SelectedDateChanged" EnableTheming="true">
                                                                                    </telerik:RadDatePicker>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lblStartDate" runat="server" Visible="False"></asp:Label>
                                                                                    <telerik:RadTimePicker ID="rdStartTime" runat="server" AutoPostBack="True" EnableTheming="true">
                                                                                    </telerik:RadTimePicker>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 10px">
                                                                        <asp:Label ID="Label4" runat="server" Text="迄程時間" meta:resourcekey="Label4Resource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td style="padding-left: 17px">
                                                                                    <telerik:RadDatePicker ID="rdEndDate" runat="server" AutoPostBack="True" EnableTheming="true">
                                                                                    </telerik:RadDatePicker>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="lblEndDate" runat="server" Visible="False"></asp:Label>
                                                                                    <telerik:RadTimePicker ID="rdEndTime" runat="server" AutoPostBack="True" EnableTheming="true">
                                                                                    </telerik:RadTimePicker>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 10px">
                                                                        <asp:Label ID="Label5" runat="server" Text="出發地點" meta:resourcekey="Label5Resource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-left: 17px">
                                                                        <asp:DropDownList ID="ddlDepature" runat="server" style="display: none"></asp:DropDownList>
                                                                        <telerik:RadDropDownList ID="rddlDepature" runat="server" EnableTheming="True" meta:resourcekey="rddlDepatureResource1"></telerik:RadDropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 10px">
                                                                        <asp:Label ID="Label6" runat="server" Text="停留地點" meta:resourcekey="Label6Resource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-left: 17px">
                                                                        <asp:DropDownList ID="ddlDestnation" runat="server" style="display: none"></asp:DropDownList>
                                                                        <telerik:RadDropDownList ID="rddlDestnation" runat="server" EnableTheming="True" meta:resourcekey="rddlDestnationResource1"></telerik:RadDropDownList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:TextBox ID="txtDetail" runat="server" Style="display: none"></asp:TextBox>
                                                            <asp:HiddenField ID="hfUI" runat="server" />
                                                            <asp:Label ID="lblGoBack" runat="server" Text="返回" Visible="false" meta:resourcekey="lblGoBackResource1"></asp:Label>
                                                            <asp:CustomValidator ID="cvCheckDate" runat="server" ErrorMessage="結束日期早於開始日期，請重新選擇。" Display="Dynamic" meta:resourcekey="cvCheckDateResource1"></asp:CustomValidator>
                                                        </Content>
                                                    </telerik:CompositeLayoutColumn>
                                                </Columns>
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
    </asp:Panel>
    <asp:Label ID="lblNotFoundView" runat="server" Text="取得資料發生問題，請回報系統管理員。" Visible="false" ForeColor="Red" meta:resourcekey="lblNotFoundViewResource1"></asp:Label>
</asp:Content>
