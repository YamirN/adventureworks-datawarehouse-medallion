-- 1) Validación: IDs duplicados en Bronze (DepartmentID debe ser único)
-- Resultado esperado: 0 filas.
SELECT
    DepartmentID,
    COUNT(*) AS cnt
FROM bronze.HumanResources_Department
GROUP BY DepartmentID
HAVING COUNT(*) > 1;

-- 2) Carga a Silver: estandarización de campos
-- - TRIM() elimina espacios en blanco al inicio/fin (limpieza básica).
-- - CAST() normaliza el tipo de ModifiedDate a DATE.
-- Nota: Se listan columnas explícitamente para evitar problemas si cambia el esquema.
INSERT INTO silver.HumanResources_Department (
    DepartmentID,
    Name,
    GroupName,
    ModifiedDate
)
SELECT
    DepartmentID,
    TRIM(Name) AS Name,
    TRIM(GroupName) AS GroupName,
    CAST(ModifiedDate AS DATE) AS ModifiedDate
FROM bronze.HumanResources_Department;

-- 3) Verificación rápida post-carga (manual)
-- Útil para revisar resultados durante desarrollo; en producción se suele evitar SELECT *.
SELECT *
FROM silver.HumanResources_Department;

