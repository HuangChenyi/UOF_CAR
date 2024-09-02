<%@ Control Language="C#" AutoEventWireup="true" Inherits="WKF_FormUse_FormIQY_UC_QueryIqySingle" Codebehind="UC_QueryIqySingle.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>



<style>
.bigT 
{
    color:#ffffff;	font-size:25px; font-weight: bolder; 
}
</style>


<center>
<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" style="vertical-align:top">
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td style="width:120px;min-width:120px"><img src="<%=themePath %>/images/wf_icon03.jpg" width="120" height="65"></td>
        <td style="background-image: url(<%=themePath %>/images/wf_a01.jpg);background-repeat:repeat-x;height:65px;background-position: 0% 100%;"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td class="bigT" style=" vertical-align:middle; height:65px; text-align:left">
                <asp:Label ID="Label2" runat="server" 
        Text="徵詢資訊" meta:resourcekey="Label2Resource2"></asp:Label></td>
            </tr>
        </table></td>
        <td width="26"><img src="<%=themePath %>/images/wf_a02.jpg" width="26" height="65"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="15" height="8" style="background-image: url(<%=themePath %>/images/wf_a03.gif)"><img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8"></td>
        <td height="8" style="background-image: url(<%=themePath %>/images/wf_a04.gif)"></td>
        <td width="15" height="8" style="background-image: url(<%=themePath %>/images/wf_a05.gif)"><img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8"></td>
      </tr>
      <tr>
        <td style="background-image: url(<%=themePath %>/images/wf_a03.gif)"><img src="<%=themePath %>/images/wf_a03.gif" width="15" height="8"></td>
        <td style="background-image: url(<%=themePath %>/images/wf_a04.gif)"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td>&nbsp;
            <Fast:Grid id="DGIqySingleList" runat="server" Width="100%" 
    PageSize="15" EnhancePager="False" 
    DataKeyOnClientWithCheckBox="False"   
     AutoGenerateColumns="False" 
    AutoGenerateCheckBoxColumn="False" DefaultSortDirection="Ascending" 
    onrowdatabound="DGIqySingleList_RowDataBound" CssClass="Grid" 
    AllowSorting="True" EmptyDataText="沒有資料"  KeepSelectedRows="False" meta:resourcekey="DGIqySingleListResource3"  >
    <AlternatingRowStyle  CssClass="GridItemAlternating" />
   <HeaderStyle CssClass="GridHeader"/>    
    <RowStyle CssClass="GridItem" />        
    <PagerStyle CssClass="GridPager"   />

    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
    <Columns>
        <asp:TemplateField HeaderText="被徵詢者" meta:resourcekey="TemplateFieldResource1">
            <ItemTemplate>
                <asp:Label ID="lblIqyUser" runat="server" Text='<%#: Bind("IQY_USER_ID") %>' 
                    meta:resourcekey="lblIqyUserResource1"></asp:Label>
             <asp:ImageButton ID="ibtnAttach" runat="server" 
                                ImageUrl="~/common/images/icon/icon_m61.gif" 
                                meta:resourcekey="ibtnAttachResource1" />
            </ItemTemplate>
            <ItemStyle Width="27%" />
        </asp:TemplateField>
        <asp:BoundField DataField="CONTENT" HeaderText="回覆意見" HtmlEncode="true"
            meta:resourcekey="BoundFieldResource2">
        <ItemStyle Width="20%" />
        </asp:BoundField>
        <asp:BoundField DataField="IQY_RESULT" HeaderText="結果" 
            meta:resourcekey="BoundFieldResource3">
        <ItemStyle Width="5%" HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="回覆時間" meta:resourcekey="BoundFieldResource4">
            <ItemTemplate>
                <asp:Label ID="lblResponseTime" runat="server"></asp:Label>
            </ItemTemplate>
        <ItemStyle Width="12%" HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:BoundField DataField="FORM_USER_ID" HeaderText="徵詢者" 
            meta:resourcekey="BoundFieldResource5">
        <ItemStyle Width="18%" />
        </asp:BoundField>
        <asp:BoundField DataField="IQY_COMMENT" HeaderText="徴詢原因" HtmlEncodeFormatString="true" 
            meta:resourcekey="BoundFieldResource7">
            <ItemStyle Width="18%" />
        </asp:BoundField>
    </Columns>
    
    <EnhancePagerSettings ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage="" LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass="" PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass="" PreviousAltImageUrl="" PreviousImageUrl="" />
    
</Fast:Grid>
            </td>
          </tr>
        </table></td>
        <td style="background-image: url(<%=themePath %>/images/wf_a05.gif)"><img src="<%=themePath %>/images/wf_a05.gif" width="15" height="8"></td>
      </tr>
      <tr>
        <td style="background-image:url(<%=themePath %>/images/wf_a06.gif);background-position:0% 0%;height:20px;width:15px"></td>
        <td style="background-image:url(<%=themePath %>/images/wf_a07.gif);background-position:0% 0%;height:20px"></td>
        <td style="background-image:url(<%=themePath %>/images/wf_a08.gif);background-position:0% 0%;height:20px;width:15px"></td>
      </tr>
    </table></td>
  </tr>
</table>
    </center>





<asp:Label ID="lblAttach" runat="server" Text="附件" Visible=False 
    meta:resourcekey="lblAttachResource1"></asp:Label>

<asp:Label ID="lblLabel1" Text="贊成" Visible="False" runat="server" 
    meta:resourcekey="lblLabel1Resource1"></asp:Label>
<asp:Label ID="lblLabel2" Text="反對" Visible="False" runat="server" 
    meta:resourcekey="lblLabel2Resource1"></asp:Label>
<asp:Label ID="lblLabel3" Text="其他" Visible="False" runat="server" 
    meta:resourcekey="lblLabel3Resource1"></asp:Label>
<asp:Label ID="lblLabel4" Text="下載附件" Visible="False" runat="server" 
    meta:resourcekey="lblLabel4Resource1"></asp:Label>
<asp:Label ID="Label1" Text="下載" Visible="False" runat="server" 
    meta:resourcekey="Label1Resource1"></asp:Label>
