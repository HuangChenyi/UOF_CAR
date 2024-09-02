<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_DevolveWorkState" Title="工作進度" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="DevolveWorkState.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        function checkReturn()
        {
            var comment = $('#<% = txtComment.ClientID %>');

            if(comment.val().length ==0)
            {
                alert("<%=lblReturnSignComment.Text%>");
                setTimeout(
                    function () {
                        comment.focus();
                    }
                    , 0);
                return false;
            }
        }
    </script>
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab runat="server" Text="工作進度" Value="workstate" PageViewID="pageView1" meta:resourcekey="RadTabResource1"></telerik:RadTab>
            <telerik:RadTab runat="server" Text="審核意見" Value="examinelog" PageViewID="pageView2" Visible="false" meta:resourcekey="RadTabResource2"></telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" Width="100%">
        <telerik:RadPageView ID="pageView1" runat="server">
            <table style="width: 100%;">
                <tr>
                    <td>&nbsp;
                    </td>
                    <td style="width: 100%">
                        <fieldset style="padding: 2;">
                            <legend>
                                <asp:Label ID="Label3" runat="server" Text="負責人最新回報狀況"
                                    meta:resourcekey="Label3Resource1"></asp:Label></legend>
                            <Ede:Grid ID="Grid1" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                AutoGenerateColumns="False" DataKeyNames="WORK_GUID"
                                AllowPaging="True"
                                DataSourceID="ObjectDataSource1" Width="100%"
                                OnRowDataBound="Grid1_RowDataBound"
                                DataKeyOnClientWithCheckBox="False"
                                DefaultSortDirection="Ascending" EnhancePager="True" PageSize="15"
                                EmptyDataText="沒有資料" EnableModelValidation="True"
                                KeepSelectedRows="False" meta:resourcekey="Grid1Resource2">
                                <EnhancePagerSettings FirstImageUrl="" FirstAltImageUrl="" PreviousImageUrl="" NextImageUrl="" LastImageUrl="" LastAltImage="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageInfoCssClass="" PageRedirectCssClass="" NextIAltImageUrl="" PreviousAltImageUrl="" ShowHeaderPager="True"></EnhancePagerSettings>

                                <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                <Columns>
                                    <asp:BoundField DataField="USER_NAME" HeaderText="負責人" SortExpression="USER_NAME" meta:resourcekey="BoundFieldResource1">
                                        <HeaderStyle Width="100px" Wrap="false" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="狀態" SortExpression="WORK_STATE" meta:resourcekey="TemplateFieldResource1">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lbState" meta:resourceKey="lbStateResource1"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="60px" Wrap="false" />
                                        <ItemStyle Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="進行中說明" meta:resourcekey="BoundFieldResource4">
                                        <ItemTemplate>
                                            <asp:Label ID="lblProceedingDesc" runat="server" Style="word-wrap: normal; word-break: break-word;"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="120px" Wrap="false" />
                                        <ItemStyle Wrap="True" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="進行中時間" SortExpression="PROCEEDING_TIME" meta:resourcekey="BoundFieldResource2">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblProceedingTime"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="100px" Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="完成說明" meta:resourcekey="BoundFieldResource5">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCompleteDesc" runat="server" Style="word-wrap: normal; word-break: break-word;"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="120px" Wrap="false" />
                                        <ItemStyle Wrap="True" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="完成時間" SortExpression="COMPLETE_TIME" meta:resourcekey="BoundFieldResource3">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblCompleteTime"></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle Width="100px" Wrap="false" />
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="附件" meta:resourcekey="BoundFieldResource9">
                                        <HeaderStyle Width="100px" Wrap="False" />
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                </Columns>
                            </Ede:Grid>
                        </fieldset>
                    </td>
                    <td></td>
                </tr>
            </table>

            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDevolvedWorkProgress" TypeName="Ede.Uof.EIP.Schedule.Devolve.DevolveManagementUCO">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbUserGuid" Name="userGUID" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="lbDevolveGuid" Name="devolveGUID" PropertyName="Text"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Label ID="lbUserGuid" runat="server" Visible="False" meta:resourcekey="lbUserGuidResource1"></asp:Label>
            <asp:Label ID="lbDevolveGuid" runat="server" Visible="False" meta:resourcekey="lbDevolveGuidResource1"></asp:Label>
            <asp:Label ID="lblPass" runat="server" Text="通過" Visible="False" meta:resourcekey="lblPassResource1"></asp:Label>
            <asp:Label ID="lblReject" runat="server" Text="不通過" Visible="False" meta:resourcekey="lblRejectResource1"></asp:Label>
            <asp:Label ID="lblAllMsg" runat="server" Text="全部" Visible="False" meta:resourcekey="lblAllMsgResource1"></asp:Label>

            <br />
            <br />
            <table style="width: 100%;">
                <tr>
                    <td>&nbsp;
                    </td>
                    <td style="width: 100%">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <fieldset style="padding: 2;">
                                    <legend>
                                        <asp:Label ID="Label2" runat="server" Text="工作回報歷程" meta:resourcekey="Label2Resource1"></asp:Label>
                                    </legend>
                                    <table>
                                        <tr>
                                            <td style="white-space: nowrap; text-align: left;">
                                                <asp:Label ID="Label1" runat="server" Text="負責人：" meta:resourcekey="Label1Resource1"></asp:Label>
                                                <asp:DropDownList ID="ddlUser" runat="server" meta:resourcekey="ddlUserResource1">
                                                </asp:DropDownList>
                                                <telerik:RadButton ID="btnQuery" runat="server" Text="查詢" meta:resourcekey="btnQueryResource1" OnClick="btnQuery_Click1"></telerik:RadButton>
                                            </td>
                                        </tr>
                                    </table>
                                    <Ede:Grid ID="Grid2" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                                        AutoGenerateColumns="False"
                                        AllowPaging="True"
                                        Width="100%"
                                        DataKeyOnClientWithCheckBox="False"
                                        DefaultSortDirection="Ascending" EnhancePager="True" PageSize="15"
                                        EmptyDataText="沒有資料"
                                        OnPageIndexChanging="Grid2_PageIndexChanging"
                                        OnRowDataBound="Grid2_RowDataBound" KeepSelectedRows="False"
                                        meta:resourcekey="Grid2Resource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                                        <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl=""
                                            LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl=""
                                            PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass=""
                                            PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                                        <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                        <Columns>
                                            <asp:BoundField DataField="USER_NAME" HeaderText="負責人"
                                                meta:resourcekey="BoundFieldResource6">
                                                <HeaderStyle Width="100px" Wrap="false" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="狀態" meta:resourcekey="TemplateFieldResource2">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("WORK_STATE") %>'
                                                        meta:resourcekey="lblStatusResource1"></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("WORK_STATE") %>'
                                                        meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                                </EditItemTemplate>
                                                <HeaderStyle Width="60px" Wrap="false" />
                                                <ItemStyle Wrap="false" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="說明" meta:resourcekey="BoundFieldResource7">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDesc" runat="server" Style="word-wrap: normal; word-break: break-word;"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Wrap="false" />
                                                <ItemStyle Wrap="True" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="時間" meta:resourcekey="BoundFieldResource8">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCreateTime" runat="server" Text='<%# Bind("CREATE_TIME") %>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle Width="100px" Wrap="false" />
                                                <ItemStyle Wrap="False" />
                                            </asp:TemplateField>
                                            <asp:BoundField HeaderText="附件" meta:resourcekey="BoundFieldResource9">
                                                <HeaderStyle Width="100px" Wrap="False" />
                                                <ItemStyle Width="100px" />
                                            </asp:BoundField>
                                        </Columns>
                                    </Ede:Grid>
                                </fieldset>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td></td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td>&nbsp;
                    </td>
                    <td style="width: 100%">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <fieldset style="padding: 2;">
                                    <legend>
                                        <asp:Label ID="Label4" runat="server" Text="審核意見" meta:resourcekey="Label4Resource1"></asp:Label>
                                    </legend>
                                    <asp:TextBox ID="txtComment" runat="server" Width="100%" Rows="4" TextMode="MultiLine" meta:resourcekey="txtCommentResource1"></asp:TextBox>
                                </fieldset>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </telerik:RadPageView>
        <telerik:RadPageView ID="pageView2" runat="server">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <Ede:Grid ID="grdExamineLog" runat="server" AutoGenerateCheckBoxColumn="false" AutoGenerateColumns="false" AllowPaging="True"
                        Width="100%" DataKeyOnClientWithCheckBox="False"
                        DefaultSortDirection="Ascending" DefaultSortColumnName="CREATE_DATE"
                        EnhancePager="True" PageSize="15"
                        EmptyDataText="沒有資料" OnRowDataBound="grdExamineLog_RowDataBound" OnPageIndexChanging="grdExamineLog_PageIndexChanging"
                        OnSorting="grdExamineLog_Sorting" meta:resourcekey="grdExamineLogResource1">
                        <Columns>
                            <asp:TemplateField HeaderText="審核者" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <asp:Label ID="lblCreator" runat="server" meta:resourcekey="lblCreatorResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="100px" Wrap="false" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="COMMENT" HeaderText="審核意見" meta:resourcekey="BoundFieldResource10">
                                <HeaderStyle Width="100px" Wrap="false" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="審核時間" SortExpression="CREATE_DATE" meta:resourcekey="TemplateFieldResource4">
                                <ItemTemplate>
                                    <asp:Label ID="lblCreateDate" runat="server" meta:resourcekey="lblCreateDateResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="100px" Wrap="false" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="審核狀態" meta:resourcekey="TemplateFieldResource5">
                                <ItemTemplate>
                                    <asp:Label ID="lblExamineStatus" runat="server" meta:resourcekey="lblExamineStatusResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle Width="100px" Wrap="false" />
                                <ItemStyle Wrap="False" />
                            </asp:TemplateField>
                        </Columns>
                    </Ede:Grid>
                </ContentTemplate>
            </asp:UpdatePanel>
        </telerik:RadPageView>
    </telerik:RadMultiPage>

    <asp:Label ID="lblApprove" runat="server" Text="同意" Visible="False" meta:resourcekey="lblApproveResource1"></asp:Label>
    <asp:Label ID="lblDeny" runat="server" Text="拒絕" Visible="False" meta:resourcekey="lblDenyResource1"></asp:Label>

    <asp:Label ID="lblProceeding" runat="server" Text="進行中" Visible="False" meta:resourcekey="lblProceedingResource1"></asp:Label>
    <asp:Label ID="lblCompleted" runat="server" Text="完成" Visible="False" meta:resourcekey="lblCompletedResource1"></asp:Label>
    <asp:Label ID="lblReturnSignComment" runat="server" Visible="False" Text="請在意見欄輸入意見" meta:resourcekey="lblReturnSignCommentResource1"></asp:Label>
</asp:Content>

