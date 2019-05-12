using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EZDiscuss.UserControls
{
    public partial class ucSendEmailInvite : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadGroups();
        }

        private void LoadGroups()
        {
            long memberId = 0;

            try
            {
                string paddedMemberId = Request.QueryString["memberId"].ToString();
                memberId = EZDiscuss.Classes.Helper.UnPadMemberId(paddedMemberId);

                // Retrieve all the Groups for this member and load them into the Dropdownlist
                EZDiscuss.Classes.Group grp = new Classes.Group();
                DataSet dsGroups = grp.RetrieveAllGroups(memberId);
                dGroup.DataSource = dsGroups;
                dGroup.DataTextField = "GroupName";
                dGroup.DataValueField = "GroupId";
                dGroup.DataBind();
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("ucSendEmailInvite.ascx.cs", "LoadGroups", ex.Message, memberId);
            }
        }

        protected void btnSendMail_Click(object sender, EventArgs e)
        {
            try
            {
                EZDiscuss.Classes.EmailInvitation mail = new Classes.EmailInvitation();
                mail.ToAddress = tEmail.Text.Trim();
                mail.EmailSubject = "EZDiscuss: Invitation to join discussion";
                mail.EmailBody = Server.HtmlEncode(composeEmail());
                mail.SendMail();
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("ucSendEmailInvite.ascx.cs", "btnSendMail_Click", ex.Message, 0);
            }
        }

        private string composeEmail()
        {
            string groupId = dGroup.SelectedValue.ToString();
            string name = tName.Text.Trim();
            string email = tEmail.Text.Trim();
            string message = "Hi " + name + "," + Environment.NewLine;
            message += "I would like to invite you to join our discussion. Please click the link below to accept the invitation." + Environment.NewLine;
            message += "http://localhost:19414/AcceptInvite.aspx?groupId=" + groupId + "&email=" + email;

            return message;
        }

        ////protected void btnPreview_Click(object sender, EventArgs e)
        ////{
        ////    try
        ////    {
        ////        string groupId = "1";           // TODO: To update with the correct value later
        ////        string name = tName.Text.Trim();
        ////        string email = tEmail.Text.Trim();
        ////        string message = "Hi " + name + "," + Environment.NewLine;
        ////        message += "I would like to invite you to join our discussion. Please click the link below to accept the invitation." + Environment.NewLine;
        ////        message += "http://localhost:19414/AcceptInvite.aspx?groupId=" + groupId + "&email=" + email;
        ////        //tMessage.Text = message;
        ////        //tMessage.ReadOnly = true;
        ////    }
        ////    catch (Exception ex)
        ////    {
        ////        EZDiscuss.Classes.Helper.LogError("ucSendEmailInvite.ascx.cs", "btnPreview_Click", ex.Message, 0);
        ////    }
        ////}
    }
}