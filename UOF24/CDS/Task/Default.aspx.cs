using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ede.Uof.Utility.Page.Common;

public partial class CDS_Task_Default : Ede.Uof.Utility.Page.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected  async  void  btnExecute_Click(object sender, EventArgs e)
    {
        Ede.Uof.Utility.Task.Dynamic.DynamicTask task = new Ede.Uof.Utility.Task.Dynamic.DynamicTask();

        string str = await  task.Add("Training","Training.Task", DateTime.Now, txtParam.Text);
    }
}