<%@ Control Language="C#" AutoEventWireup="true" Inherits="System_Config_UC_ColorPalette" Codebehind="UC_ColorPalette.ascx.cs" %>

<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register assembly="Ede.Uof.Utility.Component.Grid" namespace="Ede.Uof.Utility.Component" tagprefix="Fast" %>


<script type="text/javascript">
    function ColorMenu(bluezz) {
        targetId = bluezz;
        targetElement = $("#"+targetId);
        if (targetElement.css("display")=="none") {
            targetElement.show();
        } else {
            targetElement.hide();
        }

    }


</script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
           <table cellpadding=0 cellspacing=0>
            <tr>
                <td style="  vertical-align:top;">
                    <asp:TextBox ID="txtColor" runat="server" style="display:none" ></asp:TextBox>
                    <asp:Label ID="lblColorValue" runat="server" Text="" ></asp:Label>
                    &nbsp;
                </td>
                <td style=" vertical-align: top;">
                    <asp:Image ID="imgSelectColor" runat="server" 
                        ImageUrl="~/Common/images/Icon/fontcolor_down.gif" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div ID="PlateID" runat="server" class="Plate" 
                        style="display:none;position: relative;">
                        <asp:Literal ID="ltColor" runat="server"></asp:Literal>
                    </div>
                </td>
            </tr>
           </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Label ID="lblSelectColor" runat="server" Text="請選取顏色" Visible="false"></asp:Label>
    



    


    



    

