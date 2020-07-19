import { Doctor } from './Doctor.module';

export interface Hospital {

  idHospital: number;
  nombre: string;
  direccion: string;
  telefono: string;

  doctor?: Doctor[];
}
