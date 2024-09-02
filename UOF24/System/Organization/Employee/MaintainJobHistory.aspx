<%@ Page Title="異動記錄維護" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="System_Organization_Employee_MaintainJobHistory" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" Codebehind="MaintainJobHistory.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="PopTable" cellpadding=0 cellspacing=1>
        <tr>
            <td class="PopTableLeftTD" nowrap=nowrap>
                <asp:Label ID="Label1" runat="server" Text="異動型態" 
                    meta:resourcekey="Label1Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblDeptType" runat="server" 
                    meta:resourcekey="lblDeptTypeResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" nowrap=nowrap>
                <asp:Label ID="Label2" runat="server" Text="異動前資料" 
                    meta:resourcekey="Label2Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:Label ID="lblOldJobInfo" runat="server" 
                    meta:resourcekey="lblOldJobInfoResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" nowrap=nowrap>
                <asp:Label ID="Label3" runat="server" Text="異動後資料" 
                    meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                 <asp:Label ID="lblJobInfo" runat="server" 
                     meta:resourcekey="lblJobInfoResource1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" nowrap=nowrap>
                <asp:Label ID="Label4" runat="server" Text="生效日期" 
                    meta:resourcekey="Label4Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <telerik:RadDatePicker ID="wdcDate" runat="server" Enabled="False" meta:resourcekey="wdcDateResource1" >
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" Culture="zh-TW" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="yyyy/M/d" DateFormat="yyyy/M/d" LabelWidth="64px" Width="">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton CssClass="" ImageUrl="" HoverImageUrl=""></DatePopupButton>
                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td class="PopTableLeftTD" nowrap=nowrap>
                <asp:Label ID="Label5" runat="server" Text="備註" 
                    meta:resourcekey="Label5Resource1"></asp:Label>
            </td>
            <td class="PopTableRightTD">
                <asp:TextBox ID="txtRemark" runat="server" Width=300px 
                    meta:resourcekey="txtRemarkResource1"></asp:TextBox>
            </td>
        </tr>
    </table>

    <asp:Label ID="lblDept" runat="server" Text="部門：" Visible=False 
        meta:resourcekey="lblDeptResource1" ></asp:Label>
    <asp:Label ID="lblFunc" runat="server" Text="職務：" Visible=False 
        meta:resourcekey="lblFuncResource1" ></asp:Label>
    <asp:Label ID="lblTitle" runat="server" Text="職級：" Visible=False 
        meta:resourcekey="lblTitleResource1"></asp:Label>
    <asp:Label ID="lblMasterDept" runat="server" Text="主要部門" Visible=False 
        meta:resourcekey="lblMasterDeptResource1" ></asp:Label>
    <asp:Label ID="lblPlus1" runat="server" Text="兼任1" Visible=False 
        meta:resourcekey="lblPlus1Resource1" ></asp:Label>
    <asp:Label ID="lblPlus2" runat="server" Text="兼任2" Visible=False 
        meta:resourcekey="lblPlus2Resource1" ></asp:Label>
    <asp:Label ID="lblPlus3" runat="server" Text="兼任3" Visible=False 
        meta:resourcekey="lblPlus3Resource1" ></asp:Label>
    <asp:Label ID="lblPlus4" runat="server" Text="兼任4" Visible="False" meta:resourcekey="lblPlus4Resource1"></asp:Label>
    <asp:Label ID="lblPlus5" runat="server" Text="兼任5" Visible="False" meta:resourcekey="lblPlus5Resource1"></asp:Label>
    <asp:Label ID="lblPlus6" runat="server" Text="兼任6" Visible="False" meta:resourcekey="lblPlus6Resource1"></asp:Label>
    <asp:Label ID="lblPlus7" runat="server" Text="兼任7" Visible="False" meta:resourcekey="lblPlus7Resource1"></asp:Label>
    <asp:Label ID="lblPlus8" runat="server" Text="兼任8" Visible="False" meta:resourcekey="lblPlus8Resource1"></asp:Label>
    <asp:Label ID="lblPlus9" runat="server" Text="兼任9" Visible="False" meta:resourcekey="lblPlus9Resource1"></asp:Label>
</asp:Content>

