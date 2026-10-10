-- Shared expense records across all authenticated Raihan Alya Tour accounts.
create table if not exists public.expenses (
  id text primary key,
  departure_id text null,
  date date not null,
  category text not null,
  currency text not null default 'IDR',
  amount numeric(14,2) not null default 0,
  rate numeric(14,4) not null default 1,
  amount_idr numeric(16,2) not null default 0,
  method text not null,
  bank text not null default '',
  description text not null,
  note text not null default '',
  receipt_path text not null default '',
  receipt_name text not null default '',
  created_at timestamptz not null default now()
);
alter table public.expenses enable row level security;
drop policy if exists "Authenticated users can read shared expenses" on public.expenses;
drop policy if exists "Authenticated users can insert shared expenses" on public.expenses;
drop policy if exists "Authenticated users can update shared expenses" on public.expenses;
drop policy if exists "Authenticated users can delete shared expenses" on public.expenses;
create policy "Authenticated users can read shared expenses" on public.expenses for select to authenticated using (true);
create policy "Authenticated users can insert shared expenses" on public.expenses for insert to authenticated with check (true);
create policy "Authenticated users can update shared expenses" on public.expenses for update to authenticated using (true) with check (true);
create policy "Authenticated users can delete shared expenses" on public.expenses for delete to authenticated using (true);
grant select, insert, update, delete on public.expenses to authenticated;

-- Keep the extra jamaah form fields available to all accounts.
alter table public.jamaah add column if not exists keterangan_rombongan text not null default '';
alter table public.jamaah add column if not exists family_group text;
alter table public.jamaah add column if not exists family_relation text;
alter table public.jamaah add column if not exists mahram_name text;
alter table public.jamaah add column if not exists upgrade_description text;
alter table public.jamaah add column if not exists upgrade_amount numeric(14,2) not null default 0;
