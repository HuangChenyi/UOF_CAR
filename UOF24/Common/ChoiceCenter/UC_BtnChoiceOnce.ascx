<%@ Control Language="C#" AutoEventWireup="true" Inherits="Common_ChoiceCenter_UC_BtnChoiceOnce" Codebehind="UC_BtnChoiceOnce.ascx.cs" %>

<telerik:RadButton ID="rdbtnChoiceOnce" runat="server" Text="" CausesValidation="False" OnClick="rdbtnChoiceOnce_Click"></telerik:RadButton>
<asp:Label ID="lbShowMember" runat="server" Visible="False" meta:resourcekey="lbShowMemberResource1"></asp:Label>
<asp:Label ID="lbShowSubDept" runat="server" Visible="False" meta:resourcekey="lbShowSubDeptResource1"></asp:Label>
<asp:Label ID="lbKind" runat="server" Visible="False" meta:resourcekey="lbKindResource1"></asp:Label>
<asp:Label ID="lbEditable" runat="server" Visible="False"></asp:Label>
<asp:Label ID="lbOnlyAvailable" runat="server" Visible="False"></asp:Label>
<asp:HiddenField ID="hidDisplayAllDept" runat="server" Value="0" />
