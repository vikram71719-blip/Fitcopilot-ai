create table profiles (
    id uuid primary key,

    age integer,

    gender text,

    height numeric,

    weight numeric,

    body_fat numeric,

    activity_level text,

    goal text,

    target_weight numeric,

    created_at timestamp
);
