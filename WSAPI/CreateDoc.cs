using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WSAPI
{
    public partial class CreateDoc : Form
    {


        public string filePath = "";
        public string sessionId = "";
        public string fileGroupID = "";
        string m_Token = "";
        string siteUrl = "";

         public CreateDoc(string token)
         {
             MessageBox.Show(@"
*********************************注意事項********************************
此API使用前必須充份了解外部起單的機制才有辦法使用此API
首先先到config檔中設定您要連的站台網址<add key=""UOFSite"" ........... 
並且到你對應的站台的~/PublicAPI/web.config加入第17行的私鑰字串
才可以正常的使用API");

             InitializeComponent();
             //取得設定資訊
             siteUrl = System.Configuration.ConfigurationManager.AppSettings["UOFSite"];
             string publicKey = System.Configuration.ConfigurationManager.AppSettings["PublicKey"];
             //取得登入憑證
             Authentication auth = new Authentication();
             m_Token = token;
         }

         private void btnDMSFolder_Click(object sender, EventArgs e)
         {
             GetDMSRoot();
         }


         /// <summary>
         /// 目錄架構
         /// </summary>
         private void GetDMSRoot()
         {
             DMS.Dms service = new DMS.Dms();
             service.Url = siteUrl + "/PublicAPI/DMS/DMS.asmx";

             DataSet ds = service.GetFolderTree(m_Token, "DMSRoot");
             treeDMSFolder.Nodes.Clear();

             foreach (DataTable dt in ds.Tables)
             {
                 foreach (DataRow dr in dt.Rows)
                 {
                     TreeNode[] nodes = treeDMSFolder.Nodes.Find(dr["PARENT_ID"].ToString(), true);
                     TreeNode node = null;
                     if (nodes.Length == 0)
                     {

                         treeDMSFolder.Nodes.Add(dr["CHILD_ID"].ToString(), dr["CHILD_NAME"].ToString());
                         treeDMSFolder.Nodes.Find(dr["CHILD_ID"].ToString(), true)[0].Tag = dr["CHILD_ID"].ToString();

                     }
                     else
                     {
                         nodes[0].Nodes.Add(dr["CHILD_ID"].ToString(), dr["CHILD_NAME"].ToString());
                         treeDMSFolder.Nodes.Find(dr["CHILD_ID"].ToString(), true)[0].Tag = dr["CHILD_ID"].ToString();
                     }


                 }
             }

             treeDMSFolder.ExpandAll();

         }

         private void treeDMSFolder_NodeMouseClick(object sender, TreeNodeMouseClickEventArgs e)
         {

         }

         private void treeDMSFolder_AfterSelect(object sender, TreeViewEventArgs e)
         {
             txtFolderId.Text = treeDMSFolder.SelectedNode.Tag.ToString();
         }

         private void btnUpload_Click(object sender, EventArgs e)
         {
             if (openFileDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK)
             {

                 FileSystem fs = new FileSystem(m_Token);
                 fileGroupID= fs.UploadFileToUOF(openFileDialog1.FileName , File.FileTarget.DMS_SOURCE);

                 txtFileName.Text = openFileDialog1.FileName;
                 txtFileGroupId.Text = fileGroupID;

             }
         }

         private void btnAddDoc_Click(object sender, EventArgs e)
         {
             DMSS dms = new DMSS(m_Token);
            txtDOCID.Text= dms.AddNewDOC( txtFolderId.Text, txtFileName.Text, txtFileGroupId.Text );


             MessageBox.Show("新增文件成功");
         }

  
    }
}
