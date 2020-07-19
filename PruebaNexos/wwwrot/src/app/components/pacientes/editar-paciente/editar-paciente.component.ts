import { Component, OnInit } from '@angular/core';
import { ServiceService } from 'src/app/Helper/Service/service.service';
import { ToastrService } from 'ngx-toastr';
import { Router, ActivatedRoute } from '@angular/router';
import { Doctor } from 'src/app/_models/Doctor.module';
import { Paciente } from 'src/app/_models/Paciente.module';
import { Atencion } from 'src/app/_models/Atencion.module';

@Component({
  selector: 'app-editar-paciente',
  templateUrl: './editar-paciente.component.html',
  styleUrls: ['./editar-paciente.component.css']
})
export class EditarPacienteComponent implements OnInit {

  titulo: string = "Crear paciente";
  botonGuardarOprimido: boolean = false;

  //El paciente con el cual se va a editar
  paciente: Paciente = {
    atencion: [],
    apellido: null,
    codigoPostal: null,
    idPaciente: 0,
    nombre: null,
    numSeguroSocial: null,
    telefono: null,
  };

  //Contiene la lista de doctores
  doctores: Doctor[];

  constructor(private sService: ServiceService, private toastr: ToastrService, private route: ActivatedRoute) {

    this.route.params.subscribe(params => {
      this.paciente.idPaciente = +params['idPaciente'];
    });

    this.consultarDoctores();
  }

  ngOnInit() {

    //Si el parametro es distinto a cero, busca el paciente para ser editado
    if (this.paciente.idPaciente != 0)
      this.sService.get("api/Pacientes/" + this.paciente.idPaciente).subscribe((dataPaciente: Paciente) => {

        this.titulo = "Editar paciente";

        this.paciente = dataPaciente;

      }, (error) => { this.controlarExcepcion(error); });
  }

  /**
   * Consulta la lista de doctores
   */
  consultarDoctores() {

    this.sService.get("api/Doctores").subscribe((dataDoctores: Doctor[]) => {

      this.doctores = dataDoctores;

      console.log(this.doctores);
    }, (error) => { this.controlarExcepcion(error); });
  }

  /**
   * Permite agregar un nuevo doctor al paciente
   */
  agregarDoctor() {

    if (this.paciente.atencion == null)
      this.paciente.atencion = [];

    this.paciente.atencion.push({
      idAtencion: 0,
      idPaciente: this.paciente.idPaciente,
      idDoctor: 0,
      doctor: null,
      paciente: null,

    });

  }

  /**
   * Marca como eliminada la atencion
   * @param atencion 
   */
  eliminarDoctor(atencion: Atencion) {
    atencion.eliminado = true;
  }

  /**
   * Crea o edita un paciente
   */
  guardar() {

    if (this.paciente.atencion != null && this.paciente.atencion.length > 0)
      this.paciente.atencion = this.paciente.atencion.filter(a => { return (a.idAtencion != 0 && a.eliminado == true) || !a.eliminado ; });

    this.botonGuardarOprimido = true;

    //Valida que todos los selects de doctor esten seleccionados
    let hayAtencionPendiente = this.paciente.atencion.find(a => {return !a.idDoctor; });

    if (!this.paciente.apellido || !this.paciente.nombre || !this.paciente.numSeguroSocial
      || !this.paciente.codigoPostal || !this.paciente.telefono || hayAtencionPendiente)
      return this.toastr.warning("Hay campos pendientes po llenar");

    //Crea el paciente
    if (this.paciente.idPaciente == 0)
      this.sService.post("api/Pacientes", this.paciente).subscribe((dataPaciente: Paciente) => {

        this.toastr.success("Se ha creado el paciente " + dataPaciente.nombre);
        this.titulo = "Editar paciente";

        //Actualiza los datos del paciente
        this.paciente = dataPaciente;

      }, (error) => { this.controlarExcepcion(error); });

    //Edita los datos del paciente
    else {
      this.sService.put(`api/Pacientes/${this.paciente.idPaciente}`, this.paciente).subscribe((dataPaciente: Paciente) => {

        this.toastr.success("Se ha editado el paciente " + dataPaciente.nombre);

        //Actualiza los datos del paciente
        this.paciente = dataPaciente;

      }, (error) => { this.controlarExcepcion(error); });
    }
  }

  /**
   * Controla las excepciones
   * @param error 
   */
  controlarExcepcion(error: any) {

    console.log("Error", error);

    this.toastr.error(error);
  }
}
