<%@ Page Title="結算類別維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="AddSETT.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.Settlement.Stage.AddSETT" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function ConfirmDEL() {

            var settid = [$("#<%=hfSETT_ID.ClientID%>").val()];
            var msg = $uof.pageMethod.sync("CheckSETTUsed", settid);
            if (msg == "false" || msg == "") {
                return confirm('<%=lblConfirmDEL.Text %>');
            }
            else {
                alert('<%=lblCanotDEL.Text %>' + "\n\r" + msg);
                return false;
            }


        }

    </script>
    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td style=" white-space:nowrap;"><span style="color: #ff0000">*</span><asp:Label ID="lblSETTName" runat="server" 
                Text="類別名稱" meta:resourcekey="lblSETTNameResource1"></asp:Label></td>
            <td style="width:100%">
                <asp:TextBox ID="txtSETTName" runat="server" MaxLength="50" Width="100%" meta:resourcekey="txtSETTNameResource1" ></asp:TextBox>                
                <asp:CustomValidator ID="CVName" runat="server" ErrorMessage="必須輸入" Display="Dynamic" OnServerValidate="CustomValidator_ServerValidate" meta:resourcekey="ReqVailNameResource1"></asp:CustomValidator>
                <asp:CustomValidator ID="CVNameExists" runat="server" ErrorMessage="類別名稱已存在" Display="Dynamic" OnServerValidate="CustomValidator_ServerValidate" meta:resourcekey="CVNameExistsResource1"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style=" white-space:nowrap;"><span style="color: #ff0000">*</span><asp:Label ID="lblSETTTime" runat="server"
                Text="結算時間" meta:resourcekey="lblSETTTimeResource1"></asp:Label></td>
            <td>
                <table style="width:100%;padding: 0px 0px 0px 0px;border:0px;border-spacing:0px 0px;text-align:left">
                    <tr>
                        <td style="text-wrap:none;">
                            <asp:DropDownList ID="ddlTime" runat="server" meta:resourcekey="ddlTimeResource1"></asp:DropDownList>                            
                            <asp:CustomValidator ID="CVTime" runat="server" ErrorMessage="必須選擇" Display="Dynamic" OnServerValidate="CustomValidator_ServerValidate" meta:resourcekey="ReqVailTimeResource1"></asp:CustomValidator>

                        </td>
                        <td style="width:5px">&nbsp;</td>
                        <td style="text-wrap:none;">
                            <asp:DropDownList ID="ddlTimeZone" runat="server" meta:resourcekey="ddlTimeZoneResource1"></asp:DropDownList>                            
                            <asp:CustomValidator ID="CVZone" runat="server" ErrorMessage="必須選擇" Display="Dynamic" OnServerValidate="CustomValidator_ServerValidate" meta:resourcekey="ReqVailZoneResource1"></asp:CustomValidator>
                        </td>
                        <td style="width:80%">&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>

        </tr>
        <tr>
            <td style=" white-space:nowrap;">
                <asp:Label ID="lblRemark" runat="server"
                    Text="備註" meta:resourcekey="lblRemarkResource1"></asp:Label></td>
            <td style="width:100%">
                <asp:TextBox ID="txtRemark" Width="100%" runat="server" Rows="3" TextMode="MultiLine" meta:resourcekey="txtRemarkResource1" ></asp:TextBox></td>
        </tr>
        <tr>
            <td style=" white-space:nowrap;">
                <asp:Label ID="lblRMID" runat="server"
                    Text="期別維護人員" meta:resourcekey="lblRMIDResource1"></asp:Label></td>
            <td>
                <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" />
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfSETT_ID" runat="server" />
    <asp:HiddenField ID="hfRM_ID" runat="server" />
    <asp:Label ID="lblDEL" runat="server" Text="刪除" Visible="False" meta:resourcekey="lblDELResource1"></asp:Label>
    <asp:Label ID="lblConfirmDEL" runat="server" Text="確定要刪除嗎？刪除類別會連同相關期別設定一起刪除。" Visible="False" meta:resourcekey="lblConfirmDELResource1"></asp:Label>
    <asp:Label ID="lblCanotDEL" runat="server" Text="尚有以下使用者設定使用此類別，不能刪除。" Visible="False" meta:resourcekey="lblCanotDELResource1"></asp:Label>
    <asp:Label ID="lblSelect" runat="server" Text="請選擇" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
</asp:Content>
