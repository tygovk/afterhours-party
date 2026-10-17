create table public.afterhours_cards (
 id uuid primary key default gen_random_uuid(),
 user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
 text text not null check (char_length(text) between 1 and 600),
 category text not null default 'custom' check(category in ('warmup','silly','caliente','custom')),
 type text not null default 'standard' check(type in ('standard','sidequest','timer','vote','group','duel')),
 duration integer not null default 3 check(duration between 1 and 20),
 seconds integer not null default 10 check(seconds between 3 and 120),
 video_url text check(video_url is null or (char_length(video_url)<=2000 and video_url ~ '^https://')),
 video_path text check(video_path is null or split_part(video_path,'/',1)=user_id::text),
 created_at timestamptz not null default now()
);
create index afterhours_cards_user_idx on public.afterhours_cards(user_id,created_at desc);
alter table public.afterhours_cards enable row level security;
grant select,insert,update,delete on public.afterhours_cards to authenticated;
revoke all on public.afterhours_cards from anon;
create policy afterhours_read on public.afterhours_cards for select to authenticated using ((select auth.uid())=user_id);
create policy afterhours_insert on public.afterhours_cards for insert to authenticated with check ((select auth.uid())=user_id);
create policy afterhours_update on public.afterhours_cards for update to authenticated using ((select auth.uid())=user_id) with check ((select auth.uid())=user_id);
create policy afterhours_delete on public.afterhours_cards for delete to authenticated using ((select auth.uid())=user_id);
insert into storage.buckets (id,name,public,file_size_limit,allowed_mime_types) values ('afterhours-videos','afterhours-videos',false,52428800,array['video/mp4','video/webm','video/quicktime']);
create policy afterhours_video_read on storage.objects for select to authenticated using (bucket_id='afterhours-videos' and (storage.foldername(name))[1]=(select auth.uid())::text);
create policy afterhours_video_insert on storage.objects for insert to authenticated with check (bucket_id='afterhours-videos' and (storage.foldername(name))[1]=(select auth.uid())::text);
create policy afterhours_video_delete on storage.objects for delete to authenticated using (bucket_id='afterhours-videos' and (storage.foldername(name))[1]=(select auth.uid())::text);
