<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="EIP_Forum_EssenceSetting" Title="精華區設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="EssenceSetting.aspx.cs" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script id="telerikscript" type="text/javascript">
    function btnSetup_Clicking(sender, args)
    {        
        //Add code to handle your event here.        
        var boardID = $("#<%=dwnBoard.ClientID %>").val(); 
        $uof.dialog.open2("~/EIP/Forum/EssenceFolderSetting.aspx", sender, "", 500, 600, OpenDialogReturn,{"boardid":boardID});
        return false;
    }

    function OpenDialogReturn(returnValue) {        
        if (typeof (returnValue) == 'undefined')
            return false;
        else
            return true;
    }
</script>

<table width="100%" style="height:100%;"><tr><td style="height:600px; max-height:inherit;vertical-align:top">
     <table class="PopTable" cellspacing="0">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="討論區" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
                <asp:DropDownList ID="dwnArea" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dwnArea_SelectedIndexChanged" meta:resourcekey="dwnAreaResource1">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label2" runat="server" Text="討論版" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td >
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="conditional">
                    <ContentTemplate>
                <asp:DropDownList ID="dwnBoard" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dwnBoard_SelectedIndexChanged" meta:resourcekey="dwnBoardResource1">
                </asp:DropDownList>
                    </ContentTemplate> 
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dwnArea" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel></td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="Label3" runat="server" Text="精華區目錄設定" meta:resourcekey="Label3Resource1"></asp:Label></td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="conditional">
                    <ContentTemplate>
                        <telerik:RadButton ID="btnSetup" runat="server" Text="目錄設定" OnClick="btnSetup_Click" meta:resourcekey="btnSetupResource1" OnClientClicking="btnSetup_Clicking"></telerik:RadButton>
               
                        <br />
                        <telerik:RadTreeView ID="RadTreeView1" Runat="server"  EnableNodeTextHtmlEncoding="true"></telerik:RadTreeView>
                    </ContentTemplate> 
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSetup" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="dwnArea" EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="dwnBoard" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel> 
            </td>
        </tr>
    </table>
    <asp:Label ID="msgFoldersetup" runat="server" meta:resourcekey="msgFoldersetupResource1"
        Text="目錄設定" Visible="False"></asp:Label>
        </td></tr></table>
        
</asp:Content>

