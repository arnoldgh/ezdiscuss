using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EZDiscuss
{
    public partial class MemberMessages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["CurrentPage"] = "MemberMessages.aspx";

            //if (Request.QueryString["MemberId"] != null)
            //{
                //long memberId = Convert.ToInt64(Request.QueryString["MemberId"]);
                long memberId = 2;
                long topicId = 1;
                DisplayMessages(memberId, topicId);
            //}
        }

        private void DisplayMessages(long memberId, long topicId)
        {            
            EZDiscuss.Classes.Message messages = new Classes.Message();
            DataTable dt = messages.MessageRetrieveByMemberIdAndTopicId(memberId, topicId);
            rMemberMessages.DataSource = dt;
            rMemberMessages.DataBind();
        }
    }
}