-- NOVA Equipo · esquema para Supabase (pegar en el SQL Editor)
-- Tablas: agents, referrals, posts

create table if not exists agents (
  id text primary key,
  name text not null,
  pin text not null,
  role text not null default 'agent' check (role in ('admin','agent')),
  created_at timestamptz default now()
);

create table if not exists referrals (
  id uuid primary key default gen_random_uuid(),
  agent_id text not null references agents(id),
  first_name text not null,
  last_name text default '',
  phone text not null,
  address text default '',
  city text default '',
  best_time text default '',
  notes text default '',
  status text not null default 'nuevo'
    check (status in ('nuevo','contactado','vendido','no_interesado')),
  created_at timestamptz default now()
);

create table if not exists posts (
  id uuid primary key default gen_random_uuid(),
  agent_id text not null references agents(id),
  type text not null default 'anuncio' check (type in ('anuncio','video')),
  title text not null,
  body text not null,
  link text default '',
  created_at timestamptz default now()
);

-- Agentes iniciales (cambia los PIN después)
insert into agents (id, name, pin, role) values
  ('a-david','David Pacheco','0000','admin'),
  ('a-janet','Janet','1234','agent'),
  ('a-kriza','Kriza','1234','agent')
on conflict (id) do nothing;

-- Acceso simple para el equipo (versión 1; se puede endurecer después)
alter table agents enable row level security;
alter table referrals enable row level security;
alter table posts enable row level security;

create policy "acceso equipo" on agents for all using (true) with check (true);
create policy "acceso equipo" on referrals for all using (true) with check (true);
create policy "acceso equipo" on posts for all using (true) with check (true);
