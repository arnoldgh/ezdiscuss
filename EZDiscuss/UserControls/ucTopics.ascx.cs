using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EZDiscuss.UserControls
{
    public partial class ucTopics : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CheckTopics();
        }

            private void CheckTopics()
            {
                // Retrieve member's info from the Login
                DataTable dtMember = (DataTable) Session["memberInfo"];

                if (dtMember != null)
                {
                    EZDiscuss.Classes.Topic topics = new Classes.Topic();
                    long memberId = Convert.ToInt64(dtMember.Rows[0]["MemberID"]);

                    DataTable dt = new DataTable();
                    dt = topics.TopicsRetrieveByMemberID(memberId);
                    if (dt.Rows.Count > 0)
                    {
                        rTopics.DataSource = dt;
                        rTopics.DataBind();
                    }
                }
            }

            protected void rTopics_ItemDataBound(object sender, RepeaterItemEventArgs e)
            {
                //if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
                //{
                //    var btn = e.Item.FindControl("bT") as Button;
                //    if (btn != null)
                //    {  // adding button event 
                //        btn.Click += new EventHandler(btn_Click);
                //    }
                //}

                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Button btn = (Button)e.Item.FindControl("bT");
                    long topicId = Convert.ToInt64(((System.Data.DataRowView)(e.Item.DataItem)).Row.ItemArray[0]);
                    btn.Attributes.Add("TopicId", topicId.ToString());
                }
            }

            protected void rTopics_ItemCommand(object source, RepeaterCommandEventArgs e)
            {
                if (e.CommandName == "Display")
                { 

                }
            }

            //void btn_Click(object sender, EventArgs e)
            //{
            //    //write your code 
            //    string str = e.ToString();
            //}

            protected void Topic_Click(object sender, EventArgs e)
            {
                string str = e.ToString();
                string sdr = sender.ToString();
            }
    }
}