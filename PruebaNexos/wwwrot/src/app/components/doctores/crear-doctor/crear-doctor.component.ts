import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Doctor } from 'src/app/_models/Doctor.module';
import { Hospital } from 'src/app/_models/Hospital.module';
import { ServiceService } from 'src/app/Helper/Service/service.service';
import { ToastrService } from 'ngx-toastr';
import { Paciente } from 'src/app/_models/Paciente.module';
import { Atencion } from 'src/app/_models/Atencion.module';

@Component({
  selector: 'app-crear-doctor',
  templateUrl: './crear-doctor.component.html',
  styleUrls: ['./crear-doctor.component.css']
})
export class CrearDoctorComponent implements OnInit {

  titulo: string = "Crear doctor";
  botonGuardarOprimido: boolean = false;

  doctor: Doctor = {
    idDoctor: 0,
    nombre: null,
    apellido: null,
    especialidad: null,
    idHospital: null,
    numCredencial: null,
    atencion: null,
    hospital: null,
  };

  //Contiene la lista de pacientes
  pacientes: Paciente[] = [];

  //Contiene la lista de hospitales para ser seleccionado
  hospitales: Hospital[];

  constructor(private sService: ServiceService,
    private toastr: ToastrService,
    private router: Router) { }

  ngOnInit() {

    this.consultarPacientes();

    this.sService.get("api/Doctores/Hospitales").subscribe((dataHospitales: Hospital[]) => {

      this.hospitales = dataHospitales;
      console.log("dataHospitales", this.hospitales);

    }, (error) => {
      console.log("Error", error);
      this.toastr.error(error);
    });
  }

  /**
   * Consulta la lista de pacientes
   */
  consultarPacientes() {
    this.sService.get("api/Pacientes").subscribe((dataPacientes: Paciente[]) => {

      this.pacientes = dataPacientes;

    }, (error) => {
      console.log("Error", error);
      this.toastr.error(error);
    });
  }

  /**
   * Permite agregar un nuevo doctor al paciente
   */
  agregarPaciente() {

    if (this.doctor.atencion == null)
      this.doctor.atencion = [];

    this.doctor.atencion.push({
      idAtencion: 0,
      idPaciente: 0,
      idDoctor: this.doctor.idDoctor,
      doctor: null,
      paciente: null,
    });
  }

  /**
   * Marca como eliminada la atencion
   * @param atencion 
   */
  eliminarPaciente(atencion: Atencion) {
    atencion.eliminado = true;
  }


  /**
   * Crea al doctor
   */
  guardar() {

    if (this.doctor.atencion != null && this.doctor.atencion.length > 0)
      this.doctor.atencion = this.doctor.atencion.filter(a => { return (a.idAtencion != 0 && a.eliminado == true) || !a.eliminado; });

    this.botonGuardarOprimido = true;

    let hayAtencionPendiente = this.doctor.atencion.find(a => { return !a.idPaciente; });

    //Valida que no hayan campos que haya falta por validar
    if (!this.doctor.nombre || !this.doctor.apellido || !this.doctor.idHospital ||
      !this.doctor.especialidad || !this.doctor.numCredencial || hayAtencionPendiente)
      return this.toastr.warning("Hay campos pendientes por llenar");

    console.log(this.doctor);

    //Crea el doctor
    this.sService.post("api/Doctores", this.doctor).subscribe((dataDoctor: Doctor) => {

      this.toastr.success("Se ha creado el doctor " + dataDoctor.nombre);
      this.router.navigate(["/paciente"]);

    }, (error) => {
      console.log("Error", error);
      this.toastr.error(error);
    });
  }

}
