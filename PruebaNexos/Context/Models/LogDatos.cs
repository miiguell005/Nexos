using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaNexos.Context.Models
{
    public partial class LogDatos
    {
        [Key]
        public int IdLog { set; get; }

        public string Evento { set; get; }

        public string Mensaje { set; get; }

        public DateTime Fecha { set; get; }

        public string Excepcion { set; get; }
    }
}
