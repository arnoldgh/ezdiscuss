using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EZDiscuss.Interfaces
{
    public interface IPrivateMessage
    {
        long SendPrivateMessage(long senderId, long receiverId, string message);
    }
}
