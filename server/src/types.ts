export interface Offers {
  offer_id: number;
  offer_name: string;
  discount: number;
}

export interface CustomerInfo {
  customers_offers: Offers[];
  acctBalance: number;
  acctNumber: number;
}

export interface CustomerResponse{
    customers:CustomerInfo[];
}