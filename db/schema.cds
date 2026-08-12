using {managed} from '@sap/cds/common';

namespace sales;

entity SalesOrderHeaders : managed {
   key id          : UUID;
       customer    : Association to Customers;
       totalamount : Decimal(15,2);
       items: Composition of many SalesOrderItem on items.header = $self;
}


entity SalesOrderItem {
   key id        : UUID;
       header    : Association to SalesOrderHeaders;
       productid : association to Products;
       quantity  : Integer;
       price     : Decimal(15,2);
}

entity Customers {
   key id        : UUID;
       firstName : String(20);
       lastname  : String(100);
       email     : String(255);
}


entity Products {
   key id    : UUID;
       name  : String(255);
       price : Decimal(15,2);
}
