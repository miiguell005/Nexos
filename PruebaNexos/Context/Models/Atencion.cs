using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaNexos.Context.Models
{
    public partial class Atencion
    {
        [Key]
        public int IdAtencion { set; get; }

        public int IdDoctor { set; get; }

        public int IdPaciente { set; get; }
        
        public virtual Paciente Paciente{ get; set; }

        public virtual Doctor Doctor { get; set; }
    }
}
