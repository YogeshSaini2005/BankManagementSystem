BankManagementSystem/
│
├── sql/
│   └── bank_db.sql              ← MySQL schema & sample data
│
├── src/
│   ├── Main.java                ← Entry point (GUI or Console)
│   │
│   ├── model/                   ← OOP Model classes
│   │   ├── Account.java         ← Base class (Encapsulation)
│   │   ├── SavingsAccount.java  ← Inherits Account
│   │   ├── CurrentAccount.java  ← Inherits Account
│   │   ├── Customer.java        ← Customer model
│   │   └── Transaction.java     ← Transaction model
│   │
│   ├── database/
│   │   └── DatabaseConnection.java  ← Singleton JDBC connection
│   │
│   ├── service/
│   │   └── AccountService.java  ← All business logic
│   │
│   ├── gui/
│   │   ├── BankGUI.java         ← Swing GUI (Option 3)
│   │   └── ConsoleApp.java      ← Console interface (Option 1)
│   │
│   └── utils/
│       ├── BankException.java        ← Custom exception
│       ├── HashUtil.java             ← SHA-256 PIN hashing
│       └── AccountNumberGenerator.java
│
└── README.md
