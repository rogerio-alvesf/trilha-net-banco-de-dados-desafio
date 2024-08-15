-- Buscar o nome e ano dos filmes
SELECT DISTINCT Nome
               ,Ano
FROM dbo.Filmes WITH(NOLOCK);

-- Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT DISTINCT Nome
			   ,Ano
FROM dbo.Filmes WITH(NOLOCK)
ORDER BY Ano;

-- Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a dura��o
SELECT DISTINCT Nome
			   ,Ano
			   ,Duracao
FROM dbo.Filmes WITH(NOLOCK)
WHERE Nome = 'De Volta para o Futuro';

-- Buscar os filmes lan�ados em 1997
SELECT DISTINCT Nome
			   ,Ano
			   ,Duracao
FROM dbo.Filmes WITH(NOLOCK)
WHERE Ano = 1997;

-- Buscar os filmes lan�ados AP�S o ano 2000
SELECT DISTINCT Nome
			   ,Ano
			   ,Duracao
FROM dbo.Filmes WITH(NOLOCK)
WHERE Ano > 2000;

-- Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT DISTINCT Nome
			   ,Ano
			   ,Duracao
FROM dbo.Filmes WITH(NOLOCK)
WHERE Duracao BETWEEN 101 AND 149
ORDER BY Duracao;


-- Buscar a quantidade de filmes lan�adas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT Ano
	  ,Quantidade = COUNT(*)
FROM dbo.Filmes WITH(NOLOCK)
GROUP BY Ano
ORDER BY SUM(Duracao) DESC;

-- Buscar os Atores do g�nero masculino, retornando o PrimeiroNome, UltimoNome
SELECT DISTINCT PrimeiroNome
			   ,UltimoNome
FROM dbo.Atores WITH(NOLOCK)
WHERE Genero = 'M';

-- Buscar os Atores do g�nero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT DISTINCT PrimeiroNome
			   ,UltimoNome
FROM dbo.Atores WITH(NOLOCK)
WHERE Genero = 'F'
ORDER BY PrimeiroNome;

--Buscar o nome do filme e o g�nero
SELECT DISTINCT Filmes.Nome
               ,Generos.Genero
FROM dbo.Filmes WITH(NOLOCK)
  INNER JOIN dbo.FilmesGenero WITH(NOLOCK)
  ON FilmesGenero.IdFilme = Filmes.Id
  INNER JOIN dbo.Generos WITH(NOLOCK)
  ON Generos.Id = FilmesGenero.IdGenero;

-- Buscar o nome do filme e o g�nero do tipo "Mist�rio"
SELECT DISTINCT Filmes.Nome
               ,Generos.Genero
FROM dbo.Filmes WITH(NOLOCK)
  INNER JOIN dbo.FilmesGenero WITH(NOLOCK)
  ON FilmesGenero.IdFilme = Filmes.Id
  INNER JOIN dbo.Generos WITH(NOLOCK)
  ON Generos.Id = FilmesGenero.IdGenero
WHERE Generos.Genero = 'Mist�rio'; 

-- Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT DISTINCT Filmes.Nome
               ,Atores.PrimeiroNome
			   ,Atores.UltimoNome
			   ,ElencoFilme.Papel
FROM dbo.Filmes WITH(NOLOCK)
  INNER JOIN dbo.ElencoFilme WITH(NOLOCK)
  ON ElencoFilme.IdFilme = Filmes.Id
  INNER JOIN dbo.Atores WITH(NOLOCK)
  ON Atores.Id = ElencoFilme.IdAtor;