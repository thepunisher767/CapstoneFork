import { Component } from '@angular/core';
import { DALService } from 'src/DAL.service';
import { QandA } from '../interfaces/IQandA';
import { Favorites } from '../interfaces/IFavorites';

@Component({
    selector: 'app-qand-a',
    templateUrl: './qand-a.component.html',
    styleUrls: ['./qand-a.component.css']
})
/** QandA component*/
export class QandAComponent {
/** QandA ctor */

  constructor(private dal: DALService) { }

  qandalist: QandA;
  newFav: Favorites;

  newQandA: QandA = {    
    question: '',
    answer: ''
  }


  ngOnInit(): void {
    this.dal.getAllQandA().subscribe(
      (data: QandA) =>
        this.qandalist = data
    );
  }

  addToFavs(id) {
    //console.log(id);
    this.newFav = { qID: id, userID: this.dal.userID }
    //console.log(this.newFav);
    this.dal.sendToFavs(this.newFav);
  }

  addQandA() {
    //this.newQandA = { question: newQuestion, answer: newAnswer }
    //this.newQandA = { question: 'How to?', answer: 'Figure it out' }
    this.dal.sendToQandA(this.newQandA);
    this.ngOnInit();
    this.newQandA.question=''
    this.newQandA.answer = ''
    window.location.reload();
  }

}
