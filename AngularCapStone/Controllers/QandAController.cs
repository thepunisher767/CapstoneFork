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
    public class QandAController : ControllerBase
    {
        private IDAL dal;
        public QandAController(IDAL dal)
        {
            this.dal = dal;
        }
        
        [HttpPost("addQandA")]
        public void addQandA([FromBody] QandA newQandA)
        {
            //QandA test = new QandA() { Answer = "The Answer", Question = "The Question" };
            dal.AddQandA(newQandA);            
        }

        [HttpGet]
        public IEnumerable<QandA> GetAll()
        {
            return dal.GetQandA();
        }

    }
}
