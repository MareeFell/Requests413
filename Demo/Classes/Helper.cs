using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo.Classes
{
    public class Helper
    {
        // объект для связи с БД
        public static Model.demoEntities DB { get; set; }
        //объект пользователь, вошедший в систему
        public static Model.Users user;
    }
}
