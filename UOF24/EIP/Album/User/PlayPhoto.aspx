<%@ Page Language="C#" AutoEventWireup="true" Inherits="EIP_Album_User_PlayPhoto" Culture="auto" UICulture="auto" meta:resourcekey="PageResource2" CodeBehind="PlayPhoto.aspx.cs" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <%--<meta http-equiv="Content-type" content="text/html; charset=utf-8">--%>
    <title></title>
    <link rel="stylesheet" href="../StyleSheet/basic.css" type="text/css" />
    <link rel="stylesheet" href="../StyleSheet/black.css" type="text/css" />
    <link rel="stylesheet" href="../StyleSheet/galleriffic-2.css" type="text/css" />
    <script type="text/javascript" src="../../../Common/javascript/jquery/jquery.js?v=19.50"></script>
    <script type="text/javascript" src="../../../Common/javascript/jQuery/Album/jquery.galleriffic.js"></script>
    <script type="text/javascript" src="../../../Common/javascript/jQuery/Album/jquery.opacityrollover.js"></script>
    <!-- We only want the thunbnails to display when javascript is disabled -->
    <script type="text/javascript">
        $("body").append('<style>.noscript { display: none; }</style>');
        function maxsize() {
            self.moveTo(0, 0)
            self.resizeTo(screen.availWidth, screen.availHeight)

        }
        function onFullClick(id){
            window.open('../../../Common/FileCenter/V3/Handler/FileControlHandler.ashx?id=' + id);
        }

        var flag = false;
        function MyImage(Img) {
            var image = new Image();
            image.src = Img.src;
            width = 75; //預先設置的所期望的寬的值
            height = 75; //預先設置的所期望的高的值
            if (image.width > width || image.height > height) {//現有圖片只有寬或高超了預設值就進行js控制
                w = image.width / width;
                h = image.height / height;
                if (w > h) {//比值比較大==>寬比高大
                    Img.width = width; //定下寬度為width的寬度
                    Img.height = image.height / w; //以下為計算高度
                    Img.style.margin = Math.floor((75 - (image.height / w)) / 2) + 'px '
                        + Math.floor((75 - width) / 2) + 'px';

                } else {//高比寬大
                    Img.height = height; //定下寬度為height高度
                    Img.width = image.width / h; //以下為計算高度
                    Img.style.margin = Math.floor((75 - height) / 2) + 'px '
                        + Math.floor((75 - (image.width / h)) / 2) + 'px';
                }
            }
        }

        
    </script>
</head>
<body onload="maxsize()">
    <form id="form1" runat="server">
        <div id="page">
            <div id="container">
                <!-- Start Advanced Gallery Html Containers -->
                <table style="width:100%;vertical-align:middle">
                    <tr>
                        <td style="width:60%">
                            <div id="gallery" class="content">
                                <div id="controls" class="controls">
                                </div>
                                <div class="slideshow-container">
                                    <div id="loading" class="loader">
                                    </div>
                                    <div id="slideshow" class="slideshow">
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td style="width:40%;vertical-align:top">
                            <div id="caption" class="caption-container" width="100%">
                                </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div id="thumbs" class="navigation">
                                <ul class="thumbs noscript" runat="Server" id="AlbumHtml">

                                </ul>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>


        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                // We only want these styles applied when javascript is enabled
                $('div.navigation').css({ 'float': 'left', 'width': '100%' });
                $('div.content').css('display', 'block');

                // Initially set opacity on thumbs and add
                // additional styling for hover effect on thumbs
                var onMouseOutOpacity = 0.67;
                $('#thumbs ul.thumbs li').opacityrollover({
                    mouseOutOpacity: onMouseOutOpacity,
                    mouseOverOpacity: 1.0,
                    fadeSpeed: 'fast',
                    exemptionSelector: '.selected'
                });

                // Initialize Advanced Galleriffic Gallery
                var gallery = $('#thumbs').galleriffic({
                    delay: 2500,
                    numThumbs: 10,
                    preloadAhead: 0,
                    enableTopPager: true,
                    enableBottomPager: true,
                    maxPagesToShow: 10,
                    imageContainerSel: '#slideshow',
                    controlsContainerSel: '#controls',
                    captionContainerSel: '#caption',
                    loadingContainerSel: '#loading',
                    renderSSControls: true,
                    renderNavControls: true,
                    playLinkText: '<%=lblPlaySlideshow.Text %>',
                    playLinkImg: '../../../Common/Images/Icon/icon_m198.png',
                    pauseLinkText: '<%=lblPauseSlideshow.Text %>',
                    pauseLinkImg: '../../../Common/Images/Icon/icon_m199.png',
                    prevLinkText: '&lsaquo; <%=lblPrevious.Text %>',
                    prevLinkImg: '../../../Common/Images/Icon/icon_m200.png',
                    nextLinkText: '<%=lblNext.Text %> &rsaquo;',
		            nextLinkImg: '../../../Common/Images/Icon/icon_m201.png',
		            nextPageLinkText: '<%=lblNextPage.Text %> &rsaquo;',
		            nextPageLinkImg: '../../../Common/Images/Icon/icon_m204.png',
		            prevPageLinkText: '&lsaquo; <%=lblPrePage.Text %>',
		            prevPageLinkImg: '../../../Common/Images/Icon/icon_m203.png',
		            enableHistory: false,
		            autoStart: false,
		            syncTransitions: true,
		            defaultTransitionDuration: 900,
		            onSlideChange: function (prevIndex, nextIndex) {
		                // 'this' refers to the gallery, which is an extension of $('#thumbs')
		                this.find('ul.thumbs').children()
							.eq(prevIndex).fadeTo('fast', onMouseOutOpacity).end()
							.eq(nextIndex).fadeTo('fast', 1.0);
		            },
		            onPageTransitionOut: function (callback) {		                
		                this.fadeTo('fast', 0.0, callback);

		            },
		            onPageTransitionIn: function () {
		                this.fadeTo('fast', 1.0);
		            }
                });
                if ($('#<%=hfPhotoIndex.ClientID%>').val() != 0) {
                    gallery.gotoIndex($('#<%=hfPhotoIndex.ClientID%>').val());
                }
            });
        </script>
        <asp:HiddenField ID="hfPhotoIndex" runat="server" />
        
        <asp:HiddenField ID="hfAlbumTopic" runat="server" />
        <asp:HiddenField ID="heightValue" runat="server" />
        <asp:Label ID="lblDownload" runat="server" Text="Download Original" Visible="False" meta:resourcekey="lblDownloadResource1"></asp:Label>
        <asp:Label ID="lblNext" runat="server" Text="Next Photo" Visible="False" meta:resourcekey="lblNextResource1"></asp:Label>
        <asp:Label ID="lblPrevious" runat="server" Text="Previous Photo" Visible="False" meta:resourcekey="lblPreviousResource1"></asp:Label>
        <asp:Label ID="lblNextPage" runat="server" Text="Next" Visible="False" meta:resourcekey="lblNextPageResource1"></asp:Label>
        <asp:Label ID="lblPrePage" runat="server" Text="Prev" Visible="False" meta:resourcekey="lblPrePageResource1"></asp:Label>
        <asp:Label ID="lblPlaySlideshow" runat="server" Text="Play Slideshow" Visible="False" meta:resourcekey="lblPlaySlideshowResource1"></asp:Label>
        <asp:Label ID="lblPauseSlideshow" runat="server" Text="Pause Slideshow" Visible="False" meta:resourcekey="lblPauseSlideshowResource1"></asp:Label>
    </form>
</body>

</html>
