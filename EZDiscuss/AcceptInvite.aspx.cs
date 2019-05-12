using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EZDiscuss
{
    public partial class AcceptInvite : System.Web.UI.Page
    {
        long groupId = 0;
        string email = string.Empty;
        long memberId = 0;

        public long MemberId
        {
            get { return Convert.ToInt64(ViewState["_memberId"]); }
            set {ViewState["_memberId"] = value; }        
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["CurrentPage"] = "AcceptInvite.aspx";
                CheckIfMember();

            }
        }

        private void CheckIfMember()
        {
            try
            {
                // Get the email value from the QueryString
                email = Request.QueryString["email"].ToString();
                if (email == string.Empty)
                    return;

                // Check if the email address exists in the Members Table already
                EZDiscuss.Classes.Member member = new Classes.Member();
                memberId = member.IsMemberExisting(email);
                if (memberId == 0)
                {
                    // Not yet a member. Show the Registration view
                    mvAcceptInvite.ActiveViewIndex = 0;
                }
                else
                {
                    // Member already. Show the Accept Invitation view
                    mvAcceptInvite.ActiveViewIndex = 1;
                    //Store in a session variable
                    MemberId = memberId;
                }
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("AcceptInvite.aspx", "CheckIfMember", ex.Message, memberId); 
            }
        }

        protected void btnAcceptInvite_Click(object sender, EventArgs e)
        {
            try
            {
                // Already a member, so allow to accept the invitation by inserting record into the GroupMember Table
                groupId = Convert.ToInt64(Request.QueryString["groupId"]);
                email = Request.QueryString["email"].ToString();
                long groupMemberId = 0;

                EZDiscuss.Classes.Group group = new Classes.Group();
                //memberId = Convert.ToInt64(Session["Member" + memberId.ToString()]);
                groupMemberId = group.GroupMemberCreate(groupId, MemberId);
                if (groupMemberId > 0)
                {
                    lMsg.Text = "Thank you for accepting the invitation. You are now a member of the Group.";
                }
                else
                {
                    lMsg.Text = "There was a problem processing your invitation.";
                }
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("AcceptInvite.aspx", "btnAcceptInvite_Click", ex.Message, memberId);
            }
        }
    }
}