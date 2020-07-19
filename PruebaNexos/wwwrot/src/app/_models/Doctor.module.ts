import { Hospital } from './Hospital.module';
import { Atencion } from './Atencion.module';

export interface Doctor {

  idDoctor: number;
  idHospital: number;
  nombre: string;
  apellido: string;
  especialidad: string;
  numCredencial: string;

  hospital?: Hospital;
  atencion?: Atencion[];
}
