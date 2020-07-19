import { Routes } from '@angular/router';

import { ListaPacientesComponent } from 'src/app/components/pacientes/lista-pacientes/lista-pacientes.component';
import { EditarPacienteComponent } from 'src/app/components/pacientes/editar-paciente/editar-paciente.component';
import { DetallePacienteComponent } from 'src/app/components/pacientes/detalle-paciente/detalle-paciente.component';
import { CrearDoctorComponent } from 'src/app/components/doctores/crear-doctor/crear-doctor.component';

export const AdminLayoutRoutes: Routes = [

  { path: 'paciente', component:  ListaPacientesComponent },
  { path: 'paciente/:idPaciente', component: EditarPacienteComponent },
  { path: 'paciente/detalle/:idPaciente', component: DetallePacienteComponent },
  { path: 'doctor/crear', component: CrearDoctorComponent }
];


