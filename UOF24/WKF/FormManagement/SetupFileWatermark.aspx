<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SetupFileWatermark.aspx.cs" Inherits="Ede.Uof.Web.WKF.FormManagement.SetupFileWatermark" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc5" TagName="UC_FileCenter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">

            Sys.Application.add_load(function () {
                ChangeTextStatus();
                ChangeImgStatus(true);

                ChangeColor($("#<%=hidSelectColor.ClientID %>").val());
                ChangeColor2($("#<%=hidSelectColor2.ClientID %>").val());
            });

            function ChangeColor(newColor) {
                $("#<%=hidSelectColor.ClientID %>").val(newColor);
        	}

        	function ChangeColor2(newColor) {
        	    $("#<%=hidSelectColor2.ClientID %>").val(newColor);
        	}

        	function ChangeTextStatus() {
        	    var chkUseTxt = $("#<%=chkUseTxt.ClientID%>");

                var chkDlUser = $("#<%=chkDlUser.ClientID%>");
                var chkDlUserDept = $("#<%=chkDlUserDept.ClientID%>");
        	    var ddlTxtRotation = $("#<%=ddlTxtRotation.ClientID%>");
        	    var ColorPicker1 = $find('<%= ColorPicker1.ClientID%>');
        	    var ddlTxtSize = $("#<%=ddlTxtSize.ClientID%>");
        	    var ddlTransparency1 = $("#<%=ddlTransparency1.ClientID%>");
        	    var rdoTxtPosition = $("#<%=rdoTxtPosition.ClientID%> input:radio");

        	    var chkDefText = $("#<%=chkDefText.ClientID%>");
        	    var txtDefText = $("#<%=txtDefText.ClientID%>");
        	    var ddlTxtRotation2 = $("#<%=ddlTxtRotation2.ClientID%>");
        	    var ColorPicker2 = $find('<%= ColorPicker2.ClientID%>');
        	    var ddlTxtSize2 = $("#<%=ddlTxtSize2.ClientID%>");
        	    var ddlTransparency2 = $("#<%=ddlTransparency2.ClientID%>");
        	    var rdoTxtPosition2 = $("#<%=rdoTxtPosition2.ClientID%> input:radio");

        	    if (chkUseTxt.prop("checked")) {
        	        $("#divTxtDL").prop("disabled", false);
        	        $("#txtSetting").prop("disabled", false);
        	        $("#txtPosition").prop("disabled", false);
        	        $("#divTxtDL2").prop("disabled", false);
        	        $("#txtSetting2").prop("disabled", false);
        	        $("#txtPosition2").prop("disabled", false);
                    chkDlUser.prop("disabled", false);
                    chkDlUserDept.prop("disabled", false);
        	        chkDefText.prop("disabled", false);

        	        ChangeDlUser();
        	        ChangeDefText();
        	    }
        	    else {
        	        $("#divTxtDL").prop("disabled", true);
        	        $("#txtSetting").prop("disabled", true);
        	        $("#txtPosition").prop("disabled", true);
        	        $("#divTxtDL2").prop("disabled", true);
        	        $("#txtSetting2").prop("disabled", true);
        	        $("#txtPosition2").prop("disabled", true);

                    chkDlUser.prop("disabled", true);
                    chkDlUserDept.prop("disabled", true);
        	        ddlTxtRotation.prop("disabled", true);
        	        //txtTextColor.prop("disabled", true);
        	        if (ColorPicker1 != null)
        	            ColorPicker1.set_enabled(false);
        	        ddlTxtSize.prop("disabled", true);
        	        ddlTransparency1.prop("disabled", true);
        	        rdoTxtPosition.prop("disabled", true);

        	        chkDefText.prop("disabled", true);
        	        //txtDefText.prop("disabled", true);
        	        if (ColorPicker2 != null)
        	            ColorPicker2.set_enabled(false);
        	        ddlTxtRotation2.prop("disabled", true);
        	        ddlTxtSize2.prop("disabled", true);
        	        ddlTransparency2.prop("disabled", true);
        	        rdoTxtPosition2.prop("disabled", true);
        	    }
        	}

        	function ChangeImgStatus(IsLoad) {
        	    var ischkUseImg = $("#<%=chkUseImg.ClientID %>").is(":checked");
        	    var ddlImgRotation = $("#<%=ddlImgRotation.ClientID %>");
        	    var ddlimageTransparency = $("#<%=ddlimageTransparency.ClientID %>");
        	    var browseStrSpan = "";
        	    var newfileupload = "";
        	    var showUploadNowButton = "";
        	    var lbUploadNow = "";
        	    var rdoImgPosition = $("#<%=rdoImgPosition.ClientID%> input:radio");

        		if (ischkUseImg) {
        		    $("#imgRot").prop("disabled", false);
        		    $("#<%=ddlImgRotation.ClientID %>").prop("disabled", false);
        		    $("#<%=ddlimageTransparency.ClientID %>").prop("disabled", false);
        			$("#imgPosition").prop("disabled", false);
        			rdoImgPosition.prop("disabled", false);
                }
                else {
                    $("#imgRot").prop("disabled", true);
                    $("#<%=ddlImgRotation.ClientID %>").prop("disabled", true);
        		    $("#<%=ddlimageTransparency.ClientID %>").prop("disabled", true);
        			$("#imgPosition").prop("disabled", true);
        			rdoImgPosition.prop("disabled", true);
                }

            }

            //下載者部門是否勾選
            function ChangeDlUser() {
                var ddlTxtRotation = $("#<%=ddlTxtRotation.ClientID %>");
        	    var ColorPicker1 = $find('<%= ColorPicker1.ClientID%>');
        	    var ddlTxtSize = $("#<%=ddlTxtSize.ClientID %>");
                var ischkDlUser = $("#<%=chkDlUser.ClientID %>").is(":checked");
                var ischkDlUserDept = $("#<%=chkDlUserDept.ClientID %>").is(":checked");
        	    //2009/3/31 yafan 加入此段文字浮水印透明度的變數宣告**************
                var Transparency_sys = $("#<%= ddlTransparency1.ClientID %>");
        	    //**************************************************************** 
        	    var rdoTxtPosition = $("#<%= rdoTxtPosition.ClientID %> input:radio");

                if (ischkDlUser || ischkDlUserDept) {
        	        $("#txtSetting").prop("disabled", false);
        	        $("#txtPosition").prop("disabled", false);
        	        $("#<%=ddlTxtRotation.ClientID %>").prop("disabled", false);
        			if (ColorPicker1 != null)
        			    ColorPicker1.set_enabled(true);
        			$("#<%=ddlTxtSize.ClientID %>").prop("disabled", false);
        		    if (Transparency_sys)
        		        $("#<%=ddlTransparency1.ClientID %>").prop("disabled", false);
                    rdoTxtPosition.prop("disabled", false);
                }
                else {
                    $("#txtSetting").prop("disabled", true);
                    $("#txtPosition").prop("disabled", true);
                    $("#<%=ddlTxtRotation.ClientID %>").prop("disabled", true);
        			if (ColorPicker1 != null)
        			    ColorPicker1.set_enabled(false);
        			$("#<%=ddlTxtSize.ClientID %>").prop("disabled", true);
        		    if (Transparency_sys)
        		        $("#<%=ddlTransparency1.ClientID %>").prop("disabled", true);
                    rdoTxtPosition.prop("disabled", true);
                }
            }

            //自訂文字是否勾選
            function ChangeDefText() {
                var ddlTxtRotation2 = $("#<%=ddlTxtRotation2.ClientID %>");
        	    var ColorPicker2 = $find('<%= ColorPicker2.ClientID%>');
        	    var ddlTxtSize2 = $("#<%=ddlTxtSize2.ClientID %>");
        	    var txtDefText = $("#<%=txtDefText.ClientID %>");
        	    var ischkDefText = $("#<%=chkDefText.ClientID %>").is(":checked");
        	    //2009/3/31 yafan 加入此段文字浮水印透明度的變數宣告**************
                var Transparency_def = $("#<%= ddlTransparency2.ClientID %>");
        	    //**************************************************************** 
        	    var rdoTxtPosition2 = $("#<%= rdoTxtPosition2.ClientID %> input:radio");

        	    if (ischkDefText) {
        	        $("#txtSetting2").prop("disabled", false);
        	        $("#txtPosition2").prop("disabled", false);
        	        $("#<%=ddlTxtRotation2.ClientID %>").prop("disabled", false);
        			if (ColorPicker2 != null)
        			    ColorPicker2.set_enabled(true);
        			$("#<%=ddlTxtSize2.ClientID %>").prop("disabled", false);
        		    $("#<%=txtDefText.ClientID %>").prop("disabled", false);
        		    if (Transparency_def)
        		        $("#<%=ddlTransparency2.ClientID %>").prop("disabled", false);
                    rdoTxtPosition2.prop("disabled", false);
        		}
        		else {
        		    $("#txtSetting2").prop("disabled", true);
        		    $("#txtPosition2").prop("disabled", true);
        		    $("#<%=ddlTxtRotation2.ClientID %>").prop("disabled", true);
        			if (ColorPicker2 != null)
        			    ColorPicker2.set_enabled(false);

        			$("#<%=ddlTxtSize2.ClientID %>").prop("disabled", true);
        		        $("#<%=txtDefText.ClientID %>").prop("disabled", true);
        		    if (Transparency_def)
        		        $("#<%=ddlTransparency2.ClientID %>").prop("disabled", true);
                    rdoTxtPosition2.prop("disabled", true);
        		}
            }

            function AddData() {
        	    chkUseTxt = $("#<%=chkUseTxt.ClientID %>").is(":checked");      // 使用文字浮水印	    	    

                SysTextUse = $("#<%=chkDlUser.ClientID %>").is(":checked");
        	    SysTextUseDept = $("#<%=chkDlUserDept.ClientID %>").is(":checked");
        	    DefTxtUse = $("#<%=chkDefText.ClientID %>").is(":checked");

        	    ddlTxtRotation = $("#<%=ddlTxtRotation.ClientID %>").val();  // 文字旋轉角度	   		   		   	
        	    hidSelectColor = $("#<%=hidSelectColor.ClientID %>").val();  // 文字顏色	   		   	
        	    ddlTxtSize = $("#<%=ddlTxtSize.ClientID %>").val();      // 文字大小

        	    txtDefText = $("#<%=txtDefText.ClientID %>").val();      // 使用的文字浮水印,自訂文字內容 	
        	    ddlTxtRotation2 = $("#<%=ddlTxtRotation2.ClientID %>").val();  // 文字旋轉角度	   		   		   	
        	    hidSelectColor2 = $("#<%=hidSelectColor2.ClientID %>").val();  // 文字顏色	   		   	
        	    ddlTxtSize2 = $("#<%=ddlTxtSize2.ClientID %>").val();      // 文字大小

                Transparency_sys_crl = $("#<%= ddlTransparency1.ClientID %>");
                Transparency_sys = $("#<%= ddlTransparency1.ClientID %>").val();  //系統浮水印透明度
                Transparency_def_crl = $("#<%= ddlTransparency2.ClientID %>");
                Transparency_def = $("#<%= ddlTransparency2.ClientID %>").val(); //自訂浮水印透明度

        		chkSysDate = $("#<%=chkSysDate.ClientID %>").is(":checked");  // 是否加入系統時間
                chkSysPath = $("#<%=chkFormName.ClientID %>").is(":checked");  //是否加入文件路徑
        	    dwnFont = $("#<%=dwnFont.ClientID %>").val();

        	    rdoTxtPosition = $('#<%=rdoTxtPosition.ClientID %> input:checked').val();
        	    rdoTxtPosition2 = $('#<%=rdoTxtPosition2.ClientID %> input:checked').val();
        	    //===========================================
                chkUseImg = $("#<%=chkUseImg.ClientID %>").is(":checked"); // 使用圖形浮水印
                var fs = $find('<%=UC_FileCenter.ClientID %>');
                var files = fs.get_list();
                if (fs != null && fs.get_count() > 0)
                    IMG_FILE_ID = files[0].Id;               // 圖形浮水印的圖片ID	   	
        	    else
        	        IMG_FILE_ID = "";

        	    // 使用的圖形浮水印的角度
        	    ddlImgRotation = $("#<%=ddlImgRotation.ClientID %>").val();
                ddlimageTransparency = $("#<%=ddlimageTransparency.ClientID %>").val();
        		rdoImgPosition = $('#<%=rdoImgPosition.ClientID %> input:checked').val();

        	}

            
        	function OpenPreview2(url) {	            
        	    var previewImage = $('#<%= this.Image1.ClientID %>');
        	    previewImage.removeAttr("src");
        	    if (url == "") {
        	        return;
        	    }

        	    previewImage.attr("src", url + "&timestamp=" + new Date().getTime());

        	    var previewWindow = $find("<%=this.modalPopup.ClientID %>");
        	    previewWindow.set_cssClass("previewwindow");
        	    previewWindow.show();
        	}
        </script>
    </telerik:RadCodeBlock>
    <style>
        .tab {
            border: solid 1px #999999;
        }

            .tab > tbody > tr > td {
                border: solid 1px #999999;
            }

        .tab2 {
            border: solid 1px #ffffff;
        }

            .tab2 > tbody > tr > td {
                border: solid 1px #ffffff;
            }

        .previewwindow {
            z-index: 9900 !important;
        }
    </style>
    <div id="PdfSetting">
        <table style="width: 100%; text-align: left; margin: 0 auto" class="tab">
            <tr>
                <td colspan="3" style="background-color: #cccccc">
                    <asp:CheckBox ID="chkUseTxt" runat="server" Text="使用文字浮水印" meta:resourcekey="chkUseTxtResource1"/>
                </td>
            </tr>
            <tr>
                <td style="background-color: #ffffff; width: 50%" valign="top">
                    <div id="divTxtDL">
                        <table cellpadding="1" cellspacing="1" style="height: 100%; border: #ffffff solid 1px">
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chkDlUserDept" runat="server" Text="觀看者部門" meta:resourcekey="chkDlUserDeptResource1" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chkDlUser" runat="server" Text="觀看者姓名" meta:resourcekey="chkDlUserResource1"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td colspan="2" style="background-color: #ffffff;width: 50%">

                    <div id="txtSetting">
                        <table cellpadding="1" cellspacing="1" style="height: 100%" class="tab2">
                            <tr>
                                <td style="background-color: #cccccc" align="right" >
                                    <asp:Label ID="Label2" runat="server" Text="旋轉角度：" meta:resourcekey="Label2Resource1"></asp:Label></td>
                                <td>
                                    <asp:DropDownList ID="ddlTxtRotation" runat="server" meta:resourcekey="ddlTxtRotationResource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource1">0</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource2">5</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource3">10</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource4">15</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource5">20</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource6">25</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource7">30</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource8">35</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource9">40</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource10">45</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource11">50</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource12">55</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource13">60</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource14">65</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource15">70</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource16">75</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource17">80</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource18">85</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource19">90</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #cccccc" align="right">
                                    <asp:Label ID="Label4" runat="server" Text="文字顏色：" meta:resourcekey="Label4Resource1"></asp:Label></td>
                                <td>
                                    <telerik:RadColorPicker ID="ColorPicker1" runat="server" Preset="Standard" ShowIcon="True" EnableCustomColor="True" ShowRecentColors="True" ShowEmptyColor="False" Width="300px" Columns="12" SelectedColor="" meta:resourcekey="ColorPicker1Resource1"></telerik:RadColorPicker>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #cccccc" align="right">
                                    <asp:Label ID="Label5" runat="server" Text="文字大小：" meta:resourcekey="Label5Resource1" ></asp:Label></td>
                                <td><asp:DropDownList ID="ddlTxtSize" runat="server" Width="46px" meta:resourcekey="ddlTxtSizeResource1">
                                    <asp:ListItem meta:resourcekey="ListItemResource20" >5</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource21" >10</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource22" >15</asp:ListItem>
                                    <asp:ListItem  Selected="True" meta:resourcekey="ListItemResource23">20</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource24" >25</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource25" >30</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource26" >35</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource27" >40</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource28" >45</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource29" >50</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource30" >55</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource31" >60</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource32" >65</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource33" >70</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource34" >75</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource35" >80</asp:ListItem>
                                </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <td style="background-color: #cccccc" align="right">
                                    <asp:Label runat="server" Text="透明度：" ID="Label14" meta:resourcekey="Label14Resource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlTransparency1" runat="server" meta:resourcekey="ddlTransparency1Resource1" >
                                        <asp:ListItem meta:resourcekey="ListItemResource36" >0</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource37" >10</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource38" >20</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource39" >30</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource40" >40</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource41" >50</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource42" >60</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource43" >70</asp:ListItem>
                                        <asp:ListItem  Selected="True" meta:resourcekey="ListItemResource44">80</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource45" >90</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource46" >100</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="background-color: #ffffff" colspan="3" valign="top">&nbsp;<asp:Label ID="Label3" runat="server" Text="文字浮水印顯示位置：" meta:resourcekey="Label3Resource1"></asp:Label>
                    <div id="txtPosition">
                        <asp:RadioButtonList ID="rdoTxtPosition" runat="server"
                            RepeatDirection="Horizontal" meta:resourcekey="rdoTxtPositionResource1" >
                            <asp:ListItem Value="PosAll" Selected="True" Text="全部填滿" meta:resourcekey="ListItemResource47"></asp:ListItem>
                            <asp:ListItem Value="PosCenter"    Text="置中" meta:resourcekey="ListItemResource48"></asp:ListItem>
                            <asp:ListItem Value="PosLeftUp"    Text="左上角" meta:resourcekey="ListItemResource49"></asp:ListItem>
                            <asp:ListItem Value="PosRightUp"   Text="右上角" meta:resourcekey="ListItemResource50"></asp:ListItem>
                            <asp:ListItem Value="PosLeftDown"  Text="左下角" meta:resourcekey="ListItemResource51"></asp:ListItem>
                            <asp:ListItem Value="PosRightDown" Text="右下角" meta:resourcekey="ListItemResource52"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="background-color: #ffffff; width: 50%; white-space:nowrap; vertical-align:top;">
                    <div id="divTxtDL2">
                        <br />
                        <asp:CheckBox ID="chkDefText" runat="server" Text="自訂文字浮水印" meta:resourcekey="chkDefTextResource1" /><br />
                        <table style="width: 400px;">
                            <tr>
                                <td style=" white-space:nowrap;">
                                    <asp:Label ID="Label1" runat="server" Text="文字內容：" meta:resourcekey="Label1Resource1" ></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDefText" runat="server" Width="300px" MaxLength="150" TextMode="MultiLine" Rows="3" meta:resourcekey="txtDefTextResource1"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td style="background-color: #ffffff;width: 50%" colspan="2">
                    <div id="txtSetting2">
                        <table cellpadding="1" cellspacing="1" style="height: 100%" class="tab2">
                            <tr>
                                <td style="background-color: #cccccc;" align="right">
                                    <asp:Label ID="Label10" runat="server" Text="旋轉角度：" meta:resourcekey="Label10Resource1"></asp:Label></td>
                                <td><asp:DropDownList ID="ddlTxtRotation2" runat="server" meta:resourcekey="ddlTxtRotation2Resource1">
                                    <asp:ListItem meta:resourcekey="ListItemResource53" >0</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource54" >5</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource55" >10</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource56" >15</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource57" >20</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource58" >25</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource59" >30</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource60" >35</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource61" >40</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource62" >45</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource63" >50</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource64" >55</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource65" >60</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource66" >65</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource67" >70</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource68" >75</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource69" >80</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource70" >85</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource71" >90</asp:ListItem>
                                </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #cccccc" align="right">
                                    <asp:Label ID="Label11" runat="server" Text="文字顏色：" meta:resourcekey="Label11Resource1"></asp:Label></td>
                                <td>
                                    <telerik:RadColorPicker ID="ColorPicker2" runat="server" Preset="Standard" ShowIcon="True" EnableCustomColor="True" ShowRecentColors="True" ShowEmptyColor="False" Width="300px" Columns="12" SelectedColor="" meta:resourcekey="ColorPicker2Resource1"></telerik:RadColorPicker>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #cccccc" align="right">
                                    <asp:Label ID="Label12" runat="server" Text="文字大小：" meta:resourcekey="Label12Resource1"></asp:Label></td>
                                <td>
                                    <asp:DropDownList ID="ddlTxtSize2" runat="server" Width="46px" meta:resourcekey="ddlTxtSize2Resource1">
                                    <asp:ListItem meta:resourcekey="ListItemResource72" >5</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource73" >10</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource74" >15</asp:ListItem>
                                    <asp:ListItem  Selected="True" meta:resourcekey="ListItemResource75">20</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource76" >25</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource77" >30</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource78" >35</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource79" >40</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource80" >45</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource81" >50</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource82" >55</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource83" >60</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource84" >65</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource85" >70</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource86" >75</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource87" >80</asp:ListItem>
                                </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #cccccc" align="right">
                                    <asp:Label runat="server" Text="透明度：" ID="Label15" meta:resourcekey="Label15Resource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlTransparency2" runat="server" meta:resourcekey="ddlTransparency2Resource1" >
                                        <asp:ListItem meta:resourcekey="ListItemResource88" >0</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource89" >10</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource90" >20</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource91" >30</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource92" >40</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource93" >50</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource94" >60</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource95" >70</asp:ListItem>
                                        <asp:ListItem  Selected="True" meta:resourcekey="ListItemResource96">80</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource97" >90</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource98" >100</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="background-color: #ffffff" valign="top" colspan="3">&nbsp;<asp:Label ID="Label13" runat="server" Text="文字浮水印顯示位置：" meta:resourcekey="Label13Resource1"></asp:Label>
                    <div id="txtPosition2">
                        <asp:RadioButtonList ID="rdoTxtPosition2" runat="server"
                            RepeatDirection="Horizontal" meta:resourcekey="rdoTxtPosition2Resource1" >
                            <asp:ListItem Selected="True" Text="全部填滿" Value="PosAll" meta:resourcekey="ListItemResource99"></asp:ListItem>
                            <asp:ListItem Text="置中" Value="PosCenter" meta:resourcekey="ListItemResource100"></asp:ListItem>
                            <asp:ListItem Text="左上角" Value="PosLeftUp" meta:resourcekey="ListItemResource101"></asp:ListItem>
                            <asp:ListItem Text="右上角" Value="PosRightUp" meta:resourcekey="ListItemResource102"></asp:ListItem>
                            <asp:ListItem Text="左下角" Value="PosLeftDown" meta:resourcekey="ListItemResource103"></asp:ListItem>
                            <asp:ListItem Text="右下角" Value="PosRightDown" meta:resourcekey="ListItemResource104"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="background-color: #ffffff; height: 0px"></td>
            </tr>
            <tr>
                <td style="background-color: #cccccc" colspan="3">
                    <asp:CheckBox ID="chkUseImg" runat="server" Text="使用圖形浮水印" AutoPostBack="True" OnCheckedChanged="chkUseImg_CheckedChanged" meta:resourcekey="chkUseImgResource1" />
                    <asp:CustomValidator runat="server" ID="cvUseImg" Display="Dynamic"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td style="background-color: #ffffff; width: 50%">
                    <div id="imgWater">
                        <uc5:UC_FileCenter runat="server" ID="UC_FileCenter" ProxyEnabled="true" AllowedFileType="Image" />
                        &nbsp;
                    </div>

                </td>
                <td colspan="2" style="background-color: #ffffff;width: 50%;">
                    <div id="imgRot" style="height: 100%">
                        <table cellpadding="1" cellspacing="1" style="height: 100%" class="tab2">
                            <tr>
                                <td style="background-color: #cccccc" align="right">
                                    <asp:Label ID="Label6" runat="server" Text="旋轉角度：" meta:resourcekey="Label6Resource1"></asp:Label>
                                </td>
                                <td><asp:DropDownList ID="ddlImgRotation" runat="server" meta:resourcekey="ddlImgRotationResource1" >
                                    <asp:ListItem meta:resourcekey="ListItemResource105" >0</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource106" >5</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource107" >10</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource108" >15</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource109" >20</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource110" >25</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource111" >30</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource112" >35</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource113" >40</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource114" >45</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource115" >50</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource116" >55</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource117" >60</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource118" >65</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource119" >70</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource120" >75</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource121" >80</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource122" >85</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource123" >90</asp:ListItem>
                                </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #cccccc" align="right">
                                    <asp:Label ID="Label9" runat="server" Text="透明度：" meta:resourcekey="Label9Resource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlimageTransparency" runat="server" meta:resourcekey="ddlimageTransparencyResource1" >
                                        <asp:ListItem meta:resourcekey="ListItemResource124" >0</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource125" >10</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource126" >20</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource127" >30</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource128" >40</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource129" >50</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource130" >60</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource131" >70</asp:ListItem>
                                        <asp:ListItem Selected="True" meta:resourcekey="ListItemResource132" >80</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource133" >90</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource134" >100</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="background-color: #ffffff" colspan="3">&nbsp;<asp:Label ID="Label8" runat="server" Text="圖片浮水印顯示位置：" meta:resourcekey="Label8Resource1"></asp:Label>
                    <div id="imgPosition">
                        <asp:RadioButtonList ID="rdoImgPosition" runat="server"
                            RepeatDirection="Horizontal" meta:resourcekey="rdoImgPositionResource1" >
                            <asp:ListItem Value="PosAll" Selected="True" Text="全部填滿" meta:resourcekey="ListItemResource135"></asp:ListItem>
                            <asp:ListItem Value="PosCenter"    Text="置中" meta:resourcekey="ListItemResource136"></asp:ListItem>
                            <asp:ListItem Value="PosLeftUp"    Text="左上角" meta:resourcekey="ListItemResource137"></asp:ListItem>
                            <asp:ListItem Value="PosRightUp"   Text="右上角" meta:resourcekey="ListItemResource138"></asp:ListItem>
                            <asp:ListItem Value="PosLeftDown"  Text="左下角" meta:resourcekey="ListItemResource139"></asp:ListItem>
                            <asp:ListItem Value="PosRightDown" Text="右下角" meta:resourcekey="ListItemResource140"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="background-color: #cccccc" colspan="3">
                    <asp:CheckBox ID="chkSysDate" runat="server" Text="顯示系統日期" meta:resourcekey="chkSysDateResource1" />
                </td>
            </tr>
            <tr>
                <td style="background-color: #cccccc" colspan="3">
                    <asp:CheckBox ID="cbShowFormNbr" runat="server" Text="顯示表單編號" meta:resourcekey="cbShowFormNbrResource1" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:CheckBox ID="chkFormName" runat="server" Text="顯示表單名稱" meta:resourcekey="chkSysPathResource1" />
                </td>
            </tr>
            <tr>
                <td style="background-color: #cccccc" colspan="3">
                    <asp:Label ID="Label7" runat="server" Text="浮水印字型選擇： " meta:resourcekey="Label7Resource1" ></asp:Label>
                    <asp:DropDownList ID="dwnFont" runat="server" meta:resourcekey="dwnFontResource1" >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="background-color: #ffffff; height: 0px"></td>
            </tr>
        </table>
    </div>

    <telerik:RadWindow ID="modalPopup" runat="server" Width="480px" Height="705px" Modal="True" meta:resourcekey="modalPopupResource1" >
        <ContentTemplate>
            <asp:Image ID="Image1" runat="server" Width="447px" Height="633px" meta:resourcekey="Image1Resource1" />
        </ContentTemplate>
    </telerik:RadWindow>

    <input id="hidSelectColor" runat="server" value="#F9E7E8" style="width: 31px" type="hidden" />
    <input id="hidSelectColor2" runat="server" value="#F9E7E8" style="width: 31px" type="hidden" />
    <input id="hidFileGroupID" runat="server" style="width: 26px" type="hidden" />
    <asp:Label ID="labConfirmWaterTxt" runat="server" Text="確定要改變浮水印的設定?" Visible="False" meta:resourcekey="labConfirmWaterTxtResource1" ></asp:Label>
    <asp:Label ID="labSaveSuccess" runat="server" Text="設定儲存成功" Visible="False" meta:resourcekey="labSaveSuccessResource1" ></asp:Label>
    <asp:Label ID="labSaveFail" runat="server" Text="設定儲存失敗" Visible="False" meta:resourcekey="labSaveFailResource1" ></asp:Label>
    <asp:Label ID="labChangeSetup" runat="server" Text="是否要改變浮水印的設定?" Visible="False" meta:resourcekey="labChangeSetupResource1" ></asp:Label></center>
        <input id="hidNeedUpLoad" runat="server" type="hidden" value="請先上傳檔案"/>
    <input id="hfNoFindFile" runat="server" type="hidden" value="找不到該圖形浮水印檔案"  />
    <asp:Label ID="lblMsgText" runat="server" Text="請填寫自訂浮水印文字內容" Visible="False" meta:resourcekey="lblMsgTextResource1"
        ></asp:Label>
    <asp:Label ID="lblSysFont" runat="server" Text="系統預設浮水印字型" Visible="False" meta:resourcekey="lblSysFontResource1" ></asp:Label>
    <asp:HiddenField ID="hfFileIsExist" runat="server" />
    <asp:HiddenField ID="hideTmpPdfID" runat="server" />
    <asp:HiddenField ID="hfconfirm" runat="server" />
</asp:Content>
