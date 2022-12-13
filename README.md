# Arithmetic Generator

Arithmetic Generator for AP Computer Science AB 2022-2023 in Ivan Rico's class

## Dependencies

- Java 1.8 or higher

## Building

- **Requires [Processing v3.5.1](https://processing.org/download)**
- **Requires [Ant v1.10.12](https://ant.apache.org/bindownload.cgi#:~:text=1.10.12%20release%20%2D%20requires%20minimum%20of%20Java%208%20at%20runtime)**
- Then in the processing app go to in the top bar: `Tools` -> `Install processing-java`
- Then in the command line run
  - ```bash
    ant
    ```

## Downloading

**[Latest release](https://github.com/luis-c465/BankApp/releases/latest)**

## Running

- ```bash
  java -jar Main.jar
  ```

## Project Requirements

Due: **Sun Dec 11 2022**

- Has a login screen with user: admin and password: password
- Can select from at least 5 different customers
- Each customer shows a different name, amount, bank id and frozen status
- First user’s balance is negative
- Can deposit money
- Can withdraw money only if balance is positive
- Can add a user given the name, amount, bank id and balance
- Can freeze any account
- Can remove a user
- Can exit at any time
