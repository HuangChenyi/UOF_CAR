using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ede.Uof.Utility.Page.Common;

public partial class CDS_Utility_UOFCookie : Ede.Uof.Utility.Page.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSet_Click(object sender, EventArgs e)
    {
        UofCookies.Set(txtKey.Text, txtValue.Text);
        txtValue.Text = "";
        txtKey.Text = "";
    }
    protected void btnGet_Click(object sender, EventArgs e)
    {
        txtValue.Text = UofCookies.Get(txtKey.Text);
        txtKey.Text = "";
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        UofCookies.Remove(txtKey.Text);
        txtValue.Text = "";
        txtKey.Text = "";
    }
}