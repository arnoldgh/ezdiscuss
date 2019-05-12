using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EZDiscuss
{
    public partial class SiteMember : System.Web.UI.MasterPage
    {
        EZDiscuss.Classes.Member member = new EZDiscuss.Classes.Member();
        long memberId = 0;
        string paddedMemberId = string.Empty;        

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["ShowGroupButton"] != null)
            //{
            //    btnGroup.Visible = (bool)Session["ShowGroupButton"];
            //}
        }

        //protected void btnLogout_Click(object sender, EventArgs e)
        //{
        //    member = (EZDiscuss.Classes.Member)Session["member"];
        //    if (member != null)
        //    {
        //         EZDiscuss.Classes.Member memLogout = member.MemberLogout(member.email, member.password);
        //        if (memLogout.IsLogout == true)
        //        {
        //            Session.Remove("member");
        //            Response.Redirect("~/Home.aspx", true);
        //        }
        //    }
        //    Session.Remove("member");
        //}

        //protected void btnProfile_Click(object sender, EventArgs e)
        //{
        //    RedirectToPage("MemberProfile.aspx");            
        //}

        //protected void btnGroup_Click(object sender, EventArgs e)
        //{
        //    RedirectToPage("MemberHome.aspx");
        //}

        private void RedirectToPage(string url)
        {
            try
            {
                if (url == "") return;

                member = (EZDiscuss.Classes.Member)Session["member"];
                if (member != null)
                {
                    if (member.memberId > 0)
                    {
                        memberId = Convert.ToInt64(member.memberId);
                        paddedMemberId = EZDiscuss.Classes.Helper.PadMemberId(memberId);
                        Response.Redirect(url + "?memberId=" + paddedMemberId.ToString());
                    }
                }
                else
                {
                    Response.Redirect(url + "?memberId=");
                }
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("SiteMember.Master", "RedirectToPage", ex.Message, memberId);
            }
        }

        protected void btnDiscussionBoard_Click(object sender, EventArgs e)
        {
            string currentPage = Session["CurrentPage"].ToString();
            if (currentPage != "DiscussionBoard.aspx")
                RedirectToPage("DiscussionBoard.aspx");
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            member = (EZDiscuss.Classes.Member)Session["member"];
            if (member != null)
            {
                EZDiscuss.Classes.Member memLogout = member.MemberLogout(member.email, member.password);
                if (memLogout.IsLogout == true)
                {
                    Session.Remove("member");
                    Response.Redirect("~/Home.aspx", true);
                }
            }
            Session.Remove("member");
        }

        protected void lnkProfile_Click(object sender, EventArgs e)
        {
            string currentPage = Session["CurrentPage"].ToString();
            if (currentPage != "MemberProfile.aspx")   
                RedirectToPage("MemberProfile.aspx");
        }

        protected void lnkCreateGroup_Click(object sender, EventArgs e)
        {
            string currentPage = Session["CurrentPage"].ToString();
            if (currentPage != "MemberHome.aspx")
                RedirectToPage("MemberHome.aspx");
        }

        protected void lnkDiscussionBoard_Click(object sender, EventArgs e)
        {
            string currentPage = Session["CurrentPage"].ToString();
            if (currentPage != "DiscussionBoard.aspx")
                RedirectToPage("DiscussionBoard.aspx");
        }
    }
}