-- Drop the database if it already exists
DROP DATABASE IF EXISTS db_dacn;
-- Create database
CREATE DATABASE IF NOT EXISTS db_dacn;
USE db_dacn;

-- Create table NewsS
DROP TABLE IF EXISTS 	News;
CREATE TABLE IF NOT EXISTS News (
	id 						INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	title 					TEXT NOT NULL,
    content					TEXT,
    link					TEXT,
    category				TEXT,
    created_date			DATETIME DEFAULT NOW()
);

INSERT INTO News(	title		,						content		,				link			,	category	)
VALUES 			(		"Opinion: The relentless bravery of Iranian protesters is a moral test for the Western world"	,  "While Amini’s death has become the trigger for this uprising, it is the mandatory headscarf, or hijab, that’s become its symbol, because her run-in with the morality police was so familiar to so many women. She was visiting Tehran from her hometown in Iran’s Kurdish region last month when she was detained for, allegedly," ,"https://edition.cnn.com/2022/10/29/opinions/iran-protests-mahsa-amini-support-ghitis/index.html"	,"Magazine"),
				(		"Analysis: Elon Musk owning Twitter should give everyone pause"	, "In late May, something unusual happened at Twitter. Shareholders voted to approve two proposals to change how the company operates — and did so against Twitter’s recommendations." ,"https://edition.cnn.com/2022/10/29/tech/elon-musk-twitter-concentration-of-power"	,"Business"),
				(		"Galloway explains how the attack on Paul Pelosi complicates Musk's vision for Twitter"	,  "CNN anchor Michael Smerconish asks author and entrepreneur Scott Galloway if he thinks the attack on Paul Pelosi will make it more difficult for Elon Musk to soften content regulation on Twitter." ,"https://edition.cnn.com/videos/media/2022/10/29/scott-galloway-paul-pelosi-attack-elon-musk-twitter-smerconish-vpx.cnn"	,"Business"),
				(		"Why some have reacted with fury to Manchester United star’s showboating", "It was a moment of exquisite but ultimately unnecessary skill. Just outside the box with the scores tied at 0-0, Manchester United’s Antony produced a 720-degree pirouette with the ball glued to the inside of his left foot while a Sheriff Tiraspol defender watched on." ,"https://edition.cnn.com/2022/10/29/sport/antony-spin-reaction-manchester-united-spt-intl/index.html"	,"Sport"),
				(		"‘He’s not human’: Erling Haaland scores Champions League brace and strikes fear into opposition goalkeeper in 5-0 City win"	,  "Fourteen goals in the English Premier League and now five goals in the UEFA Champions League; it’s no wonder Erling Haaland is striking fear into opposition goalkeepers this season." ,"https://edition.cnn.com/2022/10/06/football/erling-haaland-champions-league-brace-spt-intl/index.html?dicbo=v2-1f2ca90473586c49a6b4247e99ca2b82"	,"Sport"),
				(		"Why it’s now or never in Neymar’s quest for European glory",  "Right now Neymar is at the crossroads. A 21st century football brand fueled by endless promise; a nouveau-riche social, commercial and cultural phenomena; a superstar who’s no stranger to the scrutiny of the public eye." ,"https://edition.cnn.com/2020/08/11/football/neymar-psg-champions-league-brazil-cmd-spt-intl/index.html"	,"Sport"),
				(		"Ryan Coogler considered quitting Hollywood after Chadwick Boseman’s death"	, "The death of Chadwick Boseman in 2020 following a private battle with colon cancer was a shock to many. For those closest to him, it was devastating.His friend and “Black Panther” director Ryan Coogler is now sharing how he almost walked away from Hollywood after Boseman’s death." ,"https://edition.cnn.com/2022/10/05/entertainment/ryan-coogler-chadwick-boseman-death/index.html"	,"Entertainment"),
				(		"The best fleece jackets for both men and women, according to experts"	,  "Among the youngest designers to have helmed a major label, English-born Lee has already worked for brands including Maison Margiela, Balenciaga and Donna Karan. In 2012 he joined Céline where, as director of ready-to-wear design," ,"https://edition.cnn.com/2022/10/05/entertainment/ryan-coogler-chadwick-boseman-death/index.html"	,"Entertainment"),
				(		"‘Ticket to Paradise’ gets mileage out of its George Clooney-Julia Roberts pairing"	, "Think of “Ticket to Paradise” like a postcard of beautiful people having fun in a beautiful place and you’ll get along just fine. Giving it much more thought than that won’t help this rom-com vehicle for George Clooney and Julia Roberts, although the “com” part proves a trifle deficient in a movie that’s significantly better when it’s sweet than salty." ,"https://edition.cnn.com/2022/10/21/entertainment/ticket-to-paradise-review/index.html"	,"Entertainment"),
				(		"Cute robot competes with a human waiter at a New York restaurant"	,  "At Brooklyn's 'Dimmer & Summer,' a robot cat delivers orders alongside human waiters. We asked the diners to judge their competition." ,"https://edition.cnn.com/travel/videos/travel/2022/10/18/robot-waiter-new-york-contd-orig.cnn"	,"Travel"),
				(		"Climate"	, "Climate change weaves through our daily lives -- from global politics and business to sea levels and weather to the clothes we wear and the food we eat." ,"https://edition.cnn.com/specials/world/cnn-climate"	,"Weather"),
				(		"The haircut that freed a child's heart",  "Films" ,"https://edition.cnn.com/videos/living/2015/03/06/digital-shorts-raising-ryland-orig.cnn", "Films"),
				(		"Galloway explains how the attack on Paul Pelosi complicates Musk's vision for Twitter"	,  "CNN anchor Michael Smerconish asks author and entrepreneur Scott Galloway if he thinks the attack on Paul Pelosi will make it more difficult for Elon Musk to soften content regulation on Twitter." ,"https://edition.cnn.com/videos/media/2022/10/29/scott-galloway-paul-pelosi-attack-elon-musk-twitter-smerconish-vpx.cnn"	,"Business"),
				(		"An Indian startup could revolutionize ocean farming with its ‘sea combine harvester’"	,  "Usually, seaweed is grown on ropes or nets suspended in the ocean, but current techniques make large-scale cultivation near impossible. Ocean farming is in the “stone ages,” according to Shrikumar Suryanarayan, co-founder and CEO of Bangalore-based Sea6 Energy and former head of research and development at Biocon, an Indian pharmaceutical company specializing in biologically-sourced medicines. “It’s like using a trowel and a pick to farm land.”" ,"https://edition.cnn.com/2022/01/05/business/india-sea6-energy-seaweed-harvester-spc-intl/index.html"	,"Tech"),
				(		"Analysis: Elon Musk owning Twitter should give everyone pause"	,  "In late May, something unusual happened at Twitter. Shareholders voted to approve two proposals to change how the company operates — and did so against Twitter’s recommendations.

While shareholder votes are often nonbinding for management, these nonetheless pushed for good corporate governance practices." ,"https://edition.cnn.com/2022/10/29/tech/elon-musk-twitter-concentration-of-power"	,"Tech");
-- create table: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	id						INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username				VARCHAR(50) NOT NULL UNIQUE KEY,
	`password` 				VARCHAR(800) NOT NULL,
    first_name				NVARCHAR(50) NOT NULL,
    last_name				NVARCHAR(50) NOT NULL
);

INSERT INTO `Account`(	username		,						`password`									,	first_name	,	last_name		)
VALUES 				(	'dangblack'		,   '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,	'Nguyen Hai'	,	'Dang'		),
					(	'quanganh'		,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,	'Nguyen Quang'	,	'Anh'		),
                    (	'vanchien'		,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,	'Tran Van'		,	'Chien'		),
                    (	'cocoduongqua'	,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,	'Nguyen Co'		,	'Co'		),
                    (	'doccocaubai'	,   '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,	'Nguyen Doc'	,	'Co'		),
                    (	'khabanh'		,   '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,	'Phan Kha'		,	'Bang'		),
                    (	'huanhoahong'	,   '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,	'Tran Van'		,	'Huan'		),
                    (	'tungnui'		,   '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,	'Nguyen Tung'	,	'Nui'		),
                    (	'duongghuu'		,   '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,	'Phan Duong'	,	'Huu'		),
                    (	'vtiaccademy'	,   '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi'	,	'Tran'			,	'Academy'	);