# Backend Project Documentation

## Table of Contents
- [Installation](#installation)
- [Environment Variables](#environment-variables)
- [Database Setup](#database-setup)
- [Running the Application](#running-the-application)


## Installation

1. **Clone the repository:**
    ```sh
    git clone (Url gitlab/github project)
    ```

2. **Install the dependencies:**
    ```sh
    npm install
    ```

## Environment Variables

Create a `.env` file in the root of your project and add the following environment variables:

```env
DATABASE_URL="mysql://root:@localhost:3306/(databasename)
JWT_SECRET=xxxxx
```

## Database Setup
3. **Install Prisma CLI**

```
npm install -g prisma
```
4. **Generate Prisma Client**
```
npx prisma generate
```
5. **Run Database Migrations**
```
npx prisma migrate dev --name init

```
6. **Seed the Database (optional)**

```
npx prisma db seed

``` 

## Running the Application

7. **Start the development server**
```
npm run start:dev
```

untuk HMS_ACCESS_ISS dari HMS_TEMPLATE_ID yang harus kita generate ke web jwt.io
nanti ada ISS nya salin