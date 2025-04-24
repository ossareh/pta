# What Am I Building?

This is an attempt to write a TUI around categorizing financial transactions.

I want to download CSV files from my bank account, parse them, and then categorize them
using the plain text accounting tools. Specifically I will use the `tacker-ng` tool for parsing
the transactions and reporting on them.

I want this project to stand alone; anyone should be able to use it. Keep the `tackler-ng` element
of this project decoupled.

As it stands I believe I need the following features:

- read CSV from bank accounts -> write to stub PTA files; these transactions are uncategorized
- read stub PTA files -> write categorized PTA files into correct date directory

Open Questions:

- Does the CSV parser need to handle different formats? i.e. is Chase different from Schwab, etc.
- How are categories supplied to the categorizer?
- How are accounts supplied to the categorizer?
- There are other formats, for example QIF, are these better / worse / more widely adopted?

First steps:

- download a CSV file from Chase
- find a zig library for csv parsing
- load the CSV and parse it into transactions
- write the transactions to STDOUT
