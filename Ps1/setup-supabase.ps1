$code = @'
import { createClient }
from "@supabase/supabase-js";

const supabaseUrl =
  process.env
    .NEXT_PUBLIC_SUPABASE_URL!;

const supabaseKey =
  process.env
    .NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export const supabase =
  createClient(
    supabaseUrl,
    supabaseKey
  );
'@

New-Item `
-ItemType Directory `
-Force `
lib\supabase | Out-Null

Set-Content `
lib\supabase\client.ts `
$code

Write-Host "Supabase client created"