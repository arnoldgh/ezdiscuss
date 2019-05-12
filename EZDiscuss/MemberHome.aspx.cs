using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EZDiscuss
{
    public partial class MemberHome : System.Web.UI.Page
    {
        //long memberId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["CurrentPage"] = "MemberHome.aspx";

            if (Session["member"] != null)
            {
                EZDiscuss.Classes.Member member = (EZDiscuss.Classes.Member) Session["member"];

                lWelcome.Text = "Congratulations and Welcome " + member.firstName.ToString() + "! You can now create Group(s) and invite people to join you in the discussion.";
            }
            else
            {
                // Redirect to the Login page
                Response.Redirect("~/Home.aspx", true);
            }
        }

        protected void btnDiscussion_Click(object sender, EventArgs e)
        {
            string memberId = Request.QueryString["memberId"].ToString();
            Response.Redirect("DiscussionBoard.aspx?memberId=" + memberId, true);
        }
    }
}