<%@ Page Title="自訂登入頁面維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="EditLoginImg.aspx.cs" Inherits="System_Config_EditLoginImg" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        function cvCheckEndDate(source, args) {
            var ISDefault = $("#<%=chkISDefault.ClientID %>").is(":checked");
            if (ISDefault) {
                return;
            }

            var cvEndDate = $("#<%=cvEndDate.ClientID %>");
            var startDate = $find('<%=rdStartDate.ClientID %>').get_selectedDate();
            var endDate = $find('<%=rdEndDate.ClientID %>').get_selectedDate();
            var nowDate = '<%= Ede.Uof.Utility.UofTime.GetSystemNowForUi().DateTime.ToString("yyyy-MM-dd") %>';

            var errMsg = "";

            if (startDate != null && endDate != null) {

                startDateDiff = startDate.format('yyyy-MM-dd');
                endDateDiff = endDate.format('yyyy-MM-dd');
                startDate = startDate.format('yyyy-MM-dd');
                endDate = endDate.format('yyyy-MM-dd');
                var guid = $('#<%=hidGrid.ClientID %>').val();

                if ((startDate > endDate)) {
                    errMsg = $('#<%=lblErrDate.ClientID %>').text();
                }

                var data = [startDateDiff, endDateDiff, guid];
                var result = $uof.pageMethod.sync("StartEndDateDiff", data);
                if (result != "true") {
                    errMsg = $('#<%=lblDateExist.ClientID %>').text();
                }
            }

            if (errMsg != "") {
                cvEndDate.text(errMsg);
                args.IsValid = false;
                return;
            }
        }

        function cvCheckDefaultExist(source, args) {
            var ISDefault = $("#<%=chkISDefault.ClientID %>").is(":checked");
            var guid = $('#<%=hidGrid.ClientID %>').val();
            var data = [guid];
            if (ISDefault) {
                var result = $uof.pageMethod.sync("CheckDefaultExist", data);
                if (result == "true") {
                    args.IsValid = false;
                    return;
                }
            }
        }

        function cvCheckName(source, args) {
            var txtName = $("#<%=txtName.ClientID %>").val();
            var guid = $('#<%=hidGrid.ClientID %>').val();
            var cvName = $("#<%=cvName.ClientID %>");
            var data = [txtName, guid];
            var errMsg = "";

            var result = $uof.pageMethod.sync("CheckNameExist", data);
            if (result == "Empty") {
                errMsg = $('#<%=lblNameEmpty.ClientID %>').text();
                cvName.text(errMsg);

                args.IsValid = false;
                return;
            }
            else if (result == "true") {
                errMsg = $('#<%=lblNameExist.ClientID %>').text();
                cvName.text(errMsg);

                args.IsValid = false;
                return;
            }
        }

        function cvCheckSelectFile(source, args) {
            var uploadBtn = $find("<%= UC_loginBgFile.ClientID %>");
            if (uploadBtn.get_count() == 0) {
                args.IsValid = false;
                return;
            }
        }
    </script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <table class="PopTable">
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label1Resource1"></asp:Label>
                <asp:Label runat="server" ID="lblName" Text="名稱" meta:resourcekey="lblNameResource1"></asp:Label>
                <asp:HiddenField ID="hidGrid" runat="server"/>
            </td>
            <td nowrap="nowrap">
                <asp:TextBox ID="txtName" runat="server" meta:resourcekey="txtNameResource1"></asp:TextBox>
                <asp:CustomValidator ID="cvName" runat="server" Display="Dynamic"
                    ClientValidationFunction="cvCheckName" meta:resourcekey="cvNameResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label2Resource1"></asp:Label>
                <asp:Label runat="server" ID="lblLoginBgFile" Text="背景圖" meta:resourcekey="lblLoginBgFileResource1"></asp:Label>
            </td>
            <td nowrap="nowrap">
                <uc2:UC_FileCenter runat="server" ID="UC_loginBgFile" ModuleName="EIP" AllowedFileType="Image" ProxyEnabled="false" AllowedMultipleFileSelection="false" />
                <asp:CustomValidator ID="cvSelectFile" runat="server" ErrorMessage="請選擇檔案" ClientValidationFunction="cvCheckSelectFile" 
                    Display="Dynamic" meta:resourcekey="cvSelectFileResource1"></asp:CustomValidator>
                <asp:Label runat="server" ID="lblLoginBGdesc" Text="最適圖片大小：" CssClass="SizeMemo" meta:resourcekey="lblLoginBGdescResource1"></asp:Label>
                <asp:Label runat="server" ID="lblLoginBGSize" Text="1920(w)*1536(h)" CssClass="SizeMemo" meta:resourcekey="lblLoginBGSizeResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label runat="server" ID="lblLoginColorStyle" Text="登入區色系" meta:resourcekey="lblLoginColorStyleResource1"></asp:Label>
            </td>
            <td nowrap="nowrap">
                <telerik:RadColorPicker ID="ColorPickerLoginClass" runat="server" Columns="13"
                                        Preset="None" PreviewColor="False" ShowEmptyColor="False" ShowIcon="True"
                                        Width="500px" SelectedColor="" meta:resourcekey="ColorPickerLoginClassResource1">
                    <telerik:ColorPickerItem Title="Red" Value="#DB2828" />
                    <telerik:ColorPickerItem Title="Orange" Value="#F2711C" />
                    <telerik:ColorPickerItem Title="Yellow" Value="#FBBD08" />
                    <telerik:ColorPickerItem Title="Olive" Value="#B5CC18" />
                    <telerik:ColorPickerItem Title="Green" Value="#21BA45" />
                    <telerik:ColorPickerItem Title="Teal " Value="#00B5AD" />
                    <telerik:ColorPickerItem Title="Blue" Value="#2185D0" />
                    <telerik:ColorPickerItem Title="Violet" Value="#6435C9" />
                    <telerik:ColorPickerItem Title="Purple" Value="#9627BA" />
                    <telerik:ColorPickerItem Title="Pink" Value="#E03997" />
                    <telerik:ColorPickerItem Title="Brown" Value="#A5673F" />
                    <telerik:ColorPickerItem Title="Grey" Value="#767676" />
                    <telerik:ColorPickerItem Title="Black" Value="#1B1C1D" />
                </telerik:RadColorPicker>
            </td>
        </tr>
        <tr>
            <td nowrap="nowrap">
                <asp:Label ID="lblDefault" runat="server" Text="預設值" meta:resourcekey="lblDefaultResource1"></asp:Label>
            </td>
            <td nowrap="nowrap">
                <asp:CheckBox ID="chkISDefault" runat="server" Text="設定為預設登入頁面" AutoPostBack="True" OnCheckedChanged="chkISDefault_CheckedChanged" meta:resourcekey="chkISDefaultResource1">
                </asp:CheckBox>
            </td>
        </tr>
        <tr id="trStatDate" runat="server">
            <td nowrap="nowrap">
                <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label3Resource1"></asp:Label>
                <asp:Label ID="lblShowStartDate" runat="server" Text="上架時間" meta:resourcekey="lblShowStartDateResource1"></asp:Label>
            </td>
            <td nowrap="nowrap">
                <telerik:RadDatePicker ID="rdStartDate" runat="server" meta:resourcekey="rdStartDateResource1">
                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr id="trEndDate" runat="server">
            <td nowrap="nowrap">
                <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label4Resource1"></asp:Label>
                <asp:Label ID="lblShowEndDate" runat="server" Text="下架時間" meta:resourcekey="lblShowEndDateResource1"></asp:Label>
            </td>
            <td nowrap="nowrap">
                <telerik:RadDatePicker ID="rdEndDate" runat="server" meta:resourcekey="rdEndDateResource1"></telerik:RadDatePicker>
                <asp:CustomValidator ID="cvEndDate" runat="server" Display="Dynamic" 
                    ClientValidationFunction="cvCheckEndDate" meta:resourcekey="cvEndDateResource1"></asp:CustomValidator>
            </td>
        </tr>
    </table>
    <asp:CustomValidator ID="cvDefaultexist" runat="server" Display="Dynamic" ErrorMessage="已將其他頁面設為預設值，不可重複設定。​" 
                    ClientValidationFunction="cvCheckDefaultExist" meta:resourcekey="cvDefaultexistResource1"></asp:CustomValidator>
    <asp:Label ID="lblNameEmpty" runat="server" Text="請輸入名稱。" Style="display: none" meta:resourcekey="lblNameEmptyResource1"></asp:Label>
    <asp:Label ID="lblErrDate" runat="server" Text="上架時間不可晚於下架時間。​" Style="display: none" meta:resourcekey="lblErrDateResource1"></asp:Label>
    <asp:Label ID="lblDateExist" runat="server" Text="此期間已有設定其他登入頁面。​" Style="display: none" meta:resourcekey="lblDateExistResource1"></asp:Label>
    <asp:Label ID="lblNameExist" runat="server" Text="此名稱已存在。​" Style="display: none" meta:resourcekey="lblNameExistResource1"></asp:Label>
    <asp:HiddenField ID="hidOLdDefaultCheck" runat="server" Value="false"/>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
