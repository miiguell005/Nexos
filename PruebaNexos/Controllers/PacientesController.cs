using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ACTIVA_IT.WEB.Context;
using PruebaNexos.Context.Models;
using PruebaNexos.Modulos;
using PruebaNexos.Servicios;

namespace PruebaNexos.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PacientesController : ControllerBase
    {
        //Controla el log
        private readonly ILog log;

        private PacientesModulo modulo;

        public PacientesController(AppDbContext context, ILog log)
        {
            modulo = new PacientesModulo(context);
            this.log = log;
        }

        /// <summary>
        /// Obtiene una lista de pacientes
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public IEnumerable<Paciente> GetPaciente()
        {
            try
            {
                var pacientes = modulo.GetPaciente().ToArray()
                        .Select(p => new Paciente
                        {
                            Apellido = p.Apellido,
                            CodigoPostal = p.CodigoPostal,
                            IdPaciente = p.IdPaciente,
                            Nombre = p.Nombre,
                            NumSeguroSocial = p.NumSeguroSocial,
                            Telefono = p.Telefono,
                            Atencion = p.Atencion.Select(a => new Atencion
                            {
                                Doctor = new Doctor()
                                {
                                    Nombre = a.Doctor.Nombre,
                                    Apellido = a.Doctor.Apellido,
                                    Especialidad = a.Doctor.Especialidad,
                                    NumCredencial = a.Doctor.NumCredencial,
                                    Hospital = new Hospital()
                                },
                                Eliminado = false,
                                IdAtencion = a.IdAtencion,
                                IdDoctor = a.IdDoctor,
                                Paciente = new Paciente(),
                                IdPaciente = a.IdPaciente
                            }).ToArray()
                        }).ToArray();

                this.log.Info("Consulta todos los pacientes");

                return pacientes;
            }
            catch (Exception ex)
            {
                this.log.Warning("Consulta todos los pacientes", ex);

                throw new Exception("", ex);
            }
        }

        // GET: api/Pacientes/5
        [HttpGet("{id}")]
        public Paciente GetPaciente(int id)
        {
            try
            {
                var paciente = modulo.GetPaciente(id).Select(p => new Paciente
                {
                    Apellido = p.Apellido,
                    CodigoPostal = p.CodigoPostal,
                    IdPaciente = p.IdPaciente,
                    Nombre = p.Nombre,
                    NumSeguroSocial = p.NumSeguroSocial,
                    Telefono = p.Telefono,
                    Atencion = p.Atencion.Select(a => new Atencion
                    {
                        Doctor = new Doctor()
                        {
                            Nombre = a.Doctor.Nombre,
                            Apellido = a.Doctor.Apellido,
                            Especialidad = a.Doctor.Especialidad,
                            NumCredencial = a.Doctor.NumCredencial,
                            Hospital = new Hospital
                            {
                                Nombre = a.Doctor.Hospital.Nombre,
                                Direccion = a.Doctor.Hospital.Direccion,
                                Telefono = a.Doctor.Hospital.Telefono,

                            }
                        },
                        Eliminado = false,
                        IdAtencion = a.IdAtencion,
                        IdDoctor = a.IdDoctor,
                        Paciente = new Paciente(),
                        IdPaciente = a.IdPaciente
                    }).ToArray()
                }).FirstOrDefault();

                this.log.Info($"Consulta el paciente con id {id}");

                return paciente;
            }
            catch (Exception ex)
            {
                this.log.Warning($"Consulta el paciente con id {id}", ex);
                throw new Exception("", ex);
            }
        }

        // PUT: api/Pacientes/5
        [HttpPut("{id}")]
        public Paciente PutPaciente(int id, Paciente pacienteDto)
        {
            try
            {
                var p = modulo.PutPaciente(id, pacienteDto);

                this.log.Info($"Se ha editado el paciente con id {id}");

                return new Paciente
                {
                    Apellido = p.Apellido,
                    CodigoPostal = p.CodigoPostal,
                    IdPaciente = p.IdPaciente,
                    Nombre = p.Nombre,
                    NumSeguroSocial = p.NumSeguroSocial,
                    Telefono = p.Telefono,
                    Atencion = p.Atencion.Select(a => new Atencion
                    {
                        Doctor = new Doctor(),
                        Eliminado = false,
                        IdAtencion = a.IdAtencion,
                        IdDoctor = a.IdDoctor,
                        Paciente = new Paciente(),
                        IdPaciente = a.IdPaciente
                    }).ToArray()
                }; ;
            }
            catch (Exception ex)
            {
                this.log.Error($"Error al editar el paciente con id {id}", ex);
                throw new Exception("", ex);
            }
        }

        // POST: api/Pacientes
        [HttpPost]
        public Paciente PostPaciente(Paciente pacienteDto)
        {
            try
            {
                var p = modulo.PostPaciente(pacienteDto);

                this.log.Info($"Se ha creado el paciente con id {p.IdPaciente}");

                return new Paciente
                {
                    Apellido = p.Apellido,
                    CodigoPostal = p.CodigoPostal,
                    IdPaciente = p.IdPaciente,
                    Nombre = p.Nombre,
                    NumSeguroSocial = p.NumSeguroSocial,
                    Telefono = p.Telefono,
                    Atencion = p.Atencion.Select(a => new Atencion
                    {
                        Doctor = new Doctor(),
                        Eliminado = false,
                        IdAtencion = a.IdAtencion,
                        IdDoctor = a.IdDoctor,
                        Paciente = new Paciente(),
                        IdPaciente = a.IdPaciente
                    }).ToArray()
                };
            }
            catch (Exception ex)
            {
                this.log.Error($"Error al crear un paciente", ex);
                throw new Exception("", ex);
            }
        }

        // DELETE: api/Pacientes/5
        [HttpDelete("{id}")]
        public ActionResult<Paciente> DeletePaciente(int id)
        {
            try
            {
                var paciente = modulo.DeletePaciente(id);

                this.log.Info($"Se ha eliminado el paciente con id {paciente.IdPaciente}");

                return paciente;
            }
            catch (Exception ex)
            {
                this.log.Error($"Error al eliminar un paciente", ex);
                throw new Exception("", ex);
            }
        }
    }
}
