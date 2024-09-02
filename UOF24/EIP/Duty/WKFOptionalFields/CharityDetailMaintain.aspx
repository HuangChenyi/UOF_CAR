<%@ Page Title="新增/維護活動內容明細" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Duty_WKFOptionalFields_CharityDetailMaintain" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="CharityDetailMaintain.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ValidationSummary ID="vsError" runat="server" meta:resourcekey="vsErrorResource1" />
<table class="PopTable" style=" width:100%;">
    <tr>
        <td>
            <asp:Label ID="lblName" runat="server" Text="名稱" meta:resourcekey="lblNameResource1"></asp:Label>
        </td>
        <td>
            <telerik:RadDropDownList ID="rddlName" runat="server"   DropDownWidth="92%"
                AutoPostBack="true" CausesValidation="false" 
                OnSelectedIndexChanged="rddlName_SelectedIndexChanged"
                meta:resourcekey="rddlNameResource1">
            </telerik:RadDropDownList>
        </td>
    </tr>
    <tr>
        <td style="white-space:nowrap;">
            <asp:Label ID="lblBeginTime" runat="server" Text="時間(起)" meta:resourcekey="lblBeginTimeResource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="txtBeginTime" runat="server" meta:resourcekey="txtBeginTimeResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblEndTime" runat="server" Text="時間(訖)" meta:resourcekey="lblEndTimeResource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="txtEndTime" runat="server" meta:resourcekey="txtEndTimeResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="white-space:nowrap">
            <asp:Label ID="lblActivityZone" runat="server" Text="活動時區" meta:resourcekey="lblActivityZoneResource1" ></asp:Label>
        </td>
        <td>
            <asp:Label ID="txtActivityZone" runat="server" meta:resourcekey="txtActivityZoneResource1"></asp:Label>
        </td>
    </tr>
    <tr>
          <td style="white-space:nowrap">
            <asp:Label ID="lblActivityHours" runat="server" Text="活動時數" meta:resourcekey="lblActivityHoursResource1" ></asp:Label>
        </td>
        <td>
            <asp:Label ID="txtActivityHours" runat="server" meta:resourcekey="txtActivityHoursResource1"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="height: 26px;white-space:nowrap">
            <asp:Label ID="lblHours" runat="server" Text="公益時數" meta:resourcekey="lblHoursResource1"></asp:Label>
        </td>
        <td style="height: 26px">
            <asp:Label ID="txtHours" runat="server" meta:resourcekey="txtHoursResource1"></asp:Label>
        </td>
    </tr>
    <tr>
         <td style="white-space:nowrap">
            <asp:Label ID="lblPlace" runat="server" Text="地點" meta:resourcekey="lblPlaceResource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="txtPlace" runat="server" meta:resourcekey="txtPlaceResource1"></asp:Label>
        </td>
    </tr>
    <tr>
         <td style="white-space:nowrap">
            <asp:Label ID="lblContent" runat="server" Text="內容" meta:resourcekey="lblContentResource1"></asp:Label>
        </td>
        <td>
            <asp:Label ID="txtContent" runat="server" meta:resourcekey="txtContentResource1"></asp:Label>
        </td>
    </tr>
</table>
<asp:HiddenField ID="hfMode" runat="server" />
<asp:HiddenField ID="hfCharityGuid" runat="server" />
<asp:HiddenField ID="hfMasterCharityGuid" runat="server" />
<asp:HiddenField ID="hfApplicant" runat="server" />
<asp:HiddenField ID="hfUI" runat="server" />
<asp:CustomValidator ID="cvMessage" runat="server" ForeColor="Red" ErrorMessage="請選擇活動。" Visible="False" Display="Dynamic" meta:resourcekey="cvMessageResource1"></asp:CustomValidator>
<asp:CustomValidator ID="cvNoData" runat="server" ForeColor="Red" Visible="False" Display="Dynamic" ErrorMessage="無公益活動資訊，請至活動主檔維護新增。" meta:resourcekey="cvNoDataResource1"></asp:CustomValidator>
<asp:CustomValidator ID="cvDoubleData" runat="server" ForeColor="Red" Visible="False" Display="Dynamic" ErrorMessage="活動資訊重覆，請選擇其他活動資訊。" meta:resourcekey="cvDoubleDataResource1"></asp:CustomValidator>
<asp:Label ID="lblSelect" runat="server" Text="選擇活動" Visible="False" meta:resourcekey="lblSelectResource1"></asp:Label>
<asp:Label ID="lblHour" runat="server" Text="小時" Visible="False" meta:resourcekey="lblHourResource1" ></asp:Label>
</asp:Content>

