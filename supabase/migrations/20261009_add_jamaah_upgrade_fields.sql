-- Upgrade / biaya tambahan jamaah
-- Jalankan sekali di Supabase SQL Editor sebelum menggunakan field upgrade di dashboard.
alter table public.jamaah
  add column if not exists upgrade_description text not null default '',
  add column if not exists upgrade_amount numeric(14,2) not null default 0;

comment on column public.jamaah.upgrade_description is 'Keterangan upgrade atau biaya tambahan jamaah, misalnya upgrade kamar Quad ke Triple';
comment on column public.jamaah.upgrade_amount is 'Biaya tambahan upgrade jamaah dalam rupiah; ditambahkan ke harga paket dasar';
