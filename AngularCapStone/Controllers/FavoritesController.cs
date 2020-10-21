using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AngularCapStone.Models;
using AngularCapStone.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AngularCapStone.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FavoritesController : ControllerBase
    {
        private IDAL dal;
        public FavoritesController(IDAL dal)
        {
            this.dal = dal;
        }

        [HttpPost("addFavs")]
        public void AddNewFavs([FromBody] Favorites newFav)
        {
            dal.AddToFavorites(newFav);
        }

        [HttpGet("get/{userID}")]
        public IEnumerable<QandA> GetFav(string userID)
        {
            return dal.GetFavorites(userID);
        }

        [HttpPost("delFavs")]
        public void DeleteFav([FromBody] Favorites delFav)
        {
            dal.RemoveFromFavorites(delFav);
        }
    }
}
