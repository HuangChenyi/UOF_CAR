<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="PMS_Maintain_Urge" Title="" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Urge.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
   <script type="text/javascript">
       Sys.Application.add_load(
           function () {
                var curwindow = $uof.dialog.getOpener();
                var pd;
                if (curwindow) {
                    pd = curwindow.document;
                }
                else if (typeof (dialogArguments) != "undefined") {
                    pd = dialogArgument.document;
                }
                if (pd) {
                    $("#<%= hidCheckedRowKeys.ClientID %>").val($("#<%=Request.QueryString["HideCheckedClientID"] %>", pd).val());  
                    var ProjectGUID = $('#<%= hdfProjectGUID.ClientID %>');
                    var GUID = $('#<%= hdfGUID.ClientID %>');
                    if ($uof.tool.htmlDecode($('#<%=hdfFromParent.ClientID%>').val()) == 'True')
                    {
                        var data = [$("#<%= hidCheckedRowKeys.ClientID %>").val()];
                        var result = $uof.pageMethod.sync("SetUrgeTargetName", data);
                        SetLabelName(result);
                    }
                    else if ($uof.tool.htmlDecode(ProjectGUID.val()) != null && $uof.tool.htmlDecode(GUID.val()) != null) 
                    {
                        var checkedRowKeys = $uof.tool.htmlDecode(ProjectGUID.val()) + '|' + $uof.tool.htmlDecode(GUID.val());
                        var data = [checkedRowKeys];
                        var result = $uof.pageMethod.sync("SetUrgeTargetName", data);
                        SetLabelName(result);
                    }
                }
           });
    
    function SetLabelName(result)
    {
        var retValue = result;
        var lblProjName = $('#<%= lblProjName.ClientID %>'); 
        var lblTaskName = $('#<%= lblTaskName.ClientID %>'); 
        var hdfTaskGUIDS = $('#<%= hdfTaskGUIDS.ClientID %>'); 
        
        var i = retValue.indexOf("[##]");       
        var j = retValue.indexOf("[@@]");  
        var projName = retValue.substring(0, i);         
        var taskName = retValue.substring(i+4, j );         
        var taskGUIDS = retValue.substring(j+4, retValue.length ); 
        
        lblProjName.text(projName);
        lblTaskName.text(taskName);
        hdfTaskGUIDS.val(taskGUIDS);
        
    }
   </script> 
   
   
    <table class="PopTable">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="專案名稱" meta:resourcekey="Label1Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblProjName" runat="server"></asp:Label>                
                </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="任務名稱" meta:resourcekey="Label2Resource1"></asp:Label></td>
            <td>
                <asp:Label ID="lblTaskName" runat="server"></asp:Label></td>            
        </tr>
        <tr>
            <td style="white-space: nowrap;">
                <span style="color: #ff0000">*</span>
                <asp:Label ID="Label3" runat="server" Text="稽催說明" meta:resourcekey="Label3Resource1"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtUrgeDesc" runat="server" Text="該工作已逾時，請儘速完成。" Columns="30" Rows="5" TextMode="MultiLine" MaxLength="200" Width="100%" meta:resourcekey="txtUrgeDescResource1"></asp:TextBox>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblCheckedRowKeys" runat="server" Visible="false"></asp:Label> 
    <asp:Label ID="lblTaskGUIDS" runat="server"></asp:Label>
    <asp:HiddenField ID="hdfTaskGUIDS" runat="server" />
    <asp:HiddenField ID="hdfFromParent" Value="False" runat="server" />
    <asp:HiddenField ID="hdfProjectGUID"  runat="server" />
    <asp:HiddenField ID="hdfGUID"  runat="server" />
    <asp:HiddenField ID="hidCheckedRowKeys"  runat="server" />
    <asp:HiddenField ID="hidProjGUID"  runat="server" />
    <asp:HiddenField ID="hidGUID"  runat="server" />
    
</asp:Content>

