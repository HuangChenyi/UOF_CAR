using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ede.Uof.Utility.Page.Common;

public partial class CDS_Editor_Default : Ede.Uof.Utility.Page.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //開窗編輯文章
        Dialog.Open2(btnEditor, "~/CDS/Editor/MaintainEditor.aspx", "" ,1024,768, Dialog.PostBackType.AfterReturn);
    }
    protected void btnEditor_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Dialog.GetReturnValue()))
        {
            //將回傳的文章內容經過轉碼，並顯示原始內容供比較
            txtHtml.Text = Ede.Uof.Utility.EditorHelper.ConvertEditorContent(Dialog.GetReturnValue());
            lblHtml.Text = Ede.Uof.Utility.EditorHelper.ConvertEditorContent(Dialog.GetReturnValue());
            txtHtmlForMessage.Text = Ede.Uof.Utility.EditorHelper.ConvertEditorContentForMessage(Dialog.GetReturnValue());
            txtSourceHtml.Text = Dialog.GetReturnValue();
        }
    }
}