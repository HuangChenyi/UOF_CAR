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
    public partial class FileUpload : Form
    {
        string m_Token;

        public FileUpload(string token)
        {
            m_Token = token;
            InitializeComponent();
        }

        private void FileUpload_Load(object sender, EventArgs e)
        {
            string[] fileTargets=    Enum.GetNames( typeof( File.FileTarget));
            foreach (string fileTarget in fileTargets)
            {
                ddlFileTarget.Items.Add(fileTarget);
            }

            ddlFileTarget.SelectedIndex = 4;
        }

        private void btnSelect_Click(object sender, EventArgs e)
        {
            if (fileDialog.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                txtFilePath.Text = fileDialog.FileName;
            }
        }

        private void btnUpload_Click(object sender, EventArgs e)
        {
            FileSystem fs = new FileSystem(m_Token);
            txtFileGroupId.Text = fs.UploadFileToUOF(txtFilePath.Text, (File.FileTarget)Enum.Parse(typeof(File.FileTarget), ddlFileTarget.SelectedItem.ToString()));
          //  txtDownload.Text = System.Configuration.ConfigurationManager.AppSettings["UOFSite"] + "/Common/FileCenter/DownloadFile.ashx?id=" + txtFileGroupId.Text;
        }
    }
}
