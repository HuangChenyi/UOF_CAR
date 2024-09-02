<%@ Page Language="C#" MasterPageFile="~/Master/TwoColumn.master" AutoEventWireup="true" Inherits="System_LogViewer_Default" Title="檢視事件" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="Default.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarContentPlaceHolder" Runat="Server" Height="0px">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftContentPlaceHolder" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
        <asp:Label ID="Label10" runat="server" meta:resourcekey="Label1Resource1" Text="事件月份" Visible="false"></asp:Label>
                <table  height="100%" width="230px">
                    <tr>
                        <td valign="top" width="100%">
                            <telerik:RadTreeView ID="RadTreeView1" runat="server" Width="100%" Height="700px" onnodeclick="RadTreeView1_NodeClick"></telerik:RadTreeView>                                  
                        </td>
                    </tr>
                </table>
		 </contenttemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContentPlaceHolder" Runat="Server"></asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="RightContentPlaceHolder" Runat="Server">
    <style>
        td pre { white-space:pre-wrap; }
    </style>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <contenttemplate>          
            <table class="PopTable" style="width: 100%">
                <tr>
                    <td style="white-space:nowrap">
                        <asp:label ID="lbltimetitle" runat="server" text="時間"  meta:resourcekey="lbltimetitleResource1"/>

                    </td>
                    <td style="white-space:nowrap">
                        <asp:DropDownList ID="ddlDate" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDate_SelectedIndexChanged" meta:resourcekey="ddlDateResource1"></asp:DropDownList>
                        &nbsp;&nbsp;
                        <telerik:RadTimePicker ID="rdExpStartTime" runat="server"></telerik:RadTimePicker>
                        <asp:Label ID="lblicon2" runat="server" Text="~" meta:resourcekey="lblicon2Resource1"></asp:Label>
                        <telerik:RadTimePicker ID="rdExpEndTime" runat="server"></telerik:RadTimePicker>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:label ID="lbltype" runat="server" text="類別" meta:resourcekey="lbltypeResource1"/>
                    </td>
                    <td style="white-space:nowrap">
                      <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" meta:resourcekey="ddlTypeResource1"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="white-space:nowrap">
                        <asp:label ID="lbleventID" runat="server" text="eventID" meta:resourcekey="lbleventIDResource1"/>

                    </td>
                    <td style="white-space:nowrap">
                       <asp:TextBox ID="txtEventID" runat="server" style="width: 80%"></asp:TextBox>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:label ID="lblkeyword" runat="server" text="關鍵字" meta:resourcekey="lblkeywordResource1"/>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:TextBox ID="txtKeyWord" runat="server" />
                        <asp:label ID="lblInfo1" runat="server" text="*可依錯誤訊息內容查詢" ForeColor="Blue" meta:resourcekey="lblInfo1Resource1"/>
                    </td>
               </tr>
                 <tr>
                      <td colspan="4"  class="PopTableRightTD" style="text-align: center ; white-space:nowrap">
                        <table style="width: 100%" border="0">
                            <tr>
                                <td style="width: 40%; text-align: right"></td>
                                <td style="width: 13%; text-align: center">
                                <%--<telerik:RadButton ID="rdbtnReload" runat="server" Text="Reload" meta:resourcekey="rdbtnQueryResource1" onclick="RadButton1_Click"></telerik:RadButton>--%>     
                                <telerik:RadButton ID="rdbtnQuery" runat="server" Text="查詢" meta:resourcekey="rdbtnQueryResource1" OnClick="rdbtnQuery_Click"></telerik:RadButton>     
                               </td>
                                <td style="width: 45%"></td>
                            </tr>
                        </table>
                    </td>
               </tr>
            </table>

            <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AutoGenerateCheckBoxColumn="False" OnPageIndexChanging="Grid1_PageIndexChanging" Width="100%" AutoGenerateColumns="False" DataKeyNames="eventID" AllowSorting="True"  DataKeyOnClientWithCheckBox="False">
            <EnhancePagerSettings ShowHeaderPager="True"></EnhancePagerSettings>
            <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                <Columns>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource1">
                    <ItemStyle HorizontalAlign="Left"/><itemtemplate>
                    <div style="text-align:left">
                        <table border="1" style=" width: 100%; padding:2px;  text-align:left;" class="PopTable">
                            <tr>
                            <td class="PopTableRightTD" style=" text-align:left" align="left">
                                <asp:Label runat="server" Text="eventID:" ID="Label11" meta:resourceKey="Label11Resource1"></asp:Label>
                                <asp:Label runat="server" Text='<%#: Bind("eventID") %>' ID="Label1" meta:resourceKey="Label1Resource2"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" style=" text-align:left" align="left">
                                <asp:Label runat="server" Text="time:" ID="Label12" meta:resourceKey="Label12Resource1"></asp:Label>
                                <asp:Label runat="server" Text='<%#: Bind("LogTime") %>' ID="Label2" meta:resourceKey="Label2Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" style=" text-align:left" align="left">
                                <asp:Label runat="server" Text="user:" ID="Label13" meta:resourceKey="Label13Resource1"></asp:Label>
                                <asp:Label runat="server" Text='<%#: Bind("User") %>' ID="Label3" meta:resourceKey="Label3Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" style=" text-align:left" align="left">
                                <asp:Label runat="server" Text="Assembly:" ID="Label14" meta:resourceKey="Label14Resource1"></asp:Label>
                                <asp:Label runat="server" Text='<%#: Bind("Assembly") %>' ID="Label4" meta:resourceKey="Label4Resource1"></asp:Label>
                            </td>
                            <td class="PopTableRightTD" style=" text-align:left" align="left">
                                <asp:Label runat="server" Text="URL:" ID="Label15" meta:resourceKey="Label15Resource1"></asp:Label>
                                <asp:Label runat="server" Text='<%#: Bind("URL") %>' ID="Label5" meta:resourceKey="Label5Resource1"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" style="word-wrap: break-word; width: 750px; left: 0;text-align:left" class="PopTableRightTD" align="left">
                        <pre>
                            <asp:Literal runat="server" ID="Literal1" Text='<%#: Bind("Event_Text") %>'></asp:Literal>
                        </pre>
                            </td>
                        </tr>
                      </table>
                    </div>            
                    </itemtemplate>
                    </asp:TemplateField>
                </Columns>
             </Fast:Grid>
			 <%--<asp:Label ID="lbReload" runat="server" Text="Reload" Visible="False" meta:resourcekey="lbReloadResource1"></asp:Label>--%>
			</contenttemplate>
    </asp:UpdatePanel>
</asp:Content>


