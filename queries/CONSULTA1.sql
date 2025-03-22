SELECT * FROM [usecases].DATAEX.[MMM01_WEB]
SELECT * FROM [usecases].DATAEX.[MMM02_VISIT]
SELECT * FROM [usecases].DATAEX.[MMM03_OFFLINE]
SELECT * FROM [usecases].DATAEX.[MMM04_TIME]
SELECT * FROM [usecases].DATAEX.[MMM05_INV]

SELECT 
    -- Datos de tráfico web
    w.ID_Date,
    w.Unique_visitors,

    -- Datos de ventas y visitas a tiendas
    o.Sales,
    o.Visit_Store,

    -- Datos de inversión publicitaria
    i.CINE,
    i.EXTERIOR,
    i.INTERNET,
    i.PRENSA,
    i.PRODUCCION,
    i.RADIO,
    i.REVISTAS,
    i.PlataformasVideo,
    i.VARIOS,
    i.INV_Total,

    -- Factores temporales
    t.working_days,
    t.Dias_fines_semana,
    t.Easterweek
FROM 
    DATAEX.MMM01_WEB w  -- Tabla de tráfico web
INNER JOIN 
    DATAEX.MMM03_OFFLINE o  -- Tabla de ventas y visitas a tiendas
ON 
    w.ID_Date = o.ID_Date
INNER JOIN 
    DATAEX.MMM05_INV i  -- Tabla de inversión publicitaria
ON 
    w.ID_Date = i.ID_Date
INNER JOIN 
    DATAEX.MMM04_TIME t  -- Tabla de factores temporales
ON 
    w.ID_Date = t.ID_Date;