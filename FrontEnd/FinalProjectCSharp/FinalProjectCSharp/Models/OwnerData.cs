using System;
using System.ComponentModel.DataAnnotations;

namespace FinalProjectCSharp.Models
{
    public class OwnerData
    {
        [Key]
        public int ownerId { get; set; }
        [Required]
        public string ownerCardNumber { get; set; }
        [Required]
        public string ownerName { get; set; }
        [Required]
        public string ownerAddress { get; set; }
        [Required]
        public string status { get; set; }
        [Required]
        public DateTime createdDate { get; set; }

    }
}