<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_DeviceInfo.ascx.cs" Inherits="Ede.Uof.Web.Basic.Personal.Information.Common.UC_DeviceInfo" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<script type="text/javascript">

    function ComfirmDelete() {
        return confirm("<%=msgLogoutSet.Text%>");
    }

    function ComfirmStopPush() {
        return confirm('<%=msgStopPushSet.Text%>');
    }

    function TestPushState(returnValue) {           
        if (returnValue === 'true') {
                alert('<%=msgSuccessStop.Text %>');               
        }
        else {
                alert('<%=msgfailStop.Text %>');              
        }
    }

    function rtbFilterKeywordClicking(sender, args) {

        var key = args.get_item().get_value();

        switch (key) {
            case "Maintain":
                args.set_cancel(true);

                $uof.dialog.open2("~/Basic/Personal/Information/PushFilterKeywordSettingDialog.aspx", args.get_item(), '<%=lblPushFilterKeywordDialogTitle.Text%>', 800, 550, openDialogResult, { 'seq': '1', 'fromPage': 'PersonalInformation' });
                break;
            }
    }

    function openDialogResult(returnValue) {
        if (returnValue === '' || returnValue === null)
            return false;
        else
            return true;
    }

</script>

<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">                               
    <ContentTemplate>
        <table class="PopTable" cellspacing="1" width="100%">
            <tr id="trPushFilterKeywordTitle" runat="server">
                <td class="PopTableHeader">
                    <asp:Label ID="lblPushFilterKeywordSettingTitle" runat="server" Text="推播過濾設定" meta:resourcekey="lblPushFilterKeywordSettingTitleResource1"></asp:Label>
                </td>
            </tr>
            <tr id="trRtbFilterKeyword" runat="server">
                <td>  
                    <telerik:RadToolBar ID="rtbFilterKeyword" runat="server" OnButtonClick="rtbFilterKeyword_ButtonClick" OnClientButtonClicking="rtbFilterKeywordClicking" Width="100%" >
                        <Items>
                            <telerik:RadToolBarButton runat="server" Value="Maintain" Text="維護" meta:resourcekey="TBarButtonResource1"
                                ClickedImageUrl="~/Common/Images/Icon/icon_m71.png" DisabledImageUrl="~/Common/Images/Icon/icon_m71.png"
                                HoveredImageUrl="~/Common/Images/Icon/icon_m71.png" ImageUrl="~/Common/Images/Icon/icon_m71.png" >
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" Value="Keyword" meta:resourcekey="RadToolBarButtonResource3">
                                <ItemTemplate>
                                    &nbsp;
                                    <asp:LinkButton ID="lbtnShowAdminKeyword" runat="server" Text="查看管理員設定的關鍵字" meta:resourcekey="lbtnShowAdminKeywordResource1"></asp:LinkButton>
                                </ItemTemplate>
                            </telerik:RadToolBarButton>
                        </Items>
                        
                    </telerik:RadToolBar>

                    <div style="text-align:left;padding-bottom:5px;">
                        <Fast:Grid ID="grdFilterKeyword" runat="server" 
                            AllowSorting="false"
                            AutoGenerateCheckBoxColumn="false" 
                            AutoGenerateColumns="false" 
                            CustomDropDownListPage="false"
                            DataKeyOnClientWithCheckBox="false" 
                            EmptyDataText="沒有資料" 
                            meta:resourcekey="grdFilterKeywordResource1"
                            EnhancePager="true" 
                            KeepSelectedRows="false" 
                            OnRowDataBound="grdFilterKeyword_RowDataBound" 
                            Width="30%" >
                            <EnhancePagerSettings ShowHeaderPager="true"></EnhancePagerSettings>
                            <ExportExcelSettings AllowExportToExcel="false"></ExportExcelSettings>
                            <Columns>
                                <asp:TemplateField HeaderText="關鍵字" meta:resourcekey="tfKeywordResource1">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnKeyword" runat="server" ></asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle wrap="true" HorizontalAlign="Center"/>
                                    <ItemStyle Wrap="false" />
                                </asp:TemplateField>
                            </Columns>
                        </Fast:Grid>
                        <asp:Label ID="lblFilterKeywordTip" runat="server" Text="*設定後，私人訊息主旨符合關鍵字時將不會發送推播，最多可設定10組。" ForeColor="Blue" meta:resourcekey="lblFilterKeywordTipResource1" />
                        <br />
                        <br />
                    </div>
                </td>
            </tr>
            <tr>
                <td class="PopTableHeader">
                    <asp:Label ID="Label8" runat="server" Text="登入中的行動裝置" meta:resourcekey="Label8Resource1"></asp:Label>
                </td>
            </tr>                                        
            <tr>                                                                               
                <td>
                    <div style="text-align:left;padding-bottom:5px;">
                        <asp:Label ID="lblAppDeviceCount" runat="server" CssClass="SizeMemo" meta:resourcekey="lblAppDeviceCountResource1" ></asp:Label>
                    </div>

                    <Fast:Grid ID="gdDeviceManagement" runat="server"  AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="False"  Width="50%"  OnSorting="gdDeviceManagement_Sorting" DefaultSortColumnName="ISSUE_TIME" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Descending" DataKeyNames="ACCESS_TOKEN" AllowSorting="True"
                        EmptyDataText="沒有登入中的行動裝置" EnhancePager="True" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="" 
                        OnRowDataBound="gdDeviceManagement_RowDataBound" meta:resourcekey="gdDeviceManagementResource1" PageSize="15" >
                    <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl=""></EnhancePagerSettings>
                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                        <Columns>
                            <asp:TemplateField HeaderText="裝置" meta:resourcekey="TemplateFieldResource1">
                                <ItemTemplate>
                                    <asp:Label ID="lblmodel" runat="server" meta:resourcekey="lblmodelResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                <ItemStyle HorizontalAlign="Left" Wrap="False"/>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="廠商" meta:resourcekey="TemplateFieldResource2">
                                <ItemTemplate>
                                    <asp:Label ID="lblmanufacturer" runat="server" meta:resourcekey="lblmanufacturerResource1" ></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="系統" meta:resourcekey="TemplateFieldResource3" >
                                <ItemTemplate>
                                    <asp:Label ID="lblDevice" runat="server" meta:resourcekey="lblDeviceResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="通過驗證" meta:resourcekey="TemplateFieldResource4">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDeviceVerify" runat="server" meta:resourcekey="lblDeviceVerifyResource1"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ISSUE_TIME" HeaderText="最後登入時間" SortExpression="ISSUE_TIME" meta:resourcekey="BoundFieldResource1">
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                <ItemStyle HorizontalAlign="Left" Wrap="False"/>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="管理" meta:resourcekey="TemplateFieldResource5" >
                                <ItemTemplate>
                                    <asp:Label ID="lblmark" runat="server" Text="[" meta:resourcekey="lblmarkResource1"/>
                                    <asp:LinkButton ID="lbtnStopPush" runat="server" ForeColor="Red" OnClick="lbtnStopPush_Click" OnClientClick="return ComfirmStopPush();" Text="停用推播" meta:resourcekey="lbtnStopPushResource1"></asp:LinkButton>
                                    <asp:LinkButton ID="lbtnStartPush" runat="server" OnClick="lbtnStartPush_Click" Text="啟用推播" meta:resourcekey="lbtnStartPushResource1"></asp:LinkButton>
                                    <asp:Label ID="lblmark1" runat="server" Text="]" meta:resourcekey="lblmark1Resource1"/>
                                    <asp:Label ID="lblmark4" runat="server" Text="[" meta:resourcekey="lblmark4Resource1"/>
                                    <asp:LinkButton ID="lbtnTestPush" runat="server" OnClick="lbtnTestPush_Click" OnClientClick="OpenDialogResult();" Text="測試推播" meta:resourcekey="lbtnTestPushResource1"></asp:LinkButton>
                                    <asp:Label ID="lblmark5" runat="server" Text="]" meta:resourcekey="lblmark5Resource1" />
                                    <asp:Label ID="lblmark6" runat="server" Text="[" meta:resourcekey="lblmark6Resource1" />
                                    <asp:LinkButton ID="lbtnRemoveDevice" runat="server" OnClick="lbtnRemoveDevice_Click" OnClientClick="return ComfirmDelete();" Text="解除綁定" meta:resourcekey="lbtnRemoveDeviceResource1" />
                                    <asp:Label ID="lblmark7" runat="server" Text="]" meta:resourcekey="lblmark7Resource1" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Left"  Wrap="False"/>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataRowStyle HorizontalAlign="Left" />
                    </Fast:Grid>
                </td>                                                                                                                             
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Label ID="msgLogoutSet" runat="server" Text="確定要解除嗎?" Visible="False" meta:resourcekey="msgLogoutSetResource1"></asp:Label>
<asp:Label ID="msgfailStop" runat="server" Text="推播測試失敗" Visible="False" meta:resourcekey="msgfailStopResource1"></asp:Label>
<asp:Label ID="msgSuccessStop" runat="server" Text="推播測試成功" Visible="False" meta:resourcekey="msgSuccessStopResource1"></asp:Label>
<asp:Label ID="msgStopPushSet" runat="server" Text="確定要停用推播功能?" Visible="False" meta:resourcekey="msgStopPushSetResource1"></asp:Label>

<asp:Label ID="lblDeviceNull" runat="server" Text="無法辨識的裝置" Visible="False" meta:resourcekey="lblDeviceNullResource1" ></asp:Label>
<asp:Label ID="msgVerifyAdded" runat="server" Text="未通過" Visible="False" meta:resourcekey="msgVerifyAddedResource1"  ></asp:Label>
<asp:Label ID="msgVerifyVerified" runat="server" Text="通過" Visible="False" meta:resourcekey="msgVerifyVerifiedResource1"  ></asp:Label>
<asp:Label ID="lblAppDeviceCountMsg" runat="server" Text="行動裝置限制綁定數量：" Visible="False" meta:resourcekey="lblAppDeviceCountMsgResource1" ></asp:Label>
            
<asp:Label ID="lblPushFilterKeywordDialogTitle" runat="server" Text="維護關鍵字" Visible="False" meta:resourcekey="lblPushFilterKeywordDialogTitleResource1"></asp:Label>
<asp:Label ID="lblShowAdminKeywordDialogTitle" runat="server" Text="管理員設定的關鍵字" Visible="False" meta:resourcekey="lblShowAdminKeywordDialogTitleResource1"></asp:Label>

<asp:HiddenField ID="hfUserId" runat="server" />
<asp:HiddenField ID="hfExecuteType" runat="server" />
