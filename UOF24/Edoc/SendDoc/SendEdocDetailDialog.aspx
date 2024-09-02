<%@ Page Title="" Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" CodeBehind="SendEdocDetailDialog.aspx.cs" Inherits="Ede.Uof.Web.Edoc.SendDoc.SendEdocDetailDialog" %>

<%@ Register Assembly="Ede.Uof.Utility.Component.Grid" Namespace="Ede.Uof.Utility.Component" TagPrefix="Ede" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .cssHidden{
            display:none;
        }
    </style>

    <script type="text/javascript">

        Sys.Application.add_load(function () {

            switch ($("#<%=hfLinkPage.ClientID %>").val()) {
                case 'PersonalEdoc.aspx':
                    $('.PersonalEdoc').css('display', '');
                    $('.SendEdoc').css('display', 'none');
                    break;

                case 'SendEdoc.aspx':
                    $('.SendEdoc').css('display', '');
                    $('.PersonalEdoc').css('display', 'none');
                    break;
            }
        });
    </script>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <table class="PopTable">
                <%-- 申請者(我的公文頁) + 表單編號 + 公文檔製作 --%>
                <tr>
                    <td class="PersonalEdoc" style="white-space:nowrap;display:none;">
                        <asp:Label ID="lblApplicantTitle" runat="server" Text="申請者"></asp:Label>
                    </td>
                    <td class="PersonalEdoc" style="display:none;">
                        <asp:Label ID="lblApplicant" runat="server"></asp:Label>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:Label ID="Label3" runat="server" Text="表單編號"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblDocNbr" runat="server"></asp:Label>
                        <asp:LinkButton ID="lbtnDocNbr" runat="server" Visible="false"></asp:LinkButton>
                    </td>
                    <td class="SendEdoc" style="white-space:nowrap;display:none;">
                        <asp:Label ID="Label1" runat="server" Text="公文檔製作"></asp:Label>
                    </td>
                    <td class="SendEdoc" style="display:none;">
                        <asp:Label ID="lblBuildStatusName" runat="server" ></asp:Label>
                        <asp:LinkButton ID="lbtnBuildStatusName" Visible="false" runat="server" ></asp:LinkButton>
                    </td>
                </tr>
                <%-- 發文機關代碼 + 發文機關 --%>
                <tr>
                    <td style="white-space:nowrap">
                        <asp:Label ID="Label5" runat="server" Text="發文機關代碼"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblFromUnitId" runat="server" ></asp:Label>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:Label ID="Label7" runat="server" Text="發文機關"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblFromUnitName" runat="server" ></asp:Label>
                    </td>
                </tr>
                <%-- 公文類型 + 發文日期 --%>
                <tr>
                    <td style="white-space:nowrap">
                        <asp:Label ID="Label13" runat="server" Text="公文類型"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblDocType" runat="server" ></asp:Label>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:Label ID="Label15" runat="server" Text="發文日期"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSendDate" runat="server" ></asp:Label>
                    </td>
                </tr>
                <%-- 速別 + 密等 --%>
                <tr>
                    <td style="white-space:nowrap">
                        <asp:Label ID="Label17" runat="server" Text="速別"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSpeedType" runat="server" ></asp:Label>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:Label ID="Label19" runat="server" Text="密等"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblSecretType" runat="server" ></asp:Label>
                    </td>
                </tr>
                <%-- 發文字號 --%>
                <tr>
                    <td style="white-space:nowrap">
                        <asp:Label ID="Label21" runat="server" Text="發文字號"></asp:Label>
                    </td>
                    <td colspan="3">
                        <asp:Label ID="lblNumberString" runat="server" ></asp:Label>
                    </td>
                </tr>
                <%-- 發文的函之特有屬性 - 主旨 --%>
                <asp:Panel ID="pnlLetterTr" runat="server">
                    <tr>
                        <td style="white-space:nowrap">
                            <asp:Label ID="Label23" runat="server" Text="主旨"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="lblSubject" runat="server" ></asp:Label>
                        </td>
                    </tr>
                </asp:Panel>
                <%-- 發文的開會通知單之特有屬性 - 開會事由 + 開會時間 + 開會地點 + 主持人 --%>
                <asp:Panel ID="pnlMeetingNoticeTr" runat="server">
                    <%-- 開會事由 --%>
                    <tr>
                        <td style="white-space:nowrap">
                            <asp:Label ID="Label2" runat="server" Text="開會事由"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="lblMnSubject" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <%-- 開會時間 --%>
                    <tr>
                        <td style="white-space:nowrap">
                            <asp:Label ID="Label6" runat="server" Text="開會時間"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="lblMnTime" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <%-- 開會地點 --%>
                    <tr>
                        <td style="white-space:nowrap">
                            <asp:Label ID="Label27" runat="server" Text="開會地點"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="lblMnLocation" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <%-- 主持人 --%>
                    <tr>
                        <td style="white-space:nowrap">
                            <asp:Label ID="Label29" runat="server" Text="主持人"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="lblMnHost" runat="server" ></asp:Label>
                        </td>
                    </tr>
                </asp:Panel>
                <%-- 發文的會勘通知單之特有屬性 - 會勘事由 + 會勘時間 + 會勘地點 + 主持人 --%>
                <asp:Panel ID="pnlSiteMeetingNoticeTr" runat="server">
                    <tr>
                        <td style="white-space:nowrap">
                            <asp:Label ID="Label8" runat="server" Text="會勘事由"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="lblSmnSubject" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space:nowrap">
                            <asp:Label ID="Label12" runat="server" Text="會勘時間"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="lblSmnTime" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space:nowrap">
                            <asp:Label ID="Label16" runat="server" Text="會勘地點"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="lblSmnLocation" runat="server" ></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space:nowrap">
                            <asp:Label ID="Label20" runat="server" Text="主持人"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="lblSmnHost" runat="server" ></asp:Label>
                        </td>
                    </tr>
                </asp:Panel>
                <%-- 產生公文檔時間 + 公文檔狀態 --%>
                <tr>
                    <td class="SendEdoc" style="white-space:nowrap;display:none;">
                        <asp:Label ID="Label9" runat="server" Text="產生公文檔時間"></asp:Label>
                    </td>
                    <td class="SendEdoc" colspan="3" style="display:none;">
                        <asp:Label ID="lblModifyInfo" runat="server"></asp:Label>
                    </td>
                    <td class="PersonalEdoc" style="white-space:nowrap;display:none;">
                        <asp:Label ID="Label10" runat="server" Text="公文檔狀態"></asp:Label>
                    </td>
                    <td class="PersonalEdoc" colspan="3" style="display:none;">
                        <asp:Label ID="lblBuildStatusNameForPersonalEdoc" runat="server" ></asp:Label>
                    </td>
                </tr>
            </table>
                        
            <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="rmpSendDetail" SelectedIndex="0" OnTabClick="RadTabStrip1_TabClick" >
                <Tabs>
                    <telerik:RadTab PageViewID="pvToUnitName" runat="server" Text="受文機關" Value="ToUnitNameTab" Selected="True" >
                    </telerik:RadTab>
                    <telerik:RadTab PageViewID="pvAttachmentList" runat="server" Text="附件清單" Value="AttachmentListTab" >
                    </telerik:RadTab>
                    <telerik:RadTab PageViewID="pvEdocSendFileZip" runat="server" Text="電子交換檔案" Value="EdocSendFileZipTab" >
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>

            <telerik:RadMultiPage ID="rmpSendDetail" runat="server" SelectedIndex="0" >
                <%-- 受文機關 --%>
                <telerik:RadPageView ID="rpvToUnitName" Selected="True" runat="server" >

                    <Ede:Grid ID="grdToUnitName" runat="server" Width="100%" DataKeyNames="SEND_TO_ID"
                                EmptyDataText="沒有資料" AutoGenerateColumns="false" AutoGenerateCheckBoxColumn="false"
                                OnRowDataBound="grdToUnitName_RowDataBound" AllowSorting="false">
                        <HeaderStyle Wrap="false" />
                        <Columns>
                            <asp:BoundField DataField="SEND_TO_ID" HeaderText="受文代碼hidden" >
                                <HeaderStyle CssClass="cssHidden" />
                                <ItemStyle CssClass="cssHidden" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="類別" SortExpression="TO_TYPE" >
                                <ItemTemplate>
                                    <asp:Label ID="lblToType" runat="server" ></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Wrap="False" />
                            </asp:TemplateField>
                                   
                            <asp:TemplateField HeaderText="機關代碼" SortExpression="TO_UNIT_ID">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnOrgId" runat="server"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle HorizontalAlign="Left" Wrap="false"/>
                            </asp:TemplateField>

                            <asp:BoundField DataField="TO_UNIT_NAME" HeaderText="機關名稱" SortExpression="TO_UNIT_NAME" >
                                <ItemStyle HorizontalAlign="Left" Wrap="False" />
                            </asp:BoundField>

                            <asp:BoundField DataField="TO_UNIT_ALIAS" HeaderText="受文者名稱" SortExpression="TO_UNIT_ALIAS" >
                                <ItemStyle HorizontalAlign="Left" Wrap="False" />
                            </asp:BoundField>
                                                    
                            <asp:TemplateField>
                                <ItemStyle HorizontalAlign="Center" Wrap="true" />
                                <HeaderTemplate>
                                    <asp:Label ID="attachment" Text="附件" runat="server"></asp:Label>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbAttachment" Enabled="false" runat="server" ></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="發文方式" >
                                <ItemTemplate>
                                    <asp:Label ID="lblSendType" runat="server" ></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Wrap="False" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="公文PDF">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnSinglePdfDownload" Text="下載" OnClick="lbtnSinglePdfDownload_Click" runat="server"></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Wrap="False" />
                            </asp:TemplateField>

                        </Columns>
                    </Ede:Grid>
                </telerik:RadPageView>

                <%-- 附件清單 --%>
                <telerik:RadPageView ID="rpvAttachmentList" runat ="server">
                    <Ede:Grid ID="grdAttachmentList" runat="server" Width="100%" DataKeyNames="FILE_ID"
                                EmptyDataText="沒有資料" AutoGenerateColumns="false" AutoGenerateCheckBoxColumn="false"
                                OnRowDataBound="grdAttachmentList_RowDataBound">
                        <HeaderStyle Wrap="false" />
                        <Columns>
                            <asp:BoundField DataField="FILE_ID" HeaderText="FILEIDHIDDEN" ItemStyle-CssClass="cssHidden" HeaderStyle-CssClass="cssHidden"/>
                            
                            <asp:TemplateField HeaderText="附件">
                                <ItemTemplate>
                                    <asp:Image ID="imgType" runat="server" />
                                    <asp:LinkButton ID="lbtnAttachmentList" OnClick="lbtnAttachmentList_Click" runat="server"></asp:LinkButton>
                                    <asp:Label ID="Label2" runat="server" Text="("></asp:Label>
                                    <asp:Label ID="lblFileSize" Text='<%#:Eval("FILE_SIZE")%>' runat="server"></asp:Label>
                                    <asp:Label ID="Label4" runat="server" Text=")"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </Ede:Grid>
                </telerik:RadPageView>

                <%-- 電子交換檔案 --%>
                <telerik:RadPageView ID="rpvEdocSendFileZip" runat="server">
                    <Ede:Grid ID="grdEdocSendFileZip" runat="server" Width="100%" DataKeyNames="FILE_ID"
                                EmptyDataText="沒有資料" AutoGenerateColumns="false" AutoGenerateCheckBoxColumn="false"
                                OnRowDataBound="grdEdocSendFileZip_RowDataBound">
                        <HeaderStyle Wrap="false" />
                        <Columns>
                            <asp:BoundField DataField="FILE_ID" HeaderText="FILEIDHIDDEN" ItemStyle-CssClass="cssHidden" HeaderStyle-CssClass="cssHidden"/>
                            
                            <asp:TemplateField HeaderText="附件">
                                <ItemTemplate>
                                    <asp:Image ID="imgType" runat="server" />
                                    <asp:LinkButton ID="lbtnEdocSendFileZip" OnClick="lbtnEdocSendFileZip_Click" runat="server"></asp:LinkButton>
                                    <asp:Label ID="Label2" runat="server" Text="("></asp:Label>
                                    <asp:Label ID="lblFileSize" Text='<%#:Eval("FILE_SIZE")%>' runat="server"></asp:Label>
                                    <asp:Label ID="Label4" runat="server" Text=")"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </Ede:Grid>
                </telerik:RadPageView>

            </telerik:RadMultiPage>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Label ID="lblEdocContent" runat="server" Text="公文內容" Visible="false"></asp:Label>
    <asp:Label ID="lblView" runat="server" Text="觀看" Visible="False"></asp:Label>
    <asp:Label ID="lblCloseWindow" runat="server" Text="關閉視窗" Visible="False"></asp:Label>

    <asp:Label ID="lblSendTypeIsMail" runat="server" Text="郵寄" Visible="False"></asp:Label>
    <asp:Label ID="lblSendTypeIsExchange" runat="server" Text="電子交換" Visible="False"></asp:Label>

    <%-- BuildStatus中文字串 --%>
    <asp:Label ID="lblBuildStatus" runat="server" Text="製作狀態" Visible="False" ></asp:Label>
    <asp:Label ID="lblNone" runat="server" Text="尚未產生" Visible="False" ></asp:Label>
    <asp:Label ID="lblProcessing" runat="server" Text="處理中" Visible="False" ></asp:Label>
    <asp:Label ID="lblSuccess" runat="server" Text="成功" Visible="False" ></asp:Label>
    <asp:Label ID="lblFailed" runat="server" Text="失敗" Visible="False" ></asp:Label>

    <!-- BuildStatusForPersonalEdoc中文字串 -->
    <asp:Label ID="lblNotSuccess" runat="server" Text="未產生" Visible="False" ></asp:Label>
    <asp:Label ID="lblDone" runat="server" Text="已產生" Visible="False" ></asp:Label>

    <asp:HiddenField ID="hfSendDocId" runat="server" />
    <asp:HiddenField ID="hfAttachFileGroupId" runat="server" />
    <asp:HiddenField ID="hfSendZipFileGroupId" runat="server" />
    <asp:HiddenField ID="hfBuildSucess" runat="server" />
    <asp:HiddenField ID="hfLinkPage" runat="server" />

</asp:Content>