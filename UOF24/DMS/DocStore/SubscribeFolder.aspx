<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_SubscribeFolder" Title="訂閱目錄" Culture="auto"  UICulture="auto"  meta:resourcekey="PageResource1" Codebehind="SubscribeFolder.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <script type="text/javascript">

     $(function() {

         ChangeStatus();
     });
 
 
 
     function ChangeStatus() {
         var chkSubscribe = $("#<%=chkSubscribe.ClientID%>");
         if (chkSubscribe.length == 0)
             return;

         var chkAllChange = $("#<%=chkAllChange.ClientID%>");
         // 新文件發佈
         var chkNewDoc = $("#<%=chkNewDoc.ClientID%>");
         // 文件版本更新
         var chkVerChange = $("#<%=chkVerChange.ClientID%>");
         // 文件作廢
         var chkDocVoid = $("#<%=chkDocVoid.ClientID%>");
         // 文件銷毀
         var chkDocDel = $("#<%=chkDocDel.ClientID%>");
         var RadioButtonList1 = $("#<%=RadioButtonList1.ClientID%> input:radio");

         chkAllChange.prop("disabled", !chkSubscribe.prop("checked"));
         chkNewDoc.prop("disabled", !chkSubscribe.prop("checked"));
         chkVerChange.prop("disabled", !chkSubscribe.prop("checked"));
         chkDocVoid.prop("disabled", !chkSubscribe.prop("checked"));
         chkDocDel.prop("disabled", !chkSubscribe.prop("checked"));
         RadioButtonList1.prop("disabled", !chkSubscribe.prop("checked"));
     }
 
 
     function ChangeInformType() {
         var chkAllChange = $("#<%=chkAllChange.ClientID%>");

         if (chkAllChange.length > 0) {
             // 新文件發佈
             var chkNewDoc = $("#<%=chkNewDoc.ClientID%>");

             // 文件版本更新
             var chkVerChange = $("#<%=chkVerChange.ClientID%>");

             // 文件作廢
             var chkDocVoid = $("#<%=chkDocVoid.ClientID%>");

             // 文件銷毀
             var chkDocDel = $("#<%=chkDocDel.ClientID%>");

             chkNewDoc.prop("checked", chkAllChange.prop("checked"));
             chkVerChange.prop("checked", chkAllChange.prop("checked"));
             chkDocVoid.prop("checked", chkAllChange.prop("checked"));
             chkDocDel.prop("checked", chkAllChange.prop("checked"));
         }
     }
 
 
     function ChangeAllStatus() {
         var chkNewDoc = $("#<%=chkNewDoc.ClientID%>");

         // 文件版本更新
         var chkVerChange = $("#<%=chkVerChange.ClientID%>");

         // 文件作廢
         var chkDocVoid = $("#<%=chkDocVoid.ClientID%>");

         // 文件銷毀
         var chkDocDel = $("#<%=chkDocDel.ClientID%>");

         var chkAllChange = $("#<%=chkAllChange.ClientID%>");


         if (chkNewDoc.prop("checked") && chkVerChange.prop("checked") && chkDocVoid.prop("checked") && chkDocDel.prop("checked"))
             chkAllChange.prop("checked", true);
         else
             chkAllChange.prop("checked", false);
     }
 
 
 </script>

    <telerik:RadTabStrip ID="tabSubscribe" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage1">
        <Tabs>
            <telerik:RadTab runat="server" Text="目錄">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" Width="100%">
        <telerik:RadPageView ID="RadPageView1" runat="server" BorderWidth="1px" BorderColor="#949C9C" BorderStyle="Solid" Style="padding: 4px;">
            &nbsp;<asp:CheckBox ID="chkSubscribe" runat="server" Text="訂閱目錄文件" meta:resourcekey="chkSubscribeResource1" />
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="請選擇通知時機" meta:resourcekey="CustomValidator1Resource1"></asp:CustomValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="設定目錄訂閱發生錯誤" meta:resourcekey="CustomValidator2Resource1"></asp:CustomValidator>
            <br />
            <div id="panelSubscribe">    
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../../DMS/images/closed.gif" />&nbsp;
        <asp:Label ID="labFolder" runat="server" ForeColor="Blue"></asp:Label><br />
                <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem Selected="True" Value="false" Text="只訂閱此目錄下的文件" meta:resourcekey="ListItemResource1"></asp:ListItem>
                    <asp:ListItem Value="true" Text="訂閱此目錄及子目錄下的文件" meta:resourcekey="ListItemResource2"></asp:ListItem>
                </asp:RadioButtonList>
                <table class="PopTable" style="padding-right: 1px; width: 100%;">
                    <tr>
                        <td colspan="2" style="text-align: left; white-space:nowrap;">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="通知時機" meta:resourcekey="Label1Resource1"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="white-space: nowrap;">
                            <asp:CheckBox ID="chkAllChange" runat="server" Text="任何變更" meta:resourcekey="chkAllChangeResource1" />
                        </td>
                        <td align="left" style="width: 70%;white-space: nowrap;">&nbsp;<asp:CheckBox ID="chkNewDoc" runat="server" Text="新文件發佈" meta:resourcekey="chkNewDocResource1" />
                            <br />
                            &nbsp;<asp:CheckBox ID="chkVerChange" runat="server" Text="文件版本變更" meta:resourcekey="chkVerChangeResource1" />
                            <br />
                            &nbsp;<asp:CheckBox ID="chkDocVoid" runat="server" Text="文件作廢" meta:resourcekey="chkDocVoidResource1" />
                            <br />
                            &nbsp;<asp:CheckBox ID="chkDocDel" runat="server" Text="文件被銷毀" meta:resourcekey="chkDocDelResource1" />
                        </td>
                    </tr>
                </table>

            </div>
        </telerik:RadPageView>
    </telerik:RadMultiPage>

    <asp:Label ID="lblFolder" runat="server"  Text="目錄" Visible="False" meta:resourcekey="lblFolderResource1" ></asp:Label>
    <asp:Label ID="lblFolderIsDelete" runat="server" Text="目錄已被刪除" Visible="false" meta:resourcekey="lblFolderIsDeleteResource1"></asp:Label>
    <asp:Label ID="labDocStore" runat="server" meta:resourcekey="labDocStoreResource1" Text="文件庫" Visible="False"></asp:Label>

</asp:Content>

