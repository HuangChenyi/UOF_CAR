using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace WSAPI
{
    public class Authentication
    {
        public string Token { get; set; }
        public string SiteUrl { get; set; }
        string publicKey;
        public Authentication()
        {
            SiteUrl = System.Configuration.ConfigurationManager.AppSettings["UOFSite"];
            publicKey = System.Configuration.ConfigurationManager.AppSettings["PublicKey"];
        }

        public string GetToken(string appName, string account, string password)
        {
            //取得登入憑證
            Auth.Authentication auth = new Auth.Authentication();
            auth.Url = SiteUrl + "/PublicAPI/System/Authentication.asmx";
            Token = auth.GetToken(appName, RSAEncrypt(publicKey, account), RSAEncrypt(publicKey, password));

            return Token;
        }

        /// <summary>
        /// RSA 加密
        /// </summary>
        /// <param name="privateKey"></param>
        /// <param name="crTexturlparam>
        /// <returns></returns>
        private static string RSAEncrypt(string publicKey, string crText)
        {

            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider();

            byte[] base64PublicKey = Convert.FromBase64String(publicKey);
            rsa.FromXmlString(System.Text.Encoding.UTF8.GetString(base64PublicKey));


            byte[] ctTextArray = Encoding.UTF8.GetBytes(crText);


            byte[] decodeBs = rsa.Encrypt(ctTextArray, false);

            return Convert.ToBase64String(decodeBs);
        }
    }
}
