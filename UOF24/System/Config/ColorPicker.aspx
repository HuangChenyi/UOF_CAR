<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master"
    AutoEventWireup="true" Inherits="System_Config_ColorPicker"
    Culture="auto" UICulture="auto" Codebehind="ColorPicker.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <html>
    <head>

        <script type="text/jscript">


            function ColorPicker_pickColor(newColor) {
                var SelectType = '<%=SelectType %>';
                if (SelectType == "SYS") {

                    window.parent.dialogArguments.ChangeColor(newColor);

                    top.close();
                }
                else if (SelectType == "USER") {
                    window.parent.dialogArguments.ChangeColor2(newColor);
                    top.close();
                }
            }


            function ColorPicker_highlightColor(newColor) {
                $("#colorPickerSelectedColorValue").text(newColor);
                $("#colorPickerSelectedColor").css("background-color", newColor);

            }

        </script>
        <style type="text/css">
            TABLE.Bordercolor
            {
                border: 1px groove #999999;
            }

            .Bordercolor TD
            {
                border: 1px groove #FFFFFF;
            }
        </style>
        <title>Select Color</title>
    </head>
    <body>

        <table border="1" style="width:100%;height:100%" class="Bordercolor">
            <tbody>
                <tr>
                    <td style="background-color: #000000">                        
                        <a href="#" onclick="ColorPicker_pickColor('#000000');"
                            onmouseover="ColorPicker_highlightColor('#000000')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #000033">
                        <a href="#" onclick="ColorPicker_pickColor('#000033');"
                            onmouseover="ColorPicker_highlightColor('#000033')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #000066">
                        <a href="#" onclick="ColorPicker_pickColor('#000066');"
                            onmouseover="ColorPicker_highlightColor('#000066')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #000099">
                        <a href="#" onclick="ColorPicker_pickColor('#000099');"
                            onmouseover="ColorPicker_highlightColor('#000099')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #0000CC">
                        <a href="#" onclick="ColorPicker_pickColor('#0000CC');"
                            onmouseover="ColorPicker_highlightColor('#0000CC')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #0000FF">
                        <a href="#" onclick="ColorPicker_pickColor('#0000FF');"
                            onmouseover="ColorPicker_highlightColor('#0000FF')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #330000">
                        <a href="#" onclick="ColorPicker_pickColor('#330000');"
                            onmouseover="ColorPicker_highlightColor('#330000')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #330033">
                        <a href="#" onclick="ColorPicker_pickColor('#330033');"
                            onmouseover="ColorPicker_highlightColor('#330033')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #330066">
                        <a href="#" onclick="ColorPicker_pickColor('#330066');"
                            onmouseover="ColorPicker_highlightColor('#330066')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #330099">
                        <a href="#" onclick="ColorPicker_pickColor('#330099');"
                            onmouseover="ColorPicker_highlightColor('#330099')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #3300CC">
                        <a href="#" onclick="ColorPicker_pickColor('#3300CC');"
                            onmouseover="ColorPicker_highlightColor('#3300CC')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #3300FF">
                        <a href="#" onclick="ColorPicker_pickColor('#3300FF');"
                            onmouseover="ColorPicker_highlightColor('#3300FF')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #660000">
                        <a href="#" onclick="ColorPicker_pickColor('#660000');"
                            onmouseover="ColorPicker_highlightColor('#660000')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #660033">
                        <a href="#" onclick="ColorPicker_pickColor('#660033');"
                            onmouseover="ColorPicker_highlightColor('#660033')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #660066">
                        <a href="#" onclick="ColorPicker_pickColor('#660066');"
                            onmouseover="ColorPicker_highlightColor('#660066')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #660099">
                        <a href="#" onclick="ColorPicker_pickColor('#660099');"
                            onmouseover="ColorPicker_highlightColor('#660099')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #6600CC">
                        <a href="#" onclick="ColorPicker_pickColor('#6600CC');"
                            onmouseover="ColorPicker_highlightColor('#6600CC')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                    <td style="background-color: #6600FF">
                        <a href="#" onclick="ColorPicker_pickColor('#6600FF');"
                            onmouseover="ColorPicker_highlightColor('#6600FF')"
                            style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>

                </tr>

                <tr>
                    <td style="background-color: #990000">
                        <a href="#" onclick="ColorPicker_pickColor('#990000');" onmouseover="ColorPicker_highlightColor('#990000')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #990033">
                        <a href="#" onclick="ColorPicker_pickColor('#990033');" onmouseover="ColorPicker_highlightColor('#990033')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #990066">
                        <a href="#" onclick="ColorPicker_pickColor('#990066');" onmouseover="ColorPicker_highlightColor('#990066')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #990099">
                        <a href="#" onclick="ColorPicker_pickColor('#990099');" onmouseover="ColorPicker_highlightColor('#990099')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #9900CC">
                        <a href="#" onclick="ColorPicker_pickColor('#9900CC');" onmouseover="ColorPicker_highlightColor('#9900CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #9900FF">
                        <a href="#" onclick="ColorPicker_pickColor('#9900FF');" onmouseover="ColorPicker_highlightColor('#9900FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC0000">
                        <a href="#" onclick="ColorPicker_pickColor('#CC0000');" onmouseover="ColorPicker_highlightColor('#CC0000')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC0033">
                        <a href="#" onclick="ColorPicker_pickColor('#CC0033');" onmouseover="ColorPicker_highlightColor('#CC0033')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC0066">
                        <a href="#" onclick="ColorPicker_pickColor('#CC0066');" onmouseover="ColorPicker_highlightColor('#CC0066')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC0099">
                        <a href="#" onclick="ColorPicker_pickColor('#CC0099');" onmouseover="ColorPicker_highlightColor('#CC0099')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC00CC">
                        <a href="#" onclick="ColorPicker_pickColor('#CC00CC');" onmouseover="ColorPicker_highlightColor('#CC00CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC00FF">
                        <a href="#" onclick="ColorPicker_pickColor('#CC00FF');" onmouseover="ColorPicker_highlightColor('#CC00FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF0000">
                        <a href="#" onclick="ColorPicker_pickColor('#FF0000');" onmouseover="ColorPicker_highlightColor('#FF0000')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF0033">
                        <a href="#" onclick="ColorPicker_pickColor('#FF0033');" onmouseover="ColorPicker_highlightColor('#FF0033')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF0066">
                        <a href="#" onclick="ColorPicker_pickColor('#FF0066');" onmouseover="ColorPicker_highlightColor('#FF0066')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF0099">
                        <a href="#" onclick="ColorPicker_pickColor('#FF0099');" onmouseover="ColorPicker_highlightColor('#FF0099')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF00CC">
                        <a href="#" onclick="ColorPicker_pickColor('#FF00CC');" onmouseover="ColorPicker_highlightColor('#FF00CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF00FF">
                        <a href="#" onclick="ColorPicker_pickColor('#FF00FF');" onmouseover="ColorPicker_highlightColor('#FF00FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td style="background-color: #003300"><a href="#" onclick="ColorPicker_pickColor('#003300');" onmouseover="ColorPicker_highlightColor('#003300')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #003333"><a href="#" onclick="ColorPicker_pickColor('#003333');" onmouseover="ColorPicker_highlightColor('#003333')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #003366"><a href="#" onclick="ColorPicker_pickColor('#003366');" onmouseover="ColorPicker_highlightColor('#003366')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #003399"><a href="#" onclick="ColorPicker_pickColor('#003399');" onmouseover="ColorPicker_highlightColor('#003399')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #0033CC"><a href="#" onclick="ColorPicker_pickColor('#0033CC');" onmouseover="ColorPicker_highlightColor('#0033CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #0033FF"><a href="#" onclick="ColorPicker_pickColor('#0033FF');" onmouseover="ColorPicker_highlightColor('#0033FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #333300"><a href="#" onclick="ColorPicker_pickColor('#333300');" onmouseover="ColorPicker_highlightColor('#333300')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #333333"><a href="#" onclick="ColorPicker_pickColor('#333333');" onmouseover="ColorPicker_highlightColor('#333333')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #333366"><a href="#" onclick="ColorPicker_pickColor('#333366');" onmouseover="ColorPicker_highlightColor('#333366')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #333399"><a href="#" onclick="ColorPicker_pickColor('#333399');" onmouseover="ColorPicker_highlightColor('#333399')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #3333CC"><a href="#" onclick="ColorPicker_pickColor('#3333CC');" onmouseover="ColorPicker_highlightColor('#3333CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #3333FF"><a href="#" onclick="ColorPicker_pickColor('#3333FF');" onmouseover="ColorPicker_highlightColor('#3333FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #663300"><a href="#" onclick="ColorPicker_pickColor('#663300');" onmouseover="ColorPicker_highlightColor('#663300')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #663333"><a href="#" onclick="ColorPicker_pickColor('#663333');" onmouseover="ColorPicker_highlightColor('#663333')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #663366"><a href="#" onclick="ColorPicker_pickColor('#663366');" onmouseover="ColorPicker_highlightColor('#663366')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #663399"><a href="#" onclick="ColorPicker_pickColor('#663399');" onmouseover="ColorPicker_highlightColor('#663399')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #6633CC"><a href="#" onclick="ColorPicker_pickColor('#6633CC');" onmouseover="ColorPicker_highlightColor('#6633CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #6633FF"><a href="#" onclick="ColorPicker_pickColor('#6633FF');" onmouseover="ColorPicker_highlightColor('#6633FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td style="background-color: #993300"><a href="#" onclick="ColorPicker_pickColor('#993300');" onmouseover="ColorPicker_highlightColor('#993300')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #993333"><a href="#" onclick="ColorPicker_pickColor('#993333');" onmouseover="ColorPicker_highlightColor('#993333')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #993366"><a href="#" onclick="ColorPicker_pickColor('#993366');" onmouseover="ColorPicker_highlightColor('#993366')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #993399"><a href="#" onclick="ColorPicker_pickColor('#993399');" onmouseover="ColorPicker_highlightColor('#993399')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #9933CC"><a href="#" onclick="ColorPicker_pickColor('#9933CC');" onmouseover="ColorPicker_highlightColor('#9933CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #9933FF"><a href="#" onclick="ColorPicker_pickColor('#9933FF');" onmouseover="ColorPicker_highlightColor('#9933FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC3300"><a href="#" onclick="ColorPicker_pickColor('#CC3300');" onmouseover="ColorPicker_highlightColor('#CC3300')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC3333"><a href="#" onclick="ColorPicker_pickColor('#CC3333');" onmouseover="ColorPicker_highlightColor('#CC3333')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC3366"><a href="#" onclick="ColorPicker_pickColor('#CC3366');" onmouseover="ColorPicker_highlightColor('#CC3366')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC3399"><a href="#" onclick="ColorPicker_pickColor('#CC3399');" onmouseover="ColorPicker_highlightColor('#CC3399')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC33CC"><a href="#" onclick="ColorPicker_pickColor('#CC33CC');" onmouseover="ColorPicker_highlightColor('#CC33CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC33FF"><a href="#" onclick="ColorPicker_pickColor('#CC33FF');" onmouseover="ColorPicker_highlightColor('#CC33FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF3300"><a href="#" onclick="ColorPicker_pickColor('#FF3300');" onmouseover="ColorPicker_highlightColor('#FF3300')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF3333"><a href="#" onclick="ColorPicker_pickColor('#FF3333');" onmouseover="ColorPicker_highlightColor('#FF3333')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF3366"><a href="#" onclick="ColorPicker_pickColor('#FF3366');" onmouseover="ColorPicker_highlightColor('#FF3366')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF3399"><a href="#" onclick="ColorPicker_pickColor('#FF3399');" onmouseover="ColorPicker_highlightColor('#FF3399')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF33CC"><a href="#" onclick="ColorPicker_pickColor('#FF33CC');" onmouseover="ColorPicker_highlightColor('#FF33CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF33FF"><a href="#" onclick="ColorPicker_pickColor('#FF33FF');" onmouseover="ColorPicker_highlightColor('#FF33FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td style="background-color: #006600"><a href="#" onclick="ColorPicker_pickColor('#006600');" onmouseover="ColorPicker_highlightColor('#006600')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #006633"><a href="#" onclick="ColorPicker_pickColor('#006633');" onmouseover="ColorPicker_highlightColor('#006633')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #006666"><a href="#" onclick="ColorPicker_pickColor('#006666');" onmouseover="ColorPicker_highlightColor('#006666')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #006699"><a href="#" onclick="ColorPicker_pickColor('#006699');" onmouseover="ColorPicker_highlightColor('#006699')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #0066CC"><a href="#" onclick="ColorPicker_pickColor('#0066CC');" onmouseover="ColorPicker_highlightColor('#0066CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #0066FF"><a href="#" onclick="ColorPicker_pickColor('#0066FF');" onmouseover="ColorPicker_highlightColor('#0066FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #336600"><a href="#" onclick="ColorPicker_pickColor('#336600');" onmouseover="ColorPicker_highlightColor('#336600')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #336633"><a href="#" onclick="ColorPicker_pickColor('#336633');" onmouseover="ColorPicker_highlightColor('#336633')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #336666"><a href="#" onclick="ColorPicker_pickColor('#336666');" onmouseover="ColorPicker_highlightColor('#336666')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #336699"><a href="#" onclick="ColorPicker_pickColor('#336699');" onmouseover="ColorPicker_highlightColor('#336699')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #3366CC"><a href="#" onclick="ColorPicker_pickColor('#3366CC');" onmouseover="ColorPicker_highlightColor('#3366CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #3366FF"><a href="#" onclick="ColorPicker_pickColor('#3366FF');" onmouseover="ColorPicker_highlightColor('#3366FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #666600"><a href="#" onclick="ColorPicker_pickColor('#666600');" onmouseover="ColorPicker_highlightColor('#666600')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #666633"><a href="#" onclick="ColorPicker_pickColor('#666633');" onmouseover="ColorPicker_highlightColor('#666633')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #666666"><a href="#" onclick="ColorPicker_pickColor('#666666');" onmouseover="ColorPicker_highlightColor('#666666')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #666699"><a href="#" onclick="ColorPicker_pickColor('#666699');" onmouseover="ColorPicker_highlightColor('#666699')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #6666CC"><a href="#" onclick="ColorPicker_pickColor('#6666CC');" onmouseover="ColorPicker_highlightColor('#6666CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #6666FF"><a href="#" onclick="ColorPicker_pickColor('#6666FF');" onmouseover="ColorPicker_highlightColor('#6666FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td style="background-color: #996600"><a href="#" onclick="ColorPicker_pickColor('#996600');" onmouseover="ColorPicker_highlightColor('#996600')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #996633"><a href="#" onclick="ColorPicker_pickColor('#996633');" onmouseover="ColorPicker_highlightColor('#996633')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #996666"><a href="#" onclick="ColorPicker_pickColor('#996666');" onmouseover="ColorPicker_highlightColor('#996666')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #996699"><a href="#" onclick="ColorPicker_pickColor('#996699');" onmouseover="ColorPicker_highlightColor('#996699')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #9966CC"><a href="#" onclick="ColorPicker_pickColor('#9966CC');" onmouseover="ColorPicker_highlightColor('#9966CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #9966FF"><a href="#" onclick="ColorPicker_pickColor('#9966FF');" onmouseover="ColorPicker_highlightColor('#9966FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC6600"><a href="#" onclick="ColorPicker_pickColor('#CC6600');" onmouseover="ColorPicker_highlightColor('#CC6600')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC6633"><a href="#" onclick="ColorPicker_pickColor('#CC6633');" onmouseover="ColorPicker_highlightColor('#CC6633')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC6666"><a href="#" onclick="ColorPicker_pickColor('#CC6666');" onmouseover="ColorPicker_highlightColor('#CC6666')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC6699"><a href="#" onclick="ColorPicker_pickColor('#CC6699');" onmouseover="ColorPicker_highlightColor('#CC6699')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC66CC"><a href="#" onclick="ColorPicker_pickColor('#CC66CC');" onmouseover="ColorPicker_highlightColor('#CC66CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC66FF"><a href="#" onclick="ColorPicker_pickColor('#CC66FF');" onmouseover="ColorPicker_highlightColor('#CC66FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF6600"><a href="#" onclick="ColorPicker_pickColor('#FF6600');" onmouseover="ColorPicker_highlightColor('#FF6600')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF6633"><a href="#" onclick="ColorPicker_pickColor('#FF6633');" onmouseover="ColorPicker_highlightColor('#FF6633')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF6666"><a href="#" onclick="ColorPicker_pickColor('#FF6666');" onmouseover="ColorPicker_highlightColor('#FF6666')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF6699"><a href="#" onclick="ColorPicker_pickColor('#FF6699');" onmouseover="ColorPicker_highlightColor('#FF6699')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF66CC"><a href="#" onclick="ColorPicker_pickColor('#FF66CC');" onmouseover="ColorPicker_highlightColor('#FF66CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF66FF"><a href="#" onclick="ColorPicker_pickColor('#FF66FF');" onmouseover="ColorPicker_highlightColor('#FF66FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td style="background-color: #009900"><a href="#" onclick="ColorPicker_pickColor('#009900');" onmouseover="ColorPicker_highlightColor('#009900')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #009933"><a href="#" onclick="ColorPicker_pickColor('#009933');" onmouseover="ColorPicker_highlightColor('#009933')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #009966"><a href="#" onclick="ColorPicker_pickColor('#009966');" onmouseover="ColorPicker_highlightColor('#009966')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #009999"><a href="#" onclick="ColorPicker_pickColor('#009999');" onmouseover="ColorPicker_highlightColor('#009999')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #0099CC"><a href="#" onclick="ColorPicker_pickColor('#0099CC');" onmouseover="ColorPicker_highlightColor('#0099CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #0099FF"><a href="#" onclick="ColorPicker_pickColor('#0099FF');" onmouseover="ColorPicker_highlightColor('#0099FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #339900"><a href="#" onclick="ColorPicker_pickColor('#339900');" onmouseover="ColorPicker_highlightColor('#339900')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #339933"><a href="#" onclick="ColorPicker_pickColor('#339933');" onmouseover="ColorPicker_highlightColor('#339933')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #339966"><a href="#" onclick="ColorPicker_pickColor('#339966');" onmouseover="ColorPicker_highlightColor('#339966')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #339999"><a href="#" onclick="ColorPicker_pickColor('#339999');" onmouseover="ColorPicker_highlightColor('#339999')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #3399CC"><a href="#" onclick="ColorPicker_pickColor('#3399CC');" onmouseover="ColorPicker_highlightColor('#3399CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #3399FF"><a href="#" onclick="ColorPicker_pickColor('#3399FF');" onmouseover="ColorPicker_highlightColor('#3399FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #669900"><a href="#" onclick="ColorPicker_pickColor('#669900');" onmouseover="ColorPicker_highlightColor('#669900')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #669933"><a href="#" onclick="ColorPicker_pickColor('#669933');" onmouseover="ColorPicker_highlightColor('#669933')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #669966"><a href="#" onclick="ColorPicker_pickColor('#669966');" onmouseover="ColorPicker_highlightColor('#669966')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #669999"><a href="#" onclick="ColorPicker_pickColor('#669999');" onmouseover="ColorPicker_highlightColor('#669999')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #6699CC"><a href="#" onclick="ColorPicker_pickColor('#6699CC');" onmouseover="ColorPicker_highlightColor('#6699CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #6699FF"><a href="#" onclick="ColorPicker_pickColor('#6699FF');" onmouseover="ColorPicker_highlightColor('#6699FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td style="background-color: #999900"><a href="#" onclick="ColorPicker_pickColor('#999900');" onmouseover="ColorPicker_highlightColor('#999900')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #999933"><a href="#" onclick="ColorPicker_pickColor('#999933');" onmouseover="ColorPicker_highlightColor('#999933')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #999966"><a href="#" onclick="ColorPicker_pickColor('#999966');" onmouseover="ColorPicker_highlightColor('#999966')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #999999"><a href="#" onclick="ColorPicker_pickColor('#999999');" onmouseover="ColorPicker_highlightColor('#999999')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #9999CC"><a href="#" onclick="ColorPicker_pickColor('#9999CC');" onmouseover="ColorPicker_highlightColor('#9999CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #9999FF"><a href="#" onclick="ColorPicker_pickColor('#9999FF');" onmouseover="ColorPicker_highlightColor('#9999FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC9900"><a href="#" onclick="ColorPicker_pickColor('#CC9900');" onmouseover="ColorPicker_highlightColor('#CC9900')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC9933"><a href="#" onclick="ColorPicker_pickColor('#CC9933');" onmouseover="ColorPicker_highlightColor('#CC9933')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC9966"><a href="#" onclick="ColorPicker_pickColor('#CC9966');" onmouseover="ColorPicker_highlightColor('#CC9966')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC9999"><a href="#" onclick="ColorPicker_pickColor('#CC9999');" onmouseover="ColorPicker_highlightColor('#CC9999')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC99CC"><a href="#" onclick="ColorPicker_pickColor('#CC99CC');" onmouseover="ColorPicker_highlightColor('#CC99CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CC99FF"><a href="#" onclick="ColorPicker_pickColor('#CC99FF');" onmouseover="ColorPicker_highlightColor('#CC99FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF9900"><a href="#" onclick="ColorPicker_pickColor('#FF9900');" onmouseover="ColorPicker_highlightColor('#FF9900')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF9933"><a href="#" onclick="ColorPicker_pickColor('#FF9933');" onmouseover="ColorPicker_highlightColor('#FF9933')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF9966"><a href="#" onclick="ColorPicker_pickColor('#FF9966');" onmouseover="ColorPicker_highlightColor('#FF9966')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF9999"><a href="#" onclick="ColorPicker_pickColor('#FF9999');" onmouseover="ColorPicker_highlightColor('#FF9999')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF99CC"><a href="#" onclick="ColorPicker_pickColor('#FF99CC');" onmouseover="ColorPicker_highlightColor('#FF99CC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FF99FF"><a href="#" onclick="ColorPicker_pickColor('#FF99FF');" onmouseover="ColorPicker_highlightColor('#FF99FF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td style="background-color: #00CC00"><a href="#" onclick="ColorPicker_pickColor('#00CC00');" onmouseover="ColorPicker_highlightColor('#00CC00')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #00CC33"><a href="#" onclick="ColorPicker_pickColor('#00CC33');" onmouseover="ColorPicker_highlightColor('#00CC33')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #00CC66"><a href="#" onclick="ColorPicker_pickColor('#00CC66');" onmouseover="ColorPicker_highlightColor('#00CC66')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #00CC99"><a href="#" onclick="ColorPicker_pickColor('#00CC99');" onmouseover="ColorPicker_highlightColor('#00CC99')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #00CCCC"><a href="#" onclick="ColorPicker_pickColor('#00CCCC');" onmouseover="ColorPicker_highlightColor('#00CCCC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #00CCFF"><a href="#" onclick="ColorPicker_pickColor('#00CCFF');" onmouseover="ColorPicker_highlightColor('#00CCFF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #33CC00"><a href="#" onclick="ColorPicker_pickColor('#33CC00');" onmouseover="ColorPicker_highlightColor('#33CC00')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #33CC33"><a href="#" onclick="ColorPicker_pickColor('#33CC33');" onmouseover="ColorPicker_highlightColor('#33CC33')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #33CC66"><a href="#" onclick="ColorPicker_pickColor('#33CC66');" onmouseover="ColorPicker_highlightColor('#33CC66')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #33CC99"><a href="#" onclick="ColorPicker_pickColor('#33CC99');" onmouseover="ColorPicker_highlightColor('#33CC99')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #33CCCC"><a href="#" onclick="ColorPicker_pickColor('#33CCCC');" onmouseover="ColorPicker_highlightColor('#33CCCC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #33CCFF"><a href="#" onclick="ColorPicker_pickColor('#33CCFF');" onmouseover="ColorPicker_highlightColor('#33CCFF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #66CC00"><a href="#" onclick="ColorPicker_pickColor('#66CC00');" onmouseover="ColorPicker_highlightColor('#66CC00')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #66CC33"><a href="#" onclick="ColorPicker_pickColor('#66CC33');" onmouseover="ColorPicker_highlightColor('#66CC33')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #66CC66"><a href="#" onclick="ColorPicker_pickColor('#66CC66');" onmouseover="ColorPicker_highlightColor('#66CC66')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #66CC99"><a href="#" onclick="ColorPicker_pickColor('#66CC99');" onmouseover="ColorPicker_highlightColor('#66CC99')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #66CCCC"><a href="#" onclick="ColorPicker_pickColor('#66CCCC');" onmouseover="ColorPicker_highlightColor('#66CCCC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #66CCFF"><a href="#" onclick="ColorPicker_pickColor('#66CCFF');" onmouseover="ColorPicker_highlightColor('#66CCFF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td style="background-color: #99CC00"><a href="#" onclick="ColorPicker_pickColor('#99CC00');" onmouseover="ColorPicker_highlightColor('#99CC00')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #99CC33"><a href="#" onclick="ColorPicker_pickColor('#99CC33');" onmouseover="ColorPicker_highlightColor('#99CC33')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #99CC66"><a href="#" onclick="ColorPicker_pickColor('#99CC66');" onmouseover="ColorPicker_highlightColor('#99CC66')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #99CC99"><a href="#" onclick="ColorPicker_pickColor('#99CC99');" onmouseover="ColorPicker_highlightColor('#99CC99')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #99CCCC"><a href="#" onclick="ColorPicker_pickColor('#99CCCC');" onmouseover="ColorPicker_highlightColor('#99CCCC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #99CCFF"><a href="#" onclick="ColorPicker_pickColor('#99CCFF');" onmouseover="ColorPicker_highlightColor('#99CCFF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CCCC00"><a href="#" onclick="ColorPicker_pickColor('#CCCC00');" onmouseover="ColorPicker_highlightColor('#CCCC00')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CCCC33"><a href="#" onclick="ColorPicker_pickColor('#CCCC33');" onmouseover="ColorPicker_highlightColor('#CCCC33')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CCCC66"><a href="#" onclick="ColorPicker_pickColor('#CCCC66');" onmouseover="ColorPicker_highlightColor('#CCCC66')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CCCC99"><a href="#" onclick="ColorPicker_pickColor('#CCCC99');" onmouseover="ColorPicker_highlightColor('#CCCC99')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CCCCCC"><a href="#" onclick="ColorPicker_pickColor('#CCCCCC');" onmouseover="ColorPicker_highlightColor('#CCCCCC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CCCCFF"><a href="#" onclick="ColorPicker_pickColor('#CCCCFF');" onmouseover="ColorPicker_highlightColor('#CCCCFF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FFCC00"><a href="#" onclick="ColorPicker_pickColor('#FFCC00');" onmouseover="ColorPicker_highlightColor('#FFCC00')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FFCC33"><a href="#" onclick="ColorPicker_pickColor('#FFCC33');" onmouseover="ColorPicker_highlightColor('#FFCC33')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FFCC66"><a href="#" onclick="ColorPicker_pickColor('#FFCC66');" onmouseover="ColorPicker_highlightColor('#FFCC66')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FFCC99"><a href="#" onclick="ColorPicker_pickColor('#FFCC99');" onmouseover="ColorPicker_highlightColor('#FFCC99')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FFCCCC"><a href="#" onclick="ColorPicker_pickColor('#FFCCCC');" onmouseover="ColorPicker_highlightColor('#FFCCCC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #F9E7E8">
                        <a href="#" onclick="ColorPicker_pickColor('#F9E7E8');" onmouseover="ColorPicker_highlightColor('#F9E7E8')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td style="background-color: #00FF00"><a href="#" onclick="ColorPicker_pickColor('#00FF00');" onmouseover="ColorPicker_highlightColor('#00FF00')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #00FF33"><a href="#" onclick="ColorPicker_pickColor('#00FF33');" onmouseover="ColorPicker_highlightColor('#00FF33')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #00FF66"><a href="#" onclick="ColorPicker_pickColor('#00FF66');" onmouseover="ColorPicker_highlightColor('#00FF66')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #00FF99"><a href="#" onclick="ColorPicker_pickColor('#00FF99');" onmouseover="ColorPicker_highlightColor('#00FF99')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #00FFCC"><a href="#" onclick="ColorPicker_pickColor('#00FFCC');" onmouseover="ColorPicker_highlightColor('#00FFCC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #00FFFF"><a href="#" onclick="ColorPicker_pickColor('#00FFFF');" onmouseover="ColorPicker_highlightColor('#00FFFF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #33FF00"><a href="#" onclick="ColorPicker_pickColor('#33FF00');" onmouseover="ColorPicker_highlightColor('#33FF00')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #33FF33"><a href="#" onclick="ColorPicker_pickColor('#33FF33');" onmouseover="ColorPicker_highlightColor('#33FF33')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #33FF66"><a href="#" onclick="ColorPicker_pickColor('#33FF66');" onmouseover="ColorPicker_highlightColor('#33FF66')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #33FF99"><a href="#" onclick="ColorPicker_pickColor('#33FF99');" onmouseover="ColorPicker_highlightColor('#33FF99')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #33FFCC"><a href="#" onclick="ColorPicker_pickColor('#33FFCC');" onmouseover="ColorPicker_highlightColor('#33FFCC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #33FFFF"><a href="#" onclick="ColorPicker_pickColor('#33FFFF');" onmouseover="ColorPicker_highlightColor('#33FFFF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #66FF00"><a href="#" onclick="ColorPicker_pickColor('#66FF00');" onmouseover="ColorPicker_highlightColor('#66FF00')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #66FF33"><a href="#" onclick="ColorPicker_pickColor('#66FF33');" onmouseover="ColorPicker_highlightColor('#66FF33')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #66FF66"><a href="#" onclick="ColorPicker_pickColor('#66FF66');" onmouseover="ColorPicker_highlightColor('#66FF66')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #66FF99"><a href="#" onclick="ColorPicker_pickColor('#66FF99');" onmouseover="ColorPicker_highlightColor('#66FF99')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #66FFCC"><a href="#" onclick="ColorPicker_pickColor('#66FFCC');" onmouseover="ColorPicker_highlightColor('#66FFCC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #66FFFF"><a href="#" onclick="ColorPicker_pickColor('#66FFFF');" onmouseover="ColorPicker_highlightColor('#66FFFF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td style="background-color: #99FF00"><a href="#" onclick="ColorPicker_pickColor('#99FF00');" onmouseover="ColorPicker_highlightColor('#99FF00')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #99FF33"><a href="#" onclick="ColorPicker_pickColor('#99FF33');" onmouseover="ColorPicker_highlightColor('#99FF33')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #99FF66"><a href="#" onclick="ColorPicker_pickColor('#99FF66');" onmouseover="ColorPicker_highlightColor('#99FF66')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #99FF99"><a href="#" onclick="ColorPicker_pickColor('#99FF99');" onmouseover="ColorPicker_highlightColor('#99FF99')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #99FFCC"><a href="#" onclick="ColorPicker_pickColor('#99FFCC');" onmouseover="ColorPicker_highlightColor('#99FFCC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #99FFFF"><a href="#" onclick="ColorPicker_pickColor('#99FFFF');" onmouseover="ColorPicker_highlightColor('#99FFFF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CCFF00"><a href="#" onclick="ColorPicker_pickColor('#CCFF00');" onmouseover="ColorPicker_highlightColor('#CCFF00')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CCFF33"><a href="#" onclick="ColorPicker_pickColor('#CCFF33');" onmouseover="ColorPicker_highlightColor('#CCFF33')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CCFF66"><a href="#" onclick="ColorPicker_pickColor('#CCFF66');" onmouseover="ColorPicker_highlightColor('#CCFF66')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CCFF99"><a href="#" onclick="ColorPicker_pickColor('#CCFF99');" onmouseover="ColorPicker_highlightColor('#CCFF99')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CCFFCC"><a href="#" onclick="ColorPicker_pickColor('#CCFFCC');" onmouseover="ColorPicker_highlightColor('#CCFFCC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #CCFFFF"><a href="#" onclick="ColorPicker_pickColor('#CCFFFF');" onmouseover="ColorPicker_highlightColor('#CCFFFF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FFFF00"><a href="#" onclick="ColorPicker_pickColor('#FFFF00');" onmouseover="ColorPicker_highlightColor('#FFFF00')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FFFF33"><a href="#" onclick="ColorPicker_pickColor('#FFFF33');" onmouseover="ColorPicker_highlightColor('#FFFF33')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FFFF66"><a href="#" onclick="ColorPicker_pickColor('#FFFF66');" onmouseover="ColorPicker_highlightColor('#FFFF66')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FFFF99"><a href="#" onclick="ColorPicker_pickColor('#FFFF99');" onmouseover="ColorPicker_highlightColor('#FFFF99')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FFFFCC"><a href="#" onclick="ColorPicker_pickColor('#FFFFCC');" onmouseover="ColorPicker_highlightColor('#FFFFCC')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                    <td style="background-color: #FFFFFF"><a href="#" onclick="ColorPicker_pickColor('#FFFFFF');" onmouseover="ColorPicker_highlightColor('#FFFFFF')" style="text-decoration: none;">&nbsp;&nbsp;&nbsp;</a></td>
                </tr>
                <tr>
                    <td colspan='9' style="background-color:#FFFFFF" id='colorPickerSelectedColor'>&nbsp;</td>
                    <td colspan='9' style="text-align:center" id='colorPickerSelectedColorValue'>#FFFFFF</td>
                </tr>
            </tbody>
        </table>
    </body>
    </html>



</asp:Content>

