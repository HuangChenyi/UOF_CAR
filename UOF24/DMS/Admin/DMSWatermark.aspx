<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="DMS_Admin_DMSWatermark" Title="PDF設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="DMSWatermark.aspx.cs" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc5" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest"
        DefaultLoadingPanelID="RadAjaxLoadingPanel1" meta:resourcekey="RadAjaxManager1Resource1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btnPDFPreview">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="modalPopup" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
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
                var ischkDlUserDept = $("#<%=chkDlUserDept.ClientID%>").is(":checked");
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
                chkAddSummary = $("#<%=chkAddSummary.ClientID %>").is(":checked");  // PDF 添加文件摘要
        	    chkUseTxt = $("#<%=chkUseTxt.ClientID %>").is(":checked");      // 使用文字浮水印	    	    

        	    SysTextUse = $("#<%=chkDlUser.ClientID %>").is(":checked");
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
        		chkSysPath = $("#<%=chkSysPath.ClientID %>").is(":checked");  //是否加入文件路徑
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

            function btnPDFPreview_Click() {
                var browseStrSpan = "";
        	    var showUploadNowButton = "";
        	    var hfFileIsExist = $("#<%=hfFileIsExist.ClientID %>").val();  // 圖形浮水印有沒有存在	
        		var ischkUseImg2 = $("#<%=chkUseImg.ClientID %>").is(":checked");
        	    var ischkDefText = $("#<%=chkDefText.ClientID %>").is(":checked");
        	    var txtDefText = $("#<%=txtDefText.ClientID %>").val();
        	    var fs = $find('<%=UC_FileCenter.ClientID %>');
        	    var fileid;
        	    var filepath;
        	    var filename;
        	    if (ischkDefText) {
        	        if (txtDefText == '') {
        	            alert('<%=lblMsgText.Text %>');
        			    return;
        			}
                }

                if (ischkUseImg2) {
                    if ( fs == null && fs.get_count() <= 0) {
                        alert("<%=labNeedUpLoad.Text %>");
        			    return;
        			}

                    if (hfFileIsExist == 'False') {
                        alert("<%=labNoFindFile.Text %>");                       
        			    return;
                    }
                    var files = fs.get_list();
                    fileid = files[0].Id;
                    filepath = files[0].Folder;
                    filename = files[0].Name;
                }

        	    //if (fs != null && fs.get_count() > 0) {
                    AddData();
                    var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
        			ajaxManager.ajaxRequest("preview");
                //}
                return false;
            }

            $(function () {
                $('#<%= this.btnPDFPreview.ClientID %>').click(btnPDFPreview_Click);

                $('#<%= this.btnSubmit.ClientID %>').click(btnSubmit_Click);
            });

        	function OpenPreview2(url) {	            
        	    var previewImage = $('#<%= this.Image1.ClientID %>');
        	    previewImage.removeAttr("src");
        	    if (url == "") {
        	        return;
                }

                var width = "620px";//開窗大小
                var height = "865px";
                $uof.window.open("../DocStore/DocCoverPreview.aspx?Url=" + url + "&h=" + 600, width, height);
        	}

            // 確定
            function btnSubmit_Click()
            {
                if (window.confirm('<%=labConfirmWaterTxt.Text %>')) {
                    $("#<%= hfconfirm.ClientID %>").val("true");
                }
                else {
                    $("#<%= hfconfirm.ClientID %>").val("false");
                }
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
    <table style="width: 70%; text-align: left; margin: 0 auto" class="tab">
        <tr>
            <td colspan="3" style="background-color: #cccccc">
                <asp:CheckBox ID="chkAddSummary" runat="server" Text="使用文件封面" meta:resourcekey="chkAddSummaryResource1" />
            </td>
        </tr>
    </table>

    <div id="PdfSetting">
        <table style="width: 70%; text-align: left; margin: 0 auto" class="tab">
            <tr>
                <td colspan="3" style="background-color: #cccccc">
                    <asp:CheckBox ID="chkUseTxt" runat="server" Text="使用文字浮水印" meta:resourcekey="chkUseTxtResource1" />
                </td>
            </tr>
            <tr>
                <td style="background-color: #ffffff; width: 50%" valign="top">
                    <div id="divTxtDL">
                        <table cellpadding="1" cellspacing="1" style="height: 100%; border: #ffffff solid 1px">
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chkDlUserDept" runat="server" Text="下載者部門" meta:resourcekey="chkDlUserDeptResource1" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="chkDlUser" runat="server" Text="下載者姓名" meta:resourcekey="chkDlUserResource1" />                                                                             
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
                                    <asp:DropDownList ID="ddlTxtRotation" runat="server"
                                    meta:resourcekey="ddlTxtRotationResource1">
                                    <asp:ListItem meta:resourcekey="ListItemResource1">0</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource2">5</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource4">10</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource7">15</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource8">20</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource9">25</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource10">30</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource11">35</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource12">40</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource13">45</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource14">50</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource15">55</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource16">60</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource17">65</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource18">70</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource19">75</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource20">80</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource21">85</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource22">90</asp:ListItem>
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
                                    <asp:Label ID="Label5" runat="server" Text="文字大小：" meta:resourcekey="Label5Resource1"></asp:Label></td>
                                <td><asp:DropDownList ID="ddlTxtSize" runat="server" Width="46px"
                                    meta:resourcekey="ddlTxtSizeResource1">
                                    <asp:ListItem meta:resourcekey="ListItemResource83">5</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource84">10</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource85">15</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource86" Selected="True">20</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource87">25</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource88">30</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource89">35</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource90">40</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource91">45</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource92">50</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource93">55</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource94">60</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource95">65</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource96">70</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource97">75</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource98">80</asp:ListItem>
                                </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <td style="background-color: #cccccc" align="right">
                                    <asp:Label runat="server" Text="透明度：" ID="Label14"
                                        meta:resourcekey="Label14Resource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlTransparency1" runat="server" meta:resourcekey="ddlTransparency1Resource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource99">0</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource100">10</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource101">20</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource102">30</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource103">40</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource104">50</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource105">60</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource106">70</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource107" Selected="True">80</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource108">90</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource109">100</asp:ListItem>
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
                            RepeatDirection="Horizontal" meta:resourcekey="rdoTxtPositionResource1">
                            <asp:ListItem Value="PosAll" Selected="True" meta:resourcekey="ListItemResource34" Text="全部填滿"></asp:ListItem>
                            <asp:ListItem Value="PosCenter" meta:resourcekey="ListItemResource35" Text="置中"></asp:ListItem>
                            <asp:ListItem Value="PosLeftUp" meta:resourcekey="ListItemResource36" Text="左上角"></asp:ListItem>
                            <asp:ListItem Value="PosRightUp" meta:resourcekey="ListItemResource37" Text="右上角"></asp:ListItem>
                            <asp:ListItem Value="PosLeftDown" meta:resourcekey="ListItemResource38" Text="左下角"></asp:ListItem>
                            <asp:ListItem Value="PosRightDown" meta:resourcekey="ListItemResource39" Text="右下角"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="background-color: #ffffff; width: 50%; white-space:nowrap; vertical-align:top;">
                    <div id="divTxtDL2">
                        <!--<asp:RadioButton ID="rdoDefText" runat="server" GroupName="WaterGroup" Text="自訂文字浮水印" meta:resourcekey="rdoDefTextResource1" />-->
                        <br />
                        <asp:CheckBox ID="chkDefText" runat="server" Text="自訂文字浮水印" meta:resourcekey="chkDefTextResource1" /><br />
                        <table style="width: 400px;">
                            <tr>
                                <td style=" white-space:nowrap;">
                                    <asp:Label ID="Label1" runat="server" Text="文字內容：" meta:resourcekey="Label1Resource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDefText" runat="server" Width="300px" MaxLength="150" TextMode="MultiLine" Rows="3"
                                        meta:resourcekey="txtDefTextResource1"></asp:TextBox>
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
                                    <asp:Label ID="Label10" runat="server" meta:resourcekey="Label2Resource1" Text="旋轉角度："></asp:Label></td>
                                <td><asp:DropDownList ID="ddlTxtRotation2" runat="server"
                                    meta:resourcekey="ddlTxtRotation2Resource1">
                                    <asp:ListItem meta:resourcekey="ListItemResource1">0</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource2">5</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource4">10</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource7">15</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource8">20</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource9">25</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource10">30</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource11">35</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource12">40</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource13">45</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource14">50</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource15">55</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource16">60</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource17">65</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource18">70</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource19">75</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource20">80</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource21">85</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource22">90</asp:ListItem>
                                </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #cccccc" align="right">
                                    <asp:Label ID="Label11" runat="server" meta:resourcekey="Label4Resource1" Text="文字顏色："></asp:Label></td>
                                <td>
                                    <telerik:RadColorPicker ID="ColorPicker2" runat="server" Preset="Standard" ShowIcon="True" EnableCustomColor="True" ShowRecentColors="True" ShowEmptyColor="False" Width="300px" Columns="12" SelectedColor="" meta:resourcekey="ColorPicker2Resource1"></telerik:RadColorPicker>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #cccccc" align="right">
                                    <asp:Label ID="Label12" runat="server" meta:resourcekey="Label5Resource1" Text="文字大小："></asp:Label></td>
                                <td>
                                    <asp:DropDownList ID="ddlTxtSize2" runat="server" Width="46px"
                                    meta:resourcekey="ddlTxtSize2Resource1">
                                    <asp:ListItem meta:resourcekey="ListItemResource67">5</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource68">10</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource69">15</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource70" Selected="True">20</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource71">25</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource72">30</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource73">35</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource74">40</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource75">45</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource76">50</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource77">55</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource78">60</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource79">65</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource80">70</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource81">75</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource82">80</asp:ListItem>
                                </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #cccccc" align="right">
                                    <asp:Label runat="server" Text="透明度：" ID="Label15"
                                        meta:resourcekey="Label15Resource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlTransparency2" runat="server" meta:resourcekey="ddlTransparency2Resource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource110">0</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource111">10</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource112">20</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource113">30</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource114">40</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource115">50</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource116">60</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource117">70</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource118" Selected="True">80</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource119">90</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource120">100</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="background-color: #ffffff" valign="top" colspan="3">&nbsp;<asp:Label ID="Label13" runat="server" meta:resourcekey="Label3Resource1" Text="文字浮水印顯示位置："></asp:Label>
                    <div id="txtPosition2">
                        <asp:RadioButtonList ID="rdoTxtPosition2" runat="server"
                            RepeatDirection="Horizontal" meta:resourcekey="rdoTxtPosition2Resource1">
                            <asp:ListItem meta:resourcekey="ListItemResource34" Selected="True" Text="全部填滿" Value="PosAll"></asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource35" Text="置中" Value="PosCenter"></asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource36" Text="左上角" Value="PosLeftUp"></asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource37" Text="右上角" Value="PosRightUp"></asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource38" Text="左下角" Value="PosLeftDown"></asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource39" Text="右下角" Value="PosRightDown"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="background-color: #ffffff; height: 0px"></td>
            </tr>
            <tr>
                <td style="background-color: #cccccc" colspan="3">
                    <asp:CheckBox ID="chkUseImg" runat="server" Text="使用圖形浮水印" AutoPostBack="True" meta:resourcekey="chkUseImgResource1"
                        OnCheckedChanged="chkUseImg_CheckedChanged" />
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
                                <td><asp:DropDownList ID="ddlImgRotation" runat="server" meta:resourcekey="ddlImgRotationResource1">
                                    <asp:ListItem meta:resourcekey="ListItemResource42">0</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource43">5</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource44">10</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource45">15</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource46">20</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource47">25</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource48">30</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource49">35</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource50">40</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource51">45</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource52">50</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource53">55</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource54">60</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource55">65</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource56">70</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource57">75</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource58">80</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource65">85</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource66">90</asp:ListItem>
                                </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-color: #cccccc" align="right">
                                    <asp:Label ID="Label9" runat="server" Text="透明度：" meta:resourcekey="Label9Resource1"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlimageTransparency" runat="server" meta:resourcekey="ddlimageTransparencyResource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource121">0</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource122">10</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource123">20</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource124">30</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource125">40</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource126">50</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource127">60</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource128">70</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource129">80</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource130">90</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource131">100</asp:ListItem>
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
                            RepeatDirection="Horizontal" meta:resourcekey="rdoImgPositionResource1">
                            <asp:ListItem Value="PosAll" Selected="True" meta:resourcekey="ListItemResource59" Text="全部填滿"></asp:ListItem>
                            <asp:ListItem Value="PosCenter" meta:resourcekey="ListItemResource60" Text="置中"></asp:ListItem>
                            <asp:ListItem Value="PosLeftUp" meta:resourcekey="ListItemResource61" Text="左上角"></asp:ListItem>
                            <asp:ListItem Value="PosRightUp" meta:resourcekey="ListItemResource62" Text="右上角"></asp:ListItem>
                            <asp:ListItem Value="PosLeftDown" meta:resourcekey="ListItemResource63" Text="左下角"></asp:ListItem>
                            <asp:ListItem Value="PosRightDown" meta:resourcekey="ListItemResource64" Text="右下角"></asp:ListItem>
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
                    <asp:CheckBox ID="chkSysPath" runat="server" Text="顯示文件路徑" meta:resourcekey="chkSysPathResource1" />
                </td>
            </tr>
            <tr>
                <td style="background-color: #cccccc" colspan="3">
                    <asp:Label ID="Label7" runat="server" Text="浮水印字型選擇： " meta:resourcekey="Label7Resource1"></asp:Label>
                    <asp:DropDownList ID="dwnFont" runat="server" meta:resourcekey="dwnFontResource1">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="background-color: #ffffff; height: 0px"></td>
            </tr>
        </table>
    </div>
    <br />
    <div style="width: 825px; margin: 0 auto; text-align: center">
        <asp:Button ID="btnPDFPreview" runat="server" Text="預覽" meta:resourcekey="btnPDFPreviewResource1" />
        &nbsp; &nbsp;&nbsp;		
		<asp:Button ID="btnSubmit" runat="server" Text="確定" meta:resourcekey="btnSubmitResource1" OnClick="btnSubmit_Click" />
    </div>

    <telerik:RadWindow ID="modalPopup" runat="server" Width="600px" Height="800px" Modal="True" meta:resourcekey="modalPopupResource1">
        <ContentTemplate>
            <asp:Image ID="Image1" runat="server" Width="565px" Height="799px" meta:resourcekey="Image1Resource1"/>
        </ContentTemplate>
    </telerik:RadWindow>

    <input id="hidSelectColor" runat="server" value="#F9E7E8" style="width: 31px" type="hidden" />
    <input id="hidSelectColor2" runat="server" value="#F9E7E8" style="width: 31px" type="hidden" />
    <input id="hidFileGroupID" runat="server" style="width: 26px" type="hidden" />
    <asp:Label ID="labConfirmWaterTxt" runat="server" Text="確定要改變浮水印的設定?" Visible="False" meta:resourcekey="labConfirmWaterTxtResource1"></asp:Label>
    <asp:Label ID="labSaveSuccess" runat="server" Text="設定儲存成功" Visible="False" meta:resourcekey="labSaveSuccessResource1"></asp:Label>
    <asp:Label ID="labSaveFail" runat="server" Text="設定儲存失敗" Visible="False" meta:resourcekey="labSaveFailResource1"></asp:Label>
    <asp:Label ID="labChangeSetup" runat="server" Text="是否要改變浮水印的設定?" Visible="False" meta:resourcekey="labChangeSetupResource1"></asp:Label>
    <asp:Label id="labNeedUpLoad" runat="server" Text="請先上傳檔案" Visible="False" meta:resourcekey="labNeedUpLoadResource1" ></asp:Label>
    <asp:Label id="labNoFindFile" runat="server" Text="找不到該圖形浮水印檔案"  Visible="False" meta:resourcekey="labNoFindFileResource1" ></asp:Label>
    <asp:Label ID="lblMsgText" runat="server" Text="請填寫自訂浮水印文字內容" Visible="False" meta:resourcekey="lblMsgTextResource1"></asp:Label>
    <asp:Label ID="lblSysFont" runat="server" Text="系統預設浮水印字型" Visible="False" meta:resourcekey="lblSysFontResource1"></asp:Label>
    <asp:HiddenField ID="hfFileIsExist" runat="server" />
    <asp:HiddenField ID="hideTmpPdfID" runat="server" />
    <asp:HiddenField ID="hfconfirm" runat="server" />
</asp:Content>
