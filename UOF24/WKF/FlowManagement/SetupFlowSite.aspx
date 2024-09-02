<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_FlowManagement_SetupFlowSite"
    Title="設定流程式站點" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="SetupFlowSite.aspx.cs" %>

<%@ Register Src="UC_SelectSubFlow.ascx" TagName="UC_SelectSubFlow" TagPrefix="uc1" %>
<%@ Register src="UC_SelectParallelFlow.ascx" tagname="UC_SelectParallelFlow" tagprefix="uc2" %>
<%@ Register src="UC_SelectFlow.ascx" tagname="UC_SelectFlow" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="text-align: center">
        <br /><center>
        <table class="PopTable" cellspacing="1" style="width: 400px; height: 400px">
            <tr>
                <td align="center" class="PopTableLeftTD" height="30px">
                    <div align="center">
                        <asp:Label ID="Label1" runat="server" Text="流程選擇" meta:resourcekey="lblSubFlowResource1"></asp:Label>
                        <asp:CustomValidator ID="cvParallelSelectError" runat="server" Display="Dynamic"
                            ErrorMessage="請選擇平行流程或副流程" ></asp:CustomValidator>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center" class="PopTableRightTD" valign="top">
                    <uc3:UC_SelectFlow ID="UC_SelectFlow1" runat="server" />
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hfOldSubFlow" runat="server" />
    </center>
    </div>
</asp:Content>
