using System.ComponentModel.DataAnnotations;

namespace FinalProjectCSharp.Models.DTOs.Requests
{
    public class UserLoginRequest
    {
        [Required]
        public string Username { get; set; }

        [Required]
        public string Password { get; set; }

    }
}