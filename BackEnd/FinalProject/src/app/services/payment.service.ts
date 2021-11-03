import { Injectable } from '@angular/core';
import { map } from 'rxjs/operators';
import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class PaymentService {

  headers = new HttpHeaders().set('Content-Type','application/json');

  constructor(private http : HttpClient) { }

  getData() {
    return this.http.get<any>("http://localhost:5000/api/PaymentDetails")
    .pipe(map((res:any) => {
      return res;
    }))
  }

  postData(data: any) {
    
    return this.http.post<any>("http://localhost:5000/api/PaymentDetails", data)
    .pipe(map((res:any) => {
      return res;
    }))
  }

  deleteData(id: number) {
    return this.http.delete<any>("http://localhost:5000/api/PaymentDetails/"+id)
    .pipe(map((res:any) => {
      return res;
    }))
  }

  updateData(data: any, id: number) {
    return this.http.put<any>("http://localhost:5000/api/PaymentDetails/"+id, data)
    .pipe(map((res:any) => {
      return res;
    }))
  }

  //auth

  get isAuthenticated() {
    // double-bang (!!) akan mengembalikan nilai truthy/falsy
    // dari sebuah value, beda dari negation (!) yang mengembalikan
    // nilai kebalikannya.
    return !!this.getAuthorizationToken()
  }

  // ambil pseudo-setter dan pseudo-getter untuk app_token

  getAuthorizationToken () {
    return localStorage.getItem('app_token')
  }

  setAuthorizationToken (token: string) {
    return localStorage.setItem('app_token', token)
  }

}