$pages = @(
"app\(auth)\reset-password\page.tsx",
"app\(auth)\verify-email\page.tsx",
"app\(marketing)\page.tsx",
"app\(marketing)\about\page.tsx",
"app\(marketing)\contact\page.tsx",
"app\(marketing)\features\page.tsx",
"app\(marketing)\pricing\page.tsx",
"app\admin\page.tsx",
"app\body-scan\page.tsx",
"app\progress\page.tsx",
"app\settings\page.tsx",
"app\subscriptions\page.tsx"
)

foreach($page in $pages){

$content = @'
export default function Page() {
  return (
    <main style={{ padding: "40px" }}>
      <h1>Coming Soon</h1>

      <p>
        This section is under development.
      </p>
    </main>
  );
}
'@

Set-Content $page $content

}

Write-Host ""
Write-Host "✅ Fixed all empty pages"
Write-Host ""