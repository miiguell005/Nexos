import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AdminLayoutRoutes } from './admin-layout.routing';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

import { ModalConfirmacionComponent } from 'src/app/Helper/components/modal-confirmacion/modal-confirmacion.component';

import { ListaPacientesComponent } from 'src/app/components/pacientes/lista-pacientes/lista-pacientes.component';
import { EditarPacienteComponent } from 'src/app/components/pacientes/editar-paciente/editar-paciente.component';
import { CrearDoctorComponent } from 'src/app/components/doctores/crear-doctor/crear-doctor.component';
import { DetallePacienteComponent } from 'src/app/components/pacientes/detalle-paciente/detalle-paciente.component';

@NgModule({
  imports: [
    CommonModule,
    RouterModule.forChild(AdminLayoutRoutes),
    FormsModule,
    NgbModule
  ],
  declarations: [
    ModalConfirmacionComponent,
    ListaPacientesComponent,
    EditarPacienteComponent,
    CrearDoctorComponent,
    DetallePacienteComponent
  ],
  entryComponents: [
    ModalConfirmacionComponent
  ],
})

export class AdminLayoutModule { }
