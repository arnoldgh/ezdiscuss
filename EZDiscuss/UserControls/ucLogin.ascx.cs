using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EZDiscuss.UserControls
{
    public partial class ucLogin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bLogin_Click(object sender, EventArgs e)
        {
            ProcessLogin();
        }

        private void ProcessLogin()
        {
            long memberId = 0;
            try
            {
                string email = tE.Text.Trim();
                string pwd = tP.Text.Trim();

                if (email == "" || pwd == "")
                {
                    lM.Text = "Invalid credentials.";
                    return;
                }

                EZDiscuss.Classes.Member member = new Classes.Member();
                member = member.MemberLogin(email, pwd);
                if (member != null)
                {
                    lM.Text = "";
                    Session["member"] = member;
                    memberId = Convert.ToInt64(member.memberId);
                    string paddedMemberId = EZDiscuss.Classes.Helper.PadMemberId(memberId);

                    EZDiscuss.Classes.Group grp = new Classes.Group();
                    DataSet ds = grp.RetrieveAllGroups(memberId);                     
                    DataTable dtCreatedGroups = ds.Tables[0];
                    DataTable dtjoinedGroups = ds.Tables[1];

                    // Check if the login user has already a Group or Joined a Group. If so, redirect to discussionboard right away
                    if (dtCreatedGroups.Rows.Count > 0 || dtjoinedGroups.Rows.Count > 0 )
                    {
                        Response.Redirect("DiscussionBoard.aspx?memberId=" + paddedMemberId.ToString(), false);
                    }
                    else
                    {
                        // If none yet, redirect to the page to create a Group and invite friends
                        Response.Redirect("MemberHome.aspx?memberId=" + paddedMemberId.ToString(), false);
                    }
                }
                else
                {
                    lM.Text = "Invalid credentials.";
                }
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("ucLogin.ascx.cs", "ProcessLogin", ex.Message, memberId);
            }
        }
    }
}