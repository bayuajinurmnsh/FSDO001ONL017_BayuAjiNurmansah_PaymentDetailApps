import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { IndexComponent } from './index/index.component';
import { LoginComponent } from './login/login.component';
import { OwnerDetailsComponent } from './owner-details/owner-details.component';
import { NoPageFoundComponent } from './no-page-found/no-page-found.component';

const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full'},
  { path: 'login', component: LoginComponent},
  { path: 'owner', component: OwnerDetailsComponent},
  { path: 'index', component: IndexComponent},
  { path: '**', component: NoPageFoundComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
