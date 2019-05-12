using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EZDiscuss.UserControls
{
    public partial class ucMessage : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void bP_Click(object sender, EventArgs e)
        {            
            string txt = tM.Text.Trim();
            long messageId = postMessage(txt);
        }

        private long postMessage(string message)
        {
            if (message == "") return 0;

            long topicId = Convert.ToInt64(Session["topicId"]);
            long memberId = Convert.ToInt64(Session["memberId"]);

            // TODO: Store message in database (return for now)            
            EZDiscuss.Classes.Message msg = new EZDiscuss.Classes.Message();
            msg.text = message;
            msg.memberId = memberId;
            msg.topicId = topicId;
            
            long messageId = msg.MessageCreate();

            return messageId;
        }

        protected void bSendPrivateMessage_Click(object sender, EventArgs e)
        {
            EZDiscuss.Interfaces.IPrivateMessage pm = new EZDiscuss.Classes.PrivateMessage();
            long senderId = 1;
            long receiverId = 2;
            string message = "Hello";
            long privateMessageId = pm.SendPrivateMessage(senderId, receiverId, message);
        }


    }
}