<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MobileMasterPage.master" AutoEventWireup="true" CodeBehind="ChooseFormMobile.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.WKF_OptionalFields.ChooseFormMobile" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest" meta:resourcekey="RadAjaxManager1Resource1">
    </telerik:RadAjaxManager>

    <script type="text/javascript">
        var ajaxManager;

        function doReturn() {
            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");

            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Return", "Value": "" }));
            return false;
        }

        function Search() {
            if (ajaxManager == null)
                ajaxManager = $find("<%=RadAjaxManager1.ClientID%>");
            var formName = $("#<%= ddlFormName.ClientID%>").val();
            var formStatus = $("#<%=ddlFormStatus.ClientID%>").val();
            if (formStatus == null)
                formStatus = 'Adopt';
            var keyword = $("#<%=txtKeyword.ClientID%>").val();
            var dateStart = $find("<%=dateStart.ClientID%>").get_selectedDate().format("yyyy/MM/dd");
            var dateEnd = $find("<%=dateEnd.ClientID%>").get_selectedDate().format("yyyy/MM/dd");
            var data = [formName, formStatus, keyword, dateStart, dateEnd];


            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Search", "Value": data }));
            return false;
        }
    </script>

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

            div.JustAddBorder table tr td {
                    border-width: 1px;
                    border-style: solid;
                    }
    </style>

    <script type="text/javascript">
        function Close() {
            $uof.dialog.close();
            setInterval(function () {
                window.location.href = '#InAppBrowserClosed';
            }, 300);
            return false;
        }
    </script>

    <div class="pageLayout" id="layout" runat="server">
        <asp:UpdatePanel ID="UpdatePanel" UpdateMode="Conditional" runat="server">
            <ContentTemplate>
                <telerik:RadPageLayout runat="server" GridType="Fluid" ShowGrid="true" HtmlTag="None">
                    <telerik:LayoutRow RowType="Generic">
                        <Rows>
                            <telerik:LayoutRow RowType="Generic" CssClass="content">
                                <Rows>
                                    <telerik:LayoutRow RowType="Container" WrapperHtmlTag="Div">
                                        <Columns>
                                            <telerik:CompositeLayoutColumn>
                                                <Content>
                                                    <h3 class="blockheader">
                                                        <asp:Label ID="lblFormChoose" runat="server" Text="表單選取"></asp:Label>
                                                    </h3>
                                                </Content>
                                                <Rows>
                                                    <telerik:LayoutRow RowType="Container" CssClass="content">
                                                        <Columns>
                                                            <telerik:CompositeLayoutColumn>
                                                                <Rows>
                                                                    <telerik:LayoutRow>
                                                                        <Columns>
                                                                            <telerik:LayoutColumn>
                                                                                <br />
                                                                                <asp:Label ID="lblFormName" runat="server" CssClass="title" Text="表單" meta:resourcekey="lblFormNameResource1"></asp:Label>
                                                                            </telerik:LayoutColumn>
                                                                        </Columns>
                                                                    </telerik:LayoutRow>
                                                                    <telerik:LayoutRow>
                                                                        <Columns>
                                                                            <telerik:LayoutColumn>
                                                                                <asp:DropDownList ID="ddlFormCategory" OnSelectedIndexChanged="ddlFormCategory_SelectedIndexChanged" AutoPostBack="true" runat="server" Width="100%" EnableTheming="true"></asp:DropDownList>
                                                                            </telerik:LayoutColumn>
                                                                        </Columns>
                                                                        <Columns>               
                                                                            <telerik:LayoutColumn>
                                                                                <br />
                                                                                <asp:DropDownList ID="ddlFormName" runat="server" Width="100%" EnableTheming="true"></asp:DropDownList>
                                                                            </telerik:LayoutColumn>
                                                                        </Columns>
                                                                    </telerik:LayoutRow>
                                                                </Rows>
                                                                <Rows>
                                                                    <telerik:LayoutRow>
                                                                        <Columns>
                                                                            <telerik:LayoutColumn>
                                                                                <asp:Label ID="lblFormPossession" runat="server" CssClass="title" Text="表單擁有者" meta:resourcekey="lblFormPossessionResource1"></asp:Label>
                                                                            </telerik:LayoutColumn>
                                                                        </Columns>
                                                                        <Columns>
                                                                            <telerik:LayoutColumn>
                                                                                <asp:DropDownList ID="ddlFormPossession" runat="server" Width="100%" EnableTheming="true"></asp:DropDownList>
                                                                            </telerik:LayoutColumn>
                                                                        </Columns>
                                                                    </telerik:LayoutRow>
                                                                </Rows>
                                                                 <Rows>
                                                                    <telerik:LayoutRow runat="server" ID="rowStatus1">
                                                                        <Columns>
                                                                            <telerik:LayoutColumn>
                                                                                <asp:Label ID="lblFormStatus" runat="server" CssClass="title" Text="狀態" meta:resourcekey="lblFormStatusResource1"></asp:Label>
                                                                            </telerik:LayoutColumn>
                                                                        </Columns>
                                                                    </telerik:LayoutRow>
                                                                    <telerik:LayoutRow runat="server" ID="rowStatus2">
                                                                        <Columns>
                                                                            <telerik:LayoutColumn>
                                                                                <asp:DropDownList ID="ddlFormStatus" runat="server" Width="100%" EnableTheming="true">
                                                                                    <asp:ListItem Selected="True" Text="所有狀態" Value="All" meta:resourcekey="lblSigningResource1"></asp:ListItem>
                                                                                    <asp:ListItem Text="簽核中" Value="Active" meta:resourcekey="lblActiveResource1"></asp:ListItem>
                                                                                    <asp:ListItem Text="同意" Value="Adopt" meta:resourcekey="lblAdoptResource1"></asp:ListItem>
                                                                                    <asp:ListItem Text="否決" Value="Rejected" meta:resourcekey="lblRejectedResource1"></asp:ListItem>
                                                                                    <asp:ListItem Text="作廢" Value="Cancel" meta:resourcekey="lblCancelResource1"></asp:ListItem>
                                                                                    <asp:ListItem Text="異常" Value="Exceptional" meta:resourcekey="lblExceptionalResource1"></asp:ListItem>
                                                                                    <asp:ListItem Text="退回申請者" Value="ReturnToApplicant" meta:resourcekey="lblReturnToApplicantResource1"></asp:ListItem>
                                                                                </asp:DropDownList>
                                                                            </telerik:LayoutColumn>
                                                                        </Columns>
                                                                    </telerik:LayoutRow>
                                                                </Rows>
                                                                <Rows>
                                                                    <telerik:LayoutRow>
                                                                        <Columns>
                                                                            <telerik:LayoutColumn>
                                                                                <asp:Label ID="lblKeyword" runat="server" CssClass="title" Text="關鍵字" meta:resourcekey="lblKeywordResource1"></asp:Label>
                                                                            </telerik:LayoutColumn>
                                                                        </Columns>
                                                                    </telerik:LayoutRow>
                                                                    <telerik:LayoutRow>
                                                                        <Columns>
                                                                            <telerik:LayoutColumn>
                                                                                <asp:TextBox ID="txtKeyword" runat="server" Width="100%" EnableTheming="true"></asp:TextBox>
                                                                            </telerik:LayoutColumn>
                                                                        </Columns>
                                                                    </telerik:LayoutRow>
                                                                </Rows>
                                                                <Rows>
                                                                    <telerik:LayoutRow>
                                                                        <Columns>
                                                                            <telerik:LayoutColumn>
                                                                                <asp:Label ID="lblStartTime" runat="server" CssClass="title" Text="申請日期(起)" meta:resourcekey="lblStartTimeResource1"></asp:Label>
                                                                            </telerik:LayoutColumn>
                                                                        </Columns>
                                                                    </telerik:LayoutRow>
                                                                    <telerik:LayoutRow>
                                                                        <Columns>
                                                                            <telerik:LayoutColumn>
                                                                                <telerik:RadDatePicker ID="dateStart" EnableTheming="True" runat="server"></telerik:RadDatePicker>
                                                                            </telerik:LayoutColumn>
                                                                        </Columns>
                                                                    </telerik:LayoutRow>
                                                                </Rows>
                                                                <Rows>
                                                                    <telerik:LayoutRow>
                                                                        <Columns>
                                                                            <telerik:LayoutColumn>
                                                                                <asp:Label ID="lblEndTime" runat="server" CssClass="title" Text="申請日期(訖)" meta:resourcekey="lblEndTimeResource1"></asp:Label>
                                                                            </telerik:LayoutColumn>
                                                                        </Columns>
                                                                    </telerik:LayoutRow>
                                                                    <telerik:LayoutRow>
                                                                        <Columns>
                                                                            <telerik:LayoutColumn>
                                                                                <telerik:RadDatePicker ID="dateEnd" EnableTheming="True" runat="server"></telerik:RadDatePicker>
                                                                            </telerik:LayoutColumn>
                                                                        </Columns>
                                                                    </telerik:LayoutRow>
                                                                </Rows>
                                                                <Rows>
                                                                    <telerik:LayoutRow>
                                                                        <Columns>
                                                                            <telerik:LayoutColumn>
                                                                                <asp:Label ID="lblQueryTip" Text="*可查詢並選取與{#Signer}{#Filler}{#Applicant}相關的表單" ForeColor="Blue" runat="server" meta:resourcekey="lblQueryTipResource1"></asp:Label>
                                                                            </telerik:LayoutColumn>
                                                                        </Columns>
                                                                    </telerik:LayoutRow>
                                                                </Rows>
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <asp:Label ID="lblReturn" runat="server" Text="返回" Visible="False" meta:resourcekey="lblReturnResource1"></asp:Label>
    <asp:Label ID="lblSearch" runat="server" Text="查詢" Visible="False" meta:resourcekey="lblSearchResource1"></asp:Label>
    <asp:Label ID="lblAdopt" runat="server" Text="同意" Visible="false" meta:resourcekey="lblAdoptResource1"></asp:Label>
    <asp:Label ID="lblSigner" Text="簽核者" Visible="false" runat="server" meta:resourcekey="lblSignerResource1"></asp:Label>
    <asp:Label ID="lblFiller" Text="填寫者" Visible="false" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
    <asp:Label ID="lblApplicant" Text="申請者" Visible="false" runat="server" meta:resourcekey="lblApplicantResource1"></asp:Label>
    <asp:Label ID="lblMyForm" Text="我的表單" Visible="false" runat="server" meta:resourcekey="lblMyFormResource1"></asp:Label>
    
    <asp:HiddenField ID="hfFieldId" runat="server" />
    <asp:HiddenField ID="hfTaskId" runat="server" />
    <asp:HiddenField ID="hfFormVersionId" runat="server" />
    <asp:HiddenField ID="hfSiteId" runat="server" />
    <asp:HiddenField ID="hfNodeSeq" runat="server" />
    <asp:HiddenField ID="hfScriptId" runat="server" />
    <asp:HiddenField ID="hfFormLimit" runat="server" />
    <asp:HiddenField ID="hfFormApplicant" runat="server" />
    <asp:HiddenField ID="hfFormStatus" runat="server" />

</asp:Content>
