

  -- 1) WorkOrderID duplicado (debe devolver 0 filas)
SELECT WorkOrderID, COUNT(*) AS cnt
FROM bronze.Production_WorkOrder
GROUP BY WorkOrderID
HAVING COUNT(*) > 1;

-- 2) Nulos en columnas obligatorias (debe devolver 0)
SELECT *
FROM bronze.Production_WorkOrder
WHERE WorkOrderID IS NULL
   OR ProductID   IS NULL
   OR OrderQty    IS NULL
   OR StartDate   IS NULL
   OR DueDate     IS NULL
   OR ScrappedQty IS NULL;

-- 3) OrderQty debe ser > 0 (debe devolver 0 filas)
SELECT *
FROM bronze.Production_WorkOrder
WHERE OrderQty <= 0;  

-- 4) ScrappedQty debe ser >= 0 (debe devolver 0 filas)
SELECT *
FROM bronze.Production_WorkOrder
WHERE ScrappedQty < 0; 

-- 5) Consistencia entre cantidades (debe devolver 0 filas)
-- StockedQty en WorkOrder se define como OrderQty - ScrappedQty en AdventureWorks. [web:394]
SELECT *
FROM bronze.Production_WorkOrder
WHERE StockedQty <> (OrderQty - ScrappedQty);

-- 6) StartDate no puede ser mayor que DueDate (debe devolver 0 filas)
SELECT *
FROM bronze.Production_WorkOrder
WHERE StartDate > DueDate;

-- 7) Si EndDate existe, debe ser >= StartDate (debe devolver 0 filas)
SELECT *
FROM bronze.Production_WorkOrder
WHERE EndDate IS NOT NULL
  AND EndDate < StartDate;

 -- 8) Si ScrappedQty = 0, ScrapReasonID debería ser NULL (debe devolver 0 filas o muy pocas excepciones)
SELECT *
FROM bronze.Production_WorkOrder
WHERE ScrappedQty = 0
  AND ScrapReasonID IS NOT NULL;

-- 9) Si ScrappedQty > 0, debería existir una razón (ScrapReasonID no NULL) (debe devolver 0 filas o muy pocas excepciones)
SELECT *
FROM bronze.Production_WorkOrder
WHERE ScrappedQty > 0
  AND ScrapReasonID IS NULL;


  /* ============================================================
   CARGA SILVER: Production_WorkOrder
   ORIGEN : bronze.Production_WorkOrder
   DESTINO: silver.Production_WorkOrder
   OBJETIVO:
     - Estandarizar y normalizar datos para análisis (Gold).
     - Mantener trazabilidad (fechas originales) y consistencia de tipos.
   PRECONDICIÓN:
     - Validaciones de dominio OK (unique, not_null, cantidades, fechas).
   BUENA PRÁCTICA:
     - Columnas explícitas (evitar SELECT *). [web:305][web:299]
   ============================================================ */

-- (Opcional) Si tu estrategia Silver es full refresh:
-- TRUNCATE TABLE silver.Production_WorkOrder;

INSERT INTO silver.Production_WorkOrder
(
    WorkOrderID,
    ProductID,
    OrderQty,
    StockedQty,
    ScrappedQty,
    StartDate,
    EndDate,
    DueDate,
    ScrapReasonID,
    ModifiedDate
)
SELECT
    WorkOrderID,
    ProductID,
    OrderQty,
    StockedQty,
    ScrappedQty,
    CAST(StartDate AS date) AS StartDate,
    CAST(EndDate   AS date) AS EndDate,
    CAST(DueDate   AS date) AS DueDate,
    ScrapReasonID,
    CAST(ModifiedDate AS date) AS ModifiedDate
FROM bronze.Production_WorkOrder;


-- Verificación rápida (desarrollo)
SELECT TOP (50) *
FROM silver.Production_WorkOrder;
