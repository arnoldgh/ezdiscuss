using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace EZDiscuss.Interfaces
{
    interface IMember 
    {        
        EZDiscuss.Classes.Member MemberLogin(string email, string password);
        //DataTable MemberLogin(string email, string password);
        long MemberCreate();
        void MemberUpdate();
        //void MemberUpdate(long memberID, string password, string firstName, string lastName, string userName, int gender, DateTime birthday);
        void MemberDelete(long memberID);
        DataTable MemberRetrieve(long memberID);
        long IsMemberExisting(string emailAddress);
    }
}
