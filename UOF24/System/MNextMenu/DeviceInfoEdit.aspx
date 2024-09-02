<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="DeviceInfoEdit.aspx.cs" Inherits="System_MNextMenu_DeviceInfoEdit" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Src="~/Basic/Personal/Information/Common/UC_DeviceInfo.ascx" TagPrefix="uc1" TagName="UC_DeviceInfo" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .PopTableHeader {
            text-align: center !important;
        }

        .Grid{
            width: 100% !important;
        }
    </style>

    <script type="text/javascript">
        
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc1:UC_DeviceInfo runat="server" ID="UC_DeviceInfo" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
