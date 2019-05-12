using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace EZDiscuss.Interfaces
{
    interface ITopic
    {
        DataTable TopicMembersRetrieve(long topicId);
        long TopicCreate();
        void TopicUpdate(long topicId, string topicDescription);
        void TopicDelete(long topicID);
        DataTable TopicsRetrieveMessagesByTopicId(long topicID);
        DataTable TopicsRetrieveByMemberID(long memberID);
        DataTable TopicsRetrieveByGroupId(long groupId);

    }
}
