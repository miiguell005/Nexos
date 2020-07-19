using ACTIVA_IT.WEB.Context;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using PruebaNexos.Context.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

namespace PruebaNexos.Servicios
{
    public class Log : ILog
    {

        private readonly ILogger<Log> logger;

        //Para crear la conexion a la base de datos para guardar el lob
        private readonly IServiceScopeFactory _scopeFactory;

        public Log(ILogger<Log> logger, IServiceScopeFactory scopeFactory)
        {
            this.logger = logger;
            _scopeFactory = scopeFactory;
        }


        /// <summary>
        /// Log de error
        /// </summary>
        /// <param name="mensaje"></param>
        /// <param name="ex"></param>
        /// <param name="obj"></param>
        public void Error(string mensaje, Exception ex)
        {
            this.GuardarLog("ERROR", mensaje, ex);

            this.logger.LogError($"{mensaje}; Exeption={ex.ToString()}");
        }

        /// <summary>
        /// Log de información
        /// </summary>
        /// <param name="mensaje"></param>
        public void Info(string mensaje)
        {
            this.GuardarLog("INFORMACIÓN", mensaje);

            this.logger.LogInformation(mensaje);
        }

        /// <summary>
        /// Log de alerta
        /// </summary>
        /// <param name="mensaje"></param>
        /// <param name="obj"></param>
        public void Warning(string mensaje)
        {
            this.GuardarLog("ADVERTENCIA", mensaje);

            this.logger.LogWarning(mensaje);
        }

        public void Warning(string mensaje, Exception ex)
        {
            this.GuardarLog("ADVERTENCIA", mensaje, ex);

            this.logger.LogWarning(mensaje);
        }

        /// <summary>
        /// Guarda la información en el log
        /// </summary>
        /// <param name="evento"></param>
        /// <param name="mensaje"></param>
        /// <param name="objAntes"></param>
        /// <param name="objDespues"></param>
        /// <param name="ex"></param>
        private void GuardarLog(string evento, string mensaje, Exception ex = null)
        {
            using (var scope = _scopeFactory.CreateScope())
            {
                var dbContext = scope.ServiceProvider.GetRequiredService<AppDbContext>();

                var log = new LogDatos()
                {
                    IdLog = 0,
                    Evento = evento,
                    Excepcion = ex == null ? "" : ex.ToString(),
                    Mensaje = mensaje,
                    Fecha = DateTime.Now
                };

                dbContext.LogDatos.Add(log);

                dbContext.SaveChanges();
            }
        }
    }
}
