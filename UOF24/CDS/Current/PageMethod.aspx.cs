using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ede.Uof.Utility.Page.Common;

public partial class CDS_Utility_PageMethod : Ede.Uof.Utility.Page.BasePage
{
    [WebMethod] //*.ascx.cs 不用加此行    
    public static string UofMethodDemo(string a, int b)
    {
        Thread.Sleep(3000);
        return a + b;
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


        }
    }

}