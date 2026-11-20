create table profiles (
    id uuid primary key,
    name text,
    age integer,
    height integer,
    weight integer,
    goal text,
    activity text,
    created_at timestamp
);

create table checkins (
    id uuid primary key,
    user_id uuid,
    weight numeric,
    energy integer,
    sleep integer,
    mood text,
    created_at timestamp
);