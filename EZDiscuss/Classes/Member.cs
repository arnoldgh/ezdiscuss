using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace EZDiscuss.Classes
{
    public class Member : Helper, EZDiscuss.Interfaces.IMember
    {
        public long memberId { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public int gender { get; set; }
        public string photo { get; set; }           // This will be derived from email with just an additional extension (e.g. arnoldgh@gmail.com.jpg)
        public DateTime birthday { get; set; }
        public DateTime dateJoined { get; set; }
        public DateTime dateUpdated { get; set; }
        public int IsDeleted { get; set; }
        public bool IsLogin { get; set; }
        public DateTime DateLogin { get; set; }
        public bool IsLogout { get; set; }
        public DateTime DateLogout { get; set; }

        // Constructor
        public Member()
        {
            this.email = string.Empty;
            this.password = string.Empty;
            this.firstName = string.Empty;
            this.lastName = string.Empty;
            this.photo = string.Empty;
        }

        #region Public Meethods
        public EZDiscuss.Classes.Member MemberLogin(string email, string password)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            EZDiscuss.Classes.Member member = new Member();

            try
            {
                // Perform the database insert
                cmd.CommandText = "dbo.MemberLogin";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = email;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = password;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    member = FillMemberInfo(dt);
                }
                else
                    member = null;
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Member.cs", "MemberLogin", ex.Message, memberId); 
            }
            finally
            {
                cmd.Connection.Close();
            }
            return member;
        }

        public EZDiscuss.Classes.Member MemberLogout(string email, string password)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            EZDiscuss.Classes.Member member = new Member();

            try
            {
                // Perform the database insert
                cmd.CommandText = "dbo.MemberLogout";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = email;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = password;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);               

                if (dt.Rows.Count > 0)
                {
                    member = FillMemberInfo(dt);
                }
                else
                    member = null;
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Member.cs", "MemberLogout", ex.Message, memberId); 
            }
            finally
            {
                cmd.Connection.Close();
            }
            return member;
        }

        private EZDiscuss.Classes.Member FillMemberInfo(DataTable dt)
        {
            EZDiscuss.Classes.Member member = new EZDiscuss.Classes.Member();

            try
            {
                member.memberId = (long)dt.Rows[0]["MemberId"];
                member.email = dt.Rows[0]["Email"].ToString();
                member.password = dt.Rows[0]["Password"].ToString();
                member.firstName = dt.Rows[0]["Firstname"].ToString();
                member.lastName = dt.Rows[0]["Lastname"].ToString();
                member.dateJoined = (DateTime)dt.Rows[0]["DateJoined"];
                if (dt.Rows[0]["DateUpdated"] != null)
                {
                    member.dateUpdated = (DateTime)dt.Rows[0]["DateUpdated"];
                }
                
                member.IsDeleted = (int)dt.Rows[0]["IsDeleted"];
                member.IsLogin = (bool)dt.Rows[0]["IsLogin"];
                member.DateLogin = (DateTime)dt.Rows[0]["DateLogin"];
                member.IsLogout = (bool)dt.Rows[0]["IsLogout"];
                member.DateLogout = (DateTime)dt.Rows[0]["DateLogout"];
                member.photo = dt.Rows[0]["Photo"].ToString();
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Member.cs", "FillMemberInfo", ex.Message, memberId); 
            }

            return member;
        }

        public long MemberCreate()
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();

            if (!IsDataGood())
                return 0;

            try
            {
                // Perform the database insert
                cmd.CommandText = "dbo.MemberCreate";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = this.email;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = this.password;
                cmd.Parameters.Add("@Firstname", SqlDbType.VarChar).Value = this.firstName;
                cmd.Parameters.Add("@Lastname", SqlDbType.VarChar).Value = this.lastName;
                cmd.Parameters.Add("@Gender", SqlDbType.Int).Value = this.gender;
                cmd.Parameters.Add("@Birthday", SqlDbType.Date).Value = this.birthday;
                cmd.Parameters.Add("@Photo", SqlDbType.VarChar).Value = this.photo;
                cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();

                memberId = Convert.ToInt64(cmd.Parameters["@MemberID"].Value);                
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Member.cs", "MemberCreate", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }
            return memberId;
        }

        public void MemberUpdate()
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();

            try
            {
                cmd.CommandText = "dbo.MemberUpdate";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = this.memberId;
                cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = this.email;
                cmd.Parameters.Add("@Password", SqlDbType.VarChar).Value = this.password;
                cmd.Parameters.Add("@Firstname", SqlDbType.VarChar).Value = this.firstName;
                cmd.Parameters.Add("@Lastname", SqlDbType.VarChar).Value = this.lastName;
                cmd.Parameters.Add("@Gender", SqlDbType.Int).Value = this.gender;
                cmd.Parameters.Add("@Birthday", SqlDbType.Date).Value = this.birthday;
                cmd.Parameters.Add("@Photo", SqlDbType.VarChar).Value = this.photo;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Member.cs", "MemberUpdate", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }            
        }

        public void MemberPhotoUpload()
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();

            try
            {
                cmd.CommandText = "dbo.MemberPhotoUpload";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = this.memberId;
                cmd.Parameters.Add("@Photo", SqlDbType.VarChar).Value = this.photo;
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Member.cs", "MemberPhotoUpload", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }            
        }

        public void MemberDelete(long memberID)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();

            try
            {
                cmd.CommandText = "dbo.MemberDelete";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = this.memberId;

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Member.cs", "MemberPhotoUpload", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }
        }

        public DataTable MemberRetrieve(long memberID)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            DataTable dt = new DataTable();
            try
            {
                cmd.CommandText = "dbo.MemberRetrieve";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = this.memberId;

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(dt);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Member.cs", "MemberRetrieve", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }
            return dt;
        }

        public long IsMemberExisting(string emailAddress)
        {
            if (emailAddress == string.Empty)
                return 0;

            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            DataTable dt = new DataTable();

            try
            {
                cmd.CommandText = "[dbo].[MemberCheckByEmail]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@EmailAddress", SqlDbType.VarChar).Value = emailAddress;
                cmd.ExecuteNonQuery();

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);               
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Member.cs", "IsMemberExisting", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }

            if (dt.Rows.Count > 0)
                return Convert.ToInt64(dt.Rows[0]["MemberId"]);
            else
                return 0;
        }
        

        private bool IsDataGood()
        {
            bool result = false;

            if (this.email == string.Empty)
                return result;

            if (this.password == string.Empty)
                return result;

            if (this.firstName == string.Empty)
                return result;

            if (this.lastName == string.Empty)
                return result;

            if (this.gender == 0)
                return result;

            if (this.birthday == null)
                return result;

            return true;
        }

        #endregion
    }
}