using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace EZDiscuss.UserControls
{
    public partial class ucMemberProfile : System.Web.UI.UserControl
    {

        public string FirstName { get; set; }
        public long MemberId { get; set; }
        public int Gender { get; set; }
        public string Photo { get; set; }
        public long TopicId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //ActivateControl();
           
        }

        public void Initialize()
        {
            mv.ActiveViewIndex = 1;
            iMP.ToolTip = "";
            lMP.Text = "available";
            divMP.Attributes.Add("class", "mProfileContainer mProfileAvailable");
            iMP.ImageUrl = "~/Images/user.png";
        }


        public void ActivateControl(bool withPhoto)
        {
            //hMemberId.Value = this.MemberId;
            //hTopicId.Value = this.TopicId;
            try
            {
                if (withPhoto)
                {
                    mv.ActiveViewIndex = 0;
                    iPhoto.ImageUrl = "~/Photos/" + this.Photo;
                    //iPhoto.Attributes.Add("MemberId", this.MemberId);
                    //iPhoto.Attributes.Add("TopicId", this.TopicId);

                    if (FirstName != null)
                    {
                        lMP.Text = FirstName;
                        iMP.ToolTip = FirstName;

                        switch (this.Gender)
                        {
                            case 1:
                                iMP.ImageUrl = "~/Images/user_male_olive_blue_black.png";
                                iMP.Attributes.Add("MemberId", this.MemberId.ToString());
                                divMP.Attributes.Add("class", "mProfileContainer mProfileMale");
                                break;
                            case 2:
                                iMP.ImageUrl = "~/Images/user_female_white_pink_ginger.png";
                                iMP.Attributes.Add("MemberId", this.MemberId.ToString());
                                divMP.Attributes.Add("class", "mProfileContainer mProfileFemale");
                                break;
                            default:
                                divMP.Attributes.Add("class", "mProfileContainer mProfileAvailable");
                                iMP.ImageUrl = "~/Images/user.png";
                                break;
                        }

                        // Retrieve the Messages this Member posted for this Topic
                        EZDiscuss.Classes.Message msg = new Classes.Message();
                        DataTable dt = new DataTable();
                        dt = msg.MessageRetrieveByMemberIdAndTopicId(MemberId, TopicId);
                        if (dt.Rows.Count > 0)
                        {
                            string msgTitle = string.Empty;
                            // Loop through the datatable and create a tooltip
                            StringBuilder sb = new StringBuilder();
                            if (dt.Rows.Count == 1)
                            {
                                sb.Append(FirstName + "'s comment on this Topic: \n\n");
                                msgTitle = "Comment";
                            }
                            else
                            {
                                sb.Append(FirstName + "'s comments on this Topic: \n\n");
                                msgTitle = "Comments";
                            }

                            string dateTitle = "Date";

                            sb.Append(dateTitle + "\t\t\t" + " " + msgTitle + "\n");
                            foreach (DataRow dr in dt.AsEnumerable())
                            {
                                string msgDate = dr["DateCreated"].ToString();
                                string message = dr["Message"].ToString();
                                sb.Append(msgDate + "  " + message + "\n");
                            }

                            iPhoto.ToolTip = sb.ToString();
                        }

                    }
                    else
                    {
                        iMP.ToolTip = "";
                        lMP.Text = "available";
                        divMP.Attributes.Add("class", "mProfileContainer mProfileAvailable");
                        iMP.ImageUrl = "~/Images/user.png";
                    }

                }
                else
                {
                    mv.ActiveViewIndex = 1;

                    if (FirstName != null)
                    {
                        lMP.Text = FirstName;

                        switch (this.Gender)
                        {
                            case 1:
                                iMP.ImageUrl = "~/Images/user_male_olive_blue_black.png";
                                iMP.Attributes.Add("MemberId", this.MemberId.ToString());
                                divMP.Attributes.Add("class", "mProfileContainer mProfileMale");
                                break;
                            case 2:
                                iMP.ImageUrl = "~/Images/user_female_white_pink_ginger.png";
                                iMP.Attributes.Add("MemberId", this.MemberId.ToString());
                                divMP.Attributes.Add("class", "mProfileContainer mProfileFemale");
                                break;
                            default:
                                divMP.Attributes.Add("class", "mProfileContainer mProfileAvailable");
                                iMP.ImageUrl = "~/Images/user.png";
                                break;
                        }
                    }
                    else
                    {
                        lMP.Text = "available";
                        divMP.Attributes.Add("class", "mProfileContainer mProfileAvailable");
                        iMP.ImageUrl = "~/Images/user.png";
                    }
                }
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("ucMemberProfile.ascx.cs", "ActivateControl", ex.Message, this.MemberId);
            }
        }

        //protected void iMP_Click(object sender, ImageClickEventArgs e)
        //{
        //    ImageButton iB = (ImageButton)sender;
        //    long memberId = Convert.ToInt64(iB.Attributes["MemberId"]);
        //    string memId = memberId.ToString();


        //}
    }
}