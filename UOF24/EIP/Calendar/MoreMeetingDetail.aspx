<%@ Page Title="會議清單" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="MoreMeetingDetail.aspx.cs" Inherits="Ede.Uof.Web.EIP.Calendar.MoreMeetingDetail" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function ToolBar_Click(sender, args) {

            var key = args.get_item().get_value();
            var date = '<%= Ede.Uof.EIP.Organization.Util.UserTime.SetZone(Ede.Uof.EIP.SystemInfo.Current.UserGUID).GetNowForUi().ToString("yyyy/MM/dd HH:mm:dd") %>';

            if (key == "Delete") {
                if (!confirm('<%=msgCancelconfirm.Text%>'))
                    args.set_cancel(true);
        }
        else if (key == "Export") {
            var guids = $uof.fastGrid.getChecked("<%= grdMoreList.ClientID%>");
            if (guids == "") {
                alert("<%=msgExport.Text %>");
                }
                else {
                    $("#<%=hideMeetingIDs.ClientID %>").val(guids);

                    $uof.dialog.open2("~/EIP/Calendar/Common/ExportProgress.aspx", args.get_item(), "<%=lbUserGuid.Text%>", 400, 200, openDialogResult, { "userID": '<%=lbUserGuid.Text%>', "hideClientID": '<%=hideMeetingIDs.ClientID %>' });
            }
            }
        }
        function openDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined' || returnValue == null)
                return false;
            else {
                return true;
            }
        }
    </script>
    <asp:UpdatePanel ID="udpGrid"  runat="server">
    <ContentTemplate>
                <telerik:RadToolBar ID="rdTooBar" runat="server" Width="100%" OnClientButtonClicking="ToolBar_Click" OnButtonClick="rdTooBar_ButtonClick" meta:resourcekey="rdTooBarResource1" SingleClick="None">
                    <Items>                        
                        <telerik:RadToolBarButton runat="server" Value="Delete" Text="取消會議"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m03.png" HoveredImageUrl="~/Common/Images/Icon/icon_m03.png" 
                            ImageUrl="~/Common/Images/Icon/icon_m03.png" CheckedImageUrl="~/Common/Images/Icon/icon_m03.png" meta:resourcekey="RadToolBarButtonResource1">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" Value="Export" Text="匯出Excel"
                            DisabledImageUrl="~/Common/Images/Icon/icon_m177.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m177.gif" 
                            ImageUrl="~/Common/Images/Icon/icon_m177.gif" CheckedImageUrl="~/Common/Images/Icon/icon_m177.gif" meta:resourcekey="RadToolBarButtonResource3">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                    </Items>
                </telerik:RadToolBar>     
                <Fast:Grid ID="grdMoreList" runat="server" AutoGenerateColumns="False" AutoGenerateCheckBoxColumn="True" AllowPaging="True"  OnRowDataBound="grdMoreList_RowDataBound" Width="100%" DefaultSortColumnName="START_TIME" OnSorting="grdMoreList_Sorting"
                        PageSize="15"  DefaultSortDirection="Descending" DataKeyNames="MEETING_GUID" EmptyDataText="沒有資料" KeepSelectedRows="False" AllowSorting="True" CustomDropDownListPage="False" DataKeyOnClientWithCheckBox="True" EnhancePager="True" SelectedRowColor="" UnSelectedRowColor="" OnPageIndexChanging="grdMoreList_PageIndexChanging" meta:resourcekey="grdMoreListResource1" >
                <EnhancePagerSettings  ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                <ExportExcelSettings AllowExportToExcel="False" />
               <Columns>
                        <asp:TemplateField HeaderText="主旨" SortExpression="SUBJECT" meta:resourcekey="TemplateFieldResource1">                           
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnSubject" runat="server" Text='<%#: Eval("SUBJECT") %>' meta:resourcekey="lbtnSubjectResource1"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="開始日期" SortExpression="START_TIME" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <asp:Label ID="lblStart" runat="server" meta:resourcekey="lblStartResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="120px" Wrap="False"/>
                            <ItemStyle Width="120px" Wrap="False"/>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="結束日期" SortExpression="END_TIME" meta:resourcekey="TemplateFieldResource3">
                            <ItemTemplate>
                                <asp:Label ID="lblEnd" runat="server" meta:resourcekey="lblEndResource1"></asp:Label>
                            </ItemTemplate>
                             <HeaderStyle Width="120px" Wrap="False"/>
                            <ItemStyle Width="120px" Wrap="False"/>
                        </asp:TemplateField>
                        <asp:BoundField DataField="LOCATION" HeaderText="地點" SortExpression="LOCATION" meta:resourcekey="BoundFieldResource15">
                            <HeaderStyle Width="180px" />
                            <ItemStyle Width="180px" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="人數" DataField="USER_COUNT" SortExpression="USER_COUNT" meta:resourcekey="BoundFieldResource16">
                            <HeaderStyle Width="50px" />
                            <ItemStyle Width="50px" />
                        </asp:BoundField>
                    </Columns>
            </Fast:Grid>     
            <asp:HiddenField ID="hideMeetingIDs" runat="server" /> 
            <asp:HiddenField ID="hfMasterGuid" runat="server" />             
        </ContentTemplate>
    </asp:UpdatePanel>
<asp:Label ID="msgCancelconfirm" runat="server" Text="確定要取消?" Visible="False" meta:resourcekey="msgCancelconfirmResource1" ></asp:Label>
<asp:Label ID="lblDeleteMeetingError" runat="server" Text="刪除會議失敗!!" Visible="False" meta:resourcekey="lblDeleteMeetingErrorResource1"></asp:Label>
<asp:Label ID="lblCheckConnection" runat="server" Text="異動線上會議失敗。請檢查Meeting Server的連線資訊是否正確，包含位置、帳號及密碼！(請注意Meeting Server的帳號不能被停用)" Visible="False" meta:resourcekey="lblCheckConnectionResource1" ></asp:Label>
<asp:Label ID="lblMeetingConnectionError" runat="server" Text="呼叫WebService失敗。請檢查Meeting Server的連線資訊是否正確，包含位置、帳號及密碼！(請注意Meeting Server的帳號不能被停用)" Visible="False" meta:resourcekey="lblMeetingConnectionErrorResource1"></asp:Label>
<asp:Label ID="msgExport" runat="server" Text="請選擇要匯出的會議" Visible="False" meta:resourcekey="msgExportResource1" ></asp:Label>
<asp:Label ID="lbUserGuid" runat="server" Visible="False" meta:resourcekey="lbUserGuidResource1"></asp:Label>
<asp:HiddenField ID="hfCurrentUser" runat="server"  />
</asp:Content>
