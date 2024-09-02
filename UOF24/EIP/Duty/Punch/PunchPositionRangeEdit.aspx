<%@ Page Title="維護刷卡範圍" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="PunchPositionRangeEdit.aspx.cs" Inherits="EIP_Duty_Punch_PunchPositionRangeEdit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <asp:Label ID="lblAuthAlredayRemove" runat="server" Text="維護權限已被移除，請重新登入系統" ForeColor="Red" Visible="False" meta:resourcekey="lblAuthAlredayRemoveResource1"></asp:Label>

    <table id="tbMain" runat="server" class="PopTable">
        <tr>
            <td style="white-space:nowrap">
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label1Resource1"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="名稱" meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" MaxLength="10" Width="100%" meta:resourcekey="txtNameResource1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="不允許空白" ControlToValidate="txtName" Display="Dynamic" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            </td>
            <td style="white-space:nowrap">
                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label3Resource1"></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="範圍半徑(公尺)" meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="rnumRange" runat="server" Width="65px" NumberFormat-DecimalDigits="0" onkeyup="setCircleRadius()"  MinValue="10" MaxValue="999999" MaxLength="6" Value="50" Culture="zh-TW" DbValueFactor="1" LabelWidth="24px" meta:resourcekey="rnumRangeResource1">
                </telerik:RadNumericTextBox>
                <asp:Label ID="Label7" runat="server" Text="半徑最小限制為10公尺" CssClass="SizeMemo" meta:resourcekey="Label7Resource1"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="不允許空白" ControlToValidate="rnumRange" Display="Dynamic" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblStatus" runat="server" Text="狀態" meta:resourcekey="lblStatusResource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:CheckBox ID="cbActive" Checked="true" runat="server" />
                <asp:Label ID="lblActive" runat="server" Text="啟用" meta:resourcekey="lblActiveResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label5Resource1"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="人員" meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td colspan="3">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <uc1:UC_ChoiceList runat="server" ID="UC_ChoiceList" ShowMember="false" ExpandToUser="false" />
                        <asp:HiddenField ID="hfUserSetCount" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                &nbsp;
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="請選擇人員" ClientValidationFunction="CheckPositionPerson" Display="Dynamic" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            </td>
        </tr>
    </table>
     <telerik:RadToolBar ID="RadToolBar1" runat="server" SingleClick="None" Width="100%" OnClientButtonClicking="RadToolBar1_ButtonClicking" meta:resourcekey="RadToolBar1Resource1">
        <Items>
            <telerik:RadToolBarButton Value="address" meta:resourcekey="RadToolBarButtonResource1">
                <ItemTemplate>
                    <asp:TextBox ID="txtAddress" runat="server" Width="300px"  meta:resourcekey="txtAddressResource1"></asp:TextBox>
           
                </ItemTemplate>
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton runat="server" Text="搜尋" ImageUrl="~/Common/Images/Icon/icon_m39.gif" Value="queryAddress" meta:resourcekey="RadToolBarButtonResource2">
            </telerik:RadToolBarButton>
             <telerik:RadToolBarButton runat="server" IsSeparator="true" meta:resourcekey="RadToolBarButtonResource3">
            </telerik:RadToolBarButton>
            <telerik:RadToolBarButton Value="addressErr" meta:resourcekey="RadToolBarButtonResource4">
                <ItemTemplate>
                     <asp:Label ID="lblRemark" runat="server" Text="可輸入地點或地址"  CssClass="SizeMemo" meta:resourcekey="lblSearchRemarkResource1"></asp:Label>

                    <asp:Label ID="lblError" runat="server" ForeColor="Red" meta:resourcekey="lblErrorResource1"></asp:Label>
                </ItemTemplate>
            </telerik:RadToolBarButton>
        </Items>
    </telerik:RadToolBar>
    <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="無法取得經緯度，請重新定位" ClientValidationFunction="CheckLatLng" Display="Dynamic" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
    
    <asp:HiddenField ID="hfLat" runat="server" />
    <asp:HiddenField ID="hfLng" runat="server" />
    <asp:HiddenField ID="hfTimeZone" runat="server" />
    <asp:HiddenField ID="hfPunchPositionGuid" runat="server" />
    <asp:Label ID="lblAddressError" runat="server" Text="無法取得地址經緯度，錯誤代碼:" ForeColor="Red" Visible="False" meta:resourcekey="lblAddressErrorResource1"></asp:Label>

    <div id="map-canvas-div" style="width:100%; height:82%"></div>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvY2kQv2mSOvTxwiNECKfErS1NDpuJ55Y"></script>
    <script type="text/javascript">

        var punch_marker;
        var punch_circle;
        var map;
        var isRangeChange = false;
        /**
         *初始化地圖
         */
        function initialize() {
            if ($("#<%=hfLat.ClientID %>").val() && $("#<%=hfLng.ClientID %>").val()) {
                createMap(new google.maps.LatLng($("#<%=hfLat.ClientID %>").val(), $("#<%=hfLng.ClientID %>").val()));
            } else {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(showPosition, setEdePosition);
                } else {
                    setEdePosition();
                }
            }
        }

        function showPosition(position) {
            createMap(new google.maps.LatLng(position.coords.latitude, position.coords.longitude));
        }
        function setEdePosition() {
            createMap(new google.maps.LatLng(22.604206, 120.298395));
        }
        function createMap(latlngClass) {
            var range = $find("<%= rnumRange.ClientID %>").get_value();
            var mapOptions = {
                zoom: 16,
                center:latlngClass,
                minZoom:5
            };
            map = new google.maps.Map(
                document.getElementById('map-canvas-div'),
                mapOptions);

            mIcon = {
                path: google.maps.SymbolPath.BACKWARD_CLOSED_ARROW,
                fillOpacity: 1,
                fillColor: '#0092FF',
                strokeOpacity: 1,
                strokeWeight: 0,
                strokeColor: '#333',

                scale: 5
            };
            punch_marker = new google.maps.Marker({
                position: latlngClass,
                map: map,
                icon: mIcon,
                draggable: true
            });

            punch_circle = new google.maps.Circle({
                strokeColor: '#A4CEFF',
                strokeOpacity: 1,
                strokeWeight: 1,
                fillColor: '#0092C8',
                fillOpacity: 0.2,
                map: map,
                center: latlngClass,
                radius: range,
                editable: true,
                draggable: false
            });
            punch_circle.bindTo('center', punch_marker, 'position');
            $("#<%=hfLat.ClientID %>").val(latlngClass.lat());
            $("#<%=hfLng.ClientID %>").val(latlngClass.lng());
            google.maps.event.addDomListener(punch_marker, 'drag', getLatLng);
            google.maps.event.addDomListener(punch_circle, 'radius_changed', getCircleRadius);
          
        }
       
        /**
         *取得手拉範圍大小(unit: M)
         */
        function getCircleRadius() {

            var rnumRange = $find("<%= rnumRange.ClientID %>");
            var circleRadius = Math.round(punch_circle.getRadius());
            if (!isRangeChange) {
                if (circleRadius > rnumRange.get_maxValue()) {
                    circleRadius = rnumRange.get_maxValue();
                    punch_circle.setRadius(circleRadius);
                }
                rnumRange.set_value(circleRadius);
            }

            isRangeChange = false;
        }
        /**
         *設定範圍大小(unit: M)
         */
        function setCircleRadius() {
            var radius = parseInt($find("<%= rnumRange.ClientID %>").get_textBoxValue());
            isRangeChange = true;
            punch_circle.setRadius(radius);
        }
        /**
         * 取得手動設置標記位置
         */
        function getLatLng() {
            $("#<%=hfLat.ClientID %>").val(punch_marker.getPosition().lat().toFixed(7));
            $("#<%=hfLng.ClientID %>").val(punch_marker.getPosition().lng().toFixed(7));
            punch_circle.setCenter(punch_marker.getPosition());
            
        }

        function RadToolBar1_ButtonClicking(sender, args) {
            var itemValue = args.get_item().get_value();
            var toolbarbutton = sender.findItemByValue("address");
            var address = $telerik.findElement(toolbarbutton.get_element(), ("txtAddress")).value;
            
            args.set_cancel(true);
            if (itemValue === "queryAddress") {
               addressTransform(address);
            }
        }

        function addressTransform(address) {
            var geocoder = new google.maps.Geocoder();
            var toolbarbutton = $find("<%= RadToolBar1.ClientID %>").findItemByValue("addressErr");
            var latlng;
            if (address) {
                geocoder.geocode({ 'address': address }, function (results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        latlng = results[0].geometry.location;
                    map.setCenter(latlng);
                    punch_marker.setPosition(latlng);
                    punch_circle.setCenter(latlng);
                    $("#<%=hfLat.ClientID %>").val(latlng.lat().toFixed(7));
                    $("#<%=hfLng.ClientID %>").val(latlng.lng().toFixed(7));

                    } else {
                        $telerik.findElement(toolbarbutton.get_element(), ("lblError")).innerText = "<%= lblAddressError.Text %>" + status;
                        return null;
                    }
                });
            }
        }

     
        function CheckPositionPerson(sender,args) {
            if ($("#<%= hfUserSetCount.ClientID %>").val()) {

                if (Number($("#<%= hfUserSetCount.ClientID %>").val()) <= 0) {
                    args.IsValid = false;
                    return;
                }
            }
            else {
                args.IsValid = false;
                return;
            }
        }
        
        function CheckLatLng(sender,args) {
            if (!$("#<%= hfLat.ClientID %>").val() || !$("#<%= hfLng.ClientID %>").val()) {
                args.IsValid = false;
                return;
            }
        }
        Sys.Application.add_load(
            function(){ 
               google.maps.event.addDomListener(window, 'load', initialize); 
            });
    </script>
</asp:Content>
