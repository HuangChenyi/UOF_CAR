<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="EIP_Duty_Default" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>
<%--<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>--%>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ScriptContentPlaceHolder" runat="server">
    <script id="Script1" type="text/javascript">
        var isExists = false;

        function Calculate(txtWorkHour, txtWT, txtLTB, txtLTE, txtOT) {
            var WT = $find(txtWT).get_selectedDate().format('HH:mm');
            var LTB = $find(txtLTB).get_selectedDate().format('HH:mm');
            var LTE = $find(txtLTE).get_selectedDate().format('HH:mm');
            var OT = $find(txtOT).get_selectedDate().format('HH:mm');
            var data = ["", WT, LTB, LTE, OT];

            var WorkHour = $uof.pageMethod.sync("CalculateWorkHour", data);
            $find(txtWorkHour).set_value(WorkHour);
        }

        function OnClientButtonClicking(sender, args) {
            var toolbar = sender;
            var key = args.get_item().get_value();
            var tree = $find("<%=this.RadTreeView1.ClientID%>");
            switch (key) {

                case "Delete":
                    var node = tree.get_selectedNode();
                    var ttcode = node.get_value();
                    var confirmStr = '<asp:Literal runat="server" ID="lblDeleteMsg" Text="確定要刪除班別{0}?"  meta:resourcekey="lbConfirmDeleteResource1"></asp:Literal>';
                    confirmStr = confirmStr.replace("{0}", ttcode);
                    if (!confirm(confirmStr)) {
                        args.set_cancel(true);                        
                    }
                    break;
            }
        }
        function OnValueChanging(sender, args) {
            if (args.get_newValue() == "") {
                args.set_newValue(args.get_oldValue());
            }
        }
    </script>
    <style type="text/css"> 
    .RightAligned 
    { 
        text-align: right; 
    } 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarContentPlaceHolder" runat="server">
      <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <telerik:RadToolBar ID="rdToolBarMain" runat="server" Width="100%" OnButtonClick="rdToolBar_OnButtonClick" OnClientButtonClicking="OnClientButtonClicking" meta:resourcekey="rdToolBarMainResource1" SingleClick="None">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="新增班別" Value="Add" 
                        ClickedImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m148.gif"
                        meta:resourcekey="rdToolBarMainAddResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource1"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="刪除班別" Value="Delete"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m03.gif"
                        meta:resourcekey="rdToolBarMainDeleteResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource2"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="儲存" Value="Save"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m66.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m66.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m66.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m66.gif"
                        meta:resourcekey="rdToolBarMainSaveResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource3"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Text="複製" Value="Copy"
                        ClickedImageUrl="~/Common/Images/Icon/icon_m04.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m04.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m04.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m04.gif"
                        meta:resourcekey="rdToolBarMainCopyResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="True" runat="server" meta:resourcekey="RadToolBarButtonResource4"></telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" RenderMode="Inline">
            <ContentTemplate>
                <telerik:RadTreeView ID="RadTreeView1" Runat="server" EnableNodeTextHtmlEncoding="true" OnNodeClick="RadTreeView1_NodeClick" meta:resourcekey="RadTreeView1Resource1">
                </telerik:RadTreeView>
            </ContentTemplate>
            
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" RenderMode="Inline">
        <ContentTemplate>
            <table class="PopTable" cellspacing="1" style="width: 100%">
                <tr>
                    <td nowrap="nowrap" style="width:20%">
                        <font color="red">*</font>
                        <asp:Label ID="Label2" runat="server" Text="班別代碼" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td nowrap="nowrap" style="width:30%">
                        <asp:Label ID="lbTTCode" runat="server" Visible="False" meta:resourcekey="lbTTCodeResource1"></asp:Label>
                        <asp:TextBox ID="txtTTCode" runat="server" MaxLength="50" meta:resourcekey="txtTTCodeResource1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="請輸入班別代碼"
                            Display="Dynamic" ControlToValidate="txtTTCode"
                            meta:resourcekey="RequiredFieldValidator1Resource1" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvCheckTTcode" runat="server" ErrorMessage="請輸入班別代碼" Display="Dynamic" meta:resourcekey="RequiredFieldValidator1Resource1" ForeColor="Red"></asp:CustomValidator>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="班別代碼重覆,請重新輸入"
                            Display="Dynamic" ControlToValidate="txtTTCode"
                            meta:resourcekey="CustomValidator1Resource1" ForeColor="Red"></asp:CustomValidator>
                    </td>
                    <td nowrap="nowrap" style="width:20%">
                        <font color="red">*</font><asp:Label ID="Label3" runat="server" Text="班別名稱" meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td nowrap="nowrap" style="width:30%">
                        <asp:TextBox ID="txtName" runat="server" MaxLength="50" meta:resourcekey="txtNameResource1"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="請輸入班別名稱"
                            Display="Dynamic" ControlToValidate="txtName"
                            meta:resourcekey="RequiredFieldValidator2Resource1" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvCheckTTName" runat="server" ErrorMessage="請輸入班別名稱" Display="Dynamic" meta:resourcekey="RequiredFieldValidator2Resource1" ForeColor="Red"></asp:CustomValidator>
                    </td>
                </tr>
            </table>
            <table width="100%" border="0" cellspacing="1">
                <tr>
                    <td>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="GroupB"
                            meta:resourcekey="ValidationSummary1Resource1" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <Fast:Grid ID="Grid1" runat="server" AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                            DataKeyNames="WD"   Width="100%" OnRowDataBound="Grid1_RowDataBound"
                                DataKeyOnClientWithCheckBox="False" PageSize="15"
                            DefaultSortDirection="Ascending" EnhancePager="True"
                            EmptyDataText="沒有資料" AllowSorting="True" KeepSelectedRows="False" 
                            meta:resourcekey="Grid1Resource1" CustomDropDownListPage="False" SelectedRowColor="" UnSelectedRowColor=""  
                             >
                            <ExportExcelSettings AllowExportToExcel="False" />
                            <Columns>
                                <asp:BoundField DataField="WD" HeaderText="星期" ItemStyle-Wrap="false" meta:resourcekey="BoundFieldResource1" >
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="工時" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                                    <telerik:RadNumericTextBox ID="rdWorkHour" Runat="server" ReadOnly="True" Value="0.0" MaxLength="4" MaxValue="99" Width="60px" Culture="zh-TW"  DbValue='<%# Bind("WORK_HOUR") %>' CssClass="RightAligned">
                                                        <numberformat decimaldigits="1" zeropattern="n" />
                                                    </telerik:RadNumericTextBox>
                                                    <br />
                                                    <asp:CustomValidator ID="cvErrorWorkHour" runat="server" Display="Dynamic" ErrorMessage="工時須為0.5的倍數" meta:resourcekey="cvErrorWorkHourResource1"></asp:CustomValidator>
                                                    <asp:CustomValidator ID="cvErrorHolidayType" runat="server" Display="None" ValidationGroup="GroupB"></asp:CustomValidator>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="彈性最早上班時間" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                            <telerik:RadTimePicker ID="rdWTE" Runat="server" DbSelectedDate='<%# GetTime(Eval("WORK_TIME_ET")) %>' Width="80px"  >
                                            <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                            </calendar>
                                            <datepopupbutton cssclass="" hoverimageurl="" imageurl="" visible="False" />
                                            <timeview cellspacing="-1">
                                            </timeview>
                                            <timepopupbutton cssclass="" hoverimageurl="" imageurl="" />
                                            <dateinput dateformat="HH:mm" displaydateformat="HH:mm" labelwidth="64px" width="" ClientEvents-OnValueChanging="OnValueChanging">
                                            </dateinput>
                                        </telerik:RadTimePicker>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="上班時間" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                            <telerik:RadTimePicker ID="rdWT" Runat="server" DbSelectedDate='<%# GetTime(Eval("WORK_TIME")) %>'  Width="80px" >
                                            <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                            </calendar>
                                            <datepopupbutton cssclass="" hoverimageurl="" imageurl="" visible="False" />
                                            <timeview cellspacing="-1">
                                            </timeview>
                                            <timepopupbutton cssclass="" hoverimageurl="" imageurl="" />
                                            <dateinput dateformat="HH:mm" displaydateformat="HH:mm" labelwidth="64px" width="" ClientEvents-OnValueChanging="OnValueChanging">
                                            </dateinput>
                                        </telerik:RadTimePicker>
                                        <br />
                                        <asp:CustomValidator ID="cvErrorSchedule" runat="server" Display="None" ValidationGroup="GroupB"
                                            meta:resourcekey="cvErrorScheduleResource1"></asp:CustomValidator>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="彈性最晚上班時間" meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <telerik:RadTimePicker ID="rdWTL" Runat="server" DbSelectedDate='<%# GetTime(Eval("WORK_TIME_LT")) %>' Width="80px" >
                                            <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                            </calendar>
                                            <datepopupbutton cssclass="" hoverimageurl="" imageurl="" visible="False" />
                                            <timeview cellspacing="-1">
                                            </timeview>
                                            <timepopupbutton cssclass="" hoverimageurl="" imageurl="" />
                                            <dateinput dateformat="HH:mm" displaydateformat="HH:mm" labelwidth="64px" width="" ClientEvents-OnValueChanging="OnValueChanging">
                                            </dateinput>
                                        </telerik:RadTimePicker>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="休息開始時間" meta:resourcekey="TemplateFieldResource5">
                                    <ItemTemplate>
                                        <telerik:RadTimePicker ID="rdLTB" Runat="server" DbSelectedDate='<%# GetTime(Eval("LUNCH_TIME_BT")) %>' Width="80px"  >
                                            <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                            </calendar>
                                            <datepopupbutton cssclass="" hoverimageurl="" imageurl="" visible="False" />
                                            <timeview cellspacing="-1">
                                            </timeview>
                                            <timepopupbutton cssclass="" hoverimageurl="" imageurl="" />
                                            <dateinput dateformat="HH:mm" displaydateformat="HH:mm" labelwidth="64px" width="" ClientEvents-OnValueChanging="OnValueChanging">
                                            </dateinput>
                                        </telerik:RadTimePicker>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="休息結束時間" meta:resourcekey="TemplateFieldResource6">
                                    <ItemTemplate>
                                        <telerik:RadTimePicker ID="rdLTE" Runat="server" DbSelectedDate='<%# GetTime(Eval("LUNCH_TIME_ET")) %>' Width="80px"  >
                                            <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                            </calendar>
                                            <datepopupbutton cssclass="" hoverimageurl="" imageurl="" visible="False" />
                                            <timeview cellspacing="-1" >
                                            </timeview>
                                            <timepopupbutton cssclass="" hoverimageurl="" imageurl="" />
                                            <dateinput dateformat="HH:mm" displaydateformat="HH:mm" labelwidth="64px" width="" ClientEvents-OnValueChanging="OnValueChanging">
                                            </dateinput>
                                        </telerik:RadTimePicker>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="彈性最早下班時間" meta:resourcekey="TemplateFieldResource7">
                                    <ItemTemplate>
                                        <telerik:RadTimePicker ID="rdOTE" Runat="server" DbSelectedDate='<%# GetTime(Eval("OFF_TIME_ET")) %>'  Width="80px" >
                                            <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                            </calendar>
                                            <datepopupbutton cssclass="" hoverimageurl="" imageurl="" visible="False" />
                                            <timeview cellspacing="-1">
                                            </timeview>
                                            <timepopupbutton cssclass="" hoverimageurl="" imageurl="" />
                                            <dateinput dateformat="HH:mm" displaydateformat="HH:mm" labelwidth="64px" width="" ClientEvents-OnValueChanging="OnValueChanging">
                                            </dateinput>
                                        </telerik:RadTimePicker>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                               <asp:TemplateField HeaderText="下班時間" meta:resourcekey="TemplateFieldResource8">
                                    <ItemTemplate>
                                        <telerik:RadTimePicker ID="rdOT" Runat="server" DbSelectedDate='<%# GetTime(Eval("OFF_TIME")) %>' Width="80px"  >
                                            <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                            </calendar>
                                            <datepopupbutton cssclass="" hoverimageurl="" imageurl="" visible="False" />
                                            <timeview cellspacing="-1">
                                            </timeview>
                                            <timepopupbutton cssclass="" hoverimageurl="" imageurl="" />
                                            <dateinput dateformat="HH:mm" displaydateformat="HH:mm" labelwidth="64px" width="" ClientEvents-OnValueChanging="OnValueChanging">
                                            </dateinput>
                                        </telerik:RadTimePicker>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="彈性最晚下班時間" meta:resourcekey="TemplateFieldResource9">
                                    <ItemTemplate>
                                        <telerik:RadTimePicker ID="rdOTL" Runat="server" DbSelectedDate='<%# GetTime(Eval("OFF_TIME_LT")) %>' Width="80px"  >
                                            <calendar usecolumnheadersasselectors="False" userowheadersasselectors="False">
                                            </calendar>
                                            <datepopupbutton cssclass="" hoverimageurl="" imageurl="" visible="False" />
                                            <timeview cellspacing="-1">
                                            </timeview>
                                            <timepopupbutton cssclass="" hoverimageurl="" imageurl="" />
                                            <dateinput dateformat="HH:mm" displaydateformat="HH:mm" labelwidth="64px" width="" ClientEvents-OnValueChanging="OnValueChanging">
                                            </dateinput>
                                        </telerik:RadTimePicker>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="類型" meta:resourcekey="TemplateFieldResource11">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlTimeTableType" runat="server" meta:resourcekey="ddlTimeTableTypeResource1">
                                            <asp:ListItem Text="工作日" Value="Workday" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                            <asp:ListItem Text="休息日" Value="Dayoff" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                            <asp:ListItem Text="例假日" Value="Routine" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                            <asp:ListItem Text="國定假日" Value="OrgHoliday" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <HeaderStyle Wrap="False" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="備註"  meta:resourcekey="TemplateFieldResource10">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtRemark" runat="server" Rows="2" MaxLength="255" Width="100%" TextMode="MultiLine" Text='<%# Eval("REMARK") %>' meta:resourcekey="txtRemarkResource1" ></asp:TextBox>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                </asp:TemplateField>
                            </Columns>
                            <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
                        </Fast:Grid>
                    </td>
                </tr>
            </table>
        </ContentTemplate>           
     </asp:UpdatePanel>
    <asp:Label ID="lblErrorScheduleMessage" runat="server" Text="{0}資料有誤，請檢查班表時間，後面時間需晚於前面時間" Visible="False" meta:resourcekey="lblErrorScheduleMessageResource1"></asp:Label>
     <asp:Label ID="lblErrorData" runat="server" Text="{0}資料有誤，請檢查班表時間，必須為時間格式而且不允許空白。" Visible="False" meta:resourcekey="lblErrorDataResource1"></asp:Label>
    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="班別" Visible="False"></asp:Label>
    <asp:Label ID="lblErrorHolidayType" runat="server" Text="{0}類型選擇為工作日，則工時需大於0。" Visible="False" meta:resourcekey="lblErrorHolidayTypeResource1"></asp:Label>
</asp:Content>