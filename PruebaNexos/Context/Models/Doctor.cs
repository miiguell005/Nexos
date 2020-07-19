using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaNexos.Context.Models
{
    public partial class Doctor
    {
        [Key]
        public int IdDoctor { set; get; }

        public int IdHospital { set; get; }

        public string Nombre { set; get; }

        public string Apellido { set; get; }

        public string Especialidad { set; get; }

        public string NumCredencial { set; get; }
        
        public virtual Hospital Hospital { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Atencion> Atencion { get; set; }
    }
}
