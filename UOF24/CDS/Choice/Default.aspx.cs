using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ede.Uof.EIP.Organization.Util;
using Ede.Uof.Utility.Page.Common;

public partial class CDS_Choice_Default : Ede.Uof.Utility.Page.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UC_ChoiceList1.EditButtonOnClick += UC_ChoiceList1_EditButtonOnClick;
        UC_ChoiceList2.EditButtonOnClick += UC_ChoiceList2_EditButtonOnClick;

        //d8406752-c83a-e4d9-127e-6b1d31a8f0c1
        //UserSet userSet = new UserSet();
        //UserSetGroup userSetGroup = new UserSetGroup();
        //userSetGroup.GROUP_ID = "d8406752-c83a-e4d9-127e-6b1d31a8f0c1";
        //userSetGroup.IS_DEPTH = true;

        //userSetGroup = new UserSetGroup();
        //userSetGroup.GROUP_ID = "Company";
        //userSetGroup.IS_DEPTH = true;

        //userSet.Items.Add(userSetGroup);
        //UC_ChoiceList3.LimitXML = userSet.GetXML();
    }

    void UC_ChoiceList2_EditButtonOnClick(Ede.Uof.EIP.Organization.Util.UserSet userSet)
    {
        TextBox2.Text = userSet.GetXML();
    }

    void UC_ChoiceList1_EditButtonOnClick(Ede.Uof.EIP.Organization.Util.UserSet userSet)
    {
        TextBox1.Text = userSet.GetXML();
    }

    protected void UC_BtnChoiceOnce_EditButtonOnClick(string[] choiceResult)
    {
        TextBox3.Text = string.Join(",", choiceResult);
    }
}