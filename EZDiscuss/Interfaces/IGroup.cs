using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace EZDiscuss.Interfaces
{
    interface IGroup
    {
        long GroupCreate();
        long GroupMemberCreate(long groupId, long memberId);
        void GroupUpdate(long groupId, string groupName, int groupType, string groupDescription, long memberId);
        void GroupDelete(long groupId);
        DataTable GroupRetrieve(long groupId);
        DataTable GroupMembersRetrieve(long groupId);
        DataSet RetrieveAllGroups(long memberId);

    }
}
