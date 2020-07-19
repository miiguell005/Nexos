using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PruebaNexos.Servicios
{
    public interface ILog
    {
        void Error(string mensaje, Exception ex);

        void Info(string mensaje);
        
        void Warning(string mensaje);
        
        void Warning(string mensaje, Exception ex);

    }
}
