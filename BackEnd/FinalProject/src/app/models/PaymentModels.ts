export interface PaymentModel{

    paymentDetailId: number,
    cardOwnerName: string,
    cardNumber: string,
    expirationDate: string,
    securityCode: string,
    totalTransactions: number
}