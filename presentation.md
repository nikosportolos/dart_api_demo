# Object-relational mapping in Dart

In the realm of modern software development, the ability to seamlessly store and retrieve data is paramount. 
Whether you're building a web application, a mobile app, or any other software solution, managing the interaction 
between objects and databases can quickly become complex and time-consuming. 

That's where Object-Relational Mapping (ORM) comes into play, offering a powerful toolset to bridge the gap 
between your application's objects and the underlying database tables.


## Table of Contents

- [Getting started](#getting-started)
  - [What is Object Relational Mapping?](#what-is-object-relational-mapping)
  - [ORM in other programming languages](#orm-in-other-programming-languages)
    - [ORM - Code generation](#orm---code-generation)
      - [Code-first approach](#code-first-approach)
      - [Database-first approach](#database-first-approach)
- [Microsoft SQL Server](#microsoft-sql-server)
  - [How to connect to SQL Server using other programming languages](#how-to-connect-to-sql-server-using-other-programming-languages)
- [ORM in Dart/Flutter](#orm-in-dartflutter)
  - [Prisma](#prisma)
    - [Advantages of Prisma](#advantages-of-prisma)
  - [Why use Prisma in a Dart/Flutter project?](#why-use-prisma-in-a-dartflutter-project)
  - [Considerations/Challenges](#considerationschallenges)
  - [How to install and use Prisma ORM for Dart/Flutter](#how-to-install-and-use-prisma-orm-for-dartflutter)
  - [Code generation using Prisma](#code-generation-using-prisma)
    - [Code-first generation](#code-first-generation-)
    - [Database-first generation](#database-first-generation)
  - [Migrations in Prisma](#migrations-in-prisma)
  - [Generate the Prisma client](#generate-the-prisma-client)
  - [Using the Prisma Client](#using-the-prisma-client)
- [Dart API with dart_frog](#dart-api-with-dartfrog)
  - [How to use dart_frog](#how-to-use-dartfrog)
    - [Installing](#installing)
    - [Creating a Project](#creating-a-project)
    - [Start the Dev Server](#start-the-dev-server)
    - [Create a Production Build](#create-a-production-build)
  - [Create the API using dart_frog](#create-the-api-using-dartfrog)


> You can find the complete source code in https://github.com/nikosportolos/dart_api_demo.


## Getting started

In this tutorial, we delve into the fascinating world of Object-Relational Mapping in Dart,
with a particular focus on utilizing the Dart package called Prisma ORM.
Dart, known for its versatility and performance, has gained significant traction in recent years,
becoming a go-to language for building cross-platform applications.
By leveraging Prisma ORM, a robust and feature-rich ORM framework designed specifically for Dart,
you can unlock an array of benefits, including increased productivity, improved code organization,
and simplified data persistence.

Furthermore, we'll introduce you to the 'dart_frog' package, a potent tool for crafting Dart servers that expose APIs.
With 'dart_frog', you can effortlessly construct a server that interacts with your SQL Server database,
seamlessly integrating with Prisma ORM.
This synergy between Prisma ORM and 'dart_frog' empowers you to create a powerful backend infrastructure that
efficiently retrieves data from your SQL Server.

Whether you're an experienced Dart developer seeking to optimize your data access layer with SQL Server
integration using Prisma ORM and 'dart_frog', or a newcomer eager to delve into the world of ORM,
this tutorial is tailored for you.

Join us on this enlightening journey as we demystify Object-Relational Mapping in Dart and demonstrate
how it can unlock new possibilities for your projects.
Let's dive in!


### What is Object Relational Mapping?

Object Relational Mapping (ORM) is a technique used in creating a "bridge" 
between object-oriented programs and, in most cases, relational databases.

<a href="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/orm.png" target="_blank">
  <img src="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/orm.png" width="400" alt="orm">
</a>

Put another way, you can see the ORM as the layer that connects 
object-oriented programming (OOP) to relational databases.

> Source: https://www.freecodecamp.org/news/what-is-an-orm-the-meaning-of-object-relational-mapping-database-tools


### ORM in other programming languages

<a href="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/orm-in-other-languages.png" target="_blank">
  <img src="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/orm-in-other-languages.png" width="500" alt="orm-in-other-languages">
</a>


### ORM - Code generation

#### Code-first approach

**Code First** (or model-first) allows you to create a new model 
and then generate a database schema based on that model.

<a href="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/model-first.png" target="_blank">
  <img src="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/model-first.png" width="300" alt="model-first">
</a>


#### Database-first approach

**Database First** allows you to reverse engineer a model from an existing database schema.

<a href="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/db-first.png" target="_blank">
  <img src="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/db-first.png" width="300" alt="db-first">
</a>


## Microsoft SQL Server

Microsoft SQL Server is a relational database management system (RDBMS) that 
supports a wide variety of transaction processing, business intelligence 
and analytics applications in corporate IT environments. 

<a href="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/sql-logo.png" target="_blank">
  <img src="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/sql-logo.png" width="300" alt="sql-logo">
</a>

SQL Server can be installed on premises or in the cloud

<a href="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/sql-server-installation.png" target="_blank">
  <img src="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/sql-server-installation.png" width="750" alt="sql-server-installation">
</a>


### How to connect to SQL Server using other programming languages

The **Microsoft Open Database Connectivity (ODBC)** interface is a C programming language interface 
that makes it possible for applications to access data from a variety of database management systems (DBMSs).

ODBC is a low-level, high-performance interface that is designed specifically for relational data stores.

> Source: https://learn.microsoft.com/en-us/sql/odbc/microsoft-open-database-connectivity-odbc?view=sql-server-ver16

<a href="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/odbc.png" target="_blank">
  <img src="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/odbc.png" width="800" alt="odbc">
</a>


## ORM in Dart/Flutter

### Prisma

Prisma is an open source next-generation ORM.

<a href="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/prisma.png" target="_blank">
  <img src="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/prisma.png" width="800" alt="prisma">
</a>

It consists of the following parts:

- **Prisma Client**

  Auto-generated and type-safe query builder for Node.js & TypeScript.


- **Prisma Migrate**

  Migration system.


- **Prisma Studio**

  GUI to view and edit data in your database.


#### Advantages of Prisma

- **Most Popular Databases**

  Prisma supports PostgreSQL, MySQL, MariaDB, SQL Server, SQLite, MongoDB and CockroachDB.


- **Type-safe**

  Prisma Client is a query builder that’s tailored to your schema.
  The API is designed to be intuitive, both for SQL veterans and developers brand new to databases.
  The auto-completion helps you figure out your query without the need for documentation.


- **Human-readable**

  Prisma schema is intuitive and lets you declare your database tables in a human-readable way — 
  making your data modeling experience a delight.
  You define your models by hand or introspect them from an existing database.


### Why use Prisma in a Dart/Flutter project?

- It’s open source

- Already used by other languages/frameworks

- Supports the most popular and widely used databases

- Allows us to connect a Dart/Flutter app directly to a database which 
  isn’t already supported by other packages, like SQL Server


### Considerations/Challenges

- It adds one extra layer between the Dart/Flutter app and 
  the database, which we have no control on.

- Performance (?)


### How to install and use Prisma ORM for Dart/Flutter

1. Install Node.JS

  <a href="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/node-js.png" target="_blank">
    <img src="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/node-js.png" width="800" alt="node-js">
  </a>


2. Install Prisma CLI

  **Prisma CLI** is a command-line tool officially provided by Prisma
  for managing Prisma projects.
  
  It helps you generate Prisma clients, generate the models required
  by Prisma clients, and perform database migrations.
  
  ```shell
  npm i prisma
  ```

3. Initialize the Prisma project

  A Prisma project is a project that contains the Prisma client 
  and the models required by the Prisma client.
  
  You can initialize a Prisma project using the Prisma CLI.
  
  ```shell
  npx prisma init
  ```

4. Initialize the Prisma project

  You will get a **.env** file that contains configuration information for the Prisma project.
  
  ```shell
  DATABASE_URL="postgresql://USER:PASSWORD@HOST:PORT/DATABASE?schema=SCHEMA"
  ```
  
  and a **prisma/schema.prisma** file containing the models required by the Prisma client.
  
  ```shell
  generator client {
    provider = "dart run orm"
  }
  
  datasource db {
    provider = "sqlserver"
    url = env("DATABASE_URL")
  }
  ```

5. Install the required Dart packages

  The orm package is a Dart version of the Prisma client for interacting with the Prisma engine.

  ```shell
  dart pub add orm
  ```

  Install **build_runner** and **json_serializable** to generate the necessary files.

  ```shell
  dart pub add build_runner -d # required
  dart pub add json_serializable -d # required
  dart pub add json_annotation # optional, but recommended
  ```

6. Modify the generator configuration in the schema.prisma file

  ```shell
  generator client {
    provider = "dart run orm"
  }
  ```

### Code generation using Prisma

#### Code-first generation 

1. Add a data model in the **schema.prisma** file

  ```
  model User {
    id         String  @id(map: "PK_User") @db.NVarChar(36)
    email      String  @unique @db.NVarChar(100)
    first_name String  @db.NVarChar(100)
    last_name  String  @db.NVarChar(100)
    alias      String? @db.NVarChar(150)
  }
  ```

2. Use the Prisma CLI to push the user-defined schema to the database

  ```shell
  npx prisma db push
  ```


#### Database-first generation

1. Create a table in your database

  <a href="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/user-table.png" target="_blank">
    <img src="https://raw.githubusercontent.com/nikosportolos/dart_api_demo/main/assets/user-table.png" width="800" alt="user-table">
  </a>


2. Use the Prisma CLI to pull the schema from database
   and update the **schema.prisma** file

  ```shell
  npx prisma db pull
  ```


### Migrations in Prisma

Prisma Migrate is an imperative database schema migration tool that enables you to:

- Keep your database schema in sync with your Prisma schema as it evolves and

- Maintain existing data in your database.

Prisma Migrate generates a history of .sql migration files, and plays a role in both development and deployment.

```shell
npx prisma db migrate
```


### Generate the Prisma client

1. Use the Prisma CLI to generate the prisma client

```shell
npx prisma generate
```

2. Use **build_runner** to generate the models

```shell
dart run build_runner build
```


### Using the Prisma Client

```dart
import 'package:orm/logger.dart';
import 'prisma_client.dart';

final prisma = PrismaClient(
   stdout: Event.values, // print all events to the console
   datasources: Datasources(
     db: 'postgresql://USER:PASSWORD@HOST:PORT/DATABASE?schema=SCHEMA',
   ),
);

main() async {
   try {
     final user = await prisma.user.create(
       data: UserCreateInput(
         name: 'Alice',
         email: 'alice@prisma.pub',
       ),
     );

     print(user);
   } finally {
     await prisma. $disconnect();
   }
}
```


## Dart API with dart_frog

> A fast, minimalistic backend framework for Dart 🎯
> 
> https://dartfrog.vgv.dev/
> 
> View the full documentation [here](https://verygoodopensource.github.io/dart_frog).


Advantages of **dart_frog**:

- **Built for Speed**

  Create new endpoints in just a few lines and iterate blazingly fast with hot reload.


- **Lightweight**

  Minimize ramp-up time with our simple core and small API surface.


- **Powered by Dart**

  Tap into the powerful Dart ecosystem with [Shelf](https://pub.dev/packages/shelf), 
  [DevTools](https://dart.dev/tools/dart-devtools), [testing](https://dart.dev/guides/testing), and more.


### How to use dart_frog

#### Installing

```shell
# 📦 Install the dart_frog cli from source
dart pub global activate dart_frog_cli
```


#### Creating a Project

Use the dart_frog create command to create a new project.

```shell
# 🚀 Create a new project called "my_project"
dart_frog create my_project
```


#### Start the Dev Server

Next, open the newly created project and start the dev server via:

```shell
# 🏁 Start the dev server
dart_frog dev
```


#### Create a Production Build

Create a production build which includes a DockerFile so that you can deploy anywhere:

```shell
# 📦 Create a production build
dart_frog build
```


### Create the API using dart_frog

```dart
import 'dart:async';
import 'dart:io';

import 'package:api_data_source/api_data_source.dart';
import 'package:dart_frog/dart_frog.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);

    case HttpMethod.post:
      return _post(context);

    case HttpMethod.delete:
      return _delete(context);

    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context) async {
  final dataSource = context.read<UserDataSource>();
  final users = await dataSource.readAll();

  return Response.json(body: users);
}

Future<Response> _post(RequestContext context) async {
  final dataSource = context.read<UserDataSource>();
  final user = User.fromJson(
    await context.request.json() as Map<String, dynamic>,
  );

  return Response.json(
    statusCode: HttpStatus.created,
    body: await dataSource.create(user),
  );
}

Future<Response> _delete(RequestContext context) async {
  final dataSource = context.read<UserDataSource>();
  await dataSource.deleteAll();

  return Response(statusCode: HttpStatus.noContent);
}
```

> You can find the complete source code in https://github.com/nikosportolos/dart_api_demo.

