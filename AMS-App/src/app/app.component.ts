import { Component, ViewChild, OnInit, OnDestroy, AfterContentInit } from '@angular/core';
import { MatAccordion } from '@angular/material/expansion/accordion';
import { AuthService } from 'src/auth/services/auth.service';
import { Observable } from 'rxjs';
import { MatDialog } from '@angular/material/dialog';
import { ChangePasswordComponent } from 'src/auth/components/changePassword/changePassword.component';
import { LoginState, selectIsAuthenticated, selectAuthenticatedUser } from 'src/auth/store';
import { Store, select } from '@ngrx/store';
import { IMenu } from 'src/_models/menu-data';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements AfterContentInit {

  private hideTitle = false;

  @ViewChild('accordion', { static: true }) Accordion: MatAccordion;

  myMenu: IMenu[];

  isAuthenticated$: Observable<boolean>;
  usernameToDisplay$: Observable<string>;

  constructor(
    private authService: AuthService,
    private matDialog: MatDialog,
    private store: Store<LoginState>) { }

  ngAfterContentInit(): void {
    this.isAuthenticated$ = this.store.pipe(select(selectIsAuthenticated));
    this.usernameToDisplay$ = this.store.pipe(select(selectAuthenticatedUser));

    this.isAuthenticated$.subscribe((isAuthenticated) => {
      console.log('isAuthenticated', isAuthenticated);
      if (isAuthenticated) {
        this.authService.getCurrentUserMenu().subscribe((menus) => {
          console.log('menus', menus);
          this.myMenu = menus;
        })
      }
    })
  }

  onSignOut() {
    this.authService.logout();
  }

  onChangePassword(): void {
    const dialogRef = this.matDialog.open(ChangePasswordComponent, { width: '300px' });

    dialogRef.afterClosed().subscribe(result => {
      console.log(result);
    });
  }
}
