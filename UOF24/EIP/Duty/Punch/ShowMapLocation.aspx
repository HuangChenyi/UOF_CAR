<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowMapLocation.aspx.cs" Inherits="Ede.Uof.Web.EIP.Duty.Punch.ShowMapLocation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <style type="text/css">
        html, body, #map-canvas-div {
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
    <script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvY2kQv2mSOvTxwiNECKfErS1NDpuJ55Y">
    </script>
    <script type="text/javascript">
        function initialize() {
            var lat = '<%=Request.QueryString["LAT"]%>';
            var lng = '<%=Request.QueryString["LNG"]%>';
            var getLatlng = new google.maps.LatLng(lat, lng);
            var mapOptions = {
                center: getLatlng,
                zoom: 16
            };
            var map = new google.maps.Map(
                document.getElementById('map-canvas-div'),
                mapOptions);

            var marker = new google.maps.Marker({
                position: getLatlng,
                map: map
            });
        }
        google.maps.event.addDomListener(
            window, 'load', initialize);
    </script>
</head>
<body>
    <div id="map-canvas-div"></div>
</body>
</html>