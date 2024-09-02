<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckQRCode.aspx.cs" Inherits="Ede.Uof.Web.Login.CheckQRCode" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<html>
<head runat="server">
        <meta name="referrer" content="no-referrer" />
</head>

<body runat="server" id="Body">
    <style>
        .qrCodePosition  > canvas{
                margin-top: 35px;
        }

        .backImgBtn {
            margin-top: 23px;
            margin-left: -320px;
        }

        .btnReflashCss{
                width: 80px;
                height: 30px;
                border: 0;
                background-color: #F5F6F7;
                border-radius: 5px
        }

        .btnAgainCss {
            background-color:#FF4B00;
            border-radius:5px;
            border:0;
            color:white;
        }

    </style>
    <div  style="background-image:url('../Common/Images/QRCodeAuth/img-qrcodebg.png')">
    <form id="bodyForm" runat="server">  
         <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
            <StyleSheets>
                  <telerik:StyleSheetReference Path="~/Common/Style/cssReset.css" />
                <telerik:StyleSheetReference Path="~/Common/Style/uof-fixed.css" />
                <telerik:StyleSheetReference Path="~/Common/Style/telerik.css" />
            </StyleSheets>
        </telerik:RadStyleSheetManager>
        <telerik:RadScriptManager ID="radScriptManager" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
            <Scripts>
	            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
                <asp:ScriptReference Path="~/Common/javascript/json2.min.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery-ui.min.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.blockUI.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/ticker.js?v=11.40.0421" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/uofScript.js?v=18.5" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.cookie.js" ScriptMode="Release" />
                <asp:ScriptReference Path="~/Common/javascript/signature_pad.min.js" ScriptMode="Release"/>

                <asp:ScriptReference Path="~/Common/javascript/jQuery/plugin/jquery.qrcode.min.js" ScriptMode="Release"/>
                <asp:ScriptReference Path="~/Common/javascript/jQuery/jquery.signalR-2.2.2.min.js" ScriptMode="Release"/>
             
            </Scripts>
        </telerik:RadScriptManager>   

        <script type="text/javascript">
            var connection = $.hubConnection("../api");
            var core = connection.createHubProxy('QRCodeHub');

            Sys.Application.add_load(function () {
                GenerateQRCode();
            });

            $(document).ready(function () {
                SignalRConnection();
            });

            function SignalRConnection() {
                var uniqueKey = $('#<%=hidUniqueKey.ClientID%>').val();      
                connection.start().done(function () {

                    core.invoke('registerUOFClient', uniqueKey);

                }).fail(function (error) {
                    alert(error);
                });

                core.on('vailResult', function (result) {
              
                    var timer = $find('aspTimer');
                    timer._stopTimer();

                    switch (result)
                    {
                        case 'Success':
                                 unRegsisterUOF();
                                $("#<%=btnSuccess.ClientID%>").click();
                             break;
                        case 'Fail':
                                var uniqueKey = $('#<%=hidUniqueKey.ClientID%>').val();

                                HideQRCode();
                                $('#<%=lblNoticeTittle.ClientID%>').text($('#<%=lblErrTwo.ClientID%>').text());

                                $('#<%=txtErrInfo.ClientID%>').text($('#<%=lblErrInfoTwo.ClientID%>').text());
                                $('#<%=time.ClientID%>').hide();
                                $('#<%=btnReflash.ClientID%>').hide();
                                $('#<%=btnAgain.ClientID%>').show();
                             break;
                        case 'QRCodeTimeOut':
                                 unRegsisterUOF();
                             break;
                    }
                });           
            }

            function Reflash_Click() {

                //先暫停，避免 更新/再試一次 鈕失靈
                var timer = $find('aspTimer');
                timer._stopTimer();
               
                unRegsisterUOF();

                //產生QRCode唯一值，原本在後端做但會有前端在讀取時，資料異常的狀況所以load完以後統一在前端產生
                var newGUID = $uof.tool.getNewGuid();                
                $('#<%=hidUniqueKey.ClientID%>').val(newGUID);             
                SignalRConnection();
             }

            function SignalRDisConnection() {
                var connection = $.hubConnection("../api");
                connection.stop();
            }

            function unRegsisterUOF(){
               //讓舊的QRcode失效
                var uniqueKey =   $('#<%=hidUniqueKey.ClientID%>').val();
                core.invoke('unRegisterUOFClient', uniqueKey);

            }

            function GenerateQRCode() {

                var qrCodeInfo = $('#<%=hidQRcodeInfo.ClientID%>').val();

                $('#qrcode').qrcode({
                    width: 200,
                    height: 200,
                    text: $uof.tool.htmlDecode(qrCodeInfo)
                });       
            }

            function HideQRCode() {
                $('#<%=qrcode.ClientID%>').hide();
                $('#<%=divImage.ClientID%>').show();
                $('#<%=divAuthNotice.ClientID%>').hide();
                $('#<%=txtErrInfo.ClientID%>').show();
            }

        </script>
        <asp:UpdatePanel runat="server" ID="upDatePannel" >
            <ContentTemplate>
                <div style="text-align:center;width:100%;height:100%">
                    <div style="height:140px"></div>
　                   <div style="background-image:url('../Common/Images/QRCodeAuth/img-panel.png');background-repeat:no-repeat;background-position:top;background-size:contain">       
                        <asp:ImageButton type="button" runat="server" CssClass="backImgBtn"  OnClick="imgBtnback_Click"  ID="imgBtnback"
                                         ImageUrl="../Common/Images/QRCodeAuth/icon-arrow.png" 
                                         Height="22px" Width="22px"   BackColor="Transparent" meta:resourcekey="imgBtnbackResource1">
                        </asp:ImageButton>
                        <div class="qrCodePosition" id="qrcode" runat="server" ></div>
                        <div id="divImage" runat="server" style="display:none"> 
                            <asp:Image runat="server" ID="errorIMG"  Width="200px" Height="200px" ImageUrl="~/Common/Images/QRCodeAuth/img-u25.png" meta:resourcekey="errorIMGResource1" />
                        </div> 
                        <div style="margin-top:30px;line-height:20px;margin-bottom:10px">
                            <asp:Label runat="server" ID="lblNoticeTittle"  style="font-size:25px;font-weight:bold" meta:resourcekey="lblNoticeTittleResource1"></asp:Label>
                            <br />                         
                            <br />                         
                            <asp:TextBox runat="server" ID="txtErrInfo" Rows="2" Enabled="False" 
                                        ReadOnly="True" TextMode="MultiLine" BorderStyle="None" Width="160px"
                                        BorderWidth="0px"  
                                        style="display: none;color:#8C8C8C;resize:none;background-color:transparent;text-align:center;overflow:auto" meta:resourcekey="txtErrInfoResource1"></asp:TextBox> 
                            <div runat="server" ID="divAuthNotice" style="color:#8C8C8C;font-size:99%">
                                  <%=lblNoticeOne.Text %>
                                  <br /> 
                                  <%=lblNoticeTwo.Text %> 
                                  <img src="../Common/Images/QRCodeAuth/icon-scan.png" style="height:15px;width:15px;vertical-align: middle;"/>
                                  <%=lblNoticeThree.Text %>                    
                            </div> 
                            <br />
                             <asp:Label ID="time" ForeColor="#8C8C8C" runat="server" meta:resourcekey="timeResource1"></asp:Label>                          
                        </div>
                        <div>    
                            <button runat="server" ID="btnReflash"  type="button"   class="btnReflashCss"  onserverclick="btnReflash_Click" onclick="Reflash_Click();">
                                 <img src="../Common/Images/QRCodeAuth/icon-reset.png" style="height:15px;width:15px;vertical-align: middle;"/>
                                  <%=lblBtnText.Text %>                    
                            </button>                             
                            <asp:Button runat="server" ID="btnAgain" Width="110px" Height="30px" Text="再試一次"  OnClick="btnReflash_Click" OnClientClick="return Reflash_Click()" CssClass="btnAgainCss" meta:resourcekey="btnAgainResource1"  />
                            <asp:Timer ID="aspTimer" runat="server" OnTick="aspTimer_Tick" Enabled="False"></asp:Timer>
                        </div>
　                   </div>
                </div>               
                <asp:HiddenField ID="hidQRcodeInfo" runat="server" />
                <asp:HiddenField ID="hidEndTime" runat="server" />
                <asp:HiddenField ID="hidUserGuid" runat="server" />
                <asp:HiddenField ID="hidAccount" runat="server" />
                <asp:HiddenField ID="hidUniqueKey" runat="server" />                
                <asp:Button runat="server" ID="btnSuccess" OnClick="btnSuccess_Click" style="display:none;" meta:resourcekey="btnSuccessResource1" />
                <asp:Label runat="server" ID="lblBtnText" Text="更新" Visible="False" meta:resourcekey="lblBtnTextResource1"></asp:Label>      
                <asp:Label runat="server" ID="lblErrOne" Text="行動條碼驗證已失效" style="display: none" meta:resourcekey="lblErrOneResource1" ></asp:Label>        
                <asp:Label runat="server" ID="lblErrTwo" Text="驗證失敗" style="display: none" meta:resourcekey="lblErrTwoResource1" ></asp:Label>            
                <asp:Label runat="server" ID="lblErrInfoOne" Text="請再重新更新" style="display: none" meta:resourcekey="lblErrInfoOneResource1" ></asp:Label>        
                <asp:Label runat="server" ID="lblErrInfoTwo" Text="App帳號與UOF不相同請再試一次"  style="display: none" meta:resourcekey="lblErrInfoTwoResource1" ></asp:Label> 
                <asp:Label runat="server" ID="lblAuthTitle" Text="身分驗證"  style="display: none" meta:resourcekey="lblAuthTitleResource1" ></asp:Label> 
                <asp:Label runat="server" ID="lblNoticeOne" Text="為確保您的帳戶安全，請至UOF App首頁"  style="display: none" meta:resourcekey="lblNoticeOneResource1" ></asp:Label> 
                <asp:Label runat="server" ID="lblNoticeTwo" Text="打開掃描功能"  style="display: none" meta:resourcekey="lblNoticeTwoResource1" ></asp:Label> 
                <asp:Label runat="server" ID="lblNoticeThree" Text="並進行身分驗證"  style="display: none" meta:resourcekey="lblNoticeThreeResource1" ></asp:Label> 
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    </div>
</body>

</html>
