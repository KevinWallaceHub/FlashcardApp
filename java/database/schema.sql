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
	
	constraint fk_flashcards_user_id foreign key (user_id) references users(user_id)
);

CREATE TABLE decks(
	deck_id serial primary key,
	user_id bigint,
	name varchar(64),
	
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
INSERT INTO flashcards(user_id,question_side, answer_side , keywords) VALUES('2','What is ternary operator?','Ternary operator , also called conditional operator is used to decide which value to assign to a variable based on a Boolean value evaluation. Its denoted as ? In the below example, if rank is 1, status is assigned a value of “Done" else “Pending” public class conditionTest { public static void main(String args[]) { String status; int rank = 3; status = (rank == 1) ? "Done" : "Pending"; System.out.println(status); ','Java Operator ');
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
INSERT INTO decks(user_id, name) VALUES('1','First Deck');
INSERT INTO deckard (deck_id, card_id) VALUES (1, 2);

COMMIT TRANSACTION;

