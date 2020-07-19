import { Doctor } from './Doctor.module';
import { Paciente } from './Paciente.module';

export interface Atencion {

  idAtencion: number;
  idDoctor: number;
  idPaciente: number;
  eliminado?: boolean;

  doctor?: Doctor;
  paciente?: Paciente;
}
