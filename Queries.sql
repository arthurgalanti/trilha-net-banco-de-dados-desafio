--  QUERY 1 - Buscar o nome e ano dos filmes
SELECT Nome, Ano
FROM Filmes.dbo.Filmes;

--  QUERY 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome, Ano, Duracao --(Na imagem do repo está incluso duração)
FROM Filmes.dbo.Filmes f
ORDER BY f.Ano ASC;

--  QUERY 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
SELECT Nome, Ano, Duracao 
FROM Filmes.dbo.Filmes f
WHERE UPPER(f.Nome) LIKE UPPER('de volta para o futuro');

--  QUERY 4 - Buscar os filmes lançados em 1997
SELECT Nome, Ano, Duracao 
FROM Filmes.dbo.Filmes f
WHERE f.Ano = 1997;

--  QUERY 5 - Buscar os filmes lançados APÓS o ano 2000
SELECT Nome, Ano, Duracao 
FROM Filmes.dbo.Filmes f
WHERE f.Ano > 2000;

--  QUERY 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT Nome, Ano, Duracao 
FROM Filmes.dbo.Filmes f
WHERE f.Duracao > 100
AND f.Duracao  < 150
ORDER BY f.Duracao; --(NA imagem do repo está ordenado por duração)

--  QUERY 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao(??? ORDENEI PELA QUANTIDADE) em ordem decrescente
SELECT Ano, COUNT(*) as 'Quantidade'
FROM Filmes.dbo.Filmes f
GROUP BY f.Ano
ORDER BY 'Quantidade' DESC;

--  QUERY 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome (Na imagem do repo está incluso id e genero)
SELECT Id, PrimeiroNome, UltimoNome, Genero 
FROM Filmes.dbo.Atores a
WHERE a.Genero = 'M';

--  QUERY 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome (Na imagem do repo está incluso id e genero)
SELECT Id, PrimeiroNome, UltimoNome, Genero 
FROM Filmes.dbo.Atores a
WHERE a.Genero = 'F'
ORDER BY a.PrimeiroNome;

--  QUERY 10 - Buscar o nome do filme e o gênero
SELECT f.Nome, g.Genero 
FROM Filmes.dbo.Filmes f
INNER JOIN Filmes.dbo.FilmesGenero fg
	ON (f.Id = fg.IdFilme)
INNER JOIN Filmes.dbo.Generos g
	ON (fg.IdGenero = g.Id)

--  QUERY 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT f.Nome, g.Genero 
FROM Filmes.dbo.Filmes f
INNER JOIN Filmes.dbo.FilmesGenero fg
	ON (f.Id = fg.IdFilme)
INNER JOIN Filmes.dbo.Generos g
	ON (fg.IdGenero = g.Id)
WHERE UPPER(g.Genero) LIKE UPPER('Mistério');

--  QUERY 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT f.Nome, a.PrimeiroNome, a.UltimoNome, ef.Papel 
FROM Filmes.dbo.Filmes f
INNER JOIN Filmes.dbo.ElencoFilme ef
	ON (f.Id = ef.IdFilme)
INNER JOIN Filmes.dbo.Atores a
	ON (ef.IdAtor = a.Id);
