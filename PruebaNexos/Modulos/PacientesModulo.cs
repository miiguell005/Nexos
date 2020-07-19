using ACTIVA_IT.WEB.Context;
using Microsoft.EntityFrameworkCore;
using PruebaNexos.Context.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaNexos.Modulos
{
    public class PacientesModulo
    {
        private readonly AppDbContext _context;

        public PacientesModulo(AppDbContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Consulta todos los pacientes
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Paciente> GetPaciente()
        {
            return _context.Paciente.Include("Atencion.Doctor");
        }

        /// <summary>
        /// Busca un paciente
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IEnumerable<Paciente> GetPaciente(int id)
        {
            var paciente = _context.Paciente.Include("Atencion.Doctor.Hospital")
                .Where(p => p.IdPaciente == id);

            if (paciente.Count() == 0)
                throw new Exception($"No se ha encontrado el paciente con Id {id}");

            return paciente;
        }

        /// <summary>
        /// Edita un paciente
        /// </summary>
        public Paciente PutPaciente(int id, Paciente pacienteDto)
        {
            if (id != pacienteDto.IdPaciente)
                throw new Exception($"Los ids no concuerdan, id {id}, IdPaciente {pacienteDto.IdPaciente}");

            var paciente = _context.Paciente.Find(id);

            if (paciente == null)
                throw new Exception($"No se ha encontrado el paciente con Id {id}");

            //Obtiene todos los ids de las atenciones
            var idsAtencione = pacienteDto.Atencion
                .Where(a => a.IdAtencion != 0).Select(a => a.IdAtencion).ToArray();

            var atenciones = new List<Atencion>();

            if (idsAtencione.Count() > 0)
                atenciones = _context.Atencion.Where(a => idsAtencione.Contains(a.IdAtencion)).ToList();
            
            //Edita, crea y elimina las atenciones
            foreach (var atencionDto in pacienteDto.Atencion)
            {
                //Crea una nueva atención
                if (atencionDto.IdAtencion == 0)
                    _context.Atencion.Add(atencionDto);

                else
                {
                    var a = atenciones.Where(_a => _a.IdAtencion == atencionDto.IdAtencion).FirstOrDefault();

                    //Elimina la atención
                    if (atencionDto.Eliminado == true)
                        _context.Atencion.Remove(a);

                    else
                        a.IdDoctor = atencionDto.IdDoctor;
                }
            }

            paciente.Apellido = pacienteDto.Apellido;
            paciente.CodigoPostal = pacienteDto.CodigoPostal;
            paciente.Nombre = pacienteDto.Nombre;
            paciente.NumSeguroSocial = pacienteDto.NumSeguroSocial;
            paciente.Telefono = pacienteDto.Telefono;

            _context.SaveChanges();

            return pacienteDto;
        }

        /// <summary>
        /// Crea un paciente
        /// </summary>
        /// <param name="paciente"></param>
        /// <returns></returns>
        public Paciente PostPaciente(Paciente paciente)
        {
            _context.Paciente.Add(paciente);
            _context.SaveChanges();

            return paciente;
        }

        /// <summary>
        /// Elimina un paciente
        /// </summary>
        public Paciente DeletePaciente(int id)
        {
            var paciente = _context.Paciente.Find(id);
            if (paciente == null)
                throw new Exception($"No se ha encontrado el paciente con Id {id}");

            _context.Paciente.Remove(paciente);
            _context.SaveChanges();

            return paciente;
        }

    }
}
