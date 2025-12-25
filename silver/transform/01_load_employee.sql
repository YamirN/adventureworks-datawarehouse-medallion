
/* ============================================================
	Verificacion de dominio 
   ============================================================ */

	-- Debe devolver 0 filas
	SELECT BusinessEntityID, COUNT(*) AS cnt
	FROM bronze.HumanResources_Employee
	GROUP BY BusinessEntityID
	HAVING COUNT(*) > 1;

	-- Debe devolver 0
	SELECT COUNT(*) AS null_businessentityid
	FROM bronze.HumanResources_Employee
	WHERE BusinessEntityID IS NULL;

	-- Debe devolver 0 filas: dominio controlado
	SELECT *
	FROM bronze.HumanResources_Employee
	WHERE Gender NOT IN ('M','F') OR Gender IS NULL;

	-- Debe devolver 0 filas (según AdventureWorks normalmente S/M)
	SELECT *
	FROM bronze.HumanResources_Employee
	WHERE MaritalStatus NOT IN ('S','M') OR MaritalStatus IS NULL;

	-- Flags: deben ser 0 o 1 (si ya vienen como bit, igual sirve como check de dominio)
	SELECT *
	FROM bronze.HumanResources_Employee
	WHERE SalariedFlag NOT IN (0,1) OR CurrentFlag NOT IN (0,1);

	-- Debe devolver 0 filas: fechas consistentes
	SELECT *
	FROM bronze.HumanResources_Employee
	WHERE BirthDate >= HireDate;

	-- Debe devolver 0 filas: horas no negativas (ajusta umbrales si quieres)
	SELECT *
	FROM bronze.HumanResources_Employee
	WHERE VacationHours < 0 OR SickLeaveHours < 0;

	-- Útil para detectar cargas “viejas”
	SELECT MAX(ModifiedDate) AS max_modifieddate
	FROM bronze.HumanResources_Employee;

/* ============================================================
   CARGA SILVER: HumanResources_Employee
   ORIGEN : bronze.HumanResources_Employee
   DESTINO: silver.HumanResources_Employee
   OBJETIVO:
     - Estandarizar campos de texto (TRIM) y fechas.
     - Mantener estructura consistente para consumo posterior (Gold).
   PRECONDICIÓN:
     - Validaciones de dominio (unique, not_null, accepted values) ya ejecutadas OK.
   NOTA:
     - Se listan columnas explícitamente para controlar el mapeo. [web:299]
   ============================================================ */

-- (Opcional) si tu estrategia es full refresh en Silver:
-- TRUNCATE TABLE silver.HumanResources_Employee;

	INSERT INTO silver.HumanResources_Employee (
		BusinessEntityID,
		NationalIDNumber,
		LoginID,
		OrganizationNode,
		OrganizationLevel,
		JobTitle,
		BirthDate,
		MaritalStatus,
		Gender,
		HireDate,
		SalariedFlag,
		VacationHours,
		SickLeaveHours,
		CurrentFlag,
		rowguid,
		ModifiedDate
	)
	SELECT
		BusinessEntityID,
		TRIM(NationalIDNumber) AS NationalIDNumber,
		TRIM(LoginID)          AS LoginID,
		OrganizationNode,
		OrganizationLevel,
		TRIM(JobTitle)         AS JobTitle,
		CAST(BirthDate AS date)     AS BirthDate,
		TRIM(MaritalStatus)         AS MaritalStatus,
		TRIM(Gender)                AS Gender,
		CAST(HireDate AS date)      AS HireDate,
		SalariedFlag,
		VacationHours,
		SickLeaveHours,
		CurrentFlag,
		rowguid,      
		ModifiedDate
	FROM bronze.HumanResources_Employee;

-- Verificación rápida post-carga 
	SELECT TOP (50) *
	FROM silver.HumanResources_Employee;
