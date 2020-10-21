import { Component } from '@angular/core';
import { DALService } from 'src/DAL.service';
import { QandA } from '../interfaces/IQandA';
import { Favorites } from '../interfaces/IFavorites';

@Component({
    selector: 'app-favorites',
    templateUrl: './favorites.component.html',
    styleUrls: ['./favorites.component.css']
})
/** favorites component*/
export class FavoritesComponent {
    /** favorites ctor */
  constructor(private dal: DALService) { }

  favlist: Favorites;
  delFav: Favorites;

  ngOnInit(): void {
    this.dal.getAllFavs().subscribe(
      (data: Favorites) =>
        this.favlist = data
    );
  }

  delFavs(id) {
    //console.log(id);
    this.delFav = { qID: id, userID: this.dal.userID }
    //console.log(this.newFav);
    this.dal.delFromFavs(this.delFav);
    this.ngOnInit();
    /*this.dal.getAllFavs().subscribe(
      (data: Favorites) =>
        this.favlist = data
    );*/
  }

}
