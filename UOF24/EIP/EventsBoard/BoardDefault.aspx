<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BoardDefault.aspx.cs" Inherits="Ede.Uof.Web.EIP.EventsBoard.BoardDefault" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="~/Common/Style/swiper.min.css" rel="stylesheet" />
    <title></title>
  <style>
    html, body {
      position: relative;
      height: 100%;
    }
    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color:#000;
      margin: 0;
      padding: 0;
    }
    .swiper-container {
      width: 100%;
      height: 100%;
      position:fixed;
      background-color:white;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;      
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;     
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;      
      align-items: center;
    }  
    img{
        max-height: 95%;  
        max-width: 80%; 
        width: auto;
        height: auto;
        position: absolute;  
        top: 0;  
        bottom: 0;  
        left: 0;  
        right: 0;  
        margin: auto;
        border:0;
    }
    swiper-button-next{
        width: 40px;
        height: 100px;
        margin-top: -50px;
         background-image:url(/Common/Images/Icon/icon_big10.gif);
        transform: rotate(180deg);
        background-size:18px 22px;
        background-color: #58bdd2;
        left: 0;
       

    }  
    swiper-button-prev{
        width: 40px;
        height: 100px;
        margin-top: -50px;
        background-image:url(/Common/Images/Icon/icon_big10.gif);
        transform: rotate(180deg);
        background-size:18px 22px;
        background-color: #58bdd2;
        left: 0;
        
    }  
  .swiper-button-next,  .swiper-button-prev{
      width: 50px;height: 50px;border-radius:300px;
  }  /*重定义切换按钮尺寸和上下居中位置*/
  .swiper-button-next, .swiper-container-rtl .swiper-button-prev {
      background-size:28px 35px;background-color: #eee;right:0;opacity:0.1;
  } /*更换背景图片、尺寸，增加背景颜色，设置透明度*/
  .swiper-button-prev,.swiper-container-rtl .swiper-button-next{
      background-size:28px 35px;background-color: #eee;left:0;opacity:0.1;
  } /*更换背景图片、尺寸，增加背景颜色，设置透明度*/

  .swiper-button-next:hover{
      background-color: #eee;opacity: 1;
  } /*触发后变色*/
  .swiper-button-prev:hover{background-color: #eee;opacity: 1;
  } /*触发后变色*/

  </style>  
</head>
<body>
    <form id="form1"  runat="server">
  <!-- Swiper -->
    <telerik:RadScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
        <Scripts>            
            <asp:ScriptReference Path="~/Common/javascript/Swiper/js/swiper.min.js" />
        </Scripts>
    </telerik:RadScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
        <div class="swiper-container">
        <div class="swiper-wrapper" id="AlbumHtml" runat="server"></div>     
        <!-- Add Arrows -->
        <div class="swiper-button-next swiper-button-black"></div>
        <div class="swiper-button-prev swiper-button-black"></div>
      </div>          
            <asp:HiddenField ID="hfCurrentUser" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
  <!-- Swiper JS -->
    <script>
        var setDuration = "<%=duration%>";       
          var swiper = new Swiper('.swiper-container', {
              spaceBetween: 30,
              centeredSlides: true,              
              loop: true,
              autoplay: {
                  delay: setDuration,
                  disableOnInteraction: false,
              },
              pagination: {
                  el: '.swiper-pagination',
                  clickable: true,
              },
              navigation: {
                  nextEl: '.swiper-button-next',
                  prevEl: '.swiper-button-prev',
              },
          });
    </script>      
    </form>
</body>
</html>
