using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using System.Configuration;

namespace EZDiscuss
{

    public partial class DiscussionBoard : System.Web.UI.Page
    {
        #region Public Properties

        public int MessageCount
        {
            get { return Convert.ToInt32(ViewState["MessageCount"]); }
            set { if (value > 0) ViewState["MessageCount"] = value; }
        }

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    Session["CurrentPage"] = "DiscussionBoard.aspx";

                    // Check if the user is logged in
                    if (Session["member"] != null)
                    {
                        int selectedGroup = Convert.ToInt32(rblGroups.SelectedValue);
                        LoadGroups(selectedGroup);
                        ResetParticipants();

                        Session["ShowGroupButton"] = true;
                    
                    }
                    else
                    {
                        // Redirect to the Login page
                        Response.Redirect("~/Home.aspx", true);
                    }
                }
            }
            catch (Exception ex)
            {
                if (Session["memberId"] != null)
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "Page_Load", ex.Message, (long)Session["memberId"]);
                else
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "Page_Load", ex.Message, 0);
            }
        }

        private void LoadGroups(int selectedGroup)
        {
            try
            {
                EZDiscuss.Classes.Group grp = new Classes.Group();
                string paddedMemberId = Request.QueryString["memberId"].ToString();
                long memberId = EZDiscuss.Classes.Helper.UnPadMemberId(paddedMemberId);
                if (memberId > 0)
                {
                    Session["memberId"] = memberId;
                    DataSet ds = grp.RetrieveAllGroups(memberId);
                    if (ds.Tables.Count > 0)
                    {
                        DataTable dtGroups = null;
                        // Bind the Groups that the User Created
                        switch (selectedGroup)
                        {
                            case 1:
                                dtGroups = ds.Tables[0];
                                ddlGroups.DataSource = dtGroups;
                                break;
                            case 2:
                                dtGroups = ds.Tables[1];
                                ddlGroups.DataSource = dtGroups;
                                break;
                            case 3:
                                // Merge the 2 datatables
                                dtGroups = ds.Tables[0];
                                DataTable dtJoined = ds.Tables[1];
                                dtGroups.Merge(dtJoined);
                                ddlGroups.DataSource = dtGroups;
                                break;

                        }
                    
                        ddlGroups.DataTextField = "GroupName";
                        ddlGroups.DataValueField = "GroupId";
                        ddlGroups.DataBind();
                    
                        ListItem selectItem = new ListItem("Select Group...", "0");
                        ddlGroups.Items.Insert(0, selectItem);
                                        
                    }
                    else
                    {
                        ddlGroups.DataSource = null;
                        ddlGroups.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                if (Session["memberId"] != null)
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "LoadGroups", ex.Message, (long)Session["memberId"]);
                else
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "LoadGroups", ex.Message, 0);
            }

        }

        private void CheckTopics(long groupId)
        {
            try
            {
                if (groupId > 0)
                {
                    EZDiscuss.Classes.Topic topics = new Classes.Topic();
                
                    DataTable dt = new DataTable();                
                    dt = topics.TopicsRetrieveByGroupId(groupId);
                    if (dt.Rows.Count > 0)
                    {
                        rTopics.DataSource = dt;
                        rTopics.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                if (Session["memberId"] != null)
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "CheckTopics", ex.Message, (long)Session["memberId"]);
                else
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "CheckTopics", ex.Message, 0);
            }

        }

        protected void rTopics_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Button btn = (Button)e.Item.FindControl("btnTopic");
                    long topicId = Convert.ToInt64(((System.Data.DataRowView)(e.Item.DataItem)).Row.ItemArray[0]);
                    btn.Attributes.Add("TopicId", topicId.ToString());
                    string topicName = ((System.Data.DataRowView)(e.Item.DataItem)).Row.ItemArray[2].ToString();
                    btn.Attributes.Add("TopicName", topicName);                
                }
            }
            catch (Exception ex)
            {
                if (Session["memberId"] != null)
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "rTopics_ItemDataBound", ex.Message, (long)Session["memberId"]);
                else
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "rTopics_ItemDataBound", ex.Message, 0);
            }

        }

        protected void rTopics_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "DisplayMessage")
                {
                    Button btn = (Button)e.CommandSource;
                    //btn.CssClass = "highlightGreen";
                    //btn.BackColor = System.Drawing.Color.Green;
                    //btn.ForeColor = System.Drawing.Color.White;

                    long topicId = Convert.ToInt64(btn.Attributes["TopicId"]);
                    ViewState["TopicName"] = btn.Attributes["TopicName"].ToString();
                    ViewState["TopicId"] = topicId;
                    LoadParticipants(topicId);
                    LoadMessagesForTopic(topicId);
                    //LoadNamesInPrivateMessageDropDownList();
                }
            }
            catch (Exception ex)
            {
                if (Session["memberId"] != null)
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "rTopics_ItemCommand", ex.Message, (long)Session["memberId"]);
                else
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "rTopics_ItemCommand", ex.Message, 0);
            }
        }

        //private void LoadNamesInPrivateMessageDropDownList()
        //{
        //    if (Session["Participants"] != null)
        //    {
        //        DataTable dt = (DataTable)Session["Participants"];
        //        ddlPM.DataSource = dt;
        //        ddlPM.DataTextField = "Name";
        //        ddlPM.DataValueField = "MemberId";
        //        ddlPM.DataBind();

        //        if (Session["member"] != null)
        //        {
        //            EZDiscuss.Classes.Member member = (EZDiscuss.Classes.Member) Session["member"];
        //            long memberId = Convert.ToInt64(member.memberId);
        //            DataRow dr = dt.AsEnumerable().Where(m =>m.Field<Int64>(0) == memberId).FirstOrDefault();
        //            if (dr != null)
        //            {
        //                ListItem item = new ListItem(dr["name"].ToString());
        //                ddlPM.Items.Remove(item);
        //            }
        //        }
        //    }
        //}

        private void LoadMessagesForTopic(long topicId)
        {
            try
            {
                // Display all the messages for this topic in each of the participating members
                Classes.Topic topic = new Classes.Topic();
                DataTable dt = topic.TopicsRetrieveMessagesByTopicId(topicId);
                int mCount = dt.Rows.Count;
                if (mCount > 0)
                {
                    rMessages.DataSource = dt;
                    rMessages.DataBind();

                    // Play a sound if there is a new Message sent/received
                    if (mCount > MessageCount)
                    {
                        System.Media.SystemSounds.Asterisk.Play();
                        //System.Threading.Thread.Sleep(5000);
                        //System.Media.SystemSounds.Beep.Play();
                        //System.Threading.Thread.Sleep(5000);
                        //System.Media.SystemSounds.Exclamation.Play();
                        //System.Threading.Thread.Sleep(5000);
                        //System.Media.SystemSounds.Hand.Play();
                        //System.Threading.Thread.Sleep(5000);
                        //System.Media.SystemSounds.Question.Play();
                        MessageCount = mCount;
                    }

                    // Display the Topic Name
                    string topicName = ViewState["TopicName"].ToString();
                    lTopicTitle.Text = topicName;
                }
                else
                {
                    // No Message found so clear the grid and display the topicname
                    if (ViewState["TopicName"] != null)
                    {
                        string topicName = ViewState["TopicName"].ToString();
                        lTopicTitle.Text = topicName;
                    }
                    rMessages.DataSource = null;
                    rMessages.DataBind();
                };
            }
            catch (Exception ex)
            {
                if (Session["memberId"] != null)
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "LoadMessagesForTopic", ex.Message, (long)Session["memberId"]);
                else
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "LoadMessagesForTopic", ex.Message, 0);
            }
        }

        protected void rMessages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {                
                    HiddenField hDt = (HiddenField) e.Item.FindControl("hD");
                    if (hDt != null)
                    {
                        DateTime dtVal = Convert.ToDateTime(hDt.Value);
                        string dt = dtVal.Date.ToString();
                        if (dt == DateTime.Now.Date.ToString())
                        {
                            //Image img = (Image)e.Item.FindControl("i1");
                            //img.Visible = true;
                        }
                        else
                        {
                        
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                if (Session["memberId"] != null)
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "rMessages_ItemDataBound", ex.Message, (long)Session["memberId"]);
                else
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "rMessages_ItemDataBound", ex.Message, 0);
            }
        }

        private void LoadParticipants(long topicId)
        {
            try
            {
                // Display all the Participants for the specified Topic
                Classes.Topic topic = new Classes.Topic();
                DataTable dt = topic.TopicMembersRetrieve(topicId);
                if (dt.Rows.Count > 0)
                {
                    Session["Participants"] = dt;
                    int i = 1;
                    EZDiscuss.UserControls.ucMemberProfile ucMP = new UserControls.ucMemberProfile();

                    ResetParticipants();

                    foreach (DataRow dr in dt.Rows)
                    {
                        if (i <= 20)
                        {
                            Classes.Member member = new Classes.Member();                        
                            member.firstName = dr["FirstName"].ToString();
                            member.memberId = Convert.ToInt64(dr["MemberId"]);
                            member.gender = Convert.ToInt32(dr["Gender"]);
                            member.photo = dr["Photo"].ToString();

                            switch (i)
                            {
                                case 1:
                                    ucMP = ucMP1;
                                    break;
                                case 2:
                                    ucMP = ucMP2;
                                    break;
                                case 3:
                                    ucMP = ucMP3;
                                    break;
                                case 4:
                                    ucMP = ucMP4;
                                    break;
                                case 5:
                                    ucMP = ucMP5;
                                    break;
                                case 6:
                                    ucMP = ucMP6;
                                    break;
                                case 7:
                                    ucMP = ucMP7;
                                    break;
                                case 8:
                                    ucMP = ucMP8;
                                    break;
                                case 9:
                                    ucMP = ucMP9;
                                    break;
                                case 10:
                                    ucMP = ucMP10;
                                    break;
                                case 11:
                                    ucMP = ucMP11;
                                    break;
                                case 12:
                                    ucMP = ucMP12;
                                    break;
                                case 13:
                                    ucMP = ucMP13;
                                    break;
                                case 14:
                                    ucMP = ucMP14;
                                    break;
                                case 15:
                                    ucMP = ucMP15;
                                    break;
                                case 16:
                                    ucMP = ucMP16;
                                    break;
                                case 17:
                                    ucMP = ucMP17;
                                    break;
                                case 18:
                                    ucMP = ucMP18;
                                    break;
                                case 19:
                                    ucMP = ucMP19;
                                    break;
                                case 20:
                                    ucMP = ucMP20;
                                    break;
                                default:
                                    break;

                            }
                            ucMP.Photo = member.photo;
                            ucMP.FirstName = member.firstName;
                            ucMP.MemberId = member.memberId;
                            ucMP.Gender = member.gender;
                            ucMP.TopicId = topicId;
                            ucMP.ActivateControl(true);
                            i++;
                        }
                    }
                }
                else
                {
                    // Reset Member Profile Controls
                    ResetParticipants();
                };
            }
            catch (Exception ex)
            {
                if (Session["memberId"] != null)
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "LoadParticipants", ex.Message, (long)Session["memberId"]);
                else
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "LoadParticipants", ex.Message, 0);
            }
        }

        private void ResetParticipants()
        {
            try
            {
                EZDiscuss.UserControls.ucMemberProfile ucMP = new UserControls.ucMemberProfile();
                Classes.Member mem = new Classes.Member();

                for (int i = 1; i <= 20; i++ )
                {
                    mem.firstName = null;
                    switch (i)
                    {
                        case 1:
                            ucMP = ucMP1;
                            break;
                        case 2:
                            ucMP = ucMP2;
                            break;
                        case 3:
                            ucMP = ucMP3;
                            break;
                        case 4:
                            ucMP = ucMP4;
                            break;
                        case 5:
                            ucMP = ucMP5;
                            break;
                        case 6:
                            ucMP = ucMP6;
                            break;
                        case 7:
                            ucMP = ucMP7;
                            break;
                        case 8:
                            ucMP = ucMP8;
                            break;
                        case 9:
                            ucMP = ucMP9;
                            break;
                        case 10:
                            ucMP = ucMP10;
                            break;
                        case 11:
                            ucMP = ucMP11;
                            break;
                        case 12:
                            ucMP = ucMP12;
                            break;
                        case 13:
                            ucMP = ucMP13;
                            break;
                        case 14:
                            ucMP = ucMP14;
                            break;
                        case 15:
                            ucMP = ucMP15;
                            break;
                        case 16:
                            ucMP = ucMP16;
                            break;
                        case 17:
                            ucMP = ucMP17;
                            break;
                        case 18:
                            ucMP = ucMP18;
                            break;
                        case 19:
                            ucMP = ucMP19;
                            break;
                        case 20:
                            ucMP = ucMP20;
                            break;
                        default:
                            break;
                    }
                    ucMP.Initialize();
                }
            }
            catch (Exception ex)
            {
                if (Session["memberId"] != null)
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "ResetParticipants", ex.Message, (long)Session["memberId"]);
                else
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "ResetParticipants", ex.Message, 0);
            }
        }

        protected void bCreate_Click(object sender, EventArgs e)
        {
            CreateTopic();
        }

        private void CreateTopic()
        {
            try
            {
                string topicTitle = tTopic.Text.Trim();
                if (topicTitle == string.Empty)
                {
                    lM.Text = "Topic Title is required.";
                    return;
                }

                long groupId = Convert.ToInt64(ddlGroups.SelectedValue);
                if (groupId == 0)
                {
                    lM.Text = "Select a Group for the Topic.";
                    return;
                }

                string topicDesc = tD.Text.Trim();
                string paddedMemberId = Request.QueryString["memberId"].ToString();
                long memberId = EZDiscuss.Classes.Helper.UnPadMemberId(paddedMemberId);
                if (memberId > 0)
                {
                    long topicId = 0;
                    EZDiscuss.Classes.Topic t = new Classes.Topic();

                    t.groupId = groupId;
                    t.memberId = memberId;
                    t.topicTitle = topicTitle;
                    t.topicDescription = topicDesc;

                    topicId = t.TopicCreate();
                    if (topicId > 0)
                    {
                        lM.ForeColor = System.Drawing.Color.Blue;
                        lM.Text = "Topic created successfully.";

                        // Clear the Textboxes
                        tTopic.Text = tD.Text = "";

                        // Rebind the Topics for the selected Group
                        CheckTopics(groupId);

                        // Activate Controls
                        ActivateControls(true);
                    }
                    else
                    {
                        lM.ForeColor = System.Drawing.Color.Red;
                        lM.Text = "Topic was not created successfully.";
                    }
                }
                else
                {
                    lM.Text = "Invalid Member.";
                }
            }
            catch (Exception ex)
            {
                if (Session["memberId"] != null)
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "CreateTopic", ex.Message, (long)Session["memberId"]);
                else
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "CreateTopic", ex.Message, 0);
            }
        }

        protected void btnPostMessage_Click(object sender, EventArgs e)
        {
            try
            {
                string message = txtMessage.Text.Trim();            
                long messageId = postMessage(message);

                // Rebind the the messages for the current Topic if the message was created successfully.
                if (messageId > 0)
                {
                    long topicId = Convert.ToInt64(ViewState["TopicId"]);
                    LoadMessagesForTopic(topicId);

                    // Clear the text and display a message
                    txtMessage.Text = "";

                    //lblMessage.Text = "Message post successful.";

                    // Reload the participants to reflect new joiners.
                    LoadParticipants(topicId);

                    // Email the message to all participants
                    EmailMessageToParticipants(topicId, message);
                }
            }
            catch (Exception ex)
            {
                if (Session["memberId"] != null)
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "btnPostMessage_Click", ex.Message, (long)Session["memberId"]);
                else
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "btnPostMessage_Click", ex.Message, 0);
            }
        }

        private void EmailMessageToParticipants(long topicId, string message)
        {
            try
            {
                string email = "";

                // Compose the email
                MailMessage mail = new MailMessage();
                string FromAddress = ConfigurationManager.AppSettings["fromAddress"].ToString();
                string EmailSubject = ViewState["TopicName"].ToString();
                string EmailBody = message;
                mail.From = new MailAddress(FromAddress);
                mail.IsBodyHtml = true;
                mail.Body = EmailBody;
                mail.Subject = EmailSubject;

                // Get the Participants' emails
                DataTable dt = (DataTable) Session["Participants"];
                foreach (DataRow row in dt.Rows)
                {
                    email = row["Email"].ToString();
                    mail.To.Add(email);                
                }
            
                SmtpClient smtp = new SmtpClient(ConfigurationManager.AppSettings["smtpClient"].ToString());
                smtp.EnableSsl = true;
                string userName = ConfigurationManager.AppSettings["smtpUserName"].ToString();
                string password = ConfigurationManager.AppSettings["smtpPassword"].ToString();
                smtp.Credentials = new System.Net.NetworkCredential(userName, password);
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                if (Session["memberId"] != null)
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "EmailMessageToParticipants", ex.Message, (long)Session["memberId"]);
                else
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "EmailMessageToParticipants", ex.Message, 0);
            }
        }

        private long postMessage(string message)
        {
            long messageId = 0;

            if (message == "") return messageId;
            try
            {
                long topicId = Convert.ToInt64(ViewState["TopicId"]);
                // Retrieve and unpad MemberId from the QueryString
                string paddedMemberId = Request.QueryString["MemberId"].ToString();
                long memberId = EZDiscuss.Classes.Helper.UnPadMemberId(paddedMemberId);

                // TODO: Store message in database (return for now)            
                EZDiscuss.Classes.Message msg = new EZDiscuss.Classes.Message();
                msg.text = message;
                msg.memberId = memberId;
                msg.topicId = topicId;

                messageId = msg.MessageCreate();
            }
            catch (Exception ex)
            {
                if (Session["memberId"] != null)
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "postMessage", ex.Message, (long)Session["memberId"]);
                else
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "postMessage", ex.Message, 0);
            }

            return messageId;
        }

        protected void ddlGroups_SelectedIndexChanged(object sender, EventArgs e)
        {
            long groupId = Convert.ToInt64(ddlGroups.SelectedValue);
            if (groupId > 0)
                LoadTopicsForSelectedGroup(groupId);
            else
            {
                // Clear the Repeater
                rTopics.DataSource = null;
                rTopics.DataBind();

                // And activate the Create Topic section
                ActivateCreateTopicControls(true);
            }
        }

        private void ActivateCreateTopicControls(bool enable)
        {
            // Create Topic Controls
            tTopic.Enabled = enable;
            tD.Enabled = enable;
            bCreateTopic.Enabled = enable;
        }

        private void ActivateControls(bool enable)
        {
            // Create Topic Controls
            tTopic.Enabled = enable;
            tD.Enabled = enable;
            bCreateTopic.Enabled = enable;
            
            // Create Message Controls
            txtMessage.Enabled = enable;
            btnPostMessage.Enabled = enable;
        }

        private void LoadTopicsForSelectedGroup(long groupId)
        {
            try
            {
                EZDiscuss.Classes.Topic topic = new Classes.Topic();

                DataTable dt = topic.TopicsRetrieveByGroupId(groupId);
                if (dt.Rows.Count > 0)
                {
                    rTopics.DataSource = dt;
                    rTopics.DataBind();
                    lTopics.Text = "List of Topics for selected Group:";
                    ActivateControls(true);
                }
                else
                {
                    rTopics.DataSource = null;
                    rTopics.DataBind();
                    lTopics.Text = "There is no Topic for this Group yet.";
                    ActivateCreateTopicControls(true);
                }
            }
            catch (Exception ex)
            {
                if (Session["memberId"] != null)
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "LoadTopicsForSelectedGroup", ex.Message, (long)Session["memberId"]);
                else
                    EZDiscuss.Classes.Helper.LogError("DiscussionBoard.aspx", "LoadTopicsForSelectedGroup", ex.Message, 0);
            }

        }

        protected void updateTimer_Tick(object sender, EventArgs e)
        {
            long topicId = Convert.ToInt64(ViewState["TopicId"]);
            LoadMessagesForTopic(topicId);
        }

        protected void rblGroups_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedGroup = Convert.ToInt32(rblGroups.SelectedValue);
            LoadGroups(selectedGroup);
        }

        //protected void bPM_Click(object sender, EventArgs e)
        //{
        //    SendPrivateMessage();
        //}

        //private void SendPrivateMessage()
        //{            
        //    EZDiscuss.Classes.Member member = (EZDiscuss.Classes.Member)(Session["member"]);
        //    long memberId = Convert.ToInt64(member.memberId);
        //    long receiverId = Convert.ToInt64(ddlPM.SelectedValue);
        //    string message = tPM.Text.Trim();

        //    // Validate memberId
        //    if (memberId == 0)
        //        return;

        //    // Validate receiverId
        //    if (receiverId == 0)
        //        return;

        //    // Validate message
        //    if (message == "")
        //        return;

        //    EZDiscuss.Classes.PrivateMessage pm = new Classes.PrivateMessage();
        //    pm.SendPrivateMessage(memberId, receiverId, message);            
        //}
    }
}