<%@ Page Title="新增/維護活動內容明細" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="CharityDetailMaintain.aspx.cs" Inherits="EIP_Duty_WKFOptionalFields_CharityDetailMaintain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- style 參照 WKF/FormUse/Mobile/SetupDataGridFieldValue --%>
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
            font-weight: 700 !important;
            margin: 0 0 .28571429rem !important;
        }

        .pageLayout {
            font: 16px 'Segoe UI', Arial, sans-serif;
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
                background-color: #ee6e73;
                color: #ffffff;
                line-height: 56px;
                width: 100%;
                font-size: 20px;
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
            background: #fff;
            padding: .71428571rem 1rem;
            box-shadow: none;
            border-top: 1px solid #d4d4d5;
            border-left: 1px solid #d4d4d5;
            border-right: 1px solid #d4d4d5;
            margin: 20px 0 0 0;
            border-radius: .28571429rem .28571429rem 0 0;
            background: #f3f4f5;
        }

            .blockheader + .content {
                border: 1px solid #d4d4d5;
                border-radius: 0 0 .28571429rem .28571429rem;
                padding: 1em;
            }

        .content .t-container {
            padding: 0;
        }

        @media only screen and (min-width: 769px) {

            .pageLayout .header {
                padding: 4% 4% 0;
            }
        }

        @media only screen and (max-width: 768px) {

            .pageLayout .header {
                text-align: center;
            }
        }
    </style>

    <div class="pageLayout">
        <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="true" HtmlTag="None">
            <telerik:LayoutRow RowType="Generic">
                <Rows>
                    <telerik:LayoutRow RowType="Generic" CssClass="content">
                        <Rows>
                            <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                <Columns>
                                    <telerik:CompositeLayoutColumn Span="12">
                                        <Content>
                                            <h3 class="blockheader">明細</h3>
                                        </Content>
                                        <Rows>
                                            <telerik:LayoutRow RowType="Container" CssClass="content">
                                                <Columns>
                                                    <telerik:CompositeLayoutColumn Span="12">
                                                        <Content>
                                                            <%--<asp:ValidationSummary ID="vsError" runat="server" Width="100%" meta:resourcekey="vsErrorResource1" />--%>
                                                            <table style="width: 100%">
                                                                <tr>
                                                                    <td style="padding-top: 5px; font-weight: bolder">
                                                                        <asp:Label ID="lblName" runat="server" Text="名稱" Width="100%" Height="20px" meta:resourcekey="lblNameResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 5px">
                                                                        <telerik:RadDropDownList ID="rddlName" runat="server" DropDownWidth="92%" EnableTheming="true"
                                                                            AutoPostBack="true" CausesValidation="false"
                                                                            OnSelectedIndexChanged="rddlName_SelectedIndexChanged"
                                                                            meta:resourcekey="rddlNameResource1">
                                                                        </telerik:RadDropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 5px">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:CustomValidator ID="cvMessage" runat="server" ForeColor="Red" EnableTheming="true" ErrorMessage="請選擇活動。" Display="Dynamic" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:CustomValidator ID="cvNoData" runat="server" ForeColor="Red" EnableTheming="true" Display="Dynamic" ErrorMessage="無公益活動資訊，請至活動主檔維護新增。" meta:resourcekey="cvNoDataResource1"></asp:CustomValidator>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:CustomValidator ID="cvDoubleData" runat="server" ForeColor="Red" EnableTheming="true" Display="Dynamic" ErrorMessage="活動資訊重覆，請選擇其他活動資訊。" meta:resourcekey="cvDoubleDataResource1"></asp:CustomValidator>
                                                                                </td>
                                                                            </tr>
                                                                        </table>

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 10px; font-weight: bolder">
                                                                        <asp:Label ID="lblBeginTime" runat="server" Text="時間(起)" Width="100%" meta:resourcekey="lblBeginTimeResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 5px">
                                                                        <asp:Label ID="txtBeginTime" runat="server" Width="100%" meta:resourcekey="txtBeginTimeResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 15px; font-weight: bolder">
                                                                        <asp:Label ID="lblEndTime" runat="server" Text="時間(訖)" Width="100%" meta:resourcekey="lblEndTimeResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 5px">
                                                                        <asp:Label ID="txtEndTime" runat="server" Width="100%" meta:resourcekey="txtEndTimeResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 15px; font-weight: bolder">
                                                                        <asp:Label ID="lblActivityZone" runat="server" Text="活動時區" meta:resourcekey="lblActivityZoneResource1" ></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 5px">
                                                                        <asp:Label ID="txtActivityZone" runat="server" Width="100%" meta:resourcekey="txtActivityZoneResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 15px; font-weight: bolder">
                                                                        <asp:Label ID="lblActivityHours" runat="server" Text="活動時數" Width="100%" meta:resourcekey="lblActivityHoursResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 5px">
                                                                        <asp:Label ID="txtActivityHours" runat="server" Width="100%" meta:resourcekey="txtActivityHoursResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 15px; font-weight: bolder">
                                                                        <asp:Label ID="lblHours" runat="server" Text="公益時數" Width="100%" meta:resourcekey="lblHoursResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 5px">
                                                                        <asp:Label ID="txtHours" runat="server" Width="100%" meta:resourcekey="txtHoursResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 15px; font-weight: bolder">
                                                                        <asp:Label ID="lblPlace" runat="server" Text="地點" Width="100%" meta:resourcekey="lblPlaceResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 5px">
                                                                        <asp:Label ID="txtPlace" runat="server" Width="100%" meta:resourcekey="txtPlaceResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 15px; font-weight: bolder">
                                                                        <asp:Label ID="lblContent" runat="server" Text="內容" Width="100%" meta:resourcekey="lblContentResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding-top: 5px">
                                                                        <asp:Label ID="txtContent" runat="server" Width="100%" meta:resourcekey="txtContentResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
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


    <asp:HiddenField ID="hfMode" runat="server" />
    <asp:HiddenField ID="hfCharityGuid" runat="server" />
    <asp:HiddenField ID="hfMasterCharityGuid" runat="server" />
    <asp:HiddenField ID="hfApplicant" runat="server" />
    <asp:HiddenField ID="hfUI" runat="server" />
    <asp:Label ID="lblSelect" runat="server" Text="選擇活動" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
    <asp:Label ID="lblHour" runat="server" Text="小時" Visible="False" meta:resourcekey="lblHourResource1"></asp:Label>
</asp:Content>
