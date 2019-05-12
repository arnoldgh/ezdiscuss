using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace EZDiscuss.Interfaces
{
    interface IMessage
    {
        long MessageCreate();
        void MessageUpdate(long messageId, long memberId, long MessageId, string text);
        void MessageDelete(long memberId);
        DataTable MessageRetrieveByMemberId(long memberId);
        DataTable MessageRetrieveByMessageId(long messageId);
    }
}
