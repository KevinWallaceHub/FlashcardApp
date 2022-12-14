BEGIN TRANSACTION;

DROP TABLE IF EXISTS deckard;
DROP TABLE IF EXISTS flashcards;
DROP TABLE IF EXISTS decks;
DROP TABLE IF EXISTS users;



DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE flashcards(
	card_id serial primary key,
	user_id bigint,
	question_side varchar (512) not null,
	answer_side varchar (1024) not null,
	keywords varchar (128),
	image_url varchar (256),
	
	constraint fk_flashcards_user_id foreign key (user_id) references users(user_id)
);

CREATE TABLE decks(
	deck_id serial primary key,
	user_id bigint,
	name varchar(64) not null,
	
	constraint fk_decks_user_id foreign key (user_id) references users(user_id)
);

CREATE TABLE deckard(
	deck_id bigint,
	card_id bigint,
	
	constraint pk_deck_card primary key (deck_id, card_id),
	constraint fk_deck_deck_id foreign key (deck_id) references decks(deck_id),
	constraint fk_card_card_id foreign key (card_id) references flashcards(card_id)
);



INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2', 'What is the difference between an Inner Class and a Sub-Class','An Inner class is a class which is nested within another class. An Inner class has access rights for the class which is nesting it and it can access all variables and methods defined in the outer class. A sub-class is a class which inherits from another class called super class. Sub-class can access all public and protected methods and fields of its super class. ','Java Interview OOP');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2', 'What is an infinite Loop? How infinite loop is declared? ','An infinite loop runs without any condition and runs infinitely. An infinite loop can be broken by defining any breaking logic in the body of the statement blocks.for (;;)','Java loops');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2', 'What are the various access specifiers for Java classes? ','In Java, access specifiers are the keywords used before a class name which defines the access scope. The types of access specifiers for classes are: 1. Public: Class, Method,Field is accessible from anywhere.2. Protected:Method, Field can be accessed from the same class to which they belong or from the sub-classes,and from the class of same package, but not from outside. 3. Default: Method,Field,class can be accessed only from the same package and not from outside of its native package. 4. Private: Method,Field can be accessed from the same class to which they belong. ','Java Interview OOP');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2', 'Whats the purpose of Static methods and static variables? ','When there is a requirement to share a method or a variable between multiple objects of a class instead of creating separate copies for each object, we use static keyword to make a method or variable shared for all objects. ','Java Methods');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2', 'What is data encapsulation and whats its significance? ','Encapsulation is a concept in Object Oriented Programming for combining properties and methods in a single unit. ','Java Interview OOP');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2', 'What are Loops in Java? What are three types of loops? ','1) For Loops For loops are used in java to execute statements repeatedly for a given number of times. For loops are used when number of times to execute the statements is known to programmer. 2) While Loops While loop is used when certain statements need to be executed repeatedly until a condition is fulfilled. In while loops, condition is checked first before execution of statements. 3) Do While Loops Do While Loop is same as While loop with only difference that condition is checked after execution of block of statements. Hence in case of do while loop, statements are executed at least once. ','Java Interview Loops');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','What is the difference between continue and break statement?','break and continue are two important keywords used in Loops. When a break keyword is used in a loop, loop is broken instantly while when continue keyword is used, current iteration is broken and loop continues with next iteration.','Java Loops');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','What is the difference between double and float variables in Java?','In java, float takes 4 bytes in memory while Double takes 8 bytes in memory. Float is single precision floating point decimal number while Double is double precision decimal number.','Java Variables Interview');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','What is Final Keyword in Java? ',' In java, a constant is declared using the keyword Final. Value can be assigned only once and after assignment, value of a constant cant be changed.','Java Keyword Variables Method');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','What is ternary operator?','Ternary operator , also called conditional operator is used to decide which value to assign to a variable based on a Boolean value evaluation. Its denoted as ? In the below example, if rank is 1, status is assigned a value of ???Done" else ???Pending??? public class conditionTest { public static void main(String args[]) { String status; int rank = 3; status = (rank == 1) ? "Done" : "Pending"; System.out.println(status); ','Java Operator ');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','How can you generate random numbers in Java? ','Using Math.random() you can generate random numbers in the range greater than or equal to 0.1 and less than 1.0. Using Random class in package java.util.','Java Math');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','Can main() method in Java can return any data','In java, main() method cant return any data and hence, its always declared with a void return type.','Java Method Ineterview');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','What are Java Packages? Whats the significance of packages?','In Java, package is a collection of classes and interfaces which are bundled together as they are related to each other. Use of packages helps developers to modularize the code and group the code for proper re-use. Once code has been packaged in Packages, it can be imported in other classes and used.','Java Package Interview');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','Can we declare a class as Abstract without having any abstract method?','Yes we can create an abstract class by using abstract keyword before class name even if it doesnt have any abstract method. However, if a class has even one abstract method, it must be declared as abstract otherwise it will give an error.','Java Method Interview');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','Whats the difference between an Abstract Class and Interface in Java?','The primary difference between an abstract class and interface is that an interface can only possess declaration of public static methods with no concrete implementation while an abstract class can have members with any access specifiers (public, private etc) with or without concrete implementation. Another key difference in the use of abstract classes and interfaces is that a class which implements an interface must implement all the methods of the interface while a class which inherits from an abstract class doesnt require implementation of all the methods of its super class.','Java class Interface');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','Can we declare the main method of our class as private? ','In java, main method must be public static in order to run any application correctly. If main method is declared as private, developer wont get any compilation error however, it will not get executed and will give a runtime error.','Java Method Interview');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','How an object is serialized in java?','In java, to convert an object into byte stream by serialization, an interface with the name Serializable is implemented by the class. All objects of a class implementing serializable interface get serialized and their state is saved in byte stream.','Java Object');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','When the constructor of a class is invoked?','The constructor of a class is invoked every time an object is created with new keyword.','Java Class Interview');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','Can a class have multiple constructors?','Yes, a class can have multiple constructors with different parameters. Which constructor gets used for object creation depends on the arguments passed while creating the objects.','Java Class');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','Why Strings in Java are called as Immutable?','In java, string objects are called immutable as once value has been assigned to a string, it cant be changed and if changed, a new object is created.','Java Variables Data-type');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','How we can execute any code even before main method?','If we want to execute any statements before even creation of objects at load time of class, we can use a static block of code in the class. Any statements inside this static block of code will get executed once at the time of loading the class even before creation of objects in the main method.','Java Methods');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','How garbage collection is done in Java?','In java, when an object is not referenced any more, garbage collection takes place and the object is destroyed automatically. For automatic garbage collection java calls either System.gc() method or Runtime.gc() method.','Java Garbage');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','Can a class be a super class and a sub-class at the same time?','If there is a hierarchy of inheritance used, a class can be a super class for another class and a sub-class for another one at the same time.','Java Class');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','How objects of a class are created if no constructor is defined in the class? ','Even if no explicit constructor is defined in a java class, objects get created successfully as a default constructor is implicitly used for object creation. This constructor has no parameters. ','Java Class Object');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','What is 1950s consumerism?',E'The rise of white collar jobs allow family\'s to live comfortably in the suburbs and get surrounded by many consumer goods. The television was the most influential consumer good.', '1950 American History');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','1952 Election/Including Mood of Americans',E'Eisenhower being the first republican president elected in 20 years. He\'s elected in 1952. This reflects the nations desire to establish normalcy and forget the hardships of the depression and the war.', '1950 American History');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','21 Game Show',E'Popular game show in the 1950\'s. Charles Van Doren captivated Americans when he began to win the show. He was an instant celebrity. The nation was shocked when they found out he was fed answers to continue winning to keep the ratings high. People had never questioned what they had seen on tv as real of honest.', '1950 American History');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Bay of Pigs Invasion',E'Known as the bay of pigs invasion Eisenhower put the CIA on a secret plan to overthrow Cuba. When Kennedy took office he supported this plan. On April 17, 1961 went ashore on the attack (Bahai de Cochinos). It was a disaster 1,400 invaders were killed or captured.', '1950 American History');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Beat Generation',E'Also called beatniks were from coffee houses in New York. They criticize the conformity and complacency of the 50s. It\'s unique that the artists are highly educated and are inspired by intellectualism that is coming from college campuses. The influential writers of this period are Alan Ginsburg and Jack Kerouac.','1950 American History');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Where do ant eaters live?','Central and South America.','Animal Ant Eaters');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','How many different species of ant eaters are there?','Four species.', 'Animal Ant Eaters');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','What are ant eaters primary tool for gathering food?','Their spine-covered tongues.','Animal Ant Eaters');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','On average, how many ants and termites do ant eaters eat in a day?','30,000.', 'Animal Ant Eaters');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','How fast can an ant eater run?', '30 miles per hour(48 kilometers per hour).','Animal Ant Eaters');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Which boxer fought against Muhammad Ali and won?', 'Joe Frazier.', 'Sports Boxing Trivia');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','How old was Tiger Woods when he won the Masters?', '21.', 'Sports Golf Trivia');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','What NFL team was originally called the ???New York Titans????', 'The New York Jets.', 'Sports Football NFL Trivia');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','What is the only team in the NFL to neither host nor play in the Super Bowl?', 'Cleveland Browns.', 'Sports Football NFL Trivia');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1',E'What is Babe Ruth\'s full real name?', 'George Herman Ruth, Jr.', 'Sports Baseball MLB Trivia');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','la audici??n', 'audition', 'Spanish');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','el baile', 'dance', 'Spanish');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','la boda', 'wedding', 'Spanish');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','el desfile', 'parade', 'Spanish');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','la fiesta de sorpresa', 'surprise party', 'Spanish');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','el d??a festivo', 'holiday', 'Spanish');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','el concurso', 'contest', 'Spanish');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','celebrar', 'to celebrate', 'Spanish');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','la cita', 'date', 'Spanish');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','el cumplea??os', 'birthday', 'Spanish');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Atom', 'the basic unit of a chemical element.', 'Science Chemistry');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Atomic number', 'The number of protons in the nucleus of an atom of an element.', 'Science Chemistry');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Molecule', '2 or more non-metal elements chemically bonded together.', 'Science Chemistry');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Atomic mass', 'Number of protons plus neutrons in the nucleus of an atom.', 'Science Chemistry');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Element', 'A pure substance made of only one kind of atom.', 'Science Chemistry');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Protons', 'A positively charged particle in the nucleus of an atom.', 'Science Chemistry');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Electrons', 'A negatively charged particle outside the nucleus of an atom.', 'Science Chemistry');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Isotopes', 'Atoms of the same element that have different numbers of neutrons.', 'Science Chemistry');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Neutrons', 'A subatomic particle that has no charge and that is found in the nucleus of an atom.', 'Science Chemistry');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Nucleus', 'Center of an atom.', 'Science Chemistry');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Let f(x) = x + 8 and g(x) = x^2 ??? 6x ??? 7. Find f(g(2)).', '-7', 'Math Algebra');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Let f(x) = x ??? 2 and g(x) = x^2 ??? 7x ??? 9. Find f(g(???1)).', '-3', 'Math Algebra');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Let f(x) = x^2 ??? 3x ??? 7. Find f(???3).', '11', 'Math Algebra');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Let f(x) = x^2 ??? 16. Find f^???1(x)).', '+(sqrt) x+16', 'Math Algebra');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Let f(x) = twenty four over the quantity of 3 x minus two. Find f(???2).', '-3', 'Math Algebra');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Let f(x) = 2x + 2. Solve f^???1(x) when x = 4.', '1','Math Algebra');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Let f(x) = 2x ??? 6. Solve f^???1(x) when x = 2','4', 'Math Algebra');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Let f(x) = ???4x + 7 and g(x) = 10x ??? 6. Find f(g(x)).','-40x+31', 'Math Algebra');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Let f(x) = 9x ??? 2 and g(x) = ???x + 3. Find f(g(x)).','-9x+25', 'Math Algebra');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Let f(x) = 5x + 12. Find f^???1(x).','x-12(over)/5', 'Math Algebra');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Buyer','This is the person or persons who purchase a good or service.', 'Economics');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Capital','This is the equipment and factories used in the production of goods and services.', 'Economics');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Capital Good','A tool or equipment used to produce other goods.', 'Economics');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Capitalism','This is an economic system where the factors of production are privately owned.', 'Economics');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Command Economy','This is the general name for an economic system characterized by a central authority which makes major economical decisions.', 'Economics');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Competition','In economics, this is a rivalry that may refer to rivalry among firms, or individuals, or the race to control resources.', 'Economics');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Consumer','One who buys goods or services for personal use.', 'Economics');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Consumer Empowerment','This term is an economic and legal concept that buyers should have access to a full range of resources to make informed economic decisions.', 'Economics');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Consumer Good','This is the term for a finished product used by an individual for personal use.', 'Economics');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Consumer Protection Laws','This term is an economic and legal concept that governments should use regulations to ensure the rights of buyers.', 'Economics');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Code of Hammurabi',E'A series of laws publicized at the order of King Hammurabi of Babylon. Not actually a code, but a number of laws that proclaim the king\'s commitment to social order.', 'World History');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Cradle of civilization', 'Commonly used term for southern Mesopotamia (in present-day Iraq).', 'World History');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Cuneiform', 'Wedge-shaped writing in the form of symbols incised into clay tablets; used in Mesopotamia.', 'World History');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Hatshepsut', E'Ancient Egypt\'s most famous queen, reigned 1472-1457 B.C.E.', 'World History');
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('1','Hieroglyphics', 'Ancient Egyptian writing system; literally,"sacred carvings"-so named because the Greeks saw them prominently displayed in Egyptian Temples.', 'World History');

INSERT INTO decks(user_id, name) VALUES('2','Java Prep');
INSERT INTO decks(user_id, name) VALUES('1',E'1950\'s History');
INSERT INTO decks(user_id, name) VALUES('1','Ant eaters!');
INSERT INTO decks(user_id, name) VALUES('1',E'Sport\'s Trivia');
INSERT INTO decks(user_id, name) VALUES('1','Spanish');
INSERT INTO decks(user_id, name) VALUES('1','Chemistry');
INSERT INTO decks(user_id, name) VALUES('1','Algebra');
INSERT INTO decks(user_id, name) VALUES('1','Economics');

INSERT INTO deckard (deck_id, card_id) VALUES (1, 1);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 2);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 3);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 4);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 5);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 6);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 7);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 8);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 9);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 10);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 11);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 12);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 13);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 14);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 15);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 16);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 17);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 18);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 19);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 20);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 21);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 22);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 23);
INSERT INTO deckard (deck_id, card_id) VALUES (1, 24);
INSERT INTO deckard (deck_id, card_id) VALUES (2, 25);
INSERT INTO deckard (deck_id, card_id) VALUES (2, 26);
INSERT INTO deckard (deck_id, card_id) VALUES (2, 27);
INSERT INTO deckard (deck_id, card_id) VALUES (2, 28);
INSERT INTO deckard (deck_id, card_id) VALUES (2, 29);
INSERT INTO deckard (deck_id, card_id) VALUES (3, 30);
INSERT INTO deckard (deck_id, card_id) VALUES (3, 31);
INSERT INTO deckard (deck_id, card_id) VALUES (3, 32);
INSERT INTO deckard (deck_id, card_id) VALUES (3, 33);
INSERT INTO deckard (deck_id, card_id) VALUES (3, 34);
INSERT INTO deckard (deck_id, card_id) VALUES (4, 35);
INSERT INTO deckard (deck_id, card_id) VALUES (4, 36);
INSERT INTO deckard (deck_id, card_id) VALUES (4, 37);
INSERT INTO deckard (deck_id, card_id) VALUES (4, 38);
INSERT INTO deckard (deck_id, card_id) VALUES (4, 39);
INSERT INTO deckard (deck_id, card_id) VALUES (5, 40);
INSERT INTO deckard (deck_id, card_id) VALUES (5, 41);
INSERT INTO deckard (deck_id, card_id) VALUES (5, 42);
INSERT INTO deckard (deck_id, card_id) VALUES (5, 43);
INSERT INTO deckard (deck_id, card_id) VALUES (5, 44);
INSERT INTO deckard (deck_id, card_id) VALUES (5, 45);
INSERT INTO deckard (deck_id, card_id) VALUES (5, 46);
INSERT INTO deckard (deck_id, card_id) VALUES (5, 47);
INSERT INTO deckard (deck_id, card_id) VALUES (5, 48);
INSERT INTO deckard (deck_id, card_id) VALUES (5, 49);
INSERT INTO deckard (deck_id, card_id) VALUES (6, 50);
INSERT INTO deckard (deck_id, card_id) VALUES (6, 51);
INSERT INTO deckard (deck_id, card_id) VALUES (6, 52);
INSERT INTO deckard (deck_id, card_id) VALUES (6, 53);
INSERT INTO deckard (deck_id, card_id) VALUES (6, 54);
INSERT INTO deckard (deck_id, card_id) VALUES (6, 55);
INSERT INTO deckard (deck_id, card_id) VALUES (6, 56);
INSERT INTO deckard (deck_id, card_id) VALUES (6, 57);
INSERT INTO deckard (deck_id, card_id) VALUES (6, 58);
INSERT INTO deckard (deck_id, card_id) VALUES (6, 59);
INSERT INTO deckard (deck_id, card_id) VALUES (7, 60);
INSERT INTO deckard (deck_id, card_id) VALUES (7, 61);
INSERT INTO deckard (deck_id, card_id) VALUES (7, 62);
INSERT INTO deckard (deck_id, card_id) VALUES (7, 63);
INSERT INTO deckard (deck_id, card_id) VALUES (7, 64);
INSERT INTO deckard (deck_id, card_id) VALUES (7, 65);
INSERT INTO deckard (deck_id, card_id) VALUES (7, 66);
INSERT INTO deckard (deck_id, card_id) VALUES (7, 67);
INSERT INTO deckard (deck_id, card_id) VALUES (7, 68);
INSERT INTO deckard (deck_id, card_id) VALUES (7, 69);
INSERT INTO deckard (deck_id, card_id) VALUES (8, 70);
INSERT INTO deckard (deck_id, card_id) VALUES (8, 71);
INSERT INTO deckard (deck_id, card_id) VALUES (8, 72);
INSERT INTO deckard (deck_id, card_id) VALUES (8, 73);
INSERT INTO deckard (deck_id, card_id) VALUES (8, 74);
INSERT INTO deckard (deck_id, card_id) VALUES (8, 75);
INSERT INTO deckard (deck_id, card_id) VALUES (8, 76);
INSERT INTO deckard (deck_id, card_id) VALUES (8, 77);
INSERT INTO deckard (deck_id, card_id) VALUES (8, 78);
INSERT INTO deckard (deck_id, card_id) VALUES (8, 79);

COMMIT TRANSACTION;