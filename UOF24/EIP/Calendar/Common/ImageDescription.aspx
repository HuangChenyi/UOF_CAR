<%@ Page Title="圖示說明" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Calendar_Common_ImageDescription" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="ImageDescription.aspx.cs" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
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
    <table cellspacing="1" class="PopTable">
        <tr>
            <td colspan="2"  style="text-align:center!important" class="PopTableHeader">
                <asp:Label ID="Label3" runat="server" Text="系統圖示" 
                    meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="text-align: center">
                <asp:Image ID="imgSameEvent" runat="server" 
                    ImageUrl="~/Common/Images/Icon/icon_m60.gif" 
                    meta:resourcekey="imgSameEventResource1" />
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="Label1" runat="server" Text="為多人共有事件，在行事曆中點選後可查看詳細人員" 
                    meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" style="text-align: center">
                <asp:Image ID="imgNotDisplay" runat="server"  
                    meta:resourcekey="imgNotDisplayResource1" />
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="Label2" runat="server" Text="當別人查閱我的行事曆時不顯示事件" 
                    meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trBooking">
            <td class="PopTableLeftTD" style="text-align: center">
                <asp:Image ID="imgBooking" runat="server"
                    ImageUrl="~/Common/Images/Icon/icon_m212.png"/>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="Label5" runat="server" Text="借用管理，借用狀態為預約"
                    meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trSigning">
            <td class="PopTableLeftTD" style="text-align: center">
                <asp:Image ID="imgSigning" runat="server"
                    ImageUrl="~/Common/Images/Icon/icon_m213.png"/>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="Label8" runat="server" Text="借用管理，借用狀態為審核中"
                    meta:resourcekey="Label8Resource1"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trLoaned">
            <td class="PopTableLeftTD" style="text-align: center">
                <asp:Image ID="imgLoaned" runat="server"
                    ImageUrl="~/Common/Images/Icon/icon_m214.png"/>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="Label6" runat="server" Text="借用管理，借用狀態為已借出"
                    meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trReturned">
            <td class="PopTableLeftTD" style="text-align: center">
                <asp:Image ID="ImgReturned" runat="server"
                    ImageUrl="~/Common/Images/Icon/icon_m215.png"/>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="Label7" runat="server" Text="借用管理，借用狀態為歸還"
                    meta:resourcekey="Label7Resource1"></asp:Label>
            </td>
        </tr>
        <tr runat="server" id="trRejected">
            <td class="PopTableLeftTD" style="text-align: center">
                <asp:Image ID="imgRejected" runat="server"
                    ImageUrl="~/Common/Images/Icon/icon_m211.png"
                    meta:resourcekey="imgRejectBorrowResource1" />
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="Label4" runat="server" Text="借用管理，借用狀態為拒絕借用"
                    meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
        </tr>
    </table>

    <br />
    <asp:Table ID="tbWorkClassImg" class="PopTable" cellspacing="1" runat="server" 
        meta:resourcekey="tbWorkClassImgResource1">
    </asp:Table>

    <asp:Label ID="lblWorkClassImg" runat="server" Text="工作類別圖示" Visible="False" 
        meta:resourcekey="lblWorkClassImgResource1"></asp:Label>
</asp:Content>

