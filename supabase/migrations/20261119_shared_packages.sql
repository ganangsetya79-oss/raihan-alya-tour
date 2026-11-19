-- Shared package catalog for all authenticated Raihan Alya Tour accounts.
create table if not exists public.packages (
  id text primary key,
  name text not null unique,
  price numeric(14,2) not null default 0,
  hotel text not null default '',
  duration text not null default '',
  departure text not null default '',
  return_date text not null default '',
  notes text not null default '',
  updated_at timestamptz not null default now()
);

alter table public.packages enable row level security;

drop policy if exists "Authenticated users can read shared packages" on public.packages;
drop policy if exists "Authenticated users can insert shared packages" on public.packages;
drop policy if exists "Authenticated users can update shared packages" on public.packages;
drop policy if exists "Authenticated users can delete shared packages" on public.packages;

create policy "Authenticated users can read shared packages"
  on public.packages for select to authenticated using (true);
create policy "Authenticated users can insert shared packages"
  on public.packages for insert to authenticated with check (true);
create policy "Authenticated users can update shared packages"
  on public.packages for update to authenticated using (true) with check (true);
create policy "Authenticated users can delete shared packages"
  on public.packages for delete to authenticated using (true);

grant select, insert, update, delete on public.packages to authenticated;
