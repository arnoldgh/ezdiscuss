using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EZDiscuss.UserControls
{
    public partial class ucTopic : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Session["update"] = Server.UrlEncode(System.DateTime.Now.ToString());

        }

        protected override void OnPreRender(EventArgs e)
        {
            ViewState["update"] = Session["update"];
        }



        protected void bCreate_Click(object sender, EventArgs e)
        {
            if (Session["update"].ToString() == ViewState["update"].ToString())
                CreateTopic();
        }

        private void CreateTopic()
        {
            string topicTitle = tT.Text.Trim();
            string topicDesc = tD.Text.Trim();            
            long memberId = Convert.ToInt64(Session["MemberId"]);

            if (topicTitle == string.Empty)
            {
                return;
            }

            long topicId = 0;
            EZDiscuss.Classes.Topic t = new Classes.Topic();

            t.topicTitle = topicTitle;
            t.topicDescription = topicDesc;
            t.memberId = memberId;

            topicId = t.TopicCreate();
            if (topicId > 0)
            {
                lM.ForeColor = System.Drawing.Color.Blue;
                lM.Text = "Topic created successfully.";
            }
            else
            {
                lM.ForeColor = System.Drawing.Color.Red;
                lM.Text = "Topic was not created unsuccessfully.";
            }
        }
    }
}