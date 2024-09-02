<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UC_WorldClock.ascx.cs" Inherits="Ede.Uof.Web.Basic.Personal.WorldClock.UC_WorldClock" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<style>
    .MainZone {
        line-height:1.5em;
        height: 100px;
        margin-top: 7px;
        text-align: left;
        white-space: nowrap;
        background-color: #fefacd;
        border-radius:5px;
        padding:10px;
        min-width:100px;
    }

    .divMainZone {
        margin-left: 10px;
        margin-right: 10px;
    }    

    .WorldClock {
        height:60px;
        text-align: left;
        white-space: nowrap;
        border-radius:5px;
        font-size:60px;
        font-style:Italic;
        color:#534741;
    }

    .ClockSecond {
        font-size:15px;
    }
    
    .WorldClock .ClockSecond {
        vertical-align:bottom;
    }

    .WorldClock td {
        vertical-align:middle;
    }    

    .MainZone_1 {
        margin-left:3em;
        margin-right:3em;
        padding-left:30px;
        padding-right:30px;
    }

    .MainZone_2 {
        margin-left:2em;
        margin-right:2em;
        padding-left:20px;
        padding-right:20px;
    }

    .MainZone_3 {
        margin-left:1em;
        margin-right:1em;
        padding-left:15px;
        padding-right:15px;
    }

    .MainZone_4 {
        margin-left:1em;
        margin-right:1em;
    }
</style>

<script>
    function WorldClockClick(sender, args)
    {
        var key = args.get_item().get_value();
        if (key == "Edit") {
            args.set_cancel(true);
            $uof.dialog.open2("~/Basic/Personal/WorldClock/EditWorldClock.aspx", args.get_item(), '<%=lblDialogTitle.Text%>', 400, 500, openWorldClockDialogResult);
        }
    }

    function openWorldClockDialogResult(returnValue)
    {
        if (typeof (returnValue) == 'undefined' || returnValue == null)
            return false;
        else {
            $("#<%=hidHasBind.ClientID%>").val("HasBind");
            return true;
        }
    }
</script>

<telerik:RadToolBar ID="RadToolBarWorldClock" runat="server" Width="100%" OnClientButtonClicking="WorldClockClick" OnButtonClick="RadToolBarWorldClock_ButtonClick" meta:resourcekey="RadToolBarWorldClockResource2" SingleClick="None">
    <Items>
        <telerik:RadToolBarButton runat="server" Text="選取時區" 
            Value="Edit" meta:resourcekey="RadToolBarWorldClockResource1">
        </telerik:RadToolBarButton>
        <telerik:RadToolBarButton runat="server" IsSeparator="True" meta:resourcekey="RadToolBarButtonResource1">
        </telerik:RadToolBarButton>
    </Items>
</telerik:RadToolBar>

<table style="width: 100%; table-layout: fixed; overflow: auto">
    <tr>
        <td>
            <asp:Panel runat="server" ID="WorldClockpanel" Style="height: auto;" ScrollBars="Auto" meta:resourcekey="WorldClockpanelResource1">
            </asp:Panel>
        </td>
    </tr>
</table>
<asp:Label ID="lblEmptyData" runat="server" Text="沒有資料" Visible="False" meta:resourcekey="lblEmptyDataResource1"></asp:Label>
<asp:Label ID="lblDialogTitle" runat="server" Text="選取時區" style="display:none" meta:resourcekey="lblDialogTitleResource1"></asp:Label>
<asp:HiddenField ID="hidHasBind" runat="server" />