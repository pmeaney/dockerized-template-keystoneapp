# Keystone Project Template

Get started:

```bash

git clone https://github.com/pmeaney/dockerized-template-keystoneapp.git

# run DB
docker compose -f ./database-docker-postgres/docker-compose.yml up

# then run KeystoneJS
npm run dev

# Now you can visit:
# http://localhost:3000/ > log in > create a post
# http://localhost:3000/api/graphql > query a post
```

If you click the three dots button, you get a link to a few things, including the Built in GraphQL API Explorer (http://localhost:3000/api/graphql)
![Keystone Default Dashboard](/docs/dashboard-img1.png)

### env vars

```bash
# need a SESSION_SECRET in .env file b/c auth.ts expects one here:
# secret: process.env.SESSION_SECRET,
# Generate one with:
# node -e "console.log(require('crypto').randomBytes(32).toString('base64'))"
```

See the .example-env.env for the current state of the .env

### Setting up a Post & Querying its contents

- Create a post in the Keystone Admin Dashboard
- Visit the GraphQL query tool
- Try this out:
  - ````graphql
        query {
          posts {
            id
            title
            content {
              document
            }
          }
        }
        ```
    ````

![Keystone GraphQL Example](/docs/graphql-example-posts.png)

---

Added in: Docker Compose for Postgres hosting.

- I added in a `./database-docker-postgres` directory containing a postgres docker compose file, and an init script which seems to be required for project setup. Prisma expects a user with certain permissions. So, this setup seems to work.

# Below: initial project docs

The below docs were created during project scaffolding via: `npm create keystone-app@latest example-keystoneapp`

---

# Keystone Project Starter

Welcome to Keystone!

Run

```
npm run dev
```

To view the config for your new app, look at [./keystone.ts](./keystone.ts)

This project starter is designed to give you a sense of the power Keystone can offer you, and show off some of its main features. It's also a pretty simple setup if you want to build out from it.

We recommend you use this alongside our [getting started walkthrough](https://keystonejs.com/docs/walkthroughs/getting-started-with-create-keystone-app) which will walk you through what you get as part of this starter.

If you want an overview of all the features Keystone offers, check out our [features](https://keystonejs.com/why-keystone#features) page.

## Some Quick Notes On Getting Started

### Changing the database

We've set you up with an [SQLite database](https://keystonejs.com/docs/apis/config#sqlite) for ease-of-use. If you're wanting to use PostgreSQL, you can!

Just change the `db` property on line 16 of the Keystone file [./keystone.ts](./keystone.ts) to

```typescript
db: {
    provider: 'postgresql',
    url: process.env.DATABASE_URL || 'DATABASE_URL_TO_REPLACE',
}
```

And provide your database url from PostgreSQL.

For more on database configuration, check out or [DB API Docs](https://keystonejs.com/docs/apis/config#db)

### Auth

We've put auth into its own file to make this humble starter easier to navigate. To explore it without auth turned on, comment out the `isAccessAllowed` on line 21 of the Keystone file [./keystone.ts](./keystone.ts).

For more on auth, check out our [Authentication API Docs](https://keystonejs.com/docs/apis/auth#authentication-api)

### Adding a frontend

As a Headless CMS, Keystone can be used with any frontend that uses GraphQL. It provides a GraphQL endpoint you can write queries against at `/api/graphql` (by default [http://localhost:3000/api/graphql](http://localhost:3000/api/graphql)). At Thinkmill, we tend to use [Next.js](https://nextjs.org/) and [Apollo GraphQL](https://www.apollographql.com/docs/react/get-started/) as our frontend and way to write queries, but if you have your own favourite, feel free to use it.

A walkthrough on how to do this is forthcoming, but in the meantime our [todo example](https://github.com/keystonejs/keystone-react-todo-demo) shows a Keystone set up with a frontend. For a more full example, you can also look at an example app we built for [Prisma Day 2021](https://github.com/keystonejs/prisma-day-2021-workshop)

### Embedding Keystone in a Next.js frontend

While Keystone works as a standalone app, you can embed your Keystone app into a [Next.js](https://nextjs.org/) app. This is quite a different setup to the starter, and we recommend checking out our walkthrough for that [here](https://keystonejs.com/docs/walkthroughs/embedded-mode-with-sqlite-nextjs#how-to-embed-keystone-sq-lite-in-a-next-js-app).
