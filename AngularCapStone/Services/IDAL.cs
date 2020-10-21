using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AngularCapStone.Models;

namespace AngularCapStone.Services
{
    public interface IDAL
    {
        IEnumerable<QandA> GetQandA();

        void AddQandA(QandA qandA);


        IEnumerable<QandA> GetFavorites(string userID);

        void AddToFavorites(Favorites myFavs);

        void RemoveFromFavorites(Favorites myFavs);

    }
}
