using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace EZDiscuss.Classes
{
    public class PrivateMessage : EZDiscuss.Interfaces.IPrivateMessage
    {

        public PrivateMessage()
        {

        }

        public long SendPrivateMessage(long senderId, long receiverId, string message)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            long privateMessageId = 0;

            try
            {
                // Perform database retrieval
                cmd.CommandText = "dbo.PrivateMessageCreate";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@SenderID", SqlDbType.BigInt).Value = senderId;
                cmd.Parameters.Add("@ReceiverID", SqlDbType.BigInt).Value = receiverId;
                cmd.Parameters.Add("@Message", SqlDbType.VarChar).Value = message;
                cmd.Parameters.Add("@PrivateMessageID", SqlDbType.BigInt).Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();

                privateMessageId = Convert.ToInt64(cmd.Parameters["@PrivateMessageID"].Value);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("PrivateMessage.cs", "SendPrivateMessage", ex.Message, senderId);
            }
            finally
            {
                cmd.Connection.Close();
            }
            return privateMessageId;
        }


        public DataTable RetrievePrivateMessage(long memberId)
        {
            SqlCommand cmd = EZDiscuss.Classes.Helper.GetCommand();
            DataTable dt = new DataTable();
            try
            {
                // Perform database retrieval
                cmd.CommandText = "[dbo].[PrivateMessageRetrieveByMemberID]";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MemberID", SqlDbType.BigInt).Value = memberId;                
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("PrivateMessage.cs", "RetrievePrivateMessage", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }
            return dt;
        }
    }
}