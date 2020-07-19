import { Atencion } from './Atencion.module';

export interface Paciente {

  idPaciente: number;
  nombre: string;
  apellido: string;
  numSeguroSocial: string;
  codigoPostal: string;
  telefono: string;

  atencion?: Atencion[];
}