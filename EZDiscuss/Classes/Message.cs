using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace EZDiscuss.Classes
{
    public class Message : Helper, EZDiscuss.Interfaces.IMessage
    {
        public long messageId { get; set; }
        public long topicId { get; set; }
        public long memberId { get; set; }
        public string text { get; set; } 
        public DateTime dateCreated { get; set; }

        #region Contructor
        
        public Message()
        {
            messageId = 0;
            topicId = 0;
            memberId = 0;            

            text = string.Empty;
            dateCreated = DateTime.Now;
        }

        #endregion

        #region Public Methods

        public long MessageCreate()
        {
            if (!IsDataGood())
                return 0;

            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();

            try
            {
                // Perform database insert
                cmd.CommandText = "dbo.MessageCreate";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@TopicId", SqlDbType.BigInt).Value = this.topicId;
                cmd.Parameters.Add("@MemberId", SqlDbType.BigInt).Value = this.memberId;
                cmd.Parameters.Add("@Message", SqlDbType.VarChar).Value = this.text;
                cmd.Parameters.Add("@MessageId", SqlDbType.BigInt).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();

                messageId = Convert.ToInt64(cmd.Parameters["@MessageId"].Value);                
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Message.cs", "MessageCreate", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }
            return messageId;
        }

        public void MessageUpdate(long messageId, long memberId, long MessageId, string text)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();

            try
            {
                // Perform database update
                cmd.CommandText = "dbo.MessageUpdate";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MessageId", SqlDbType.BigInt).Value = this.messageId;
                cmd.Parameters.Add("@TopicId", SqlDbType.BigInt).Value = this.topicId;
                cmd.Parameters.Add("@MemberId", SqlDbType.BigInt).Value = this.memberId;
                cmd.Parameters.Add("@Text", SqlDbType.VarChar).Value = this.text;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Message.cs", "MessageUpdate", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }
        }

        public void MessageDelete(long memberId)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();

            try
            {
                // Perform database delete
                cmd.CommandText = "dbo.MessageDelete";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MessageID", SqlDbType.BigInt).Value = this.messageId;

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Message.cs", "MessageDelete", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }            
        }

        public DataTable MessageRetrieveByMemberId(long memberId)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            DataTable dt = new DataTable();
            try
            {
                // Perform database retrieval
                cmd.CommandText = "dbo.MessageRetrieveByMemberId";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MemberId", SqlDbType.BigInt).Value = memberId;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Message.cs", "MessageRetrieveByMemberId", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }
            return dt;
        }

        public DataTable MessageRetrieveByMessageId(long messageId)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            DataTable dt = new DataTable();

            try
            {
                // Perform database retrieval
                cmd.CommandText = "dbo.MessageRetrieveByMessageId";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MessageId", SqlDbType.BigInt).Value = messageId;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Message.cs", "MessageRetrieveByMemberId", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }
            return dt;
        }

        public DataTable MessageRetrieveByMemberIdAndTopicId(long memberId, long topicId)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            DataTable dt = new DataTable();

            try
            {
                // Perform database retrieval
                cmd.CommandText = "[dbo].[MessagesRetrieveByMemberIDAndTopicID]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MemberId", SqlDbType.BigInt).Value = memberId;
                cmd.Parameters.Add("@TopicId", SqlDbType.BigInt).Value = topicId;

                SqlDataAdapter da = new SqlDataAdapter(cmd);                
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Message.cs", "MessageRetrieveByMemberIdAndTopicId", ex.Message, memberId);
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

            if (this.topicId <= 0)
                return result;

            if (this.memberId <= 0)
                return result;

            if (this.text.Trim() == string.Empty)
                return result;

            return true;
        }

        #endregion

    }
}