#set document(
  title: "Cis 9340 Assignment 2",
  author: "Jinqing Mei",
  date: datetime.today()
)

#set page(
  paper: "a4",
  margin: (x: 1in, y: 1in),
  numbering: "1"
)

#set text(
  font: "Times New Roman",
  size: 11pt,
  lang: "en"
)

#align(center)[Assignment #2]
Jinqing Mei

1. Consider the relation R, with key and functional dependencies shown below. Please normalize to BCNF. Be sure to show all of your work
R(A,B,C,D,E,F,G)\
Key: A,B\
F1: A,B -> C,D,E,F,G\
F2: A -> D\
F3: E -> G\
F4: C -> B\

F1 does not violate BCNF because A and B are the superkey of the relation. However, F2 violates BCNF because A alone is not the superkey of the relation. 
To make F2 fit BCNF, make a new relation R2(A,D) with the key of the new relation being A. From the orginal relation, remove D.\
R(A,B,C,E,F,G) with A and B as the key.\
R2(A,D) with A as the key.

F3 does not fit BCNF with the new relations because E is not the superkey. Make a new relation R3(E,G) with E as the key. Remove G from the original relation.\
R(A,B,C,E,F) with A and B as the key\
R2(A,D) with A as the key\
R3(E,G) with E as the key\

F4 does not fit BCNF because C is not a superkey. Make a new relation R3(C,B) with C as the superkey. Remove B from the original relation.\

R(A,C,E,F) with A, C, E, and F as the new superkey. C and E connects to R2 and R3, and since no functional dependencies connect with F, F has to be a superkey.\
R2(A,D) with A as the superkey\
R3(E,G) with E as the superkey\
R4(C,B) with C as the superkey.

2. Given the invoice table with sample data:
  - Please determine an appropriate Key.
  - Then list the functional dependencies
  - Normalize the relation to BCNF

The relation is R(inv_num, prod_num, sale_date, prod_label, vend_code, vend_name, quant_sold, prod_price)

An appropriate key for the relation is *inv_num* and *prod_num*; inv_num and prod_num are the superkey of the relation.

*Functional Dependencies*:\
F1: inv_num, prod_num -> sale_date, prod_label, vend_code, vend_name, quant_sold, prod_price\
F2: prod_num -> prod_label, prod_price\
F3: vend_code -> vend_name\

To make this relation into BCNF, we have to make sure that all functional dependencies fit the rule X -> Y with X as superkey.\
R(inv_num, prod_num, sale_date, prod_label, vend_code, vend_name, quant_sold, prod_price)\
To make F2 fit BCNF, make a new relation with prod_num as the superkey and remove prod_label and prod_price from original relation.\
R(inv_num, prod_num, sale_date, vend_code, vend_name, quant_sold)\
R2(prod_num, prod_label, prod_price) with prod_num as the superkey.

To make F3 fit BCNF, make a new relation with vend_code as the superkey and remove vend_name from original relation.\

R(inv_num, prod_num, sale_date, vend_code, quant_sold) with inv_num, prod_num, sale_date, vend_code, and quant_sold as superkey\
R2(prod_num, prod_label, prod_price) with prod_num as the superkey.\
R3(vend_code, vend_name) with vend_code as the superkey.\
