using System.ComponentModel.DataAnnotations;
using System;

namespace FinalProjectCSharp.Models
{
    public class PaymentData
    {
        [Key]
        public int paymentDetailId { get; set; }
        [Required]
        public string cardOwnerName { get; set; }
        [Required]
        public string cardNumber { get; set; }
        [Required]
        public DateTime expirationDate { get; set; }
        [Required]
        public string securityCode { get; set; }
        [Required]
        public double totalTransactions { get; set; }

        
    }
}