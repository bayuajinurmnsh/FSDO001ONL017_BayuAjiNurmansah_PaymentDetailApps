import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { PaymentService } from '../services/payment.service';
import { PaymentModel } from '../models/PaymentModels';
import { Router } from '@angular/router';

@Component({
  selector: 'app-index',
  templateUrl: './index.component.html',
  styleUrls: ['./index.component.css']
})
export class IndexComponent implements OnInit {

  paymentModel: PaymentModel[] = []

  paymentModelObj: PaymentModel[] = []

  

  payment_id:number=0;
  
  constructor(public api: PaymentService, public router: Router, ) { }

  
  form = {
    inputData: new FormGroup({
      CardOwnerName : new FormControl('',[Validators.required, Validators.minLength(3)]),
      CardNumber : new FormControl('',[Validators.required, Validators.minLength(16),Validators.maxLength(16) , Validators.pattern(/^-?(0|[1-9]\d*)?$/)]),
      SecurityCode : new FormControl('',[Validators.required, Validators.minLength(3), Validators.maxLength(3), Validators.pattern(/^-?(0|[1-9]\d*)?$/)]),
      TotalTransactions: new FormControl('',[Validators.required,Validators.min(10000)]),
      ExpirationDate:new FormControl('',[Validators.required, Validators.minLength(1)]),
    }),
    updateData: new FormGroup({
      PaymentDetailId : new FormControl('',[Validators.minLength(1)]),
      CardOwnerName : new FormControl('',[Validators.required, Validators.minLength(3)]),
      CardNumber : new FormControl('',[Validators.required, Validators.minLength(16), Validators.maxLength(16) ,Validators.pattern(/^-?(0|[1-9]\d*)?$/)]),
      SecurityCode : new FormControl('',[]),
      TotalTransactions: new FormControl('',[Validators.required, Validators.min(10000)]),
      ExpirationDate:new FormControl('',[Validators.required, Validators.minLength(1)]),
    }),
    
  }


  get CardOwnerName(){
    
    return this.form.inputData.get('CardOwnerName');
    
  }

  get CardNumber(){
    return this.form.inputData.get('CardNumber');
  }

  get SecurityCode(){
    return this.form.inputData.get('SecurityCode');
  }

  get TotalTransactions(){
    return this.form.inputData.get('TotalTransactions');
  }

  get ExpirationDate(){
    return this.form.inputData.get('ExpirationDate');
  }

  get CardOwnerName2(){
    return this.form.updateData.get('CardOwnerName');
  }

  get CardNumber2(){
    return this.form.updateData.get('CardNumber');
  }

  get SecurityCode2(){
    return this.form.updateData.get('SecurityCode');
  }

  get TotalTransactions2(){
    return this.form.updateData.get('TotalTransactions');
  }

  get ExpirationDate2(){
    return this.form.updateData.get('ExpirationDate');
  }

  

  ngOnInit(): void {
    const login = localStorage.getItem('isLoggedIn')
    if (login=='no'){
      ("You have login first!")
      this.router.navigate(['login']); 
    }
    this.getAllData();
  }


  getAllData(){
    this.api.getData()
     .subscribe(res =>{
       this.paymentModel = res;
       
     })
  }

  tambahData(){
    
    this.paymentModelObj = this.form.inputData.value;
    
    this.api.postData (this.paymentModelObj)
     .subscribe(res => {
      alert("Data has been added successfully")
      let ref = document.getElementById('cancel')
      ref?.click();
      this.form.inputData.reset();
      this.getAllData();
     },
     err=>{
       alert("Check card owner name and card number is match or not")
     })
    }

    onEdit(item:any){
      this.payment_id = item.paymentDetailId;
      this.form.updateData.controls['PaymentDetailId'].setValue(item.paymentDetailId)
      this.form.updateData.controls['CardOwnerName'].setValue(item.cardOwnerName)
      this.form.updateData.controls['CardNumber'].setValue(item.cardNumber)
      this.form.updateData.controls['SecurityCode'].setValue(item.securityCode)
      this.form.updateData.controls['TotalTransactions'].setValue(item.totalTransactions)
      this.form.updateData.controls['ExpirationDate'].setValue(item.expirationDate) 
    }
    
    editData(){
      this.paymentModelObj = this.form.updateData.value;
      this.api.updateData(this.paymentModelObj, this.payment_id)
      .subscribe(res=> {
        alert("Update Success")
        let ref = document.getElementById('cancel2')
        ref?.click();
        this.form.updateData.reset();
        this.getAllData();
      }
      ,
     err=>{
       alert("Check card owner name and card number is match or not")
     })
    }

    deleteData(item:any){

      const name=item.cardOwnerName
      if(confirm("Are you sure want to delete "+name)) {
        this.api.deleteData(item.paymentDetailId)
          .subscribe(res =>{
          this.getAllData();
      })
      }
    }
}