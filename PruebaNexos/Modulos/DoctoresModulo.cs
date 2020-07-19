using ACTIVA_IT.WEB.Context;
using PruebaNexos.Context.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaNexos.Modulos
{
    public class DoctoresModulo
    {
        private readonly AppDbContext _context;

        public DoctoresModulo(AppDbContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Retorna todos los hospitales
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Hospital> GetHospitales()
        {
            return _context.Hospital.ToList();
        }


        /// <summary>
        /// Retorna todos los doctores
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Doctor> GetDoctor()
        {
            return  _context.Doctor.ToList();
        }

        /// <summary>
        /// Crea nuevos doctores
        /// </summary>
        /// <param name="doctor"></param>
        /// <returns></returns>
        public Doctor PostDoctor(Doctor doctor)
        {

            //doctor.Nombre = (CultureInfo.InvariantCulture.TextInfo.ToTitleCase(doctor.Nombre));
            //doctor.Apellido = (CultureInfo.InvariantCulture.TextInfo.ToTitleCase(doctor.Apellido));

            _context.Doctor.Add(doctor);
            _context.SaveChanges();

            return doctor;
        }
    }
}
