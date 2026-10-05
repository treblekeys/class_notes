# Chapter 5
**Logical Model** shows what the system must do.
**Physical Model** describes how the system will be constructed.

4 model approach:
- physical model of current system
- logical model of current
- physical of new system
- logical of new

Data flow diagram (DFD) uses symbols to show how the system transform input data into useful
information. Shows how data moves in the IS, but not the program logic or processing steps.
A set of DFD provide logical model that shows what the system does, not how it does it.

There are various versions of DFD symbols; our textbook uses the Gane and Sarson Symbols.

**Process Symbols**
- processes contain business logic that transform data to produce the results.
- process name identifies a function consisting of a verb followed by a singular noun.
- the process symbol can be called a black box; the underlying logic is hidden.

**Data Flow Symbols**
- data flow is the path of data to move from one part of the IS to another
- represents one or more data items
- symbol is a line with a single or double arrowhead
- name includes a singular noun and an adjective (if needed)

**Data Store Symbols**
- data store is used in a DFD to represent data that the system stores because one or more processes
  need to use the data later
- symbol for data store is a flat rectangle that is open on the right and closed on the left.
- data store name is a plural name consisting of a noun and adjectives
- data store must be connected to a process with a data flow

**Entity Symbols**
- symbol is a rectangle; shaded to make it look 3D
- DFD only shows external entities that provide data to system or receive output from system.
- also called terminators because they are the data origins or destinations
- entity that supplies data to the system is called a source
- entity that receives data from the system is called a sink

**Drawing Data Flow Diagram**
A **context diagram** is a top level view of an information system that shows the system's
boundaries and scope.
- To draw it, start with a single process symbol in the center and then put system entities around
  the perimeter of the page and connect the entities to central process with data flows.
- The symbol in the center represent the entire information system and is identified as process 0.

**Drawing a diagram 0**
- Diagram 0 provides an overview of all the components that interact to form the overall system.
- It shows major internal processes, data flows, and data stores
- When context diagram is expanded into DFD diagram 0, all connections that flow into and out of
  process 0 must be retained.
- A diverging data flow occurs when the same data travels to two or more location.

**Drawing lower-level DFD**
- Leveling draws increasing detailed diagrams until all functional primitives are identified.
- Balancing maintains consistency among DFDs by ensuring that input and output data flows align
  properly.
- A process 0 could be shown as a black box. In the next layer, the process 0 black box will reveal
  more processes, data stores, and data flows to show how it works inside.

**Data Dictionary**
- A data dictionary contains information about data, such as meaning, relationship to other data,
  origin, usage, and format.
- Includes data element description, attribute/property definitions, relationship description,
  rules/constraints, other metadata.
- Every data element should be documented to provide clear, comprehensive info about the data/processes
- All data flow in the data dictionary must be documented: data flow name, description, origin,
  destination, record, volume/frequency
- Every DFD data store in the data dictionary should be documented: data store name, description,
  alternate names, attributes
- Every DFD process must be documented: process name, description, process number, process description
- External entities should be documented: entity name, description, alternate names, input/output
  data flows.
- A record is a data structure containing related data elements stored and processed together;
  should be documented: record or data structure name, definition, alternate name, attribute.
- the following are reports that are obtained from a data dictionary: list of data elements, report
  describing each data element, characteristics of elements, records, data flows, processes

**Process description tools in modular design**
- a process description documents the details of a functional primitive and represents a specific
  set of processing steps and business logic.
- modular design is based on combinations of three logical structures, which serve as building
  blocks for the process
    - The three structures are called sequence, selection, and iteration
        - a rectangle represents a step or process
        - a diamond shape represents a condition or decision
        - the logic follows the lines in the direction indicated by the arrows
- Structured English is a subset of standard English that describes logical processes clearly and
  accurately. Use only the three building blocks, indentation for readability, and limited
  vocabulary
- a decision table is a logical structure that shows every combination of conditions and outcomes
    - if a process has single condition, there are only two possibilities: yes or no
- a decision tree is a graphical representation of conditions, actions, and rules found in a
  decision table. Show the logic structure in a horizontal form and provides same result as table.
