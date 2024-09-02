<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="EIP_Plant_BorrowMutiPlant" Title="未命名頁面" Codebehind="BorrowMutiPlant.aspx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table cellspacing="1" class="PopTable">
                     <tr>
                        <td align="left" colspan="2">
                            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="設備已被預訂,無法新增借用" ForeColor="Red"></asp:CustomValidator></td>
                    </tr>                                    
                    <tr>
                        <td  >
                            <span style="color: #ff0000">*</span><asp:Label ID="lbLeftBegin" runat="server" Text="開始時間" meta:resourcekey="lbLeftBeginResource1"></asp:Label></td>
                        <td >
                            <table>
                                <tr>
                                    <td>
                                        <telerik:RadDateTimePicker ID="rdtStart" runat="server"></telerik:RadDateTimePicker>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ErrorMessage="請填寫開始時間" ForeColor="Red" 
                                            meta:resourcekey="CustomValidator4Resource1"></asp:CustomValidator></td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span style="color: #ff0000">*</span><asp:Label ID="lbLeftEnd" runat="server" Text="結束時間" meta:resourcekey="lbLeftEndResource1"></asp:Label></td>
                        <td>
                            <table>
                                <tr>
                                    <td >
                                        <telerik:RadDateTimePicker ID="rdtEnd" runat="server"></telerik:RadDateTimePicker>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ErrorMessage="請填寫結束時間" ForeColor="Red" 
                                        meta:resourcekey="CustomValidator3Resource1"></asp:CustomValidator></td>
                                    <td>
                                    </td>
                                </tr>

                            </table>
                        </td>
                    </tr>
      </table>

</asp:Content>

