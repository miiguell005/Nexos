using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ACTIVA_IT.WEB.Context;
using PruebaNexos.Context.Models;
using Microsoft.Extensions.Logging;
using PruebaNexos.Modulos;
using PruebaNexos.Servicios;
using Microsoft.Extensions.DependencyInjection;

namespace PruebaNexos.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DoctoresController : ControllerBase
    {
        //Controla el log
        private readonly ILog log;

        private DoctoresModulo modulo;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="context"></param>
        /// <param name="logger"></param>
        public DoctoresController(AppDbContext context, ILog log)
        {
            modulo = new DoctoresModulo(context);

            this.log = log;
        }

        /// <summary>
        /// Consulta todos los doctores
        /// </summary>
        /// <returns></returns>
        // GET: api/Doctores
        [HttpGet("Hospitales")]
        public IEnumerable<Hospital> GetHospitales()
        {
            this.log.Info("Consultando todos los hospitales");

            return modulo.GetHospitales();

        }
        /// <summary>
        /// Consulta todos los doctores
        /// </summary>
        /// <returns></returns>
        // GET: api/Doctores
        [HttpGet]
        public IEnumerable<Doctor> GetDoctor()
        {
            this.log.Info("Consultando todos los doctores");

            return modulo.GetDoctor();
        }

        /// <summary>
        /// Crea nuevos doctores
        /// </summary>
        /// <param name="doctorDto"></param>
        /// <returns></returns>
        // POST: api/Doctores
        [HttpPost]
        public Doctor PostDoctor(Doctor doctorDto)
        {
            try
            {
                var doctor = modulo.PostDoctor(doctorDto);

                this.log.Info($"Se ha creado el doctor con id {doctorDto.IdDoctor}");

                return new Doctor()
                {
                    IdDoctor = doctor.IdDoctor,
                    Apellido = doctor.Apellido,
                    Especialidad = doctor.Especialidad,
                    IdHospital = doctor.IdHospital,
                    Nombre = doctor.Nombre,
                    NumCredencial = doctor.NumCredencial,
                    Atencion = doctor.Atencion.Select(a => new Atencion
                    {
                        IdAtencion = a.IdAtencion,
                        IdDoctor = a.IdDoctor,
                        IdPaciente = a.IdPaciente,
                        Eliminado = false
                    }).ToArray()
                };
            }
            catch (Exception ex)
            {
                this.log.Error("Error al crear al el doctor", ex);

                throw new Exception("", ex);
            }
        }
    }
}
