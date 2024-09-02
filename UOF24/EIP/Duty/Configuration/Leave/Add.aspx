<%@ Page Title="假別新增與維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_Configuration_Leave_Add" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="Add.aspx.cs" %>

<%@ Register Src="~/Common/ChoiceCenter/UC_ChoiceList.ascx" TagPrefix="uc1" TagName="UC_ChoiceList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        Sys.Application.add_load(function () {
            rbClick();
            SetEnableLimitUse();
        });
        function ChangeLabelText() {
            var rbl = $("#<%=rblMinUnit.ClientID %>");
         var lblType = $('#<%=lblType.ClientID %>');

         if (rbl[0].cells[0].childNodes[0].checked) {
             lblType.val($('#<%=labHr.ClientID %>').text());
         }
         else if (rbl[0].cells[1].childNodes[0].checked) {
             lblType.val($('#<%=labHr.ClientID %>').text());
         }
         else if (rbl[0].cells[2].childNodes[0].checked) {
             lblType.val($('#<%=labDay.ClientID %>').text());
         }
         else if (rbl[0].cells[3].childNodes[0].checked) {
             lblType.val($('#<%=labDay.ClientID %>').text());
         }
        }
        function SetEnable() {

            var check = $('#<%=CheckBox1.ClientID %>').is(":checked");
            var ed = $find("<%=rdBeforeDay.ClientID%>");
            if (check == true)
                ed.enable();
            else
                ed.disable();
        }
        function SetEnable2() {

            var check = $('#<%=CheckBox2.ClientID %>').is(":checked");
            var ed = $find("<%=rdAfterDay.ClientID%>"); // Substitute the ClientID of your editor here
            if (check == true)
                ed.enable();
            else
                ed.disable();
        }

        function SetEnable3() {
            var check = $('#<%=cbApplyTimeLimit1.ClientID %>').is(":checked");
            var before = $find("<%=rnbtATLBeforeDay.ClientID %>");
            var after = $find("<%=rnbtATLAfterDay.ClientID %>");

            if (check == true) {
                before.enable();
                after.disable();
                $('#<%=cbApplyTimeLimit2.ClientID %>').prop("checked", false);
            }
            else
                before.disable();
        }

        function SetEnable4() {
            var check = $('#<%=cbApplyTimeLimit2.ClientID %>').is(":checked");
            var before = $find("<%=rnbtATLBeforeDay.ClientID %>");
            var after = $find("<%=rnbtATLAfterDay.ClientID %>");

            if (check == true) {
                after.enable();
                before.disable();
                $('#<%=cbApplyTimeLimit1.ClientID %>').prop("checked", false)
            }
            else
                after.disable();
        }

        function SetEnable5() {
            var check = $('#<%=cbProbation.ClientID %>').is(":checked");
            var monthnum = $find("<%=rntbProbationPeriod.ClientID %>");

            if (check == true) {
                monthnum.enable();
            }
            else {
                monthnum.disable();
            }
        }

        function SetEnableLimitUse() {

            var check = $('#<%=cbLimitUse.ClientID %>').is(":checked");
            var monthnum = $('#<%=LimitUseShow.ClientID%>');

            if (check == true) {
                monthnum.show();
            }
            else {
                monthnum.hide();
            }

        }


        function PeriodCheck(source, args) {
            var check = $('#<%=cbProbation.ClientID %>').is(":checked");
            var monthnum = $('#<%=rntbProbationPeriod.ClientID %>').val();
            if (check == true && monthnum == "") {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }

        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "" || isNaN(args.get_newValue()))
            {
                args.set_newValue(args.get_oldValue());
            }
        }
        function NewKeyPress(sender, args) {

            var keyCharacter = args.get_keyCharacter();

            if (keyCharacter == sender.get_numberFormat().DecimalSeparator ||
                keyCharacter == sender.get_numberFormat().NegativeSign) {

                args.set_cancel(true);
            }

        }

        function rbClick() {
            var rdbtnSeparate = $('#<%= rdbtnSeparate.ClientID  %>');
            var lblSpaceStart = $('#<%= lblSpaceStart.ClientID  %>');

            if (rdbtnSeparate[0].rows[0].cells[0].childNodes[0].checked == true) {
                $("#separateDiv").show();
                lblSpaceStart.show();
            }
            else {
                $("#separateDiv").hide();
                lblSpaceStart.hide();
            }
        }

        function CheckReservedLeaveCode(sender, args) {
            var txtLeaveCode = $('#<%= txtLeaveCode.ClientID%>');
            var data = [txtLeaveCode.val()];
            var result = $uof.pageMethod.sync("CheckReservedLeaveCode", data);
            if (result === "false") {
                txtLeaveCode.focus();
                args.IsValid = false;
            }
        }

        function CheckLeaveCode(sender, args) {
            var txtLeaveCode = $('#<%= txtLeaveCode.ClientID%>');
            if (txtLeaveCode.val().indexOf("'") >= 0) {
                txtLeaveCode.focus();
                args.IsValid = false;
            }
        }


 </script>
<style type="text/css"> 
    .RightAligned 
    { 
        text-align: right; 
    } 
</style>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <table width="100%" class="PopTable" cellspacing="1">    
        <tr>
            <td>
                <span style="color: #ff0000">*</span><asp:Label ID="Label3" runat="server" Text="假別代碼" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLeaveCode" runat="server" MaxLength="50" meta:resourcekey="txtLeaveCodeResource1"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtLeaveCode" SetFocusOnError="true" Display="Dynamic" ErrorMessage="假別代碼(與其他部門)重複請重新輸入" ForeColor="Red" onservervalidate="CustomValidator1_ServerValidate" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLeaveCode" Display="Dynamic" ErrorMessage="請輸入假別代碼" ForeColor="Red" SetFocusOnError="true" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="此為系統保留字，不允許使用" ForeColor="Red" ClientValidationFunction="CheckReservedLeaveCode" meta:resourcekey="CustomValidator2Resource1" Display="Dynamic"></asp:CustomValidator>
                <asp:CustomValidator ID="cvCheckLeaveCode" runat="server" ErrorMessage="含有不合法字元，不允許使用" ForeColor="Red" ClientValidationFunction="CheckLeaveCode" meta:resourcekey="cvCheckLeaveCodeResource1" Display="Dynamic"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <span style="color: #ff0000">*</span><asp:Label ID="Label5" runat="server"  Text="名稱" meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" MaxLength="50" meta:resourcekey="txtNameResource1"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator7" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="假別名稱重複請重新輸入" ForeColor="Red" onservervalidate="CustomValidator7_ServerValidate" SetFocusOnError="true" meta:resourcekey="CustomValidator7Resource1"></asp:CustomValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="請輸入假別名稱" ForeColor="Red" SetFocusOnError="true" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="white-space:nowrap;">
                <span style="color: #ff0000">*</span><asp:Label ID="Label8" runat="server" Text="可請天(時)數" meta:resourcekey="Label8Resource1"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="rdtxtDays" runat="server" MinValue="0.5" Width="80px" Value="1" DataType="System.Decimal" CssClass="RightAligned" Culture="zh-TW" DbValueFactor="1" LabelWidth="32px" meta:resourcekey="rdtxtDaysResource1" LabelCssClass="">
                    <NegativeStyle Resize="None" />
                    <NumberFormat ZeroPattern="n" DecimalDigits="1"></NumberFormat>
                    <ClientEvents OnValueChanging="OnValueChanging" />
                    <EmptyMessageStyle Resize="None" />
                    <ReadOnlyStyle Resize="None" />
                    <FocusedStyle Resize="None" />
                    <DisabledStyle Resize="None" />
                    <InvalidStyle Resize="None" />
                    <HoveredStyle Resize="None" />
                    <EnabledStyle Resize="None" />
                </telerik:RadNumericTextBox>
                <asp:Label ID="lblType" runat="server" meta:resourcekey="lblTypeResource1"></asp:Label> /
                <asp:Label ID="Label24" runat="server" Text="年(次)" meta:resourcekey="Label24Resource1"></asp:Label>
                <br />
                <asp:CustomValidator ID="cvCheckCont" runat="server" ErrorMessage="如選擇連休則只允許輸入整數" 
                    Display="Dynamic" onservervalidate="cvCheckCont_ServerValidate" 
                    meta:resourcekey="cvCheckContResource1" ForeColor="Red"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <span style="color: #ff0000">*</span><asp:Label ID="lbReg" runat="server" 
                    Text="最小單位" meta:resourcekey="lbRegResource1"></asp:Label>
            </td>
            <td style="white-space:nowrap;">
                <asp:RadioButtonList ID="rblMinUnit" runat="server" 
                    RepeatDirection="Horizontal" meta:resourcekey="rblMinUnitResource1">
                    <asp:ListItem Value="1" Selected="True" meta:resourcekey="ListItemResource1" Text="半小時"></asp:ListItem>
                    <asp:ListItem Value="4" meta:resourcekey="ListItemResource2" Text="一小時"></asp:ListItem>
                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource3" Text="半天"></asp:ListItem>
                    <asp:ListItem Value="3" meta:resourcekey="ListItemResource4" Text="全天"></asp:ListItem>
                </asp:RadioButtonList>
                <p><asp:Label runat="server" CssClass="SizeMemo" Text="註:如此假別已申請過假單，為免造成資料異常請勿隨意更動。" meta:resourcekey="LabelResource1"></asp:Label></p>
            </td>
        </tr>
                <tr>
            <td>
                <span style="color: #ff0000">*</span><asp:Label ID="Label1" runat="server" 
                    Text="扣薪與否" meta:resourcekey="Label1Resource1" ></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    RepeatDirection="Horizontal" meta:resourcekey="RadioButtonList1Resource1" >
                    <asp:ListItem Value="all" meta:resourcekey="ListItemResource10" Text="全薪" ></asp:ListItem>
                    <asp:ListItem Value="half" meta:resourcekey="ListItemResource11" Text="半薪" ></asp:ListItem>
                    <asp:ListItem Value="none" meta:resourcekey="ListItemResource12" Text="否"  ></asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="RadioButtonList1" Display="Dynamic" ErrorMessage="請選擇扣薪與否" ForeColor="Red" SetFocusOnError="true" meta:resourcekey="RequiredFieldValidator4Resource1" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <span style="color: #ff0000">*</span><asp:Label ID="Label2" runat="server"  Text="連休" meta:resourcekey="Label2Resource1" ></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" AutoPostBack="True"
                    RepeatDirection="Horizontal" meta:resourcekey="RadioButtonList2Resource1" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged" >
                    <asp:ListItem Value="True" meta:resourcekey="ListItemResource13" Text="是" ></asp:ListItem>
                    <asp:ListItem Value="False" meta:resourcekey="ListItemResource14" Text="否"  ></asp:ListItem>
                </asp:RadioButtonList>
                <p><asp:Label runat="server" ID="lblConsecutiveLeave" CssClass="SizeMemo" Text="註:如選擇連休，假別最小單位只可設定半天/全天。" meta:resourcekey="lblConsecutiveLeaveResource1"></asp:Label></p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList2" Display="Dynamic" ErrorMessage="請選擇連休" meta:resourcekey="RequiredFieldValidator3Resource1" ForeColor="Red" SetFocusOnError="true" ></asp:RequiredFieldValidator>
            </td>
        </tr>
            <tr>
            <td>
                <asp:Label ID="Label21" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label21Resource2"></asp:Label>
                <asp:Label ID="Label22" runat="server" Text="多次申請" meta:resourcekey="Label22Resource1"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rdbtnSeparate" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" onclick="rbClick()" meta:resourcekey="rdbtnSeparateResource1">
                    <asp:ListItem Value="True" Text="是" meta:resourcekey="ListItemResource15"></asp:ListItem>
                    <asp:ListItem Value="False" Text="否" Selected="True" meta:resourcekey="ListItemResource16"></asp:ListItem>
                </asp:RadioButtonList>
                <div id="separateDiv">
                    <asp:Label ID="Label26" runat="server" Text="最多可申請" meta:resourcekey="Label26Resource1"></asp:Label>
                    <telerik:RadNumericTextBox ID="rncRepeatTimes" runat="server" CssClass="RightAligned" Culture="zh-TW" DataType="System.Int32" DbValueFactor="1" LabelCssClass="" LabelWidth="20px" meta:resourcekey="rdBeforeDayResource1" MinValue="1" Width="50px">
                        <NegativeStyle Resize="None" />
                        <NumberFormat DecimalDigits="0" GroupSeparator="" ZeroPattern="n" />
                        <ClientEvents OnKeyPress="NewKeyPress" />
                        <EmptyMessageStyle Resize="None" />
                        <ReadOnlyStyle Resize="None" />
                        <FocusedStyle Resize="None" />
                        <DisabledStyle Resize="None" />
                        <InvalidStyle Resize="None" />
                        <HoveredStyle Resize="None" />
                        <EnabledStyle Resize="None" />
                    </telerik:RadNumericTextBox>
                    <asp:Label ID="Label27" runat="server" Text="次" meta:resourcekey="Label27Resource1"></asp:Label>
                    <br />
                    <asp:Label ID="Label31" runat="server" Text="註:不設定表示不限制申請次數" CssClass="SizeMemo" meta:resourcekey="Label31Resource1" ></asp:Label>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblSpaceStart" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lblSpaceStartResource1" ></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="可請假間距" meta:resourcekey="Label4Resource1" ></asp:Label>
            </td>
            <td style="white-space:nowrap;">
                <asp:CheckBox ID="CheckBox1" runat="server" onclick="SetEnable();" meta:resourcekey="CheckBox1Resource1" />
                <asp:Label ID="Label7" runat="server" Text="發生日前" Style="vertical-align: bottom;" meta:resourcekey="Label7Resource1"></asp:Label>
                <telerik:RadNumericTextBox ID="rdBeforeDay" runat="server" DataType="System.Int32" Width="50px" MinValue="0" CssClass="RightAligned" Enabled="False" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rdBeforeDayResource1" LabelCssClass="">
                    <NegativeStyle Resize="None" />
                    <NumberFormat GroupSeparator="" DecimalDigits="0" ZeroPattern="n" ></NumberFormat>
                    <ClientEvents OnKeyPress="NewKeyPress" />
                    <EmptyMessageStyle Resize="None" />
                    <ReadOnlyStyle Resize="None" />
                    <FocusedStyle Resize="None" />
                    <DisabledStyle Resize="None" />
                    <InvalidStyle Resize="None" />
                    <HoveredStyle Resize="None" />
                    <EnabledStyle Resize="None" />
                </telerik:RadNumericTextBox>                
                <asp:Label ID="Label11" runat="server" Text="天，可開放申請" Style="vertical-align: bottom;" meta:resourcekey="Label11Resource1"></asp:Label> 
                <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="請輸入天數！" ForeColor="Red" onservervalidate="CustomValidator3_ServerValidate" Display="Dynamic" meta:resourcekey="CustomValidator3Resource2"></asp:CustomValidator>
                <br />
                <asp:CheckBox ID="CheckBox2" runat="server"  onclick="SetEnable2();" meta:resourcekey="CheckBox2Resource1" />
                <asp:Label ID="Label12" runat="server" Text="發生日後" Style="vertical-align: bottom;" meta:resourcekey="Label12Resource1"></asp:Label>
                <telerik:RadNumericTextBox ID="rdAfterDay" runat="server" DataType="System.Int32" Width="50px" MinValue="0" CssClass="RightAligned" Enabled="False" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rdAfterDayResource1" LabelCssClass="">
                    <NegativeStyle Resize="None" />
                    <NumberFormat GroupSeparator="" DecimalDigits="0" ZeroPattern="n" ></NumberFormat>
                    <ClientEvents OnKeyPress="NewKeyPress" />
                    <EmptyMessageStyle Resize="None" />
                    <ReadOnlyStyle Resize="None" />
                    <FocusedStyle Resize="None" />
                    <DisabledStyle Resize="None" />
                    <InvalidStyle Resize="None" />
                    <HoveredStyle Resize="None" />
                    <EnabledStyle Resize="None" />
                </telerik:RadNumericTextBox>                
                <asp:Label ID="Label13" runat="server" Text="天，可開放申請" Style="vertical-align: bottom;" meta:resourcekey="Label13Resource1"></asp:Label>   
                <asp:CustomValidator ID="CustomValidator4" runat="server" ErrorMessage="請輸入天數！" ForeColor="Red" onservervalidate="CustomValidator4_ServerValidate" Display="Dynamic" meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator>        
                <p>
                    <asp:Label ID="Label20" runat="server" CssClass="SizeMemo" Text="註:設定0表示需為當天才可申請，不設定表示不限制；但若為「多次申請」則需必填。" meta:resourcekey="Label20Resource1"></asp:Label>
                    <br />
                     <asp:LinkButton ID="lbtnSpaceStartInfo" runat="server" Text="範例說明" meta:resourcekey="lbtnSpaceStartInfoResource1"></asp:LinkButton>                                        
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label15" runat="server" Text="申請限制" meta:resourcekey="Label15Resource1" ></asp:Label>
            </td>
            <td style="white-space:nowrap;" >


                    <asp:CheckBox ID="cbApplyTimeLimit1" runat="server" onclick="SetEnable3();"  meta:resourcekey="cbApplyTimeLimit1Resource1" />

                    <asp:Label ID="Label16" runat="server" Text="請假開始日" Style="vertical-align: bottom;" meta:resourcekey="Label16Resource1"></asp:Label>
                    <telerik:RadNumericTextBox ID="rnbtATLBeforeDay" runat="server" DataType="System.Int32" Width="50px" MinValue="0" CssClass="RightAligned" Enabled="False" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rnbtATLBeforeDayResource1" LabelCssClass="">
                        <NegativeStyle Resize="None" />
                        <NumberFormat GroupSeparator="" DecimalDigits="0" ZeroPattern="n"></NumberFormat>
                        <ClientEvents OnKeyPress="NewKeyPress" />
                        <EmptyMessageStyle Resize="None" />
                        <ReadOnlyStyle Resize="None" />
                        <FocusedStyle Resize="None" />
                        <DisabledStyle Resize="None" />
                        <InvalidStyle Resize="None" />
                        <HoveredStyle Resize="None" />
                        <EnabledStyle Resize="None" />
                    </telerik:RadNumericTextBox>
                    <asp:Label ID="Label17" runat="server" Text="天前，提出申請" Style="vertical-align: bottom;" meta:resourcekey="Label17Resource1"></asp:Label>
                    <asp:Label ID="lblTimeLimitInfo" runat="server" Text="*設定為1天，則使用者申請9/11~9/13的休假，需於9/10 23:59前提出申請" Style="vertical-align: bottom;" ForeColor="Blue" meta:resourcekey="lblTimeLimitInfoResource1"></asp:Label>
                    <asp:CustomValidator ID="CustomValidator5" runat="server" ErrorMessage="請輸入天數！" ForeColor="Red" OnServerValidate="CustomValidator5_ServerValidate" Display="Dynamic" meta:resourcekey="CustomValidator5Resource1"></asp:CustomValidator>

                <br />
                    <asp:CheckBox ID="cbApplyTimeLimit2" runat="server" onclick="SetEnable4();" meta:resourcekey="cbApplyTimeLimit2Resource1" />

                    <asp:Label ID="Label18" runat="server" Text="請假結束日後" Style="vertical-align: bottom;" meta:resourcekey="Label18Resource1"></asp:Label>
                    <telerik:RadNumericTextBox ID="rnbtATLAfterDay" runat="server" DataType="System.Int32" Width="50px" MinValue="0" CssClass="RightAligned" Enabled="False" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rnbtATLAfterDayResource1" LabelCssClass="">
                        <NegativeStyle Resize="None" />
                        <NumberFormat GroupSeparator="" DecimalDigits="0" ZeroPattern="n"></NumberFormat>
                        <ClientEvents OnKeyPress="NewKeyPress" />
                        <EmptyMessageStyle Resize="None" />
                        <ReadOnlyStyle Resize="None" />
                        <FocusedStyle Resize="None" />
                        <DisabledStyle Resize="None" />
                        <InvalidStyle Resize="None" />
                        <HoveredStyle Resize="None" />
                        <EnabledStyle Resize="None" />
                    </telerik:RadNumericTextBox>
                    <asp:Label ID="Label19" runat="server" Text="天內，補申請" Style="vertical-align: bottom;" meta:resourcekey="Label19Resource1"></asp:Label>
                    <asp:Label ID="lblAfterDayInfo" runat="server" Text="*設定為5天，則使用者申請9/11~9/13的休假，需於9/18 23:59前提出申請" Style="vertical-align: bottom;" ForeColor="Blue" meta:resourcekey="lblAfterDayInfoResource1"></asp:Label>
                <asp:CustomValidator ID="CustomValidator6" runat="server" ErrorMessage="請輸入天數！" ForeColor="Red" OnServerValidate="CustomValidator6_ServerValidate" Display="Dynamic" meta:resourcekey="CustomValidator6Resource1"></asp:CustomValidator>

                <hr />

                    <asp:CheckBox ID="cbProbation" runat="server" onclick="SetEnable5()" meta:resourcekey="cbProbationResource1" />               
                    <asp:Label ID="lblPeriodBeginWords" runat="server" Text="申請需到職滿" Style="vertical-align: bottom;"  meta:resourcekey="lblPeriodBeginWordsResource1"></asp:Label>
                    <telerik:RadNumericTextBox ID="rntbProbationPeriod" Enabled="False"   runat="server" DataType="System.Int32" Width="50px" MinValue="1" MaxValue="11" CssClass="RightAligned" Culture="zh-TW" DbValueFactor="1" LabelWidth="20px" meta:resourcekey="rntbProbationPeriodResource1" LabelCssClass="">
                        <NegativeStyle Resize="None" />
                        <NumberFormat GroupSeparator="" DecimalDigits="0" ZeroPattern="n"></NumberFormat>
                        <ClientEvents OnKeyPress="NewKeyPress" />
                        <EmptyMessageStyle Resize="None" />
                        <ReadOnlyStyle Resize="None" />
                        <FocusedStyle Resize="None" />
                        <DisabledStyle Resize="None" />
                        <InvalidStyle Resize="None" />
                        <HoveredStyle Resize="None" />
                        <EnabledStyle Resize="None" />
                    </telerik:RadNumericTextBox>
                    <asp:Label ID="lblPeriodEndWords" runat="server" Text="個月" Style="vertical-align: bottom;" meta:resourcekey="lblPeriodEndWordsResource1"></asp:Label>
                <asp:CustomValidator ID="cusValiProbPeriod" runat="server" Style="vertical-align: bottom;" ErrorMessage="請輸入1~11的數字" ForeColor="Red" ClientValidationFunction="PeriodCheck" Display="Dynamic" meta:resourcekey="cusValiProbPeriodResource1"></asp:CustomValidator>
                <br />
                    <asp:CheckBox ID="cbScale" runat="server" meta:resourcekey="cbScaleResource1" />
                    <asp:Label ID="lblScale" runat="server" Text="到職當年度依(12-到職月份+1)/12比率給假" Style="vertical-align: bottom;" meta:resourcekey="lblScaleResource1"></asp:Label>
                <br />

                    <asp:CheckBox ID="cbLimitUse" runat="server" onclick="SetEnableLimitUse()" meta:resourcekey="cbLimitUseResource1" />
                    <asp:Label ID="lblLimitUse" runat="server" Text="只有以下人員才能申請" Style="vertical-align: bottom;" meta:resourcekey="lblLimitUseResource1"></asp:Label>
              <br />
                    <div style="width:100%;white-space:normal;display:none" runat="server" id="LimitUseShow" ><uc1:UC_ChoiceList runat="server" ID="UC_ChoiceListCanUseUser"    /></div>
                     <asp:LinkButton ID="lbtnTimeLimitInfo" runat="server" Text="範例說明" meta:resourcekey="lbtnTimeLimitInfoResource1"></asp:LinkButton>                                        
            </td>
        </tr>
        <tr>
            <td>
                <span style="color: #ff0000">*</span><asp:Label ID="Label6" runat="server" 
                    Text="計算方式" meta:resourcekey="Label6Resource1"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rblCalculated" runat="server" 
                    RepeatDirection="Horizontal" Width="170px" AutoPostBack="True" 
                    onselectedindexchanged="rblCalculated_SelectedIndexChanged" 
                    meta:resourcekey="rblCalculatedResource1">
                    <asp:ListItem Selected="True" Value="WorkDay" 
                        meta:resourcekey="ListItemResource5" Text="工作天"></asp:ListItem>
                    <asp:ListItem Value="CalendarDay" meta:resourcekey="ListItemResource6" Text="日曆天"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                <span style="color: #ff0000">*</span><asp:Label ID="Label9" runat="server" 
                    Text="可請性別" meta:resourcekey="Label9Resource1"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" 
                    meta:resourcekey="rblGenderResource1">
                    <asp:ListItem Selected="True" Value="3" meta:resourcekey="ListItemResource7" Text="皆可"></asp:ListItem>
                    <asp:ListItem Value="1" meta:resourcekey="ListItemResource8" Text="男"></asp:ListItem>
                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource9" Text="女"></asp:ListItem>
                </asp:RadioButtonList>                                 
            </td>
        </tr>        
        <tr>
            <td>
                <asp:Label ID="Label10" runat="server" Text="假別說明" 
                    meta:resourcekey="Label10Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLeaveDescription" runat="server" Height="150px" 
                    TextMode="MultiLine" Width="100%" 
                    meta:resourcekey="txtLeaveDescriptionResource1"></asp:TextBox>
            </td>
        </tr>        
    </table>
    <asp:Label ID="lblSpaceStartMsg" runat="server" Text="可請假間距說明" Visible="False" meta:resourcekey="lbLSpaceStartMsgResource1"></asp:Label>
    <asp:Label ID="lblTimeLimitMsg" runat="server" Text="申請限制說明" Visible="False" meta:resourcekey="lblTimeLimitMsgResource1"></asp:Label> 
    <asp:Label ID="lblLeaCodeDisableReason" runat="server" Text="假別代碼不能修改原因:" Visible="False" CssClass="SizeMemo" meta:resourcekey="lblLeaCodeDisableReasonResource1"></asp:Label>
    <asp:Label ID="lblLeaCodeDisableSystem" runat="server" Text="系統假別" Visible="False" CssClass="SizeMemo" meta:resourcekey="lblLeaCodeDisableSystemResource1"></asp:Label>
    <asp:Label ID="lblLeaCodeDisableCreator" runat="server" Text="非新增該假別部門" Visible="False" CssClass="SizeMemo" meta:resourcekey="lblLeaCodeDisableCreatorResource1"></asp:Label>
    <asp:Label ID="lblLeaCodeDisableUsedByUser" runat="server" Text="該假別有簽核中或銷假中的表單" Visible="False" CssClass="SizeMemo" meta:resourcekey="lblLeaCodeDisableUsedByUserResource1"></asp:Label>
    <asp:Label ID="lblLeaCodeDisableUsedByGroup" runat="server" Text="其他部門已自訂選用該假別" Visible="False" CssClass="SizeMemo" meta:resourcekey="lblLeaCodeDisableUsedByGroupResource1"></asp:Label>
    <asp:Label ID="lblSystemControlMsg" runat="server" Text="此為系統假別，其中無法修改的項目是由系統邏輯控制。" Visible="False" CssClass="SizeMemo" meta:resourcekey="lblSystemControlMsgResource1"></asp:Label>
    <asp:Label ID="lblMsgConfirm" runat="server" Text="變更假別代碼有可能會造成使用原假別代碼的資料遺失,確定要繼續嗎?" Visible="False" CssClass="SizeMemo" meta:resourcekey="lblMsgConfirmResource1"></asp:Label>
    </ContentTemplate>
    </asp:UpdatePanel>        
    <script type="text/javascript">

        function ConfirmChange() {
            var oldLeaCode = $uof.tool.htmlDecode('<%=System.Web.Security.AntiXss.AntiXssEncoder.HtmlEncode(Request.QueryString["LeaCode"],true)%>');
            if (oldLeaCode != "") {
                var newLeaCode = $('#<%=txtLeaveCode.ClientID %>').val();
                if (oldLeaCode != newLeaCode) {
                    if (!confirm('<%=lblMsgConfirm.Text %>')) {
                        $('#<%=txtLeaveCode.ClientID %>').val(oldLeaCode);
                        return false;
                    }
                }
            }

            return true;
        }
    </script>
    <div style="display:none">
    <asp:label ID="labHr" runat="server" Text="時" meta:resourcekey="labHrResource1" />
    <asp:label ID="labDay" runat="server" Text="天" meta:resourcekey="labDayResource1"/>
        </div>
</asp:Content>

