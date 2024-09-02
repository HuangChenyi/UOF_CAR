<%@ Control Language="C#" AutoEventWireup="true" Inherits="DMS_DocStore_UC_DMSDoc" Codebehind="UC_DMSDoc.ascx.cs" %>
<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Fast" %>
<style type="text/css">
    .action_over
    {
        cursor: hand;
        color: red;
        text-decoration: underline;
    }

    .action_out
    {
        color: #3366cc;
    }
</style>
<div onclick="Window_OnClick()" >
    <table>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;</td>
            <td>
                <table style="width: 100%;" cellspacing="0" border="0">
                    <tr>
                        <td >
                            <table style="width: 100%;">
                                <tr>
                                    <td style="width:20px">&nbsp;
                                        <asp:Image ID="imgFolder" runat="server" meta:resourcekey="imgFolderResource1" />
                                    </td>
                                    <td style="min-width:20px; max-width:350px; vertical-align: bottom; text-align:left;overflow:auto;" nowrap>
                                        <div style="overflow:auto;">
                                            <span style="min-width:20px; max-width:350px; text-wrap:none; text-align:left;">
                                                <asp:Label ID="labFolderName" runat="server" CssClass="SizeXL" meta:resourcekey="labFolderNameResource1"></asp:Label>
                                                <asp:Image ID="imgAgent" runat="server" ImageUrl="~/DMS/images/imgAgent.gif" ToolTip="代理訂閱" Visible="False" meta:resourcekey="imgAgentResource1" />
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>&nbsp;&nbsp;</td>
                        <td style="height: 12px; text-align:left; vertical-align:middle;" nowrap>
                            <asp:Panel ID="panDefault" runat="server" meta:resourcekey="panDefaultResource1">
                                <table>
                                    <tr>
                                        <td>
                                            <table ID="folderSearch" runat="server" style="width:100%; ">
                                                <tr>
                                                    <td>
                                                        <span >
                                                        <asp:Label ID="lblSearchFolderDoc" runat="server" Text="搜尋此目錄(不含子目錄)內的文件(名稱、編號、關鍵字):" meta:resourcekey="lblSearchFolderDocResource1"></asp:Label>
                                                        <asp:TextBox ID="txtKeyWord" onkeydown="OnEnterPress(event)"  runat="server" Width="170px"></asp:TextBox>
                                                        <telerik:RadButton ID="btnSearch" runat="server"  OnClick="btnSearch_Click" Text="搜尋"  Width="68px" meta:resourcekey="btnSearchResource1">
                                                            <Icon PrimaryIconUrl="~/DMS/images/zoom.gif" PrimaryIconLeft="2px" />
                                                        </telerik:RadButton>
                                                        </span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="chkShowAll" runat="server" Text="(顯示其他狀態文件" Font-Bold="False" Height="24px" AutoPostBack="True" 
                                                OnCheckedChanged="chkShowAll_CheckedChanged" CssClass="white" meta:resourcekey="chkShowAllResource1" />
                                            <asp:LinkButton ID="lbtnShowAllInfo" runat="server" Text="說明" meta:resourcekey="lbtnShoeAllInfoResource1" ></asp:LinkButton>
                                            <asp:Label ID="lblbrackets" runat="server" Text=")"></asp:Label>
                                            &nbsp;&nbsp;
                                            <asp:Label ID="Label1" runat="server" Text="顯示方式：" meta:resourcekey="Label1Resource1"></asp:Label>
                                            <asp:DropDownList ID="ddlChangeStyle" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlChangeStyle_SelectedIndexChanged" meta:resourcekey="ddlChangeStyleResource1">
                                                <asp:ListItem Value="ListStyle" Selected="True" Text="文件列表" meta:resourcekey="ListItemResource1"></asp:ListItem>
                                                <asp:ListItem Value="DetailStyle" Text="詳細資料" meta:resourcekey="ListItemResource2"></asp:ListItem>
                                            </asp:DropDownList>
                                            &nbsp;&nbsp;
                                            <asp:Label ID="Label9" runat="server" Text="排列方式：" meta:resourcekey="Label9Resource1"></asp:Label>
                                            <asp:DropDownList ID="ddlSortType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSortType_SelectedIndexChanged" meta:resourcekey="ddlSortTypeResource1">
                                                <asp:ListItem Value="DocName" Text="文件名稱" meta:resourcekey="ListItemResource3"></asp:ListItem>
                                                <asp:ListItem Value="DocSerial" Text="文件編號" meta:resourcekey="ListItemResource4"></asp:ListItem>
                                                <asp:ListItem Value="DocAuthor" Text="作者" meta:resourcekey="ListItemResource5"></asp:ListItem>
                                                <asp:ListItem Value="DocStatus" Text="狀態" meta:resourcekey="ListItemResource6"></asp:ListItem>
                                                <asp:ListItem Value="DocModifyDate" Text="修改日" meta:resourcekey="ListItemResource7"></asp:ListItem>
                                                <asp:ListItem Value="DocKeyWord" Text="關鍵字" meta:resourcekey="ListItemResource8"></asp:ListItem>
                                            </asp:DropDownList>
                                            &nbsp;&nbsp;
                                            <asp:Label ID="Label14" runat="server" Text="狀態：" meta:resourcekey="Label14Resource1"></asp:Label>
                                            <asp:DropDownList ID="ddlSortStatus" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSortStatus_SelectedIndexChanged" meta:resourcekey="ddlSortStatusResource1">
                                                <asp:ListItem Text="全部" Value="" meta:resourcekey="ListItemResource9"></asp:ListItem>
                                                <asp:ListItem Text="已公佈" Value="Publish" meta:resourcekey="ListItemResource10"></asp:ListItem>
                                                <asp:ListItem Text="已存回" Value="CheckIn" meta:resourcekey="ListItemResource11"></asp:ListItem>
                                                <asp:ListItem Text="已取出" Value="CheckOut" meta:resourcekey="ListItemResource12"></asp:ListItem>
                                                <asp:ListItem Text="審核中" Value="Approval" meta:resourcekey="ListItemResource13"></asp:ListItem>
                                                <asp:ListItem Text="已作廢" Value="Void" meta:resourcekey="ListItemResource14"></asp:ListItem>
                                                <asp:ListItem Text="發佈拒絕" Value="DocDeny" meta:resourcekey="ListItemResource15"></asp:ListItem>
                                                <asp:ListItem Text="已下架" Value="TempInact" meta:resourcekey="ListItemResource16"></asp:ListItem>
                                                <asp:ListItem Text="未生效" Value="PublishInact" meta:resourcekey="ListItemResource23"></asp:ListItem>
                                                <asp:ListItem Text="已失效" Value="Inactive" meta:resourcekey="ListItemResource17"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    
                                </table>
                            </asp:Panel>                        
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="panCommon" runat="server" Visible="False" meta:resourcekey="panCommonResource1">
                    <telerik:RadToolBar ID="RadFolderToolbar1" runat="server" Width="99%" OnButtonClick="RadFolderToolbar1_ButtonClicked" OnClientButtonClicking="RadFolderToolbar1_Click" meta:resourcekey="RadFolderToolbar1Resource1" SingleClick="None">
                        <Items>
                            <telerik:RadToolBarButton runat="server" CheckedImageUrl="~/Common/Images/Icon/icon_m03.gif" DisabledImageUrl="~/Common/Images/Icon/icon_m03.gif" HoveredImageUrl="~/Common/Images/Icon/icon_m03.gif" ImageUrl="~/Common/Images/Icon/icon_m03.gif" Text="取消" Value="Delete" meta:resourcekey="RadToolBarButtonResource1">
                            </telerik:RadToolBarButton>
                            <telerik:RadToolBarButton runat="server" IsSeparator="True" Value="s1" meta:resourcekey="RadToolBarButtonResource2" />
                        </Items>
                    </telerik:RadToolBar>
                </asp:Panel>
                <asp:Panel ID="panSearch" runat="server" Visible="False" meta:resourcekey="panSearchResource1">
                    <asp:Label ID="labOrderType" runat="server" Text="排序：" meta:resourcekey="labOrderTypeResource1"></asp:Label><asp:DropDownList
                        ID="ddlSearchOrder" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSearchOrder_SelectedIndexChanged"
                        Width="130px" meta:resourcekey="ddlSearchOrderResource1">
                        <asp:ListItem Value="filename" meta:resourcekey="ListItemResource18" Text="文件檔名"></asp:ListItem>
                        <asp:ListItem Value="docsize" meta:resourcekey="ListItemResource19" Text="文件大小"></asp:ListItem>
                        <asp:ListItem Value="FolderPath" meta:resourcekey="ListItemResource20" Text="文件路徑"></asp:ListItem>
                        <asp:ListItem Value="ModifyDate" meta:resourcekey="ListItemResource21" Text="公佈日"></asp:ListItem>
                        <asp:ListItem Value="docAuthor" meta:resourcekey="ListItemResource22" Text="作者"></asp:ListItem>
                    </asp:DropDownList>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;
            </td>
            <td align="left" style="width: 100%">
                <Fast:Grid ID="Grid1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                    AutoGenerateColumns="False" DataKeyNames="DOC_ID"
                    OnRowDataBound="Grid1_RowDataBound"
                    Width="100%" OnPageIndexChanging="Grid1_PageIndexChanging" OnSorting="Grid1_Sorting"
                    SkinID="DMSStyle" DataKeyOnClientWithCheckBox="False" EnhancePager="True" PageSize="15"
                    DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False"  meta:resourcekey="Grid1Resource1" >
                    <ExportExcelSettings AllowExportToExcel="False" />
                    <EnhancePagerSettings
                        ShowHeaderPager="True" FirstAltImageUrl="" FirstImageUrl="" LastAltImage=""
                        LastImageUrl="" NextIAltImageUrl="" NextImageUrl="" PageInfoCssClass=""
                        PageNumberCssClass="" PageNumberCurrentCssClass="" PageRedirectCssClass=""
                        PreviousAltImageUrl="" PreviousImageUrl="" />
                    <ExportExcelSettings AllowExportToExcel="False" />
                    <Columns>
                        <asp:TemplateField HeaderText="文件編號" SortExpression="DOC_SERIAL" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <span style="width: 80px;">
                                    <asp:Label runat="server" Text='<%# Bind("DOC_SERIAL") %>' ID="Label2" meta:resourcekey="Label2Resource1"></asp:Label>
                                </span>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("DOC_SERIAL") %>' ID="TextBox1" meta:resourcekey="TextBox1Resource1"></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="100px" Wrap="False" />
                            <ItemStyle Width="100px" Wrap="false" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="文件名稱" SortExpression="DOC_NAME" meta:resourcekey="TemplateFieldResource3">
                            <ItemTemplate>
                                <table style="width:100%;">
                                    <tr>
                                        <td style="min-width: 16px">
                                            <asp:Image ID="imgStar1" runat="server" ImageUrl="~/DMS/images/ratnull.gif" meta:resourcekey="imgStar1Resource1" />
                                            <asp:Image ID="imgPDFError" runat="server" ImageUrl="~/DMS/images/error.gif" meta:resourcekey="imgPDFErrorResource1" />
                                            <asp:Image ID="docIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" meta:resourcekey="docIconResource1" />
                                        </td>
                                        <td>&nbsp;
                                            <asp:LinkButton ID="labDLFile" runat="server" Text='<%# Bind("DOC_NAME") %>' meta:resourcekey="labDLFileResource1"></asp:LinkButton>
                                            <asp:Label ID="lblDownloadNum" Text='<%# Bind("DL_NUM") %>' ToolTip= "觀看與下載次數" runat="server" ForeColor="Black" meta:resourcekey="lblDownloadNumResource1"></asp:Label>
                                            
                                        </td>
                                        <td  style="width:100%;">
                                            <table style="width:100%;">
                                                <tr>
                                                    <td style="text-align:right;">
                                                        <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%#Eval("DOC_ID")+","+Eval("MANUAL_VERSION") %>' Visible="false" runat="server" AlternateText="觀看文件" OnClick="imgPDFViewer_Click"/>
                                                        <asp:Image ID="imgNoPDFViewer" runat="server" Visible="false"></asp:Image>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            <ItemStyle HorizontalAlign="Left" Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="作者" SortExpression="DOC_AUTHOR" meta:resourcekey="TemplateFieldResource4">
                            <ItemTemplate>
                                <asp:Label ID="lblAuthor" runat="server" meta:resourcekey="lblAuthorResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            <ItemStyle Wrap="False" Width="120px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="MANUAL_VERSION" HeaderText="版本" SortExpression="MANUAL_VERSION" meta:resourcekey="BoundFieldResource1">
                            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            <ItemStyle Width="45px" Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="狀態" SortExpression="DOC_STATUS_DISPLAY" meta:resourcekey="TemplateFieldResource5">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource1"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Wrap="False"/>
                            <ItemStyle HorizontalAlign="Center" Width="60px" Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="公佈日" SortExpression="PUBLISH_DATE" meta:resourcekey="PUBLISH_DATE_BoundFieldResource">
                            <ItemTemplate>
                                <asp:Label ID="lblPublishDate" runat="server" Text=""></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="120px" Wrap="False" />
                            <ItemStyle Width="120px" Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="關鍵字" SortExpression="DOC_KEYWORD" meta:resourcekey="TemplateFieldResource6">
                            <ItemTemplate>

                                <asp:Label ID="lblKeyWord" runat="server" Text='<%# Bind("DOC_KEYWORD") %>' meta:resourcekey="lblKeyWordResource1"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>

                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DOC_KEYWORD") %>' meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                            </EditItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="150px" Wrap="False" />
                            <ItemStyle Width="150px" Wrap="False" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="到期日" SortExpression="INVALID_DAY" meta:resourcekey="TemplateFieldResource16">
                            <ItemTemplate>
                                <asp:Label ID="lblInvalidDay" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="120px" Wrap="False" />
                            <ItemStyle Width="120px" Wrap="False" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource7">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnInfo" runat="server" Text="資訊" ForeColor="Blue" meta:resourcekey="lbtnInfoResource1"></asp:LinkButton>&nbsp;
                            <asp:LinkButton ID="lbtnAdvanced" runat="server" Text="進階" ForeColor="Blue" meta:resourcekey="lbtnAdvancedResource1"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            <ItemStyle Wrap="False" Width="100px" HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle Height="30px" />
                    <EnhancePagerSettings ShowHeaderPager="True" />
                </Fast:Grid>
                <Fast:Grid ID="gridDetail" runat="server" AllowSorting="True" AutoGenerateCheckBoxColumn="False"
                    AutoGenerateColumns="False" DataKeyNames="DOC_ID"
                    Width="100%" SkinID="DMSStyle" DataKeyOnClientWithCheckBox="False"
                    EnhancePager="True" ShowHeader="False" OnRowDataBound="gridDetail_RowDataBound"
                    AllowPaging="True" OnPageIndexChanging="gridDetail_PageIndexChanging" DefaultSortDirection="Ascending"
                    PageSize="15" EmptyDataText="沒有資料"
                    KeepSelectedRows="False"  meta:resourcekey="gridDetailResource2"  >
                    <EnhancePagerSettings ShowHeaderPager="True" />
                    <ExportExcelSettings AllowExportToExcel="False" />
                    <EnhancePagerSettings ShowHeaderPager="True" />
                    <ExportExcelSettings AllowExportToExcel="False" />
                    <Columns>
                        <asp:TemplateField meta:resourcekey="TemplateFieldResource15">
                            <ItemTemplate>
                                <table style=" text-align: left; width: 100%;" border="0">
                                    <tbody>
                                        <tr>
                                            <td colspan="3">
                                                <table>
                                                    <tbody>
                                                        <tr>
                                                            <td>&nbsp;&nbsp;
                                                                <asp:Image ID="imgStar1" runat="server" ImageUrl="~/DMS/images/ratnull.gif" meta:resourcekey="imgStar1Resource4"></asp:Image>
                                                                <asp:Image ID="imgPDFError" runat="server" ImageUrl="~/DMS/images/error.gif" meta:resourcekey="imgPDFErrorResource3"></asp:Image>
                                                                <asp:Image ID="docIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" meta:resourcekey="docIconResource5"></asp:Image>
                                                            </td>
                                                            <td>&nbsp;
                                                                <span style="width: 520px; word-break: break-all">
                                                                    <asp:LinkButton ID="labDLFile" runat="server" Text='<%# Bind("DOC_NAME") %>'
                                                                        ForeColor="Maroon" meta:resourcekey="labDLFileResource3"></asp:LinkButton>
                                                                </span>                                                                
                                                            </td>
                                                            <td>&nbsp;
                                                                <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%#Eval("DOC_ID")+","+Eval("MANUAL_VERSION") %>' Visible="false" runat="server" AlternateText="觀看文件" OnClick="imgPDFViewer_Click"/>
                                                                <asp:Image ID="imgNoPDFViewer" runat="server" Visible="false"></asp:Image>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;&nbsp;&nbsp;<asp:Label ID="lblFile" runat="server" Text="檔案名稱："
                                                ForeColor="Gray" meta:resourcekey="lblFileResource1"></asp:Label>
                                                <asp:Label ID="labFilename" runat="server" Text='<%# Bind("FILE_NAME") %>' meta:resourcekey="labFilenameResource2"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr >
                                            <td style="width:35%"  nowrap>&nbsp;&nbsp;
                                            <asp:Label ID="Label3" runat="server" Text="作者：" ForeColor="Gray" meta:resourcekey="Label3Resource1"></asp:Label>
                                                <asp:Label ID="lblAuthor" runat="server" meta:resourcekey="lblAuthorResource4"></asp:Label>
                                            </td>
                                            <td style="width: 20%">
                                                <asp:Label ID="Labela41" runat="server" Text="版本：" ForeColor="Gray" meta:resourcekey="Labela41Resource1"></asp:Label>
                                                <asp:Label ID="labDetailVer" runat="server" Text='<%# Bind("MANUAL_VERSION") %>' meta:resourcekey="labDetailVerResource2"></asp:Label>
                                            </td>
                                            <td nowrap>
                                                <asp:Label ID="lblDocNum" runat="server" Text="文件編號："
                                                    ForeColor="Gray" meta:resourcekey="lblDocNumResource1"></asp:Label>
                                                <span style="width: 150px; word-break: break-all">
                                                    <asp:Label ID="labDocSerial" runat="server" Text='<%# Bind("DOC_SERIAL") %>' meta:resourcekey="labDocSerialResource2"></asp:Label>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:35%">&nbsp;&nbsp;
                                                <asp:Label ID="Label11" runat="server" Text="異動日：" ForeColor="Gray" meta:resourcekey="Label11Resource1"></asp:Label>
                                                <asp:Label ID="labDModifyDate" runat="server" meta:resourcekey="labDModifyDateResource2"></asp:Label>
                                            </td>
                                            <td style="width:20%">
                                                <asp:Label ID="Labela4" runat="server" Text="生效日：" ForeColor="Gray" meta:resourcekey="Labela4Resource1"></asp:Label>
                                                <asp:Label ID="lblActiveDay" runat="server" ForeColor="Black" meta:resourcekey="lblActiveDayResource2"></asp:Label>
                                            </td>
                                            <td >
                                                <asp:Label ID="lblSatusTitle" runat="server" ForeColor="Gray" meta:resourcekey="lblSatusTitleResource1" Text="狀態："></asp:Label>
                                                <asp:Label ID="lblStatus" runat="server" meta:resourcekey="lblStatusResource3"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:35%; text-align: left;">&nbsp;&nbsp;
                                            <asp:Label ID="lblPublishDateText" runat="server" Text="公佈日：" ForeColor="Gray" meta:resourcekey="lblPublishDateTextResource1"></asp:Label>
                                                <asp:Label ID="lblPublishDate" runat="server" meta:resourcekey="lblPublishDateResource2"></asp:Label>
                                            </td>
                                            <td style="width:20%;">
                                                <asp:Label ID="Labela6" runat="server" Text="過期日：" ForeColor="Gray" meta:resourcekey="Labela6Resource1"></asp:Label>
                                                <asp:Label ID="lblInvalidDay" runat="server" ForeColor="Black" meta:resourcekey="lblInvalidDayResource2"></asp:Label>
                                            </td>
                                            <td>
                                                <table style="width:70%;">
                                                    <tr>
                                                        <td runat="server" id="tdDownloadNum">
                                                            <asp:Label ID="lblDownloadNumTitle" runat="server" Text="下載次數：" ForeColor="Gray" meta:resourcekey="lblDownloadNumTitleResource1"></asp:Label>
                                                            <asp:Label ID="lblDownloadNum" runat="server" ForeColor="Black" meta:resourcekey="lblDownloadNumResource2"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="lblViewNumTitle" runat="server" Text="觀看次數：" ForeColor="Gray" meta:resourcekey="lblViewNumTitleResource1"></asp:Label>
                                                            <asp:Label ID="lblViewNum" runat="server" Text="" ForeColor="Gray"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3">
                                                <table style="table-layout: fixed" cellspacing="0" cellpadding="0" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td style="width: 75px" valign="top">&nbsp;&nbsp;
                                                            <asp:Label ID="Label12" runat="server" Text="摘要：" ForeColor="Gray" meta:resourcekey="Label12Resource1"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <span style="width: 480px; word-break: break-all">
                                                                    <asp:Label ID="labdelSummary" runat="server" Text='<%# Bind("DOC_COMMENT") %>' meta:resourcekey="labdelSummaryResource2"></asp:Label>
                                                                </span>

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 75px" valign="top">&#160;
                                                            </td>
                                                            <td>&#160;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 75px; vertical-align: text-top; white-space: nowrap">&#160;&#160;
                                                                <asp:Label ID="Label13" runat="server" ForeColor="Gray" Text="關鍵字：" meta:resourcekey="Label13Resource1"></asp:Label>

                                                            </td>
                                                            <td>
                                                                <span style="width: 480px; word-break: break-all">
                                                                    <asp:Label ID="labdetKeyword" runat="server" Text='<%# Bind("DOC_KEYWORD") %>' meta:resourcekey="labdetKeywordResource2"></asp:Label>
                                                                </span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;&nbsp;
                                            <asp:Label ID="lblClass" runat="server" ForeColor="Gray" meta:resourcekey="lblClassResource1" Text="文件類別："></asp:Label>
                                                <span style="width: 480px; word-break: break-all">
                                                    <asp:Label ID="lblDocClass" runat="server" Text='<%# Bind("CLASS_NAME") %>' meta:resourcekey="lblDocClassResource2"></asp:Label>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;&nbsp;
                                            <asp:Label ID="lblPath" runat="server" Text="文件路徑：" ForeColor="Gray" meta:resourcekey="lblPathResource1"></asp:Label>
                                                <asp:Label ID="lblDocPath" runat="server" meta:resourcekey="lblDocPathResource2"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 21px" align="right" colspan="3">
                                                <asp:Image ID="Image8" runat="server" ImageUrl="~/DMS/images/inform.gif" EnableViewState="False" meta:resourcekey="Image8Resource2" />

                                                <asp:LinkButton ID="lbtnInfo" runat="server" Text="資訊" ForeColor="Blue" meta:resourcekey="lbtnInfoResource1"></asp:LinkButton>
                                                &nbsp; <span lang="zh-tw">&#160;</span><asp:Image ID="Image9" runat="server" ImageUrl="~/DMS/images/commondoc.gif" EnableViewState="False" meta:resourcekey="Image9Resource2" />

                                                <asp:LinkButton ID="lbtnCommonuse" runat="server" Text="加入常用文件" ForeColor="Blue" meta:resourcekey="lbtnCommonuseResource2"></asp:LinkButton>
                                                &nbsp; <span lang="zh-tw">&#160;</span><asp:Image ID="Image10" runat="server" ImageUrl="~/Common/Images/Icon/icon_m194.png" meta:resourcekey="Image10Resource2" />

                                                <asp:LinkButton ID="lbtnDetailFavorites" runat="server" Text="加入收藏" ForeColor="Blue" meta:resourcekey="lbtnDetailFavoritesResource1"></asp:LinkButton>
                                                &nbsp;<span lang="zh-tw">&#160;</span><asp:Image ID="Image11" runat="server" ImageUrl="~/Common/Images/Icon/icon_m194.png" meta:resourcekey="Image11Resource2" />

                                                <asp:LinkButton ID="lbtnSubscribe" runat="server" Text="訂閱" ForeColor="Blue" meta:resourcekey="lbtnSubscribeResource1"></asp:LinkButton>
                                                &nbsp; <span lang="zh-tw">&#160;</span><asp:Image ID="Image12" runat="server" ImageUrl="~/DMS/images/sas.gif" EnableViewState="False" meta:resourcekey="Image12Resource2" />

                                                <asp:LinkButton ID="lbtnAnalysis" runat="server" Text="統計" ForeColor="Blue" meta:resourcekey="lbtnAnalysisResource3"></asp:LinkButton>
                                                &nbsp; <span lang="zh-tw">&#160;</span><asp:Image ID="Image13" runat="server" ImageUrl="~/DMS/images/agree.gif" EnableViewState="False" meta:resourcekey="Image13Resource2" />

                                                <asp:LinkButton ID="lbtnScore" runat="server" Text="評分" ForeColor="Blue" meta:resourcekey="lbtnScoreResource3"></asp:LinkButton>
                                                &nbsp;<span lang="zh-tw">&#160;</span>
                                                <asp:Image ID="Image14" runat="server" ImageUrl="~/Common/Images/Icon/icon_m180.gif" EnableViewState="False" meta:resourcekey="Image14Resource2"></asp:Image>
                                                <asp:LinkButton ID="lbtnRemoteUpload" runat="server" Text="異地發佈" ForeColor="Blue" meta:resourcekey="lbtnRemoteUploadResource2"></asp:LinkButton>
                                                &nbsp;
                                            <asp:Image ID="imgPrintRecord" runat="server" EnableViewState="False" ImageUrl="~/Common/images/icon/icon_m189.gif" meta:resourcekey="imgPrintRecordResource2" />
                                                <asp:LinkButton ID="lbtnPrintRecord" runat="server" Text="紙本分發管制" ForeColor="Blue" meta:resourceKey="lbtnPrintRecordResource1"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>


                            </ItemTemplate>
                            <HeaderStyle ForeColor="White" />
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle Height="30px" />
                </Fast:Grid>
                <Fast:Grid ID="gridCommon" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateCheckBoxColumn="True"
                    AutoGenerateColumns="False" DataKeyNames="DOC_ID" DefaultSortDirection="Ascending" 
                    DataKeyOnClientWithCheckBox="False" OnPageIndexChanging="gridCommon_PageIndexChanging"
                    OnRowDataBound="gridCommon_RowDataBound"
                    Width="100%" EnhancePager="True" PageSize="15" OnSorting="gridCommon_Sorting" EmptyDataText="沒有資料" KeepSelectedRows="False" meta:resourcekey="gridCommonResource1"  >

                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                    <Columns>
                        <asp:TemplateField HeaderText="文件編號" SortExpression="DOC_SERIAL" meta:resourcekey="TemplateFieldResource9">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("DOC_SERIAL") %>' ID="TextBox1" meta:resourcekey="TextBox1Resource2"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <span style=" width: 80px;">
                                    <asp:Label runat="server" Text='<%# Bind("DOC_SERIAL") %>' ID="Label1" meta:resourcekey="Label1Resource2"></asp:Label>
                                </span>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Width="100px" Wrap="False" />
                            <ItemStyle Width="100px" Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="文件名稱" SortExpression="DOC_NAME" meta:resourcekey="TemplateFieldResource10">
                            <ItemTemplate>
                                <span style="word-break: break-all; width: 200px;">
                                    <table style="width:100%;" >
                                        <tr>
                                            <td style="min-width: 16px">
                                                <asp:Image ID="imgStar1" runat="server" ImageUrl="~/DMS/images/ratnull.gif" meta:resourcekey="imgStar1Resource2"></asp:Image>
                                                <asp:Image ID="docIcon" runat="server" ImageUrl="~/DMS/images/icon/unknown.gif" meta:resourcekey="docIconResource2"></asp:Image>&nbsp;
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lbtnDLFile" runat="server" OnClick="lbtnDLFile_Click" Text='<%# Bind("DOC_NAME") %>' meta:resourcekey="lbtnDLFileResource1"></asp:LinkButton>
                                                <asp:Label ID="lblDownloadNum" ToolTip= "觀看與下載次數" runat="server" ForeColor="Black" meta:resourcekey="lblDownloadNumResource1"></asp:Label>

                                            </td>
                                            <td  style="width:100%;">
                                                <table style="width:100%;">
                                                    <tr>
                                                        <td style="text-align:right;">
                                                            <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%#Eval("DOC_ID")+","+Eval("PUBLISH_MANUAL_VERSION") %>' Visible="false" runat="server" AlternateText="觀看文件" OnClick="imgPDFViewer_Click"/>
                                                            <asp:Image ID="imgNoPDFViewer" runat="server" Visible="false"></asp:Image>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </span>                                
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            <ItemStyle HorizontalAlign="Left" Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="作者" SortExpression="DOC_AUTHOR" meta:resourcekey="TemplateFieldResource11">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblAuthor" meta:resourcekey="lblAuthorResource2"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            <ItemStyle Wrap="False" Width="120px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="PUBLISH_MANUAL_VERSION" HeaderText="版本" SortExpression="PUBLISH_MANUAL_VERSION" meta:resourcekey="BoundFieldResource3">
                            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            <ItemStyle Width="45px" Wrap="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="操作" meta:resourcekey="TemplateFieldResource12">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="TextBox2" meta:resourcekey="TextBox2Resource2"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnInfo" Text="資訊" ForeColor="Blue" meta:resourcekey="lbtnInfoResource2"></asp:LinkButton>
                                &nbsp;
                            <asp:LinkButton runat="server" ID="lbtnSubscribe" Text="訂閱" ForeColor="Blue" meta:resourcekey="lbtnSubscribeResource2"></asp:LinkButton>
                                &nbsp;&nbsp;<asp:LinkButton runat="server" ID="lbtnAnalysis" Text="統計" ForeColor="Blue" meta:resourcekey="lbtnAnalysisResource2"></asp:LinkButton>
                                &nbsp;&nbsp;<asp:LinkButton runat="server" ID="lbtnScore" Text="評分" OnClick="lbtnScore_Click" ForeColor="Blue" meta:resourcekey="lbtnScoreResource2"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" Wrap="false" />
                            <ItemStyle Wrap="false" HorizontalAlign="Center" Width="200px" />
                        </asp:TemplateField>
                    </Columns>
                    <EnhancePagerSettings ShowHeaderPager="True" />
                </Fast:Grid>
                <Fast:Grid ID="gridSearchList" runat="server" AllowPaging="True" AllowSorting="True"
                    AutoGenerateCheckBoxColumn="False" AutoGenerateColumns="False"
                    DataKeyOnClientWithCheckBox="False" EnhancePager="True"
                    OnPageIndexChanging="dgSearchList_PageIndexChanging" OnRowDataBound="gridSearchList_RowDataBound"
                    PageSize="12" ShowHeader="False"  DefaultSortDirection="Ascending" EmptyDataText="沒有資料" KeepSelectedRows="False" meta:resourcekey="gridSearchListResource1"  >
                    <EnhancePagerSettings
                        ShowHeaderPager="True" />

                    <ExportExcelSettings AllowExportToExcel="False"></ExportExcelSettings>
                    <Columns>
                        <asp:TemplateField ShowHeader="False" meta:resourcekey="TemplateFieldResource13">
                            <ItemTemplate>
                                <table style="TABLE-LAYOUT: fixed; WIDTH: 795px;" class="NormalPopTable" cellspacing="0" bordercolordark="#ffffff" bgcolor="#cccccc" bordercolorlight="#666666" border="1">
                                    <tbody>
                                        <tr>
                                            <td style="WIDTH: 170px; BACKGROUND-COLOR: white; WORD-WRAP: break-word" height="156" rowspan="5" runat="server" id="tdDocName">
                                                <br />
                                                <asp:Label ID="lanNum" runat="server" Text="1" Font-Bold="True" meta:resourcekey="lanNumResource1"></asp:Label>
                                                <asp:Image ID="docIcon" runat="server" meta:resourcekey="docIconResource3"></asp:Image>&nbsp;
                                                <asp:LinkButton ID="LinkBtTitle" runat="server" Text='<%# Bind("DOC_NAME") %>' meta:resourcekey="LinkBtTitleResource1"></asp:LinkButton>&nbsp;
                                                <asp:ImageButton ID="imgPDFViewer" CommandName="PDFViewer" CommandArgument='<%#Eval("DOC_ID")+","+Eval("PUBLISH_MANUAL_VERSION") %>' Visible="false" runat="server" AlternateText="觀看文件" OnClick="imgPDFViewer_Click"/>
                                                <asp:Image ID="imgNoPDFViewer" runat="server" Visible="false"></asp:Image>
                                            </td>

                                            <td style="WIDTH: 120px" class="PopTableLeftTD" align="right">
                                                <asp:Label ID="Label5" runat="server" Text="文件版本" Font-Bold="True" ForeColor="Black" meta:resourcekey="Label5Resource1"></asp:Label>
                                            </td>
                                            <td style="WIDTH: 180px" class="PopTableRightTD">
                                                <asp:Image ID="imgVer" runat="server" meta:resourcekey="imgVerResource1"></asp:Image>
                                                <asp:Label ID="labVersion" runat="server" Text='<%# Bind("MANUAL_VERSION") %>' meta:resourcekey="labVersionResource1"></asp:Label></td>
                                            <td style="WIDTH: 120px" class="PopTableLeftTD" align="right">
                                                <asp:Label ID="Label9" runat="server" Text="文件作者" Font-Bold="True" ForeColor="Black" meta:resourcekey="Label9Resource2"></asp:Label>
                                            </td>
                                            <td style="WIDTH: 180px" class="PopTableRightTD">&nbsp;
                                            <asp:Label ID="labDocAuthor" runat="server" meta:resourcekey="labDocAuthorResource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="WIDTH: 120px" class="PopTableLeftTD" align="right">
                                                <asp:Label ID="Label7" runat="server" Text="文件大小" Font-Bold="True" ForeColor="Black" meta:resourcekey="Label7Resource1"></asp:Label>
                                            </td>
                                            <td style="WIDTH: 180px" class="PopTableRightTD">
                                                <asp:Label ID="labDocSize" runat="server" Text='<%# Bind("DOC_SIZE") %>' meta:resourcekey="labDocSizeResource1"></asp:Label></td>
                                            <td style="WIDTH: 120px" class="PopTableLeftTD" align="right">
                                                <asp:Label ID="lblPublishTime" runat="server" Text="公佈日" Font-Bold="True" ForeColor="Black" meta:resourcekey="Label8Resource1"></asp:Label>
                                            </td>
                                            <td style="WIDTH: 180px" class="PopTableRightTD">&nbsp;<asp:Label ID="labModifyTime" runat="server" meta:resourcekey="labModifyTimeResource1"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>                                           
                                            <td style="width: 120px" class="PopTableLeftTD" align="right" runat="server" id="tdClassTitleOriginal">
                                                <asp:Label ID="Label10" runat="server" meta:resourcekey="Label10Resource1" Text="文件類別" Font-Bold="True" ForeColor="Black"></asp:Label>
                                            </td>
                                            <td style="width: 180px" class="PopTableRightTD" runat="server" id="tdClassOrginal">&nbsp;<asp:Label ID="lblClassName" runat="server" Text='<%# Bind("CLASS_NAME") %>' meta:resourcekey="lblClassNameResource2"></asp:Label>
                                            </td>
                                             <td style="width: 120px" class="PopTableLeftTD" align="right" runat="server" id="tdDownloadTitle">
                                                <asp:Label ID="Label19" runat="server" meta:resourcekey="Label19Resource1" Text="下載次數" Font-Bold="True" ForeColor="Black"></asp:Label>
                                            </td>
                                            <td style="width: 180px" class="PopTableRightTD" runat="server" id="tdDownload">&nbsp;<asp:Label ID="lblDownloadNum" runat="server" Text='<%# Bind("DL_NUM") %>'></asp:Label>
                                            </td>
                                            <td style="width: 120px" class="PopTableLeftTD" align="right">
                                                <asp:Label ID="lblViewTitle" runat="server" meta:resourcekey="lblViewTitleResource1" Text="觀看次數" Font-Bold="True" ForeColor="Black"></asp:Label>
                                            </td>
                                            <td style="width: 180px" class="PopTableRightTD">
                                                &nbsp;<asp:Label ID="lblViewNum" runat="server" Text='<%# Bind("VIEW_NUM") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr runat="server" id="trDocClassRow">
                                            <td style="width: 120px" class="PopTableLeftTD" align="right">
                                                <asp:Label ID="lblDocClassTitle" runat="server" meta:resourcekey="lblDocClassTitleResource1" Text="文件類別" Font-Bold="True" ForeColor="Black"></asp:Label>
                                            </td>
                                            <td style="width: 180px" class="PopTableRightTD" colspan="3">&nbsp;<asp:Label ID="lblDocClassName" runat="server" Text='<%#: Bind("CLASS_NAME") %>' meta:resourcekey="lblClassNameResource2"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                              <td style="WIDTH: 120px" class="PopTableLeftTD" align="right">
                                                <asp:Label ID="Label6" runat="server" Text="文件路徑" Font-Bold="True" ForeColor="Black" meta:resourcekey="Label6Resource1"></asp:Label>
                                            </td>
                                            <td colSpan="3" class="PopTableRightTD">
                                                <img src="../images/closed.gif" />
                                                <asp:Label ID="labFolderPath" runat="server" Visible="False" meta:resourcekey="labFolderPathResource1"></asp:Label>
                                                <asp:HyperLink ID="hyLinkFolderPath" runat="server" meta:resourcekey="hyLinkFolderPathResource1"></asp:HyperLink>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="HEIGHT: 70px" class="PopTableRightTD" colspan="4">
                                                <asp:Label ID="labSample" runat="server" Text='<%# Bind("SAMPLE_TEXT") %>' meta:resourcekey="labSampleResource1"></asp:Label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </Fast:Grid>
            </td>
        </tr>
    </table>
    <div class="contextMenu" id="contextRoleView" style="display: none; left: 870px; top: 69px;">
        <table cellspacing="0" cellpadding="0" border="0">
            <tbody>
                <tr>
                    <td align="center" style="background-color: darkolivegreen" valign="top">
                        <nobr><SPAN style="COLOR: #ffffff"><asp:Label id="Label4" runat="server" Text="功能表" meta:resourcekey="Label4Resource1" ></asp:Label></SPAN></nobr>
                    </td>
                </tr>
                <tr id="CommonuseTR" style="display: none;">
                    <td class="menuItem" valign="top" style="background-color: #ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="Commonuse">&nbsp;</td>
                                <td nowrap>&nbsp;
                                <asp:Label ID="lblCommonuse" runat="server" Text="加入常用文件" ForeColor="Gray" meta:resourcekey="lblCommonuseResource1"></asp:Label>
                                    <asp:HyperLink ID="hyCommonuse" runat="server" NavigateUrl="#" Text="加入常用文件" onclick="OpenWin(this, 1);return;" meta:resourcekey="hyCommonuseResource1"></asp:HyperLink></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="FavoritesTR" style="display: none;">
                    <td class="menuItem" valign="top" style="background-color: #ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="Favorites">&nbsp;</td>
                                <td nowrap>&nbsp;
                                <asp:Label ID="lblFavorites" runat="server" Text="加入收藏" ForeColor="Gray" meta:resourcekey="lblFavoritesResource1"></asp:Label>
                                    <asp:HyperLink ID="hyFavorites" runat="server" NavigateUrl="#" Text="加入收藏" onclick="OpenWin(this, 2);" meta:resourcekey="hyFavoritesResource1"></asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="SubscribeTR" style="display: none;">
                    <td class="menuItem" valign="top" style="background-color: #ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="Subscribe">&nbsp;</td>
                                <td nowrap>&nbsp;
                                <asp:Label ID="lblSubscribe" runat="server" Text="訂閱" ForeColor="Gray" meta:resourcekey="lblSubscribeResource1"></asp:Label>
                                    <asp:HyperLink ID="hySubscribe" runat="server" NavigateUrl="#" Text="訂閱" onclick="OpenWin(this, 3);" meta:resourcekey="hySubscribeResource1"></asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="AnalysisTR" style="display: none;">
                    <td class="menuItem" valign="top" style="background-color: #ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="Analysis">&nbsp;</td>
                                <td nowrap>&nbsp;
                                <asp:Label ID="lblAnalysis" runat="server" Text="統計" ForeColor="Gray" meta:resourcekey="lblAnalysisResource1"></asp:Label>
                                    <asp:HyperLink ID="hyAnalysis" runat="server" NavigateUrl="#" Text="統計" onclick="OpenWin(this, 4);return;" meta:resourcekey="hyAnalysisResource1"></asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr id="ScoreTR" style="display: none;">
                    <td class="menuItem" valign="top" style="background-color: #ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="Score">&nbsp;</td>
                                <td nowrap>&nbsp;
                                <asp:Label ID="lblScore" runat="server" Text="評分" ForeColor="Gray" meta:resourcekey="lblScoreResource1"></asp:Label>
                                    <asp:LinkButton ID="hyScore" OnClientClick="OpenWin(this, 5);return false;" Text="評分" runat="server" OnClick="hyScore_Click" meta:resourcekey="hyScoreResource1"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="RemoteUploadTR" style="display: none;">
                    <td class="menuItem" valign="top" style="background-color: #ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="RemoteUpload">&nbsp;</td>
                                <td nowrap>&nbsp;
                                <asp:Label ID="lblRemoteUpload" runat="server" Text="異地發佈" ForeColor="Gray" meta:resourcekey="lblRemoteUploadResource1"></asp:Label>
                                    <asp:HyperLink ID="hyRemoteUpload" runat="server" NavigateUrl="#" Text="異地發佈" onclick="OpenWin(this, 6);" meta:resourcekey="hyRemoteUploadResource1"></asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="PrintRecordTR" style="display: none;">
                    <td class="menuItem" valign="top" style="background-color: #ececec">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="3" runat="server" id="PrintRecord">&nbsp;</td>
                                <td nowrap>&nbsp;
                                    <asp:HyperLink ID="hyPrintRecord" runat="server" NavigateUrl="#" Text="紙本分發管制" onclick="OpenWin(this, 7);" meta:resourcekey="hyPrintRecordResource1"></asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
        </table>
    </div>
</div>
<asp:HiddenField ID="hideGroupid" runat="server" />
<asp:HiddenField ID="Hidden1" runat="server" />
<asp:HiddenField ID="Hidden2" runat="server" />
<asp:HiddenField ID="hidDocID" runat="server" />
<asp:HiddenField ID="hidFolderID" runat="server" />    
<asp:HiddenField ID="hidManualVer" runat="server" />
<asp:HiddenField ID="hidFileID" runat="server" />        
<span style="display: none">
    <asp:Label ID="lblCheckin" runat="server" Text="已存回" Visible="False" meta:resourcekey="lblCheckinResource1"></asp:Label>
    <asp:Label ID="lblCheckOut" runat="server" Text="已取出" Visible="False" meta:resourcekey="lblCheckOutResource1"></asp:Label>
    <asp:Label ID="lblApproval" runat="server" Text="審核中" Visible="False" meta:resourcekey="lblApprovalResource1"></asp:Label>
    <asp:Label ID="lblPublish" runat="server" Text="已公佈" Visible="False" meta:resourcekey="lblPublishResource1"></asp:Label>
    <asp:Label ID="lblInactive" runat="server" Text="已失效" Visible="False" meta:resourcekey="lblInactiveResource1"></asp:Label>
    <asp:Label ID="lblVoid" runat="server" Text="已作廢" Visible="False" meta:resourcekey="lblVoidResource1"></asp:Label>
    <asp:Label ID="lblTempInact" runat="server" Text="已下架" Visible="False" meta:resourcekey="lblTempInactResource1"></asp:Label>
    <asp:Label ID="lblOldVer" runat="server" Text="舊版本" Visible="False" meta:resourcekey="lblOldVerResource1"></asp:Label>
    <asp:Label ID="lblReAct" runat="server" Text="已上架" Visible="False" meta:resourcekey="lblReActResource1"></asp:Label>
    <asp:Label ID="labDocDeny" runat="server" Text="發佈拒絕" Visible="False" meta:resourcekey="labDocDenyResource1"></asp:Label>
    <asp:Label ID="lblVioding" runat="server" Text="(作廢審核中)" Visible="False" meta:resourcekey="lblViodingResource1"></asp:Label>
    <asp:Label ID="lblDeleting" runat="server" Text="(銷毀審核中)" Visible="False" meta:resourcekey="lblDeletingResource1" ></asp:Label>
    <asp:Label ID="lblUpdating" runat="server" Text="改版中" Visible="False" meta:resourcekey="lblUpdatingResource1"></asp:Label>
    <asp:HiddenField ID="hdAppPath" runat="server" />
    <asp:Label ID="lblConfirmAddUse" runat="server" Text="確定要加入常用文件?" Visible="False" meta:resourcekey="lblConfirmAddUseResource1"></asp:Label>
    <asp:Label ID="lblAddUseError" runat="server" Text="加入常用文件時發生錯誤" Visible="False" meta:resourcekey="lblAddUseErrorResource1"></asp:Label>
    <asp:HiddenField ID="hideDatasource" runat="server" />
    <asp:Label ID="labNoActive" runat="server" Text="未生效" Visible="False" meta:resourcekey="labNoActiveResource1"></asp:Label>
    <asp:Label ID="labDocStore" runat="server" Text="文件庫" Visible="False" meta:resourcekey="labDocStoreResource1"></asp:Label>
    <asp:Label ID="labDocClass" runat="server" Text="文件類別" Visible="False" meta:resourcekey="labDocClassResource1"></asp:Label>
    <asp:Label ID="lblActive" runat="server" Text="立即生效" Visible="False" meta:resourcekey="lblActiveResource1"></asp:Label>
    <asp:Label ID="lblNeverOverdue" runat="server" Text="永不過期" Visible="False" meta:resourcekey="lblNeverOverdueResource1"></asp:Label>
    <asp:HiddenField ID="FASTReturnValue" runat="server" Value="[DefaultNullValue]" />
    <asp:Label ID="lblFolderDel" runat="server" Text="目錄已被刪除" Visible="False" meta:resourcekey="lblFolderDelResource1"></asp:Label>
    <asp:Label ID="lblClassDel" runat="server" Text="類別已被刪除" Visible="False" meta:resourcekey="lblClassDelResource1"></asp:Label>
    <asp:Label ID="lblSuccessAdd" runat="server" Text="已成功加入我的收藏。" Visible="False" meta:resourcekey="lblSuccessAddResource1"></asp:Label>
    <asp:Label ID="lblConfirmAdd" runat="server" Text="確定要加入收藏嗎?" Visible="False" meta:resourcekey="lblConfirmAddResource1"></asp:Label>
    <!--2012-5-23 ELTON, 因檔案仍在Proxy尚未傳輸到UOF, 需顯示警告訊息-->
    <asp:Label ID="lblFileNotTransferToUof" runat="server" Text="目前檔案仍在Proxy伺服器，正由系統進行傳輸中，請稍後！" Visible="False" ForeColor="Blue" meta:resourcekey="lblFileNotTransferToUofResource1"></asp:Label>
    <asp:Label ID="lblCommonList" runat="server" Text="常用文件" Visible="False" meta:resourcekey="lblCommonListResource1"></asp:Label>
    <asp:Label ID="lblConfirmDeleteCommonList" runat="server" Text="確定要取消常用文件嗎?" Visible="False" meta:resourcekey="lblConfirmDeleteCommonListResource1"></asp:Label>
    <asp:Label ID="lblSearch" runat="server" Text="全文檢索" Visible="False" meta:resourcekey="lblSearchResource1"></asp:Label>
    <asp:Label ID="lblDocStatus" runat="server" Text="文件狀態：" Visible="False" meta:resourcekey="lblDocStatusResource1"></asp:Label>
    <asp:Label ID="lblDraft" runat="server" Text="草稿" Visible="False" meta:resourcekey="lblDraftResource1"></asp:Label>
    <asp:Label ID="labFileError" runat="server" ForeColor="Blue" Text="發生錯誤，檔案不存在！" Visible="False" meta:resourcekey="labFileErrorResource1"></asp:Label>
    <asp:Label ID="labAlert" runat="server" ForeColor="Blue" Text="正在進行檔案轉換，請稍後再觀看" Visible="False" meta:resourcekey="labAlertResource1"></asp:Label>
    <asp:Label ID="labPDFConvertERROR" runat="server" ForeColor="Blue" Text="發生錯誤，轉換失敗！" Visible="False" meta:resourcekey="labPDFConvertERRORResource1"></asp:Label>
    <asp:Label ID="lblNotsupportDoc" runat="server" Text="目錄設定為必須轉檔，但此檔案類型並不支援" ForeColor="Blue" Visible="False" meta:resourcekey="lblNotsupportDocResource1"></asp:Label>
    <asp:Label ID="lblProtectMsg" runat="server" Text="此為保全文件無法線上觀看" ForeColor="Blue" Visible="False" meta:resourcekey="lblProtectMsgResource1"></asp:Label>
    <asp:HiddenField ID="hfOldFolderID" runat="server" />
    <asp:HiddenField ID="hfIsSearchFolder" runat="server" />
    <asp:HiddenField ID="hfKeyWord" runat="server" />
    <asp:HiddenField ID="hfCurrentUser" runat="server" />
    <asp:HiddenField ID="hfTmpFolderId" runat="server" />
    <asp:HiddenField ID="hfTmpIsEnablePDFViewer" runat="server" />
    <asp:Label ID="lblFilePageOutLimitMsg" runat="server" Text="檔案頁數{0}頁，超過可轉檔上限。" Visible="false" meta:resourcekey="lblFilePageOutLimitMsgResource1"></asp:Label>
    <asp:Label ID="lblFileHasPassword" runat="server" Text="原始檔案有設定密碼，無法轉檔" Visible="false" meta:resourcekey="lblFileHasPasswordResource1"></asp:Label>
    <asp:Label ID="lblDocSerial" runat="server" Text="文件編號：" Visible="false" meta:resourcekey="lblDocSerialResource1"></asp:Label>
    <asp:Label ID="lblManualVersion" runat="server" Text="版本：" Visible="false" meta:resourcekey="lblManualVersionResource1"></asp:Label>
    <asp:Label ID="lblPrintUser" runat="server" Text="列印者：" Visible="false" meta:resourcekey="lblPrintUserResource1"></asp:Label>

    <a id="atag" style="display:none;">Run UDoc Viewer</a>

</span>
<script type="text/javascript">

    function ConfirmAdd(docID) {
        if (window.confirm('<%=lblConfirmAddUse.Text %>')) {
            var ajaxManager = $find("<%= Manager.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "AddCommonUse", "Value": docID }));
        }
    }

    //2012-5-24 ELTON, add for download file by [FileCenterV2 FileControlHandler]
    function DownloadFileWithHandler(sHandlerUrl, sUserProxyIndex) {
        $uof.download(sHandlerUrl, sUserProxyIndex);
    }


    //2012/03/19 顯示方式：文件列表 add by Taylor
    function ConfirmAddFavorites(docID) {
        if (window.confirm('<%=lblConfirmAdd.Text  %>')) {
            var ajaxManager = $find("<%= Manager.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "AddFavorites", "Value": docID }));
        }
    }

    //2012/03/19 顯示方式：詳細資料 add by Taylor
    function ConfirmAddDetailFavorites(docID) {
        if (window.confirm('<%=lblConfirmAdd.Text  %>')) {
            var ajaxManager = $find("<%= Manager.ClientID %>");
            ajaxManager.ajaxRequest(JSON.stringify({ "Key": "AddFavorites", "Value": docID }));
        }
    }

    function RadFolderToolbar1_Click(sender, args) {
        //Add code to handle your event here.
        var toolBar = sender;
        var button = args.get_item();
        if (button.get_value() == "Delete") {
            if (confirm('<%=lblConfirmDeleteCommonList.Text %>') == false)
                args.set_cancel(true);
        }
    }

    function OpenWin(sender, item) {
        var docID = $("#<%=hidDocID.ClientID%>").val();
        var folderID = $("#<%=hidFolderID.ClientID%>").val();
        var manualVer = $("#<%= hidManualVer.ClientID%>").val();
        var fileID = $("#<%= hidFileID.ClientID%>").val();

        switch(item)
        {
            case 1:
                if (window.confirm('<%=lblConfirmAddUse.Text %>')) {
                    var ajaxManager = $find("<%= Manager.ClientID %>");
                    ajaxManager.ajaxRequest(JSON.stringify({ "Key": "AddCommonUse", "Value": docID }));
                }
                break;
            case 2:
                if (window.confirm('<%=lblConfirmAdd.Text  %>')) {
                    var ajaxManager = $find("<%= Manager.ClientID %>");
                     ajaxManager.ajaxRequest(JSON.stringify({ "Key": "AddFavorites", "Value": docID }));
                 }
                break;
            case 3:
                $uof.dialog.open2("~/DMS/DocStore/SubscribeDoc.aspx", '', '', 400, 350, function () { return false; }, { 'docid': docID, 'folderid': folderID });
                break;
            case 4:
                $uof.dialog.open2("~/DMS/DocStore/DocStatistics.aspx", '', '', 650, 770, function () { return false; }, { 'docid': docID });
                break;
            case 5:
                $uof.dialog.open2("~/DMS/DocStore/DocGrade.aspx", sender, '', 550, 600, function (returnValue) { if (returnValue != null || typeof (returnValue) != 'undefined') { return true; } return false; }, { 'docid': docID });
                break;
            case 6:
                $uof.dialog.open2("~/DMS/DocStore/RemoteUpload.aspx", '', '', 600, 750, function () { return false; }, { 'docid': docID });
                break;
            case 7:
                $uof.dialog.open2("~/DMS/DocStore/DocPrintRecord.aspx", '', '', 1000, 750, function () { return false; }, { 'docid': docID, 'folderid': folderID, 'manualversion': manualVer, 'fileid': fileID });
                break;
    }
        //return false;
    }

    function OpenPDFViewerWithFileCenterV2(sJson) {
        var h = $uof.tool.printScreenSize('h', screen.availHeight);
        var w = $uof.tool.printScreenSize('w', screen.availWidth);
        $uof.window.open("PdfViewerSL.aspx?p=" + encodeURIComponent(sJson), w, h);
    }

    //15.0 UDocViewer
    function OpenUDocViewer(sJson, docid, docversion, status, viewtype) {
        var data = [$uof.tool.htmlDecode(docid), $uof.tool.htmlDecode(docversion), $uof.tool.htmlDecode(status), $uof.tool.htmlDecode(viewtype)];
        $uof.pageMethod.syncUc("DMS/DocStore/UC_DMSDoc.ascx", "StatisticsViewCountAddViewType", data);
        $uof.uDocViewer.open(sJson);
    }

    function OnEnterPress(event) {    
        if (event.keyCode == 13) {
            $("#<%=btnSearch.ClientID%>").click();
        }
    }
</script>
