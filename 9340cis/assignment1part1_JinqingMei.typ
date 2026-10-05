#set document(
  title: "CIS 9340 Assignment 1 Part 1",
  author: "Jinqing Mei",
  date: datetime.today()
)

#set page(
  paper: "a4",
  margin: (x: 1in, y: 1in)
)

#set text(
  font: "Times New Roman",
  size: 12pt,
  lang: "en"
)

Jinqing Mei

CIS 9340 Assignment 1 part 1

Entites: employee, department, device, server, service

Relationships:
- One employee must belong to one department.
- One department may contain one or more employees.

- One employee may use zero or many devices.
- One device may be used by one employee.
  
- One device may be approved by zero or many servers.
- One server can approve zero or many devices.

- One server may offer zero or many services.
- One service may be offered by one server.

- One employee may use zero or many services.
- One service may be used by zero or many employees.

#figure(
  image("Assignment1part1.png", width: 100%),
  caption: [UML Diagram],
  supplement: none,
  numbering: none,
)
