# Draft Master API

Draft Master API is a program built to collect player data from Espn and Fantasy Pros

This player data contains:

- From Espn

  - Name
  - Position
  - Depth Slot

- From Fantasy Pros

  - XRank
  - Average Draft Pick
  - Fantasy Points Projections
  - Notes
  - Bye Weeks

Users can make request to get all players.

Users can make request to change player from available to taken.

Users can make request to reset the database with the latest depth slots.

## Install

### Clone the repository

```shell
git clone git@github.com:davidgreenspan15/DraftMasterAPI.git
cd project
```

### Check your Ruby version

```shell
ruby -v
```

The output should start with something like `ruby 2.7.2`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.7.2
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

## Server

```shell
rails s
```
