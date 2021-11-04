import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { OwnerService } from '../services/owner.service';
import { OwnerModel } from '../models/OwnerModels';
import { Router } from '@angular/router';

@Component({
  selector: 'app-owner-details',
  templateUrl: './owner-details.component.html',
  styleUrls: ['./owner-details.component.css']
})
export class OwnerDetailsComponent implements OnInit {

  ownerModel: OwnerModel[] = []

  ownerModelObj: OwnerModel[] = []

  
  owner_id:number=0;
  
  constructor(public api: OwnerService, public router: Router, ) { }

  ngOnInit(): void {
    const login = localStorage.getItem('isLoggedIn')
    if (login=='no'){
      alert("You have login first!")
      this.router.navigate(['login']); 
    }
    this.getAllData();
  }

  form = {
    inputData: new FormGroup({
      ownerName : new FormControl('',[Validators.required, Validators.minLength(3)]),
      ownerCardNumber : new FormControl('',[Validators.required, Validators.minLength(16), Validators.maxLength(16),Validators.pattern(/^-?(0|[1-9]\d*)?$/)]),
      ownerAddress : new FormControl('',[Validators.required, Validators.minLength(4)]),
      status: new FormControl('',[Validators.required,Validators.min(1)]),
      createdDate:new FormControl('',[Validators.required, Validators.minLength(1)]),
    }),
    updateData: new FormGroup({
      ownerId : new FormControl('',[Validators.minLength(1)]),
      ownerName : new FormControl('',[Validators.required, Validators.minLength(3)]),
      ownerCardNumber : new FormControl('',[Validators.required,Validators.minLength(16), Validators.maxLength(16) ,Validators.pattern(/^-?(0|[1-9]\d*)?$/)]),
      ownerAddress : new FormControl('',[Validators.required, Validators.minLength(4)]),
      status: new FormControl('',[Validators.required,Validators.min(1)]),
      createdDate:new FormControl('',[Validators.required, Validators.minLength(1)]),
    }),
  }

  get ownerName(){
    
    return this.form.inputData.get('ownerName');
    
  }

  get ownerCardNumber(){
    return this.form.inputData.get('ownerCardNumber');
  }

  get ownerAddress(){
    return this.form.inputData.get('ownerAddress');
  }

  get status(){
    return this.form.inputData.get('status');
  }

  get createdDate(){
    return this.form.inputData.get('createdDate');
  }

  get ownerName2(){
    
    return this.form.updateData.get('ownerName');
    
  }

  get ownerCardNumber2(){
    return this.form.updateData.get('ownerCardNumber');
  }

  get ownerAddress2(){
    return this.form.updateData.get('ownerAddress');
  }

  get status2(){
    return this.form.updateData.get('status');
  }

  get createdDate2(){
    return this.form.updateData.get('createdDate');
  }
  
  getAllData(){
    this.api.getData()
     .subscribe(res =>{
       this.ownerModel = res;
     })
  }

  tambahData(){
    
    this.ownerModelObj = this.form.inputData.value;
    
    this.api.postData (this.ownerModelObj)
     .subscribe(res => {
      alert("Data has been added successfully")
      let ref = document.getElementById('cancel')
      ref?.click();
      this.form.inputData.reset();
      this.getAllData();
     },
     err=>{
       alert("Card Number already Taken")
     })
    }

    onEdit(item:any){
      this.owner_id = item.ownerId;
      this.form.updateData.controls['ownerId'].setValue(item.ownerId)
      this.form.updateData.controls['ownerName'].setValue(item.ownerName)
      this.form.updateData.controls['ownerCardNumber'].setValue(item.ownerCardNumber)
      this.form.updateData.controls['ownerAddress'].setValue(item.ownerAddress)
      this.form.updateData.controls['status'].setValue(item.status)
      this.form.updateData.controls['createdDate'].setValue(item.createdDate) 
    }
    
    editData(){
      this.ownerModelObj = this.form.updateData.value;

      this.api.updateData(this.ownerModelObj, this.owner_id)
      .subscribe(res=> {
        alert("Update Success")
        let ref = document.getElementById('cancel2')
        ref?.click();
        this.form.updateData.reset();
        this.getAllData();
      },
      err=>{
        alert("owner card number already exists")
      })
    }

    deleteData(item:any){

      const name=item.ownerName
      if(confirm("Are you sure want to delete "+name)) {
        this.api.deleteData(item.ownerId)
          .subscribe(res =>{
          this.getAllData();
      })
      }
    }

}
