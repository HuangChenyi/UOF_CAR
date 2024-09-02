<%@ Control Language="C#" AutoEventWireup="true" Inherits="System_Config_EmployeeColumn" Codebehind="EmployeeColumn.ascx.cs" %>
    
<asp:Label ID="lblMsgSave" runat="server" Text="儲存成功" Visible="false" ForeColor="Blue"  meta:resourcekey="lblMsgSaveResource1"></asp:Label>
 
<table class="PopTable" cellspacing="1" width="100%" >
    <%-- 欄位權限顯示 --%>
    <tr>
        <td colspan="4" align="center" class="PopTableHeader" >
            <center>
                <asp:Label ID="lblControlColumnDisplay" runat="server" Text="欄位權限設定" meta:resourcekey="lblControlColumnDisplayResource1"></asp:Label>
                <asp:LinkButton ID="lbtnOptionExample" runat="server" Text="(選項說明)" ForeColor="Blue" meta:resourcekey="lbtnOptionExampleResource1"></asp:LinkButton>
            </center>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="名稱" meta:resourcekey="Label1Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbAccount" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewAccount" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyAccount" runat="server" Text ="使用者可修改" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label2" runat="server" Text="身分證字號" meta:resourcekey="Label2Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbSid" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewSid" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifySid" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="性別" meta:resourcekey="Label3Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbSex" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewSex" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifySex" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label4" runat="server" Text="生日" meta:resourcekey="Label4Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbBirthday" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewBirthday" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyBirthday" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label5" runat="server" Text="行動電話" meta:resourcekey="Label5Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbMobile" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewMobile" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyMobile" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label6" runat="server" Text="到職日" meta:resourcekey="Label6Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbArriveDate" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewArriveDate" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyArriveDate" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label7" runat="server" Text="學歷" meta:resourcekey="Label7Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbEducId" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewEducId" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyEducId" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label8" runat="server" Text="地址" meta:resourcekey="Label8Resource1"></asp:Label>
        </td>
        <td>
           <asp:CheckBox ID="cbAddress" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewAddress" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyAddress" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label9" runat="server" Text="電子郵件" meta:resourcekey="Label9Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbEmail" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewEmail" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyEmail" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label10" runat="server" Text="電子郵件1" meta:resourcekey="Label10Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbEmailA" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewEmailA" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyEmailA" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label11" runat="server" Text="電子郵件2" meta:resourcekey="Label11Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbEmailB" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewEmailB" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyEmailB" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label12" runat="server" Text="電子郵件3" meta:resourcekey="Label12Resource1"></asp:Label>
        </td>
        <td>
           <asp:CheckBox ID="cbEmailC" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewEmailC" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyEmailC" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label13" runat="server" Text="電子郵件4" meta:resourcekey="Label13Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbEmailD" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewEmailD" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyEmailD" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label14" runat="server" CssClass="HiddenUserUnusedColumn" Text="MSN信箱" meta:resourcekey="Label14Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbMsn" runat="server" CssClass="HiddenUserUnusedColumn" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewMsn" CssClass="HiddenUserUnusedColumn" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyMsn" CssClass="HiddenUserUnusedColumn" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr class="HiddenUserUnusedColumn">
        <td>
            <asp:Label ID="Label15" runat="server" Text="QQ" meta:resourcekey="Label15Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbQQ" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewQQ" CssClass="HiddenUserUnusedColumn" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyQQ" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label16" runat="server" Text="Yahoo即時通" meta:resourcekey="Label16Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbYahoo" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewYahoo" CssClass="HiddenUserUnusedColumn" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyYahoo" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label17" runat="server" Text="BLOG" meta:resourcekey="Label17Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbBlog" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewBlog" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyBlog" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label18" runat="server" Text="Skype" meta:resourcekey="Label18Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbSkype" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewSkype" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifySkype" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />                    
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label19" runat="server" Text="緊急電話" meta:resourcekey="Label19Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbEmergency" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewEmergency" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyEmergency" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label20" runat="server" Text="分機" meta:resourcekey="Label20Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbExtNum" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewExtNum" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyExtNum" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <%-- 網路電話 --%>
    <tr id="trWebphone" runat="server">
         <td>
             <asp:Label ID="lblWebPhone1" runat="server" Text="網路分機1" meta:resourcekey="lblWebPhone1Resource1"></asp:Label>
         </td>
         <td>
             <asp:CheckBox ID="cbWebPhone1" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
             <asp:CheckBox ID="cbLimitViewWebPhone1" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
             <asp:CheckBox ID="cbIsModifyWebPhone1" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
         </td>
         <td>
             <asp:Label ID="lblWebPhone2" runat="server" Text="網路分機2" meta:resourcekey="lblWebPhone2Resource1"></asp:Label>
         </td>
         <td>
             <asp:CheckBox ID="cbWebPhone2" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
             <asp:CheckBox ID="cbLimitViewWebPhone2" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
             <asp:CheckBox ID="cbIsModifyWebPhone2" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
         </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label21" runat="server" Text="專長" meta:resourcekey="Label21Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbSkill" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewSkill" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifySkill" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
           <asp:Label ID="Label47" runat="server" Text="討論區簽名" meta:resourcekey="Label47Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbSign" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewSign" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifySign" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label40" runat="server" Text="電子簽章" meta:resourcekey="Label40Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbElecSign" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewElecSign" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyElecSign" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label48" runat="server" Text="私人訊息簽名" meta:resourcekey="Label48Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbMessageSign" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewMessageSign" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyMessageSign" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label29" runat="server" Text="其它1" meta:resourcekey="Label29Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbOption1" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewOption1" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyOption1" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label30" runat="server" Text="其它2" meta:resourcekey="Label30Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbOption2" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewOption2" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyOption2" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label31" runat="server" Text="其它3" meta:resourcekey="Label31Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbOption3" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewOption3" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyOption3" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label32" runat="server" Text="其它4" meta:resourcekey="Label32Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbOption4" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewOption4" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyOption4" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label33" runat="server" Text="其它5" meta:resourcekey="Label33Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbOption5" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewOption5" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyOption5" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
        <td>
            <asp:Label ID="Label34" runat="server" Text="其它6" meta:resourcekey="Label34Resource1"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="cbOption6" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            <asp:CheckBox ID="cbLimitViewOption6" runat="server" Text ="限制觀看" meta:resourcekey="cbLimitViewResource1" />
            <asp:CheckBox ID="cbIsModifyOption6" runat="server" meta:resourcekey="cbIsModifyAccountResource1" />
        </td>
    </tr>
        
    <asp:Panel runat="server" Visible="False" meta:resourcekey="PanelResource1">
        <tr>
            <td>
                <asp:Label ID="Label22" runat="server" Text="個人資料1" meta:resourcekey="Label22Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbPersonal1" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            </td>
            <td>
                <asp:Label ID="Label35" runat="server" Text="個人資料2" meta:resourcekey="Label35Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbPersonal2" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label36" runat="server" Text="個人資料3" meta:resourcekey="Label36Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbPersonal3" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            </td>
            <td>
                <asp:Label ID="Label37" runat="server" Text="個人資料4" meta:resourcekey="Label37Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbPersonal4" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label38" runat="server" Text="個人資料5" meta:resourcekey="Label38Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbPersonal5" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            </td>
            <td>
                <asp:Label ID="Label39" runat="server" Text="個人資料6" meta:resourcekey="Label39Resource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbPersonal6" runat="server" Text ="可顯示" meta:resourcekey="cbAccountResource1" />
            </td>
        </tr>
    </asp:Panel>

    <%-- 自訂欄位顯示名稱 --%>
    <tr>
        <td  colspan="4" align="center" class="PopTableHeader">
            <center> 
                <asp:Label ID="lblCustomColumn" runat="server" Text="自訂欄位顯示名稱" meta:resourcekey="lblCustomColumnResource1"></asp:Label>
            </center>
        </td>
    </tr>
    <tr>
        <td> 
            <asp:Label ID="Label23" runat="server" Text="其它1" meta:resourcekey="Label23Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOption1" runat="server" meta:resourcekey="txtOption1Resource1"></asp:TextBox>
        </td>
        <td> 
            <asp:Label ID="Label24" runat="server" Text="其它2" meta:resourcekey="Label24Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOption2" runat="server" meta:resourcekey="txtOption2Resource1"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td> 
            <asp:Label ID="Label25" runat="server" Text="其它3" meta:resourcekey="Label25Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOption3" runat="server" meta:resourcekey="txtOption3Resource1"></asp:TextBox>
        </td>
        <td> 
            <asp:Label ID="Label26" runat="server" Text="其它4" meta:resourcekey="Label26Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOption4" runat="server" meta:resourcekey="txtOption4Resource1"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td> 
            <asp:Label ID="Label27" runat="server" Text="其它5" meta:resourcekey="Label27Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOption5" runat="server" meta:resourcekey="txtOption5Resource1"></asp:TextBox>
        </td>
        <td> 
            <asp:Label ID="Label28" runat="server" Text="其它6" meta:resourcekey="Label28Resource1"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtOption6" runat="server" meta:resourcekey="txtOption6Resource1"></asp:TextBox>
        </td>
    </tr>
    <%-- 個人資料欄位顯示名稱 --%>
    <tr>
        <td colspan="4" align="center" class="PopTableHeader">
          <center>
              <asp:Label ID="lblPersonalColumn" runat="server" Text="個人資料欄位顯示名稱" meta:resourcekey="lblPersonalColumnResource1"></asp:Label>
          </center>
        </td>
    </tr>
    <tr>
        <td><asp:Label ID="Label41" runat="server" Text="個人資料1" meta:resourcekey="Label41Resource1"></asp:Label></td>
        <td><asp:TextBox ID="txtPersonal1" runat="server" meta:resourcekey="txtPersonal1Resource1"></asp:TextBox></td>
        <td><asp:Label ID="Label42" runat="server" Text="個人資料2" meta:resourcekey="Label42Resource1"></asp:Label></td>
        <td><asp:TextBox ID="txtPersonal2" runat="server" meta:resourcekey="txtPersonal2Resource1"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="Label43" runat="server" Text="個人資料3" meta:resourcekey="Label43Resource1"></asp:Label></td>
        <td><asp:TextBox ID="txtPersonal3" runat="server" meta:resourcekey="txtPersonal3Resource1"></asp:TextBox></td>
        <td><asp:Label ID="Label44" runat="server" Text="個人資料4" meta:resourcekey="Label44Resource1"></asp:Label></td>
        <td><asp:TextBox ID="txtPersonal4" runat="server" meta:resourcekey="txtPersonal4Resource1"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="Label45" runat="server" Text="個人資料5" meta:resourcekey="Label45Resource1"></asp:Label></td>
        <td><asp:TextBox ID="txtPersonal5" runat="server" meta:resourcekey="txtPersonal5Resource1"></asp:TextBox></td>
        <td><asp:Label ID="Label46" runat="server" Text="個人資料6" meta:resourcekey="Label46Resource1"></asp:Label></td>
        <td><asp:TextBox ID="txtPersonal6" runat="server" meta:resourcekey="txtPersonal6Resource1"></asp:TextBox></td>
    </tr>
    <tr>
        <td colspan="4" align="center">
          <center>
              <telerik:RadButton ID="ibtnSave" runat="server" Text="儲存"  
                  meta:resourcekey="ibtnSaveResource1" onclick="ibtnSave_Click">
              </telerik:RadButton>
          </center>
        </td>
    </tr>
 </table>
 
<asp:Label ID="lblNoModify" runat="server" Text="此欄位不可修改" Visible="false"></asp:Label>
<asp:Label ID="lblFieldPermissionExample" runat="server" Text="內部員工欄位權限設定說明" Visible="false" meta:resourcekey="lblFieldPermissionExampleResource1"></asp:Label>