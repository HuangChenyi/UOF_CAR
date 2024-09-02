<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="WKF_Reader_SetFormField" Codebehind="SetFormField.aspx.cs" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">  
<script id="treejs" type="text/javascript">
    Sys.Application.add_load(function () {
        if ($("#<%=hiddenX.ClientID%>").val() != "" && $("#<%=hiddenY.ClientID%>").val() != "")
            resizeTwoTree($("#<%=hiddenX.ClientID%>").val(), $("#<%=hiddenY.ClientID%>").val());
    });

    function resizeTwoTree(X, Y) {
        var treeBranchSite = $find("<%=RadTreeView1.ClientID %>");
        var treeSubFlow = $find("<%=RadTreeView2.ClientID %>");

        treeBranchSite.get_element().style.height = Y - 35 + "px";
        treeBranchSite.get_element().style.width = X / 2 - 30 + "px";

        treeSubFlow.get_element().style.height = Y - 35 + "px";
        treeSubFlow.get_element().style.width = X / 2 - 30 + "px";

        $("#<%=hiddenX.ClientID%>").val(X);
        $("#<%=hiddenY.ClientID%>").val(Y);

    }
    </script>

    <table width="100%" height="100%">
        <tr>
            <td valign="top" width="47%" style="vertical-align:top;border-width:1px;border-color:black;border-style:solid">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
                            <ContentTemplate>
                                <table cellspacing="0" cellpadding="0" width="100%" border="1" height="100%">
                                    <tbody>
                                        <tr>
                                            <td style="width: 50%; text-align: center" class="PopTableLeftTD" 
                                        align="center" height="20">
                                                <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" 
                                            Text="已選擇的欄位"></asp:Label>
                                                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" 
                                            ErrorMessage="CustomValidator" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="PopTableRightTD" valign="top" width="50%">
                                                <telerik:RadTreeView ID="RadTreeView1" Runat="server" Width="500px" Height="300px"
                                                    EnableDragAndDrop="true" OnNodeDrop="RadTreeView1_NodeDrop" >
                                                </telerik:RadTreeView>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="btnRemove" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
 
            </td>
            <td style="min-width:50px;vertical-align:middle;text-align:center">
                <telerik:RadButton ID="btnAdd" runat="server"  CausesValidation="False"
                    meta:resourcekey="btnAddResource1" OnClick="btnAdd_Click1" Text="<--"></telerik:RadButton>
                &nbsp;
                <br />
                <br />
                <telerik:RadButton ID="btnRemove" runat="server" meta:resourcekey="btnRemoveResource1" OnClick="btnRemove_Click1" Text="-->"></telerik:RadButton>
            </td>
            <td valign="top" width="47%" style="vertical-align:top;border-width:1px;border-color:black;border-style:solid">

                        <table cellspacing="0" cellpadding="0" width="100%" border="1" height="100%">
                            <tbody>
                                <tr>
                                    <td style="width: 50%; text-align: center" class="PopTableLeftTD" align="center" height="20">
                                        <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" 
                                            Text="所有欄位列表"></asp:Label>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td class="PopTableRightTD" valign="top" style="vertical-align:top">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline">
                                            <ContentTemplate>
                                                <telerik:RadTreeView ID="RadTreeView2" Runat="server" Width="500px" Height="300px" ></telerik:RadTreeView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                                                <asp:AsyncPostBackTrigger ControlID="btnRemove" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
 
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hiddenSourceNodeId" runat="server" />
    <asp:HiddenField id="hiddenFirstField" runat="server"></asp:HiddenField> 
    <INPUT id="hiddenNodeId" type=hidden runat="server" /> 
    <INPUT id="hiddenDropSourceNode" type=hidden runat="server" /> 
    
    <asp:Label ID="lbl_applicant" runat="server" Visible="False" 
        meta:resourcekey="lbl_applicantResource1" Text="申請者"></asp:Label>
    <asp:Label ID="lbl_applicantStartTime" runat="server" Visible="False" 
        meta:resourcekey="lbl_applicantStartTimeResource1" Text="申請時間"></asp:Label>
    <asp:Label ID="lbl_applicantEndTime" runat="server" Visible="False" 
        meta:resourcekey="lbl_applicantEndTimeResource1" Text="結案時間"></asp:Label>
    <asp:Label ID="lbl_applicantDocNbr" runat="server" Visible="False" 
        meta:resourcekey="lbl_applicantDocNbrResource1" Text="表單編號"></asp:Label>
    <asp:Label ID="lbl_applicantStatus" runat="server" Visible="False" 
        meta:resourcekey="lbl_applicantStatusResource1" Text="目前狀態"></asp:Label>
    <asp:Label ID="lbl_applicantCurrentSigner" runat="server" Visible="False" 
        meta:resourcekey="lbl_applicantCurrentSignerResource1" Text="目前簽核者"></asp:Label>
    <asp:Label ID="lbl_jobTitle" runat="server" Visible="False" 
        meta:resourcekey="lbl_jobTitleResource1" Text="職級"></asp:Label>
    <asp:Label ID="lbl_SystemDefaultAlert" runat="server" Visible="False" 
        meta:resourcekey="lbl_SystemDefaultAlertResource1" Text="系統預設顯示欄位不可刪除!!"></asp:Label>
        <asp:HiddenField ID="hiddenX" runat="server" />
    <asp:HiddenField ID="hiddenY" runat="server" />
</asp:Content>

