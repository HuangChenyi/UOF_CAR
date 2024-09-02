<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="DMS_DocStore_DocGrade" Title="文件評分" Culture="auto"  UICulture="auto" meta:resourcekey="PageResource1" Codebehind="DocGrade.aspx.cs" %>
<%@ Import Namespace="Ede.Uof.Utility" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        function CheckComment() {
            var UserState = '<%=UserState %>'; //是哪個模組的文件
            var rs0 = $("#<%=rs0.ClientID %>");

            if (UserState != 'KM') {
                if ($("#<%=txtComment.ClientID %>").val() === "") {
                    alert('<%=lblNoComment.Text %>');
                    return false;
                }
            }
            else {
                if (!rs0.checked) {
                    if ($("#<%=txtComment.ClientID %>").val() === "") {
                        alert('<%=lblNoComment.Text %>');
                        return false;
                    }
                }
            }
        }

        function ChooseZero(rdo) {
            var UserState = '<%=UserState %>'; //是哪個模組的文件

            if (UserState == 'KM') {
                var txtComment = $("#<%=txtComment.ClientID %>");

                txtComment.disabled = true;
                txtComment.innerText = '';
            }
        }

        function NoChooseZero(rdo) {
            var txtComment = $("#<%=txtComment.ClientID %>");

            txtComment.disabled = false;
        }

        function Button2Click(docid) {
            $uof.dialog.open2("~/DMS/DocStore/DocGradeList.aspx", this, "", 490, 520, OpenDialogResult, { "docID": docid });
            return false;
        }
        function OpenDialogResult(returnValue) {
            if (typeof (returnValue) == 'undefined' || returnValue == null)
                return false;
            else
                return true;
        }
    </script>
    
    
    <table border="0"  class="PopTable" cellspacing="1">
    <tr>
        <td style=" white-space:nowrap;">
            <asp:Label ID="Label1" runat="server" Text="文件名稱" meta:resourcekey="Label1Resource1" ></asp:Label>
        </td>
        <td colspan="3">
            <span style="word-break:break-all; width:297px;">
                <asp:Label ID="labDocName" runat="server"></asp:Label>
            </span>
        </td>
    </tr>
    <tr>
        <td >
            <asp:Label ID="Label2" runat="server" Text="版本" meta:resourcekey="Label2Resource1" ></asp:Label>
        </td>
        <td colspan="3" >
            <asp:Label ID="labDocVersion" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td >
            <asp:Label ID="Label3" runat="server" Text="作者" meta:resourcekey="Label3Resource1" ></asp:Label>
        </td>
        <td colspan="3" >
            <asp:Label ID="lblAuthor" runat="server"></asp:Label>
        </td>
    </tr>
         
     <tr>
          <td style=" white-space:nowrap;">
             <asp:Label ID="Label5" runat="server" Text="此版本平均得分" meta:resourcekey="Label5Resource1" ></asp:Label>
          </td>
          <td >
             <b><font CssClass="SizeL" color="red">&nbsp;<asp:Label ID="labDocGrade" runat="server"></asp:Label></font></b>
           </td>           
          <td>
            <asp:Label ID="Label6" runat="server" Text="此版本評比人數" meta:resourcekey="Label6Resource1" ></asp:Label>
          </td>
          <td>
              <asp:Label ID="labDocNum" runat="server" Font-Bold="True" CssClass="SizeL" ForeColor="Blue"></asp:Label>
          </td>
     </tr>
            
     <tr>
         <td style=" white-space:nowrap;">
            <asp:Label ID="Label4" runat="server" Text="文件各版平均得分" meta:resourcekey="Label4Resource1" ></asp:Label>
         </td>         
         <td>
            <b><font CssClass="SizeL" color="red">&nbsp;<asp:Label ID="labVerGrade" runat="server"></asp:Label></font></b></td>
         <td style=" white-space:nowrap;">
             <asp:Label ID="Label7" runat="server" Text="各版本累計評比人數：" meta:resourcekey="Label7Resource1" ></asp:Label>
         </td>
         <td>
             <asp:Label ID="labAllNum" runat="server" Font-Bold="True" CssClass="SizeL" ForeColor="Blue"></asp:Label>
         </td>             
     </tr>
    </table>
    <br />
        <asp:Label ID="Label8" runat="server" Text="您如何評價此文件的實用性？" meta:resourcekey="Label8Resource1" ></asp:Label>
    <br/>     
 
    <table width="100%"  border="1" cellspacing="0" class="linetable" style="background-color:#cccccc;" >
<tbody>	
    <tr >
		<td bgcolor="#FFFFFF" align="center"><img src="../images/bad.gif" /></td>
		<td align="center" bgcolor="#ccccff"><b>0</b></td>
		<td align="center" bgcolor="#ccccff"><b>1</b></td>
		<td align="center" bgcolor="#ccccff"><B>2</B></td>
		<td align="center" bgcolor="#ccccff"><B>3</B></td>
		<td align="center" bgcolor="#ccccff"><B>4</B></td>
		<td align="center" bgcolor="#ccccff"><B>5</B></td>
		<td align="center" bgcolor="#ccccff"><B>6</B></td>
		<td align="center" bgcolor="#ccccff"><B>7</B></td>
		<td align="center" bgcolor="#ccccff"><B>8</B></td>
		<td align="center" bgcolor="#ccccff"><B>9</B></td>
		<td align="center" bgcolor="#ccccff"><B>10</B></td>
		<td bgcolor="#FFFFFF" align="center"><img src="../images/agree.gif" /></td>
	</tr>
	<tr>
		<td style="height: 23px; width: 20px;" bgcolor="#a9bdcf" align="center"><asp:Label ID="Label9" runat="server" Text="劣" meta:resourcekey="Label9Resource1" ></asp:Label></td>
		<td style="height: 23px; width: 40px;" bgcolor="#eaeaff"><div align="center">
            <asp:RadioButton ID="rs0" runat="server" GroupName="DMSGrade" onclick="ChooseZero(this)"  /></td>
		<td style="height: 23px; width: 40px;" bgcolor="#eaeaff"><div align="center">
            <asp:RadioButton ID="rs1" runat="server" GroupName="DMSGrade" onclick="NoChooseZero(this)"  /></td>
		<td style="height: 23px; width: 40px;" bgcolor="#eaeaff""><div align="center">
            <asp:RadioButton ID="rs2" runat="server" GroupName="DMSGrade" onclick="NoChooseZero(this)"  />
        </td>
		<td style="height: 23px; width: 40px;" bgcolor="#eaeaff"><div align="center">
            <asp:RadioButton ID="rs3" runat="server" GroupName="DMSGrade" onclick="NoChooseZero(this)" />
        </td>
		<td style="height: 23px; width: 40px;" bgcolor="#eaeaff"><div align="center">
            <asp:RadioButton ID="rs4" runat="server" GroupName="DMSGrade" onclick="NoChooseZero(this)"  />
        </td>
		<td style="height: 23px; width: 40px;" bgcolor="#eaeaff"><div align="center">
            <asp:RadioButton ID="rs5" runat="server" Checked="True" GroupName="DMSGrade" onclick="NoChooseZero(this)" />
        </td>
		<td style="height: 23px; width: 40px;" bgcolor="#eaeaff"><div align="center">
            <asp:RadioButton ID="rs6" runat="server" GroupName="DMSGrade" onclick="NoChooseZero(this)"  />
        </td>
		<td style="height: 23px; width: 40px;" bgcolor="#eaeaff"><div align="center">
            <asp:RadioButton ID="rs7" runat="server" GroupName="DMSGrade" onclick="NoChooseZero(this)" />
        </td>
		<td style="height: 23px; width: 40px;" bgcolor="#eaeaff"><div align="center">
            <asp:RadioButton ID="rs8" runat="server" GroupName="DMSGrade" onclick="NoChooseZero(this)"  />
        </td>
		<td style="height: 23px; width: 40px;" bgcolor="#eaeaff"><div align="center">
            <asp:RadioButton ID="rs9" runat="server" GroupName="DMSGrade" onclick="NoChooseZero(this)"  />
        </td>
        		<td style="height: 23px; width: 40px;" bgcolor="#eaeaff"><div align="center">
            <asp:RadioButton ID="rs10" runat="server" GroupName="DMSGrade" onclick="NoChooseZero(this)" />
        </td>
		<td style="height: 23px; width: 20px;" bgcolor="#FFCCCC" align="center"><asp:Label ID="Label10" runat="server" Text="優" meta:resourcekey="Label10Resource1" ></asp:Label></td>
	</tr>
</tbody>
</table>       
    <table width="100%"><tr><td    align="left">
        <asp:CheckBox ID="ckSendMessage" runat="server" Text="發送訊息通知該作者" Visible="False" meta:resourcekey="ckSendMessageResource1"  /><br />        
        <asp:Label ID="Label11" runat="server" Text="意見：" meta:resourcekey="Label11Resource1" ></asp:Label><br />
        <asp:TextBox ID="txtComment" runat="server" Height="160px" TextMode="MultiLine" Width="100%" ></asp:TextBox>
        <br />
        <asp:Label ID="lblNoComment" runat="server" Text="請填寫評價意見" Visible="False" meta:resourcekey="lblNoCommentResource1"></asp:Label><br />
        </td></tr></table>
    <asp:Label ID="lblGrade" runat="server" Visible="False" Text="文件評分表" meta:resourcekey="lblGradeResource1" ></asp:Label>
    <asp:Label ID="labDocIsDelete" runat="server" Text="文件已被銷毀" Visible="false" meta:resourcekey="labDocIsDeleteResource1"></asp:Label>
     <asp:Label ID="labNoDownload" runat="server" Text="尚未下載文件，無法評分" Visible="false" meta:resourcekey="labNoDownloadResource1"></asp:Label>

<style type="text/css">
    TABLE.linetable
    {
        border: 1px solid #666666;
    }

    .linetable TD
    {
        border-right: 1px solid #666666;
        border-top: 1px solid #666666;
        border-bottom: 1px solid #666666;
        border-left: 1px solid #666666;
    }
</style> 

</asp:Content>

