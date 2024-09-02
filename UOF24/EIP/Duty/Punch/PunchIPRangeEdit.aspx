<%@ Page Title="維護IP範圍" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="CDS_HR_Punch_PunchIPRangeEdit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="PunchIPRangeEdit.aspx.cs" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">

        function CheckPositionPerson(sender, args) {
            if ($("#<%= hfUserSetCount.ClientID %>").val()) {
                if (Number($("#<%= hfUserSetCount.ClientID %>").val()) <= 0) {
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

    <asp:CustomValidator ID="CusVailEndBegin" runat="server" ErrorMessage="IP(起)不可大於IP(訖)" Display="Dynamic" 
        meta:resourcekey="CusVailEndBeginResource1"  ForeColor="Red">
    </asp:CustomValidator>

    <asp:Label ID="lblNotAllowEdit" runat="server" Text="不允許編輯" ForeColor="Red" Visible="False" meta:resourcekey="lblNotAllowEditResource1"></asp:Label>
    <asp:Label ID="lblAuthAlredayRemove" runat="server" Text="維護權限已被移除，請重新登入系統" ForeColor="Red" Visible="False" meta:resourcekey="lblAuthAlredayRemoveResource1"></asp:Label>

    <table id="tbMain" class="PopTable" runat="server">
        <tr>
            <td class="PopTableLeftTD">
                <font color="red">*</font><asp:Label ID="lblBegin" runat="server" Text="IP(起)" meta:resourcekey="lblBeginResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:TextBox ID="txtBegin" runat="server" meta:resourcekey="txtBeginResource1"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="必須輸入"  ForeColor="Red"
                    ControlToValidate="txtBegin" Display="Dynamic" SetFocusOnError="True" 
                    meta:resourcekey="RequiredFieldValidator1Resource1">
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="IP格式不正確" ForeColor="Red"
                    ControlToValidate="txtBegin" Display="Dynamic" ValidationExpression="^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$"
                    SetFocusOnError="True" 
                    meta:resourcekey="RegularExpressionValidator1Resource1">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <font color="red">*</font>
                <asp:Label ID="lblEnd" runat="server" Text="IP(訖)" meta:resourcekey="lblEndResource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:TextBox ID="txtEnd" runat="server" meta:resourcekey="txtEndResource1"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="必須輸入" ForeColor="Red"
                    ControlToValidate="txtEnd" Display="Dynamic" SetFocusOnError="True" meta:resourcekey="RequiredFieldValidator2Resource1">
                </asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="IP格式不正確"  ForeColor="Red"
                    ControlToValidate="txtEnd" Display="Dynamic" ValidationExpression="^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$"
                    SetFocusOnError="True" meta:resourcekey="RegularExpressionValidator2Resource1">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label5Resource1"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="人員" meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" ShowMember="false" ExpandToUser="false" LimitChoice="None" />
                        <asp:HiddenField ID="hfUserSetCount" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                
                &nbsp;
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請選擇人員" ClientValidationFunction="CheckPositionPerson" 
                    Display="Dynamic" meta:resourcekey="CustomValidator1Resource1">
                </asp:CustomValidator>
            </td>
        </tr>    
        <tr>
            <td>
                <asp:Label ID="lblStatus" runat="server" Text="狀態" meta:resourcekey="lblStatusResource1"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="cbActive" Checked="true" runat="server" />
                <asp:Label ID="lblActive" runat="server" Text="啟用" meta:resourcekey="lblActiveResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD">
                <asp:Label ID="lblRemark" runat="server" Text="備註" meta:resourcekey="lblRemarkResource1"></asp:Label>    
            </td>
            <td class="PopTableRightTD">
                <asp:TextBox ID="txtRemark" runat="server" MaxLength="255" meta:resourcekey="txtRemarkResource1"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
