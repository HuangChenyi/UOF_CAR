<%@ Control Language="C#" AutoEventWireup="true" Inherits="EIP_Calendar_UC_WorkClassIcon" Codebehind="UC_WorkClassIcon.ascx.cs" %>


<script language="javascript" type="text/javascript">
    function clickit(e,classGUID) {

        var event = e || window.event; //firefox 沒有window.event
        var obj = event.srcElement ? event.srcElement : event.target; //firefox沒有srcElement

        $("INPUT").each(function () {
            if ($(this).val() == 'rbClassIcon')
                $(this).prop('checked', false);
        });

        obj.checked = true;
        $('#<%=hfClassGUID.ClientID%>').val(classGUID) ;
    }

    function MyImage(Img) {
        var image = new Image();
        image.src = Img.src;
        width = 16; //預先設置的所期望的寬的值
        height = 16; //預先設置的所期望的高的值
        if (image.width > width || image.height > height) {//現有圖片只有寬或高超了預設值就進行js控制
            w = image.width / width;
            h = image.height / height;
            if (w > h) {//比值比較大==>寬比高大
                Img.width = width; //定下寬度為width的寬度
                Img.height = image.height / w; //以下為計算高度
                Img.style.margin = Math.floor((16 - (image.height / w)) / 2) + 'px '
                                   + Math.floor((16 - width) / 2) + 'px';

            } else {//高比寬大
                Img.height = height; //定下寬度為height高度
                Img.width = image.width / h; //以下為計算高度
                Img.style.margin = Math.floor((16 - height) / 2) + 'px '
                                   + Math.floor((16 - (image.width / h)) / 2) + 'px';
            }
        }
    }


</script>
<asp:DataList ID="DataList1" runat="server" RepeatColumns="3"
    RepeatDirection="Horizontal" onitemdatabound="DataList1_ItemDataBound" 
    meta:resourcekey="DataList1Resource1">
    <ItemTemplate>
    <table border="0"  >
        <tr >
            <td >
                <asp:RadioButton ID="rbClassIcon" runat="server" 
                    meta:resourcekey="rbClassIconResource1"  />
            </td>
            <td >
                <asp:Panel runat="server" Width="20px" ID="imgPanel" 
                    meta:resourcekey="imgPanelResource1">
                    <asp:Image ID="imgIcon" runat="server" meta:resourcekey="imgIconResource1" />
                </asp:Panel>
            </td >
            <td align="left" >
                 <asp:Label ID="lblClassIconName" runat="server" 
                     meta:resourcekey="lblClassIconNameResource1" ></asp:Label>
            </td>
        </tr>
    </table>
    </ItemTemplate>
</asp:DataList>
<asp:HiddenField ID="hfClassGUID" runat="server" />
<asp:HiddenField ID="hfIsEnable" runat="server" />
<asp:Label ID="lblNotUse" runat="server" Text="不使用" Visible="False" 
    meta:resourcekey="lblNotUseResource1"></asp:Label>