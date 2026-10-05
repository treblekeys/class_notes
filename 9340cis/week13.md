# Finals Review

## Understanding Transaction Processing
- Multi-user database
    - More than one user processing the database at the same time
    - Controlling read and update order
- Issues
    - How can we prevent users from interfering with each other's work?
    - How an we safely process transactions on the database without corrupting or losing data?
    - If there is a problem, how can we recover without losing all of our data?
- A **transaction** is a set of __read or write__ operations that must either commit or abort.
- Commit point (success): all actions are permanently saved in the database.
- Abort (failure): none of the actions are saved and it is called rolled back or undone.

## ACID Properties of Transactions
- **Atomicity**: 'All or nothing' property, commit or abort
- **Consistency**: Must transform database from one consistent state to naother.
- **Isolation**: Partial effects of incomplete transactions should not be visible to other transactions.
- **Durability**: Effects of a commited transaction are permanent and must not be lost because of later failure.

## Four General Classes of problems with Transaction Processing
- The Lost Update problem: Successfully completed update is overridden by another user.
- The Dirty Read problem: Also called uncommitted dependency, occurs when one transaction can see intermediate results of another transaction before it has committed.
- The Incorrect Analysis problem: Occurs when transaction reads several values but second transaction updates some of tem during execution of the first.
- The Non-repeatable Read problem: Nonrepeatable read occurs when a transaction reads the same row twice but gets different data each time.

### The Lost Update Problem Ex
- We have two users, A and B, who are looking at a database and want to update info it. Both users read inventory for Prod P200, and both users update the inventory, but with different values. After, they write the update into the database.
- User A will decrement inventory by 2, while user B decrement inventory by 3. 
- When user A writes the inventory, value of P200 will become 10-2=8. When user B writes the inventory, value of P200 will become 10-3=7.
- Since user B performs the write after user A, the value of P200 will be 7(dirty). That means that when user A and B updates, the value of P200 will become 7. 
- This is a lost update problem because the update that user A had is lost and overridden by user B. 

### The Dirty Read Problem Ex
- In this example, it will be a similar premise to example above, execpt this time, user A reads inventory, decrements it, and then writes inventory first.
- User A did not commit the changes yet, however, user B is able to see the changes that user A made. 
- User B is able to make changes to the database while user A have not update changes yet, such as aborting user A's changes.

### The Incorrect Analysis Problem Ex
- Using the similar example, user A and user B are looking at the same database. There are three columns, P200, P300, and P400.
- User A reads P200, and added it to the sum. Then he reads P300, and adds it to the sum.
- At this time, user B reads P200 and decrements it by 3. Now, P200 is 3 less than when user A read it initially. 
- User A finally reads P400 and adds it to the sum, and now he has the sum of P200, P300, and P400. However, because user B made a change to P200, the current value of the sum is different, making it an incorrect analysis.

### The Non-Repeatable (Fuzzy) Read Problem Ex

## Serial Schedules and Serializability
- Can we insist only one transact at a time?
- Transaction throughput: The number of transactions we can perform in a given time period. Often reported ass Transactions per second or TPS.
- Serializable: 
    - More concurrect transactions = serial order (one after another).
    - Schedule: Sequence of reads/writes by set of concurrent transactions

## Serializable Ex
- Transaction A, B, C, and D
- Each has 3 operations: A1, A2, A3, B1, B2, B3, C1, C2, C3, D1, D2, D3
- Two transactions: 
    1. A1, B1, A2, C1, C2, B2, A3, B3, C3
    2. A1, A2, A3, B1, B2, B3, C1, C2, C3

## Concurrency Control and Locking
- Concurrency Control is a method for controlling or scheduling the operations in such a way that concurrent transactions can be executed.
- Concurrent transactions need to be serialized
- Locking: done to data items in order to reserve them for future operations.
- A lock is a logical flag set by a transaction to alert other transactions the data item is in use.
- Timestamping

## Characteristics of Locks
- **Implicit Locks**: are applied by the DBMS
- **Explicit Locks**: are applied by the application programs
- Lock granularity: a single data item (value), an entire row of a table, a page (memory segment), an entire table of database
- Requirements of transaction
    - An **exclusive lock** prevents any other transaction from reading or modifying the locked item.
    - A **shared lock** allows another transaction to read an item but prevents another transaction from

## Locking - Basic Rules
- If transaction has shared lock on item, can read but not update item.
- If transaction has exclusive lock on item, can both read and update item.
- Reads cannot conflict, so more than one transaction can hold shared locks simultaneously on same item.
- Exclusive lock gives transaction exclusive access to that item.

## Two phase of locking
- 2PL has two phases:
    - A transaction acquires locks on data items it will need to complete the transaction. This is called the **growing phase**.
    - Once one lock is released, all no other lock may be acquired. This is called the **shrinking phase**.

## Timestamping
- A unique identifier created by DBMS that indicates relative starting time of a transaction
- Can be generated by using systemclock at time transaction started, or by incrementing a logical counter every time a new transaction starts.
- Ordering transaction globally.
- Smaller timestamps, get priority in the event of conflict
- Conflict is resolved by rolling back and restarting transaction
- No locks no so deadlock
- Read/write proceeds only if last update on that data item was carried out by an older transaction.
- Otherwise, transaction requesting read/write is restarted and given a new timestamp.
- Also, timestamps for data items:
    - read-timestamp: timestamp of last transaction to read item.
    - write-timestamp: timestamp of last transaction to write item.

## Transaction Interruption
- There are many situations in which a transaction may not reach a commit or abort point.
    - An operating system crash
    - The DBMS can crash
    - The system might lose power
    - A disk may fail or other hardware may fail
    - Human error can result in deletion of critical data

## Database Recovery
- The process of restoring the database and the data to a consistent state
- This may include restoring lost data up to the point of the event
- Which ACID state?
- Two types of storage: volatile and nonvolatile

## Recovery Facilities
- DBMS should provide following facilities to assist with recovery:
- **Backup mechanism**: make periodic backup copies of database
- **Logging facilities**: keep track of current state of transactions and database changes
- **Checkpoint facility**: enables updates to database in progress to be made permanent
- **Recovery manager**: allows DBMS to restore database to consistent state following a failure.

## Recovering approach
- Manual Reprocessing
    - Database is periodically backed up and all transactions applied since the last save are recorded.
    - Shortcomings: lots of time required to re-apply transactions and transactions might have other consequences
- Automated Recovery
    - Log file: a file separate from the data that records all of the changes made to the database by transactions
    - Contains information about all updates to database
    - Often used for other purposes, such as auditing
    - **Rollback**: undo any partially completed transactions by applying the before images to the database
    - **Rollforward**: redo the transactions by applying the after images to the database. Ths is done for transactions that were committed before the crash

## Checkpointing
- Points of synchronization between database and log file.
- Between database saves
- The DBMS flushes all pending transactions and writes all data to disk and transaction log
- Database can be recoved from the last checkpoint in much less time.
