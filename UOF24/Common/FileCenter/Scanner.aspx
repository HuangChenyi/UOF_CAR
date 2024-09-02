<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="Scanner.aspx.cs" Inherits="Ede.Uof.Web.Common.FileCenter.Scanner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <style>
        .demo-container {
            margin: 15px auto;
            padding: 10px;
            border: 1px solid #e2e4e7;
            background-color: #f5f7f8;
            *zoom: 1;
            height: 570px;
            display: inline-block;
        }
        .RadSlider,
        .sliderValue {
            display: inline-block;
        }
        .sliderValue {
            width: 20px;
            vertical-align: top;            
        }
        .settingTable {
            margin: 15px;
        }
        .settingTable tr {
            line-height: 50px;
            vertical-align: middle;
        }
        .leftTd {
            text-align: right;     
            vertical-align: middle;       
        }
        .rightTdDiv {
            margin-left: 20px; 
        }
        input[type="radio"] {
            margin-left: 5px;
        }
    </style>

    <telerik:RadNotification ID="notification" runat="server"
        Title="Information" 
        Position="Center"                                 
        Width="550"
        Height="120"
        EnableRoundedCorners="True"
        EnableShadow="True" 
        AutoCloseDelay="999999"
        />
        
    
    <telerik:RadTabStrip ID="RadTabStrip2" runat="server" MultiPageID="RadMultiPage2" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab Text="Settings" runat="server" Selected="True" PageViewID="RadPageView2">              
            </telerik:RadTab>
            <telerik:RadTab Text="Result" Value="result" runat="server" PageViewID="RadPageView3">                 
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0">
        <telerik:RadPageView runat="server" ID="RadPageView2" >
            <div style="width: 400px; margin-right: 1px;" class="demo-container">
                <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0" SkinID="Glow">
                    <Tabs>
                        <telerik:RadTab Text="" runat="server" Selected="True">                    
                        </telerik:RadTab>
                        <telerik:RadTab Text="Scanner Settings" runat="server" Selected="False" Enabled="False">                    
                        </telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0">
                    <telerik:RadPageView runat="server" ID="RadPageView1" >                
                        <table class="settingTable">
                            <tr>
                                <td class="leftTd">
                                    <asp:Label ID="lblColor" runat="server" Text="掃描模式" ></asp:Label>
                                </td>
                                <td>
                                    <div class="rightTdDiv">
                                        <asp:RadioButtonList ID="rbtnMode" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Value="Gray" Selected="True" Enabled="False">灰階</asp:ListItem>
                                            <asp:ListItem Value="Color" Enabled="False">彩色</asp:ListItem>                               
                                        </asp:RadioButtonList>  
                                        <div style="display: inline-block; margin-left: 80px;">
                                            <asp:Image ID="imgScanner" runat="server" Width="80" />
                                        </div>                                                                 
                                    </div>                                                          
                                </td>                            
                            </tr>
                            <tr>
                                <td class="leftTd">
                                    <asp:Label ID="lblType" runat="server" Text="掃描方式" ></asp:Label>
                                </td>
                                <td>
                                    <div class="rightTdDiv">
                                        <asp:RadioButtonList ID="rbtnScanType" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="ADF Front" Selected="True" Enabled="False">正面</asp:ListItem>
                                            <asp:ListItem Value="ADF Back" Enabled="False">反面</asp:ListItem>
                                            <asp:ListItem Value="ADF Duplex" Enabled="False">雙面</asp:ListItem>
                                            <asp:ListItem Value="Flatbed" Enabled="False">平台</asp:ListItem>
                                        </asp:RadioButtonList>                                 
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="leftTd">
                                    <asp:Label ID="lblPaper" runat="server" Text="紙張大小" ></asp:Label>
                                </td>
                                <td>
                                    <div class="rightTdDiv">
                                        <asp:RadioButtonList ID="rbtnPaperSize" runat="server" RepeatDirection="Horizontal">                              
                                        </asp:RadioButtonList>  
                                    </div>                               
                                </td>                            
                            </tr>
                            <tr runat="server" ID="trResolution">
                                <td class="leftTd">
                                    <asp:Label ID="lblResolution" runat="server" Text="解析度" ></asp:Label>
                                </td>
                                <td>
                                    <div class="rightTdDiv">
                                        <asp:RadioButtonList ID="rbtnResolution" runat="server" RepeatDirection="Horizontal">
                                        </asp:RadioButtonList>  
                                    </div>                               
                                </td>                            
                            </tr>
                            <tr>
                                <td class="leftTd">
                                    <asp:Label ID="lblBrightness" runat="server" Text="亮度" ></asp:Label>
                                </td>
                                <td>
                                    <div class="rightTdDiv">
		                                <span id="selectedBrightnessValue" class="sliderValue">15</span>
		                                <telerik:RadSlider ID="sliBrightness" runat="server" MinimumValue="-100" MaximumValue="100" Skin="Metro"
			                                Value="15" OnClientValueChanged="brightnessValueChanged" Width="170" style="margin-top: 17px">
		                                </telerik:RadSlider>
                                    </div>                               
                                </td>                            
                            </tr>
                            <tr>
                                <td class="leftTd">
                                    <asp:Label ID="lblContrast" runat="server" Text="對比" ></asp:Label>
                                </td>
                                <td>
                                    <div class="rightTdDiv">
		                                <span id="selectedContrastValue" class="sliderValue">40</span>
		                                <telerik:RadSlider ID="sliContrast" runat="server" MinimumValue="-100" MaximumValue="100" Skin="Metro"
			                                Value="40" OnClientValueChanged="contrastValueChanged" Width="170" style="margin-top: 17px">
		                                </telerik:RadSlider>
                                    </div>                               
                                </td>                            
                            </tr>
                            <tr>
                                <td class="leftTd">
                                    <asp:Label ID="lblQuality" runat="server" Text="影像品質"></asp:Label>
                                </td>
                                <td>
                                    <div class="rightTdDiv">
		                                <span id="selectedQualityValue" class="sliderValue">75</span>
		                                <telerik:RadSlider ID="sliQuality" runat="server" MinimumValue="1" MaximumValue="90" Skin="Metro"
			                                Value="75" OnClientValueChanged="qualityValueChanged" Width="170" style="margin-top: 17px">
		                                </telerik:RadSlider>
                                    </div>                               
                                </td>                            
                            </tr>
                            <tr runat="server" ID="trOcrLang">
                                <td class="leftTd">
                                    <asp:Label ID="lblOcrLang" runat="server" Text="OCR語系"></asp:Label>
                                </td>
                                <td>
                                    <div class="rightTdDiv">
                                        <asp:UpdatePanel UpdateMode="Conditional" runat="server" ID="LangUpdatePanel">
                                            <ContentTemplate>
                                                <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlRecognizeLang" OnSelectedIndexChanged="ddlRecognizeLang_SelectedIndexChanged">
                                                    <asp:ListItem Value="zh-tw+en" Text="繁體中文" />
                                                    <asp:ListItem Value="zh-cn+en" Text="简体中文" />
                                                    <asp:ListItem Value="en" Text="English" />
                                                    <asp:ListItem Value="jp" Text="日本語" />
                                                    <asp:ListItem Value="vn+en" Text="Việt Nam" />
                                                    <asp:ListItem Value="kp" Text="한국어" />
                                                    <asp:ListItem Value="de+en" Text="Deutsch" />
                                                </asp:DropDownList>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>                               
                                </td>                            
                            </tr>

                        </table> 
                        <div style="margin-left: 44px;">
                            <table>
                                <tr>
                                    <td class="leftTd">
                                        <asp:Label ID="lblFileType" runat="server" Text="格式"></asp:Label>    
                                    </td>
                                    <td>
                                        <div class="rightTdDiv">
                                            <asp:RadioButtonList ID="rbtnFileType" runat="server" RepeatDirection="Vertical">
                                                <asp:ListItem Value="JPEG" Selected="True">圖檔</asp:ListItem>
                                                <asp:ListItem Value="PDF">合併為PDF</asp:ListItem>
                                            </asp:RadioButtonList>                                                                                                                  
                                        </div>  
                                        <div id="pdfNameDiv" style="margin-left: 34px;">
                                            <asp:TextBox ID="txbName" runat="server" Width="180" Enabled="False"></asp:TextBox>.pdf                                       
                                        </div>                     
                                    </td>                            
                                </tr>                       
                            </table>
                        </div>                                       
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </div>
    
            <div class="demo-container" style="width: 564px; float: right;">
		        <telerik:RadImageGallery ID="RadImageGallery1" Width="95%" runat="server" Height="550px" Skin="Glow" >	    		    	    
			        <ThumbnailsAreaSettings />
			        <ImageAreaSettings ShowDescriptionBox="false" Height="100%" />
                    <ClientSettings>
                        <ClientEvents OnNavigated="OnImageGallery1Navigated"></ClientEvents>
                    </ClientSettings>
		        </telerik:RadImageGallery>
	        </div>        
        </telerik:RadPageView>                
        <telerik:RadPageView runat="server" ID="RadPageView3">                
            <div style="width: 400px; margin-right: 1px;" class="demo-container">
                <div id="ocrResultLbl" style="margin-left: 10px;"></div>
                <div id="ocrTextTr" style="margin: 10px; height: 525px">
                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="ocrText" TextMode="MultiLine" Resize="None"
                        Width="360px" Height="100%" EmptyMessage="掃描辨識結果">
                        <ClientEvents OnValueChanged="OnOcrTextValueChanged"></ClientEvents>
		            </telerik:RadTextBox>                                      
                </div>                                          
            </div>    
            <div class="demo-container" style="width: 564px; float: right;">
		        <telerik:RadImageGallery ID="RadImageGallery2" Width="95%" runat="server" Height="550px" Skin="Glow" >	    		    	    
			        <ThumbnailsAreaSettings />
			        <ImageAreaSettings ShowDescriptionBox="false" Height="100%" />
                    <ClientSettings>
                        <ClientEvents OnNavigated="OnImageGallery1Navigated"></ClientEvents>
                    </ClientSettings>
		        </telerik:RadImageGallery>
	        </div>                                               
        </telerik:RadPageView>
    </telerik:RadMultiPage>

   
    
    <asp:HiddenField ID="hdnScannerId" runat="server" />
    <asp:HiddenField ID="hdnUniqueId" runat="server" />
    <asp:HiddenField ID="hdnOcrEnabled" runat="server" />
    <asp:HiddenField ID="hdnSubFolder" runat="server" />
    <asp:HiddenField ID="hdnModuleName" runat="server" />    
    <asp:HiddenField ID="hdnPathAppend" runat="server" />
    <asp:HiddenField ID="hdnHandlerUrl" runat="server" />
    <asp:HiddenField ID="hdnAllowedMulti" runat="server" />
    <asp:HiddenField ID="hdnAllowedType" runat="server" />
    <asp:HiddenField ID="hdnOpenerCallback" runat="server" />
    
    <asp:Label ID="lblOcrResult" runat="server" Text="掃描辨識結果, 頁碼：" />
    <asp:Label ID="lblConnecting" runat="server" Text="連接中" Visible="False"/>
    <asp:Label ID="lblScanning" runat="server" Text="正在掃描第" Visible="False"/> 
    <asp:Label ID="lblPage" runat="server" Text="頁" Visible="False"/> 
    <asp:Label ID="lblUploading" runat="server" Text="檔案處理中，請稍後" Visible="False"/> 
    <asp:Label ID="lblSingleFileMessage" runat="server" Text="不允許上傳多個檔案，只會擷取第一個掃描檔" Visible="False"/> 
    <asp:Label ID="lblScannerNotConnected" runat="server" Text="未偵測到掃瞄器，請確認掃瞄器是否開啟或檢查是否已進入省電模式，並確認驅動程式已啟動" Visible="False"/> 

    
    

    <telerik:RadScriptBlock runat="server">
        <script type="text/javascript">
            //<![CDATA[
            

            Sys.Application.add_load(function () {
                // clear scanned file from PC
                setInterval(function() {
                    if (PlustekScannerSdk.Scanning === true) {
                        return;
                    }
                    if (plustek._scannedNameArray.length > 0) {
                        return;
                    }
                    if (plustek._unremovedNameArray.length > 0) {
                        var name = plustek._unremovedNameArray[0];
                        plustek._unremovedNameArray.splice(0, 1);
                        RemoveFileFromScanner(name);
                    }
                }, 1 * 500);

                $('#<%=rbtnFileType.ClientID%> input').on('change', function() {
                    $("#<%=txbName.ClientID%>").prop("disabled", $(this).val() === "JPEG");
                });
                $('#<%=rbtnScanType.ClientID%> input').on('change', function() {
                    $scannerImg = $('#<%=this.imgScanner.ClientID%>');
                    if ($(this).val().toLowerCase() === "flatbed") {
                        $scannerImg.attr("src", "<%=ScannerFlatbedImageSrc%>");
                    } else {
                        $scannerImg.attr("src", "<%=ScannerFrontImageSrc%>");
                    }                    
                });
                
                plustek._ocrEnabled = $('#<%=hdnOcrEnabled.ClientID%>').val() === '1';
                if (!plustek._ocrEnabled) {
                    $('#<%=rbtnResolution.ClientID%> input').each(function() {
                        var $option = $(this);
                        if ($option.val() === "250" || $option.val() === "300") {
                            $option.parent().remove();
                        }
                    });
                }
            });


            $(function () {
                PlustekScannerSdk.ScannerId = $('#<%=hdnScannerId.ClientID%>').val();
                plustek._guid = $('#<%=hdnUniqueId.ClientID%>').val();
                if (plustek._ocrEnabled) {
                    $find('<%=RadImageGallery2.ClientID%>').set_visible(false);
                } else {
                    $find('<%=RadImageGallery1.ClientID%>').set_visible(false);
                }
                $('#<%=rbtnFileType.ClientID%> input').each(function () {                    
                    if (this.disabled === true) {
                        $(this).parent().css("display", "none");
                        if ($(this).val() === "PDF") { $("#pdfNameDiv").css("display", "none"); }
                    }
                });
            });

            function ScanButtonClicked() {     
                RecvStatus(0);
                if (plustek._ocrEnabled) {
                    PlustekScannerSdk.Connecting(PlustekScannerSdk.GetOcrDataCommand, plustek_ScannerCallback, GetRequestStr("scan"));
                    var tab = $find("<%= RadTabStrip2.ClientID %>").findTabByValue("result");
                    if (!tab.get_selected()) {
                        tab.set_selected(true);
                    }

                    var recognizeLang = $("[id*=<%=ddlRecognizeLang.ClientID%>] option:selected").val();
                    //$uof.cookie.set("OcrRecognizeLang", recognizeLang);
                } else {
                    PlustekScannerSdk.Connecting(PlustekScannerSdk.GetImageListCommand, plustek_ScannerCallback, GetRequestStr("scan"));
                }
                return false;
            }

            function SubmitButtonClicked() {
                var imageGallery = GetImageGallery();
                if (imageGallery.get_items().get_count() === 0) {
                    $uof.dialog.close();
                    return false;
                }

                var multi = true;
                if ($("#<%=hdnAllowedMulti.ClientID%>").val() === "0" && $("#<%=hdnAllowedType.ClientID%>").val() === "image") {
                    if (Object.keys(plustek._scannedImageDic).length > 1) {
                        multi = false;
                        alert('<%=NotAllowedMultiMessage%>');
                    }                    
                }
                
                RecvStatus(-99);

                var fileType = $('[id*=<%=rbtnFileType.ClientID%>] input:checked').val();
                var fileName = $('#<%=txbName.ClientID%>').val() + ".pdf";

                if (fileType === "PDF" && !isValid(fileName)) {
                    alert("File name is invalid!");
                    CloseStatus();
                    return false;
                }

                var formData = new FormData();
                formData.append("UniqueId", plustek._guid);
                formData.append("Module", $("#<%=hdnModuleName.ClientID%>").val());
                formData.append("Sub", $("#<%=hdnSubFolder.ClientID%>").val());
                formData.append("PathAppend", $("#<%=hdnPathAppend.ClientID%>").val());
                formData.append("FileType", fileType);
                formData.append("FileName", fileName);
                formData.append("Images", JSON.stringify(plustek._scannedImageDic));
                formData.append("OCR", JSON.stringify(plustek._ocrResult));
                formData.append("AllowedMultipleFileSelection", multi);

                $.ajax({
                    url: $('#<%=hdnHandlerUrl.ClientID%>').val(),
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    async: true,
                    success: function (data) {                        
                        var callbackFunc = String.format("{0}('{1}')", $('#<%=hdnOpenerCallback.ClientID%>').val(), data);
                        opener.eval(callbackFunc);
                        $uof.dialog.close();
                    },
                    error: function (err) {
                        alert("Wwoops something went wrong! " + err.statusText);
                    }
                });

                return false;
            }

            function ClearButtonClicked() {
                var imageGallery = GetImageGallery();                      
                imageGallery.get_items().clear();
                var textbox = $find("<%= ocrText.ClientID %>");
                if(textbox != null)
                    textbox.set_value('');
                $("#ocrResultLbl").val('');
                plustek._scannedImageDic = {};
                plustek._ocrResult = {};
            }

            function OnImageGallery1Navigated(sender, args) {
                var item = args.get_item();
                var title = item.get_title();                

                if (plustek._ocrResult.hasOwnProperty(title)) {
                    var textbox = $find("<%= ocrText.ClientID %>");
                    textbox.set_value(plustek._ocrResult[title]);
                    SetOcrTextLabel(item);
                }
            }

            function OnOcrTextValueChanged(sender, args) {
                var imageGallery = GetImageGallery();   
                var selectedImageItem = imageGallery.get_selectedItem();
                if (selectedImageItem) {
                    var title = selectedImageItem.get_title();
                    plustek._ocrResult[title] = args.get_newValue();
                }
            }

            function brightnessValueChanged(slider, args) {
                $("#selectedBrightnessValue").html(slider.get_value());                
            }

            function contrastValueChanged(slider, args) {
                $("#selectedContrastValue").html(slider.get_value());
            }

            function qualityValueChanged(slider, args) {
                $("#selectedQualityValue").html(slider.get_value());
            }

            function RecvStatus(status) {

                if (document.getElementById(plustek._statusDivId)) {
                    document.getElementById(plustek._statusDivId).parentNode.removeChild(document.getElementById(plustek._statusDivId));
                }
                if (document.getElementById(plustek._maskId)) {
                    document.getElementById(plustek._maskId).parentNode.removeChild(document.getElementById(plustek._maskId));
                }

                var maskDiv = document.createElement("div");
                maskDiv.id = plustek._maskId;
                maskDiv.style.position = "fixed";
                maskDiv.style.zIndex = "1";
                maskDiv.style.width = window.innerWidth + "px";
                maskDiv.style.height = window.innerHeight + "px";
                maskDiv.style.top = "0px";
                maskDiv.style.left = "0px";
                maskDiv.style.background = "gray";
                maskDiv.style.filter = "alpha(opacity=10)";
                maskDiv.style.opacity = "0.50";
                document.body.appendChild(maskDiv);

                //Dialog
                var dialogDiv = document.createElement("div");
                dialogDiv.id = plustek._statusDivId;
                dialogDiv.style.position = "fixed";
                dialogDiv.style.zIndex = "9999";
                dialogDiv.style.width = "200px";
                dialogDiv.style.height = "100px";

                dialogDiv.style.top = (parseInt(window.innerHeight) - 100) / 2 + "px";
                dialogDiv.style.left = (parseInt(window.innerWidth) - 200) / 2 + "px";
                dialogDiv.style.background = " #FFFFFF ";
                dialogDiv.style.border = "1px solid gray";
                dialogDiv.style.padding = "5px";
                dialogDiv.style.borderRadius = "5px";

                if (status === 0) {
                    dialogDiv.innerHTML = "<div style='text-align:center;line-height:100px'>" + PlustekScannerSdk.ConnectingText + "...</div>";
                } else if (status === -99){
                    dialogDiv.innerHTML = "<div style='text-align:center;line-height:100px'>" + PlustekScannerSdk.FileProcessingText + "...</div>";
                }
                else {
                    dialogDiv.innerHTML = "<div style='text-align:center;line-height:100px'>" + PlustekScannerSdk.ScanningText +
                        "  " + status.substr(7, 8) + "  " + PlustekScannerSdk.PageText + "...</div>";
                }

                document.body.appendChild(dialogDiv);                    // Append <button> to <body>
            }

            function CloseStatus() {
                if (document.getElementById(plustek._statusDivId)) {
                    document.getElementById(plustek._statusDivId).parentNode.removeChild(document.getElementById(plustek._statusDivId));
                }
                if (document.getElementById(plustek._maskId)) {
                    document.getElementById(plustek._maskId).parentNode.removeChild(document.getElementById(plustek._maskId));
                }
                return;
            }

            var isValid = (function () {
                var rg1 = /^[^\\/:\*\?"<>\|]+$/; // forbidden characters \ / : * ? " < > |
                var rg2 = /^\./; // cannot start with dot (.)
                var rg3 = /^(nul|prn|con|lpt[0-9]|com[0-9])(\.|$)/i; // forbidden file names
                return function isValid(fname) {
                    return rg1.test(fname) && !rg2.test(fname) && !rg3.test(fname);
                }
            })();
            //]]>
        </script>
    </telerik:RadScriptBlock> 
    
    <telerik:RadScriptBlock runat="server" ID="plustek">
        <script type="text/javascript">
            //<![CDATA[

            // setting resources text
            PlustekScannerSdk.ScannerNotFoundText = "<%=ScannerNotFoundText%>";
            PlustekScannerSdk.ConnectingText = "<%=ScannerConnectingText%>";
            PlustekScannerSdk.ScanningText = "<%=ScannerScanningText%>";
            PlustekScannerSdk.PageText = "<%=ScannerPageText%>";
            PlustekScannerSdk.FileProcessingText = "<%=ScannerFileProcessingText%>";

            var plustek = plustek || {};
            plustek._scannedNameArray = plustek._scannedNameArray || [];
            plustek._unremovedNameArray = plustek._unremovedNameArray || [];
            plustek._scannedImageDic = plustek._scannedImageDic || {};
            plustek._scannerPreviewObj = new PreviewImg();
            plustek._statusDivId = "__dialogId";
            plustek._maskId = "__maskId";
            plustek._ocrEnabled = false;
            plustek._ocrResult = plustek._ocrResult || {};
            plustek._guid = '';




            function GetRequestStr(mode) {
                var checkedSize = $('[id*=<%=rbtnPaperSize.ClientID%>] input:checked').val();
                var checkedScanType = $('[id*=<%=rbtnScanType.ClientID%>] input:checked').val();
                var checkedMode = $('[id*=<%=rbtnMode.ClientID%>] input:checked').val();
                var recognizeLang = $("[id*=<%=ddlRecognizeLang.ClientID%>] option:selected").val();
                 
                var str = "SetParams?";
                str += "device-name=" + PlustekScannerSdk.ScannerId;
                str += "&scanmode=" + mode;
                str += "&paper-size=" + checkedSize;
                str += "&source=" + checkedScanType;
                str += "&mode=" + checkedMode;
                str += "&brightness=" + $find("<%= sliBrightness.ClientID %>").get_value();
                str += "&contrast=" + $find("<%= sliContrast.ClientID %>").get_value();
                str += "&quality=" + $find("<%= sliQuality.ClientID %>").get_value();

                
                if (PlustekScannerSdk.ScannerId == "29TU" && checkedSize == "A4")//使用T300掃描A4會有圖檔被截掉的問題，依原廠建議改此參數
                {
                    str += "&swcrop=true";
                    str += "&swdeskew=true";
                }
                else {
                    str += "&swcrop=false";
                    str += "&swdeskew=false";
                }

                if (plustek._ocrEnabled) {
                    str += "&resolution=300";
                    str += "&recognize-type=fulltext";
                    str += "&fulltext-type=txt"; // ["fulltext-type"] = "txt,rtf,xls,pdf,xml,docx,xlsx,pttx" ;
                    str += "&recognize-lang=" + recognizeLang;
                } else {
                    var checkedResolution = $('[id*=<%=rbtnResolution.ClientID%>] input:checked').val();
                    str += "&resolution=" + checkedResolution;
                }
                return str;
            }

            function GetImageGallery() {
                if (plustek._ocrEnabled) {
                    return $find('<%=RadImageGallery2.ClientID%>');
                } else {
                    return $find('<%=RadImageGallery1.ClientID%>');
                }
            }

            function GetImageFile(filename) {
                var thumbnail = false;
                var del = false;
                var str = "?filename=" + filename.trim() + "&thumbnail=" + thumbnail + "&delete=" + del;
                
                PlustekScannerSdk.ConnectingForGetFile(PlustekScannerSdk.GetFileDataCommand, plustek_ScannerCallback, PlustekScannerSdk.GetFileDataCommand + str);
            }

            function GetOcrFile(filename) {
                var ocrName = filename.replace(".jpg", "");
                var str = "?filename=" + ocrName + "&recognize-type=fulltext";
                
                PlustekScannerSdk.ConnectingForGetFile(PlustekScannerSdk.GetOcrRecognizedDataCommand, plustek_ScannerCallback, PlustekScannerSdk.GetOcrRecognizedDataCommand + str);
            }

            function RemoveFileFromScanner(filename) {
                var str = "RmFiles?filename=" + filename;
                PlustekScannerSdk.Connecting(PlustekScannerSdk.RmFilesCommand, plustek_ScannerCallback, str);
            }

            function plustek_ScannerCallback(obj) {
                switch (obj.ret) {
                    case 0:
                        plustek_ScannerConnectionSucceed_<%=ClientID %>(obj);
                        break;

                    case 1:
                        RecvStatus(obj.status);
                        plustek._scannedNameArray[plustek._scannedNameArray.length] = obj.filename;
                        break;

                    default:
                        CloseStatus();
                        alert(obj.data);
                        break;
                }

            }

            function plustek_ScannerConnectionSucceed_<%=ClientID %>(obj) {
                var formData = new FormData();
                formData.append("IsTemp", true);
                formData.append("UniqueId", plustek._guid);

                switch (obj.command) {
                case PlustekScannerSdk.GetDevicesListCommand:
                    //alert(PlustekScannerSdk.ScannerId);
                    break;

                case PlustekScannerSdk.GetOcrDataCommand:
                case PlustekScannerSdk.GetImageListCommand:
                    CloseStatus();
                    GetImageFile(plustek._scannedNameArray[0]);
                    break;

                case PlustekScannerSdk.GetFileDataCommand:
                    var name = plustek._scannedNameArray[0];
                    plustek._scannedImageDic[name] = "";

                    var imageGallery = GetImageGallery();                    
                    imageGallery.set_visible(true);
                    var imageGalleryItems = imageGallery.get_items();

                    var item = new Telerik.Web.UI.ImageGalleryItem({
                        title: name,
                        imageUrl: "data:image/jpeg;base64," + obj.data
                    });
                    imageGalleryItems.add(item);

                    var thumbArea = imageGallery.get_thumbnailsArea();
                    if (imageGalleryItems.get_count() === 1) {
                        thumbArea.toggle();
                    } else {
                        if (thumbArea.get_visible() === false)
                            thumbArea.toggle();
                    }


                    var dic = {};
                    dic[name] = obj.data;
                    formData.append("Images", JSON.stringify(dic));

                    $.ajax({
                        url: $('#<%=hdnHandlerUrl.ClientID%>').val(),
                        type: 'POST',
                        data: formData,
                        processData: false,
                        contentType: false,
                        async: true,
                        success: function(data) {},
                        error: function(err) {
                            alert("Upload temp error! " + err.statusText);
                        }
                    });


                    if (plustek._ocrEnabled) {
                        GetOcrFile(plustek._scannedNameArray[0]);
                    } else {
                        plustek._unremovedNameArray[plustek._unremovedNameArray.length] = plustek._scannedNameArray[0];
                        plustek._scannedNameArray.splice(0, 1);
                        if (plustek._scannedNameArray.length > 0) {
                            GetImageFile(plustek._scannedNameArray[0]);
                        }
                    }
                    
                    break;

                case PlustekScannerSdk.RmFilesCommand:
                    //alert("delete file done");
                    break;

                case PlustekScannerSdk.GetOcrRecognizedDataCommand:
                    var ocrName = plustek._scannedNameArray[0].replace(".jpg", "");
                    if (typeof obj.data === 'object') { // for fulltext recognize
                        formData.append("file", obj.data);
                        formData.append("OcrName", ocrName);

                        $.ajax({
                            url: $('#<%=hdnHandlerUrl.ClientID%>').val(),
                            type: 'POST',
                            data: formData,
                            processData: false,
                            contentType: false,
                            async: true,
                            success: function (data) {
                                var ocrText = $find("<%= ocrText.ClientID %>");
                                plustek._ocrResult[data.OcrName] = data.OcrText;
                                var imageGallery = GetImageGallery();
                                setTimeout(function() {
                                    var selectedImageItem = imageGallery.get_selectedItem();
                                    if (selectedImageItem.get_title() === data.OcrName) {
                                        ocrText.set_value(data.OcrText);
                                        SetOcrTextLabel(selectedImageItem);
                                    }                                    
                                }, 750);
                            },
                            error: function(err) {
                                alert("Upload temp error! " + err.statusText);
                            }
                        });
                    }
                    
                    //plustek._unremovedNameArray[plustek._unremovedNameArray.length] = ocrName;
                    plustek._unremovedNameArray[plustek._unremovedNameArray.length] = plustek._scannedNameArray[0];

                    plustek._scannedNameArray.splice(0, 1);
                    if (plustek._scannedNameArray.length > 0) {
                        GetImageFile(plustek._scannedNameArray[0]);
                    }

                    break;
                }
            }

            function SetOcrTextLabel(imageItem) {
                if (imageItem) {
                    var text = $("#<%=lblOcrResult.ClientID%>").text();
                    $("#ocrResultLbl").text(text + (imageItem.get_itemIndex()+1).toString());
                }
            }

            //]]>
        </script>        
    </telerik:RadScriptBlock>
</asp:Content>

