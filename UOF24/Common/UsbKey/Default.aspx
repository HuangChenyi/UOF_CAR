<%@ Page Language="C#" MasterPageFile="~/Master/DialogMasterPage.master" AutoEventWireup="true" Inherits="Common_UsbKey_Default" Title="驅動程式安裝說明" Theme="DefaultTheme" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" Codebehind="Default.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <script type="text/javascript">
<!--

    function Button1_Click(oButton, oEvent) {
        //Add code to handle your event here.
        location.href = "EBUsbKeyDriver.exe";
    }
    function Button2_Click(oButton, oEvent) {
        //Add code to handle your event here.
        location.href = "MicroDog_Driver_4.0.16.3.zip";
    }
    // -->
    </script>
    <br />
    <center>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label18" runat="server" Text="Step1." meta:resourcekey="Label18Resource1"></asp:Label>
                    <telerik:RadButton ID="RadButton1" runat="server" Text="下載驅動程式" meta:resourcekey="lblInstallLinkResource1" AutoPostBack="False" OnClientClicking="Button1_Click">
                    </telerik:RadButton>
                    <asp:Label ID="Label13" runat="server" Text="(不支援Vista 64bits)" meta:resourcekey="Label13Resource1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding-top:2px">
                    <asp:Label ID="Label17" runat="server" Text="Step2." meta:resourcekey="Label17Resource1"></asp:Label>
                    <telerik:RadButton ID="RadButton2" runat="server" Text="下載MicroDog驅動程式" AutoPostBack="False" OnClientClicking="Button2_Click" meta:resourcekey="RadButton2Resource1">
                    </telerik:RadButton>
                </td>
            </tr>
        </table>
    </center>
    <p />
    <asp:Label ID="Label1" runat="server" Text="1. 下載驅動程式後執行，並選擇安裝過程中畫面所顯示的語言。" meta:resourcekey="Label1Resource1"></asp:Label>
    <asp:Label ID="Label5" runat="server" ForeColor="Red" Font-Size="Larger" Text="安裝前請先不要插入USB Key" meta:resourcekey="Label5Resource1"></asp:Label><br />
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Common/UsbKey/InstallGuide/zh-TW/01.jpg" meta:resourcekey="Image1Resource1" />
    <br />
    <asp:Label ID="Label2" runat="server" Text="2. 進入歡迎畫面，點選下一步。" meta:resourcekey="Label2Resource1"></asp:Label><br />
    <asp:Image ID="Image2" runat="server" ImageUrl="~/Common/UsbKey/InstallGuide/zh-TW/02.jpg" meta:resourcekey="Image2Resource1" /><br />
    <asp:Label ID="Label3" runat="server" Text="3. 系統開始安裝" meta:resourcekey="Label3Resource1"></asp:Label><br />
    <asp:Image ID="Image3" runat="server" ImageUrl="~/Common/UsbKey/InstallGuide/zh-TW/03.jpg" meta:resourcekey="Image3Resource1" />
    <br />
    <asp:Label ID="Label6" runat="server" Text="64bit電腦將會出現以下安裝畫面：" ForeColor="Red" meta:resourcekey="Label6Resource1"></asp:Label><br />
    <br />
    <asp:Image ID="Image5" runat="server" ImageUrl="~/Common/UsbKey/InstallGuide/64bit/01.jpg" meta:resourcekey="Image5Resource1" />
    <br />
    <asp:Label ID="Label14" runat="server" Text="當電腦沒有Parallel Port或是它被關閉時，將出現下面畫面，點選「確定」將它關閉即可。" meta:resourcekey="Label14Resource1"></asp:Label><br />
    <asp:Image ID="Image6" runat="server" ImageUrl="~/Common/UsbKey/InstallGuide/64bit/02.jpg" meta:resourcekey="Image6Resource1" /><br />
    <asp:Label ID="Label15" runat="server" Text="64bit的驅動程式安裝完成" meta:resourcekey="Label15Resource1"></asp:Label><br />
    <asp:Image ID="Image7" runat="server" ImageUrl="~/Common/UsbKey/InstallGuide/64bit/03.jpg" meta:resourcekey="Image7Resource1" /><br />
    <asp:Label ID="Label4" runat="server" Text="4. 驅動程式安裝完成，您已經可以開始使用USB Key。" meta:resourcekey="Label4Resource1"></asp:Label><br />
    <asp:Image ID="Image4" runat="server" ImageUrl="~/Common/UsbKey/InstallGuide/zh-TW/04.jpg" meta:resourcekey="Image4Resource1" /><br />
    <br />
        <asp:Label ID="Label23" runat="server" Text="5. 安裝完EBUsbKeyDriver，下載MicroDog驅動程式，並解壓縮後執行。" meta:resourcekey="Label23Resource1" ></asp:Label><br />
    <asp:Image ID="Image13" runat="server" ImageUrl="~/Common/UsbKey/InstallGuide/windows7/01.jpg" meta:resourcekey="Image13Resource1" /><br />
    <asp:Label ID="Label19" runat="server" Text="執行後，點選Install Driver。" meta:resourcekey="Label19Resource1"></asp:Label><br />
    <asp:Image ID="Image14" runat="server" ImageUrl="~/Common/UsbKey/InstallGuide/windows7/02.jpg" meta:resourcekey="Image14Resource1" /><br />
    <asp:Label ID="Label20" runat="server" Text="當電腦沒有Parallel Port或是它被關閉時，將出現下面畫面，點選「確定」將它關閉即可。" meta:resourcekey="Label20Resource1"></asp:Label><br />
    <asp:Image ID="Image15" runat="server" ImageUrl="~/Common/UsbKey/InstallGuide/windows7/03.jpg" meta:resourcekey="Image15Resource1" /><br />
    <asp:Label ID="Label21" runat="server" Text="驅動程式安裝完成。" meta:resourcekey="Label21Resource1" ></asp:Label><br />
    <asp:Image ID="Image16" runat="server" ImageUrl="~/Common/UsbKey/InstallGuide/windows7/04.jpg" meta:resourcekey="Image16Resource1" /><br />
    <br />
    <asp:Label ID="Label7" runat="server" Text="6. 插入USB Key，某些電腦可能會出現下列畫面" meta:resourcekey="Label7Resource1"></asp:Label>
    <br />
    <asp:Label ID="Label8" runat="server" Text="(1)Windows偵測到新增硬體，點選「下一步」執行自動安裝" meta:resourcekey="Label8Resource1"></asp:Label><br />
    <asp:Image ID="Image8" runat="server" ImageUrl="~/Common/UsbKey/InstallGuide/64bit/05.jpg" meta:resourcekey="Image8Resource1" />
    <br />
    <asp:Label ID="Label9" runat="server" Text="(2)選擇「是，只有現在」，再「下一步」" meta:resourcekey="Label9Resource1"></asp:Label><br />
    <asp:Image ID="Image9" runat="server" ImageUrl="~/Common/UsbKey/InstallGuide/64bit/04.jpg" meta:resourcekey="Image9Resource1" /><br />
    <asp:Label ID="Label10" runat="server" Text="(3)Windows新增硬體精靈正在搜尋中..." meta:resourcekey="Label10Resource1"></asp:Label><br />
    <asp:Image ID="Image10" runat="server" ImageUrl="~/Common/UsbKey/InstallGuide/64bit/06.jpg" meta:resourcekey="Image10Resource1" /><br />
    <asp:Label ID="Label11" runat="server" Text="(4)選擇「繼續安裝」" meta:resourcekey="Label11Resource1"></asp:Label><br />
    <asp:Image ID="Image11" runat="server" ImageUrl="~/Common/UsbKey/InstallGuide/64bit/07.jpg" meta:resourcekey="Image11Resource1" /><br />
    <asp:Label ID="Label12" runat="server" Text="(5)完成新增硬體" meta:resourcekey="Label12Resource1"></asp:Label><br />
    <asp:Image ID="Image12" runat="server" ImageUrl="~/Common/UsbKey/InstallGuide/64bit/08.jpg" meta:resourcekey="Image12Resource1" /><br />
    <a id="installDriverLink" href="EBUsbKeyDriver.exe"></a>
</asp:Content>

