<%@ Page Language="C#" Theme="DefaultTheme" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Common_UsbKey_ReadUSB" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="ReadUSB.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <script id="ReadMicroDog" type="text/javascript">
        function DogCheck() {
            var myUMHCtr = $('#UMHControl1').get(0);
            var errCode;
            myUMHCtr.cas = $("#<%=hideCas.ClientID %>").val();
    myUMHCtr.command = 1;
    errCode = myUMHCtr.OperateDog();
    $("#<%=hideErrorCode.ClientID %>").val(errCode);
    return errCode;
}
function GetCurrentNo() {
    var myUMHCtr = $('#UMHControl1').get(0);
    var errCode;
    myUMHCtr.cas = $("#<%=hideCas.ClientID %>").val();
    myUMHCtr.command = 5;
    myUMHCtr.password = $("#<%=hidePW.ClientID %>").val();
    errCode = myUMHCtr.OperateDog();
    if (errCode == 0) {
        $("#<%=hideErrorCode.ClientID %>").val(errCode);
        $("#<%=hideSerialNo.ClientID %>").val(myUMHCtr.result);
        return myUMHCtr.result;
    }
    else {
        $("#<%=hideErrorCode.ClientID %>").val(errCode);
        $("#<%=hideSerialNo.ClientID %>").val("");
        return "";
    }

}

function StartReadUSBKey() {
    $("#<%=lblInstallDriver.ClientID %>").css("display", "none");
    $("#<%=lblReadingMsg.ClientID %>").css("display", "");
    $("#<%=lblInsertUsbMsg.ClientID %>").css("display", "none");
    try {
        var errorcode = DogCheck();
        if (errorcode == 0) {
            var no = GetCurrentNo();
            if (no != "") {
                $uof.dialog.set_returnValue(no);
                $uof.dialog.close();
            }
        }
        else {
            $("#<%= lblInstallDriver.ClientID %>").css("display", "");
        }
    }
    catch (e) {
        $("#<%=lblInstallDriver.ClientID %>").css("display", "");
    }
    $("#<%=lblReadingMsg.ClientID %>").css("display", "none");
    $("#<%=lblInsertUsbMsg.ClientID %>").css("display", "");
}
$(function () {
    $("#<%=lblInstallDriver.ClientID %>").css("display", "none");
    $("#<%=lblInsertUsbMsg.ClientID %>").css("display", "none");
    StartReadUSBKey();
});

    </script>

    <asp:Label ID="lblReadingMsg" runat="server" Text="正在讀取USB Key..." ForeColor="Blue" meta:resourcekey="lblReadingMsgResource1"></asp:Label>
    <asp:Label ID="lblInsertUsbMsg" runat="server" Text="請插入USB Key" ForeColor="Red" meta:resourcekey="lblInsertUsbMsgResource1"></asp:Label><br />
    <asp:LinkButton ID="lblInstallDriver" runat="server" meta:resourcekey="lblInstallDriverResource1">安裝USB Key驅動程式</asp:LinkButton>

    <asp:Label ID="lblReadMsg" runat="server" Text="重新讀取" Visible="False" meta:resourcekey="lblReadMsgResource1"></asp:Label>
    <object id="UMHControl1" style="LEFT: 0px; TOP: 0px" height="0" width="0" classid="clsid:C4B873F4-099F-4DD7-88D2-2EF97EFE03E8">
            <param name="_Version" value="65536">
            <param name="_ExtentX" value="2646">
            <param name="_ExtentY" value="1323">
            <param name="_StockProps" value="0">
    </object>
    <asp:HiddenField ID="hidePW" value="0"  runat="server" />
    <asp:HiddenField ID="hideCas" value="0" runat="server" />
    <asp:HiddenField ID="hideSerialNo"  value="" runat="server" />
    <asp:HiddenField ID="hideErrorCode"  value="" runat="server" />
</asp:Content>

