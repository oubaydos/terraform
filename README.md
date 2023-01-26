## How to use

run `terraform apply` and type yes after prompt

this will create a vm containing cassandra in port 9042 and print out its ip address

after that you can use any cassandra driver to access your cluster

the commands you may wanna use if you come from the TAG project are these:

```cassandraql
CREATE KEYSPACE IF NOT EXISTS test WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'};
CREATE TABLE IF NOT EXISTS test.Card
(
    id_card         text PRIMARY KEY,
    end_of_validity timestamp,
    id_client       text,
    type            text
);
CREATE TABLE IF NOT EXISTS test.Client
(
    id_client  text PRIMARY KEY,
    first_name text,
    last_index int,
    last_name  text,
    top_line   varchar
);
CREATE TABLE IF NOT EXISTS test.Event
(
    id_event      int PRIMARY KEY,
    end_station   text,
    id_card       text,
    id_user       text,
    line          varchar,
    start_station text,
    timestamp     timestamp
);
CREATE TABLE IF NOT EXISTS test.statistics_1
(
    day        text PRIMARY KEY,
    month_user int,
    new_subs   int,
    year_user  int,
    LPRD       timestamp
);
CREATE TABLE IF NOT EXISTS test.statistics_2
(
    id     int PRIMARY KEY,
    day    text,
    to_    varchar,
    from_  varchar,
    tram_A map<text,int>,
    tram_B map<text,int>,
    tram_C map<text,int>,
    LPRD   timestamp
);
```

when you finish you can use `terraform destroy` to delete the vm