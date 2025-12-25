<div align="center">

# 🏢 Data Warehouse - AdventureWorks 2022

### *Implementación de Data Warehouse con Arquitectura Medallion en SQL Server*

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![T-SQL](https://img.shields.io/badge/T--SQL-316192?style=for-the-badge&logo=tsql&logoColor=white)
![Data Warehouse](https://img.shields.io/badge/Data%20Warehouse-4285F4?style=for-the-badge&logo=google-cloud&logoColor=white)

---

</div>

## 📋 Descripción del Proyecto

Este repositorio contiene la implementación de un **Data Warehouse** basado en la base de datos **AdventureWorks2022** utilizando **SQL Server** y siguiendo la **Arquitectura Medallion**. El proyecto transforma datos transaccionales en un modelo analítico optimizado para reportería y análisis de negocio.

---

## 🏗️ Arquitectura Medallion

La arquitectura Medallion es un patrón de diseño que organiza los datos en capas progresivas, mejorando la calidad de los datos en cada etapa del proceso ETL:

<div align="center">

![Arquitectura Medallion](https://blog.bismart.com/hs-fs/hubfs/Arquitectura_Medallion_Pasos.jpg?width=1754&height=656&name=Arquitectura_Medallion_Pasos.jpg)

</div>

---

## 🎯 Capas del Proyecto

### 🥉 **Bronze Layer - Ingesta de Datos Crudos**
> *Raw Data Ingestion*

- 📥 Carga de datos raw desde las fuentes originales (CRM, LOB, ERP)
- 🔓 Datos sin transformar, tal como provienen de los sistemas transaccionales
- 📊 Representa el estado original de AdventureWorks2022
- ⚡ Ingesta por lotes

### 🥈 **Silver Layer - Datos Filtrados, Limpiados y Aumentados**
> *Filtered, Cleaned, Augmented*

- 🧹 Limpieza y estandarización de datos
- ✅ Validación de calidad y consistencia
- 🔍 Eliminación de duplicados y registros inválidos
- 📈 Enriquecimiento con datos adicionales
- 🔄 Normalización y tipificación de datos

### 🥇 **Gold Layer - Datos Listos para Negocio**
> *Business-Level Data*

- 💼 Modelos dimensionales optimizados para análisis
- 📊 Datos agregados y pre-calculados
- ⚡ Estructura optimizada para consultas de BI
- 🎯 Tablas de hechos y dimensiones
- 📈 KPIs y métricas de negocio

---

## 🛠️ Tecnologías Utilizadas

| Tecnología | Descripción |
|------------|-------------|
| **SQL Server** | Motor de base de datos principal |
| **T-SQL** | Lenguaje de consultas y transformaciones |
| **AdventureWorks2022** | Base de datos fuente transaccional |
| **SSIS** *(opcional)* | Herramienta ETL para automatización |

---

## 📊 Casos de Uso

Los datos procesados en este Data Warehouse permiten:

<table>
<tr>
<td width="33%" align="center">

### 📡 Streaming Analytics
Análisis en tiempo real de métricas clave del negocio

</td>
<td width="33%" align="center">

### 📈 BI & Reporting
Generación de reportes y dashboards ejecutivos

</td>
<td width="33%" align="center">

### 🤖 Data Science & ML
Preparación de datos para modelos predictivos

</td>
</tr>
</table>

---

## 📈 Flujo de Calidad de Datos

> El flujo de datos a través de las capas **Bronze → Silver → Gold** garantiza un incremento progresivo en la **calidad de los datos**, asegurando información confiable para la toma de decisiones empresariales.

