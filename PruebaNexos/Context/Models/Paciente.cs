using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaNexos.Context.Models
{
    public partial class Paciente
    {
        [Key]
        public int IdPaciente { get; set; }

        public string Nombre { get; set; }

        public string Apellido { get; set; }

        public string NumSeguroSocial { get; set; }

        public string CodigoPostal { get; set; }

        public string Telefono { get; set; }
        
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Atencion> Atencion { get; set; }
    }
}
