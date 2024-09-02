<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormManagement_SetupFieldFormula"
    Title="公式設定" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupFieldFormula.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <head>
        <style type="text/css">
        
            .btnA_mouseout  { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 15px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#fffef3, EndColorStr=#efd94d); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: #000000;}    
            .btnA_mouseover { BORDER-RIGHT: #2C59AA 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 15px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#fcf29c); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: blue;}
            .btnA_mousedown { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #FFE400 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 15px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#fffef3, EndColorStr=#efd94d); BORDER-LEFT: #FFE400 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #FFE400 1px solid; WIDTH: 100%;HEIGHT: 100%;color: #000000;}
            .btnA_mouseup   { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 15px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#fffef3, EndColorStr=#efd94d); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: #000000;}
            
            .btnB_mouseout  { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 17px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#fffef3, EndColorStr=#efd94d); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: red;}    
            .btnB_mouseover { BORDER-RIGHT: #2C59AA 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 17px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#fcf29c); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: red;}
            .btnB_mousedown { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #FFE400 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 17px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#fffef3, EndColorStr=#efd94d); BORDER-LEFT: #FFE400 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #FFE400 1px solid; WIDTH: 100%;HEIGHT: 100%;color: red;}
            .btnB_mouseup   { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 17px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#fffef3, EndColorStr=#efd94d); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: red;}

            .btnC_mouseout  { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 15px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#fffef3, EndColorStr=#efd94d); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: #000000;}    
            .btnC_mouseover { BORDER-RIGHT: #2C59AA 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 15px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#fcf29c); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: blue;}
            .btnC_mousedown { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #FFE400 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 15px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#fffef3, EndColorStr=#efd94d); BORDER-LEFT: #FFE400 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #FFE400 1px solid; WIDTH: 100%;HEIGHT: 100%;color: #000000;}
            .btnC_mouseup   { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 15px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#fffef3, EndColorStr=#efd94d); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: #000000;}

            .btnD_mouseout  { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 17px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#fffef3, EndColorStr=#efd94d); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: red;}    
            .btnD_mouseover { BORDER-RIGHT: #2C59AA 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 17px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#fcf29c); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: red;}
            .btnD_mousedown { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #FFE400 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 17px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#fffef3, EndColorStr=#efd94d); BORDER-LEFT: #FFE400 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #FFE400 1px solid; WIDTH: 100%;HEIGHT: 100%;color: red;}
            .btnD_mouseup   { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 17px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#fffef3, EndColorStr=#efd94d); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: red;}
           
            .btnE_mouseout  { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 17px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#fffef3, EndColorStr=#efd94d); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: red;}    
            .btnE_mouseover { BORDER-RIGHT: #2C59AA 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 17px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#fcf29c); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: red;}
            .btnE_mousedown { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #FFE400 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 17px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#fffef3, EndColorStr=#efd94d); BORDER-LEFT: #FFE400 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #FFE400 1px solid; WIDTH: 100%;HEIGHT: 100%;color: red;}
            .btnE_mouseup   { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 17px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#fffef3, EndColorStr=#efd94d); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: red;}

            .btnOperand_mouseout  { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 13px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=1, StartColorStr=#fff7ee, EndColorStr=#ffc68d); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: #000000;}    
            .btnOperand_mouseover { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 13px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=1, StartColorStr=#ffffff, EndColorStr=#fe952d); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: #000000;}
            .btnOperand_mousedown { BORDER-RIGHT: #FFE400 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #FFE400 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 13px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=1, StartColorStr=#fff7ee, EndColorStr=#ffc68d); BORDER-LEFT: #FFE400 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #FFE400 1px solid; WIDTH: 100%;HEIGHT:100%;color: #000000;}
            .btnOperand_mouseup   { BORDER-RIGHT: #fefdf2 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #fefdf2 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 13px; font-weight: bolder;  FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=1, StartColorStr=#fff7ee, EndColorStr=#ffc68d); BORDER-LEFT: #fefdf2 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #fefdf2 1px solid; WIDTH: 100%;HEIGHT: 100%;color: #000000;}


            .btn {BORDER-RIGHT: #7b9ebd 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #7b9ebd 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#ffffff, EndColorStr=#cecfde); BORDER-LEFT: #7b9ebd 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #7b9ebd 1px solid;WIDTH: 100%;HEIGHT: 100%; font-size: 14px; color: blue;}
        </style>

        <script language="javascript">
                
        Sys.Application.add_load(function(){
            if('<%=IsPostBack%>'.toLowerCase() == "false")
            {
                var formula = $uof.dialog.getOpener().GetFormula()
                if(formula.indexOf('@') != -1)
                {
                    var arrayFormula = formula.split('@');
                    $('#<%=hiddenFormulaName.ClientID%>').val(arrayFormula[0]);
                    $('#<%=lblFormula.ClientID%>').text(arrayFormula[0]);
                    $('#<%=hiddenForumla.ClientID%>').val(arrayFormula[1]); 
                }
            }
        });

        function AddOperandFieldId(strFiledId)
        {
      
           
            AddTxtToHidden('[' + strFiledId + ']');

            $('#<%=hiddenFormulaName.ClientID%>').val(GetFormulaText());       
            $('#<%=lblFormula.ClientID %>').text(GetFormulaText());          
        }
 
 
         function GetFormulaText()
         {
             var formula = $('#<%= hiddenForumla.ClientID%>').val();        
             
            
            var re = /\[[^\]]*\]/g;
          
            var formulaMatch = formula.match(re);

            if ( formulaMatch != null)
            {
                for( var i = 0; i < formulaMatch.length; i++)
                {
                  
                    formula = formula.replace(formulaMatch[i], GetFieldName(formulaMatch[i]) );             
                }
            }
            
            return formula;
         }
        
         function GetFieldName(strFiledId)
         {
             var table = $('#<%=tbOperands.ClientID %> input[type=hidden]');
             var btn = $('#<%=tbOperands.ClientID %> input[type=submit]');
             for (var i = 0; i < table.length; i++)
             {
         
                 
                if ( '['+ $(table[i]).val() + ']' == strFiledId )
                {
                    
  
                    return $(btn[i]).val();
                }
            
            }
            
            return null;
         }                

                
        //驗證運算式格式是否正確
        function ValidateFormula(sender, args)
        {        
            var formula = $('#<%=hiddenForumla.ClientID%>').val();                           
            formula = formula.replace(/\[[^\]]*\]/g,'(1)');                        
            
            try
            {
                eval(formula);            
                args.IsValid = true;
            }
            catch(e)
            {
                args.IsValid = false;
                return false;           
            }                
        }      
        
        
        function GoBack()
        {
            GoBackTxt($('#<%=hiddenForumla.ClientID%>'));      
            $('#<%=hiddenFormulaName.ClientID%>').val( GetFormulaText());
            $('#<%=lblFormula.ClientID %>').text( GetFormulaText());

        }
        
        
        //往後退一格
        function GoBackTxt(formula)
        {        
            var strOperator = '+-*/';
            var strNum = '0123456789.()';
            var IsFind = false;
            var IsFieldName = false;
            var subStringIndex = 0;
            
            for (i = formula.val().length; i > 0; i--)
            {
                var chFormula = formula.val().charAt(i);
                
                    if ( !IsFieldName )
                    {
                        if ( chFormula == ' ')
                        {
                            continue;
                        }
                        
                        for( j = 0; j< strNum.length; j++)                
                        {
                            if ( strNum.charAt(j) == chFormula )
                            {
                                subStringIndex = i--;                    
                                IsFind = true;
                                break;                        
                            }
                        }
                        
                        
                        for( j = 0; j< strOperator.length; j++)                
                        {
                            if ( strOperator.charAt(j) == chFormula )
                            {
                                subStringIndex = i--;                    
                                IsFind = true;
                                break;                        
                            }
                        }                
                    
                    }
                    
                    if ( IsFieldName)
                    {
                        if (  chFormula == '[')
                        {
                            subStringIndex = i--;
                            IsFind = true;
                        }                
                    }
                    
                    
                    
                    
                    if ( chFormula == ']')
                    {
                        IsFieldName = true; 
                        continue;               
                    }
                    
                    
                    
                    if (IsFind){break;}                          

                
            }
                        
          
            if (formula.val().length > 0)
            {
                formula.val(formula.val().substring(0, subStringIndex));
            }
      
        }
        
        
        //清除運算式
        function ClearFormula()
        {
            $('#<%=hiddenFormulaName.ClientID%>').val('');
            $('#<%=hiddenForumla.ClientID%>').val('');
            $('#<%=lblFormula.ClientID %>').text( '');

        }
        
        //加入運算式
        function AddTxt(str)
        {
            AddTxtToTbx(str);
            AddTxtToHidden(str);
        }




        function AddTxtToTbx(str)
        {           
            $('#<%=hiddenFormulaName.ClientID%>').val( $('#<%=hiddenFormulaName.ClientID%>').val()+str);        
            $('#<%=lblFormula.ClientID %>').text( $('#<%=lblFormula.ClientID %>').text() + str);
        }


        function AddTxtToHidden(str)
        {           
              
            $('#<%=hiddenForumla.ClientID%>').val($('#<%=hiddenForumla.ClientID%>').val() + str);  


        
        }
      
        </script>

    </head>
    <table cellpadding="0" cellspacing="0" style="width:100%; Height:100px">
        <tr style="width:100%; Height:150px">
            <td colspan="2">
                <table cellpadding="0" cellspacing="0" style="width:100%; Height:100px">
                    <tr style="height:100px;width:100%">
                        <td style="vertical-align:middle;background-size:100% 100%;background-image:url(<%=themePath %>/images/wkf/machine_bg.gif);">
                            <table>
                                <tr>
                                    <td style="width:15px">

                                    </td>
                                    <td>
                                        <asp:Label ID="lblFormula" runat="server" Font-Size="Medium" meta:resourcekey="lblFormulaResource1" ></asp:Label>
                                    </td>
                                    <td>

                                    </td>
                                </tr>
                            </table>
                            
                        </td>
                    </tr>
                </table>
                <asp:CustomValidator ID="CustomValidatorExpression" runat="server" Display="Dynamic"
                    ErrorMessage="輸入格式錯誤" ClientValidationFunction="ValidateFormula" Font-Bold="True" meta:resourcekey="CustomValidatorExpressionResource1"></asp:CustomValidator></td>
        </tr>
        <tr style="width:100%;Height:90%;vertical-align:top" >
            <td style="height: 100%; width: 50%" valign="top"  align="center">
                <table cellpadding="0" cellspacing="0" width="100%" height="100%">
                    <tr>
                        <td valign="top" align="center">
                            <asp:Label ID="lblFieldTitle" runat="server" Text="可供計算的欄位" meta:resourcekey="lblFieldTitleResource1" ForeColor="Red"></asp:Label>
                            <asp:Table ID="tbOperands" runat="server" BorderWidth="1px" CellPadding="1" CellSpacing="0"
                                Width="80%" BackColor="White" BorderColor="Silver" meta:resourcekey="tbOperandsResource1">
                            </asp:Table>
                            &nbsp;</td>
                    </tr>
                    </table>
            </td>
            <td style="height: 100%;width: 50%">
                <table style="height: 100%; width: 100%">
                    <tr>
                        <td>

                            <input id="Button19" onclick="ClearFormula();"   onmouseup="this.className='btnB_mouseup'"
                                class="btnB_mouseout" onmousedown="this.className='btnB_mousedown'" onmouseover="this.className='btnB_mouseover'"
                                 onmouseout="this.className='btnB_mouseout'" type="button" 
                                value="C" /></td>
                        <td >

                            <input id="Button16" onclick="AddTxt('( ');" onmouseup="this.className='btnA_mouseup'"
                                class="btnA_mouseout" onmousedown="this.className='btnA_mousedown'" onmouseover="this.className='btnA_mouseover'"
                                 onmouseout="this.className='btnA_mouseout'"
                                type="button" value="（" /></td>
                        <td >

                            <input id="Button17" onclick="AddTxt(' )');" onmouseup="this.className='btnA_mouseup'"
                                class="btnA_mouseout" onmousedown="this.className='btnA_mousedown'" onmouseover="this.className='btnA_mouseover'"
                                 onmouseout="this.className='btnA_mouseout'"type="button"
                                value="）" /></td>
                        <td colspan="2">

                            <input id="Button18" onclick="GoBack();" onmouseup="this.className='btnD_mouseup'"
                                class="btnD_mouseout" onmousedown="this.className='btnD_mousedown'" onmouseover="this.className='btnD_mouseover'"
                                 onmouseout="this.className='btnD_mouseout'"
                                type="button" value="←" /></td>
                    </tr>
                    <tr style="width: 20%; height:20%">
                        <td >

                            <input id="Button7" type="button" value="７" onmouseup="this.className='btnA_mouseup'"
                                class="btnA_mouseout" onmousedown="this.className='btnA_mousedown'" onmouseover="this.className='btnA_mouseover'"
                                 onmouseout="this.className='btnA_mouseout'" onclick="AddTxt('7');" /></td>
                        <td >

                            <input id="Button8" type="button" value="８"  onmouseup="this.className='btnA_mouseup'"
                                class="btnA_mouseout" onmousedown="this.className='btnA_mousedown'" onmouseover="this.className='btnA_mouseover'"
                                 onmouseout="this.className='btnA_mouseout'"
                                onclick="AddTxt('8');" /></td>
                        <td >

                            <input id="Button9" type="button" value="９" onmouseup="this.className='btnA_mouseup'"
                                class="btnA_mouseout" onmousedown="this.className='btnA_mousedown'" onmouseover="this.className='btnA_mouseover'"
                                 onmouseout="this.className='btnA_mouseout'"
                                onclick="AddTxt('9');" /></td>
                        <td rowspan="2">
                            <input id="Button12" onclick="AddTxt(' + ');" onmouseup="this.className='btnE_mouseup'"
                                class="btnE_mouseout" onmousedown="this.className='btnE_mousedown'" onmouseover="this.className='btnE_mouseover'"
                                 onmouseout="this.className='btnE_mouseout'" type="button"
                                value="＋" /></td>
                        <td rowspan="2" >

                            <input id="Button14" onclick="AddTxt(' * ');" onmouseup="this.className='btnE_mouseup'"
                                class="btnE_mouseout" onmousedown="this.className='btnE_mousedown'" onmouseover="this.className='btnE_mouseover'"
                                 onmouseout="this.className='btnE_mouseout'"  type="button"
                                value="×" /></td>
                    </tr>
                    <tr style="width: 20%; height:20%">
                        <td>

                            <input id="Button4" type="button" value="４"  onmouseup="this.className='btnA_mouseup'"
                                class="btnA_mouseout" onmousedown="this.className='btnA_mousedown'" onmouseover="this.className='btnA_mouseover'"
                                 onmouseout="this.className='btnA_mouseout'"
                                onclick="AddTxt('4');" /></td>
                        <td>

                            <input id="Button5" type="button" value="５" onmouseup="this.className='btnA_mouseup'"
                                class="btnA_mouseout" onmousedown="this.className='btnA_mousedown'" onmouseover="this.className='btnA_mouseover'"
                                 onmouseout="this.className='btnA_mouseout'"
                                onclick="AddTxt('5');" /></td>
                        <td>

                            <input id="Button6" type="button" value="６" onmouseup="this.className='btnA_mouseup'"
                                class="btnA_mouseout" onmousedown="this.className='btnA_mousedown'" onmouseover="this.className='btnA_mouseover'"
                                 onmouseout="this.className='btnA_mouseout'"
                                onclick="AddTxt('6');" /></td>
                    </tr>
                    <tr style="width: 20%; height:20%">
                        <td>

                            <input id="Button1" type="button" value="１" onmouseup="this.className='btnA_mouseup'"
                                class="btnA_mouseout" onmousedown="this.className='btnA_mousedown'" onmouseover="this.className='btnA_mouseover'"
                                 onmouseout="this.className='btnA_mouseout'"
                                onclick="AddTxt('1');" /></td>
                        <td>

                            <input id="Button2" type="button" value="２" onmouseup="this.className='btnA_mouseup'"
                                class="btnA_mouseout" onmousedown="this.className='btnA_mousedown'" onmouseover="this.className='btnA_mouseover'"
                                 onmouseout="this.className='btnA_mouseout'"
                                onclick="AddTxt('2');" /></td>
                        <td>

                            <input id="Button3" type="button" value="３" onmouseup="this.className='btnA_mouseup'"
                                class="btnA_mouseout" onmousedown="this.className='btnA_mousedown'" onmouseover="this.className='btnA_mouseover'"
                                 onmouseout="this.className='btnA_mouseout'"
                                onclick="AddTxt('3');" /></td>
                        <td rowspan="2">

                            <input id="Button13" onclick="AddTxt(' - ');" onmouseup="this.className='btnE_mouseup'"
                                class="btnE_mouseout" onmousedown="this.className='btnE_mousedown'" onmouseover="this.className='btnE_mouseover'"
                                 onmouseout="this.className='btnE_mouseout'"  type="button"
                                value="－" /></td>
                        <td rowspan="2">

                            <input id="Button15" onclick="AddTxt(' / ');" onmouseup="this.className='btnE_mouseup'"
                                class="btnE_mouseout" onmousedown="this.className='btnE_mousedown'" onmouseover="this.className='btnE_mouseover'"
                                 onmouseout="this.className='btnE_mouseout'"  type="button"
                                value="／" /></td>
                    </tr>
                    <tr style="width: 20%; height:20%">
                        <td colspan="2">

                            <input id="Button10" type="button" value="０" onmouseup="this.className='btnC_mouseup'"
                                class="btnC_mouseout" onmousedown="this.className='btnC_mousedown'" onmouseover="this.className='btnC_mouseover'"
                                 onmouseout="this.className='btnC_mouseout'"
                                onclick="AddTxt('0');" /></td>
                        <td>

                            <input id="Button11" type="button" value="．" onmouseup="this.className='btnA_mouseup'"
                                class="btnA_mouseout" onmousedown="this.className='btnA_mousedown'" onmouseover="this.className='btnA_mouseover'"
                                 onmouseout="this.className='btnA_mouseout'"
                                onclick="AddTxt('.');" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblFieldName" runat="server" Text="計算欄位 = " Visible="False" meta:resourcekey="lblFieldNameResource1"></asp:Label>
    <asp:HiddenField ID="hiddenForumla" runat="server" />
    <asp:HiddenField ID="hiddenFormulaName" runat="server" />
</asp:Content>
