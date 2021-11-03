using System.ComponentModel.DataAnnotations;

namespace FinalProjectCSharp.Models.DTOs.Requests
{
    public class TokenRequest
    {
        [Required]
        public string Token { get; set; }
        [Required]
        public string RefreshToken { get; set; }
    }
}