using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EZDiscuss.UserControls
{
    public partial class ucStatistics : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                GetStatistics();
        }

        private void GetStatistics()
        {
            DataTable dt = new DataTable();
            EZDiscuss.Classes.Helper helper = new Classes.Helper();
            dt = helper.GetStatistics();
            if (dt.Rows.Count > 0)
            {
                // Bind the values to the table
                lGroupsNum.Text = dt.Rows[0]["GroupCount"].ToString();
                lMembersNum.Text = dt.Rows[0]["MemberCount"].ToString();
                lTopicsNum.Text = dt.Rows[0]["TopicCount"].ToString();
                lMessagesNum.Text = dt.Rows[0]["MessageCount"].ToString();
            }
        }
    }
}