-- Data keluarga/pendamping untuk membantu admin menyusun Room List.
-- Jalankan sekali di Supabase SQL Editor sebelum menggunakan field baru ini.
alter table public.jamaah
  add column if not exists family_group text not null default '',
  add column if not exists family_relation text not null default '',
  add column if not exists mahram_name text not null default '';

comment on column public.jamaah.family_group is 'Nama keluarga/rombongan keluarga yang diisi dan diverifikasi admin';
comment on column public.jamaah.family_relation is 'Hubungan keluarga yang dinyatakan jamaah, misalnya suami, istri, ayah, ibu, anak, saudara, wali, atau lainnya';
comment on column public.jamaah.mahram_name is 'Nama pendamping/mahram sesuai keterangan jamaah; bukan verifikasi hukum mahram otomatis';
