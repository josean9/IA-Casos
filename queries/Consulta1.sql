SELECT * FROM [DATAEX].[MONGO01_Bioquimicos];
SELECT * FROM [DATAEX].[MONGO02_Clinicos];
SELECT * FROM [DATAEX].[MONGO03_Geneticos];
SELECT * FROM [DATAEX].[MONGO04_Economicos];
SELECT * FROM [DATAEX].[MONGO05_Generales];
SELECT * FROM [DATAEX].[MONGO06_Sociodemograficos];


SELECT 
    b.paciente_id, -- Solo se selecciona una vez
    b.glucosa, b.colesterol, b.trigliceridos, b.hemoglobina, b.leucocitos, b.plaquetas, b.creatinina,
    c.diabetes, c.hipertension, c.obesidad, c.cancer, c.enfermedad_cardiaca, c.asma, c.epoc,
    g.mut_BRCA1, g.mut_TP53, g.mut_EGFR, g.mut_KRAS, g.mut_PIK3CA, g.mut_ALK, g.mut_BRAF,
    e.ingresos_mensuales, e.gastos_salud, e.seguro_salud, e.deudas, e.tipo_empleo, e.ayudas_publicas,
    ge.fumador, ge.alcohol, ge.actividad_fisica, ge.vive,
    s.edad, s.sexo, s.estado_civil, s.nivel_educativo, s.ocupacion, s.region, s.pais_nacimiento, s.codigo_postal
FROM [DATAEX].[MONGO01_Bioquimicos] b
LEFT JOIN [DATAEX].[MONGO02_Clinicos] c ON b.paciente_id = c.paciente_id
LEFT JOIN [DATAEX].[MONGO03_Geneticos] g ON b.paciente_id = g.paciente_id
LEFT JOIN [DATAEX].[MONGO04_Economicos] e ON b.paciente_id = e.paciente_id
LEFT JOIN [DATAEX].[MONGO05_Generales] ge ON b.paciente_id = ge.paciente_id
LEFT JOIN [DATAEX].[MONGO06_Sociodemograficos] s ON b.paciente_id = s.paciente_id;