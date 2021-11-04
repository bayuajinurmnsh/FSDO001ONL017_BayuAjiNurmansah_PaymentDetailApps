using System.Collections.Generic;

namespace FinalProjectCSharp.Configuration
{
    public class AuthResult
    {
        public string Token { get; set; }
        public string RefreshToken { get; set; }
        public bool Success { get; set; }
        public List<string> Errors { get; set; }
    }

    public class ResponseJson
    {
        public List<string> Response { get; set; }
        public bool Success { get; set; }
    }
}