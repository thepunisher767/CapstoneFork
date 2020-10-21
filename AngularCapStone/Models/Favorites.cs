using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper.Contrib.Extensions;

namespace AngularCapStone.Models
{
    [Table("Favorites")]
    public class Favorites
    {
        public long qID { get; set; }
        public string userID { get; set; }
    }
}
