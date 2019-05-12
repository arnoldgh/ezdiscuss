using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EZDiscuss.UserControls
{
    public partial class ucGroup : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bG_Click(object sender, EventArgs e)
        {
            CreateGroup();
        }

        private void CreateGroup()
        {
            long memberId = 0;

            try
            {
                string paddedMemberId = Request.QueryString["MemberId"];
                memberId = EZDiscuss.Classes.Helper.UnPadMemberId(paddedMemberId);

                if (memberId > 0)
                {
                    Classes.Group grp = new Classes.Group();
                    grp.memberId = memberId;
                    grp.groupName = tG.Text.Trim();
                    grp.groupDescription = tD.Text.Trim();
                    long groupId = grp.GroupCreate();
                    if (groupId > 0)
                    {
                        lM.Visible = true;
                        lM.Text = "Group created successfully.";
                        lM.CssClass = "successMessage";
                    }
                    else
                    {
                        lM.Visible = true;
                        lM.Text = "Group was not created successfully.";
                        lM.CssClass = "errorMessage10";
                    }
                }
                else
                {
                    lM.Text = "Invalid Member.";
                }
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("ucGroup", "CreateGroup", ex.Message, memberId);
            }
        }
    }
}