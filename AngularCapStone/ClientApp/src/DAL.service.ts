import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { QandA } from './app/interfaces/IQandA';
import { Favorites } from './app/interfaces/IFavorites';



@Injectable({
  providedIn: 'root'
})
export class DALService {
  constructor(private http: HttpClient) { }

  userID = 'Zach';

  QandAUrl = '/api/QandA';
  FavUrl = '/api/Favorites';


  getAllQandA() {
    return this.http.get(this.QandAUrl);
  }

  sendToFavs(newFav: Favorites) {
    const headers = { 'content-type': 'application/json' };
    const body = JSON.stringify(newFav);
    var newURL = this.FavUrl + '/addFavs'
    return this.http.post<Favorites>(newURL, body, { 'headers': headers }).subscribe((data) => console.log(data));
  }


  getAllFavs() {
    return this.http.get(`${this.FavUrl}/get/${this.userID}`);
  }

  delFromFavs(delFav: Favorites) {
    const headers = { 'content-type': 'application/json' };
    const body = JSON.stringify(delFav);
    var newURL = this.FavUrl + '/delFavs'
    this.http.post<Favorites>(newURL, body, { 'headers': headers }).subscribe((data) => console.log(data));
  }







 /* createEmployee(emp) {
    return this.http.post<QandA>(this.apiUrl, emp); //2 itesm, the url and the data we want to pass
  }



  updateEmployee(emp) {
    return this.http.post<Employee>(this.apiUrl, emp);
  } */

}
