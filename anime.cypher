CREATE (a: Genre {name: 'Action'});
CREATE (b: Genre {name: 'Romance'});
CREATE (c: Genre {name: 'Horror'});
CREATE (d: Genre {name: 'Detective'});
CREATE (e: Genre {name: 'Fantasy'});
CREATE (f: Genre {name: 'Comedy'});
CREATE (h: Genre {name: 'Sport'});
CREATE (i: Genre {name: 'Psychological thriller'});

//Action animes

CREATE (act1: Anime {name: 'Naruto', year: 2002});
CREATE (act2: Anime {name: 'One Piece', year: 1999});
CREATE (act3: Anime {name: 'Attack on Titan', year: 2013});

MATCH (a:Genre {name: 'Action'}), (act1:Anime {name: 'Naruto'})
CREATE (act1)-[:HAS_GENRE]->(a);

MATCH (a:Genre {name: 'Action'}), (act2:Anime {name: 'One Piece'})
MERGE (act2)-[:HAS_GENRE]->(a);

MATCH (a:Genre {name: 'Action'}), (act3: Anime {name: 'Attack on Titan'})
CREATE (act3)-[:HAS_GENRE]->(a);


//Romance animes

CREATE (r1: Anime {name: 'Your name', year: 2016});
CREATE (r2: Anime {name: 'Clannad', year: 2007});
CREATE (r3: Anime {name: 'Toradora!', year: 2008});

MATCH (b:Genre {name: 'Romance'}), (r1: Anime {name: 'Your name'})
CREATE (r1)-[:HAS_GENRE]->(b);

MATCH (b:Genre {name: 'Romance'}), (r2: Anime {name: 'Clannad'})
CREATE (r2)-[:HAS_GENRE]->(b);

MATCH (b:Genre {name: 'Romance'}), (r3: Anime {name: 'Toradora!'})
CREATE (r3)-[:HAS_GENRE]->(b);

MATCH (b:Genre {name: 'Romance'})<-[r:HAS_GENRE]-(r2:Anime {name: 'Clannad'})
DELETE r;


//Horror animes

CREATE (h1: Anime {name: 'Tokyo Ghoul', year: 2014});
CREATE (h2: Anime {name: 'Another', year: 2012});
CREATE (h3: Anime {name: 'Higurashi no Naku Koro ni', year: 2006});

MATCH (c:Genre {name: 'Horror'}), (h1: Anime {name: 'Tokyo Ghoul'})
CREATE (h1)-[:HAS_GENRE]->(c);

MATCH (c:Genre {name: 'Horror'}), (h2: Anime {name: 'Another'})
CREATE (h2)-[:HAS_GENRE]->(c);

MATCH (c:Genre {name: 'Horror'}), (h3: Anime {name: 'Higurashi no Naku Koro ni'})
CREATE (h3)-[:HAS_GENRE]->(c);


//Detective animes

CREATE (d1: Anime {name: 'Monster', year: 2004});
CREATE (d2: Anime {name: 'Death Note', year: 2006});
CREATE (d3: Anime {name: 'Psycho-Pass', year: 2012});

MATCH (d:Genre {name: 'Detective'}), (d1:Anime {name: 'Monster'})
CREATE (d1)-[:HAS_GENRE]->(d);

MATCH (d:Genre {name: 'Detective'}), (d2:Anime {name: 'Death Note'})
CREATE (d2)-[:HAS_GENRE]->(d);

MATCH (d:Genre {name: 'Detective'}), (d3:Anime {name: 'Psycho-Pass'})
CREATE (d3)-[:HAS_GENRE]->(d);

//Fantasy animes

CREATE (f1: Anime {name: 'Fullmetal Alchemist: Brotherhood', year: 2009});
CREATE (f2: Anime {name: 'Sword Art Online', year: 2012});
CREATE (f3: Anime {name: 'No Game No Life', year: 2014});

MATCH (e:Genre {name: 'Fantasy'}), (f1:Anime {name: 'Fullmetal Alchemist: Brotherhood'})
CREATE (f1)-[:HAS_GENRE]->(e);

MATCH (e:Genre {name: 'Fantasy'}), (f2:Anime {name: 'Sword Art Online'})
CREATE (f2)-[:HAS_GENRE]->(e);

MATCH (e:Genre {name: 'Fantasy'}), (f3:Anime {name: 'No Game No Life'})
CREATE (f3)-[:HAS_GENRE]->(e);

MATCH (anime:Anime)
WITH anime.name AS name, COLLECT(anime) AS nodes
WHERE SIZE(nodes) > 1
// Keep the first node and delete relationships for the duplicates
FOREACH (n IN TAIL(nodes) | DETACH DELETE n);


//Comedy animes

CREATE (c1: Anime {name: 'One Punch Man', year: 2015});
CREATE (c2: Anime {name: 'KonoSuba', year: 2016});
CREATE (c3: Anime {name: 'Gintama', year: 2005});

MATCH (f:Genre {name: 'Comedy'}), (c1:Anime {name: 'One Punch Man'})
CREATE (c1)-[:HAS_GENRE]->(f);

MATCH (f:Genre {name: 'Comedy'}), (c2:Anime {name: 'KonoSuba'})
CREATE (c2)-[:HAS_GENRE]->(f);

MATCH (f:Genre {name: 'Comedy'}), (c3:Anime {name: 'Gintama'})
CREATE (c3)-[:HAS_GENRE]->(f);

//Sport animes

CREATE (s1: Anime {name: 'Haikyuu!!', year: 2014});
CREATE (s2: Anime {name: 'Kuroko no Basket', year: 2012});
CREATE (s3: Anime {name: 'Yuri on Ice', year: 2016});

MATCH (h:Genre {name: 'Sport'}), (s1:Anime {name: 'Haikyuu!!'})
CREATE (s1)-[:HAS_GENRE]->(h);

MATCH (h:Genre {name: 'Sport'}), (s2:Anime {name: 'Kuroko no Basket'})
CREATE (s2)-[:HAS_GENRE]->(h);

MATCH (h:Genre {name: 'Sport'}), (s3:Anime {name: 'Yuri on Ice'})
CREATE (s3)-[:HAS_GENRE]->(h);

//Psychological thriller animes

CREATE (pt1: Anime {name: 'Steins;Gate', year: 2011});
CREATE (pt2: Anime {name: 'Paranoia Agent', year: 2004});
CREATE (pt3: Anime {name: 'Erased', year: 2016});

MATCH (i:Genre {name: 'Psychological thriller'}), (pt1:Anime {name: 'Steins;Gate'})
CREATE (pt1)-[:HAS_GENRE]->(i);

MATCH (i:Genre {name: 'Psychological thriller'}), (pt2:Anime {name: 'Paranoia Agent'})
CREATE (pt2)-[:HAS_GENRE]->(i);

MATCH (i:Genre {name: 'Psychological thriller'}), (pt3:Anime {name: 'Erased'})
CREATE (pt3)-[:HAS_GENRE]->(i);