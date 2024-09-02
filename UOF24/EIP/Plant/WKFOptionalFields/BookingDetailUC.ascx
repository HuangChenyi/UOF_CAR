<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BookingDetailUC.ascx.cs" Inherits="WKF_OptionalFields_BookingDetailUC" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>
<%@ Register Src="~/EIP/Plant/UC_EquipList.ascx" TagPrefix="uc1" TagName="UC_EquipList" %>



<script type="text/javascript">    
    function cvfddlPlant(source, arguments) {
        var plantGuid = $('#<%=hfPlantGuid.ClientID%>');

        if (plantGuid.val() == '') {
            arguments.IsValid = false;
            return;
        }
    }

    function cvfStartDate(source, arguments) {
        var radStartDate = $find('<%=RadDateTimePickerStart.ClientID%>');
        var radEndDate = $find('<%=RadDateTimePickerEnd.ClientID%>');
        if (radStartDate != null && radEndDate != null) {
            if (radStartDate.get_dateInput().get_value() >= radEndDate.get_dateInput().get_value()) {
                arguments.IsValid = false;
            }
        }
    }

    function cvfEndDate(source, arguments) {
        var plantGuid = $('#<%=hfPlantGuid.ClientID%>');
        var radStartDate = $find('<%=RadDateTimePickerStart.ClientID%>');
        var radEndDate = $find('<%=RadDateTimePickerEnd.ClientID%>');
       
        if (plantGuid.val() != '' && radEndDate != null) {
            var lblSampleShowLimitMsg = $('#<%=lblSampleShowLimitMsg.ClientID%>');
            var lblLimitMsg = $('#<%=lblLimitMsg.ClientID%>');
            var lblRangeLimitMsg = $('#<%=lblRangeLimitMsg.ClientID%>');

            var data = [plantGuid.val(), radStartDate.get_dateInput().get_value(), radEndDate.get_dateInput().get_value(), lblSampleShowLimitMsg.text(), lblLimitMsg.text(), lblRangeLimitMsg.text()];
            var resultMsg = $uof.pageMethod.syncUc("EIP/Plant/WKFOptionalFields/BookingDetailUC.ascx", "CheckLimitDay", data);
            if (resultMsg != '') {
                arguments.IsValid = false;
                source.innerText = resultMsg;
            }
            else {
                arguments.IsValid = true;
            }
        }
    }

    function cvfIsAllowBorrow(source, arguments) {
        var borrowGuid = $('#<%=hfBorrowGuid.ClientID%>');
        var plantGuid = $('#<%=hfPlantGuid.ClientID%>');
        var radStartDate = $find('<%=RadDateTimePickerStart.ClientID%>');
        var radEndDate = $find('<%=RadDateTimePickerEnd.ClientID%>');
        var errDetail = $('#<%=lblErrDetail.ClientID%>');


        if (plantGuid.val() != '' && radEndDate != null) {
            var data = [borrowGuid.val(), plantGuid.val(), radStartDate.get_dateInput().get_value(), radEndDate.get_dateInput().get_value(), errDetail.text()];
            var resultMsg = $uof.pageMethod.syncUc("EIP/Plant/WKFOptionalFields/BookingDetailUC.ascx", "CheckIsAllowBorrow", data);
            if (resultMsg != '') {
                arguments.IsValid = false;
                source.innerText = resultMsg;
            }
            else {
                arguments.IsValid = true;
            }
        }
    }

    function cvPlantLoaned(source, arguments) {
        var isAudit = $('#<%=hfIsAudit.ClientID%>');
        if (isAudit.val()) {
            var plantGuid = $('#<%=hfPlantGuid.ClientID%>');
            if (plantGuid.val() != '') {
                var data = [plantGuid.val()];
                var resultMsg = $uof.pageMethod.syncUc("EIP/Plant/WKFOptionalFields/BookingDetailUC.ascx", "CheckPlantLoaned", data);
                if (resultMsg != '') {
                    arguments.IsValid = false;
                }
                else {
                    arguments.IsValid = true;
                }
            }
        }
    }
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table class="PopTable" style="width: 500px">
            <tr>
                <td style="width: 120px; white-space: nowrap">
                    <asp:Label ID="lblClassStar" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblClassStarResource1"></asp:Label>
                    <asp:Label ID="lblClass" runat="server" Text="類別" meta:resourcekey="lblClassResource1"></asp:Label>
                </td>
                <td>
                    <telerik:RadDropDownList ID="rddlClass" runat="server" OnSelectedIndexChanged="rddlClass_SelectedIndexChanged" AutoPostBack="True" CausesValidation="False" meta:resourcekey="rddlClassResource1" SelectedText="請選擇">
                        <Items>
                            <telerik:DropDownListItem Text="請選擇" runat="server" meta:resourcekey="DropDownListItemResource1" Selected="True" />
                        </Items>
                    </telerik:RadDropDownList>
                    <asp:Label ID="lblSelectClassName" runat="server" Visible="False" meta:resourcekey="lblSelectClassNameResource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 120px; white-space: nowrap">
                    <asp:Label ID="lblPlantStar" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblPlantStarResource1"></asp:Label>
                    <asp:Label ID="lblPlant" runat="server" Text="設備" meta:resourcekey="lblPlantResource1"></asp:Label>
                </td>
                <td>
                    <telerik:RadDropDownList ID="rddlPlant" runat="server" OnSelectedIndexChanged="rddlPlant_SelectedIndexChanged" AutoPostBack="True" CausesValidation="False" meta:resourcekey="rddlPlantResource1" SelectedText="請選擇">
                        <Items>
                            <telerik:DropDownListItem Text="請選擇" runat="server" meta:resourcekey="DropDownListItemResource2" Selected="True" />
                        </Items>
                    </telerik:RadDropDownList>
                    <asp:Label ID="lblSelectPlantName" runat="server" Visible="False" meta:resourcekey="lblSelectPlantNameResource1"></asp:Label>
                    <asp:LinkButton runat="server" ID="lbtnPlantInfo" Text="借用記錄" Visible="false" CausesValidation="false" meta:resourcekey="lbtnPlantInfoResource1"></asp:LinkButton>
                    <asp:HiddenField ID="hfPlantGuid" runat="server" />
                    <asp:HiddenField ID="hfBorrowGuid" runat="server" />
                    <asp:HiddenField ID="hfUseDay" runat="server" />
                    <asp:TextBox runat="server" ID="txtPlantGuid" Style="display: none;"></asp:TextBox>
                    <br />
                    <asp:CustomValidator ID="cvddlPlant" runat="server" ForeColor="Red" ErrorMessage="不可空白" Display="Dynamic" ClientValidationFunction="cvfddlPlant" meta:resourcekey="cvddlPlantResource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="cvPlantChanged" runat="server" ForeColor="Red" ErrorMessage="設備已被異動, 請洽設備管理員" Display="Dynamic" meta:resourcekey="cvPlantChangedResource1"></asp:CustomValidator>
                    <asp:CustomValidator ID="cvPlantLoaned" runat="server" ForeColor="Red" ErrorMessage="此設備已被借出, 需待設備歸還後才可進行簽核" ClientValidationFunction="cvPlantLoaned" Display="Dynamic" meta:resourcekey="cvPlantLoanedResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 120px; white-space: nowrap">
                    <asp:Label ID="lblTitleDateStart" runat="server" Text="開始時間" meta:resourcekey="lblTitleDateStartResource1"></asp:Label>
                </td>
                <td>
                    <telerik:RadDateTimePicker ID="RadDateTimePickerStart" runat="server" Visible="False" meta:resourcekey="RadDateTimePickerStartResource1">
                    </telerik:RadDateTimePicker>
                    <asp:Label ID="lblDisplayStartDate" runat="server" Visible="False" meta:resourcekey="lblDisplayStartDateResource1"></asp:Label>
                    <br />
                    <asp:CustomValidator ID="cvStartDate" runat="server" ForeColor="Red" ErrorMessage="不能晚於或等於結束時間" Display="Dynamic" ClientValidationFunction="cvfStartDate" meta:resourcekey="cvStartDateResource1"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 120px; white-space: nowrap">
                    <asp:Label ID="lblTitleDateEnd" runat="server" Text="結束時間" meta:resourcekey="lblTitleDateEndResource1"></asp:Label>
                </td>
                <td>
                    <telerik:RadDateTimePicker ID="RadDateTimePickerEnd" runat="server" Visible="False" meta:resourcekey="RadDateTimePickerEndResource1">
                    </telerik:RadDateTimePicker>
                    <asp:Label ID="lblDisplayEndDate" runat="server" Visible="False" meta:resourcekey="lblDisplayEndDateResource1"></asp:Label>
                    <br />
                    <asp:CustomValidator ID="cvEndDate" runat="server" ForeColor="Red" ErrorMessage="超過設備可借用時間" Display="Dynamic" ClientValidationFunction="cvfEndDate" meta:resourcekey="cvEndDateResource1"></asp:CustomValidator>
                    <div>
                        <asp:CustomValidator ID="cvIsBorrow" runat="server" ForeColor="Red" ErrorMessage="此時段已被借用" Display="Dynamic" ClientValidationFunction="cvfIsAllowBorrow" meta:resourcekey="cvIsBorrowResource1"></asp:CustomValidator>
                    </div>
                    
                </td>
            </tr>
            <tr>
                <td style="width: 120px; white-space: nowrap">
                    <asp:Label ID="lblTitleContodian" runat="server" Text="保管人" meta:resourcekey="lblTitleContodianResource1"></asp:Label>
                </td>
                <td>
                    <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" IsAllowEdit="false" />
                </td>
            </tr>
            <tr>
                <td style="width: 120px; white-space: nowrap">
                    <asp:Label ID="lblTitleDescription" runat="server" Text="說明" meta:resourcekey="lblTitleDescriptionResource1"></asp:Label>
                </td>
                <td>
                    <asp:Literal ID="ltDescription" runat="server" meta:resourcekey="ltDescriptionResource1"></asp:Literal>
                </td>
            </tr>
            <tr id="trPlace" runat="server">
                <td style="width: 120px; white-space: nowrap">
                    <asp:Label ID="lblTitlePlace" runat="server" Text="地點" meta:resourcekey="lblTitlePlaceResource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblPlace" runat="server" meta:resourcekey="lblPlaceResource1"></asp:Label>
                </td>
            </tr>
            <tr id="trAccomodate" runat="server">
                <td style="width: 120px; white-space: nowrap">
                    <asp:Label ID="lblTitleAccomodate" runat="server" Text="可容納人數" meta:resourcekey="lblTitleAccomodateResource1"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblAccomodate" runat="server" meta:resourcekey="lblAccomodateResource1"></asp:Label>
                </td>
            </tr>
            <tr id="trEquipList" runat="server">
                <td style="width: 120px; white-space: nowrap">
                    <asp:Label ID="lblTitleEquipList" runat="server" Text="配備" meta:resourcekey="lblTitleEquipListResource1"></asp:Label>
                </td>
                <td>
                    <uc1:UC_EquipList runat="server" ID="UC_EquipList" />
                </td>
            </tr>
            <tr>
                <td style="width: 120px; white-space: nowrap">
                    <asp:Label ID="lblTitlePicture" runat="server" Text="圖片" meta:resourcekey="lblTitlePictureResource1"></asp:Label>
                </td>
                <td class="PopTableRightTD">
                    <asp:Image ID="imgBigPicture" runat="server" meta:resourcekey="imgBigPictureResource1" />
                    <uc1:UC_FileCenter runat="server" ID="UC_FileCenter" Visible="False" ModuleName="EIP" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:LinkButton ID="lnk_Edit" runat="server" OnClick="lnk_Edit_Click" Visible="False" CausesValidation="False" meta:resourcekey="lnk_EditResource1">[修改]</asp:LinkButton>
<asp:LinkButton ID="lnk_Cannel" runat="server" OnClick="lnk_Cannel_Click" Visible="False" CausesValidation="False" meta:resourcekey="lnk_CannelResource1">[取消]</asp:LinkButton>
<asp:LinkButton ID="lnk_Submit" runat="server" OnClick="lnk_Submit_Click" Visible="False" CausesValidation="False" meta:resourcekey="lnk_SubmitResource1">[確定]</asp:LinkButton>
<asp:Label ID="lblHasNoAuthority" runat="server" Text="無填寫權限" ForeColor="Red" Visible="False" meta:resourcekey="lblHasNoAuthorityResource1"></asp:Label>
<asp:Label ID="lblToolTipMsg" runat="server" Text="不允許修改(唯讀)" Visible="False" meta:resourcekey="lblToolTipMsgResource1"></asp:Label>
<asp:Label ID="lblFiller" CssClass="FillerVisible" runat="server" meta:resourcekey="lblFillerResource1"></asp:Label>
<asp:Label ID="lblModifier" runat="server" Visible="False" meta:resourcekey="lblModifierResource1"></asp:Label>
<asp:Label ID="lblMsgSigner" runat="server" Text="填寫者" Visible="False" meta:resourcekey="lblMsgSignerResource1"></asp:Label>
<asp:Label ID="lblMsgEditor" runat="server" Text="修改者" Visible="False" meta:resourcekey="lblMsgEditorResource1"></asp:Label>
<asp:Label ID="lblAuthorityMsg" runat="server" Text="具填寫權限人員" Visible="False" meta:resourcekey="lblAuthorityMsgResource1"></asp:Label>
<asp:Label ID="lblFieldValue" runat="server" Visible="False" meta:resourcekey="lblFieldValueResource1"></asp:Label>
<asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
<asp:Label ID="lblMsgTitleClass" runat="server" Text="類別" Visible="False" meta:resourcekey="lblMsgTitleClassResource1"></asp:Label>
<asp:Label ID="lblMsgTitlePlant" runat="server" Text="設備" Visible="False" meta:resourcekey="lblMsgTitlePlantResource1"></asp:Label>
<asp:Label ID="lblMsgTitleStartDate" runat="server" Text="開始時間" Visible="False" meta:resourcekey="lblMsgTitleStartDateResource1"></asp:Label>
<asp:Label ID="lblMsgTitleEndDate" runat="server" Text="結束時間" Visible="False" meta:resourcekey="lblMsgTitleEndDateResource1"></asp:Label>
<asp:Label ID="lblSampleShowLimitMsg" runat="server" Text="設備{0}只開放今天後{1}天內借用(可借用到{2})。<br />" Style="display: none;" meta:resourcekey="lblSampleShowLimitMsgResource1"></asp:Label>
<asp:Label ID="lblErrDetail" runat="server" Text="[借用時間重複] 主旨:{0}, 時間:{1}, 借用者:{2}。<br />" Style="display: none;" meta:resourcekey="lblErrDetailResource1"></asp:Label>
<asp:Label ID="lblLimitMsg" runat="server" Text="{0}只開放借用到{1}，無法新增。<br />" Style="display: none;" meta:resourcekey="lblLimitMsgResource1"></asp:Label>
<asp:Label ID="lblRangeLimitMsg" runat="server" Text="{0}{1}~{2}不開放借用，無法新增。&lt;br&gt;" Style="display: none;" meta:resourcekey="lblRangeLimitMsgResource1"></asp:Label>
<asp:HiddenField ID="hfIsAudit" runat="server" />
