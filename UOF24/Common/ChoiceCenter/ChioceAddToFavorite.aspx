<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Common_ChoiceCenter_ChioceAddToFavorite" Title="加到常用組合" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ChioceAddToFavorite.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        var IsValid = false;
        function AddFavorite() {
            if (IsValid) {
                var curwindow = $uof.dialog.getOpener();
                var pd;
                if (curwindow) {
                    pd = curwindow;
                } else{ 
                    pd = dialogArguments;
                }

                $.ajax({
                    url: "ChoiceHandler.ashx",
                    type: "POST",
                    dataType: "json",
                    data: { "action": "AddFavorite", "name": $get('<%=txbName.ClientID %>').value, "data": pd.Choice.Config.resultUserSet.toSring() }
                }).done(function (response, textStatus, jqXHR) {
                    pd.Choice.addFavorite($get('<%=txbName.ClientID %>').value, response);
                $uof.dialog.close();
            }).fail(function (jqXHR, textStatus, errorThrown) {
                console.error(
                    "The following error occured: " +
                        textStatus, errorThrown
                );
            });

        }

        return false;
    }

    function CustomValidator1Valid(src, args) {
        var result;
        $.ajax({
            url: "ChoiceHandler.ashx",
            type: "POST",
            dataType: "json",
            async: false,
            data: { "action": "CheckFavoriteName", "name": $get('<%=txbName.ClientID %>').value }
    }).done(function (response, textStatus, jqXHR) {
        result = response;
    }).fail(function (jqXHR, textStatus, errorThrown) {
        console.error(
            "The following error occured: " +
                textStatus, errorThrown
        );
    });

    if (result == undefined) {
        alert("server error");
    }
    else {
        if (result == true) {
            args.IsValid = false;
            IsValid = false;
        }
        else {
            IsValid = true;
        }
    }
}

    </script>
    <table width="100%" class="PopTable" cellspacing="1">
        <tr>
            <td>
                <asp:Label ID="lbName" runat="server" Text="名稱" meta:resourcekey="lbNameResource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txbName" runat="server" MaxLength="50" meta:resourcekey="txbNameResource1"></asp:TextBox><asp:CustomValidator
                    ID="CustomValidator1" runat="server" ErrorMessage="名稱已經存在" Display="Dynamic" ControlToValidate="txbName" ClientValidationFunction="CustomValidator1Valid" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="請輸入名稱" ControlToValidate="txbName" Display="Dynamic" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
</asp:Content>
