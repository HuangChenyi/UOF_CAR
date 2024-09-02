<%@ Control Language="C#" AutoEventWireup="true"
    Inherits="WKF_FormManagement_UC_FieldControl" CodeBehind="UC_FieldControl.ascx.cs" %>
<%@ Register Src="../../Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %>

<script type="text/javascript">

    Sys.Application.add_load(function () {
        if ('<%=ControlsFrom%>' === "SetRequiredField") {
            <%=this.ClientID%>_OnRblInheritClick();
        }

        var rbYesRank = $("#<%=rbYesRank.ClientID%>");
        var rbNoRank = $("#<%=rbNoRank.ClientID%>");
        if (rbYesRank != null && rbYesRank[0].checked) {
            $("<%=divYesRank.ClientID%>").show();
            $("<%=divNoRank.ClientID%>").hide();
        }
        if (rbNoRank != null && rbNoRank[0].checked) {
            $("<%=divNoRank.ClientID%>").show();
            $("<%=divYesRank.ClientID%>").hide();
        }
    });

    function <%=this.ClientID%>_OnRblInheritClick() {
        var rbInherit = $('#<%=rbInherit.ClientID%>');
        var rbCustom = $('#<%=rbCustom.ClientID%>');
        var divCustomControl = $("#<%=divCustomControl.ClientID%>");
        if (rbInherit[0].checked) {
            divCustomControl.hide();
        }
        else if (rbCustom[0].checked) {
            divCustomControl.show();
            divCustomControl.css("margin-left", "15px");
        }
    }


    function <%=this.ClientID%>_DisplayControl(e) {
        var divYes = $('#<%=divYesRank.ClientID %>');
            var divNo = $('#<%=divNoRank.ClientID %>');

            var evt = e || window.event; // this assign evt with the event object

            var current = evt.target || evt.srcElement; // this assign current with the event target

            switch (current.value) {
                case "rbYes":
                case "rbNo":
                    {
                        divYes.hide();
                        divNo.hide();
                    }
                    break;


                case "rbNoRank":
                    {
                        divYes.hide();
                        divNo.show();
                    }

                    break;

                case "rbYesRank":
                    {
                        divYes.show();
                        divNo.hide();

                    }
                    break;



            }
    }

    //某角色才可輸入必填驗證
    function <%=ClientID%>_RequireValidateYes(sender, args) {
        var rbYesRank = $("#<%=rbYesRank.ClientID%>");
        var choiceListJSON = $("#<%=divYesRank.ClientID%> input[name*='hiddenJSON']").val();
        if (rbYesRank != null && rbYesRank[0].checked && (choiceListJSON == "" || choiceListJSON == '{"UserSet":{"Element":[]}}')) {
            args.IsValid = false;
        }
    }

    //某角色必須輸入必填驗證
    function <%=ClientID%>_RequireValidateNo(sender, args) {
        var rbNoRank = $("#<%=rbNoRank.ClientID%>");
        var choiceListJSON = $("#<%=divNoRank.ClientID%> input[name*='hiddenJSON']").val();
        if (rbNoRank != null && rbNoRank[0].checked && (choiceListJSON == "" || choiceListJSON == '{"UserSet":{"Element":[]}}')) {
            args.IsValid = false;
        }
    }

</script>
<div id="divIfInherit" runat="server">
    <table>
        <tr>
            <td>
                <asp:RadioButton ID="rbInherit" runat="server" Text="繼承欄位" onclick="OnRblInheritClick();" GroupName="IfInherit" meta:resourcekey="rbInheritResource1"></asp:RadioButton>
                <br />
                <asp:RadioButton ID="rbCustom" runat="server" Text="自訂" onclick="OnRblInheritClick();" GroupName="IfInherit" meta:resourcekey="rbCustomResource1"></asp:RadioButton>
            </td>
        </tr>
    </table>
</div>
<div id="divCustomControl" runat="server">
    <table cellspacing="1" width="100%">
        <tbody>
            <tr>
                <td colspan="2" style="height: 9px"></td>
            </tr>
            <tr>
                <td style="height: 24px">
                    <asp:RadioButton ID="rbYes" runat="server" meta:resourcekey="rbYesResource1" Text="允許空值"
                        Checked="True" GroupName="FieldControlType"></asp:RadioButton><br />
                    <br />
                </td>
                <td style="height: 24px">
                    <asp:RadioButton ID="rbNo" runat="server" meta:resourcekey="rbNoResource1" Text="起始不得為空值"
                        GroupName="FieldControlType"></asp:RadioButton><br />
                    <br />
                </td>
            </tr>
            <tr>
                <td valign="top" style="width: 50%">
                    <asp:RadioButton ID="rbYesRank" runat="server" meta:resourcekey="rbYesRankResource1"
                        Text="某角色才可輸入" GroupName="FieldControlType"></asp:RadioButton>
                    <div id="divYesRank" runat="server">
                        <uc1:UC_ChoiceList ID="UC_ChoiceList1" runat="server" ShowMember="true"></uc1:UC_ChoiceList>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" meta:resourcekey="CustomValidator1Resource1"
                            ErrorMessage="請選取角色" Display="Dynamic"></asp:CustomValidator>
                    </div>
                </td>
                <td valign="top" style="width: 50%">
                    <asp:RadioButton ID="rbNoRank" runat="server" meta:resourcekey="rbNoRankResource1"
                        Text="某角色必須輸入" GroupName="FieldControlType"></asp:RadioButton>
                    <div id="divNoRank" runat="server">
                        <uc1:UC_ChoiceList ID="UC_ChoiceList2" runat="server" ShowMember="true"></uc1:UC_ChoiceList>
                        <asp:CustomValidator ID="CustomValidator2" runat="server" meta:resourcekey="CustomValidator2Resource1"
                            ErrorMessage="請選取角色" Display="Dynamic"></asp:CustomValidator>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 6px" valign="top"></td>
            </tr>
        </tbody>
    </table>
</div>
