using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EZDiscuss
{
    public partial class SendMailInvite : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["CurrentPage"] = "SendMailInvite.aspx";
            LoadGroups();
        }

        private void LoadGroups()
        {
            long memberId = Convert.ToInt64(Request.QueryString["memberId"]);

            // Retrieve all the Groups for this member and load them into the Dropdownlist
            EZDiscuss.Classes.Group grp = new Classes.Group();
            DataSet dsGroups = grp.RetrieveAllGroups(memberId);
        }

        protected void btnSendMail_Click(object sender, EventArgs e)
        {
            EZDiscuss.Classes.EmailInvitation mail = new Classes.EmailInvitation();
            mail.ToAddress = tEmail.Text.Trim();
            mail.EmailSubject = tSubject.Text.Trim();
            mail.EmailBody = Server.HtmlEncode(tMessage.Text.Trim());
            mail.SendMail();
        }

        protected void btnPreview_Click(object sender, EventArgs e)
        {
            string groupId = "1";           // TODO: To update with the correct value later
            string name = tName.Text.Trim();
            string email = tEmail.Text.Trim();
            string message = "Hi " + name + "," + Environment.NewLine;
            message += "I would like to invite you to join our discussion. Please click the link below to accept the invitation." + Environment.NewLine;
            message += "http://localhost:19414/AcceptInvite.aspx?groupId=" + groupId + "&email=" + email;
            tMessage.Text = message;
            tMessage.ReadOnly = true;
        }
    }
}