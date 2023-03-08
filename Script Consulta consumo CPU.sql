
-- Existe una consulta concreta, a tiempo real, que nos permite ver el consumo de cpu del SQL Server, identificado por hostname de origen.
 
-- Esta consulta se debe ejecutar desde el Query Analyzer (Analizador de Consultas), y nos generará una tabla con la información necesaria.
 
-- En el Query analyzer, debemos indicar primero a qué servidor queremos conectar, y cuando tengamos la nueva consulta abierta; cambiar en el desplegable de -- bases de datos, a la BBDD 'master'.
 
-- Dentro del analizador, copiaremos:
 
select cpu, spid into cpu_usage
from sysprocesses
 
select diff = p.cpu-u.cpu, p.cpu, p.program_name, p.loginame, p.spid, p.hostname, p.last_batch
from sysprocesses p join cpu_usage u on p.spid=u.spid
order by 1 desc

drop table cpu_usage
