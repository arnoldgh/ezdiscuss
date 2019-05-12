using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace EZDiscuss.Classes
{
    public class Topic : Helper, EZDiscuss.Interfaces.ITopic
    {
        public long topicId { get; set; }
        public long groupId { get; set; }
        public long memberId { get; set; }
        public string topicTitle { get; set; }
        public string topicDescription { get; set; }        
        public DateTime dateCreated { get; set; }

        #region Constructor

        public Topic()
        {
            groupId = 0;
            memberId = 0;
            topicTitle = string.Empty;
            topicDescription = string.Empty;            
            dateCreated = DateTime.Now;
        }

        #endregion

        #region Public Methods

        public DataTable TopicMembersRetrieve(long topicId)
        {            
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            DataTable dt = new DataTable();
            try
            {
                // Retrieve all Members of the Topic
                cmd.CommandText = "[dbo].[TopicMembersRetrieve]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@TopicID", SqlDbType.BigInt).Value = topicId;

                SqlDataAdapter da = new SqlDataAdapter(cmd);                
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Topic.cs", "TopicMembersRetrieve", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }
            return dt;
        }


        public long TopicCreate()
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            long topicId = 0;
            if (!IsDataGood())
                return 0;
            try
            {
                // Perform database insert
                cmd.CommandText = "dbo.TopicCreate";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@GroupId", SqlDbType.BigInt).Value = this.groupId;
                cmd.Parameters.Add("@MemberId", SqlDbType.BigInt).Value = this.memberId;
                cmd.Parameters.Add("@TopicTitle", SqlDbType.VarChar).Value = this.topicTitle;
                cmd.Parameters.Add("@TopicDescription", SqlDbType.VarChar).Value = this.topicDescription;

                cmd.Parameters.Add("@TopicID", SqlDbType.BigInt).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();

                topicId = Convert.ToInt64(cmd.Parameters["@TopicID"].Value);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Topic.cs", "TopicCreate", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }
            return topicId;
        }

        public void TopicUpdate(long topicId, string topicDescription)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();

            try
            {
                // Perform database update
                cmd.CommandText = "dbo.TopicUpdate";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@TopicID", SqlDbType.BigInt).Value = this.topicId;
                cmd.Parameters.Add("@TopicTitle", SqlDbType.VarChar).Value = this.topicTitle;
                cmd.Parameters.Add("@TopicDescription", SqlDbType.VarChar).Value = this.topicDescription;
                cmd.Parameters.Add("@UpdatedBy", SqlDbType.BigInt).Value = this.memberId;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Topic.cs", "TopicUpdate", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }
        }

        public void TopicDelete(long topicID)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();

            try
            {
                // Perform database delete
                cmd.CommandText = "dbo.TopicDelete";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@TopicID", SqlDbType.BigInt).Value = this.topicId;

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Topic.cs", "TopicDelete", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }
        }

        public DataTable TopicsRetrieveMessagesByTopicId(long topicID)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            DataTable dt = new DataTable();
            try
            {
                // Perform database retrieval
                cmd.CommandText = "dbo.MessagesRetrieveByTopicID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@TopicID", SqlDbType.BigInt).Value = topicID;

                SqlDataAdapter da = new SqlDataAdapter(cmd);                
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Topic.cs", "TopicsRetrieveMessagesByTopicId", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }

            return dt;
        }

        public DataTable TopicsRetrieveByMemberID(long memberID)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            DataTable dt = new DataTable();
            try
            {
                // Perform database retrieval
                cmd.CommandText = "dbo.TopicRetrieveByMemberID";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = memberID;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
               
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Topic.cs", "TopicsRetrieveByMemberID", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }
            return dt;
        }

        public DataTable TopicsRetrieveByGroupId(long groupId)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            DataTable dt = new DataTable();
            try
            {
                // Perform database retrieval
                cmd.CommandText = "dbo.TopicsRetrieveByGroupId";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@GroupId", SqlDbType.BigInt).Value = groupId;

                SqlDataAdapter da = new SqlDataAdapter(cmd);                
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Topic.cs", "TopicsRetrieveByGroupId", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }
            return dt;
        }

        private bool IsDataGood()
        {
            bool result = false;

            if (this.topicTitle == "")
                return result;

            // This is optional
            //if (this.topicDescription == "")
            //    return result;

            if (this.memberId <= 0)
                return result;

            return true;
        }
        #endregion
    }
}