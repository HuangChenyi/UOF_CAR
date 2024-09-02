<%@ Control Language="C#" AutoEventWireup="true" Inherits="Common_ImageEditor_ResizeImage" Codebehind="ResizeImage.ascx.cs" %>
<script type="text/javascript">
    Type.registerNamespace("Telerik.Web.UI.ImageEditor");
    (function ($, $T, $IE) {
        $IE.ResizeImage = function (imageEditor) {
            $IE.ResizeImage.initializeBase(this, [imageEditor]);

            this._actualSizeBtn = null;
            this._fitImageBtn = null;
            this._zoomSlider = null;
        }
        $IE.ResizeImage.prototype =
     {
         initialize: function () {
             $IE.ResizeImage.callBaseMethod(this, "initialize");
             this._attachHandlers(true);
             this._sizeDialog();
             this._editableImage = this.get_imageEditor().getEditableImage();
             if (this._editableImage) {
                 this._originalWidth = this._editableImage.get_width();
                 this._originalHeight = this._editableImage.get_height();
                 this._updateCoefficients(this._originalWidth, this._originalHeight);
             }
             //decorate the textbox
            // this.get_imageEditor().get_formDecorator().decorate(this.get_textBox().parentNode);

             //We need a small timeout for the Slider to load the CSS and compute its dimensions
             var zoomSlider = this.get_zoomSlider();
             window.setTimeout(function () {
                 if (zoomSlider) zoomSlider.repaint();
             }, 100);



         },

         dispose: function () {
             this._attachHandlers(false);

             $IE.ResizeImage.callBaseMethod(this, "dispose");
         },

         _sizeDialog: function () {
             var dialog = this.get_imageEditor().get_toolsPanel();
             setTimeout(function () {
                 dialog.set_width($(".contentWrapper").width() + 18);//18px is the size of the scrollbar
                 dialog.set_title("Resize Image");
             }, 0);
             

         },

         //zooms the image to the specified zoom level
         zoom: function (zoomLevel) {
             var imageEditor = this.get_imageEditor();

             imageEditor._zoomImage(zoomLevel);
         },

         //resizes the image to the specified width and height
         resize: function (width, height) {
             var imageEditor = this.get_imageEditor();

             this._originalWidth = parseInt(width);
             this._originalHeight = parseInt(height);
             imageEditor._resizeImage(this._originalWidth, this._originalHeight, true, false);
         },

         //gets the textbox that shows the current opacity on the image
         get_textBox: function () {
             if (!this._textBox) {
                 this._textBox = $get(this.get_parentId() + "TxtZoom");
                 if (this._textBox)
                     this._textBox.setAttribute("autoComplete", "off");
             }
             return this._textBox;
         },

         get_actualSizeBtn: function () {
             if (!this._actualSizeBtn) {
                 this._actualSizeBtn = $find(this.get_parentId() + "btnActualSize");
             }
             return this._actualSizeBtn;
         },

         get_fitImageBtn: function () {
             if (!this._fitImageBtn) {
                 this._fitImageBtn = $find(this.get_parentId() + "btnFitImage");
             }
             return this._fitImageBtn;
         },

         get_zoomSlider: function () {
             if (!this._zoomSlider) {
                 this._zoomSlider = $find(this.get_parentId() + "sliderZoom");
             }
             return this._zoomSlider;
         },

         get_max: function () {
             var slider = this.get_zoomSlider();
             return slider.get_maximumValue();
         },

         get_min: function () {
             var slider = this.get_zoomSlider();
             return slider.get_minimumValue();
         },

         get_widthTxt: function () {
             if (!this._widthTxt) {
                 this._widthTxt = $get(this.get_parentId() + "hideW");
                 if (this._widthTxt)
                     this._widthTxt.setAttribute("autoComplete", "off");
             }
             return this._widthTxt;
         },

         get_heightTxt: function () {
             if (!this._heightTxt) {
                 this._heightTxt = $get(this.get_parentId() + "hideH");
                 if (this._heightTxt)
                     this._heightTxt.setAttribute("autoComplete", "off");
             }
             return this._heightTxt;
         },

         _attachHandlers: function (toAttach) {
             var actualSizeBtn = this.get_actualSizeBtn();
             var fitImageBtn = this.get_fitImageBtn();
             var zoomSlider = this.get_zoomSlider();
             var txtW = this.get_widthTxt();
             var txtH = this.get_heightTxt();
             var txt = this.get_textBox();
             if (toAttach) {
                 
                 this._buttonClickDelegate = Function.createDelegate(this, this._buttonClick);
                 if (actualSizeBtn) actualSizeBtn.add_clicked(this._buttonClickDelegate);
                 if (fitImageBtn) fitImageBtn.add_clicked(this._buttonClickDelegate);
                 if (zoomSlider) {
                     this._valueChangedDelegate = Function.createDelegate(this, this._valueChanged);
                     zoomSlider.add_valueChanged(this._valueChangedDelegate);
                 }
                 if (txt) {
                     this._textBoxKeyDownDelegate = Function.createDelegate(this, this._textBoxKeyDown);
                     $addHandler(txt, "keydown", this._textBoxKeyDownDelegate);
                 }
             }
             else {
                 if (actualSizeBtn) actualSizeBtn.remove_clicked(this._buttonClickDelegate);
                 if (fitImageBtn) fitImageBtn.remove_clicked(this._buttonClickDelegate);
                 this._buttonClickDelegate = null;

                 if (zoomSlider) {
                     zoomSlider.remove_valueChanged(this._valueChangedDelegate);
                     this._valueChangedDelegate = null;
                 }
                 if (txt) {
                     $removeHandler(txt, "keydown", this._textBoxKeyDownDelegate);
                     this._textBoxKeyDownDelegate = null;
                 }
             }
             $("#btnOK").click($.proxy(this._btnOkClickHandler, this));
             $("#btnCancel").click($.proxy(this._btnCancelClickHandler, this));

         },

         _btnOkClickHandler: function () {
             if (this.get_image().width==0) {
                 alert('You need to select a image first');
                 return;
             }

             var imagesizeW = this._editableImage.get_width();//this.get_image().width;
             var imagesizeH = this._editableImage.get_height();//this.get_image().height;
             var s = $find(this.get_parentId() + "sliderZoom");
             var svalue = (s.get_value() / 100);
             var zoomsizeW = (imagesizeW * svalue).toFixed();
             var zoomsizeH = (imagesizeH * svalue).toFixed();
             var slider = this.get_zoomSlider();
             slider.set_value(100);
             var imageEditor = this.get_imageEditor();
             imageEditor._resizeImage(zoomsizeW, zoomsizeH, true, false);

             setTimeout(function () {
                 imageEditor.fire("Crop");
                 var imageEditorId = imageEditor.get_id();
                 $('#' + imageEditorId + '_ToolsPanel').hide();  //隱藏那個panel式窗
             }, 0);
             //this.resize(imagesizeW, imagesizeH);
          //  $("ctl00_ContentPlaceHolder1_UC_ImageEditor1_RadImageEditor1_canvas").resize(imagesizeW, imagesizeH);
        //     $("ctl00_ContentPlaceHolder1_UC_ImageEditor1_RadImageEditor1_canvas").removeAttr("height");
         //    $("ctl00_ContentPlaceHolder1_UC_ImageEditor1_RadImageEditor1_canvas").removeAttr("width");
            // var resizeOperation = new $IE.ResizeOperation(null, this.get_image().width, this.get_image().height);
            // this.get_imageEditor().insertImage(0, 0, this._selectedImage.src, [resizeOperation]);
             this.close();
         },

         _updateCoefficients: function (width, height) {
             width = parseInt(width);
             height = parseInt(height);
             this._ratioWH = height == 0 ? 1 : width / height;
             this._ratioHW = width == 0 ? 1 : height / width;
         },

         _btnCancelClickHandler: function () {
             this.close();
         },

         _buttonClick: function (sender, args) {
             var slider = this.get_zoomSlider();
             if (args.get_commandName() == "ActualSize") { slider.set_value(100); }
             else
             {
                 var imageEditor = this.get_imageEditor();
                 if (imageEditor) imageEditor.zoomBestFit();
             }
         },

         _valueChanged: function (sender, args) {
             this.zoom(sender.get_value());
             this.get_textBox().value = sender.get_value();
         },

         _textBoxKeyDown: function (args) {
             var keyCode = args.keyCode;

             var txt = this.get_textBox();
             var slider = this.get_zoomSlider();
             //if up arrow or down arrow pressed
             if (keyCode == 38 && this.incrementValue(txt, this.get_max())) { slider.set_value(txt.value); }
             else if (keyCode == 40 && this.decrementValue(txt, this.get_min())) { slider.set_value(txt.value); }

             if (keyCode == 13) //enter
             {
                 var value = this.checkValue(txt, this.get_min(), this.get_max());

                 if (value === false) { value = slider.get_value(); }
                 else
                 {
                     slider.set_value(value);
                 }
                 txt.value = value;
                 //Cancel the form submission
                 $telerik.cancelRawEvent(args.rawEvent);
                 return false;
             }

             if (keyCode == 27) //if escape cancel
             {
                 $telerik.cancelRawEvent(args.rawEvent);
                 return false;
             }
         },

         updateUI: function () {
             //updates the controllers (such us sliders, textboxes and etc.) on the ToolWidget
             var imageEditor = this.get_imageEditor();
             var editableImage = imageEditor ? imageEditor.getEditableImage() : null;
             var value = editableImage ? editableImage.get_zoomLevel() : 100;
             var zoomSlider = this.get_zoomSlider()
             zoomSlider.set_value(value);

             if (this._editableImage) {
                 this._originalWidth = this._editableImage.get_width();
                 this._originalHeight = this._editableImage.get_height();
                 this._updateCoefficients(this._originalWidth, this._originalHeight);
             }
         },
         get_name: function () {
             //the name of the tool widget used for identification
         },
         onOpen: function () {
             //the event handler for the open event of the tool panel
         },
         onClose: function () {
             //the event handler for the close event of the tool panel
             this.get_imageEditor()._isOurRequest = false;
         }
         , get_parentId: function () {
             if (!this._parentId)
                 this._parentId = this.get_imageEditor().get_id() + "_ToolsPanel_C_ctl02_";
             return this._parentId;
         }

     };
        $IE.ResizeImage.registerClass("Telerik.Web.UI.ImageEditor.ResizeImage", $IE.ToolWidget, $IE.IToolWidget);
    })($telerik.$, Telerik.Web.UI, Telerik.Web.UI.ImageEditor);
</script>
<style type="text/css">
    .selected
    {
        background: Red;
    }

    .contentWrapper
    {
        width: 333px;
        height: 100px;
        border: 1px solid #666666;
        overflow:auto;
    }

</style>
<div class="contentWrapper">
  <table id="Table" class="rieDialogsTable rieZoomTable" border="0" cellpadding="0" cellspacing="0"
	runat="server">
	<tr>
		<td>
			<telerik:RadSlider ID="sliderZoom" runat="server" EnableViewState="false" MinimumValue="25"
				MaximumValue="400" Value="100" Width="180px">
			</telerik:RadSlider>
		</td>
		<td>
			<asp:TextBox ID="TxtZoom" runat="server" Text="100" ToolTip="Zoom" Width="35px" EnableViewState="false" />
			<asp:Label ID="lblPercent" Text="%" runat="server" AssociatedControlID="TxtZoom"
				Style="padding: 0 2px 0 2px" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<telerik:RadButton ID="btnActualSize" runat="server" ToolTip="Actual Size" AutoPostBack="false"
				CausesValidation="false" EnableViewState="false" CommandName="ActualSize" Width="20px"
				CssClass="rieZIndex_IE9">
				<Icon PrimaryIconCssClass="rieActualSize" PrimaryIconTop="4px" PrimaryIconLeft="4px" />
			</telerik:RadButton>
			<label id="lblActualSize" runat="server">
				Actual Size</label>
			<telerik:RadButton ID="btnFitImage" runat="server" ToolTip="Best Fit" AutoPostBack="false"
				CausesValidation="false" EnableViewState="false" CommandName="BestFit" Width="20px"
				Style="margin-left: 7px;" CssClass="rieZIndex_IE9">
				<Icon PrimaryIconCssClass="rieBestFit" PrimaryIconTop="4px" PrimaryIconLeft="5px" />
			</telerik:RadButton>
			<label id="lblBestFit" runat="server">
				Best Fit</label>
		</td>
	</tr>
</table>
</div>
<asp:Button ID="btnOK" runat="server" Text="OK" />
<asp:Button ID="btnCancel" runat="server" Text="Cancel" />
<asp:HiddenField ID="hideW" runat="server" />
<asp:HiddenField ID="hideH" runat="server" />
