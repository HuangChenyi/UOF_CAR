<%@ Page Title="維護IP範圍" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="IPRangeEdit.aspx.cs" Inherits="System_IPRange_IPRangeEdit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function CheckPositionPerson(sender, args) {
            if ($("#<%= hfUserSet.ClientID %>").val()) {
                  if (Number($("#<%= hfUserSet.ClientID %>").val()) <= 0) {
                      args.IsValid = false;
                      return;
                  }
              }
              else {
                  args.IsValid = false;
                  return;
              }
          }
</script>
    <asp:CustomValidator ID="cusVaildCompareIP" runat="server" ErrorMessage="IP(起)不可大於IP(訖)" Display="Dynamic" ForeColor="Red" meta:resourcekey="CusVailEndBeginResource1"></asp:CustomValidator>
    <table class="PopTable">
        <tr>
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="lblMark1" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblMark1Resource1"></asp:Label>
                <asp:Label ID="lblBegin" runat="server" Text="IP(起)" meta:resourcekey="lblBeginResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space:nowrap">
                <asp:TextBox ID="txtBegin" runat="server" meta:resourcekey="txtBeginResource1"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="rfieldValidtxtBegin" runat="server" ErrorMessage="必須輸入" ForeColor="Red"
                    ControlToValidate="txtBegin" Display="Dynamic" SetFocusOnError="True" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="reValidtxtBegin" runat="server" ErrorMessage="IP格式不正確" ForeColor="Red" 
                    ValidationExpression="^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$"
                    ControlToValidate="txtBegin" Display="Dynamic" SetFocusOnError="True" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="lblMark2" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblMark2Resource1"></asp:Label>
                <asp:Label ID="lblEnd" runat="server" Text="IP(訖)" meta:resourcekey="lblEndResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space:nowrap">
                <asp:TextBox ID="txtEnd" runat="server" meta:resourcekey="txtEndResource1"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="rfValidtxtEnd" runat="server" ErrorMessage="必須輸入" ForeColor="Red"
                    ControlToValidate="txtEnd" Display="Dynamic" SetFocusOnError="True" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="reValidtxtEnd" runat="server" ErrorMessage="IP格式不正確" ForeColor="Red"
                    ValidationExpression="^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$"
                    ControlToValidate="txtEnd" Display="Dynamic" SetFocusOnError="True" meta:resourcekey="RegularExpressionValidator2Resource1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="lblMark3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblMark3Resource1"></asp:Label>
                <asp:Label ID="lblPeople" runat="server" Text="人員" meta:resourcekey="lblPeopleResource1"></asp:Label>
            </td>
            <td colspan="3" style="white-space:nowrap">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <uc1:uc_choicelist runat="server" id="UC_ChoiceList" showmember="false" expandtouser="false" />
                        <asp:HiddenField ID="hfUserSet" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                &nbsp;
                <asp:CustomValidator ID="cusValidCheckPerson" runat="server" ErrorMessage="請選擇人員" ClientValidationFunction="CheckPositionPerson" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>

            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="white-space:nowrap">
                <asp:Label ID="lblRemark" runat="server" Text="備註" meta:resourcekey="lblRemarkResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD" style="white-space:nowrap">
                <asp:TextBox ID="txtRemark" runat="server" MaxLength="255" meta:resourcekey="txtRemarkResource1"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hfRangeGuid" runat="server"/>
</asp:Content>
