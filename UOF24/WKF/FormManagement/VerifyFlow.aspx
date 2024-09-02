<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="VerifyFlow.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.VerifyFlow" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldCollectionUsingUC.ascx" TagPrefix="uc1" TagName="VersionFieldCollectionUsingUC" %>
<%@ Register Src="~/WKF/FormManagement/MultiColumnDesign/UC_VersionFieldCollectionUsing.ascx" TagPrefix="uc1" TagName="UC_VersionFieldCollectionUsing" %>
<%@ Register Src="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldConditionUC.ascx" TagPrefix="uc1" TagName="VersionFieldConditionUC" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_BtnChoiceOnce.ascx" TagPrefix="uc1" TagName="UC_BtnChoiceOnce" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script id="redirectjs" type="text/javascript">

        var ajaxManager;

        function VertifyFlow_Button1ClientOnClick() {

            if (ajaxManager == null)
                ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");

            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "Verify", "Value": "" }));
            return false;
        }

        function SetPosition() {

            $('#RAD_SPLITTER_PANE_CONTENT_ctl00_Radpane4').scrollTop($('#RAD_SPLITTER_PANE_CONTENT_ctl00_Radpane4').height() + 200)
            return false;
        }

        function DownloadNotify() {

            var type = $("input[id^='<% =this.rblType.ClientID %>']:checked").val();

            if (type == 'Multiple') {
                alert('<%=lblMsgProcess.Text%>');
            }
        }

    </script>

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest"></telerik:RadAjaxManager>

    <table style="width: 100%; height: 100%; border: 0px;">
        <tr>
            <td style="background-image: url(<%=themePath %>/images/wf_bg.gif); vertical-align: top; text-align: center;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table style="width: 96%; height: 100%; border: 0px; margin-left: auto; margin-right: auto;">
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 100%; border: 0px;">
                                        <tr>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a01.gif); background-position: 0% 100%; height: 15px; width: 15px"></td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a09.gif); background-position: 0% 100%; background-repeat: repeat-x; height: 15px"></td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a02.gif); background-position: 0% 100%; height: 15px; width: 15px"></td>
                                        </tr>
                                        <tr>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a03.gif)"></td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td style="width: 100%; height: 100%; padding: 0px 3px 0px 0px; margin: 0;">
                                                            <table class="PopTable" style="width: 100%; height: 100px; padding: 0px 0px 0px 0px; margin: 0;">
                                                                <tr>
                                                                    <td class="PopTableHeader" style="height: 20px;">
                                                                        <div style="text-align: center;">
                                                                            <asp:Label ID="lblTxtSimulationInfo" runat="server" Text="模擬資訊" meta:resourcekey="lblTxtSimulationInfoResource1"></asp:Label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="height: 140px; margin: 0; padding: 3px 3px 3px 3px; background-color: white; vertical-align: top;">
                                                                        <table>
                                                                            <tr style="line-height: 40px;">
                                                                                <td style="width: 250px;">
                                                                                    <asp:Label ID="lblTxtSimulationType" runat="server" Text="模擬類型：" meta:resourcekey="lblTxtSimulationTypeResource1"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:RadioButtonList ID="rblType" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="rblType_SelectedIndexChanged" meta:resourcekey="rblTypeResource1">
                                                                                        <asp:ListItem Value="Single" Text="線上模擬" Selected="True" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                                                                        <asp:ListItem Value="Multiple" Text="匯出報表（可多人）" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                                                                    </asp:RadioButtonList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="padding: 5px 0px 5px 0px">
                                                                                    <asp:Label ID="lblTxtSimulationApplicant" runat="server" Text="模擬申請者：" meta:resourcekey="lblTxtSimulationApplicantResource1"></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: left;" colspan="2">
                                                                                    <uc1:UC_ChoiceList runat="server" ID="chListApplicantMultiple" Visible="False" ShowMember="false" />
                                                                                    <uc1:UC_BtnChoiceOnce runat="server" ID="chListApplicantSingle" ShowMember="true" />
                                                                                    <asp:Label ID="lblUserName" runat="server" meta:resourcekey="lblUserNameResource1"></asp:Label>
                                                                                    <asp:Label ID="lblUserGuid" runat="server" Visible="False" meta:resourcekey="lblUserGuidResource1"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr id="trDeptSingle" runat="server">
                                                                                <td style="padding: 10px 0px 5px 0px" runat="server">
                                                                                    <asp:Label ID="lblTxtSimulationDept" runat="server" Text="模擬申請者部門：" meta:resourcekey="lblTxtSimulationDeptResource1"></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: left; padding: 10px 0px 5px 3px;" colspan="2" runat="server">
                                                                                    <asp:DropDownList ID="ddlDeptSingle" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDeptSingle_SelectedIndexChanged"></asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="padding: 5px 0px 5px 0px">
                                                                                    <asp:Label ID="lblUrgent" runat="server" Text="緊急程度：" meta:resourcekey="lblUrgentResource1"></asp:Label>
                                                                                </td>
                                                                                <td style="padding: 5px 0px 5px 0px">
                                                                                    <asp:RadioButtonList ID="rblUrgent" runat="server" RepeatDirection="Horizontal">
                                                                                        <asp:ListItem Text="緊急" Value="0" meta:resourcekey="liMostUrgentResource1"></asp:ListItem>
                                                                                        <asp:ListItem Text="急" Value="1" meta:resourcekey="liHighResource1"></asp:ListItem>
                                                                                        <asp:ListItem Text="普通" Value="2" Selected="True" meta:resourcekey="liNormalResource1"></asp:ListItem>
                                                                                    </asp:RadioButtonList>
                                                                                </td>
                                                                            </tr>
                                                                          <tr>
                                                                                <td style="padding: 5px 0px 5px 0px">
                                                                                    <asp:Label ID="lblFlowResultSetting" runat="server" Text="流程結果顯示：" meta:resourcekey="lblFlowResultSettingResource1"></asp:Label>
                                                                                </td>
                                                                                <td style="padding: 5px 0px 5px 0px">
                                                                                    <asp:RadioButtonList ID="rbtnlFlowResultSetting" runat="server" RepeatDirection="Horizontal" meta:resourcekey="rbtnlFlowResultSettingResource1">
                                                                                        <asp:ListItem Value="FlowEnd" Text ="流程結束站點" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                                                                        <asp:ListItem Value="Default" Text ="所有簽核者站點" Selected ="True" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                                                                    </asp:RadioButtonList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td></td>
                                                                                <td style="text-align: left;">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label ID="lblMsgApplicantLimit" runat="server" Text="模擬申請者請以50人為限，避免產生驗證資料過程系統過度使用資源，影響使用者作業。" Visible="False" ForeColor="Blue" meta:resourcekey="lblMsgApplicantLimitResource1"></asp:Label>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:CustomValidator ID="cvApplicant" runat="server" meta:resourcekey="cvApplicantResource1"></asp:CustomValidator>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a05.gif)"></td>
                                        </tr>
                                        <tr>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a06.gif); background-position: 0% 0%; height: 20px; width: 15px"></td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a07.gif); background-position: 0% 0%; height: 20px"></td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a08.gif); background-position: 0% 0%; height: 20px; width: 15px"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

                        <table style="width: 96%; border: 0; margin-left: auto; margin-right: auto;">
                            <tr>
                                <td class="blank8"></td>
                            </tr>
                        </table>
                        <table style="width: 96%; border: 0; margin-left: auto; margin-right: auto;">
                            <tr>
                                <td>
                                    <table style="width: 100%; border: 0;">
                                        <tr>
                                            <td style="min-width: 120px; width: 120px">
                                                <img src="<%=themePath %>/images/wf_icon01.jpg" width="120" height="65">
                                            </td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a01.jpg); background-repeat: repeat-x; height: 65px; background-position: 0% 100%;">
                                                <table style="width: 100%; border: 0;">
                                                    <tr>
                                                        <td class="bigT" style="vertical-align: middle; text-align: left; height: 65px">
                                                            <asp:Label ID="lblFormName" runat="server" meta:resourcekey="lblFormNameResource1"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="width: 26px;">
                                                <img src="<%=themePath %>/images/wf_a02.jpg" width="26" height="65">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 100%; border: 0;">
                                        <tr>
                                            <td style="width: 15px; height: 8px; background-image: url(<%=themePath %>/images/wf_a03.gif)">
                                                <img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8"></td>
                                            <td style="height: 8px; background-image: url(<%=themePath %>/images/wf_a04.gif)"></td>
                                            <td style="width: 15px; height: 8px; background-image: url(<%=themePath %>/images/wf_a05.gif)">
                                                <img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8"></td>
                                        </tr>
                                        <tr>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a03.gif)">
                                                <img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8">
                                            </td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)">
                                                <table style="margin-left: auto; margin-right: auto; width: 95%; border: 0px">
                                                    <tr>
                                                        <td>
                                                            <asp:Panel ID="Panel1" runat="server" Width="100%" meta:resourcekey="Panel1Resource1">
                                                                <table style="border: 0px; width: 100%;">
                                                                    <tr>
                                                                        <td style="height: 18px">&nbsp;
                                                                        </td>
                                                                        <td style="height: 18px; vertical-align: top;">
                                                                            <uc1:VersionFieldCollectionUsingUC runat="server" ID="VersionFieldCollectionUsingUC" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a05.gif)">
                                                <img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a06.gif); background-position: 0% 0%; height: 20px; width: 15px"></td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a07.gif); background-position: 0% 0%; height: 20px"></td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a08.gif); background-position: 0% 0%; height: 20px; width: 15px"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 96%; border: 0; margin-left: auto; margin-right: auto;">
                            <tr>
                                <td class="blank8"></td>
                            </tr>
                        </table>

                        <table style="width: 96%; border: 0; margin-left: auto; margin-right: auto;">
                            <tr>
                                <td class="blank8"></td>
                            </tr>
                        </table>
                        <table id="tbSingleResult" runat="server" style="width: 96%; height: 100%; border: 0px; margin-left: auto; margin-right: auto;">
                            <tr runat="server">
                                <td runat="server">
                                    <table style="width: 100%; border: 0px;">
                                        <tr>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a01.gif); background-position: 0% 100%; height: 15px; width: 15px"></td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a09.gif); background-position: 0% 100%; background-repeat: repeat-x; height: 15px"></td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a02.gif); background-position: 0% 100%; height: 15px; width: 15px"></td>
                                        </tr>
                                        <tr>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a03.gif)"></td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td style="width: 100%; height: 100%; padding: 0px 3px 0px 0px; margin: 0;">
                                                            <table class="PopTable" style="width: 100%; height: 100px; padding: 0px 0px 0px 0px; margin: 0;">
                                                                <tr>
                                                                    <td class="PopTableLeftTD" style="height: 20px; text-align: right;">
                                                                        <asp:Label ID="lblTxtSimulationResultSingle" runat="server" Text="線上模擬驗證結果" meta:resourcekey="lblTxtSimulationResultSingleResource1"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left;">
                                                                        <asp:Label ID="lblTxtResultCorrect" runat="server" Text="正常" Visible="False" ForeColor="Blue" meta:resourcekey="lblTxtResultCorrectResource1"></asp:Label>
                                                                        <asp:Label ID="lblTxtResultError" runat="server" Text="異常" Visible="False" ForeColor="Red" meta:resourcekey="lblTxtResultErrorResource1"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr id="trSingleResult">
                                                                    <td style="margin: 0; padding: 3px 3px 3px 3px; background-color: white; vertical-align: top;" colspan="2">&nbsp;
                                                                            <Ede:Grid ID="gdSingleResult" runat="server"
                                                                                AutoGenerateCheckBoxColumn="False"
                                                                                AutoGenerateColumns="False"
                                                                                AllowSorting="False"
                                                                                CustomDropDownListPage="False"
                                                                                DataKeyOnClientWithCheckBox="False"
                                                                                DefaultSortDirection="Ascending"
                                                                                EmptyDataText="沒有資料"
                                                                                EnhancePager="True"
                                                                                KeepSelectedRows="False"
                                                                                PageSize="15"
                                                                                SelectedRowColor=""
                                                                                UnSelectedRowColor=""
                                                                                Width="100%"
                                                                                OnRowDataBound="gdSingleResult_RowDataBound"
                                                                                meta:resourcekey="gdSingleResultResource1">
                                                                                <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                                                                                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                                                                <Columns>
                                                                                    <asp:BoundField HeaderText="站點" DataField="SITE_SEQ" meta:resourcekey="BoundFieldResource1">
                                                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                    </asp:BoundField>
                                                                                    <asp:TemplateField HeaderText="簽核者" meta:resourcekey="TemplateFieldResource1">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblOriginalSigner" runat="server" Text='<%#: Bind("ORIGINAL_SIGNER") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="簽核型態" meta:resourcekey="TemplateFieldResource2">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblSignType" runat="server"></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="是否可結案" meta:resourcekey="TemplateFieldResource3">
                                                                                        <ItemTemplate>
                                                                                            <asp:Image ID="imgAllowEndSite" runat="server" Visible="false" />
                                                                                            <asp:Image ID="imgNotEnd" runat="server" Visible="false" />
                                                                                            <asp:Image ID="imgAllowEndSubFlow" runat="server" Visible="false" />
                                                                                        </ItemTemplate>
                                                                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <HeaderStyle Wrap="False" />
                                                                                <RowStyle HorizontalAlign="Left" />
                                                                            </Ede:Grid>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a05.gif)"></td>
                                        </tr>
                                        <tr>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a06.gif); background-position: 0% 0%; height: 20px; width: 15px"></td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a07.gif); background-position: 0% 0%; height: 20px"></td>
                                            <td style="background-image: url(<%=themePath %>/images/wf_a08.gif); background-position: 0% 0%; height: 20px; width: 15px"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 96%; border: 0; margin-left: auto; margin-right: auto;">
                            <tr>
                                <td class="blank8"></td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>


    <asp:Label ID="lblGeneral" runat="server" Text="一般" Visible="False" meta:resourcekey="lblGeneralResource1"></asp:Label>
    <asp:Label ID="lblOr" runat="server" Text="並簽" Visible="False" meta:resourcekey="lblOrResource1"></asp:Label>
    <asp:Label ID="lblAnd" runat="server" Text="會簽" Visible="False" meta:resourcekey="lblAndResource1"></asp:Label>

    <asp:Label ID="lblSubFlow" runat="server" Text="副流程" Visible="False" meta:resourcekey="lblSubFlowResource1"></asp:Label>
    <asp:Label ID="lblParallelFlow" runat="server" Text="平行流程" Visible="False" meta:resourcekey="lblParallelFlowResource1"></asp:Label>
    <asp:Label ID="lblExternalFlowSite" runat="server" Text="應用程式站點" Visible="False" meta:resourcekey="lblExternalFlowSiteResource1"></asp:Label>
    <asp:Label ID="lblNotFindSignerException" runat="server" Text="找不到簽核者" Visible="False" meta:resourcekey="lblNotFindSignerExceptionResource1"></asp:Label>
    <asp:Label ID="lblConditionExceptSite" runat="server" Text="條件式站點找不到符合條件" Visible="False" meta:resourcekey="lblConditionExceptSiteResource1"></asp:Label>
    <asp:Label ID="lblCustGroupFlowSite" runat="server" Text="自選流程站點" Visible="False" meta:resourcekey="lblCustGroupFlowSiteResource1"></asp:Label>
    <asp:Label ID="lblCustDesignFlowSite" runat="server" Text="自訂流程站點" Visible="False" meta:resourcekey="lblCustDesignFlowSiteResource1"></asp:Label>
    <asp:Label ID="lblIsAssignByPreSite" runat="server" Text="上一站點指定" Visible="False" meta:resourcekey="lblIsAssignByPreSiteResource1"></asp:Label>
    <asp:Label ID="lblFieldFlowSite" runat="server" Text="組織欄位站點" Visible="False" meta:resourcekey="lblFieldFlowSiteResource1"></asp:Label>
    <asp:Label ID="lblAlertSite" runat="server" Text="知會站點" Visible="False" meta:resourcekey="lblAlertSiteResource1"></asp:Label>

    <asp:Label ID="lblAllowEndSite" runat="server" Text="可在此結案" Visible="False" meta:resourcekey="lblAllowEndSiteResource1"></asp:Label>
    <asp:Label ID="lblNotAllowEndSite" runat="server" Text="不可在此結案" Visible="False" meta:resourcekey="lblNotAllowEndSiteResource1"></asp:Label>
    <asp:Label ID="lblAllowEndSubFlow" runat="server" Text="可在此結束副流程" Visible="False" meta:resourcekey="lblAllowEndSubFlowResource1"></asp:Label>
    <asp:Label ID="lblNotAllowEndSubFlow" runat="server" Text="不可在此結束副流程" Visible="False" meta:resourcekey="lblNotAllowEndSubFlowResource1"></asp:Label>

    <asp:Label ID="lblCvMsgTextChoosePerson" runat="server" Text="請選擇模擬申請者" Visible="False" meta:resourcekey="lblCvMsgTextChoosePersonResource1"></asp:Label>
    <asp:Label ID="lblCvMsgTextJobTitleNotFoundSingle" runat="server" Text="模擬申請者未設定職級" Visible="False" meta:resourcekey="lblCvMsgTextJobTitleNotFoundSingleResource1"></asp:Label>
    <asp:Label ID="lblCvMsgTextJobTitleNotFoundMultiple" runat="server" Text="以下帳號需先設定職級，才能進行流程驗證" Visible="False" meta:resourcekey="lblCvMsgTextJobTitleNotFoundMultipleResource1"></asp:Label>
    <asp:Label ID="lblCvMsgTextTooMuchApplicant" runat="server" Text="模擬申請者不可超過50人" Visible="False" meta:resourcekey="lblCvMsgTextTooMuchApplicantResource1"></asp:Label>

    <asp:Label ID="lblTxtErrorMultiple" runat="server" Text="流程驗證匯出報表" Visible="False" meta:resourcekey="lblTxtErrorMultipleResource1"></asp:Label>
    <asp:Label ID="lblTxtExcuteVerifyFlow" runat="server" Text="驗證" Visible="False" meta:resourcekey="lblTxtExcuteVerifyFlowResource1"></asp:Label>
    <asp:Label ID="lblTxtChoose" runat="server" Text="選取人員" Visible="False" meta:resourcekey="lblTxtChooseResource1"></asp:Label>

    <asp:Label ID="lblMsgProcess" runat="server" Text="報表匯出已進入系統排程，請於五分鐘後至 [下載流程驗證報表] 中下載" Visible="False" meta:resourcekey="lblMsgProcessResource1"></asp:Label>

</asp:Content>
