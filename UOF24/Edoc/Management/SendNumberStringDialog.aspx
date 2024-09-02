<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SendNumberStringDialog.aspx.cs" Inherits="Ede.Uof.Web.Edoc.Management.SendNumberStringDialog" %>

<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .cssHidden {
            display: none;
        }
    </style>

    <script type="text/javascript">
        function CheckNumberStringType(source, arguments) {

            // 新增時判斷是否有填寫字號類別
            if ($("#<%=txtNumberStringType.ClientID%>").val() == '') {
                $("#<%=cvCheck.ClientID%>")[0].innerText = $("#<%=lblNotNull.ClientID%>").text();
                arguments.IsValid = false;
            }
            else {
                // 檢查字號類別是否已經存在
                var isExist = $uof.pageMethod.sync("CheckNumberStrTypeExist", [$("#<%=txtNumberStringType.ClientID%>").val()]);
                if (isExist === 'true') {
                    $("#<%=cvCheck.ClientID%>")[0].innerText = $("#<%=lblIsExist.ClientID%>").text();
                }
                arguments.IsValid = (isExist === 'false');
            }
        }


        function CheckNumberStringUCList(source, arguments) {

            if ($("#<%=hfUCList.ClientID%>").val() == '') {
                arguments.IsValid = false;
            }
        }

        function ConfirmDelete() {

            var data = [$("#<%=hfNumberStringGuid.ClientID%>").val(), $("#<%=hfOrgId.ClientID%>").val()];

            var checkDelete = $uof.pageMethod.sync("CheckNumberStrUsed", data);
            if (checkDelete === 'true') {

                //未使用過可以刪除
                if (confirm('<%=lblConfirmDelete.Text%>')) {
                    return true;
                }
                else {
                    return false;
                }
            }
            else {
                //使用過不可刪除
                document.getElementById('delError').style.display = "inherit";
                return false;
            }


        }

    </script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="PopTable" style="width:100%">
                <tr>
                    <td nowrap>
                        <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text="字號類別"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNumberStringType" runat="server" Style="width: 100%;"></asp:TextBox>
                        <asp:CustomValidator ID="cvCheck" runat="server" Display="Dynamic" ></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td nowrap>
                        <asp:Label ID="Label2" runat="server" Text="說明"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDescription" Rows="3" runat="server" TextMode="MultiLine" Style="width: 100%;"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="狀態"></asp:Label>
                    </td>
                    <td>
                        <asp:CheckBox ID="cbOn" runat="server" />
                        <asp:Label ID="Label5" runat="server" Text="啟用"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <asp:Label ID="Label6" runat="server" Text="可使用人員"></asp:Label>
                    </td>
                    <td>

                        <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ExpandToUser="false" ShowMember="false" />
                        <asp:CustomValidator ID="CustomValidator1" ErrorMessage="請選擇人員" Display="Dynamic" runat="server"></asp:CustomValidator>
                    </td>
                </tr>

            </table>
            <div id="delError" style="display:none">
                <asp:Label ID="lblDeleteError" runat="server" Text="此字號類別已被使用過，不可刪除" ForeColor="Red" ></asp:Label>
            </div>

            <asp:Label ID="lblNotNull" runat="server" Text="請輸入字號類別" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblIsExist" runat="server" Text="此字號類別已經存在，無法新增" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblNullUserSet" runat="server" Text="請選擇人員" CssClass="cssHidden"></asp:Label>
            
            <asp:Label ID="lblConfirmDelete" runat="server" Text="確定要刪除嗎？" CssClass="cssHidden"></asp:Label>
            <asp:Label ID="lblDeleteString" runat="server" Text="刪除" CssClass="cssHidden"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hfUCList" runat="server" />
    <asp:HiddenField ID="hfOrgId" runat="server" />
    <asp:HiddenField ID="hfNumberStringGuid" runat="server" />
</asp:Content>
