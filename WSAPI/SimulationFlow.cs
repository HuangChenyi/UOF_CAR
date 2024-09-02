using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Newtonsoft.Json;

namespace WSAPI
{
    public partial class SimulationFlow : Form
    {
        //<item name="ERP" PrivateKey="PFJTQUtleVZhbHVlPjxNb2R1bHVzPnFoeXJPMGdZdVRleVdPSzVobWhDNThIUi9tQVJ2SXhqdWNZTDgzK0pwS0QybEp3YzlDRXl1dXR2R3o0UWo1SmNPRXBYb3RUSHlzREtzWW5ZS0NCWjYyRGNBUklqc3E3NmRmeHFEUE1lc2dYdTE5ZUtLeFVLRTJtRThHbnczRUgzL3I4dkVOenNsVHZzR1prVUErZCsvMDlDbzR1MFlqUEwySlgwWC8wd0oxMD08L01vZHVsdXM+PEV4cG9uZW50PkFRQUI8L0V4cG9uZW50PjxQPnY2dHQvZVlxYkpuMlBjNW9mRmQ2MlY0L2hGKzVETS9RRURmRTYvYXJIOWg5TkRzaDQzdDBaM3RwRG84YzllQUppWGdUMlNTV1dPaEVsOFVHYlp6WDlRPT08L1A+PFE+NHpUNFE4R3VIS0ZxSnVxOGxQT2RFWGY5Y3dJaC8xVitqU0tlMFB2L0lEb1dCT3FrWmlxb2N4eEdEUkMwNGxta0hBRHlad09xMTc2M3p0K2hmM2s0eVE9PTwvUT48RFA+Q1VrZDJBb1pqZzliYlowZFZNRE1NOUdzRkJhckdXTEwrcTBvL2lHQ0l0WFRJdittWWFYdWVzRHcwd0s5N1crQUpzZkpkbUNlWkFwRW9IR3NJUTFUTFE9PTwvRFA+PERRPmg2ZURweWpIWk02M0MxOVJrdmxVeVM1RUE5dTlJcThQN1FKRG9uRWlwVUlwRFd4dkZaVFltRW5FUlY2NU1QL21iTlhmNU1PYXlFOVZmVTJtSmU3aGlRPT08L0RRPjxJbnZlcnNlUT5RK2lQMjEvbzVsMFh2UVJlR01ja094cnN1TG1tcGdra2I1NTI1OXh3OEIxZnZqaEtIOWoyb2dmb0F4bGtsTFk4M2Z0YXBMR0xsekNPeFpoUlYreVN4dz09PC9JbnZlcnNlUT48RD5CSDUwRDViY3F3S2hBRFFpZVQzYjRVb3FNQWJUQm5ZaHFhWVB2c08wY1MyY3dLNzNITmxHVm5zakdQSFBkNFl0cFlHMm12aWdFVDBuOHY5cDZjckxxcDhpNXlOeGdpdlR4bnJzRTM3UWNPdkhxZlVZc045QW0rcFdNc0tITWU4QmpwRDE3SXNZME5QOEZPd2MyN2hjNDhhNzFYU2ZlUkowMjM3c2VPSlpXTUU9PC9EPjwvUlNBS2V5VmFsdWU+" />
         string m_Token = "";
         string siteUrl = "";

        public SimulationFlow(string token)
        {
            MessageBox.Show(@"
*********************************注意事項********************************
此API使用前必須充份了解外部起單的機制才有辦法使用此API
首先先到config檔中設定您要連的站台網址<add key=""UOFSite"" ........... 
並且到你對應的站台的~/PublicAPI/web.config加入第17行的私鑰字串
才可以正常的使用API，另外請輸入你該站台的admin帳密於38行中
最後提醒您此起單的XML範例為技轉DB用的，若您不是用本DB，請自行產生!");

            InitializeComponent();
            //取得設定資訊
            siteUrl = System.Configuration.ConfigurationManager.AppSettings["UOFSite"];
            string publicKey = System.Configuration.ConfigurationManager.AppSettings["PublicKey"];
            //取得登入憑證
            Authentication auth = new Authentication();
            m_Token = token;// auth.GetToken("ERP", "admin", "123456");
            //傳入範例起單XML
            txtInput.Text = @"<Form formVersionId=""0418e15d-67ee-4583-968d-b55f0bcae18b"" urgentLevel=""2"">
	<Applicant account=""Tony"" groupId="""" jobTitleId="""">
		<Comment />

	</Applicant>
	<FormFieldValue>
		<FieldItem fieldId=""NO"" fieldValue="""" realValue="""" IsNeedAutoNbr=""false"" />
		<FieldItem fieldId=""A01"" fieldValue=""事假@事假"" realValue="""" fillerName=""Tony"" fillerUserGuid=""c496e32b-0968-4de5-95fc-acf7e5a561c0"" fillerAccount=""Tony"" fillSiteId="""" />
		<FieldItem fieldId=""A02"" fieldValue=""2013/09/30"" realValue="""" fillerName=""Tony"" fillerUserGuid=""c496e32b-0968-4de5-95fc-acf7e5a561c0"" fillerAccount=""Tony"" fillSiteId="""" />
		<FieldItem fieldId=""A03"" fieldValue=""1"" realValue="""" fillerName=""Tony"" fillerUserGuid=""c496e32b-0968-4de5-95fc-acf7e5a561c0"" fillerAccount=""Tony"" fillSiteId="""" />
		<FieldItem fieldId=""A04"" fieldValue=""xxxxx"" realValue="""" fillerName=""Tony"" fillerUserGuid=""c496e32b-0968-4de5-95fc-acf7e5a561c0"" fillerAccount=""Tony"" fillSiteId="""" />
		<FieldItem fieldId=""A05"" fieldValue=""HR"" realValue=""&lt;UserSet&gt;&lt;Element type='user'&gt; &lt;userId&gt;335af80b-a806-436d-b5e5-b463ef3ef01f&lt;/userId&gt; &lt;/Element&gt;&lt;/UserSet&gt;&#xD;&#xA;"" fillerName=""Tony"" fillerUserGuid=""c496e32b-0968-4de5-95fc-acf7e5a561c0"" fillerAccount=""Tony"" fillSiteId="""" />
	</FormFieldValue>

</Form>
";

        }

        private void btnSend_Click(object sender, EventArgs e)
        {
  
            //呼叫API取得回傳資訊
            WKFAPI wkfAPI = new WKFAPI(m_Token);
            string returnValue = wkfAPI.SimulationFlowByScript(txtInput.Text);
            //反序列化
            SiteInfo siteInfo = (SiteInfo)JsonConvert.DeserializeObject(returnValue, typeof(SiteInfo));

            DataTable dt = new DataTable();
            dt.Columns.Add("SITE_SEQ");
            dt.Columns.Add("SIGNER");

            foreach (Site site in siteInfo.Sites)
            {
                dt.Rows.Add(new object[] {site.SITE_SEQ, site.SIGNER});
            }

            dataGridView1.DataSource = dt;
        }

       
    }
}
