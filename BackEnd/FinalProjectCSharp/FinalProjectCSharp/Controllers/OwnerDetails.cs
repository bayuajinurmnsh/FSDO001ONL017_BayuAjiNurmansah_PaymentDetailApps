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
    public class OwnerDetailsController : ControllerBase
    {
        private readonly ApiDbContext _context;

        public OwnerDetailsController(ApiDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetItems()
        {
            var ownerdetail = await _context.OwnerDetails.ToListAsync();
            return Ok(ownerdetail);
        }

        [HttpPost]
        public async Task<IActionResult> CreateItem(OwnerData data)
        {
            if (ModelState.IsValid)
            {

                //check dari table ownerDetails
                var existCardNumber = await _context.OwnerDetails.FirstOrDefaultAsync(x => x.ownerCardNumber == data.ownerCardNumber);
                if (existCardNumber != null)
                    return BadRequest(new JsonResult("Card number already in use") { StatusCode = 400, ContentType = "application/json" });

                await _context.OwnerDetails.AddAsync(data);
                await _context.SaveChangesAsync();

                return Ok(new JsonResult("Data has been insert") { StatusCode = 200, ContentType = "application/json" });
            }

            return new JsonResult("Something went wrong") { StatusCode = 500, ContentType = "application/json" };
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetItem(int id)
        {
            var data = await _context.OwnerDetails.FirstOrDefaultAsync(x => x.ownerId == id);

            if (data == null)
                return NotFound();

            return Ok(data);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateItem(int id, OwnerData data)
        {
            if (id != data.ownerId)
                return BadRequest();

            var existItem = await _context.OwnerDetails.FirstOrDefaultAsync(x => x.ownerId == id);

            if (existItem == null)
                return NotFound();

            //check dari table ownerDetails
            var existCardNumber = await _context.OwnerDetails.FirstOrDefaultAsync(x => x.ownerCardNumber == data.ownerCardNumber && x.ownerId != id);
            if (existCardNumber != null)
                return BadRequest(new JsonResult("Card Number already in use") { StatusCode = 400, ContentType = "application/json" });

            existItem.ownerCardNumber = data.ownerCardNumber;
            existItem.ownerName = data.ownerName;
            existItem.ownerAddress = data.ownerAddress;
            existItem.status = data.status;
            existItem.createdDate = data.createdDate;

            await _context.SaveChangesAsync();

            return Ok(new JsonResult("Data has been update") { StatusCode = 200, ContentType = "application/json" });
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteItem(int id)
        {
            var existItem = await _context.OwnerDetails.FirstOrDefaultAsync(x => x.ownerId == id);

            if (existItem == null)
                return NotFound();

            _context.OwnerDetails.Remove(existItem);
            await _context.SaveChangesAsync();

            return Ok(new JsonResult("Data has been delete") { StatusCode = 200, ContentType = "application/json" });
        }

    }

}