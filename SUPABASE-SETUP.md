# Book Sprint cloud saves (Supabase)

The published site stays on GitHub Pages. Supabase provides the separate database and email sign-in needed to sync books, progress, and paragraphs between devices.

## Safety rule

Only use the **Project URL** and **publishable/anon key** in `supabase-config.js`. Never put a `service_role` key in a website or share it.

## Setup

1. With a parent, create a free Supabase project at https://supabase.com/dashboard.
2. In **SQL Editor**, create a new query, paste all of `supabase/schema.sql`, then click **Run**.
3. In **Authentication → Providers → Email**, keep Email enabled. For the simplest first version, turn off **Confirm email** only if a parent agrees; otherwise users confirm from their inbox before their first sign-in.
4. In **Authentication → URL Configuration**, add:
   - Site URL: `https://creative-cmj.github.io/book-sprint-50/`
   - Redirect URL: `https://creative-cmj.github.io/book-sprint-50/**`
5. In **Project Settings → API**, copy the Project URL and publishable/anon key into `supabase-config.js` locally. Do not use the service-role key.
6. Commit and push `supabase-config.js`, then open the app and press **Cloud save** to create an account or sign in.

## What gets saved

Each signed-in user can read and update only their own one JSON save record. It contains their goal, finish date, books, book statuses, and paragraphs. Row Level Security blocks other users from reading or changing it.

## Check it works

1. Sign in on one device.
2. Add a test book and paragraph.
3. Wait a second for the "Saved to cloud" message.
4. Sign in with the same email on another device and choose Cloud save. The saved shelf should load.
