<%@ Control Language="C#" AutoEventWireup="true" Inherits="System_Config_MemberColumn" CodeBehind="MemberColumn.ascx.cs" %>
<asp:Label ID="lblMsgSave" runat="server" Text="儲存成功" Visible="false" ForeColor="Blue" meta:resourcekey="lblMsgSaveResource1"></asp:Label>

<table class="PopTable" cellspacing="1" width="100%">
    <tr>
        <td colspan="4" align="center" class="PopTableHeader">
            <center>
                <asp:Label ID="lblControlColumnDisplay" runat="server" Text="欄位權限設定" meta:resourcekey="lblControlColumnDisplayResource1"></asp:Label>
                <asp:LinkButton ID="lbtnOptionExample" runat="server" Text="(選項說明)" ForeColor="Blue" meta:resourcekey="lbtnOptionExampleResource1"></asp:LinkButton>
            </center>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="名稱"
                meta:resourcekey="Label1Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbAccount" runat="server" Text="可顯示"
                meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbIsModifyAccount" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />

        </td>
        <td>
            <asp:Label ID="Label2" runat="server" Text="身分證字號"
                meta:resourcekey="Label2Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbSid" runat="server" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbIsModifySid" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label5" runat="server" Text="會員類別"
                meta:resourcekey="Label5Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbGroupId" runat="server"
                meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifyGroupId" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label6" runat="server" Text="性別"
                meta:resourcekey="Label6Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbSex" runat="server" meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifySex" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="生日"
                meta:resourcekey="Label3Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbBirthday" runat="server"
                meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifyBirthday" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label4" runat="server" Text="電子郵件"
                meta:resourcekey="Label4Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbEmail" runat="server" meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifyEmail" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>

    <tr>
        <td>
            <asp:Label ID="Label9" runat="server" Text="電子郵件1"
                meta:resourcekey="Label9Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbEmail1" runat="server"
                meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifyEmail1" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label10" runat="server" Text="電子郵件2"
                meta:resourcekey="Label10Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbEmail2" runat="server"
                meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifyEmail2" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label11" runat="server" Text="電子郵件3"
                meta:resourcekey="Label11Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbEmail3" runat="server"
                meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifyEmail3" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label12" runat="server" Text="電子郵件4"
                meta:resourcekey="Label12Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbEmail4" runat="server"
                meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifyEmail4" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label13" runat="server" Text="Skype"
                meta:resourcekey="Label13Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbSkype" runat="server" meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifySkype" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label31" runat="server" Text="行動電話"
                meta:resourcekey="Label31Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbMobile" runat="server"
                meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifyMobile" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label14" runat="server" Text="公司名稱"
                meta:resourcekey="Label14Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbCompnayName" runat="server"
                meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifyCompnayName" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label15" runat="server" Text="分機"
                meta:resourcekey="Label15Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbExtNum" runat="server"
                meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifyExtNum" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label16" runat="server" Text="公司電話"
                meta:resourcekey="Label16Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbPhone" runat="server" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbIsModifyPhone" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label17" runat="server" Text="公司傳真"
                meta:resourcekey="Label17Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbCompnayFax" runat="server"
                meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifyCompnayFax" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label18" runat="server" Text="統一編號"
                meta:resourcekey="Label18Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbSenior" runat="server"
                meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifySenior" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label19" runat="server" Text="地址"
                meta:resourcekey="Label19Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbAddress" runat="server"
                meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifyAddress" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label20" runat="server" Text="簽名"
                meta:resourcekey="Label20Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbSign" runat="server" Text="可顯示"
                meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbIsModifySign" runat="server"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label21" runat="server" Text="其它1"
                meta:resourcekey="Label21Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbOption1" runat="server"
                meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbIsModifyOption1" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label22" runat="server" Text="其它2"
                meta:resourcekey="Label22Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbOption2" runat="server"
                meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbIsModifyOption2" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label7" runat="server" Text="其它3"
                meta:resourcekey="Label7Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbOption3" runat="server"
                meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifyOption3" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label8" runat="server" Text="其它4"
                meta:resourcekey="Label8Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbOption4" runat="server"
                meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifyOption4" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label29" runat="server" Text="其它5"
                meta:resourcekey="Label29Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbOption5" runat="server"
                meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifyOption5" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label30" runat="server" Text="其它6"
                meta:resourcekey="Label30Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbOption6" runat="server"
                meta:resourcekey="cbAccountResource1" />

            <asp:CheckBox ID="cbIsModifyOption6" runat="server" Text="使用者可修改"
                meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <asp:Panel runat="server" Visible="false">
        <tr>
            <td>
                <asp:Label ID="Label32" runat="server" Text="個人資料1"
                    meta:resourcekey="Label32Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbPersonal1" runat="server"
                    meta:resourcekey="cbOption1Resource1" />
            </td>
            <td>
                <asp:Label ID="Label33" runat="server" Text="個人資料2"
                    meta:resourcekey="Label33Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbPersonal2" runat="server"
                    meta:resourcekey="cbOption2Resource1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label34" runat="server" Text="個人資料3"
                    meta:resourcekey="Label34Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbPersonal3" runat="server"
                    meta:resourcekey="cbOption3Resource1" />
            </td>
            <td>
                <asp:Label ID="Label35" runat="server" Text="個人資料4"
                    meta:resourcekey="Label35Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbPersonal4" runat="server"
                    meta:resourcekey="cbOption4Resource1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label36" runat="server" Text="個人資料5"
                    meta:resourcekey="Label36Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbPersonal5" runat="server"
                    meta:resourcekey="cbOption5Resource1" />
            </td>
            <td>
                <asp:Label ID="Label37" runat="server" Text="個人資料6"
                    meta:resourcekey="Label37Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbPersonal6" runat="server"
                    meta:resourcekey="cbOption6Resource1" />
            </td>
        </tr>
    </asp:Panel>
    <tr>
        <td colspan="4" align="center" class="PopTableHeader">
            <center>
                <asp:Label ID="lblCustomColumn" runat="server" Text="自訂欄位顯示名稱" 
                    meta:resourcekey="lblCustomColumnResource1"></asp:Label>
            </center>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label23" runat="server" Text="其它1"
                meta:resourcekey="Label23Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOptionA" runat="server"
                meta:resourcekey="txtOptionAResource1"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label24" runat="server" Text="其它2"
                meta:resourcekey="Label24Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOptionB" runat="server"
                meta:resourcekey="txtOptionBResource1"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label25" runat="server" Text="其它3"
                meta:resourcekey="Label25Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOptionC" runat="server"
                meta:resourcekey="txtOptionCResource1"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label26" runat="server" Text="其它4"
                meta:resourcekey="Label26Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOptionD" runat="server"
                meta:resourcekey="txtOptionDResource1"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label27" runat="server" Text="其它5"
                meta:resourcekey="Label27Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOptionE" runat="server"
                meta:resourcekey="txtOptionEResource1"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label28" runat="server" Text="其它6"
                meta:resourcekey="Label28Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOptionF" runat="server"
                meta:resourcekey="txtOptionFResource1"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="4" align="center" class="PopTableHeader">
            <center>
                <asp:Label ID="Label38" runat="server" Text="個人資料欄位顯示名稱" 
                    meta:resourcekey="Label38Resource1"></asp:Label>
            </center>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label39" runat="server" Text="個人資料1"
                meta:resourcekey="Label39Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtPersonalA" runat="server"
                meta:resourcekey="txtPersonalAResource1"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label40" runat="server" Text="個人資料2"
                meta:resourcekey="Label40Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtPersonalB" runat="server"
                meta:resourcekey="txtPersonalBResource1"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label41" runat="server" Text="個人資料3"
                meta:resourcekey="Label41Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtPersonalC" runat="server"
                meta:resourcekey="txtPersonalCResource1"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label42" runat="server" Text="個人資料4"
                meta:resourcekey="Label42Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtPersonalD" runat="server"
                meta:resourcekey="txtPersonalDResource1"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label43" runat="server" Text="個人資料5"
                meta:resourcekey="Label43Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtPersonalE" runat="server"
                meta:resourcekey="txtPersonalEResource1"></asp:TextBox>
        </td>
        <td>
            <asp:Label ID="Label44" runat="server" Text="個人資料6"
                meta:resourcekey="Label44Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtPersonalF" runat="server"
                meta:resourcekey="txtPersonalFResource1"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="4" align="center">
            <center>
                <telerik:RadButton ID="ibtnSave" runat="server" Text="儲存" 
                    onclick="ibtnSave_Click" meta:resourcekey="ibtnSaveResource1">
                </telerik:RadButton>
            </center>
        </td>
    </tr>
</table>

<asp:Label ID="lblFieldPermissionExample" runat="server" Text="外部會員欄位權限設定說明" Visible="false" meta:resourcekey="lblFieldPermissionExampleResource1"></asp:Label>