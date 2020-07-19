import { Component, OnInit, ViewChild } from '@angular/core';
import { Paciente } from 'src/app/_models/Paciente.module';
import { ServiceService } from 'src/app/Helper/Service/service.service';
import { ToastrService } from 'ngx-toastr';
import { ModalConfirmacionComponent } from 'src/app/Helper/components/modal-confirmacion/modal-confirmacion.component';

@Component({
  selector: 'app-lista-pacientes',
  templateUrl: './lista-pacientes.component.html',
  styleUrls: ['./lista-pacientes.component.css']
})
export class ListaPacientesComponent implements OnInit {

  @ViewChild(ModalConfirmacionComponent) modalConfirmacion: ModalConfirmacionComponent;

  titulo: string = "Lista de pacientes";
  pacientes: Paciente[];

  constructor(
    private sService: ServiceService,
    private toastr: ToastrService) { }

  ngOnInit() {
    this.sService.get("api/Pacientes").subscribe((dataPacientes: Paciente[]) => {

      this.pacientes = dataPacientes;
console.log(this.pacientes );
    }, (error) => {
      console.log("Error", error);
      this.toastr.error(error);
    });
  }

  /**
   * Elimina un paciente
   * @param paciente 
   */
  eliminarPaciente(paciente: Paciente) {

    this.modalConfirmacion
      .openModal(`¿Esta seguro de eliminar el paciente ${paciente.apellido} ${paciente.nombre}?`)
      .then((result: any) => {

        //Si el valor es verdadero, el usuario acepto la eliminacion del paciente
        if (result.valor)

          this.sService.delete(`api/Pacientes/${paciente.idPaciente}`).subscribe((dataPaciente: Paciente) => {

            this.toastr.success(`Se ha eliminado el paciente ${paciente.apellido} ${paciente.nombre}`);

            this.pacientes = this.pacientes.filter(p => { return p.idPaciente != dataPaciente.idPaciente; });

          }, (error) => {
            console.log("Error", error);
            this.toastr.error(error);
          });

      }).catch((ex) => { });;

  }
}
