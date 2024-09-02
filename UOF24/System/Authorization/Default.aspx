<%@ Page Language="C#" MasterPageFile="~/Master/DefaultMasterPage.master" AutoEventWireup="true" Inherits="System_Authorization_Default" Title="授權資訊" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>
<%@ Register Src="~/Common/FileCenter/V3/UC_FileCenter.ascx" TagPrefix="uc2" TagName="UC_FileCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .displayclass{
            display:none;
        }
    </style>
      <script type="text/javascript">
          function <%=UC_FileCenter1.ClientID%>_OnClientFilesUploaded(id, name, folder, size, type, url, w, h) {
            var paras = {};
            paras.FileGroupId = id;
            paras.LicenseUrl = url;
            $("#<%=hideLicense.ClientID %>").val(url);
              //__doPostBack('ctl00$ContentPlaceHolder1$lbtnImport', '')
              __doPostBack('ctl00$ContentPlaceHolder1$lbtnImport', '')
            <%--var data = [ $("#<%=hideLicense.ClientID %>").val(),$("#<%=hideServerpath.ClientID %>").val(),$("#<%=hideServerLicense.ClientID%>").val(),$("#<%=lbState.ClientID%>").text(),$("#<%=lblnotStart.ClientID%>").text()];
            var msg= $uof.pageMethod.sync("ImportLicenseInfo", data);
            $find("<%=UC_FileCenter1.ClientID%>").remove_file(id);
              if (msg === "expired")
                  alert("License already expired.");
              else if(msg === "error") {
                  alert("Error license format");
              }
              else {
                  var typeflag = "";
                  var obj = JSON.parse(msg);
                  $.each(obj, function (i, val) {
                      if (i === "StateData") {
                          $("#<%=lbStateData.ClientID %>").text("True");
                      }
                      else if (i === "CompanyNameData") {
                          $("#<%=lbCompanyNameData.ClientID %>").text(val);
                      }
                      else if (i === "ExpireDateData") {
                          $("#<%=lbExpireDateData.ClientID %>").text(val);
                      }
                      else if (i === "McData") {
                          $("#<%=lbMcData.ClientID %>").text(val);
                      }
                      else if (i === "WarrantyDateData") {
                          $("#<%=lblWarrantyDateData.ClientID %>").text(val);
                      }
                      else if (i === "UserAccount") {
                          if (val === "online")
                              $("#<%=Label3.ClientID %>").text($("#<%=lblOnlineCount.ClientID %>").text());
                          else
                              $("#<%=Label3.ClientID %>").text( $("#<%=lblAccCount.ClientID %>").text());
                      }
                      else if (i === "strUserData") {
                          var str = val;
                          //var regex = /<br\s*[\/]?>/gi;
                          $("#<%=lbUser.ClientID %>").html( str);

                         // $("#<%=lbUser.ClientID %>").text(typeflag + val);
                      }
                      else if (i === "displaylink") {
                          if (val === "False")
                              $("#<%=tr3.ClientID %>").hide();
                          else
                              $("#<%=tr3.ClientID %>").show();
                      }
                  });

              }--%>
          }
      </script>
    <br />
    <table border="0"   style="width:100%">
                <tr>
                    <td style="text-align: center"  >
        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" 
        ForeColor="Red" ></asp:CustomValidator>
                    </td>
                </tr>
         <tr>
                    <td style="text-align: left"  >
    <fieldset class="UofContainer" style="width:60%">
        <legend><asp:Label ID="Label5" runat="server" Text="Machine Code :" meta:resourcekey="Label1Resource1"></asp:Label></legend>
        <div>
            <asp:Label ID="lbMachineCode" runat="server" meta:resourcekey="lbMachineCodeResource1"></asp:Label>
        </div>
    </fieldset>
    <br />
    <br />
                         </td>
             </tr>
         <tr>
                    <td style="text-align: left"  >
    <fieldset class="UofContainer" style="width:60%">
        <legend><asp:Label ID="Label6" runat="server" Text="License :" meta:resourcekey="Label2Resource1"></asp:Label></legend>
        <div>
            <asp:Label ID="Label4" runat="server" class="SizeL" ForeColor="Blue" Text="如何啟動系統請參閱安裝手冊" meta:resourcekey="Label4Resource1"></asp:Label>
            <table  class="PopTable" cellspacing="1">
                <tr>
                    <td align="right" style="width:30%">
                        <asp:Label ID="lbState" runat="server" Text="啟用" meta:resourcekey="lbStateResource1"></asp:Label></td>
                    <td align="left">
                        <asp:Label ID="lbStateData" runat="server" meta:resourcekey="lbStateDataResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="lbCompanyName" runat="server" Text="公司名稱" meta:resourcekey="lbCompanyNameResource1"></asp:Label></td>
                    <td align="left">
                        <asp:Label ID="lbCompanyNameData" runat="server" meta:resourcekey="lbCompanyNameDataResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="lbExpireDate" runat="server" Text="到期日" meta:resourcekey="lbExpireDateResource1"></asp:Label></td>
                    <td >
                        <asp:Label ID="lbExpireDateData" runat="server" meta:resourcekey="lbExpireDateDataResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="Label1" runat="server" Text="保固日期" meta:resourcekey="lbWarrantyDateResource1"></asp:Label></td>
                    <td >
                        <asp:Label ID="lblWarrantyDateData" runat="server" meta:resourcekey="lblWarrantyDateDataResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="lbMc" runat="server" Text="Machine Code" meta:resourcekey="lbMcResource1"></asp:Label></td>
                    <td align="left">
                        <asp:Label ID="lbMcData" runat="server" meta:resourcekey="lbMcDataResource1"></asp:Label></td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="Label3" runat="server" Text="授權人數" meta:resourcekey="LabelACCResource1"></asp:Label></td>
                    <td >
                        <asp:Label ID="lbUser" runat="server" meta:resourcekey="lbUserResource1"></asp:Label></td>
                </tr>
 
                <tr id="tr1" runat="server">
                    <td >
                        <asp:Label ID="Label7" runat="server" Text="License資訊匯入" meta:resourcekey="Label7Resource1" ></asp:Label></td>
                    <td >
                        <uc2:UC_FileCenter runat="server" ID="UC_FileCenter1" ModuleName="EIP" AllowedFileType="XML"  AllowedMultipleFileSelection="false"   />
                        <asp:HiddenField ID="hideLicense" runat="server" />
                        <asp:HiddenField ID="hideServerpath" runat="server" />
                        <asp:HiddenField ID="hideServerLicense" runat="server" />
                        <asp:LinkButton ID="lbtnImport" runat="server" OnClick="lbtnImport_Click"></asp:LinkButton>
                        </td>
                </tr>
                <tr id="tr2" runat="server">
                    <td><asp:Label ID="LabelLicenExp" runat="server" Text="License資訊匯出" meta:resourcekey="LabelLicenExpResource1"></asp:Label></td>
                    <td> <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Common/DownloadLicense.ashx" Text="下載License" meta:resourcekey="HyperLink1Resource1" ></asp:HyperLink>  
                        <asp:CustomValidator ID="cvCheckExist" runat="server" Display="Dynamic" ErrorMessage="License檔案不存在"></asp:CustomValidator>
                    </td>
                </tr>               
 <tr id="tr3" runat="server" >
                    <td class="PopTableLeftTD"><asp:Label ID="Label8" runat="server" Text="授權帳號管理" meta:resourcekey="Label8Resource1"></asp:Label></td>
                    <td class="PopTableRightTD" > <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/System/Authorization/QueryAuthorizationAccount.aspx" Target="_blank" Text="前往" meta:resourcekey="HyperLink2Resource1"></asp:HyperLink>  
                       
                    </td>
                </tr>
                
            </table>
        </div>
        <asp:Label ID="lblnotStart" runat="server" Text="未啟用" CssClass="displayclass"  meta:resourcekey="lblnotStartResource1"></asp:Label>
    </fieldset>
                        </td>
             </tr>
    </table>
    <asp:Label ID="lblOnlineCount" runat="server" Text="連線人數" meta:resourcekey="Label3Resource1" CssClass="displayclass" ></asp:Label>
    <asp:Label ID="lblAccCount" runat="server" Text="帳號人數"  CssClass="displayclass"  meta:resourcekey="lblAccCountResource1"></asp:Label>
</asp:Content>
