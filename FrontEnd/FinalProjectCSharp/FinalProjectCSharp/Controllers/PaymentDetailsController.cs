using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

using FinalProjectCSharp.Data;
using FinalProjectCSharp.Models;

namespace FinalProjectCSharp.Controllers
{
    [Route("api/[controller]")] //define the routing that controller going to use
    [ApiController] // specifiy the type of the controller so .net core know
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class PaymentDetailsController : ControllerBase
    {

        private readonly ApiDbContext _context;

        public PaymentDetailsController(ApiDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetItems()
        {
            var paymentdetail = await _context.PaymentDetails.ToListAsync();
            return Ok(paymentdetail);
        }

        [HttpPost]
        public async Task<IActionResult> CreateItem(PaymentData data)
        {
            if (ModelState.IsValid)
            {

                //check dari table ownerDetails apakah card number ada atau tidak, jika tidak ada maka bad request
                var existCardNumberandOwnerName = await _context.OwnerDetails.FirstOrDefaultAsync(x => x.ownerName == data.cardOwnerName && x.ownerCardNumber == data.cardNumber);
                if (existCardNumberandOwnerName == null)
                    return BadRequest(new JsonResult("Invalid! Card Number doesn't exists or OwnerName Not Match With Card Number Owner") { StatusCode = 400, ContentType = "application/json" });

                //check dari table ownerDetails apakah status owner active atau banned , jika banned maka bad request
                var ActiveUser = await _context.OwnerDetails.FirstOrDefaultAsync(x => x.status == "active" && x.ownerCardNumber == data.cardNumber);
                if (ActiveUser == null)
                    return BadRequest(new JsonResult("Invalid! the owner has been inactive") { StatusCode = 400, ContentType = "application/json" });


                await _context.PaymentDetails.AddAsync(data);
                await _context.SaveChangesAsync();

                return Ok(new JsonResult("Data has been insert") { StatusCode = 200, ContentType = "application/json" });
            }

            return new JsonResult("Something went wrong") { StatusCode = 500, ContentType = "application/json" };
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetItem(int id)
        {
            var data = await _context.PaymentDetails.FirstOrDefaultAsync(x => x.paymentDetailId == id);

            if (data == null)
                return NotFound();

            return Ok(data);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateItem(int id, PaymentData data)
        {
            if (id != data.paymentDetailId)
                return BadRequest();

            var existItem = await _context.PaymentDetails.FirstOrDefaultAsync(x => x.paymentDetailId == id);

            if (existItem == null)
                return NotFound();

            //check dari table ownerDetails apakah card number ada atau tidak, jika tidak ada maka bad request
            var existCardNumberandOwnerName = await _context.OwnerDetails.FirstOrDefaultAsync(x => x.ownerName == data.cardOwnerName && x.ownerCardNumber == data.cardNumber);
            if (existCardNumberandOwnerName == null)
                return BadRequest(new JsonResult("Invalid! Card Number doesn't exists or OwnerName Not Match With Card Number Owner") { StatusCode = 400, ContentType = "application/json" });

            //check dari table ownerDetails apakah status owner active atau banned , jika banned maka bad request
            var ActiveUser = await _context.OwnerDetails.FirstOrDefaultAsync(x => x.status == "active" && x.ownerCardNumber == data.cardNumber);
            if (ActiveUser == null)
                return BadRequest(new JsonResult("Invalid! the owner has been inactive") { StatusCode = 400, ContentType = "application/json" });

            existItem.cardOwnerName = data.cardOwnerName;
            existItem.cardNumber = data.cardNumber;
            existItem.expirationDate = data.expirationDate;
            existItem.securityCode = data.securityCode;
            existItem.totalTransactions = data.totalTransactions;

            await _context.SaveChangesAsync();

            return Ok(new JsonResult("Data has been update") { StatusCode = 200, ContentType = "application/json" });
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteItem(int id)
        {
            var existItem = await _context.PaymentDetails.FirstOrDefaultAsync(x => x.paymentDetailId == id);

            if (existItem == null)
                return NotFound();

            _context.PaymentDetails.Remove(existItem);
            await _context.SaveChangesAsync();

            return Ok(new JsonResult("Data has been delete") { StatusCode = 200, ContentType = "application/json" });
        }

    }

}