using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Collections;

namespace EZDiscuss.Classes
{
    public class Helper
    {
        public static SqlCommand GetCommand()
        {
            SqlConnection conn = GetConnection();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            conn.Open();
            return cmd;
        }

        private static SqlConnection GetConnection()
        {
            SqlConnection conn = new SqlConnection(GetConnectionString());
            return conn;
        }

        private static string GetConnectionString()
        {
            string connString = ConfigurationManager.ConnectionStrings["Dev"].ToString();

            return connString;
        }

        public DataTable GetStatistics()
        {
            SqlCommand cmd = GetCommand();
            DataTable dt = new DataTable();

            try
            {
                cmd.CommandText = "dbo.GetStatistics";
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Helper.cs", "GetStatistics", ex.Message, 0);
            }
            finally
            {
                cmd.Connection.Close();
            }            
            return dt;
        }

        public static string PadMemberId(long memberId)
        {
            if (memberId <= 0) return "";

            string paddedMemberId = string.Empty;
            try
            {
                string preSalt = ConfigurationManager.AppSettings.GetValues("PreSalt").First().ToString();
                string postSalt = ConfigurationManager.AppSettings.GetValues("PostSalt").First().ToString();
                paddedMemberId = preSalt + memberId.ToString() + postSalt;
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Helper.cs", "PadMemberId", ex.Message, memberId);
            }
                
            return paddedMemberId;
        }

        public static long UnPadMemberId(string paddedMemberId)
        {
            if (paddedMemberId.Length <= 0) return 0;
                
            long memberId = 0;
            try
            {
                string removedPreSalt = paddedMemberId.Substring(51);
                string sMemberId = removedPreSalt.Substring(0, removedPreSalt.Length - 51);

                memberId = Convert.ToInt64(sMemberId);
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Helper.cs", "UnPadMemberId", ex.Message, memberId);
            }

            return memberId;
        }

        public static void LogError(string pageName, string methodName, string errorMessage, long memberId)
        {
            SqlCommand cmd = GetCommand();

            try
            {
                // Perform database insert
                cmd.CommandText = "dbo.LogError";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@PageName", SqlDbType.VarChar).Value = pageName;
                cmd.Parameters.Add("@MethodName", SqlDbType.VarChar).Value = methodName;
                cmd.Parameters.Add("@ErrorMessage", SqlDbType.VarChar).Value = errorMessage;
                cmd.Parameters.Add("@CreatedBy", SqlDbType.BigInt).Value = memberId;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                EZDiscuss.Classes.Helper.LogError("Helper.cs", "LogError", ex.Message, memberId);
            }
            finally
            {
                cmd.Connection.Close();
            }
        }
    }
}