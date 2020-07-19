using Microsoft.EntityFrameworkCore;
using PruebaNexos.Context.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ACTIVA_IT.WEB.Context
{
    public class AppDbContext : DbContext
    {

        public AppDbContext(DbContextOptions<AppDbContext> options)
                : base(options)
        {

        }

        public DbSet<Hospital> Hospital { get; set; }
        public DbSet<Paciente> Paciente { get; set; }
        public DbSet<Atencion> Atencion { get; set; }        
        public DbSet<PruebaNexos.Context.Models.Doctor> Doctor { get; set; }

        public DbSet<LogDatos> LogDatos { get; set; }
    }
}