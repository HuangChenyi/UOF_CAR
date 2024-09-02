<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKFOptionalFields_CharityDetailUC" Codebehind="CharityDetailUC.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Reference Control="~/WKF/FormManagement/VersionFieldUserControl/VersionFieldUC.ascx" %>
<script type="text/javascript">
    function CheckCount(e, args) {
        var grid = window['<%=Grid1.ClientID %>'];
        var totalrowcount = grid.rows.length;
        if (totalrowcount <= 1) {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }
    function ConfirmDelete() {
        if (confirm('<%=lblDeleteMsg.Text %>')) {
            $('#<%= hfIsDelete.ClientID %>').val("True");
        } else {
            $('#<%= hfIsDelete.ClientID %>').val("False");
        }
    }
    function CheckSend(e, args)
    {
        var data = [$('#<%= hfCharityGuid.ClientID %>').val(), $('#<%= hfApplicantGuid.ClientID %>').val(), $('#<%= hfRealTaskID.ClientID %>').val()];
        var result = $uof.pageMethod.syncUc("EIP/Duty/WKFOptionalFields/CharityDetailUC.ascx", "CheckSend", data);
        if (result == "true")
        {
            args.IsValid = false;
        }
    }
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <contenttemplate>
    <table>
        <tr>
            <td colspan="3" >
                <telerik:RadButton ID="rdbtnInsert" runat="server" Text="新增明細" CausesValidation="False" OnClick="rdbtnInsert_Click" meta:resourcekey="rdbtnInsertResource1"></telerik:RadButton>                
            </td>
        </tr>
        <tr>
            <td>
                <Fast:Grid ID="Grid1"  runat="server" 
                    AutoGenerateCheckBoxColumn="False" AllowSorting="True" 
                    AutoGenerateColumns="False"  
                    DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" 
                    EmptyDataText="沒有資料" EnhancePager="True" 
                    KeepSelectedRows="False" PageSize="15"  
                     onrowdatabound="Grid1_RowDataBound" 
                    meta:resourcekey="Grid1Resource1"   >
                <enhancepagersettings showheaderpager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" /><exportexcelsettings 
                    allowexporttoexcel="False" />
                    <Columns>
                        <asp:BoundField meta:resourcekey="BoundFieldResource1"></asp:BoundField>
                        <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="lbtnModify" runat="server" Text="修改" 
                                                meta:resourcekey="lbtnModifyResource1" onclick="lbtnModify_Click"></asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lbtnDelete" runat="server" Text="刪除" 
                                                onclick="lbtnDelete_Click" OnClientClick="ConfirmDelete();" 
                                                meta:resourcekey="lbtnDeleteResource1" CausesValidation="False"></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="時間(起)" meta:resourcekey="BoundFieldResource2">
                            <ItemTemplate>
                                <asp:Label ID="lblStartDate" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="時間(訖)" meta:resourcekey="BoundFieldResource3">
                            <ItemTemplate>
                                <asp:Label ID="lblEndDate" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ACTIVITY_HOURS" HeaderText="活動時數" 
                            meta:resourcekey="BoundFieldResource8" />
                        <asp:BoundField DataField="HOURS" HeaderText="公益時數" 
                            meta:resourcekey="BoundFieldResource4"></asp:BoundField>
                        <asp:BoundField DataField="LOCATION" HeaderText="地點" 
                            meta:resourcekey="BoundFieldResource5"></asp:BoundField>
                        <asp:BoundField DataField="NAME" HeaderText="名稱" 
                            meta:resourcekey="BoundFieldResource6"></asp:BoundField>
                        <asp:BoundField DataField="CONTENT" HeaderText="內容" 
                            meta:resourcekey="BoundFieldResource7"></asp:BoundField>
                    </Columns
                ></Fast:Grid>
            </td>
            <td>
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="活動內容為必填欄位" ClientValidationFunction="CheckCount" meta:resourcekey="CustomValidator1Resource1" ></asp:CustomValidator>
            </td>
            <td>
                <asp:CustomValidator ID="cvCheckSend" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="該活動內容已申請過" ClientValidationFunction="CheckSend" meta:resourcekey="cvCheckSendResource1"></asp:CustomValidator>
            </td>
        </tr>
    </table>
</contenttemplate>
</asp:UpdatePanel>

<asp:HiddenField ID="hfFormID" runat="server" />
<asp:HiddenField ID="hfCharityGuid" runat="server" />
<asp:HiddenField ID="hfMode" runat="server" />
<asp:HiddenField ID="hfIsDelete" runat="server" />
<asp:HiddenField ID="hfTotalHours" runat="server"></asp:HiddenField>
<asp:HiddenField ID="hfApplicantGuid" runat="server" />
<asp:HiddenField ID="hfRealTaskID" runat="server" />
<asp:Label ID="lblDeleteMsg" runat="server" Text="確定刪除?" Visible="False" meta:resourcekey="lblDeleteMsgResource1"></asp:Label>
<asp:Label ID="lblHourTitle" runat="server" Text="時" Visible="False" meta:resourcekey="lblHourTitleResource1"></asp:Label>
<asp:Label ID="lblStartTitle" runat="server" Text="時間(起)" Visible="False" meta:resourcekey="lblStartTitleResource1"></asp:Label>
<asp:Label ID="lblEndTitle" runat="server" Text="時間(訖)" Visible="False" meta:resourcekey="lblEndTitleResource1"></asp:Label>
<asp:Label ID="lblActiveHoursTitle" runat="server" Text="活動時數" Visible="False" meta:resourcekey="lblActiveHoursTitleResource1"></asp:Label>
<asp:Label ID="lblRealHoursTitle" runat="server" Text="公益時數" Visible="False" meta:resourcekey="lblRealHoursTitleResource1"></asp:Label>
<asp:Label ID="lblLocationTitle" runat="server" Text="地點" Visible="False" meta:resourcekey="lblLocationTitleResource1"></asp:Label>
<asp:Label ID="lblNameTitle" runat="server" Text="名稱" Visible="False" meta:resourcekey="lblNameTitleResource1"></asp:Label>
<asp:Label ID="lblContentTitle" runat="server" Text="內容" Visible="False" meta:resourcekey="lblContentTitleResource1"></asp:Label>

<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>