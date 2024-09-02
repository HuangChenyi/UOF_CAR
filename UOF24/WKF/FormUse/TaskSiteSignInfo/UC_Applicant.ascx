<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormUse_TaskSiteSignInfo_UC_Applicant" Codebehind="UC_Applicant.ascx.cs" %>
  <%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagName="UC_ChoiceList"
    TagPrefix="uc1" %> 
<br />
<table cellspacing="1px" width="600px" cellpadding="2px">
    <tr>
        <td style="text-align: center; background-image: url(<%=themePath %>/images/headerbg.gif); width: 30%;">
            <asp:Label ID="Label4" runat="server" CssClass="j"
                Text="申請資訊" meta:resourcekey="Label4Resource1"></asp:Label></td>
        <td width="77%" align="right">
            <asp:Table ID="Table1" runat="server">
            </asp:Table>
        </td>
    </tr>
    <tr>
        <td style="background-color: #e3e3e3; border: 2px; border-style: solid; border-color: #e3e3e3;" colspan="2">
            <table cellpadding="0" cellspacing="0" width="100%" style="border: 2px; border-style: solid; border-color: #e3e3e3;">
                <tr style="border: 1px; padding: 2px; border-style: solid; border-color: #e3e3e3;">
                    <td style="text-align: left; background-color: #ffffff; width: 50%; border: 1px; padding: 2px; border-style: solid; border-color: #e3e3e3;">&nbsp;<asp:Label ID="Label3" runat="server"
                        Text="申請人：" meta:resourcekey="Label3Resource1"></asp:Label>
                        <asp:Label ID="lblApplicant" runat="server" meta:resourcekey="lblApplicantResource1"></asp:Label></td>
                    <td style="text-align: left; background-color: #ffffff; width: 50%; border: 1px; padding: 2px; border-style: solid; border-color: #e3e3e3;">&nbsp;<asp:Label ID="Label5" runat="server" Text="部門：" meta:resourcekey="Label5Resource1"></asp:Label>
                        <asp:Label ID="lblDepartment" runat="server" meta:resourcekey="lblDepartmentResource1"></asp:Label></td>
                </tr>
                <tr style="border: 1px; padding: 2px; border-style: solid; border-color: #e3e3e3;">
                    <td style="border: 1px; padding: 2px; border-style: solid; border-color: #e3e3e3; text-align: left; background-color: #ffffff; width: 50%">
                        <table border="0px" style="border-style: none;" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td style="width: 100px">
                                    <asp:Label ID="Label1" runat="server" Text="歸檔者：" meta:resourcekey="Label1Resource1"></asp:Label></td>
                                <td>
                                    <uc1:UC_ChoiceList ID="UC_ChoiceListArchiveUser" runat="server" ShowMember="False"></uc1:UC_ChoiceList>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="left" style="background-color:#ffffff" colspan="0">
                        <asp:Label ID="Label2" runat="server" Text="申請者意見：" meta:resourcekey="Label2Resource1"></asp:Label>
                        <asp:Label ID="lblApplicantComment" runat="server" meta:resourcekey="lblApplicantCommentResource1"></asp:Label></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<br />
<asp:Image ID="Image1" runat="server" ImageUrl="~/Common/Images/Icon/icon_m54.gif" meta:resourcekey="Image1Resource1" />
