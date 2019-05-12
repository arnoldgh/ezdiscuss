using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EZDiscuss.UserControls
{
    public partial class ucMessages : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve member's info from the Login
                DataTable dtMember = (DataTable)Session["memberInfo"];
                //long topicId = dtMember.Rows[0]["T

                //LoadMessagesForTopic();
                //LoadParticipants();
            }
        }

        private void LoadMessagesForTopic(long topicId)
        {
            // Display all the messages for this topic in each of the participating members
            Classes.Topic topic = new Classes.Topic();
            DataTable dt = topic.TopicsRetrieveMessagesByTopicId(topicId);
            if (dt.Rows.Count > 0)
            {
                rMessages.DataSource = dt;
                rMessages.DataBind();
            }
            else
            {
                // Do nothing for now.
            };
        }

        protected void rMessages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //Label lbl = (Label) e.Item.FindControl("lT");
                //lbl.Text = ((EZDiscuss.Classes.Topic)(e.Item.DataItem)).topicDescription.ToString();
                //// Attach the ID to the label
                //lbl.Attributes.Add("topicId", ((EZDiscuss.Classes.Topic)(e.Item.DataItem)).topicId.ToString());


                //Button btn = (Button) e.Item.FindControl("bT");
                //btn.Text = ((EZDiscuss.Classes.Topic)(e.Item.DataItem)).topicDescription.ToString();
                // Attach the ID to the button
                //btn.Attributes.Add("topicId", ((EZDiscuss.Classes.Topic)(e.Item.DataItem)).topicId.ToString());

                TextBox txt = (TextBox)e.Item.FindControl("tT");
                txt.Text = ((EZDiscuss.Classes.Topic)(e.Item.DataItem)).topicDescription.ToString();
            }
        }

        //private void LoadParticipants(long topicId)
        //private void LoadParticipants()
        //{
        //    // Display all the Participants for a certain Topic
        //    Classes.Topic topic = new Classes.Topic();
        //    //DataTable dt = topic.TopicParticipantsRetrieve(topicId);
        //    //if (dt.Rows.Count > 0)
        //    List<Classes.Member> lst = topic.TopicMembersRetrieve();
        //    if (lst.Count > 0)
        //    {
        //        int i = 1;
        //        ucMemberProfile ucMP = null;

        //        // TODO: Bind the Topic Participants
        //        //foreach (DataRow dr in dt.Rows)
        //        foreach (Classes.Member m in lst)
        //        {
        //            if (i <= 20)
        //            {
        //                Classes.Member mem = new Classes.Member();                        
        //                //mem.userName = dr["UserName"].ToString();                        

        //                switch (i)
        //                {
        //                    case 1:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP1");
        //                        break;
        //                    case 2:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP2");
        //                        break;
        //                    case 3:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP3");
        //                        break;
        //                    case 4:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP4");
        //                        break;
        //                    case 5:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP5");
        //                        break;
        //                    case 6:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP6");
        //                        break;
        //                    case 7:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP7");
        //                        break;
        //                    case 8:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP8");
        //                        break;
        //                    case 9:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP9");
        //                        break;
        //                    case 10:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP10");
        //                        break;
        //                    case 11:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP11");
        //                        break;
        //                    case 12:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP12");
        //                        break;
        //                    case 13:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP13");
        //                        break;
        //                    case 14:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP14");
        //                        break;
        //                    case 15:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP15");
        //                        break;
        //                    case 16:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP16");
        //                        break;
        //                    case 17:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP17");
        //                        break;
        //                    case 18:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP18");
        //                        break;
        //                    case 19:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP19");
        //                        break;
        //                    case 20:
        //                        ucMP = (ucMemberProfile)FindControl("ucMP20");
        //                        break;
        //                    default:
        //                        break;

        //                }

        //                i++;
        //            }
        //        }
        //    }
        //    else
        //    {
        //        // Do nothing for now.
        //    };
        //}

        //private void LoadMessages()
        //{
        //    long topicId = 1;
        //    EZDiscuss.Classes.Message msg = new Classes.Message();
        //    List<EZDiscuss.Classes.Message> lMessages = new List<Classes.Message>();
        //    lMessages = msg.RetrieveSampleMessages();
        //    rMessages.DataSource = lMessages;
        //    rMessages.DataBind();
        //}

        //private void LoadTopics()
        //{
        //    EZDiscuss.Classes.Topic topics = new Classes.Topic();
        //    List<EZDiscuss.Classes.Topic> lTopics = new List<Classes.Topic>();
        //    lTopics = topics.RetrieveTop10Topics();
        //    rMessages.DataSource = lTopics;
        //    rMessages.DataBind();
        //}

    }
}