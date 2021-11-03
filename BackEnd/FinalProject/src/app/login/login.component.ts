import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { LoginRegisterService } from '../services/login-register.service';
import { LoginModel, RegisterModel } from '../models/RegisterLogin';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  loginModel : LoginModel[] = []
  registerModel : RegisterModel[] = []
  
  constructor(public api: LoginRegisterService, public router: Router) { }

  ngOnInit(): void {
  }

  form = {
    inputData: new FormGroup({
      username: new FormControl('',[Validators.required, Validators.minLength(2)]),
      password: new FormControl('',[Validators.required, Validators.minLength(2), Validators.pattern("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{1,}$") ]),
    }),
    registerData: new FormGroup({
      username: new FormControl('',[Validators.required, Validators.minLength(2)]),
      password: new FormControl('',[Validators.required, Validators.minLength(2), Validators.pattern("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{1,}$") ]),
      email: new FormControl('' ,[Validators.required, Validators.email])
    })
  }

  get username(){
    return this.form.inputData.get('username');
  }

  get password(){
    return this.form.inputData.get('password');
  }

  get email(){
    return this.form.registerData.get('email')
  }
  get username2(){
    return this.form.registerData.get('username');
  }

  get password2(){
    return this.form.registerData.get('password');
  }

  loginProcess(){

    this.loginModel = this.form.inputData.value;
    this.api.postLogin(this.loginModel)
     .subscribe(res => {
      this.form.inputData.reset();
      this.router.navigate(['index']);
     },
     err=>{
       alert("Wrong Username or Password")
     })
  }

  registerProcess(){
    this.registerModel = this.form.registerData.value;
    
    this.api.postRegister(this.registerModel)
     .subscribe(res => {
       alert("Register Success now you can login")
       let ref = document.getElementById('cancel')
        ref?.click();
      this.form.registerData.reset();
     },
     err=>{
       alert("Username or email already taken")
     })
    }

}
