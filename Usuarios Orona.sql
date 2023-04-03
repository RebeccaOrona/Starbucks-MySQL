DELIMITER $$ 

CREATE USER lectura@localhost IDENTIFIED BY 'sicmundus';-- crea un usuario llamado lectura en el dominio localhost y que su contraseña es 'sicmundus'
REVOKE ALL ON *.* FROM lectura@localhost $$ -- elimina todos los permisos
GRANT SELECT ON *.* TO lectura@localhost; $$-- otorga el permiso de visualizar todas las tablas de starbucks a el usuario lectura
SHOW GRANTS FOR lectura@localhost; $$ -- muestra todos los permisos

CREATE USER tresPermisos@localhost IDENTIFIED BY 'sicmundus';  -- crea un usuario llamado tresPermisos en el dominio localhost y que su contraseña es 'sicmundus'
REVOKE ALL ON *.* FROM tresPermisos@localhost; $$ -- elimina todos los permisos
GRANT SELECT, INSERT, UPDATE ON *.* TO tresPermisos@localhost; $$ -- otorga el permiso de visualizar, modificar y insertar nuevos registros en todas las tablas de starbucks a el usuario tresPermisos
SHOW GRANTS FOR tresPermisos@localhost; $$-- muestra todos los permisos

-- DROP USER tresPermisos@localhost $$
-- DROP USER lectura@localhost $$