using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Configuration;

namespace EZDiscuss.UserControls
{
    public partial class ucRegistrationForm : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMonths();
                LoadDays();
                LoadYears();
            }
        }

        private void LoadMonths()
        {
            string[] months = { "Month", "Jan", "Feb", "Mar", "Apr", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
                       
            ddlMonth.Items.Clear();
            ddlMonth.DataSource = months;
            ddlMonth.DataBind();
        }

        private void LoadDays()
        {
            ArrayList days = new ArrayList();
            days.Add("Day");
            for (int i = 1; i != 32; i++)
            {
                days.Add(i);
            }
            ddlDay.Items.Clear();
            ddlDay.DataSource = days;
            ddlDay.DataBind();
        }

        private void LoadYears()
        {                        
            ArrayList years = new ArrayList();
            years.Add("Year");
            // From 1900 to at least 4 years old
            for (int i = DateTime.Now.Year-4; i != 1899; i--)
            {
                years.Add(i);
            }            
            ddlYear.Items.Clear();
            ddlYear.DataSource = years;
            ddlYear.DataBind();
        }

        protected void bSubmit_Click(object sender, EventArgs e)
        {
            processRegistration();
        }

        private void processRegistration()
        {
            try
            {
                long memberId = 0;
                string paddedMemberId = string.Empty;
                string url = string.Empty;

                string email = tEmail.Text.Trim();
                string password = tPwd.Text.Trim();
                string firstName = tFN.Text.Trim();
                string lastName = tLN.Text.Trim();

                string birthday = GetBirthday();
                if (birthday == "")
                    return;

                int gender = GetGender();
                if (gender == 0)
                {
                    lGender.ForeColor = System.Drawing.Color.Red;
                    return;
                }
                else
                    lGender.ForeColor = System.Drawing.Color.Black;
            
                EZDiscuss.Classes.Member member = new Classes.Member();
                member.email = email;
                member.firstName = firstName;
                member.lastName = lastName;
                member.password = password;

                IFormatProvider culture = new System.Globalization.CultureInfo("en-US", true);
                member.birthday = Convert.ToDateTime(birthday, culture);
                member.gender = gender;
                long result = member.MemberCreate();
                if (result > 0)
                {
                    lMessage.Text = "Registration was completed successfully!";

                    //SendConfirmationEmail();
                    ClearValues();

                    Session["member"] = member;

                    // Redirect to the MemberHome page
                    memberId = Convert.ToInt64(member.memberId);
                    paddedMemberId = EZDiscuss.Classes.Helper.PadMemberId(memberId);
                    url = "~/MemberHome.aspx?memberId=" + paddedMemberId.ToString();
                    Response.Redirect(url, true);
                    
                    //Response.Redirect("~/MemberHome.aspx", true);
                }
                else
                {
                    lMessage.Text = "Email Address already exist. Registration unsuccessful.";
                    lMessage.ForeColor = System.Drawing.Color.Red;
                    lMessage.BackColor = System.Drawing.Color.White;
                }
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("ucRegistrationForm.ascx.cs", "processRegistration", ex.Message, 0);
            }
        }

        private void SendConfirmationEmail()
        {
            try
            {
                EZDiscuss.Classes.EmailInvitation mail = new Classes.EmailInvitation();
                mail.ToAddress = tEmail.Text.Trim();
                mail.EmailSubject = ConfigurationManager.AppSettings["welcomeSubject"].ToString();
                string userName = tEmail.Text.Trim();
                string password = tPwd.Text.Trim();
                string messageBody = ConfigurationManager.AppSettings["welcomeMessage"].ToString();
                messageBody += Environment.NewLine + "Account details:" + Environment.NewLine;
                messageBody += "UserName: " + userName + Environment.NewLine;
                messageBody += "Password: " + password + Environment.NewLine + Environment.NewLine + Environment.NewLine;
                messageBody += "Best Regards," + Environment.NewLine;
                messageBody += "Test Team" + Environment.NewLine;
                //messageBody += "EZDiscuss Team" + Environment.NewLine;
                mail.EmailBody = Server.HtmlEncode(messageBody);
                
                mail.SendMail();

            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("ucRegistrationForm.ascx.cs", "SendConfirmationEmail", ex.Message, 0);
            }
        }

        private void ClearValues()
        {
            tEmail.Text = tPwd.Text = tFN.Text = tLN.Text = "";
            ddlMonth.SelectedIndex = ddlDay.SelectedIndex = ddlYear.SelectedIndex = 0;
            rMale.Checked = rFemale.Checked = false;           
        }


        private string GetBirthday()
        {
            string month = ddlMonth.SelectedIndex.ToString();
            if (month == "0")
            {
                ddlMonth.BorderColor = System.Drawing.Color.Red;
                ddlMonth.ToolTip = "Please select Month";
                return "";
            }
            else
                ddlMonth.BorderColor = System.Drawing.Color.Transparent;

            string day = ddlDay.SelectedItem.ToString();
            if (day == "0")
            {
                ddlDay.BorderColor = System.Drawing.Color.Red;
                ddlDay.ToolTip = "Please select Day";
                return "";
            }
            else
                ddlDay.BorderColor = System.Drawing.Color.Transparent;

            string year = ddlYear.SelectedItem.ToString();
            if (year == "0")
            {
                ddlYear.BorderColor = System.Drawing.Color.Red;
                ddlYear.ToolTip = "Please select Year";
                return "";
            }
            else
                ddlYear.BorderColor = System.Drawing.Color.Transparent;

            return month + "-" + day + "-" + year;
        }


        private int GetGender()
        {
            int gender = 0;
            if (rMale.Checked)
                gender = 1;

            if (rFemale.Checked)
                gender = 2;

            return gender;
        }

        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlMonth.SelectedIndex == 0)
                ddlMonth.BorderColor = System.Drawing.Color.Red;
            else
                ddlMonth.BorderColor = System.Drawing.Color.Transparent;
        }

        protected void ddlDay_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDay.SelectedIndex == 0)
                ddlDay.BorderColor = System.Drawing.Color.Red;
            else
                ddlDay.BorderColor = System.Drawing.Color.Transparent;
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlYear.SelectedIndex == 0)
                ddlYear.BorderColor = System.Drawing.Color.Red;
            else
                ddlYear.BorderColor = System.Drawing.Color.Transparent;
        }
    }
}