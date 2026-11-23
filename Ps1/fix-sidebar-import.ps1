# ==========================================
# FIX SIDEBAR + IMPORT
# ==========================================

New-Item `
-ItemType Directory `
-Force `
components\layout | Out-Null

$sidebar = @'
export default function Sidebar() {
  return (
    <aside
      style={{
        width: "240px",
        background: "#111827",
        color: "white",
        padding: "20px",
        minHeight: "100vh"
      }}
    >
      <h2>FitCopilot</h2>

      <hr />

      <div
        style={{
          display: "flex",
          flexDirection: "column",
          gap: "12px"
        }}
      >
        <a href="/dashboard" style={{ color: "white" }}>
          Dashboard
        </a>

        <a href="/onboarding/personal-info" style={{ color: "white" }}>
          Profile
        </a>

        <a href="/checkin" style={{ color: "white" }}>
          Check-In
        </a>

        <a href="/nutrition" style={{ color: "white" }}>
          Nutrition
        </a>

        <a href="/workouts" style={{ color: "white" }}>
          Workouts
        </a>

        <a href="/coach" style={{ color: "white" }}>
          AI Coach
        </a>

        <a href="/" style={{ color: "white" }}>
          Home
        </a>
      </div>
    </aside>
  );
}
'@

Set-Content `
components/layout/Sidebar.tsx `
$sidebar


$layout = @'
import "./globals.css";
import Sidebar from "../components/layout/Sidebar";

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>
        <div
          style={{
            display: "flex"
          }}
        >
          <Sidebar />

          <main
            style={{
              flex: 1,
              padding: "20px"
            }}
          >
            {children}
          </main>
        </div>
      </body>
    </html>
  );
}
'@

Set-Content `
app/layout.tsx `
$layout

Write-Host ""
Write-Host "✅ Sidebar fixed"
Write-Host "✅ Import fixed"
Write-Host ""
Write-Host "Next:"
Write-Host "rmdir /s /q .next"
Write-Host "npm run build"
Write-Host ""