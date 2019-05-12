SELECT Usuario,
Cast(DecryptByPassPhrase('password', Contraseña) As varchar(200)) As pass
FROM Usuario