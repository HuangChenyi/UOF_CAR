using Ede.Uof.Utility.Page;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CDS_Lab_MSG_Default : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSend_Click(object sender, EventArgs e)
    {

        //Ede.Uof.EIP.PrivateMessage.PrivateMessageUCO 用 建構私人訊息物件
        //並用SendNewMessage  群發給指定對象
        //寄件者GUID可以用目前登入者Current去找出UserGuid
        //發送對象可以用選人元件的XML屬性
        //發送內容記得要用 Ede.Uof.Utility.EditorHelper.ConvertEditorContentForMessage() 轉成是純HTML格式

    }
}