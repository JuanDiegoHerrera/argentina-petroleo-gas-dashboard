CREATE OR REPLACE TABLE `produccion-hidrocarburos.base_hidrocarburos.resumen_produccion_historica` AS
WITH base_unificada AS (

  -- 2006 a 2023 (38 columnas)
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2006`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2007`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2008`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2009`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2010`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2011`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2012`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2013`
  UNION ALL
  -- Ojo: si tu tabla 2014 se llama produccion_pyg_2014 dejala así, si le pusiste produccion_gyp_2014 cambiala acá
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_pyg_2014`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2015`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2016`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2017`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2018`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2019`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2020`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2021`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2022`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2023`
  
  UNION ALL
  -- 2024 y 2025 (39 columnas, seleccionamos las mismas 11)
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2024`
  UNION ALL
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2025`
  
  UNION ALL
  -- 2026 (38 columnas)
  SELECT anio, mes, provincia, cuenca, empresa, idempresa, tipo_de_recurso, prod_gas, prod_pet, prod_agua, idpozo 
  FROM `produccion-hidrocarburos.base_hidrocarburos.produccion_gyp_2026`

)

SELECT
  -- 1. Dimensión de Fecha (primer día de cada mes para gráficos de series temporales)
  DATE(CAST(anio AS INT64), CAST(mes AS INT64), 1) AS fecha,
  
  -- 2. Año (para selectores y filtros)
  CAST(anio AS INT64) AS anio,
  
  -- 3. Mes
  CAST(mes AS INT64) AS mes,

  -- 4. Provincia Normalizada (para que Looker Studio pinte el mapa sin fallar)
  CASE 
    WHEN TRIM(UPPER(provincia)) LIKE '%TIERRA DEL FUEGO%' THEN 'Tierra del Fuego'
    WHEN TRIM(UPPER(provincia)) LIKE '%SANTA CRUZ%' THEN 'Santa Cruz'
    WHEN TRIM(UPPER(provincia)) LIKE '%NEUQU%' THEN 'Neuquén'
    WHEN TRIM(UPPER(provincia)) LIKE '%CHUBUT%' THEN 'Chubut'
    WHEN TRIM(UPPER(provincia)) LIKE '%MENDOZA%' THEN 'Mendoza'
    WHEN TRIM(UPPER(provincia)) LIKE '%RIO NEGRO%' OR TRIM(UPPER(provincia)) LIKE '%RÍO NEGRO%' THEN 'Río Negro'
    WHEN TRIM(UPPER(provincia)) LIKE '%SALTA%' THEN 'Salta'
    WHEN TRIM(UPPER(provincia)) LIKE '%FORMOSA%' THEN 'Formosa'
    WHEN TRIM(UPPER(provincia)) LIKE '%LA PAMPA%' THEN 'La Pampa'
    WHEN TRIM(UPPER(provincia)) LIKE '%JUJUY%' THEN 'Jujuy'
    ELSE INITCAP(TRIM(provincia))
  END AS provincia,
  
  -- 5. Cuenca
  TRIM(cuenca) AS cuenca,
  
  -- 6. Empresa
  TRIM(empresa) AS empresa,
  
  -- 7. ID Empresa (para análisis de concentración / código de operadora)
  TRIM(idempresa) AS idempresa,
  
  -- 8. Tipo de Recurso (Convencional / No Convencional)
  TRIM(tipo_de_recurso) AS tipo_de_recurso,
