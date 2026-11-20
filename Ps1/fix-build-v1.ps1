$goals = @'
"use client";

export default function GoalsPage() {
  return (
    <main style={{ padding: "40px" }}>
      <h1>Goals</h1>

      <p>
        Goal selection coming soon.
      </p>
    </main>
  );
}
'@

Set-Content `
app/onboarding/goals/page.tsx `
$goals


$activity = @'
"use client";

export default function ActivityLevelPage() {
  return (
    <main style={{ padding: "40px" }}>
      <h1>Activity Level</h1>

      <p>
        Activity setup coming soon.
      </p>
    </main>
  );
}
'@

Set-Content `
app/onboarding/activity-level/page.tsx `
$activity

Write-Host ""
Write-Host "✅ Build Fix Applied"
Write-Host ""