# argentina-petroleo-gas-dashboard
Dashboard interactivo sobre la producción histórica de petróleo y gas en Argentina (2006–2026) utilizando Google BigQuery y Looker Studio

link:[ bigquery · looker-studio · analisis-de-datos · business-intelligence · sql · hidrocarburos · petroleo-y-gas · argentina · vaca-muerta · etl
](https://datastudio.google.com/reporting/cf301dc4-9ae2-439a-b327-3bbab070c847)


<img width="839" height="529" alt="image" src="https://github.com/user-attachments/assets/f6562ebb-344e-4267-ad0f-6621898cc483" />

<img width="693" height="542" alt="image" src="https://github.com/user-attachments/assets/658a2217-5d28-485a-8ed4-3118108ccbb6" />


## Resumen Técnico

1. Se elaboro la base de datos en a partir de los datos de la Secretaria de Energía de Argentina. https://datos.gob.ar/dataset/produccion-de-petroleo-y-gas-por-pozo
2. En google big query se ejecuto una consulta para hacer un union all de todas las tablas. Luego se creo una nueva tabla que solo contenia las columnas que nos parecian relevantes para el dashboard
3. A partir de la nueva tabla armamos el dashboard de la producción de gas y petróleo entre 2006 hasta Julio de 2026


El dashboard sigue en desarrollo y fue creado con asistencia de inteligencia artificial Gemini flash 3.7
