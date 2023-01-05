DELIMITER // 
CREATE PROCEDURE usp_CustomerCreate (out custId int, in name_p varchar(100), in address_p varchar(50), in city_p varchar(20), in state_p varchar(2), in zipcode_p varchar(15))
BEGIN
	Insert into customers (name, address, city, state, zipcode, concurrencyid)
    Values (name_p, address_p, city_p, state_p, zipcode_p, 1);
    Select LAST_INSERT_ID() into custId;
    
END //
DELIMITER ; 

DELIMITER // 
CREATE PROCEDURE usp_CustomerSelect (in custId int)
BEGIN
	Select * from customers where customerid = custId;
END //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE usp_CustomerSelectAll ()
BEGIN
	Select * from customers order by CustomerID;
END //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE usp_CustomerUpdate (in custid_p int, in name_p varchar(100), in address_p varchar(50), in city_p varchar(20), in state_p varchar(2), in zipcode_p varchar(15))
BEGIN
	Update customers
    Set name = name_p, address = address_p, city = city_p, state = state_p, zipcode = zipcode_p, concurrencyid = (concurrencyid + 1)
    Where customerid = custid_p and concurrencyid = conCurrId;
END //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE usp_CustomerDelete (in custId int, in conCurrId int)
BEGIN
	Delete from customers where customerid = custId and ConcurrencyID = conCurrId;
END //
DELIMITER ; 

DELIMITER // 
CREATE PROCEDURE usp_ProductCreate (out prodId int, in prodCode_p char(10), in description_p varchar(50), in unitprice_p decimal(10,4), in onhand_p int)
BEGIN
	Insert into products (productcode, description, unitprice, onhandquantity, concurrencyid)
    Values (prodCode_p, description_p, unitprice_p, onhand_p,1);
    Select LAST_INSERT_ID() into prodId;
    
END //
DELIMITER ; 

DELIMITER // 
CREATE PROCEDURE usp_ProductSelect (in prodId int)
BEGIN
	Select * from products where productid = prodId;
END //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE usp_ProductSelectAll ()
BEGIN
	Select * from products order by ProductID;
END //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE usp_ProductUpdate (in prodId_p int, in prodCode_p char(10), in description_p varchar(50), in unitprice_p decimal(10,4), in onhand_p int)
BEGIN
	Update products
    Set productcode = prodCode_p, description = description_p, unitprice = unitprice_p, onhandquantity = onhand_p,concurrencyid = (concurrencyid + 1)
    Where productid = prodId_p and concurrencyid = conCurrId;
END //
DELIMITER ;

DELIMITER // 
CREATE PROCEDURE usp_ProductDelete (in prodId int, in conCurrId int)
BEGIN
	Delete from products where productid = prodId and ConcurrencyID = conCurrId;
END //
DELIMITER ;