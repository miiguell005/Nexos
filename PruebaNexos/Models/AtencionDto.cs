using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaNexos.Context.Models
{
    public partial class Atencion
    {
        [NotMapped]
        public bool Eliminado { set; get; }
    }
}
