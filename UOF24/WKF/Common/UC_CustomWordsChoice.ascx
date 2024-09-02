<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_CustomWordsChoice.ascx.cs" Inherits="Ede.Uof.Web.WKF.Common.UC_CustomWordsChoice" %>
<style>
    .DropDownCustomWordsType > .rddlInner {
        border-color:grey;
        background-color:white;
    }

    .DropDownCustomWordsType > .rddlInner.rddlFocused {
        background-color: #25a0da;
    }

</style>
<asp:UpdatePanel ID="updatepanel1" runat="server">
    <ContentTemplate>
        <table style="width:100%">
            <tr>
                <td>
                    <telerik:RadDropDownList ID="ddlCustomWordsType" runat="server" OnSelectedIndexChanged="ddlCustomWords_SelectedIndexChanged1"
                            AutoPostBack="True" CausesValidation="False" CssClass="DropDownCustomWordsType" meta:resourcekey="ddlCustomWordsTypeResource1">                            
                    </telerik:RadDropDownList>
                </td>
            </tr>
            <tr id="trCustomWords" runat="server" style="display:none">
                <td runat="server">
                    <table class="PopTable" style="width:400px" id="tbCustomWords" runat="server">
                        <tr style="width:100%" runat="server">
                            <td class="PopTableLeftTD" style="width:calc(100%/4);text-align:center!important" runat="server">
                                <asp:Label ID="lblOriginal" runat="server" Text="原字詞" meta:resourcekey="lblOriginalResource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" style="width:calc(100%/4);text-align:center!important" runat="server">
                                <asp:Label ID="lblApprove" runat="server" Text="同意" meta:resourcekey="lblApproveResource1"></asp:Label>
                            </td>
                            <td id="tdDisapprove1" runat="server" class="PopTableRightTD" style="width:calc(100%/4);text-align:center!important">
                                <asp:Label ID="lblDisapprove" runat="server" Text="否決" meta:resourcekey="lblDisapproveResource1"></asp:Label>
                            </td>
                            <td id="tdReturn1" runat="server" class="PopTableRightTD" style="width:calc(100%/4);text-align:center!important">
                                <asp:Label ID="lblReturn" runat="server" Text="退簽" meta:resourcekey="lblReturnResource1"></asp:Label>
                            </td>
                        </tr>

                        <tr style="width:100%" runat="server">
                            <td class="PopTableLeftTD" style="width:calc(100%/4);text-align:center!important" runat="server">
                                <asp:Label ID="lblCustom" runat="server" Text="自訂字詞" meta:resourcekey="lblCustomResource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" style="width:calc(100%/4);text-align:center" runat="server">
                                <asp:Label ID="lblCustomApprove" runat="server" ></asp:Label>
                            </td>
                            <td id="tdDisapprove2" runat="server"  class="PopTableRightTD" style="width:calc(100%/4);text-align:center">
                                <asp:Label ID="lblCustomDisapprove" runat="server" ></asp:Label>
                            </td>
                            <td id="tdReturn2" runat="server" class="PopTableRightTD" style="width:calc(100%/4);text-align:center">
                                <asp:Label ID="lblCustomReturn" runat="server" ></asp:Label>
                            </td>
                        </tr>
                    </table>

                    <table class="PopTable" style="width:100%" id="tbMobileCustomWords" runat="server" visible="False">
                        <tr style="width:100%" runat="server">
                            <td class="PopTableLeftTD" style="text-align:center !important;width:50%" runat="server">
                                <asp:Label ID="lblMobileOriginal" runat="server" Text="原字詞" meta:resourcekey="lblMobileOriginalResource1"></asp:Label>
                            </td>
                            <td class="PopTableLeftTD" style="text-align:center !important;width:50%" runat="server">
                                <asp:Label ID="lblMobileCustom" runat="server" Text="自訂字詞" meta:resourcekey="lblMobileCustomResource1"></asp:Label>
                            </td>
                        </tr>

                        <tr style="width:100%" runat="server">
                            <td class="PopTableRightTD" style="text-align:center" runat="server">
                                <asp:Label ID="lblMobileApprove" runat="server"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" style="text-align:center" runat="server">
                                 <asp:Label ID="lblMobileCustomApprove" runat="server" ></asp:Label>
                            </td>
                        </tr>

                        <tr style="width:100%" id="trMobileDisapprove" runat="server">
                            <td class="PopTableRightTD" style="text-align:center" runat="server">
                                 <asp:Label ID="lblMobileDisapprove" runat="server"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" style="text-align:center" runat="server">
                                <asp:Label ID="lblMobileCustomDisapprove" runat="server" ></asp:Label>
                            </td>
                        </tr>
                         
                        <tr style="width:100%" id="trMobileReturn" runat="server">
                            <td class="PopTableRightTD" style="text-align:center" runat="server">
                                 <asp:Label ID="lblMobileReturn" runat="server"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" style="text-align:center" runat="server">
                                <asp:Label ID="lblMobileCustomReturn" runat="server" ></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <asp:Label ID="lblDefault" runat="server" Text="預設" Visible="False" meta:resourcekey="lblDefaultResource1"></asp:Label>
        <asp:HiddenField ID="hfCustomWords" runat="server" />
        <asp:HiddenField ID="hfDefaultEnable" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>