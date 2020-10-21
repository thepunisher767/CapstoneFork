using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Dapper.Contrib.Extensions;


namespace AngularCapStone.Models
{
    [Table("QandA")]
    public class QandA
    {
        [Key]
        public long Id { get; set; }

        public string Question { get; set; }
        public string Answer { get; set; }

    }
}
