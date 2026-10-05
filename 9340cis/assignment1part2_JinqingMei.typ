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

#align(center)[CIS 9340 Assignment 1 part 2]

Staff(#underline("StaffNum"), supervisorID(fk))

PropertyForRental(#underline("propertyID"), StaffNum(fk))

Lease(#underline("leaseID"), propertyID(fk), ClientID(fk))

Client(#underline("ClientID"))

client_views(#underline("propertyID(fk), ClientID(fk)"))

Firms(#underline("ClientID(fk)"), firm_name, address)
