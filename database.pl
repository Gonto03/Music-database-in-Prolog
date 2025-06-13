:- module(database, [artist/4, release/5, song/6, genre/2, feat_artist/2]).

% artist(id,name,artist_type,country).
artist(1, 'kendrick-lamar', solo, 'united-states').
artist(2, 'michael-jackson', solo, 'united-states').    
artist(3, 'abba', band, 'sweden').
artist(4, 'daft-punk', duo, 'france').
artist(5, 'sia', solo, 'australia').
artist(6, 'the-weeknd', solo, 'canada').
artist(7, 'the-white-stripes', duo, 'united-states').
artist(8, 'metallica', band, 'united-states').
artist(9, 'linkin-park', band, 'united-states').
artist(10, 'green-day', band, 'united-states').
artist(11, 'depeche-mode', band, 'united-kingdom').
artist(12, 'system-of-a-down', band, 'united-states').
artist(13, 'taylor-swift', solo, 'united-states').
artist(14, 'avicii', solo, 'sweden').
artist(15, 'aloe-blacc', solo, 'united-states').
artist(16, 'bruno-mars', solo, 'united-states').
artist(17, 'lady-gaga', solo, 'united-states').
artist(18, 'mark-ronson', solo, 'united-kingdom').
artist(19, 'ariana-grande', solo, 'united-states').
artist(20, 'nicki-minaj', solo, 'united-states').
artist(21, 'beyoncé', solo, 'united-states').
artist(22, 'run-d.m.c.', band, 'united-states').
artist(23, 'aerosmith', band, 'united-states').
artist(24, 'kanye-west', solo, 'united-states').
artist(25, 'jay-z', solo, 'united-states').
artist(26, 'rick-ross', solo, 'united-states').
artist(27, 'katy-perry', solo, 'united-states').
artist(28, 'shakira', solo, 'colombia').
artist(29, 'bts', band, 'south-korea').
artist(30, 'stromae', solo, 'belgium').
artist(31, 'bad-bunny', solo, 'puerto-rico').
artist(32, 'utada-hikaru', solo, 'japan').
artist(33, 'rammstein', band, 'germany').
artist(34, 'drake', solo, 'canada').
artist(35, 'napa', band, 'portugal').
artist(36, 'sza', solo, 'united-states').
artist(37, 'rihanna', solo, 'barbados').
artist(38, 'pharrell-williams', solo, 'united-states').

% release(id,title,year,release_type,artist_id).
release(1, 'True', 2013, 'album', 14).
release(2, 'Stories', 2015, 'album', 14).
release(3, 'Tim', 2019, 'album', 14).
release(4, 'Not Like Us', 2024, 'single', 1).
release(5, 'Levels', 2011, 'single', 14).
release(6, 'To Pimp a Butterfly', 2015, 'album', 1).
release(7, 'Thriller', 1982, 'album', 2).
release(8, 'Arrival', 1976, 'album', 3).
release(9, 'Discovery', 2001, 'album', 4).
release(10, 'This is Acting', 2016, 'album', 5).
release(11, 'After Hours', 2020, 'album', 6).
release(12, 'Elephant', 2003, 'album', 7).
release(13, 'Master of Puppets', 1986, 'album', 8).
release(14, 'Hybrid Theory', 2000, 'album', 9).
release(15, 'American Idiot', 2004, 'album', 10).
release(16, 'Violator', 1990, 'album', 11).
release(17, 'Toxicity', 2001, 'album', 12).
release(18, '1989', 2014, 'album', 13).
release(19, 'Doo Wops & Hooligans', 2010, 'album', 16).
release(20, 'Unorthodox Jukebox', 2012, 'album', 16).
release(21, 'The Fame', 2008, 'album', 17).
release(22, 'Chromatica', 2020, 'album', 17).
release(23, 'Die with a Smile', 2024, 'single', 17).
release(24, 'Uptown Special', 2015, 'album', 18).
release(25, 'Starboy', 2016, 'album', 6).
release(26, 'My Beautiful Dark Twisted Fantasy', 2010, 'album', 24).
release(27, 'The Fame Monster', 2009, 'ep', 17).
release(28, 'Raising Hell', 1986, 'album', 22).
release(29, 'Teenage Dream', 2010, 'album', 27).
release(30, 'Dónde Están Los Ladrones', 1998, 'album', 28).
release(31, 'Map of the Soul 7', 2020, 'album', 29).
release(32, 'Racine Carrée', 2013, 'album', 30).
release(33, 'YHLQMDLG', 2020, 'album', 31).
release(34, 'First Love', 1999, 'album', 32).
release(35, 'Mutter', 2001, 'album', 33).
release(36, 'MIA', 2018, 'single', 31).
release(37, 'DAMN', 2017, 'album', 1).
release(38, 'good kid, m.A.A.d city', 2012, 'album', 1).
release(39, 'Black Panther the Album Music From and Inspired By', 2018, 'album', 1).
release(40, 'Mr. Morale & the Big Steppers', 2022, 'album', 1).
release(41, 'GNX', 2024, 'album', 1).
release(42, 'Section.80', 2011, 'album', 1).
release(43, 'Swimming Pools (Drank)', 2012, 'single', 1).
release(44, 'Euphoria', 2024, 'single', 1).
release(45, 'Off the Wall', 1979, 'album', 2).
release(46, 'Dangerous', 1991, 'album', 2).
release(47, 'XSCAPE', 2014, 'album', 2).
release(48, 'Number Ones', 2003, 'album', 2).
release(49, 'HIStory - Past, Present And Future - Book I', 1995, 'album', 2).
release(50, 'Bad', 1987, 'album', 2).
release(51, 'Invincible', 2001, 'album', 2).
release(52, 'Michael Jackson\'s This Is It', 2009, 'album', 2).
release(53, 'Scream', 2017, 'album', 2).
release(54, 'Michael', 2010, 'album', 2).
release(55, 'Got To Be There', 1972, 'album', 2).
release(56, 'BLOOD ON THE DANCE FLOOR/ HIStory In The Mix', 1997, 'album', 2).
release(57, 'Ben', 1972, 'album', 2).
release(58, 'Voulez-Vous', 1979, 'album', 3).
release(59, 'Super Trouper', 1980, 'album', 3).
release(60, 'ABBA', 1975, 'album', 3).
release(61, 'The Album', 1977, 'album', 3).
release(62, 'Waterloo', 1974, 'album', 3).
release(63, 'The Essential Collection', 2012, 'album', 3).
release(64, 'Voyage', 2021, 'album', 3).
release(65, 'I Still Have Faith In You / Don\'t Shut Me Down', 2021, 'single', 3).
release(66, 'The Visitors', 1981, 'album', 3).
release(67, 'Gold', 1992, 'album', 3).
release(68, 'Thank You For The Music', 1994, 'album', 3).
release(69, 'Ring Ring', 1998, 'album', 3).
release(70, 'Fernando', 1976, 'single', 3).
release(71, 'Homework', 1997, 'album', 4).
release(72, 'Random Access Memories', 2013, 'album', 4).
release(73, '1000 Forms of Fear', 2014, 'album', 5).
release(74, 'Colour the Small One', 2004, 'album', 5).
release(75, 'Everyday is Christmas', 2017, 'album', 5).

% genre(id,name).
genre(1, 'electronic').
genre(2, 'hip-hop').
genre(3, 'pop').
genre(4, 'pop-rock').
genre(5, 'synthwave').
genre(6, 'rock').
genre(7, 'heavy-metal').
genre(8, 'nu-metal').
genre(9, 'punk-rock').
genre(10, 'country').
genre(11, 'latin-pop').
genre(12, 'k-pop').
genre(13, 'chanson').
genre(14, 'reggaeton').
genre(15, 'j-pop').
genre(16, 'disco').
genre(17, 'indie-pop').
genre(18, 'christmas').

% song(id,title,length,language,release_id,genre_id).
song(1, 'Not Like Us', 274, english, 4, 2).
song(2, 'Wake Me Up', 249, english, 1, 1).
song(3, 'You Make Me', 233, english, 1, 1).
song(4, 'Hey Brother', 254, english, 1, 1).
song(5, 'Addicted to You', 148, english, 1, 1).
song(6, 'Dear Boy', 479, english, 1, 1).
song(7, 'Liar Liar', 238, english, 1, 1).
song(8, 'Shame on Me', 253, english, 1, 1).
song(9, 'Lay Me Down', 300, english, 1, 1).
song(10, 'Hope There\'s Someone', 381, english, 1, 1).
song(11, 'Heart Upon My Sleeve', 280, english, 1, 1).
song(12, 'Levels', 338, english, 5, 1).
song(13, 'SOS', 157, english, 3, 1).
song(14, 'Alright', 213, english, 6, 2).
song(15, 'King Kunta', 214, english, 6, 2).
song(16, 'Thriller', 358, english, 7, 3).
song(17, 'Beat It', 258, english, 7, 3).
song(18, 'Dancing Queen', 230, english, 8, 4).
song(19, 'Knowing Me, Knowing You', 245, english, 8, 4).
song(20, 'One More Time', 320, english, 9, 1).
song(21, 'Harder, Better, Faster, Stronger', 224, english, 9, 1).
song(22, 'Alive', 292, english, 10, 3).
song(23, 'Cheap Thrills', 223, english, 10, 3).
song(24, 'Blinding Lights', 200, english, 11, 5).
song(25, 'Save Your Tears', 215, english, 11, 5).
song(26, 'Seven Nation Army', 231, english, 12, 6).
song(27, 'The Hardest Button to Button', 205, english, 12, 6).
song(28, 'Battery', 312, english, 13, 7).
song(29, 'Master of Puppets', 515, english, 13, 7).
song(30, 'In the End', 216, english, 14, 8).
song(31, 'Crawling', 209, english, 14, 8).
song(32, 'American Idiot', 174, english, 15, 9).
song(33, 'Boulevard of Broken Dreams', 260, english, 15, 9).
song(34, 'Enjoy the Silence', 257, english, 16, 1).
song(35, 'Personal Jesus', 267, english, 16, 1).
song(36, 'Chop Suey!', 210, english, 17, 7).
song(37, 'Toxicity', 218, english, 17, 7).
song(38, 'Blank Space', 231, english, 18, 3).
song(39, 'Style', 231, english, 18, 3).
song(40, 'Just the Way You Are', 221, english, 19, 3).
song(41, 'Grenade', 223, english, 19, 3).
song(42, 'Locked Out of Heaven', 232, english, 20, 3).
song(43, 'When I Was Your Man', 214, english, 20, 3).
song(44, 'Poker Face', 239, english, 21, 3).
song(45, 'Just Dance', 244, english, 21, 3).
song(46, 'Rain on Me', 182, english, 22, 3).
song(47, 'Stupid Love', 194, english, 22, 3).
song(48, 'Die with a Smile', 251, english, 23, 3).
song(49, 'Uptown Funk', 270, english, 24, 3).
song(50, 'Starboy', 230, english, 25, 1).
song(51, 'Monster', 370, english, 26, 2).
song(52, 'Telephone', 220, english, 27, 3).
song(53, 'Walk This Way', 292, english, 28, 4).
song(54, 'E.T.', 225, english, 29, 3).
song(55, 'Ojos Así', 235, spanish, 30, 11).
song(56, 'Ciega, Sordomuda', 260, spanish, 30, 11).
song(57, 'Black Swan', 203, korean, 31, 12).
song(58, 'Filter', 215, korean, 31, 12).
song(59, 'Papaoutai', 222, french, 32, 13).
song(60, 'Formidable', 205, french, 32, 13).
song(61, 'Safaera', 312, spanish, 33, 14).
song(62, 'Yo Perreo Sola', 178, spanish, 33, 14).
song(63, 'First Love', 280, japanese, 34, 15).
song(64, 'Automatic', 294, japanese, 34, 15).
song(65, 'Sonne', 273, german, 35, 7).
song(66, 'Ich Will', 222, german, 35, 7).
song(67, 'MIA', 210, english, 36, 14).
song(68, 'HUMBLE.', 177, english, 37, 2).
song(69, 'Money Trees', 386, english, 38, 2).
song(70, 'All The Stars', 235, english, 39, 2).
song(71, 'PRIDE.', 275, english, 37, 2).
song(72, 'DNA.', 185, english, 37, 2).
song(73, 'LOVE.', 213, english, 37, 2).
song(74, '\"Bitch, Don\'t Kill My Vibe\"', 310, english, 38, 2).
song(75, 'Swimming Pools (Drank)', 247, english, 38, 2).
song(76, 'luther', 177, english, 41, 2).
song(77, 'LOYALTY.', 227, english, 37, 2).
song(78, 'Poetic Justice', 300, english, 38, 2).
song(79, 'N95', 195, english, 40, 2).
song(80, 'Backseat Freestyle', 212, english, 38, 2).
song(81, 'm.A.A.d city', 350, english, 38, 2).
song(82, 'United In Grief', 255, english, 40, 2).
song(83, 'squabble up', 157, english, 41, 2).
song(84, 'A.D.H.D', 215, english, 42, 2).
song(85, 'Billie Jean', 297, english, 7, 3).
song(86, 'Rock With You', 218, english, 45, 3).
song(87, 'P.Y.T. (Pretty Young Thing)', 239, english, 7, 3).
song(88, 'Don\'t Stop \'Til You Get Enough', 366, english, 45, 3).
song(89, 'Black or White', 256, english, 46, 3).
song(90, 'Remember the Time', 239, english, 46, 3).
song(91, 'Human Nature', 246, english, 7, 3).
song(92, 'Wanna Be Startin\' Somethin\'', 363, english, 7, 3).
song(93, 'They Don\'t Care About Us', 284, english, 49, 3).
song(94, 'Bad', 247, english, 50, 3).
song(95, 'Man in the Mirror', 319, english, 50, 3).
song(96, 'Smooth Criminal', 258, english, 50, 3).
song(97, 'Chicago', 283, english, 47, 3).
song(98, 'The Way You Make Me Feel', 298, english, 50, 3).
song(99, 'Dirty Diana', 292, english, 50, 3).
song(100, 'Love Never Felt So Good', 201, english, 47, 3).
song(101, 'Gimme! Gimme! Gimme! (A Man After Midnight)', 288, english, 58, 16).
song(102, 'Mamma Mia', 215, english, 60, 4).
song(103, 'Lay All Your Love on Me', 272, english, 59, 3).
song(104, 'The Winner Takes It All', 294, english, 59, 3).
song(105, 'Take a Chance on Me', 245, english, 61, 16).
song(106, 'Waterloo', 162, english, 62, 4).
song(107, '\"Money, Money, Money\"', 185, english, 8, 3).
song(108, 'Super Trouper', 250, english, 59, 3).
song(109, 'Chiquitita', 326, english, 58, 3).
song(110, 'Voulez-Vous', 311, english, 58, 16).
song(111, 'Fernando', 354, english, 70, 3).
song(112, 'Angeleyes', 260, english, 58, 3).
song(113, 'Does Your Mother Know', 195, english, 58, 4).
song(114, 'SOS', 202, english, 60, 4).
song(115, 'Slipping Through My Fingers', 231, english, 66, 3).
song(116, 'I Have a Dream', 285, english, 58, 3).
song(117, 'Thank You for the Music', 232, english, 61, 3).
song(118, 'One of Us', 235, english, 66, 3).
song(119, 'One More Time', 320, english, 9, 16).
song(120, '\"Harder, Better, Faster, Stronger\"', 225, english, 9, 1).
song(121, 'Around the World', 429, english, 71, 16).
song(122, 'Something About Us', 233, english, 9, 1).
song(123, 'Instant Crush', 337, english, 72, 5).
song(124, 'Digital Love', 298, english, 9, 5).
song(125, 'Aerodynamic', 207, english, 9, 1).
song(126, 'Veridis Quo', 345, none, 9, 1).
song(127, 'Lose Yourself to Dance', 353, english, 72, 16).
song(128, 'Face to Face', 238, english, 9, 3).
song(129, 'Chandelier', 216, english, 73, 3).
song(130, 'Breathe Me', 272, english, 74, 17).
song(131, 'Snowman', 165, english, 75, 18).
song(132, 'Cheap Thrills', 224, english, 10, 3).
song(133, 'Elastic Heart', 257, english, 73, 3).
song(134, 'Unstoppable', 217, english, 10, 3).
song(135, 'The Greatest', 210, english, 10, 3).
song(136, 'Santa\'s Coming for Us', 206, english, 75, 18).


% feat_artist(song_id,artist_id).
feat_artist(13, 15).
feat_artist(48, 16).
feat_artist(49, 16).
feat_artist(46, 19).
feat_artist(50, 4).
feat_artist(51, 20).
feat_artist(51, 25).
feat_artist(51, 26).
feat_artist(52, 21).
feat_artist(53, 23).
feat_artist(54, 24).
feat_artist(67, 34).
feat_artist(70, 36).
feat_artist(76, 36).
feat_artist(77, 37).
feat_artist(78, 34).
feat_artist(127, 38).
feat_artist(135, 1).
