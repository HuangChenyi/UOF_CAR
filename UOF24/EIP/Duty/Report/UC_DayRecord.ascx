<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="EIP_Duty_Report_UC_DayRecord" CodeBehind="UC_DayRecord.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<script type="text/javascript">
    function dayRecordToolBar_Click1(sender, args) {
        var hfPunch = $("#<%=hfPunchRequired.ClientID %>").val();
        var txtReason = $("#<%=txtReason.ClientID %>").val();
        var cvReason = $("#<%=cvReason.ClientID %>");
        
        if (hfPunch == "True") {
            if (txtReason.trim() == "") {
                cvReason.show();
                args.set_cancel(true);
                return;
            }
            else {
                cvReason.hide();
            }
        }

        var toolBar = sender;
        var toolbarbutton = toolBar.findItemByText("date");
        var rdpDate = toolbarbutton.findControl("rdpDate");
        var ddlDate = $telerik.findElement(toolbarbutton.get_element(), ("ddlDate")).value;
        var key = args.get_item().get_value();
        if (key === "btnWork") {
            var hasPunchOff = $("#<%=hfHasPunchOff.ClientID%>").val();
            if (hasPunchOff === "true") {
                args.set_cancel(!window.confirm(ddlDate + ' <%=lblConfirmWork2.Text %>'));
            } else {
                args.set_cancel(!window.confirm(ddlDate + ' <%=lblConfirmWork.Text %>'));
            }
        }

        if (key === "btnOff") {
            args.set_cancel(!window.confirm(ddlDate + ' <%=lblConfirmOff.Text %>'));
        }
    }

</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div style="width: 99%">
            <table style="width: 100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <telerik:RadToolBar ID="RadToolBar1" runat="server" OnClientButtonClicking="dayRecordToolBar_Click1" Width="100%"
                            OnButtonClick="RadToolBar1_ButtonClick">
                            <Items>
                                <telerik:RadToolBarButton runat="server" Value="date" Text="date">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" meta:resourcekey="TBLabelResource1"
                                                        Text="歸屬日"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:DropDownList runat="server" ID="ddlDate" AutoPostBack="true" OnSelectedIndexChanged="ddlDate_SelectedIndexChanged"></asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="sp0">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="簽到" Value="btnWork" Enabled="False" meta:resourcekey="TBarButtonResource1"
                                    CheckedImageUrl="~/Common/Images/Icon/icon22_04.png"
                                    DisabledImageUrl="~/Common/Images/Icon/icon22_04.png"
                                    HoveredImageUrl="~/Common/Images/Icon/icon22_04.png"
                                    ImageUrl="~/Common/Images/Icon/icon22_04.png">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="sp1">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Text="簽退" Value="btnOff" Enabled="False" meta:resourcekey="TBarButtonResource2"
                                    CheckedImageUrl="~/Common/Images/Icon/icon22_05.png"
                                    DisabledImageUrl="~/Common/Images/Icon/icon22_05.png"
                                    HoveredImageUrl="~/Common/Images/Icon/icon22_05.png"
                                    ImageUrl="~/Common/Images/Icon/icon22_05.png">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="sp2">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="subDept" meta:resourcekey="TBarButtonResource3">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbSubDept" Text="包含子部門" AutoPostBack="True" runat="server" OnCheckedChanged="cbSubDept_CheckedChanged" meta:resourcekey="cbSubDeptResource1" />
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" IsSeparator="True" Text="sp3" Value="QueryDept">
                                </telerik:RadToolBarButton>
                                <telerik:RadToolBarButton runat="server" Value="TimeZoneDayRecord">
                                    <ItemTemplate>
                                        <asp:Label ID="lblUserTimeZoneName" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </telerik:RadToolBarButton>
                            </Items>
                        </telerik:RadToolBar>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:CustomValidator ID="CusVail_IP" runat="server" ErrorMessage="此IP不允許刷卡" EnableClientScript="False" meta:resourcekey="CusVail_IPResource1"
                            Display="Dynamic"></asp:CustomValidator>
                        <asp:CustomValidator ID="cusVail_OnlyApp" runat="server" ErrorMessage="只允許在App上刷卡"
                            meta:resourcekey="cusVail_OnlyAppResource1" Display="Dynamic"></asp:CustomValidator>
                        <asp:CustomValidator ID="cusVail_104Punch" runat="server" ErrorMessage="" Display="Dynamic" meta:resourcekey="cusVail_104PunchResource1"></asp:CustomValidator>
                    </td>
                </tr>
                <tr id="trReason" runat="server" visible="false" style="height:36px">
                    <td style="vertical-align: middle">
                        <img src="<%=ResolveUrl("~/Common/Images/Icon/icon_m02.gif")%>"/>
                        <asp:Label runat="server" Text="事由" ID="lblReason" meta:resourcekey="lblReasonResource1"></asp:Label>
                        <asp:TextBox runat="server" ID="txtReason" MaxLength="20" Height="28px" Width="250px"></asp:TextBox>
                        <asp:CustomValidator runat="server" ID="cvReason" ErrorMessage="請填寫事由" Display="Dynamic" meta:resourcekey="rfvReasonResource1"></asp:CustomValidator>                                
                    </td>
                </tr>
                <tr>
                    <td>
                        <Fast:Grid ID="DayRecordGrid" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                            DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EmptyDataText="沒有資料" EnhancePager="True" KeepSelectedRows="False" OnPageIndexChanging="DayRecordGrid_PageIndexChanging"
                            OnRowDataBound="DayRecordGrid_RowDataBound"
                            Width="100%" meta:resourcekey="DayRecordGridResource1" PageSize="15" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="" OnSorting="DayRecordGrid_Sorting" DefaultSortColumnName="NAME">
                            <EnhancePagerSettings ShowHeaderPager="False" />
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:TemplateField HeaderText="姓名" SortExpression="NAME" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="20%" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="簽到" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <table style="width: 80px" align="center">
                                            <tr>
                                                <td style="width: 5px;"></td>
                                                <td style="text-align: right; width: 50px; white-space: nowrap;">
                                                    <asp:Label ID="lblWork" runat="server" meta:resourcekey="lblWorkResource1" Text='<%# Bind("WORK_CLOCK_TIME", "{0:HH:mm}") %>'></asp:Label>
                                                </td>
                                                <td style="width: 5px;"></td>
                                                <td style="text-align: left; width: 15px; white-space: nowrap;">
                                                    <asp:ImageButton ID="imgWorkLocation" runat="server" ImageUrl="~/Common/Images/Icon/icon_m207.png" Visible="false" />
                                                </td>
                                                <td style="width: 5px;"></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="簽退" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <table style="width: 80px" align="center">
                                            <tr>
                                                <td style="width: 5px;"></td>
                                                <td style="text-align: right; width: 50px; white-space: nowrap;">
                                                    <asp:Label ID="lblOff" runat="server" meta:resourcekey="lblOffResource1" Text='<%# Bind("OFF_CLOCK_TIME", "{0:HH:mm}") %>'></asp:Label>
                                                </td>
                                                <td style="width: 5px;"></td>
                                                <td style="text-align: left; width: 15px; white-space: nowrap;">
                                                    <asp:ImageButton ID="imgOffLocation" runat="server" ImageUrl="~/Common/Images/Icon/icon_m207.png" Visible="false" />
                                                </td>
                                                <td style="width: 5px;"></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <HeaderStyle Width="15%" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="請假" meta:resourcekey="BoundFieldResource4">
                                    <ItemTemplate>
                                        <asp:Label ID="lblLeaveString" runat="server"
                                            meta:resourcekey="lblLeaveStringResource1"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="出差" meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTravelString" runat="server" meta:resourcekey="lblTravelStringResource1"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                    <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                </asp:TemplateField>

                            </Columns>
                        </Fast:Grid>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Label runat="server" ID="lblRepeatPunch" Visible="False" Text="已於{0}再次簽到" meta:resourcekey="lblRepeatPunchResource1"></asp:Label>
        <asp:Label runat="server" ID="lblRepeatPunchOff" Visible="False" Text="已於{0}再次簽退" meta:resourcekey="lblRepeatPunchOffResource1"></asp:Label>
        <asp:Label runat="server" ID="lblConfirmWork" Visible="False" Text="確定簽到？" meta:resourcekey="lblConfirmWorkResource1"></asp:Label>
        <asp:Label runat="server" ID="lblConfirmOff" Visible="False" Text="確定簽退？" meta:resourcekey="lblConfirmOffResource1"></asp:Label>
        <asp:Label ID="lblMapTitle" runat="server" Text="刷卡位置" Visible="false" meta:resourcekey="lblMapTitleResource1"></asp:Label>
        <asp:HiddenField ID="hfCurrentUser" runat="server" />
        <asp:Label ID="lblGetDataError" runat="server" Text="未能取得出勤資料，請重新查詢" Visible="false" ForeColor="Blue" meta:resourcekey="lblGetDataErrorResource1"></asp:Label>
        <asp:Label ID="lblConfirmWork2" runat="server" Visible="False" Text="重新簽到後將清除原簽退記錄，確認簽到？" meta:resourcekey="lblConfirmWork2Resource1"></asp:Label>
        <asp:HiddenField ID="hfHasPunchOff" runat="server" Value="false" />
        <asp:HiddenField ID="hfHasPunchOn" runat="server" Value="false" />
        <asp:HiddenField ID="hfDutyRepeatPunchWork" runat="server" Value="false" />
        <asp:HiddenField ID="hfPunchRequired" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>
