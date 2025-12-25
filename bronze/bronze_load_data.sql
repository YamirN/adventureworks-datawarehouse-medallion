
-- Carga de Datos Crudos (Capa Bronze) - Fase de Ingesta
	-- Este script realiza la carga masiva (Bulk Load) de la tablas
	-- en la capa Bronze del Data Lakehouse

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	BEGIN TRY
		PRINT '------------ Cargando Bronze Layer -----------';
		PRINT '-- Cargando Tablas HumanResources --'
		-- HumanResources_Department
		TRUNCATE TABLE bronze.HumanResources_Department;
		INSERT INTO bronze.HumanResources_Department
		SELECT *
		FROM AdventureWorks2022.HumanResources.Department;

		-- HumanResources_Employee
		TRUNCATE TABLE bronze.HumanResources_Employee
		INSERT INTO bronze.HumanResources_Employee
		SELECT *
		FROM AdventureWorks2022.HumanResources.Employee;

		-- HumanResources_EmployeeDepartmentHistory
		TRUNCATE TABLE bronze.HumanResources_EmployeeDepartmentHistory
		INSERT INTO bronze.HumanResources_EmployeeDepartmentHistory
		SELECT *
		FROM AdventureWorks2022.HumanResources.EmployeeDepartmentHistory;

		-- HumanResources_EmployeePayHistory
		TRUNCATE TABLE bronze.HumanResources_EmployeePayHistory
		INSERT INTO bronze.HumanResources_EmployeePayHistory
		SELECT *
		FROM AdventureWorks2022.HumanResources.EmployeePayHistory;

		-- HumanResources_JobCandidate
		TRUNCATE TABLE bronze.HumanResources_JobCandidate
		INSERT INTO bronze.HumanResources_JobCandidate
		SELECT *
		FROM AdventureWorks2022.HumanResources.JobCandidate;

		-- HumanResources_Shift
		TRUNCATE TABLE bronze.HumanResources_Shift
		INSERT INTO bronze.HumanResources_Shift
		SELECT *
		FROM AdventureWorks2022.HumanResources.Shift;

		PRINT '-- Cargando Tablas Person --'

		-- Person_Address
		TRUNCATE TABLE bronze.Person_Address
		INSERT INTO bronze.Person_Address
		SELECT *
		FROM AdventureWorks2022.Person.Address;

		-- Person_AddressType
		TRUNCATE TABLE bronze.Person_AddressType
		INSERT INTO bronze.Person_AddressType
		SELECT *
		FROM AdventureWorks2022.Person.AddressType;

		-- Person_BusinessEntity
		TRUNCATE TABLE bronze.Person_BusinessEntity
		INSERT INTO bronze.Person_BusinessEntity
		SELECT *
		FROM AdventureWorks2022.Person.BusinessEntity;

		-- Person_BusinessEntityAddress
		TRUNCATE TABLE bronze.Person_BusinessEntityAddress
		INSERT INTO bronze.Person_BusinessEntityAddress
		SELECT *
		FROM AdventureWorks2022.Person.BusinessEntityAddress;

		-- Person_BusinessEntityContact
		TRUNCATE TABLE bronze.Person_BusinessEntityContact
		INSERT INTO bronze.Person_BusinessEntityContact
		SELECT *
		FROM AdventureWorks2022.Person.BusinessEntityContact;

		-- Person_ContactType
		TRUNCATE TABLE bronze.Person_ContactType
		INSERT INTO bronze.Person_ContactType
		SELECT *
		FROM AdventureWorks2022.Person.ContactType;

		-- Person_CountryRegion
		TRUNCATE TABLE bronze.Person_CountryRegion
		INSERT INTO bronze.Person_CountryRegion
		SELECT *
		FROM AdventureWorks2022.Person.CountryRegion;

		-- Person_EmailAddress
		TRUNCATE TABLE bronze.Person_EmailAddress
		INSERT INTO bronze.Person_EmailAddress
		SELECT *
		FROM AdventureWorks2022.Person.EmailAddress;

		-- Person_Password
		TRUNCATE TABLE bronze.Person_Password
		INSERT INTO bronze.Person_Password
		SELECT *
		FROM AdventureWorks2022.Person.Password;

		-- Person_Person
		TRUNCATE TABLE bronze.Person_Person
		INSERT INTO bronze.Person_Person
		SELECT *
		FROM AdventureWorks2022.Person.Person;

		-- Person_PersonPhone
		TRUNCATE TABLE bronze.Person_PersonPhone
		INSERT INTO bronze.Person_PersonPhone
		SELECT *
		FROM AdventureWorks2022.Person.PersonPhone;

		-- Person_PhoneNumberType
		TRUNCATE TABLE bronze.Person_PhoneNumberType
		INSERT INTO bronze.Person_PhoneNumberType
		SELECT *
		FROM AdventureWorks2022.Person.PhoneNumberType;

		-- Person_StateProvince
		TRUNCATE TABLE bronze.Person_StateProvince
		INSERT INTO bronze.Person_StateProvince
		SELECT *
		FROM AdventureWorks2022.Person.StateProvince;
		

		PRINT '-- Cargando Tablas Production --'

		-- Production_BillOfMaterials
		TRUNCATE TABLE bronze.Production_BillOfMaterials
		INSERT INTO bronze.Production_BillOfMaterials
		SELECT *
		FROM AdventureWorks2022.Production.BillOfMaterials;

		-- Production_Culture
		TRUNCATE TABLE bronze.Production_Culture
		INSERT INTO bronze.Production_Culture
		SELECT *
		FROM AdventureWorks2022.Production.Culture;

		-- Production_Document
		TRUNCATE TABLE bronze.Production_Document
		INSERT INTO bronze.Production_Document
		SELECT *
		FROM AdventureWorks2022.Production.Document;

		-- Production_Illustration
		TRUNCATE TABLE bronze.Production_Illustration
		INSERT INTO bronze.Production_Illustration
		SELECT *
		FROM AdventureWorks2022.Production.Illustration;

		-- Production_Location
		TRUNCATE TABLE bronze.Production_Location
		INSERT INTO bronze.Production_Location
		SELECT *
		FROM AdventureWorks2022.Production.Location;

		-- Production_Product
		TRUNCATE TABLE bronze.Production_Product
		INSERT INTO bronze.Production_Product
		SELECT *
		FROM AdventureWorks2022.Production.Product;

		-- Production_ProductCategory
		TRUNCATE TABLE bronze.Production_ProductCategory
		INSERT INTO bronze.Production_ProductCategory
		SELECT *
		FROM AdventureWorks2022.Production.ProductCategory;

		-- Production_ProductCostHistory
		TRUNCATE TABLE bronze.Production_ProductCostHistory
		INSERT INTO bronze.Production_ProductCostHistory
		SELECT *
		FROM AdventureWorks2022.Production.ProductCostHistory;

		-- Production_ProductDescription
		TRUNCATE TABLE bronze.Production_ProductDescription
		INSERT INTO bronze.Production_ProductDescription
		SELECT *
		FROM AdventureWorks2022.Production.ProductDescription;

		-- Production_ProductDocument
		TRUNCATE TABLE bronze.Production_Document
		INSERT INTO bronze.Production_Document
		SELECT *
		FROM AdventureWorks2022.Production.Document;

		-- Production_ProductInventory
		TRUNCATE TABLE bronze.Production_ProductInventory
		INSERT INTO bronze.Production_ProductInventory
		SELECT *
		FROM AdventureWorks2022.Production.ProductInventory;

		-- Production_ProductListPriceHistory
		TRUNCATE TABLE bronze.Production_ProductListPriceHistory
		INSERT INTO bronze.Production_ProductListPriceHistory
		SELECT *
		FROM AdventureWorks2022.Production.ProductListPriceHistory;

		-- Production_ProductModel
		TRUNCATE TABLE bronze.Production_ProductModel
		INSERT INTO bronze.Production_ProductModel
		SELECT *
		FROM AdventureWorks2022.Production.ProductModel;

		-- Production_ProductModelIllustration
		TRUNCATE TABLE bronze.Production_ProductModelIllustration
		INSERT INTO bronze.Production_ProductModelIllustration
		SELECT *
		FROM AdventureWorks2022.Production.ProductModelIllustration;

		-- Production_ProductModelProductDescriptionCulture
		TRUNCATE TABLE bronze.Production_ProductModelProductDescriptionCulture
		INSERT INTO bronze.Production_ProductModelProductDescriptionCulture
		SELECT *
		FROM AdventureWorks2022.Production.ProductModelProductDescriptionCulture;

		-- Production_ProductPhoto
		TRUNCATE TABLE bronze.Production_ProductPhoto
		INSERT INTO bronze.Production_ProductPhoto
		SELECT *
		FROM AdventureWorks2022.Production.ProductPhoto;

		-- Production_ProductProductPhoto
		TRUNCATE TABLE bronze.Production_ProductProductPhoto
		INSERT INTO bronze.Production_ProductProductPhoto
		SELECT *
		FROM AdventureWorks2022.Production.ProductProductPhoto;

		-- Production_ProductReview
		TRUNCATE TABLE bronze.Production_ProductReview
		INSERT INTO bronze.Production_ProductReview
		SELECT *
		FROM AdventureWorks2022.Production.ProductReview;

		-- Production_ProductSubcategory
		TRUNCATE TABLE bronze.Production_ProductSubcategory
		INSERT INTO bronze.Production_ProductSubcategory
		SELECT *
		FROM AdventureWorks2022.Production.ProductSubcategory;

		-- Production_ScrapReason
		TRUNCATE TABLE bronze.Production_ScrapReason
		INSERT INTO bronze.Production_ScrapReason
		SELECT *
		FROM AdventureWorks2022.Production.ScrapReason;

		-- Production_TransactionHistory
		TRUNCATE TABLE bronze.Production_TransactionHistory
		INSERT INTO bronze.Production_TransactionHistory
		SELECT *
		FROM AdventureWorks2022.Production.TransactionHistory;

		-- Production_TransactionHistoryArchive
		TRUNCATE TABLE bronze.Production_TransactionHistoryArchive
		INSERT INTO bronze.Production_TransactionHistoryArchive
		SELECT *
		FROM AdventureWorks2022.Production.TransactionHistoryArchive;

		-- Production_UnitMeasure
		TRUNCATE TABLE bronze.Production_UnitMeasure
		INSERT INTO bronze.Production_UnitMeasure
		SELECT *
		FROM AdventureWorks2022.Production.UnitMeasure;

		-- Production_WorkOrder
		TRUNCATE TABLE bronze.Production_WorkOrder
		INSERT INTO bronze.Production_WorkOrder
		SELECT *
		FROM AdventureWorks2022.Production.WorkOrder;

		-- Production_WorkOrderRouting
		TRUNCATE TABLE bronze.Production_WorkOrderRouting
		INSERT INTO bronze.Production_WorkOrderRouting
		SELECT *
		FROM AdventureWorks2022.Production.WorkOrderRouting;

		PRINT '-- Cargando Tablas Purchasing --'

		-- Purchasing_ProductVendor
		TRUNCATE TABLE bronze.Purchasing_ProductVendor
		INSERT INTO bronze.Purchasing_ProductVendor
		SELECT *
		FROM AdventureWorks2022.Purchasing.ProductVendor;

		-- Purchasing_PurchaseOrderDetail
		TRUNCATE TABLE bronze.Purchasing_PurchaseOrderDetail
		INSERT INTO bronze.Purchasing_PurchaseOrderDetail
		SELECT *
		FROM AdventureWorks2022.Purchasing.PurchaseOrderDetail;

		--Purchasing_PurchaseOrderHeader
		TRUNCATE TABLE bronze.Purchasing_PurchaseOrderHeader
		INSERT INTO bronze.Purchasing_PurchaseOrderHeader
		SELECT *
		FROM AdventureWorks2022.Purchasing.PurchaseOrderHeader;

		-- Purchasing_ShipMethod
		TRUNCATE TABLE bronze.Purchasing_ShipMethod
		INSERT INTO bronze.Purchasing_ShipMethod
		SELECT *
		FROM AdventureWorks2022.Purchasing.ShipMethod;

		-- Purchasing_Vendor
		TRUNCATE TABLE bronze.Purchasing_Vendor
		INSERT INTO bronze.Purchasing_Vendor
		SELECT *
		FROM AdventureWorks2022.Purchasing.Vendor;

		PRINT '-- Cargando Tablas Sales --'

		-- Sales_CountryRegionCurrency
		TRUNCATE TABLE bronze.Sales_CountryRegionCurrency
		INSERT INTO bronze.Sales_CountryRegionCurrency
		SELECT *
		FROM AdventureWorks2022.Sales.CountryRegionCurrency;

		-- Sales_CreditCard
		TRUNCATE TABLE bronze.Sales_CreditCard
		INSERT INTO bronze.Sales_CreditCard
		SELECT *
		FROM AdventureWorks2022.Sales.CreditCard;

		-- Sales_Currency
		TRUNCATE TABLE bronze.Sales_Currency
		INSERT INTO bronze.Sales_Currency
		SELECT *
		FROM AdventureWorks2022.Sales.Currency;

		-- Sales_CurrencyRate
		TRUNCATE TABLE bronze.Sales_CurrencyRate
		INSERT INTO bronze.Sales_CurrencyRate
		SELECT *
		FROM AdventureWorks2022.Sales.CurrencyRate;

		-- Sales_Customer
		TRUNCATE TABLE bronze.Sales_Customer
		INSERT INTO bronze.Sales_Customer
		SELECT *
		FROM AdventureWorks2022.Sales.Customer;

		-- Sales_PersonCreditCard
		TRUNCATE TABLE bronze.Sales_PersonCreditCard
		INSERT INTO bronze.Sales_PersonCreditCard
		SELECT *
		FROM AdventureWorks2022.Sales.PersonCreditCard;

		-- Sales_SalesOrderDetail
		TRUNCATE TABLE bronze.Sales_SalesOrderDetail
		INSERT INTO bronze.Sales_SalesOrderDetail
		SELECT *
		FROM AdventureWorks2022.Sales.SalesOrderDetail;

		-- Sales_SalesOrderHeader
		TRUNCATE TABLE bronze.Sales_SalesOrderHeader
		INSERT INTO bronze.Sales_SalesOrderHeader
		SELECT *
		FROM AdventureWorks2022.Sales.SalesOrderHeader;

		-- Sales_SalesOrderHeaderSalesReason
		TRUNCATE TABLE bronze.Sales_SalesOrderHeaderSalesReason
		INSERT INTO bronze.Sales_SalesOrderHeaderSalesReason
		SELECT *
		FROM AdventureWorks2022.Sales.SalesOrderHeaderSalesReason;

		-- Sales_SalesPerson
		TRUNCATE TABLE bronze.Sales_SalesPerson
		INSERT INTO bronze.Sales_SalesPerson
		SELECT *
		FROM AdventureWorks2022.Sales.SalesPerson;

		-- Sales_SalesPersonQuotaHistory
		TRUNCATE TABLE bronze.Sales_SalesPersonQuotaHistory
		INSERT INTO bronze.Sales_SalesPersonQuotaHistory
		SELECT *
		FROM AdventureWorks2022.Sales.SalesPersonQuotaHistory;

		-- Sales_SalesReason
		TRUNCATE TABLE bronze.Sales_SalesReason
		INSERT INTO bronze.Sales_SalesReason
		SELECT *
		FROM AdventureWorks2022.Sales.SalesReason;

		-- Sales_SalesTaxRate
		TRUNCATE TABLE bronze.Sales_SalesTaxRate
		INSERT INTO bronze.Sales_SalesTaxRate
		SELECT *
		FROM AdventureWorks2022.Sales.SalesTaxRate;

		-- Sales_SalesTerritory
		TRUNCATE TABLE bronze.Sales_SalesTerritory
		INSERT INTO bronze.Sales_SalesTerritory
		SELECT *
		FROM AdventureWorks2022.Sales.SalesTerritory;

		-- Sales_SalesTerritoryHistory
		TRUNCATE TABLE bronze.Sales_SalesTerritoryHistory
		INSERT INTO bronze.Sales_SalesTerritoryHistory
		SELECT *
		FROM AdventureWorks2022.Sales.SalesTerritoryHistory;

		-- Sales_ShoppingCartItem
		TRUNCATE TABLE bronze.Sales_ShoppingCartItem
		INSERT INTO bronze.Sales_ShoppingCartItem
		SELECT *
		FROM AdventureWorks2022.Sales.ShoppingCartItem;

		-- Sales_SpecialOffer
		TRUNCATE TABLE bronze.Sales_SpecialOffer
		INSERT INTO bronze.Sales_SpecialOffer
		SELECT *
		FROM AdventureWorks2022.Sales.SpecialOffer;

		-- Sales_SpecialOfferProduct
		TRUNCATE TABLE bronze.Sales_SpecialOfferProduct
		INSERT INTO bronze.Sales_SpecialOfferProduct
		SELECT *
		FROM AdventureWorks2022.Sales.SpecialOfferProduct;

		-- Sales_Store
		TRUNCATE TABLE bronze.Sales_Store
		INSERT INTO bronze.Sales_Store
		SELECT *
		FROM AdventureWorks2022.Sales.Store;
	END TRY
	BEGIN CATCH
	END CATCH
END