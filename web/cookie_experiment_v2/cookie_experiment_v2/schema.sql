-- Cookie Consent Experiment v2 — Supabase schema
create extension if not exists pgcrypto;

create table if not exists public.participants (
  id uuid primary key,
  research_code text unique not null,
  condition text not null check (condition in ('easy','hard')),
  site_sequence jsonb not null,
  internet_frequency text,
  cookie_habit text,
  reject_customize_frequency int check (reject_customize_frequency between 0 and 10),
  cookie_familiarity text,
  iuipc jsonb,
  post_survey jsonb,
  started_at timestamptz default now(),
  completed_at timestamptz,
  completed boolean default false
);

create table if not exists public.trials (
  id bigint generated always as identity primary key,
  participant_id uuid not null references public.participants(id) on delete cascade,
  research_code text not null,
  condition text not null check (condition in ('easy','hard')),
  trial_number int not null check (trial_number between 1 and 10),
  site_id text not null,
  final_choice text not null check (final_choice in ('ACCEPT_ALL','REJECT_ALL','CUSTOM')),
  choice_path text not null,
  reject_all boolean not null,
  manage_clicked boolean not null default false,
  settings_changed boolean not null default false,
  analytics_enabled boolean,
  advertising_enabled boolean,
  decision_time_ms int not null,
  click_count int not null,
  created_at timestamptz default now(),
  unique(participant_id, trial_number)
);

alter table public.participants enable row level security;
alter table public.trials enable row level security;

-- Browser participants can INSERT only. They cannot SELECT other participants' data.
grant insert, update on public.participants to anon;
grant insert on public.trials to anon;

create policy "anon_insert_participants" on public.participants
for insert to anon with check (true);
create policy "anon_update_participants" on public.participants
for update to anon using (true) with check (true);
create policy "anon_insert_trials" on public.trials
for insert to anon with check (true);

-- NOTE: the update policy is intentionally simple for a classroom prototype.
-- For public deployment, prefer an authenticated/Edge Function design so one anonymous
-- browser cannot update another participant if it learns their UUID.
