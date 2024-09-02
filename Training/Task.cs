using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Ede.Uof.EIP.Organization.Util;
using Training.UCO;

namespace Training
{
    public class Task : Ede.Uof.Utility.Task.BaseTask
    {
        public override void Run(params string[] args)
        {


            Ede.Uof.EIP.PrivateMessage.PrivateMessageUCO privateMessageUCO = new Ede.Uof.EIP.PrivateMessage.PrivateMessageUCO();
            UserUCO userUCO = new UserUCO();
            string userGuid = userUCO.GetGUID("Tony");
            privateMessageUCO.SendOneNewMessage("admin", "這是測試的標題", "這是測試的內容", userGuid);
        }
    }
}
