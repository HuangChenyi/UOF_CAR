<%@ Page Title="人事資料" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_EmployeeHR" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="EmployeeHR.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        function checkAddress() {
            var cbxAddress = $("#<%=cbAddr.ClientID %>");
            var txtPresentZip = $("#<%=txtPresentZip.ClientID %>");
            var txtPresentAddr = $("#<%=txtPresentAddr.ClientID %>");
            var txtPermanentAddr = $("#<%=txtPermanentAddr.ClientID %>");
            var txtPermanentZip = $("#<%=txtPermanentZip.ClientID %>");

            if (cbxAddress.prop("checked")) {
                txtPermanentZip.val(txtPresentZip.val());
                txtPermanentAddr.val(txtPresentAddr.val());

                txtPermanentZip.prop("disabled", true);
                txtPermanentAddr.prop("disabled", true);
            }
            else {

                txtPermanentZip.prop("disabled", false);
                txtPermanentAddr.prop("disabled", false);
            }
        }

        function checkPhone() {
            var cbPhone = $("#<%=cbPhone.ClientID %>");
            var txtPresentPhone = $("#<%=txtPresentPhone.ClientID %>");
            var txtPermanentPhone = $("#<%=txtPermanentPhone.ClientID %>");


            if (cbPhone.prop("checked")) {
                txtPermanentPhone.val(txtPresentPhone.val());

                txtPermanentPhone.prop("disabled", true);
            }
            else {

                txtPermanentPhone.prop("disabled", false);
            }
        }

        function RadToolBarExp_ButtonClicking(sender, args) {
            var Key = args.get_item().get_value();
            if (Key === "Insert") {
                var userGuid = $("#<%= lblUserGuid.ClientID %>").text();
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Employee/HR/MaintainHRExp.aspx", args.get_item(), "", 450, 450, OpenDialogResult, { "userGuid": userGuid });
            }

            if (Key === "Delete") {
                args.set_cancel(!confirm('<%= lblDelete.Text %>'));
            }

        }

        function RadToolBarEdu_ButtonClicking(sender, args) {
            var Key = args.get_item().get_value();
            if (Key === "Insert") {
                var userGuid = $("#<%= lblUserGuid.ClientID %>").text();
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Employee/HR/MaintainHREducation.aspx", args.get_item(), "", 450, 450, OpenDialogResult, { "userGuid": userGuid });
            }

            if (Key === "Delete") {
                args.set_cancel(!confirm('<%= lblDelete.Text %>'));
            }
        }


        function RadToolBarLicense_ButtonClicking(sender, args) {
            var Key = args.get_item().get_value();
            if (Key === "Insert") {
                var userGuid = $("#<%= lblUserGuid.ClientID %>").text();
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Employee/HR/MaintainLicense.aspx", args.get_item(), "", 450, 450, OpenDialogResult, { "USER_GUID": userGuid });
            }

            if (Key === "Delete") {
                args.set_cancel(!confirm('<%= lblDelete.Text %>'));
            }

        }

        function RadToolBarDriving_ButtonClicking(sender, args) {
            var Key = args.get_item().get_value();
            if (Key === "Insert") {
                var userGuid = $("#<%= lblUserGuid.ClientID %>").text();
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Employee/HR/MaintainDrivingLic.aspx", args.get_item(), "", 450, 450, OpenDialogResult, { "USER_GUID": userGuid });
            }

            if (Key === "Delete") {
                args.set_cancel(!confirm('<%= lblDelete.Text %>'));
            }

        }

        function RadToolBarLang_ButtonClicking(sender, args) {
            var Key = args.get_item().get_value();
            if (Key === "Insert") {
                var userGuid = $("#<%= lblUserGuid.ClientID %>").text();
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Employee/HR/MaintainLang.aspx", args.get_item(), "", 450, 450, OpenDialogResult, { "USER_GUID": userGuid });
            }

            if (Key === "Delete") {
                args.set_cancel(!confirm('<%= lblDelete.Text %>'));
            }

        }

        function RadToolBarPref_ButtonClicking(sender, args) {
            var Key = args.get_item().get_value();
            if (Key === "Insert") {
                var userGuid = $("#<%= lblUserGuid.ClientID %>").text();
                args.set_cancel(true);
                $uof.dialog.open2("~/System/Organization/Employee/HR/MaintainPerf.aspx", args.get_item(), "", 450, 450, OpenDialogResult, { "USER_GUID": userGuid });
            }

            if (Key === "Delete") {
                args.set_cancel(!confirm('<%= lblDelete.Text %>'));
            }

        }

        function CheckNo(e, args) {
            //args.IsValid = true;
            var userGuid = $("#<%= lblUserGuid.ClientID %>").text();
            var cardno = $("#<%= txtCardNo.ClientID %>").val();
            var cardnotext = $("#<%= cusCardNoText.ClientID %>").val();
            var data = [cardno, userGuid];
            var sBool = $uof.pageMethod.sync("CheckCardNo", data);

            if (sBool !== "") {
                var lblErrorMessageObj = $("#<%=cusValCardNo.ClientID%>");
                lblErrorMessageObj.text(String.format(cardnotext, sBool));
                args.IsValid = false;
                return;
            }
        }

        function CheckEmpNo(e, args) {
            //args.IsValid = true;
            var userGuid = $("#<%= lblUserGuid.ClientID %>").text();
            var empno = $("#<%= txtEmpNo.ClientID %>").val();
            var empnotext = $("#<%= cusEmpNoText.ClientID %>").val();
            var data = [empno, userGuid];
            var sBool = $uof.pageMethod.sync("CheckEmpNo", data);

            if (sBool !== "") {
                var lblErrorMessageObj = $("#<%=cusValEmpNo.ClientID%>");
                lblErrorMessageObj.text(String.format(empnotext, sBool));
                args.IsValid = false;
                return;
            }
        }

        function CheckAiraFaceID(e, args) {
            var userGuid = $("#<%= lblUserGuid.ClientID %>").text();
            var AiraFaceID = $("#<%= txtAiraFaceID.ClientID %>").val();
            var hfEmpNameAndDeptNameByFaceIdOwner = $("#<%= hfEmpNameAndDeptNameByFaceIdOwner.ClientID %>").val();
            var data = [AiraFaceID, userGuid];
            var result = $uof.pageMethod.sync("CheckAiraFaceId", data);

            if (result !== "") {
                var cvAiraFaceID = $("#<%=cvAiraFaceID.ClientID%>");
                cvAiraFaceID.text(String.format(hfEmpNameAndDeptNameByFaceIdOwner, result));
                args.IsValid = false;
                return;
            }
        }

        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) === "undefined" || returnValue === null) {
                return false;
            }
            else
                return true;
        }

        function OnClientClicking(sender, args) {
            var fid = $("#<%=hideFileGroupID.ClientID %>").val();
            $uof.dialog.open2("~/System/Organization/Employee/EditHRPhoto.aspx", sender,
          "", 500, 500, OpenDialogResult, { 'filegroupid': fid });
            args.set_cancel(true);
        }

        function bigPictureDelete(sender, args) {
            if (confirm("<%=lbConfirmDelete.Text%>")) {
                args.set_cancel(false);
            }
            else {
                args.set_cancel(true);
            }
        }
        function ControlNotPunch() {
            var cbNotSett = $("#<%=cbNotSett.ClientID%>");
            var cbNotPunch = $("#<%=cbNotPunch.ClientID%>");
            if (cbNotSett.is(":checked")) {
                cbNotPunch.prop('disabled', true);
                cbNotPunch.prop('checked', false)
            }
            else
                cbNotPunch.prop('disabled', false);
        }
    </script>
    <table width="100%">
        <tr>
            <td>
                <asp:LinkButton ID="lbtnUser" runat="server" meta:resourcekey="lbtnUserResource1"></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <table class="PopTable" cellspacing="1">
                    <tr>
                        <td style="white-space: nowrap; text-align: center" colspan="4" class="PopTableHeader">
                            <center>
                                <asp:Label ID="Label1" runat="server" Text="個人其他資料" meta:resourcekey="Label1Resource1"></asp:Label>
                            </center>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label50" runat="server" Text="卡片號碼" meta:resourcekey="Label50Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:TextBox ID="txtCardNo" runat="server" meta:resourcekey="txtCardNoResource1"></asp:TextBox>
                            <asp:CustomValidator ID="cusValCardNo" Display="Dynamic" runat="server" ErrorMessage="卡片號碼已與 {0} 重覆"
                                ClientValidationFunction="CheckNo" meta:resourcekey="cusValCardNoResource1"></asp:CustomValidator>
                            <asp:HiddenField ID="cusCardNoText" runat="server" />
                        </td>
                        <td style="white-space: nowrap; vertical-align: middle;" rowspan="3">
                            <asp:Label ID="Label54" runat="server" Text="照片" meta:resourcekey="Label54Resource1"></asp:Label>
                        </td>
                        <td style="white-space: nowrap; width: 25%" rowspan="3">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Image ID="imgBigPicture" runat="server" Width="100px" Height="129px" meta:resourcekey="imgBigPictureResource1" />
                                    <br />
                                    <telerik:RadButton ID="btnEdit" runat="server" Text="編輯" OnClientClicking="OnClientClicking" OnClick="btnEdit_Click" CausesValidation="False" meta:resourcekey="btnEditResource1"></telerik:RadButton>
                                    &nbsp;
                                    <telerik:RadButton ID="btnDelete" runat="server" Text="刪除" OnClientClicking="bigPictureDelete" OnClick="btnDelete_Click" CausesValidation="False" meta:resourcekey="btnDeleteResource2"></telerik:RadButton>
                                    <asp:HiddenField ID="hideFileGroupID" runat="server" />
                                    <asp:HiddenField ID="hfOldBigPictureID" runat="server" />
                                    <asp:HiddenField ID="hfDeleteBigPictureID" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label52" runat="server" Text="員工編號" meta:resourcekey="Label52Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:TextBox ID="txtEmpNo" runat="server" meta:resourcekey="txtEmpNoResource1"></asp:TextBox>
                            <asp:CustomValidator ID="cusValEmpNo" Display="Dynamic" runat="server" ErrorMessage="員工編號已與 {0} 重覆"
                                ClientValidationFunction="CheckEmpNo" meta:resourcekey="cusValEmpNoResource1"></asp:CustomValidator>
                            <asp:HiddenField ID="cusEmpNoText" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="lblAiraFaceID" runat="server" Text="airaFace編號" meta:resourcekey="lblAiraFaceIDResource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:TextBox ID="txtAiraFaceID" runat="server" MaxLength="50" meta:resourcekey="txtAiraFaceIDResource1"></asp:TextBox>
                            <asp:CustomValidator ID="cvAiraFaceID" Display="Dynamic" runat="server" ErrorMessage="airaFace編號已與 {0} 重覆"
                                ClientValidationFunction="CheckAiraFaceID" meta:resourcekey="cvAiraFaceIDResource1"></asp:CustomValidator>
                            <asp:HiddenField ID="hfEmpNameAndDeptNameByFaceIdOwner" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label2" runat="server" Text="婚姻狀況" meta:resourcekey="Label2Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:RadioButtonList ID="rbListMarried" runat="server" RepeatDirection="Horizontal"
                                meta:resourcekey="rbListMarriedResou承認年資rce1">
                                <asp:ListItem Value="0" meta:resourcekey="ListItemResource1">單身</asp:ListItem>
                                <asp:ListItem Value="1" meta:resourcekey="ListItemResource2">己婚</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="信仰" meta:resourcekey="Label3Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlFaith" runat="server" meta:resourcekey="ddlFaithResource1">
                                <asp:ListItem Value="" meta:resourcekey="ListItemResource43">請選擇宗教</asp:ListItem>
                                <asp:ListItem Value="Christianity" meta:resourcekey="ListItemResource4">基督教</asp:ListItem>
                                <asp:ListItem Value="Catholicism" meta:resourcekey="ListItemResource5">天主教</asp:ListItem>
                                <asp:ListItem Value="Buddhism" meta:resourcekey="ListItemResource6">佛教</asp:ListItem>
                                <asp:ListItem Value="Taoism" meta:resourcekey="ListItemResource7">道教</asp:ListItem>
                                <asp:ListItem Value="YitKuanTao" meta:resourcekey="ListItemResource8">一貫道</asp:ListItem>
                                <asp:ListItem Value="Islam" meta:resourcekey="ListItemResource9">回教</asp:ListItem>
                                <asp:ListItem Value="Mormonism" meta:resourcekey="ListItemResource10">摩門教</asp:ListItem>
                                <asp:ListItem Value="Other" meta:resourcekey="ListItemResource11">其他教派</asp:ListItem>
                                <asp:ListItem Value="None" meta:resourcekey="ListItemResource12">無</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label4" runat="server" Text="星座" meta:resourcekey="Label4Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:DropDownList ID="ddlConstellation" runat="server" meta:resourcekey="ddlConstellationResource1">
                                <asp:ListItem Value="" meta:resourcekey="ListItemResource44">請選擇星座</asp:ListItem>
                                <asp:ListItem Value="Aries" meta:resourcekey="ListItemResource14">牡羊座</asp:ListItem>
                                <asp:ListItem Value="Taurus" meta:resourcekey="ListItemResource15">金牛座</asp:ListItem>
                                <asp:ListItem Value="Gemini" meta:resourcekey="ListItemResource16">雙子座</asp:ListItem>
                                <asp:ListItem Value="Cancer" meta:resourcekey="ListItemResource17">巨蟹座</asp:ListItem>
                                <asp:ListItem Value="Leo" meta:resourcekey="ListItemResource18">獅子座</asp:ListItem>
                                <asp:ListItem Value="Virgo" meta:resourcekey="ListItemResource19">處女座</asp:ListItem>
                                <asp:ListItem Value="Libra" meta:resourcekey="ListItemResource20">天秤座</asp:ListItem>
                                <asp:ListItem Value="Scorpio" meta:resourcekey="ListItemResource21">天蠍座</asp:ListItem>
                                <asp:ListItem Value="Sagittarius" meta:resourcekey="ListItemResource22">射手座</asp:ListItem>
                                <asp:ListItem Value="Capricorn" meta:resourcekey="ListItemResource23">魔羯座</asp:ListItem>
                                <asp:ListItem Value="Aquarius" meta:resourcekey="ListItemResource24">水瓶座</asp:ListItem>
                                <asp:ListItem Value="Pisces" meta:resourcekey="ListItemResource25">雙魚座</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Label ID="Label53" runat="server" Text="BU" meta:resourcekey="Label53Resource1"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtBU" runat="server" meta:resourcekey="txtBUResource1"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label5" runat="server" Text="血型" meta:resourcekey="Label5Resource1"></asp:Label>
                        </td>
                        <td id="ddlBloodTd" class="PopTableRightTD" runat="server">
                            <asp:DropDownList ID="ddlBlood" runat="server" meta:resourcekey="ddlBloodResource1">
                                <asp:ListItem Value="" meta:resourcekey="ListItemResource45">請選擇血型</asp:ListItem>
                                <asp:ListItem Value="A" meta:resourcekey="ListItemResource27">A</asp:ListItem>
                                <asp:ListItem Value="B" meta:resourcekey="ListItemResource28">B</asp:ListItem>
                                <asp:ListItem Value="O" meta:resourcekey="ListItemResource29">O</asp:ListItem>
                                <asp:ListItem Value="AB" meta:resourcekey="ListItemResource30">AB</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td id="lblCostCenterTd" runat="server">
                            <asp:Label ID="Label51" runat="server" Text="成本中心" meta:resourcekey="Label51Resource1"></asp:Label>
                        </td>
                        <td id="ddlCostCenterTd" runat="server">
                            <asp:DropDownList ID="ddlCostCenter" runat="server" meta:resourcekey="ddlCostCenterResource1"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="lblOption1" runat="server" Text="其他1" meta:resourcekey="lblOption1Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:TextBox ID="txtOption1" runat="server" MaxLength="255" meta:resourcekey="txtOption1Resource1"></asp:TextBox>
                        </td>
                        <td style="white-space: nowrap">
                            <asp:Label ID="lblOption2" runat="server" Text="其他2" meta:resourcekey="lblOption2Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:TextBox ID="txtOption2" runat="server" MaxLength="255" meta:resourcekey="txtOption2Resource1"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="lblOption3" runat="server" Text="其他3" meta:resourcekey="lblOption3Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:TextBox ID="txtOption3" runat="server" MaxLength="255" meta:resourcekey="txtOption3Resource1"></asp:TextBox>
                        </td>
                        <td style="white-space: nowrap">
                            <asp:Label ID="lblOption4" runat="server" Text="其他4" meta:resourcekey="lblOption4Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:TextBox ID="txtOption4" runat="server" MaxLength="255" meta:resourcekey="txtOption4Resource1"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="lblOption5" runat="server" Text="其他5" meta:resourcekey="lblOption5Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:TextBox ID="txtOption5" runat="server" MaxLength="255" meta:resourcekey="txtOption5Resource1"></asp:TextBox>
                        </td>
                        <td style="white-space: nowrap">
                            <asp:Label ID="lblOption6" runat="server" Text="其他6" meta:resourcekey="lblOption6Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:TextBox ID="txtOption6" runat="server" MaxLength="255" meta:resourcekey="txtOption6Resource1"></asp:TextBox>
                        </td>
                    </tr>
                    <asp:Panel runat="server" ID="dutyModel">
                    <tr>
                        <td colspan="4" class="PopTableHeader" align="center">
                            <center>
                                <asp:Label ID="Label63" runat="server" Text="差勤" meta:resourcekey="Label63Resource1"></asp:Label>
                            </center>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap" rowspan="3">
                            <asp:Label ID="Label59" runat="server" Text="結算控制" meta:resourcekey="Label59Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" colspan="3">

                            <asp:DropDownList ID="ddlSETT" runat="server" meta:resourcekey="ddlSETTResource1"></asp:DropDownList>

                        </td>
                    </tr>
                    <tr>
                        <td class="PopTableRightTD" colspan="3" style="text-align: left;">
                            <asp:CheckBox ID="cbNotSett" runat="server" Text="不結算" onclick="ControlNotPunch()" meta:resourcekey="cbNotSettResource1" />
                        </td>
                    </tr>
                    <tr>
                        <td class="PopTableRightTD" colspan="3" style="text-align: left;">
                            <asp:CheckBox ID="cbNotPunch" runat="server" Text="免刷卡" meta:resourcekey="cbNotPunchResource1" />
                            <asp:Label ID="Label62" runat="server" Text="會進行結算，但不會處理刷卡相關資料(不會遲到或曠職)" ForeColor="Blue" meta:resourcekey="Label62Resource1"></asp:Label>
                        </td>
                    </tr>
                    </asp:Panel>
                    <tr>
                        <td colspan="4" class="PopTableHeader" align="center">
                            <center>
                                <asp:Label ID="Label6" runat="server" Text="聯絡資訊" meta:resourcekey="Label6Resource1"></asp:Label></center>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label7" runat="server" Text="通訊處地址" meta:resourcekey="Label7Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" colspan="3">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text="郵遞區號" meta:resourcekey="Label9Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPresentZip" runat="server" MaxLength="50" Width="60px" meta:resourcekey="txtPresentZipResource1"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" Text="地址" meta:resourcekey="Label10Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPresentAddr" runat="server" MaxLength="255" Width="385px" meta:resourcekey="txtPresentAddrResource1"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label8" runat="server" Text="通訊處電話" meta:resourcekey="Label8Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" colspan="3">
                            <asp:TextBox ID="txtPresentPhone" runat="server" meta:resourcekey="txtPresentPhoneResource1"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label11" runat="server" Text="戶籍地址" meta:resourcekey="Label11Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" colspan="3">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td colspan="4">
                                        <asp:CheckBox ID="cbAddr" runat="server" Text="同上" onclick="checkAddress()" meta:resourcekey="cbAddrResource1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label12" runat="server" Text="郵遞區號" meta:resourcekey="Label12Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPermanentZip" runat="server" MaxLength="50" Width="60px" meta:resourcekey="txtPermanentZipResource1"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label13" runat="server" Text="地址" meta:resourcekey="Label13Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPermanentAddr" runat="server" MaxLength="255" Width="385px" meta:resourcekey="txtPermanentAddrResource1"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label14" runat="server" Text="戶籍地電話" meta:resourcekey="Label14Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" colspan="3">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="cbPhone" runat="server" Text="同上" onclick="checkPhone()" meta:resourcekey="cbPhoneResource1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtPermanentPhone" runat="server" meta:resourcekey="txtPermanentPhoneResource1"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label16" runat="server" Text="緊急通知人" meta:resourcekey="Label16Resource1"></asp:Label>
                        </td>
                        <td colspan="3" class="PopTableRightTD">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label17" runat="server" Text="姓名" meta:resourcekey="Label17Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmerContact" runat="server" MaxLength="50" meta:resourcekey="txtEmerContactResource1"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label19" runat="server" Text="手機" meta:resourcekey="Label19Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmerMobile" runat="server" MaxLength="50" meta:resourcekey="txtEmerMobileResource1"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label18" runat="server" Text="電話(公)" meta:resourcekey="Label18Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmerPhone2" runat="server" MaxLength="50" meta:resourcekey="txtEmerPhone2Resource1"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label20" runat="server" Text="電話(宅)" meta:resourcekey="Label20Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmerPhone1" runat="server" MaxLength="50" meta:resourcekey="txtEmerPhone1Resource1"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center" class="PopTableHeader">
                            <center>
                                <asp:Label ID="Label15" runat="server" Text="家庭狀況" meta:resourcekey="Label15Resource1"></asp:Label></center>
                        </td>
                    </tr>
                    <tr>
                        <td class="PopTableRightTD" colspan="4">
                            <table class="PopTable" cellpadding="0" cellspacing="1">
                                <tr>
                                    <td style="text-align: center">
                                        <asp:Label ID="Label21" runat="server" Text="稱謂" meta:resourcekey="Label21Resource1"></asp:Label>
                                    </td>
                                    <td style="text-align: center" class="PopTableLeftTD">
                                        <asp:Label ID="Label23" runat="server" Text="姓名" meta:resourcekey="Label23Resource1"></asp:Label>
                                    </td>
                                    <td style="text-align: center" class="PopTableLeftTD">
                                        <asp:Label ID="Label24" runat="server" Text="出生日期" meta:resourcekey="Label24Resource1"></asp:Label>
                                    </td>
                                    <td style="text-align: center" class="PopTableLeftTD">
                                        <asp:Label ID="Label25" runat="server" Text="職業" meta:resourcekey="Label25Resource1"></asp:Label>
                                    </td>
                                    <td style="text-align: center" class="PopTableLeftTD">
                                        <asp:Label ID="Label22" runat="server" Text="稱謂" meta:resourcekey="Label22Resource1"></asp:Label>
                                    </td>
                                    <td style="text-align: center" class="PopTableLeftTD">
                                        <asp:Label ID="Label26" runat="server" Text="人數" meta:resourcekey="Label26Resource1"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="white-space: nowrap" class="PopTableLeftTD">
                                        <asp:Label ID="Label27" runat="server" Text="父" meta:resourcekey="Label27Resource1"></asp:Label>
                                    </td>
                                    <td class="PopTableRightTD" style="text-align: left">
                                        <asp:TextBox ID="txtFatherName" runat="server" meta:resourcekey="txtFatherNameResource1"></asp:TextBox>
                                    </td>
                                    <td class="PopTableRightTD" style="text-align: left">
                                        <telerik:RadDatePicker ID="wdcFatherAge" runat="server" SkinID="AllowEmpty" meta:resourcekey="wdcFatherAgeResource1">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="yyyy/M/d" DateFormat="yyyy/M/d" LabelWidth="64px" Width="">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td class="PopTableRightTD" style="text-align: left">
                                        <asp:TextBox ID="txtFatherJob" runat="server" meta:resourcekey="txtFatherJobResource1"></asp:TextBox>
                                    </td>
                                    <td style="white-space: nowrap" class="PopTableLeftTD">
                                        <asp:Label ID="Label28" runat="server" Text="兄姐" meta:resourcekey="Label28Resource1"></asp:Label>
                                    </td>
                                    <td class="PopTableRightTD" style="text-align: left">
                                        <asp:TextBox ID="txtOlderSibCount" runat="server" meta:resourcekey="txtOlderSibCountResource1"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="white-space: nowrap" class="PopTableLeftTD">
                                        <asp:Label ID="Label29" runat="server" Text="母" meta:resourcekey="Label29Resource1"></asp:Label>
                                    </td>
                                    <td class="PopTableRightTD" style="text-align: left">
                                        <asp:TextBox ID="txtMotherName" runat="server" meta:resourcekey="txtMotherNameResource1"></asp:TextBox>
                                    </td>
                                    <td class="PopTableRightTD" style="text-align: left">
                                        <telerik:RadDatePicker ID="wdcMotherAge" runat="server" SkinID="AllowEmpty" meta:resourcekey="wdcMotherAgeResource1">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="yyyy/M/d" DateFormat="yyyy/M/d" LabelWidth="64px" Width="">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td class="PopTableRightTD" style="text-align: left">
                                        <asp:TextBox ID="txtMotherJob" runat="server" meta:resourcekey="txtMotherJobResource1"></asp:TextBox>
                                    </td>
                                    <td style="white-space: nowrap" class="PopTableLeftTD">
                                        <asp:Label ID="Label30" runat="server" Text="弟妹" meta:resourcekey="Label30Resource1"></asp:Label>
                                    </td>
                                    <td class="PopTableRightTD" style="text-align: left">
                                        <asp:TextBox ID="txtYoungerSibCount" runat="server" meta:resourcekey="txtYoungerSibCountResource1"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="white-space: nowrap" class="PopTableLeftTD">
                                        <asp:Label ID="Label31" runat="server" Text="配偶" meta:resourcekey="Label31Resource1"></asp:Label>
                                    </td>
                                    <td class="PopTableRightTD" style="text-align: left">
                                        <asp:TextBox ID="txtSpouseName" runat="server" meta:resourcekey="txtSpouseNameResource1"></asp:TextBox>
                                    </td>
                                    <td class="PopTableRightTD" style="text-align: left">
                                        <telerik:RadDatePicker ID="wdcSpouseAge" runat="server" SkinID="AllowEmpty" meta:resourcekey="wdcSpouseAgeResource1">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="yyyy/M/d" DateFormat="yyyy/M/d" LabelWidth="64px" Width="">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td class="PopTableRightTD" style="text-align: left">
                                        <asp:TextBox ID="txtSpouseJob" runat="server" meta:resourcekey="txtSpouseJobResource1"></asp:TextBox>
                                    </td>
                                    <td style="white-space: nowrap" class="PopTableLeftTD">
                                        <asp:Label ID="Label32" runat="server" Text="子女" meta:resourcekey="Label32Resource1"></asp:Label>
                                    </td>
                                    <td class="PopTableRightTD" style="text-align: left">
                                        <asp:TextBox ID="txtChildrenCount" runat="server" meta:resourcekey="txtChildrenCountResource1"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="PopTableHeader" colspan="4">
                            <center>
                                <asp:Label ID="Label33" runat="server" Text="興趣專長" meta:resourcekey="Label33Resource1"></asp:Label></center>
                        </td>
                    </tr>
                    <tr>
                        <td class="PopTableRightTD" colspan="4" style="text-align: left">
                                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="PopTableHeader" colspan="4">
                            <center>
                                <asp:Label ID="Label34" runat="server" Text="薪資帳戶" meta:resourcekey="Label34Resource1"></asp:Label>
                            </center>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label35" runat="server" Text="銀行別" meta:resourcekey="Label35Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:TextBox ID="txtPayrollBank" runat="server" MaxLength="50" meta:resourcekey="txtPayrollBankResource1"></asp:TextBox>
                        </td>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label36" runat="server" Text="銀行帳號" meta:resourcekey="Label36Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:TextBox ID="txtPayrollAcc" runat="server" MaxLength="50" meta:resourcekey="txtPayrollAccResource1"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label37" runat="server" Text="帳戶相關附件" meta:resourcekey="Label37Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" colspan="3">
                            <uc2:UC_FileCenter runat="server" ID="ucFileAccount" AllowedMultipleFileSelection="false" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="PopTableHeader" colspan="4">
                            <center>
                                <asp:Label ID="Label38" runat="server" Text="工作型態" meta:resourcekey="Label38Resource1"></asp:Label></center>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label39" runat="server" Text="雇用型態" meta:resourcekey="Label39Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" colspan="3">
                            <asp:RadioButtonList ID="rbListJobType" runat="server" RepeatDirection="Horizontal"
                                meta:resourcekey="rbListJobTypeResource1">
                                <asp:ListItem Value="FullTime" meta:resourcekey="ListItemResource31">全職員工</asp:ListItem>
                                <asp:ListItem Value="PartTime" meta:resourcekey="ListItemResource32">兼職員工</asp:ListItem>
                                <asp:ListItem Value="Student" meta:resourcekey="ListItemResource33">工讀生</asp:ListItem>
                                <asp:ListItem Value="Project" meta:resourcekey="ListItemResource34">專案</asp:ListItem>
                                <asp:ListItem Value="Other" meta:resourcekey="ListItemResource35">其他</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label40" runat="server" Text="特殊身份" meta:resourcekey="Label40Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" colspan="3">
                            <asp:RadioButtonList ID="rbListIdentityType" runat="server" RepeatDirection="Horizontal"
                                meta:resourcekey="rbListIdentityTypeResource1">
                                <asp:ListItem Value="None" meta:resourcekey="ListItemResource36">無</asp:ListItem>
                                <asp:ListItem Value="Aborigine" meta:resourcekey="ListItemResource37">原住民</asp:ListItem>
                                <asp:ListItem Value="PhysicalDisability" meta:resourcekey="ListItemResource38">身心障礙</asp:ListItem>
                                <asp:ListItem Value="LowIncome" meta:resourcekey="ListItemResource39">低收入戶</asp:ListItem>
                                <asp:ListItem Value="MidIncome" meta:resourcekey="ListItemResource40">中低收入戶</asp:ListItem>
                                <asp:ListItem Value="Foreign" meta:resourcekey="ListItemResource41">外籍人士</asp:ListItem>
                                <asp:ListItem Value="Other" meta:resourcekey="ListItemResource42">其他</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label41" runat="server" Text="特殊身份相關附件" meta:resourcekey="Label41Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" colspan="3">
                            <uc2:UC_FileCenter runat="server" ID="ucFileIdentity" AllowedMultipleFileSelection="false" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="white-space: nowrap; text-align: center" class="PopTableHeader">
                            <center>
                                <asp:Label ID="Label42" runat="server" Text="兵役" meta:resourcekey="Label42Resource1"></asp:Label></center>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label43" runat="server" Text="兵役役別" meta:resourcekey="Label43Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:TextBox ID="txtMilitaryService" runat="server" meta:resourcekey="txtMilitaryServiceResource1"></asp:TextBox>
                        </td>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label44" runat="server" Text="兵役軍種" meta:resourcekey="Label44Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:TextBox ID="txtMilitaryDuty" runat="server" meta:resourcekey="txtMilitaryDutyResource1"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label45" runat="server" Text="兵科名稱" meta:resourcekey="Label45Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:TextBox ID="txtMilitaryType" runat="server" meta:resourcekey="txtMilitaryTypeResource1"></asp:TextBox>
                        </td>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label46" runat="server" Text="退伍職級" meta:resourcekey="Label46Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:TextBox ID="txtMilitaryRank" runat="server" meta:resourcekey="txtMilitaryRankResource1"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label47" runat="server" Text="服役期間" meta:resourcekey="Label47Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" colspan="3">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <telerik:RadDatePicker ID="wdcMilitaryFrom" runat="server" SkinID="AllowEmpty" meta:resourcekey="wdcMilitaryFromResource1">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="yyyy/M/d" DateFormat="yyyy/M/d" LabelWidth="64px" Width="">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                                        </telerik:RadDatePicker>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label48" runat="server" Text="~" meta:resourcekey="Label48Resource1"></asp:Label>
                                    </td>
                                    <td>
                                        <telerik:RadDatePicker ID="wdcMilitaryTo" runat="server" SkinID="AllowEmpty" meta:resourcekey="wdcMilitaryToResource1">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="yyyy/M/d" DateFormat="yyyy/M/d" LabelWidth="64px" Width="">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                                        </telerik:RadDatePicker>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label49" runat="server" Text="兵役附件" meta:resourcekey="Label49Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD" colspan="3">
                            <uc2:UC_FileCenter runat="server" ID="uc_FieldMailitary" AllowedMultipleFileSelection="false" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="white-space: nowrap; text-align: center" class="PopTableHeader">
                            <center>
                                <asp:Label ID="Label55" runat="server" Text="年資" meta:resourcekey="Label55Resource1"></asp:Label></center>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label56" runat="server" Text="承認年資" meta:resourcekey="Label56Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <telerik:RadNumericTextBox ID="txtAdmitedSeniority" runat="server" MaxValue="999.9" MinValue="-999.9" MaxLength="6" NumberFormat-DecimalDigits="1" Culture="zh-TW" DbValueFactor="1" LabelWidth="64px" meta:resourcekey="txtAdmitedSeniorityResource1" Width="160px"></telerik:RadNumericTextBox>
                        </td>
                        <td style="white-space: nowrap">
                            <asp:Label ID="Label57" runat="server" Text="備註" meta:resourcekey="Label57Resource1"></asp:Label>
                        </td>
                        <td class="PopTableRightTD">
                            <asp:TextBox ID="txtSeniorityRemark" runat="server" meta:resourcekey="txtSeniorityRemarkResource1"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="PopTableRightTD" colspan="4">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <telerik:RadToolBar ID="RadToolBarExp" runat="server" Width="100%" OnButtonClick="RadToolBarExp_ButtonClick"
                                                    OnClientButtonClicking="RadToolBarExp_ButtonClicking" meta:resourcekey="RadToolBarExpResource1" SingleClick="None">
                                                    <Items>
                                                        <telerik:RadToolBarButton runat="server" Value="Title" meta:resourcekey="RadToolBarButtonResource1">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" Text="工作經歷：" ID="txtTitle" meta:resourcekey="TBLabelResource1"></asp:Label>
                                                            </ItemTemplate>
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource2">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Text="新增" Value="Insert" ImageUrl="~/Common/Images/Icon/icon_m23.png"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m23.png" DisabledImageUrl="~/Common/Images/Icon/icon_m23.png"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m23.png" meta:resourcekey="TBarButtonResource1">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource3">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete" ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="TBarButtonResource2">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource4">
                                                        </telerik:RadToolBarButton>
                                                    </Items>
                                                </telerik:RadToolBar>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <Fast:Grid ID="gridExp" runat="server" DataKeyNames="EXP_GUID" AllowSorting="True"
                                                    AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
                                                    DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                                                    EnhancePager="True" OnRowCommand="gridExp_RowCommand" OnRowDataBound="gridExp_RowDataBound"
                                                    PageSize="15" meta:resourcekey="gridExpResource1" CustomDropDownListPage="False" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="">
                                                    <EnhancePagerSettings
                                                        ShowHeaderPager="True" />
                                                    <ExportExcelSettings AllowExportToExcel="False" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="服務單位" meta:resourcekey="TemplateFieldResource1">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lbtnModify" runat="server" CommandName="lbtnModify" meta:resourcekey="lbtnModifyResource1"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <HeaderStyle Wrap="False" />
                                                            <ItemStyle Wrap="False" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="DEPARTMENT" HeaderText="部門" meta:resourcekey="BoundFieldResource1">
                                                            <HeaderStyle Wrap="False" />
                                                            <ItemStyle Wrap="False" />
                                                        </asp:BoundField>
                                                        <asp:BoundField HeaderText="職級" DataField="TITLE" meta:resourcekey="BoundFieldResource2" />
                                                        <asp:TemplateField HeaderText="是否擔任主管職" meta:resourcekey="BoundFieldResource3">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblManager" runat="server" Text='<%# Bind("MANAGE") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="經歷年資" DataField="PERIOD_YEAR" meta:resourcekey="BoundFieldResource4" />
                                                        <asp:BoundField HeaderText="到職日期" DataField="FROM" DataFormatString="{0:yyyy/MM/dd}"
                                                            meta:resourcekey="BoundFieldResource5" />
                                                        <asp:BoundField HeaderText="離職日期" DataField="TO" DataFormatString="{0:yyyy/MM/dd}"
                                                            meta:resourcekey="BoundFieldResource6" />
                                                        <asp:BoundField HeaderText="薪額" DataField="SALARY" meta:resourcekey="BoundFieldResource7" />
                                                        <asp:BoundField HeaderText="離職原因" DataField="REASON" meta:resourcekey="BoundFieldResource8" />
                                                    </Columns>
                                                </Fast:Grid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <telerik:RadToolBar ID="RadToolBarEdu" runat="server" Width="100%" OnButtonClick="RadToolBarEdu_ButtonClick"
                                                    OnClientButtonClicking="RadToolBarEdu_ButtonClicking" meta:resourcekey="RadToolBarEduResource1" SingleClick="None">
                                                    <Items>
                                                        <telerik:RadToolBarButton runat="server" Value="Title" meta:resourcekey="RadToolBarButtonResource5">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="txtTitle" Text="學歷：" meta:resourcekey="TBLabelResource2"></asp:Label>
                                                            </ItemTemplate>
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource6">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Text="新增" Value="Insert" ImageUrl="~/Common/Images/Icon/icon_m23.png"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m23.png" DisabledImageUrl="~/Common/Images/Icon/icon_m23.png"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m23.png" meta:resourcekey="TBarButtonResource3">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource7">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete" ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="TBarButtonResource4">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource8">
                                                        </telerik:RadToolBarButton>
                                                    </Items>
                                                </telerik:RadToolBar>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <Fast:Grid ID="gridEdu" runat="server" DataKeyNames="EDU_GUID" AllowSorting="True"
                                                    AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
                                                    DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                                                    EnhancePager="True" PageSize="15" OnRowCommand="gridEdu_RowCommand" OnRowDataBound="gridEdu_RowDataBound"
                                                    meta:resourcekey="gridEduResource1" KeepSelectedRows="False" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                                                    <EnhancePagerSettings
                                                        ShowHeaderPager="True"></EnhancePagerSettings>
                                                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="學校名稱" meta:resourcekey="TemplateFieldResource2">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lbtnEdu" runat="server" CommandName="lbtnEdu" CommandArgument='<%# Bind("EDU_GUID") %>'
                                                                    Text='<%#: Bind("SCHOOL") %>' meta:resourcekey="lbtnEduResource1"></asp:LinkButton>
                                                                <asp:Label ID="lblLevel" runat="server" Text='<%# Bind("LEVEL") %>' Visible="False" meta:resourcekey="lblLevelResource1"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="院系科別" DataField="MAJOR" meta:resourcekey="BoundFieldResource9" />
                                                        <asp:BoundField HeaderText="修業年限(起)" DataField="FROM" DataFormatString="{0:yyyy/MM/dd}"
                                                            meta:resourcekey="BoundFieldResource10" />
                                                        <asp:BoundField HeaderText="修業年限(迄)" DataField="TO" DataFormatString="{0:yyyy/MM/dd}"
                                                            meta:resourcekey="BoundFieldResource11" />
                                                        <asp:TemplateField HeaderText="畢業/肄業" meta:resourcekey="BoundFieldResource12">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblGraduated" runat="server" Text='<%# Bind("GRADUATED") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="教育程度(學位)" meta:resourcekey="BoundFieldResource13">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblEduLevel" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField HeaderText="證件字號" DataField="Number" meta:resourcekey="BoundFieldResource14" />
                                                        <asp:TemplateField HeaderText="最高學歷" meta:resourcekey="TemplateFieldResource3">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="cbx" runat="server" Checked='<%# Bind("HIGHEST") %>' meta:resourcekey="cbxResource1" />
                                                                <asp:Button ID="btn" runat="server" CommandName="btn" Style="display: none" meta:resourcekey="btnResource1" />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </Fast:Grid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <telerik:RadToolBar ID="RadToolBarLicense" runat="server" Width="100%" OnButtonClick="RadToolBarLicense_ButtonClick"
                                                    OnClientButtonClicking="RadToolBarLicense_ButtonClicking" meta:resourcekey="RadToolBarLicenseResource1" SingleClick="None">
                                                    <Items>
                                                        <telerik:RadToolBarButton runat="server" Value="Title" meta:resourcekey="RadToolBarButtonResource9">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="txtTitle" Text="考試證照：" meta:resourcekey="TBLabelResource3"></asp:Label>
                                                            </ItemTemplate>
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource10">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Text="新增" Value="Insert" ImageUrl="~/Common/Images/Icon/icon_m23.png"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m23.png" DisabledImageUrl="~/Common/Images/Icon/icon_m23.png"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m23.png" meta:resourcekey="TBarButtonResource5">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource11">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete" ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="TBarButtonResource6">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource12">
                                                        </telerik:RadToolBarButton>
                                                    </Items>
                                                </telerik:RadToolBar>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <Fast:Grid ID="gridLicense" runat="server" DataKeyNames="LICE_GUID" EmptyDataText="沒有資料" meta:resourcekey="gridLicenseResource1"
                                                    AutoGenerateColumns="False" OnRowCommand="gridLicense_RowCommand" OnRowDataBound="gridLicense_RowDataBound" AllowSorting="True" AutoGenerateCheckBoxColumn="True" DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending" EnhancePager="True" KeepSelectedRows="False" PageSize="15" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                                                    <EnhancePagerSettings ShowHeaderPager="True" />
                                                    <ExportExcelSettings AllowExportToExcel="False" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="年度" meta:resourcekey="TemplateFieldResource4">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lbtnYear" runat="server" CommandName="lbtnYear" Text='<%# Bind("YEAR") %>' meta:resourcekey="lbtnYearResource1"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="60px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="類別" meta:resourcekey="BoundFieldResource15">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTypeName" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="LICENSE_NAME" HeaderText="證照名稱" meta:resourcekey="BoundFieldResource16">
                                                            <HeaderStyle Wrap="False" />
                                                            <ItemStyle Width="100px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="GRADE" HeaderText="級別" meta:resourcekey="BoundFieldResource17">
                                                            <ItemStyle Width="60px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="NUMBER" HeaderText="證件字號" meta:resourcekey="BoundFieldResource18">
                                                            <HeaderStyle Wrap="False" />
                                                            <ItemStyle Width="60px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ACQU_DATE" HeaderText="取得日期" DataFormatString="{0:yyyy/MM/dd}"
                                                            meta:resourcekey="BoundFieldResource19">
                                                            <HeaderStyle Wrap="False" />
                                                            <ItemStyle Width="60px" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="有效期限" meta:resourcekey="BoundFieldResource20">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblEffeDate" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle Wrap="False" />
                                                            <ItemStyle Width="60px" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="REMARKS" HeaderText="備註" meta:resourcekey="BoundFieldResource21">
                                                            <ItemStyle Width="90px" />
                                                        </asp:BoundField>
                                                    </Columns>
                                                </Fast:Grid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <telerik:RadToolBar ID="RadToolBarDriving" runat="server" Width="100%" OnButtonClick="RadToolBarDriving_ButtonClick"
                                                    OnClientButtonClicking="RadToolBarDriving_ButtonClicking" meta:resourcekey="RadToolBarDrivingResource1" SingleClick="None">
                                                    <Items>
                                                        <telerik:RadToolBarButton runat="server" Value="Title" meta:resourcekey="RadToolBarButtonResource13">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="txtTitle" Text="駕駛執照：" meta:resourcekey="TBLabelResource4"></asp:Label>
                                                            </ItemTemplate>
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource14">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Text="新增" Value="Insert" ImageUrl="~/Common/Images/Icon/icon_m23.png"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m23.png" DisabledImageUrl="~/Common/Images/Icon/icon_m23.png"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m23.png" meta:resourcekey="TBarButtonResource7">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource15">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete" ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="TBarButtonResource8">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource16">
                                                        </telerik:RadToolBarButton>
                                                    </Items>
                                                </telerik:RadToolBar>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <Fast:Grid ID="gridDriving" runat="server" DataKeyNames="DRIV_GUID" AllowSorting="True"
                                                    AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
                                                    DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                                                    EnhancePager="True" OnRowCommand="gridDriving_RowCommand" OnRowDataBound="gridDriving_RowDataBound"
                                                    PageSize="15" meta:resourcekey="gridDrivingResource1" CustomDropDownListPage="False" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="">
                                                    <EnhancePagerSettings
                                                        ShowHeaderPager="True"></EnhancePagerSettings>
                                                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="有效日期" meta:resourcekey="TemplateFieldResource5">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lbtnEFFEDate" runat="server" CommandName="lbtnEFFEDate" Text='<%# Bind("EFFE_DATE") %>' meta:resourcekey="lbtnEFFEDateResource1"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="TYPE" HeaderText="駕照種類" meta:resourcekey="BoundFieldResource22" />
                                                        <asp:BoundField DataField="JURI_NUMBER" HeaderText="管轄編號" meta:resourcekey="BoundFieldResource23" />
                                                        <asp:BoundField DataField="PRINT_NUMBER" HeaderText="印製號碼" meta:resourcekey="BoundFieldResource24" />
                                                        <asp:BoundField DataField="CONDITION" HeaderText="持照條件" meta:resourcekey="BoundFieldResource25" />
                                                    </Columns>
                                                </Fast:Grid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <telerik:RadToolBar ID="RadToolBarLang" runat="server" Width="100%" OnButtonClick="RadToolBarLang_ButtonClick"
                                                    OnClientButtonClicking="RadToolBarLang_ButtonClicking" meta:resourcekey="RadToolBarLangResource1" SingleClick="None">
                                                    <Items>
                                                        <telerik:RadToolBarButton runat="server" Value="Title" meta:resourcekey="RadToolBarButtonResource17">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="txtTitle" Text="語言能力：" meta:resourcekey="TBLabelResource5"></asp:Label>
                                                            </ItemTemplate>
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource18">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Text="新增" Value="Insert" ImageUrl="~/Common/Images/Icon/icon_m23.png"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m23.png" DisabledImageUrl="~/Common/Images/Icon/icon_m23.png"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m23.png" meta:resourcekey="TBarButtonResource9">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource19">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete" ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="TBarButtonResource10">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource20">
                                                        </telerik:RadToolBarButton>
                                                    </Items>
                                                </telerik:RadToolBar>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <Fast:Grid ID="gridLang" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                                                    AutoGenerateColumns="False" DataKeyNames="LANG" DataKeyOnClientWithCheckBox="False"
                                                    DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                                                    EnhancePager="True" OnRowCommand="gridLang_RowCommand" OnRowDataBound="gridLang_RowDataBound"
                                                    PageSize="15" meta:resourcekey="gridLangResource1" KeepSelectedRows="False" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor="">
                                                    <EnhancePagerSettings
                                                        ShowHeaderPager="True" />
                                                    <ExportExcelSettings AllowExportToExcel="False" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="語言種類" meta:resourcekey="TemplateFieldResource6">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lbtnLang" runat="server" CommandName="lbtnLang" Text='<%# Bind("LANG") %>' meta:resourcekey="lbtnLangResource1"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="90px" HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="聽">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblListening" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="60px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="說">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSpeaking" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="60px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="讀">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblReading" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="60px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="寫">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblWriting" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" Width="60px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="檢定資格或證書" meta:resourcekey="TemplateFieldResource7">
                                                            <ItemTemplate>
                                                                <uc2:UC_FileCenter runat="server" ID="uc_File" Editable="false" UploadEnabled="false" AllowedMultipleFileSelection="false" />
                                                            </ItemTemplate>
                                                            <HeaderStyle Wrap="False" />
                                                            <ItemStyle Width="100px" HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </Fast:Grid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <telerik:RadToolBar ID="RadToolBarPref" runat="server" Width="100%" OnButtonClick="RadToolBarPref_ButtonClick"
                                                    OnClientButtonClicking="RadToolBarPref_ButtonClicking" meta:resourcekey="RadToolBarPrefResource1" SingleClick="None">
                                                    <Items>
                                                        <telerik:RadToolBarButton runat="server" Value="Title" meta:resourcekey="RadToolBarButtonResource21">
                                                            <ItemTemplate>
                                                                <asp:Label runat="server" ID="txtTitle" Text="歷年考績：" meta:resourcekey="TBLabelResource6"></asp:Label>
                                                            </ItemTemplate>
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource22">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Text="新增" Value="Insert" ImageUrl="~/Common/Images/Icon/icon_m23.png"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m23.png" DisabledImageUrl="~/Common/Images/Icon/icon_m23.png"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m23.png" meta:resourcekey="TBarButtonResource11">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource23">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" Text="刪除" Value="Delete" ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                            HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                                                            CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" meta:resourcekey="TBarButtonResource12">
                                                        </telerik:RadToolBarButton>
                                                        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource24">
                                                        </telerik:RadToolBarButton>
                                                    </Items>
                                                </telerik:RadToolBar>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <Fast:Grid ID="gridPref" runat="server" DataKeyNames="PERF_GUID" AllowSorting="True"
                                                    AutoGenerateCheckBoxColumn="True" AutoGenerateColumns="False" DataKeyOnClientWithCheckBox="False"
                                                    DefaultSortDirection="Ascending" EmptyDataText="沒有資料"
                                                    EnhancePager="True" OnRowCommand="gridPref_RowCommand" OnRowDataBound="gridPref_RowDataBound"
                                                    PageSize="15" meta:resourcekey="gridPrefResource1" CustomDropDownListPage="False" KeepSelectedRows="False" SelectedRowColor="" UnSelectedRowColor="">
                                                    <EnhancePagerSettings
                                                        ShowHeaderPager="True"></EnhancePagerSettings>
                                                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="年度" meta:resourcekey="TemplateFieldResource8">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lbtnANNUAL" runat="server" CommandName="lbtnANNUAL" Text='<%# Bind("ANNUAL") %>' meta:resourcekey="lbtnANNUALResource1"></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="SCORE" HeaderText="總分" meta:resourcekey="BoundFieldResource30" />
                                                        <asp:TemplateField HeaderText="等次" meta:resourcekey="BoundFieldResource31" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblRank" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ORGIN_RANK" HeaderText="原職等職級" meta:resourcekey="BoundFieldResource32" />
                                                        <asp:BoundField DataField="NEW_RANK" HeaderText="新職等職級" meta:resourcekey="BoundFieldResource33" />
                                                        <asp:BoundField DataField="FUNCTION_CHANGE" HeaderText="職務異動" meta:resourcekey="BoundFieldResource34" />
                                                        <asp:BoundField DataField="REMARKS" HeaderText="備註" meta:resourcekey="BoundFieldResource35" />
                                                    </Columns>
                                                </Fast:Grid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblDelete" runat="server" Text="確定要刪除嗎?" Visible="False" meta:resourcekey="lblDeleteResource1"></asp:Label>
    <asp:Label ID="lblUserGuid" runat="server" Style="display: none" meta:resourcekey="lblUserGuidResource1"></asp:Label>
    <asp:Label ID="lblTrue" runat="server" Text="是" Visible="False" meta:resourcekey="lblTrueResource1"></asp:Label>
    <asp:Label ID="lblFalse" runat="server" Text="否" Visible="False" meta:resourcekey="lblFalseResource1"></asp:Label>
    <asp:Label ID="lblNonEffDate" runat="server" Text="無期限" Visible="False" meta:resourcekey="lblNonEffDateResource1"></asp:Label>
    <asp:Label ID="lblA" runat="server" Text="精通" Visible="False" meta:resourcekey="lblAResource1"></asp:Label>
    <asp:Label ID="lblB" runat="server" Text="中等" Visible="False" meta:resourcekey="lblBResource1"></asp:Label>
    <asp:Label ID="lblC" runat="server" Text="略懂" Visible="False" meta:resourcekey="lblCResource1"></asp:Label>
    <asp:Label ID="lblD" runat="server" Text="不會" Visible="False" meta:resourcekey="lblDResource1"></asp:Label>
    <asp:Label ID="lblGraduation" runat="server" Text="畢業" Visible="False" meta:resourcekey="lblGraduationResource1"></asp:Label>
    <asp:Label ID="lblNonGraduation" runat="server" Text="肄業" Visible="False" meta:resourcekey="lblNonGraduationResource1"></asp:Label>
    <asp:Label ID="lblZH" runat="server" Text="中文" Visible="False" meta:resourcekey="lblZHResource1"></asp:Label>
    <asp:Label ID="lblEN" runat="server" Text="英文" Visible="False" meta:resourcekey="lblENResource1"></asp:Label>
    <asp:Label ID="lblJA" runat="server" Text="日文" Visible="False" meta:resourcekey="lblJAResource1"></asp:Label>
    <asp:Label ID="lblKO" runat="server" Text="韓文" Visible="False" meta:resourcekey="lblKOResource1"></asp:Label>
    <asp:Label ID="lblFR" runat="server" Text="法文" Visible="False" meta:resourcekey="lblFRResource1"></asp:Label>
    <asp:Label ID="lblDE" runat="server" Text="德文" Visible="False" meta:resourcekey="lblDEResource1"></asp:Label>
    <asp:Label ID="lblES" runat="server" Text="西班牙文" Visible="False" meta:resourcekey="lblESResource1"></asp:Label>
    <asp:Label ID="lblRU" runat="server" Text="俄文" Visible="False" meta:resourcekey="lblRUResource1"></asp:Label>
    <asp:Label ID="lblIT" runat="server" Text="義大利文" Visible="False" meta:resourcekey="lblITResource1"></asp:Label>
    <asp:Label ID="lblPT" runat="server" Text="葡萄牙文" Visible="False" meta:resourcekey="lblPTResource1"></asp:Label>
    <asp:Label ID="lblAR" runat="server" Text="阿拉伯文" Visible="False" meta:resourcekey="lblARResource1"></asp:Label>
    <asp:Label ID="lblNL" runat="server" Text="荷蘭文" Visible="False" meta:resourcekey="lblNLResource1"></asp:Label>
    <asp:Label ID="lblVN" runat="server" Text="越文" Visible="False" meta:resourcekey="lblVNResource1"></asp:Label>
    <asp:Label ID="lblTH" runat="server" Text="泰文" Visible="False" meta:resourcekey="lblTHResource1"></asp:Label>
    <asp:Label ID="lblMY" runat="server" Text="馬來文" Visible="False" meta:resourcekey="lblMYResource1"></asp:Label>
    <asp:Label ID="lblID" runat="server" Text="印尼文" Visible="False" meta:resourcekey="lblIDResource1"></asp:Label>
    <asp:Label ID="lblIN" runat="server" Text="印度文" Visible="False" meta:resourcekey="lblINResource1"></asp:Label>
    <asp:Label ID="lblPH" runat="server" Text="菲律賓文" Visible="False" meta:resourcekey="lblPHResource1"></asp:Label>
    <asp:Label ID="lblOther" runat="server" Text="其他外文" Visible="False" meta:resourcekey="lblOtherResource1"></asp:Label>
    <asp:Label ID="lblRankA" runat="server" Text="特優" Visible="False" meta:resourcekey="lblRankAResource1"></asp:Label>
    <asp:Label ID="lblRankB" runat="server" Text="優" Visible="False" meta:resourcekey="lblRankBResource1"></asp:Label>
    <asp:Label ID="lblRankC" runat="server" Text="甲上" Visible="False" meta:resourcekey="lblRankCResource1"></asp:Label>
    <asp:Label ID="lblRankD" runat="server" Text="甲" Visible="False" meta:resourcekey="lblRankDResource1"></asp:Label>
    <asp:Label ID="lblRankE" runat="server" Text="乙" Visible="False" meta:resourcekey="lblRankEResource1"></asp:Label>
    <asp:Label ID="lblRankF" runat="server" Text="丙" Visible="False" meta:resourcekey="lblRankFResource1"></asp:Label>
    <asp:Label ID="lblSelectCostCenter" runat="server" Text="請選擇成本中心" Visible="False" meta:resourcekey="lblSelectCostCenterResource1"></asp:Label>
    <asp:Label runat="server" ID="lbConfirmDelete" Text="確定要刪除?" Visible="False" meta:resourcekey="lbConfirmDeleteResource1"></asp:Label>
</asp:Content>
