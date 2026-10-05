Jinqing Mei\

## Lab 1
1. Baruch College is divided into several schools: the Zicklin School of Business, the Mildred and George
Weissman School of Arts and Sciences, and the Austin W. Marxe School of Public and International Affairs. 
Each school is administered by a dean who is required to be the dean of any school.\
Entities: professor and deans\
One school is adminstered by one and only one professor: 1..1.\
One professor administers zero or one school: 0..1

2. Each school comprises several departments. For example, the school of business has an accounting 
department, a management/marketing department, an economics/finance department, and a computer
information systems department.\
Entites: department and school\
Each department belongs to one and only one school: 1..1\
One school has one or many departments: 1..*

3. Each department may offer courses. For example, the management/marketing department offers courses
such as Introduction to Management, Principles of Marketing, and Production Management.\
Entites: course and department\
One course belongs to one and only one department: 1..1\
One department offers zero or many courses: 0..*

4. A department may offer several sections (classes) of the same course. Each class is offered during a
given semester.\
Entities: department, courses, and classes\
One department has zero or many courses: 0..* \
One course has zero or many classes: 0..* \
One class belongs to one course: 1..1

5. Each department should have one or more professors assigned to it. One and only one of those professors
chairs the department, and no professor is required to accept the chair position.\
Entities: department, professor, chair\
One department is assigned one or more professor.\
A chair posiion contains one and only one professor.\
A professor can have zero or one chair position.

6. Each professor may teach up to four classes; each class is a section of a course. A professor
may also be on research contract and teach no classes at all.\
Entities: professor, class, course\
A professor can teach zero or more classes.\
A professor can teach zero or more course.\

7. A student may enroll in several classes but take each class only once during any given enrollment
period. For example, during the current enrollment period, a student may decide to take five classes - 
Statistics, Accounting, English, Database, and History - but that student would not be enrolled in the
same Statistics class five times during the enrollment period! Each student may enroll in up to six classes,
and each class may have up to 35 students.\
Entites: student, class\
A student can enroll in one or more classes.\
A class can contain one or more students.\

8. Each department has several (or many) students whose major is offered by that department. However, each
student has only a single major and is therefore associated with a single department.\
Entites: department, student\
A department has one or more students.\
A student is in one and only one department.

9. Each student has an advisor in his or her department; each advisor counsels several students. An advisor
is also a professor. but not all professors advise students.\
Entites: student, advisor, professors\
A student has one and only one advisor.\
An advisor has one or more students.\
A professor can advise zero or more students.

10. A class is taught in a room. In turn, each room is located in a building. Some buildings do not 
contain (class)rooms.\
Entites: class, room, building\
A class has one and only one room.\
A building has zero or more rooms.\
A room is in one and and only one building.
