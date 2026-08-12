-- Book Sprint cloud-save backend
-- Run this in Supabase: SQL Editor > New query > Run.

create table if not exists public.book_sprint_saves (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null,
  updated_at timestamptz not null default timezone('utc', now())
);

alter table public.book_sprint_saves enable row level security;

drop policy if exists "Users read their own Book Sprint save" on public.book_sprint_saves;
create policy "Users read their own Book Sprint save"
  on public.book_sprint_saves for select
  using ((select auth.uid()) = user_id);

drop policy if exists "Users insert their own Book Sprint save" on public.book_sprint_saves;
create policy "Users insert their own Book Sprint save"
  on public.book_sprint_saves for insert
  with check ((select auth.uid()) = user_id);

drop policy if exists "Users update their own Book Sprint save" on public.book_sprint_saves;
create policy "Users update their own Book Sprint save"
  on public.book_sprint_saves for update
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);
