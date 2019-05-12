using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;


namespace EZDiscuss.Classes
{
    public class EmailInvitation
    {
        public string FromAddress { get; set; }
        public string ToAddress { get; set; }
        public string EmailSubject { get; set; }
        public string EmailBody { get; set; }
                
        public void SendMail()
        {
            try
            {
                FromAddress = "arnoldgh@gmail.com";
                //ToAddress = "arnoldhiguit@hotmail.com";
                //EmailSubject = "Invitation to join discussion";
                //EmailBody = "Hi Arnold, please join me in the discussion. Click on the link <a href='http://localhost:19414/AcceptInvite.aspx?email=arnoldhiguit@hotmail.com'>Click here to confirm</a>";
                MailMessage mail = new MailMessage(FromAddress, ToAddress);
                mail.IsBodyHtml = true;
                mail.Body = EmailBody;
                mail.Subject = EmailSubject;
                
                SmtpClient smtp = new SmtpClient("smtp.gmail.com");
                smtp.EnableSsl = true;
                smtp.Credentials = new System.Net.NetworkCredential("arnoldgh", "Agh3967H1");
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("EmailInvitation.cs", "SendMail", ex.Message, 0);
            }
        }
    }
}