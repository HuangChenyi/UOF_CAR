<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="WKF_FormUse_FormRetrieve" Title="取回未簽核表單" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" CodeBehind="FormRetrieve.aspx.cs" %>

<%@ Register Assembly="System.Web.Extensions"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script id="igClientScript" type="text/javascript">

        function CannotGetbackAlert() {
            alert('<%=lblCannotget.Text %>');
        }

        function BackgoundProcessingAlert() {
            alert('<%=lblFormGetBackForBackgoundProcessing.Text %>');
        }

    </script>

    <table width="100%">
        <tr>
            <td align="center" style="width: 100%; background-color: white">
                <table width="100%" class="PopTable" cellspacing="1">
                    <tr>
                        <td class="PopTableHeader" align="center">
                            <asp:Label ID="lblFormList" runat="server" Text="表單列表" meta:resourcekey="lblFormListResource1"></asp:Label></td>
                    </tr>
                </table>
                <asp:UpdatePanel id="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <contenttemplate>
          <fast:grid id="DGFormList" runat="server" allowsorting="True" autogeneratecheckboxcolumn="False"
              autogeneratecolumns="False"   width="100%" onrowdatabound="DGFormList_RowDataBound" AllowPaging="True"  OnPageIndexChanging="DGFormList_PageIndexChanging" meta:resourcekey="DGFormListResource1" OnSorting="DGFormList_Sorting" OnRowCommand="DGFormList_RowCommand"><Columns>
<asp:BoundField DataField="DOC_NBR" HeaderText="表單編號" meta:resourcekey="BoundFieldResource1" SortExpression="DOC_NBR"></asp:BoundField>
                  <asp:TemplateField HeaderText="表單名稱" meta:resourcekey="TemplateFieldResource3">
                      <itemtemplate>
<asp:Label runat="server" ID="lblFormname" meta:resourceKey="lblFormnameResource1" __designer:wfdid="w1"></asp:Label>

 
</itemtemplate>
                  </asp:TemplateField>
<asp:BoundField DataField="START_TIME" HeaderText="送出時間" meta:resourcekey="BoundFieldResource3" SortExpression="START_TIME">
    <itemstyle horizontalalign="Center" />
</asp:BoundField>
                  <asp:TemplateField HeaderText="申請人" meta:resourcekey="TemplateFieldResource1">
                      <itemtemplate>
<asp:Label runat="server" ID="lblUser" meta:resourceKey="lblUserResource1" __designer:wfdid="w2"></asp:Label>



</itemtemplate>
                  </asp:TemplateField>
<asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource2">
    <itemstyle horizontalalign="Center" />
<ItemTemplate>
<asp:LinkButton runat="server" ID="lbtnCheckForm" Text="取回" CommandName="Getback" meta:resourceKey="lbtnCheckFormResource1" __designer:wfdid="w2"></asp:LinkButton>

 <asp:LinkButton runat="server" ID="lbtnPrint" Text="列印" meta:resourceKey="lbtnPrintResource1" __designer:wfdid="w3"></asp:LinkButton>

 
</ItemTemplate>
</asp:TemplateField>
</Columns>
</fast:grid></contenttemplate>
                    <triggers>
<asp:AsyncPostBackTrigger ControlID="DGFormList" EventName="RowDataBound"></asp:AsyncPostBackTrigger>
</triggers>
                </asp:UpdatePanel></td>
        </tr>
    </table>

    <asp:Label ID="lblCannotget" runat="server" meta:resourcekey="lblCannotgetResource1"
        Text="無法取回" Visible="False"></asp:Label>

    <asp:Label ID="lblCheckForm" runat="server"
        Text="確定要取回表單?" Visible="False" meta:resourcekey="lblCheckFormResource1"></asp:Label>

    <asp:Label ID="lblFormGetBackForBackgoundProcessing" runat="server" Text="此表單正在進行背景簽核，無法取回" Visible="False" meta:resourcekey="lblFormGetBackForBackgoundProcessingResource1"></asp:Label>

</asp:Content>
