import { Injectable } from '@angular/core';
import { map } from 'rxjs/operators';
import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class OwnerService {

  headers = new HttpHeaders().set('Content-Type','application/json');

  constructor(private http : HttpClient) { }

  getData() {
    return this.http.get<any>("http://localhost:5000/api/OwnerDetails")
    .pipe(map((res:any) => {
      return res;
    }))
  }

  postData(data: any) {
    
    return this.http.post<any>("http://localhost:5000/api/OwnerDetails", data)
    .pipe(map((res:any) => {
      return res;
    }))
  }

  deleteData(id: number) {
    return this.http.delete<any>("http://localhost:5000/api/OwnerDetails/"+id)
    .pipe(map((res:any) => {
      return res;
    }))
  }

  updateData(data: any, id: number) {
    return this.http.put<any>("http://localhost:5000/api/OwnerDetails/"+id, data)
    .pipe(map((res:any) => {
      return res;
    }))
  }
}
