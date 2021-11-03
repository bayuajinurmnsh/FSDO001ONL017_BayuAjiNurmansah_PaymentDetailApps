import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NoPageFoundComponent } from './no-page-found/no-page-found.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { IndexComponent } from './index/index.component';
import { HttpClientModule } from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';
import { decimalInCommas } from './pipes/decimalInCommas';
import { NavbarComponent } from './navbar/navbar.component';
import { OwnerDetailsComponent } from './owner-details/owner-details.component';

@NgModule({
  declarations: [
    AppComponent,
    NoPageFoundComponent,
    LoginComponent,
    RegisterComponent,
    IndexComponent,
    decimalInCommas,
    NavbarComponent,
    OwnerDetailsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule,
    HttpClientModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
