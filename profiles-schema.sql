create table public.afterhours_profiles (
 user_id uuid primary key default auth.uid() references auth.users(id) on delete cascade,
 display_name text not null default '' check(char_length(display_name)<=40),
 rules jsonb not null default '[]'::jsonb check(jsonb_typeof(rules)='array' and jsonb_array_length(rules)<=100 and octet_length(rules::text)<=60000),
 app_state jsonb not null default '{}'::jsonb check(jsonb_typeof(app_state)='object' and octet_length(app_state::text)<=2000000),
 updated_at timestamptz not null default now()
);
alter table public.afterhours_profiles enable row level security;
revoke all on public.afterhours_profiles from anon;
grant select,insert,update on public.afterhours_profiles to authenticated;
create policy afterhours_profiles_read on public.afterhours_profiles for select to authenticated using ((select auth.uid())=user_id);
create policy afterhours_profiles_insert on public.afterhours_profiles for insert to authenticated with check ((select auth.uid())=user_id);
create policy afterhours_profiles_update on public.afterhours_profiles for update to authenticated using ((select auth.uid())=user_id) with check ((select auth.uid())=user_id);
