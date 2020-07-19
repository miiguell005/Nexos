import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ServiceService {

  private urlServidor = 'https://localhost:44311/';

  httpOptions = {
    headers: new HttpHeaders({ 'Accept': 'application/json', 'Content-Type': 'application/json', })
  };

  constructor(private http: HttpClient) { }

  //Metodo Get 
  get(api: string): Observable<any> {
    return this.http.get<any>(this.urlServidor + api, this.httpOptions);
  }

  //Metodo put
  put(api: string, obj: any): Observable<any> {
    return this.http.put(this.urlServidor + api, obj, this.httpOptions);
  }

  //Metodo post
  post(api: string, obj: any): Observable<any> {
    return this.http.post<any>(this.urlServidor + api, obj, this.httpOptions);
  }

  //Metodo Delete
  delete(api: string): Observable<any> {
    return this.http.delete<any>(this.urlServidor + api, this.httpOptions);
  }

  copiarObjeto(obj: any) {
    return JSON.parse(JSON.stringify(obj));
  }
}
