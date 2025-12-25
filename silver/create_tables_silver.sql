
/*
  CAPA: Silver (datos depurados/estandarizados)
  OBJETIVO: Definir la estructura (DDL) de las tablas Silver a partir del OLTP.
  ALCANCE: Creación de tablas por dominio ( HumanResources, Sales, Purchasing, Sales, Person).
  NOTAS:
    - Este archivo SOLO crea objetos (CREATE TABLE).
    - La carga/transformación (INSERT/MERGE) va en scripts separados.
    - Silver consolida datos más “limpios” que Bronze y sirve como base para modelos de consumo (Gold).
*/


CREATE TABLE silver.HumanResources_Department (
	DepartmentID SMALLINT NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	GroupName NVARCHAR(50) NOT NULL,
	ModifiedDate DATE NOT NULL
)

CREATE TABLE silver.HumanResources_Employee (
    BusinessEntityID INT NOT NULL,
    NationalIDNumber NVARCHAR(15) NOT NULL,
    LoginID NVARCHAR(256) NOT NULL,
    OrganizationNode HIERARCHYID NULL,     
    OrganizationLevel SMALLINT NULL,        
    JobTitle NVARCHAR(50) NOT NULL,
    BirthDate DATE NOT NULL,
    MaritalStatus NCHAR(1) NOT NULL,
    Gender NCHAR(1) NOT NULL,
    HireDate DATE NOT NULL,
	SalariedFlag BIT NOT NULL, 
	VacationHours SMALLINT NOT NULL,
	SickLeaveHours SMALLINT NOT NULL,
    CurrentFlag BIT NOT NULL,           
    rowguid NVARCHAR(36) NOT NULL,          
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.HumanResources_EmployeeDepartmentHistory (
    BusinessEntityID INT NOT NULL,
    DepartmentID SMALLINT NOT NULL,
	ShiftID SMALLINT NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.HumanResources_EmployeePayHistory (
	BusinessEntityID INT NOT NULL,
	RateChangeDate DATETIME NOT NULL,
	Rate MONEY NOT NULL,
	PayFrequency TINYINT NOT NULL,
	ModifiedDate DATETIME NOT NULL,
)

CREATE TABLE silver.HumanResources_JobCandidate (
	JobCandidateID INT NOT NULL,
	BusinessEntityID INT NULL,
	Resume XML NULL,
	ModifiedDate DATETIME NOT NULL,
)

CREATE TABLE silver.HumanResources_Shift (
	ShiftID TINYINT NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	StartTime TIME NOT NULL,
	EndTime TIME NOT NULL,
	ModifiedDate DATETIME NOT NULL,
)

CREATE TABLE silver.Person_Address (
	AddressID INT NOT NULL,
	AddressLine1 NVARCHAR(60) NOT NULL,
	AddressLine2 NVARCHAR(60) NULL,
	City NVARCHAR(30) NOT NULL,
	StateProvinceID INT NOT NULL,
	PostalCode NVARCHAR(15) NOT NULL,
	SpatialLocation GEOGRAPHY NULL,
	rowguid UNIQUEIDENTIFIER NOT NULL,
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Person_AddressType (
	AddressTypeID INT NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	rowguid UNIQUEIDENTIFIER NOT NULL,
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Person_BusinessEntity (
	BusinessEntityID INT NOT NULL,
	rowguid UNIQUEIDENTIFIER NOT NULL,
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Person_BusinessEntityAddress (
	BusinessEntityID INT NOT NULL,
	AddressID INT NOT NULL,
	AddressTypeID INT NOT NULL,
	rowguid UNIQUEIDENTIFIER NOT NULL,
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Person_BusinessEntityContact (
	BusinessEntityID INT NOT NULL,
	PersonID INT NOT NULL,
	ContactTypeID INT NOT NULL,
	rowguid UNIQUEIDENTIFIER NOT NULL,
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Person_ContactType (
	ContactTypeID INT NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Person_CountryRegion (
	CountryRegionCode NVARCHAR(3) NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Person_EmailAddress (
	BusinessEntityID INT NOT NULL,
	EmailAddressID INT NOT NULL,
	EmailAddress NVARCHAR(50) NULL,
	rowguid UNIQUEIDENTIFIER NOT NULL,
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Person_Password (
	BusinessEntityID INT NOT NULL,
	PasswordHash VARCHAR(128) NOT NULL,
	PasswordSalt VARCHAR(10) NOT NULL,
	rowguid UNIQUEIDENTIFIER NOT NULL,
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Person_Person (
	BusinessEntityID INT NOT NULL,
	PersonType NCHAR(2) NOT NULL,
	NameStyle BIT NOT NULL,
	Title NVARCHAR(8) NULL,
	FirstName NVARCHAR(50) NOT NULL,
	MiddleName NVARCHAR(50) NULL,
	LastName NVARCHAR(50) NOT NULL,
	Suffix NVARCHAR(10) NULL,
	EmailPromotion INT NOT NULL,
	AdditionalContactInfo XML NULL,
	Demographics XML NULL,
	rowguid UNIQUEIDENTIFIER NOT NULL,
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Person_PersonPhone (
	BusinessEntityID INT NOT NULL,
	PhoneNumber NVARCHAR(25) NOT NULL,
	PhoneNumberTypeID INT NOT NULL,
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Person_PhoneNumberType (
	PhoneNumberTypeID INT NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Person_StateProvince (
	StateProvinceID INT NOT NULL,
	StateProvinceCode NCHAR(3) NOT NULL,
	CountryRegionCode NVARCHAR(3) NOT NULL,
	IsOnlyStateProvinceFlag BIT NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	TerritoryID INT NOT NULL,
	rowguid UNIQUEIDENTIFIER NOT NULL,
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Production_BillOfMaterials (
	BillOfMaterialsID INT NOT NULL,
	ProductAssemblyID INT NULL,
	ComponentID INT NOT NULL,
	StartDate DATETIME NOT NULL,
	EndDate DATETIME NULL,
	UnitMeasureCode NCHAR(3) NOT NULL,
	BOMLevel SMALLINT NOT NULL,
	PerAssemblyQty DECIMAL(8,2) NOT NULL, 
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Production_Culture (
	CultureID NCHAR(6) NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Production_Document (
	DocumentNode HIERARCHYID NOT NULL,
	DocumentLevel SMALLINT NULL,
	Title NVARCHAR(50) NOT NULL,
	Owner INT NOT NULL,
	FolderFlag BIT NOT NULL,
	FileName NVARCHAR(400) NOT NULL,
	FileExtension NVARCHAR(8) NOT NULL,
	Revision NCHAR(5) NOT NULL,
	ChangeNumber INT NOT NULL,
	Status TINYINT NOT NULL,
	DocumentSummary NVARCHAR(MAX) NULL,
	Document VARBINARY(MAX) NULL,
	rowguid UNIQUEIDENTIFIER NOT NULL,
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Production_Location (
	LocationID INT NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	CostRate SMALLMONEY NOT NULL,
	Availability DECIMAL(8,2) NOT NULL,
	ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Production_Product (
    ProductID INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,              
    ProductNumber NVARCHAR(25) NOT NULL,     
    MakeFlag BIT NOT NULL,                   
    FinishedGoodsFlag BIT NOT NULL,          
    Color NVARCHAR(15) NULL,
    SafetyStockLevel SMALLINT NOT NULL,
    ReorderPoint SMALLINT NOT NULL,
    StandardCost MONEY NOT NULL,             
    ListPrice MONEY NOT NULL,               
    Size NVARCHAR(5) NULL,
    SizeUnitMeasureCode NCHAR(3) NULL,       
    WeightUnitMeasureCode NCHAR(3) NULL,   
    Weight DECIMAL(8, 2) NULL,
    DaysToManufacture INT NOT NULL,
    ProductLine NCHAR(2) NULL,              
    Class NCHAR(2) NULL,                    
    Style NCHAR(2) NULL,                     
    ProductSubcategoryID INT NULL,
    ProductModelID INT NULL,
    SellStartDate DATETIME NOT NULL,        
    SellEndDate DATETIME NULL,              
    DiscontinuedDate DATETIME NULL,         
    rowguid UNIQUEIDENTIFIER NOT NULL,      
    ModifiedDate DATETIME NOT NULL         
);

CREATE TABLE silver.Production_ProductCategory (
    ProductCategoryID INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Production_ProductCostHistory (
    ProductID INT NOT NULL,
    StartDate DATETIME NOT NULL,           
    EndDate DATETIME NULL,
    StandardCost MONEY NOT NULL,             
    ModifiedDate DATETIME NOT NULL

)

CREATE TABLE silver.Production_ProductDescription (
    ProductDescriptionID INT NOT NULL,
    Description NVARCHAR(400) NOT NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
)

CREATE TABLE silver.Production_ProductDocument (
    ProductID INT NOT NULL,
    DocumentNode HIERARCHYID NOT NULL, 
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Production_ProductInventory (
    ProductID INT NOT NULL,
    LocationID SMALLINT NOT NULL,
    Shelf NVARCHAR(10) NOT NULL,
    Bin TINYINT NOT NULL,          
    Quantity SMALLINT NOT NULL,     
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Production_ProductListPriceHistory (
    ProductID INT NOT NULL,
    StartDate DATETIME NOT NULL,           
    EndDate DATETIME NULL,
    ListPrice MONEY NOT NULL,             
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Production_ProductModel (
    ProductModelID INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    CatalogDescription XML NULL, 
    Instructions XML NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Production_ProductModelIllustration (
    ProductModelID INT NOT NULL,
    IllustrationID INT NOT NULL, 
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Production_ProductModelProductDescriptionCulture (
    ProductModelID INT NOT NULL,
    ProductDescriptionID INT NOT NULL, 
    CultureID NCHAR(6) NOT NULL,            
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Production_ProductPhoto (
    ProductPhotoID INT NOT NULL,
    ThumbNailPhoto VARBINARY(MAX) NULL, 
    ThumbnailPhotoFileName NVARCHAR(50) NULL,
    LargePhoto VARBINARY(MAX) NULL,
    LargePhotoFileName NVARCHAR(50) NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Production_ProductProductPhoto (
    ProductID INT NOT NULL,
    ProductPhotoID INT NOT NULL, 
    [Primary] BIT NOT NULL,                
    ModifiedDate DATETIME NOT NULL
    
);


CREATE TABLE silver.Production_ProductReview (
    ProductReviewID INT NOT NULL,
    ProductID INT NOT NULL,
    ReviewerName NVARCHAR(50) NOT NULL,
    ReviewDate DATETIME NOT NULL,
    EmailAddress NVARCHAR(50) NOT NULL,
    Rating INT NOT NULL,
    Comments NVARCHAR(3850) NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Production_ProductSubcategory (
    ProductSubcategoryID INT NOT NULL,
    ProductCategoryID INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Production_ScrapReason (
    ScrapReasonID SMALLINT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Production_TransactionHistory (
    TransactionID INT NOT NULL,
    ProductID INT NOT NULL,
    ReferenceOrderID INT NOT NULL,
    ReferenceOrderLineID INT NOT NULL,
    TransactionDate DATETIME NOT NULL,
    TransactionType NCHAR(1) NOT NULL,
    Quantity INT NOT NULL,
    ActualCost MONEY NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Production_TransactionHistoryArchive (
    TransactionID INT NOT NULL,
    ProductID INT NOT NULL,
    ReferenceOrderID INT NOT NULL,
    ReferenceOrderLineID INT NOT NULL,
    TransactionDate DATETIME NOT NULL,
    TransactionType NCHAR(1) NOT NULL,
    Quantity INT NOT NULL,
    ActualCost MONEY NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Production_UnitMeasure (
    UnitMeasureCode NCHAR(3) NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Production_WorkOrder (
    WorkOrderID INT NOT NULL,
    ProductID INT NOT NULL,
    OrderQty INT NOT NULL,
    StockedQty INT NOT NULL, 
    ScrappedQty SMALLINT NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NULL,
    DueDate DATETIME NOT NULL,
    ScrapReasonID SMALLINT NULL, 
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Production_WorkOrderRouting (
    WorkOrderID INT NOT NULL,
    ProductID INT NOT NULL,
    OperationSequence SMALLINT NOT NULL,
    LocationID SMALLINT NOT NULL,
    ScheduledStartDate DATETIME NOT NULL,
    ScheduledEndDate DATETIME NOT NULL,
    ActualStartDate DATETIME NULL,
    ActualEndDate DATETIME NULL,
    ActualResourceHrs DECIMAL(9,4) NULL,
    PlannedCost MONEY NOT NULL,
    ActualCost MONEY NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Purchasing_ProductVendor (
    ProductID INT NOT NULL,
    BusinessEntityID INT NOT NULL,
    AverageLeadTime INT NOT NULL,
    StandardPrice MONEY NOT NULL,
    LastReceiptCost MONEY NULL,
    LastReceiptDate DATETIME NULL,
    MinOrderQty INT NOT NULL,
    MaxOrderQty INT NOT NULL,
    OnOrderQty INT NULL,
    UnitMeasureCode NCHAR(3) NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Purchasing_PurchaseOrderDetail (
    PurchaseOrderID INT NOT NULL,
    PurchaseOrderDetailID INT NOT NULL,
    DueDate DATETIME NOT NULL,
    OrderQty SMALLINT NOT NULL,
    ProductID INT NOT NULL,
    UnitPrice MONEY NOT NULL,
    LineTotal MONEY NOT NULL,
    ReceivedQty DECIMAL(8,2) NOT NULL,
    RejectedQty DECIMAL(8,2) NOT NULL,
    StockedQty DECIMAL(9,2) NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Purchasing_PurchaseOrderHeader (
    PurchaseOrderID INT NOT NULL,
    RevisionNumber TINYINT NOT NULL,
    Status TINYINT NOT NULL,
    EmployeeID INT NOT NULL,
    VendorID INT NOT NULL,
    ShipMethodID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    ShipDate DATETIME NULL,
    SubTotal MONEY NOT NULL,
    TaxAmt MONEY NOT NULL,
    Freight MONEY NOT NULL,
    TotalDue MONEY NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Purchasing_ShipMethod (
    ShipMethodID INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    ShipBase MONEY NOT NULL,
    ShipRate MONEY NOT NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Purchasing_Vendor (
    BusinessEntityID INT NOT NULL,
    AccountNumber NVARCHAR(15) NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    CreditRating TINYINT NOT NULL,
    PreferredVendorStatus BIT NOT NULL,
    ActiveFlag BIT NOT NULL,
    PurchasingWebServiceURL NVARCHAR(1024) NULL, 
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_CountryRegionCurrency (
    CountryRegionCode NVARCHAR(3) NOT NULL,
    CurrencyCode NCHAR(3) NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_CreditCard (
    CreditCardID INT NOT NULL,
    CardType NVARCHAR(50) NOT NULL,
    CardNumber NVARCHAR(25) NOT NULL,
    ExpMonth TINYINT NOT NULL,
    ExpYear SMALLINT NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_Currency (
    CurrencyCode NCHAR(3) NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_CurrencyRate (
    CurrencyRateID INT NOT NULL,
    CurrencyRateDate DATETIME NOT NULL,
    FromCurrencyCode NCHAR(3) NOT NULL,
    ToCurrencyCode NCHAR(3) NOT NULL,
    AverageRate MONEY NOT NULL,
    EndOfDayRate MONEY NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_Customer (
    CustomerID INT NOT NULL,
    PersonID INT NULL,      
    StoreID INT NULL,        
    TerritoryID INT NULL,    
    AccountNumber VARCHAR(10) NOT NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_PersonCreditCard (
    BusinessEntityID INT NOT NULL,
    CreditCardID INT NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_SalesOrderDetail (
    SalesOrderID INT NOT NULL,
    SalesOrderDetailID INT NOT NULL,
    CarrierTrackingNumber NVARCHAR(25) NULL,
    OrderQty SMALLINT NOT NULL,
    ProductID INT NOT NULL,
    SpecialOfferID INT NOT NULL,
    UnitPrice MONEY NOT NULL,
    UnitPriceDiscount MONEY NOT NULL,
    LineTotal NUMERIC(38,6) NOT NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_SalesOrderHeader (
    SalesOrderID INT NOT NULL,
    RevisionNumber TINYINT NOT NULL,
    OrderDate DATETIME NOT NULL,
    DueDate DATETIME NOT NULL,
    ShipDate DATETIME NULL,
    Status TINYINT NOT NULL,
    OnlineOrderFlag BIT NOT NULL,
    SalesOrderNumber NVARCHAR(25) NOT NULL,
    PurchaseOrderNumber NVARCHAR(25) NULL,
    AccountNumber NVARCHAR(15) NULL,
    CustomerID INT NOT NULL,
    SalesPersonID INT NULL,
    TerritoryID INT NULL,
    BillToAddressID INT NOT NULL,
    ShipToAddressID INT NOT NULL,
    ShipMethodID INT NOT NULL,
    CreditCardID INT NULL,
    CreditCardApprovalCode VARCHAR(15) NULL,
    CurrencyRateID INT NULL,
    SubTotal MONEY NOT NULL,
    TaxAmt MONEY NOT NULL,
    Freight MONEY NOT NULL,
    TotalDue MONEY NOT NULL,
    Comment NVARCHAR(128) NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_SalesOrderHeaderSalesReason (
    SalesOrderID INT NOT NULL,
    SalesReasonID INT NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_SalesPerson (
    BusinessEntityID INT NOT NULL,
    TerritoryID INT NULL,
    SalesQuota MONEY NULL,
    Bonus MONEY NOT NULL,
    CommissionPct SMALLMONEY NOT NULL,
    SalesYTD MONEY NOT NULL,
    SalesLastYear MONEY NOT NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_SalesPersonQuotaHistory (
    BusinessEntityID INT NOT NULL,
    QuotaDate DATETIME NOT NULL,
    SalesQuota MONEY NOT NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_SalesReason (
    SalesReasonID INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    ReasonType NVARCHAR(50) NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_SalesTaxRate (
    SalesTaxRateID INT NOT NULL,
    StateProvinceID INT NOT NULL,
    TaxType TINYINT NOT NULL,
    TaxRate SMALLMONEY NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_SalesTerritory (
    TerritoryID INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    CountryRegionCode NVARCHAR(3) NOT NULL,
    [Group] NVARCHAR(50) NOT NULL,
    SalesYTD MONEY NOT NULL,
    SalesLastYear MONEY NOT NULL,
    CostYTD MONEY NOT NULL,
    CostLastYear MONEY NOT NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_SalesTerritoryHistory (
    BusinessEntityID INT NOT NULL,
    TerritoryID INT NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_ShoppingCartItem (
    ShoppingCartItemID INT NOT NULL,
    ShoppingCartID NVARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    ProductID INT NOT NULL,
    DateCreated DATETIME NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_SpecialOffer (
    SpecialOfferID INT NOT NULL,
    Description NVARCHAR(255) NOT NULL,
    DiscountPct SMALLMONEY NOT NULL,
    [Type] NVARCHAR(50) NOT NULL,
    Category NVARCHAR(50) NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    MinQty INT NOT NULL,
    MaxQty INT NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_SpecialOfferProduct (
    SpecialOfferID INT NOT NULL,
    ProductID INT NOT NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Sales_Store (
    BusinessEntityID INT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    SalesPersonID INT NULL,
    Demographics XML NULL,
    rowguid UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate DATETIME NOT NULL
);

CREATE TABLE silver.Production_Illustration (
    IllustrationID INT NOT NULL,
    Diagram XML NULL,
    ModifiedDate DATETIME NOT NULL
);