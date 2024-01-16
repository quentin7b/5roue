# Elysia with Bun runtime

## Getting Started
To get started with this template, simply paste this command into your terminal:
```bash
bun create elysia ./elysia-example
```

## Development
To start the development server run:
```bash
bun run dev
```

## Database

We are using [prisma](https://www.prisma.io/docs/getting-started/quickstart)

To fetch the database state run `bunx prisma db pull`

To generate the client run `bunx prisma generate`

And to generate a migration for the database run `bunx prisma migrate dev --name XXX`