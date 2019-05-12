using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace EZDiscuss.Classes
{
    public class Group : Helper, EZDiscuss.Interfaces.IGroup
    {
        public long groupId { get; set; }
        public string groupName { get; set; }
        public string groupDescription { get; set; }
        public int groupType { get; set; }
        public DateTime dateCreated { get; set; }
        public long memberId { get; set; }
        public DateTime dateUpdated { get; set; }
        public long updatedBy { get; set; }

        #region Constructor

        public Group()
        {
            this.groupName = string.Empty;
            this.groupDescription = string.Empty;
            this.groupType = 1;
            dateCreated = DateTime.Now;
            this.memberId = 0;
        }

        #endregion

        #region Public Methods

        public long GroupCreate()
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();

            try
            {
                if (!IsDataGood())
                    return 0;

                // Perform database insert
                cmd.CommandText = "dbo.GroupCreate";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@GroupName", SqlDbType.VarChar).Value = this.groupName;
                cmd.Parameters.Add("@GroupDescription", SqlDbType.VarChar).Value = this.groupDescription;
                cmd.Parameters.Add("@GroupType", SqlDbType.Int).Value = this.groupType;
                cmd.Parameters.Add("@MemberId", SqlDbType.BigInt).Value = this.memberId;
                cmd.Parameters.Add("@GroupID", SqlDbType.BigInt).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();

                groupId = Convert.ToInt64(cmd.Parameters["@GroupID"].Value);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Group.cs", "GroupCreate", ex.Message, memberId);                
            }
            finally
            {
                cmd.Connection.Close();
            }

            return groupId;
        }


        public long GroupMemberCreate(long groupId, long memberId)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            long groupMemberId = 0;

            try
            {
                // Perform database insert
                cmd.CommandText = "[dbo].[GroupMemberCreate]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@GroupId", SqlDbType.BigInt).Value = groupId;
                cmd.Parameters.Add("@MemberId", SqlDbType.VarChar).Value = memberId;
                cmd.Parameters.Add("@GroupMemberID", SqlDbType.BigInt).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();

                groupMemberId = Convert.ToInt64(cmd.Parameters["@GroupMemberID"].Value);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Group.cs", "GroupMemberCreate", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }

            return groupMemberId;
        }

        public void GroupUpdate(long groupId, string groupName, int groupType, string groupDescription, long memberId)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();

            try
            {
                // Perform database update
                cmd.CommandText = "dbo.GroupUpdate";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@GroupID", SqlDbType.BigInt).Value = groupId;
                cmd.Parameters.Add("@GroupName", SqlDbType.VarChar).Value = groupName;
                cmd.Parameters.Add("@GroupType", SqlDbType.Int).Value = groupType;
                cmd.Parameters.Add("@GroupDescription", SqlDbType.VarChar).Value = groupDescription;
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = memberId;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Group.cs", "GroupUpdate", ex.Message, memberId);                
            }
            finally
            {
                cmd.Connection.Close();
            }
        }

        public void GroupDelete(long groupId)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            
            try
            {
                // Perform database delete
                cmd.CommandText = "dbo.GroupDelete";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@GroupID", SqlDbType.BigInt).Value = groupId;

                cmd.ExecuteNonQuery();                
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Group.cs", "GroupDelete", ex.Message, memberId); 
            }
            finally
            {
                cmd.Connection.Close();
            }
        }

        public DataTable GroupRetrieve(long groupId)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            DataTable dt = new DataTable();

            try
            {
                // Perform database retrieval
                cmd.CommandText = "dbo.GroupRetrieve";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@GroupID", SqlDbType.BigInt).Value = groupId;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);                
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Group.cs", "GroupRetrieve", ex.Message, memberId); 
            }
            finally
            {
                cmd.Connection.Close();
            }
            return dt;
        }

        public DataTable GroupMembersRetrieve(long groupId)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            DataTable dt = new DataTable();

            try
            {
                // Perform database retrieval
                cmd.CommandText = "dbo.GroupMembersRetrieve";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@GroupID", SqlDbType.BigInt).Value = groupId;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Group.cs", "GroupMembersRetrieve", ex.Message, memberId); 
            }
            finally
            {
                cmd.Connection.Close();
            }
            return dt;
        }

        public DataSet RetrieveAllGroups(long memberId)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            DataSet ds = new DataSet();

            try
            {
                cmd.CommandText = "[dbo].[GroupRetrieveAllByMemberId]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MemberId", SqlDbType.BigInt).Value = memberId;

                SqlDataAdapter da = new SqlDataAdapter(cmd);                
                da.Fill(ds);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Group.cs", "RetrieveAllGroups", ex.Message, memberId); 
            }
            finally
            {
                cmd.Connection.Close();
            }
            return ds;
        }


        private bool IsDataGood()
        {
            bool result = false;

            if (this.groupName == "")
                return result;

            //if (this.groupDescription == "")
            //    return result;

            //if (this.groupType == 0)
            //    return result;

            if (this.memberId <= 0)
                return result;

            return true;
        }


        #endregion

        #region Helper Methods

        #endregion

        //// Constructor
        //public Group()
        //{
        //    this.dateCreated = DateTime.Now;
        //}

        //// Public Methods TODO:
        //public Group getGroupDetails(long groupId)
        //{
        //    return this;
        //}

        //public List<long> getGroupMembers(long groupId)
        //{
        //    List<long> members = new List<long>();
        //    return members;
        //}


    }
}