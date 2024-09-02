<%@ Page Title="場地查詢借用" Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" CodeBehind="BorrowField.aspx.cs" Inherits="EIP_Plant_BorrowField" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc1" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function ToCreateBorrow(plantID, userGuid, args) {
            var plantID = plantID;
            var userGuid = userGuid;            
            var borrowTimeStart = $find("<%=RadStartDatetime.ClientID%>").get_dateInput().get_selectedDate().format("yyyy/MM/dd HH:mm");
            var borrowTimeEnd = $find("<%=RadEndDatetime.ClientID%>").get_dateInput().get_selectedDate().format("yyyy/MM/dd HH:mm");            

            $uof.dialog.open2("~/EIP/Plant/CreateBorrow.aspx", args, "", 700, 800, BorrowDialogResult,
                        { "OwnerGuid": userGuid, "PlantGuid": plantID, "StartTime": borrowTimeStart, "EndTime": borrowTimeEnd });
            return false;
        }

        function BorrowDialogResult(returnValue)
        {            
            if (typeof(returnValue) == 'undefined')
            {
                return false;
            }
            $("#<%=hfOperate.ClientID %>").val("Y");
            return true;
        }
    </script>
    <style type="text/css">
        .ellipsis {
            overflow:hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            width:99%;
        }
        .colmaxWidth{
            max-width:500px;
        }
    </style>
    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <telerik:RadToolBar ID="RadToolBar1" runat="server" OnButtonClick="RadToolBar1_ButtonClick" Width="100%">
                <Items>
                    <telerik:RadToolBarButton runat="server" Text="查詢" Value="Query"
                        CheckedImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        DisabledImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        HoveredImageUrl="~/Common/Images/Icon/icon_m39.gif"
                        ImageUrl="~/Common/Images/Icon/icon_m39.gif" meta:resourcekey="RadToolBarButtonResource1">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton IsSeparator="true"></telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" Value="HadBorrow">
                        <ItemTemplate>
                            <asp:Label ID="lblBorrowMsg" runat="server" ForeColor="Blue" Visible="false"></asp:Label>
                        </ItemTemplate>
                    </telerik:RadToolBarButton>
                </Items>
            </telerik:RadToolBar>
            <table class="PopTable">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="借用日期" meta:resourcekey="lblBorrowDateResource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <table>
                            <tr>
                                <td>                                    
                                    <asp:RadioButtonList ID="rblNowOrAllDay" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rblNowOrAllDay_SelectedIndexChanged" Width="150px" style="white-space:nowrap">
                                        <asp:ListItem Value="AllDay" Text="整天" Selected="True" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                        <asp:ListItem Value="Now" Text="目前時段" meta:resourcekey="ListItemResource5"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <telerik:RadDateTimePicker ID="RadStartDatetime" runat="server"></telerik:RadDateTimePicker>
                                    <asp:Label ID="Label6" runat="server" Text="~"></asp:Label>
                                    <telerik:RadDateTimePicker ID="RadEndDatetime" runat="server"></telerik:RadDateTimePicker>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width:15%;white-space:nowrap">
                        <asp:Label ID="lblFieldLocation" runat="server" Text="地點" meta:resourcekey="lblLocationResource1"></asp:Label>
                    </td>
                    <td style="width:35%">
                        <asp:DropDownList ID="ddlFieldLocation" runat="server"></asp:DropDownList>
                    </td>
                    <td style="width:15%;white-space:nowrap">
                        <asp:Label ID="Label4" runat="server" Text="容納人數" meta:resourcekey="lblAccomodateResource1"></asp:Label>
                    </td>
                    <td style="width:35%">
                        <asp:DropDownList ID="ddlAccomodate" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblBorrowState" runat="server" Text="借用狀態" meta:resourcekey="lblBorrowStateResource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlBorrowState" runat="server">
                            <asp:ListItem Text="全部" Value="ALL" Selected="True" meta:resourcekey="ListItemResource1"></asp:ListItem>
                            <asp:ListItem Text="可借用" Value="Y" meta:resourcekey="ListItemResource2"></asp:ListItem>
                            <asp:ListItem Text="不可借用" Value="N" meta:resourcekey="ListItemResource3"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Label ID="lblPlantType" runat="server" Text="類別" meta:resourcekey="lblPlantTypeResource1"></asp:Label>
                    </td>
                    <td>
                         <asp:DropDownList ID="ddlFieldClass" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblEquipment" runat="server" Text="配備" meta:resourcekey="lblEquipmentResource1"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:CheckBoxList ID="cblEquipment" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" Width="500px" CellSpacing="4"></asp:CheckBoxList>
                    </td>
                </tr>
            </table>         
            <div style="background-color:white;width:100%">
                <table style="width:100%">
                    <tr>
                        <td>&nbsp</td>
                    </tr>
                </table>
            </div>   
            <asp:Label ID="lblBorrowMsg" runat="server" ForeColor="Blue" Visible="false"></asp:Label>

            <fast:grid id="Grid1" runat="server" AutoGenerateCheckBoxColumn="false"
                AutoGenerateColumns="false" DataKeyNames="PLANT_GUID" selectedrowcolor="" unselectedrowcolor=""
                width="100%" AllowSorting="True" OnRowDataBound="Grid1_RowDataBound"
                CustomDropDownListPage="False" AllowPaging="false" OnPageIndexChanging="Grid1_PageIndexChanging"
                DataKeyOnClientWithCheckBox="False" DefaultSortDirection="Ascending"
                EnhancePager="True" PageSize="15" EmptyDataText="No data found" EnableModelValidation="True" KeepSelectedRows="False">
                    <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                    <Columns>
                        <asp:TemplateField HeaderText="圖片" meta:resourcekey="TemplateFieldResource3">
                            <ItemTemplate>
                                <asp:HyperLink ID="hylinkThumbnail" runat="server" Target="_blank"></asp:HyperLink>
                            </ItemTemplate>
                            <ItemStyle Width="100px" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="資訊" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>                                         
                                <asp:LinkButton ID="lbtnPlantName" runat="server"></asp:LinkButton>
                                <br />
                                <asp:Literal ID="ltPlantInfo" runat="server"></asp:Literal>                                
                            </ItemTemplate>
                            <ItemStyle Width="30%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="借用狀況" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <asp:Panel ID="plRecord" runat="server" CssClass="ellipsis"></asp:Panel>
                            </ItemTemplate>
                            <ItemStyle CssClass="colmaxWidth" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource4">
                            <ItemTemplate>                       
                                <asp:LinkButton ID="lbtnBorrow" runat="server" Text="借用" OnClick="lbtnBorrow_Click" meta:resourcekey="lbtnBorrowResource1"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle Width="100px" HorizontalAlign="Center" Wrap="false" />
                        </asp:TemplateField>                        
                    </Columns>
                <HeaderStyle Wrap="false" />
                </fast:grid>
            <asp:HiddenField ID="hfOperate" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblAll" runat="server" Text="全部" Visible="False" meta:resourcekey="lblAllResource1"></asp:Label>
    <asp:Label ID="lblLocation" runat="server" Text="地點:" Visible="False" meta:resourcekey="lblLocationResource2"></asp:Label>
    <asp:Label ID="lblAccomodate" runat="server" Text=" 容納人數:{0}人<br />" Visible="False" meta:resourcekey="lblAccomodateResource2"></asp:Label>
    <asp:Label ID="lblDescript" runat="server" Text="說明:" Visible="False" meta:resourcekey="lblDescriptResource1"></asp:Label>
    <asp:Label ID="lblMsg" runat="server" Text="{0} 借用成功" Visible="false" meta:resourcekey="lblMsgResource1"></asp:Label>
    <asp:Label ID="lblSuccessMsg" runat="server" Text="已成功借用" Visible="false" meta:resourcekey="lblSuccessMsgResource1"></asp:Label>
    <asp:HiddenField ID="hfCurrentUser" Value="True" runat="server" />
</asp:Content>
