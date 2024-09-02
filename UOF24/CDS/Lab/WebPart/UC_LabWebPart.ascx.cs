using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CDS_Lab_WebPart_LabWebPart : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblWebPartText.Text = string.Format("Hello WebPart!現在時間為:{0}", DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"));
    }
}