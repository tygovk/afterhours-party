create table public.afterhours_admins(user_id uuid primary key references auth.users(id) on delete cascade,created_at timestamptz not null default now());
alter table public.afterhours_admins enable row level security;
revoke all on public.afterhours_admins from anon,authenticated;
grant select on public.afterhours_admins to authenticated;
create policy afterhours_admin_self_read on public.afterhours_admins for select to authenticated using((select auth.uid())=user_id);
insert into public.afterhours_admins(user_id) values('4be4defc-d89b-4b6b-a99e-63969256d628');
create table public.afterhours_global_rules(id uuid primary key default gen_random_uuid(),text text not null check(char_length(text) between 1 and 400),is_published boolean not null default false,sort_order integer not null default 0,created_at timestamptz not null default now());
create table public.afterhours_modes(id uuid primary key default gen_random_uuid(),title text not null check(char_length(title) between 1 and 80),description text not null default '' check(char_length(description)<=600),rules jsonb not null default '[]'::jsonb check(jsonb_typeof(rules)='array' and jsonb_array_length(rules)<=100 and octet_length(rules::text)<=60000),categories text[] not null default array['warmup','silly'] check(cardinality(categories)>0 and categories <@ array['warmup','silly','caliente','custom']),card_types text[] not null default array['standard','sidequest','timer','vote','group','duel'] check(cardinality(card_types)>0 and card_types <@ array['standard','sidequest','timer','vote','group','duel']),is_published boolean not null default false,sort_order integer not null default 0,created_at timestamptz not null default now());
alter table public.afterhours_global_rules enable row level security;
alter table public.afterhours_modes enable row level security;
revoke all on public.afterhours_global_rules,public.afterhours_modes from anon;
grant select,insert,update on public.afterhours_global_rules,public.afterhours_modes to authenticated;
create policy afterhours_global_rules_read on public.afterhours_global_rules for select to authenticated using(is_published or exists(select 1 from public.afterhours_admins a where a.user_id=(select auth.uid())));
create policy afterhours_global_rules_insert on public.afterhours_global_rules for insert to authenticated with check(exists(select 1 from public.afterhours_admins a where a.user_id=(select auth.uid())));
create policy afterhours_global_rules_update on public.afterhours_global_rules for update to authenticated using(exists(select 1 from public.afterhours_admins a where a.user_id=(select auth.uid()))) with check(exists(select 1 from public.afterhours_admins a where a.user_id=(select auth.uid())));
create policy afterhours_modes_read on public.afterhours_modes for select to authenticated using(is_published or exists(select 1 from public.afterhours_admins a where a.user_id=(select auth.uid())));
create policy afterhours_modes_insert on public.afterhours_modes for insert to authenticated with check(exists(select 1 from public.afterhours_admins a where a.user_id=(select auth.uid())));
create policy afterhours_modes_update on public.afterhours_modes for update to authenticated using(exists(select 1 from public.afterhours_admins a where a.user_id=(select auth.uid()))) with check(exists(select 1 from public.afterhours_admins a where a.user_id=(select auth.uid())));
insert into public.afterhours_modes(title,description,rules,categories,is_published,sort_order) values
('Warming-up','Breek het ijs met vragen, korte challenges en luchtige groepsopdrachten.','["Geef iedereen de ruimte om een antwoord af te maken.","Passen mag altijd."]',array['warmup'],true,1),
('Silly','Onzinnige opdrachten, snelle vragen en duels voor een energieke avond.','["De groep is jury bij duels.","Een opdracht overslaan mag altijd."]',array['silly'],true,2),
('Caliente 18+','Flirtvragen en dilemma’s voor een volwassen groep.','["Speel alleen als iedereen 18 jaar of ouder is en wil meedoen.","Respecteer elkaars grenzen; passen mag altijd."]',array['caliente'],true,3);

