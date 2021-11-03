import { Injectable } from '@angular/core';
import { map } from 'rxjs/operators';
import { HttpClient,HttpClientModule,HttpErrorResponse, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class LoginRegisterService {

  headers = new HttpHeaders().set('Content-Type','application/json');

  constructor(private http : HttpClient) { }

  //login
  postLogin(data: any) {
    return this.http.post<any>("http://localhost:5000/api/AuthManagement/Login", data)
    .pipe(map((res:any) => {
      return res;
    }))
  }

  postRegister(data: any){
    return this.http.post<any>("http://localhost:5000/api/AuthManagement/Register", data)
    .pipe(map((res:any) => {
      return res;
    }))
  }
}
