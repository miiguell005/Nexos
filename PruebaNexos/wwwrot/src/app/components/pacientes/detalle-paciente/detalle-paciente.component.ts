import { Component, OnInit } from '@angular/core';
import { ServiceService } from 'src/app/Helper/Service/service.service';
import { ToastrService } from 'ngx-toastr';
import { ActivatedRoute } from '@angular/router';
import { Paciente } from 'src/app/_models/Paciente.module';

@Component({
  selector: 'app-detalle-paciente',
  templateUrl: './detalle-paciente.component.html',
  styleUrls: ['./detalle-paciente.component.css']
})
export class DetallePacienteComponent implements OnInit {

  titulo: string = "Detalle del paciente";

  paciente: any = null;
  idpaciente: number;

  constructor(private sService: ServiceService, private toastr: ToastrService, private route: ActivatedRoute) {
    this.route.params.subscribe(params => {
      this.idpaciente = +params['idPaciente'];
    });
  }

  ngOnInit() {
    this.sService.get("api/Pacientes/" + this.idpaciente).subscribe((dataPaciente: Paciente) => {

      console.log(this.idpaciente);
      this.paciente = dataPaciente;
      console.log(this.paciente);

    }, (error) => { console.log(error); });
  }

}
