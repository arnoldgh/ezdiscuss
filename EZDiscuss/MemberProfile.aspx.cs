using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace EZDiscuss
{
    public partial class MemberProfile : System.Web.UI.Page
    {

        Classes.Member member = new Classes.Member();
        string Photo = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["CurrentPage"] = "MemberProfile.aspx";

                member = (Classes.Member)Session["member"];
                if (member != null)
                {
                    PopulateControls(member);
                }
            }
        }

        private void PopulateControls(Classes.Member member)
        {
            if (member != null)
            {
                tFname.Text = member.firstName;
                tLName.Text = member.lastName;
                tEmail.Text = member.email;
                imgProfile.ImageUrl = "~/Photos/" + member.photo;                
            }
        }

        protected void bUpload_Click(object sender, EventArgs e)
        {
            if (fUpload.HasFile)
            {
                if (fUpload.PostedFile.ContentType == "image/jpeg" || fUpload.PostedFile.ContentType == "image/jpg" || fUpload.PostedFile.ContentType == "image/gif" || fUpload.PostedFile.ContentType == "image/png")
                {
                    if (fUpload.PostedFile.ContentLength <= 102400)
                    {
                        string fileName = Path.GetFileName(fUpload.FileName);
                        string[] fnames = fileName.Split('.');
                        Photo = member.email + "." + fnames[1].ToString();

                        // Get the Member's info and upload the file
                        member.memberId = member.memberId;
                        member.photo = Photo;
                        member.MemberPhotoUpload();

                        fUpload.SaveAs(Server.MapPath("~/Photos/") + Photo);

                        imgProfile.ImageUrl = "~/Photos/" + Photo;
                        lMessage.Text = "Upload completed successfully.";
                    }
                    else
                    {
                        lMessage.Text = "File exceeded allowed size. Please uplload Photo with size less than 100kb";
                    }
                }
                else
                {
                    lMessage.Text = "Only file with extension jpg/gif/png is accepted.";
                }
            }
        }

        protected void bSave_Click(object sender, EventArgs e)
        {
            // TODO: Save the PhotoName in DB (Member Table)
            //member.email = tEmail.Text.Trim();            
            //member.firstName = tFname.Text.Trim();
            //member.lastName = tLName.Text.Trim();
            member.photo = Photo;
            member.MemberPhotoUpload();
        }

        protected void btnUpdateInfo_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancelInfo_Click(object sender, EventArgs e)
        {

        }

    }
}