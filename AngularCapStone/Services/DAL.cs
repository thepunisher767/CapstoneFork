using AngularCapStone.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Dapper.Contrib.Extensions;
using AngularCapStone.Services;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;



namespace AngularCapStone.Services
{
    public class DAL : IDAL
    {
        private string connString;
        private SqlConnection conn;

        public DAL (IConfiguration config)
        {
            connString = config.GetConnectionString("default");
            conn = new SqlConnection(connString);
        }


        //-------------QandA

        public IEnumerable<QandA> GetQandA() //FINISHED
        {
            return conn.GetAll<QandA>().ToList();
        }

        public void AddQandA(QandA qandA)  //FINISHED
        {

            conn.Insert<QandA>(qandA);
        }


        //------------------Favorites


        public IEnumerable<QandA> GetFavorites(string userID) //FINISHED
        {
            string query = "SELECT QandA.id, QandA.question, QandA.answer ";
            query += "FROM QandA ";
            query += "JOIN Favorites ON QandA.id=Favorites.qID ";
            query += $"WHERE Favorites.userID='{userID}' ";
            List<QandA> favlist = conn.Query<QandA>(query).ToList();
            return favlist;
        }

        public void AddToFavorites(Favorites myFave) //IN PROGRESS
        {
            string query = "SELECT * FROM Favorites";
            List<Favorites> list = conn.Query<Favorites>(query).ToList();
            foreach (Favorites item in list)
            {
                if (item.qID == myFave.qID && item.userID == myFave.userID)
                {
                    return;
                }
            }
            conn.Insert<Favorites>(myFave);
        } 

        public void RemoveFromFavorites(Favorites myFave) //IN PROGRESS
        {
            string query = $"DELETE FROM Favorites WHERE userID='{myFave.userID}' AND qID='{myFave.qID}'";
            conn.Query<Favorites>(query);
        }
    }
}
