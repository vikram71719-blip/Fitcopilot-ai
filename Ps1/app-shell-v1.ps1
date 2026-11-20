# =================================================
# FITCOPILOT APP SHELL V1
# Global Navigation + Modern Layout
# =================================================

New-Item `
-ItemType Directory `
-Force `
components\layout | Out-Null

$navbar = @'
export default function Navbar() {
  return (
    <nav
      style={{
        display: "flex",
        gap: "12px",
        padding: "16px",
        background: "#111827",
        borderRadius: "12px",
        marginBottom: "24px",
        flexWrap: "wrap"
      }}
    >
      <a href="/dashboard" style={{color:"#fff"}}>
        Dashboard
      </a>

      <a href="/onboarding/personal-info" style={{color:"#fff"}}>
        Profile
      </a>

      <a href="/checkin" style={{color:"#fff"}}>
        Check-In
      </a>

      <a href="/nutrition" style={{color:"#fff"}}>
        Nutrition
      </a>

      <a href="/workouts" style={{color:"#fff"}}>
        Workouts
      </a>

      <a href="/coach" style={{color:"#fff"}}>
        AI Coach
      </a>

      <a href="/" style={{color:"#fff"}}>
        Home
      </a>
    </nav>
  );
}
'@

Set-Content `
components/layout/Navbar.tsx `
$navbar

$layout = @'
import "./globals.css";

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body
        style={{
          background:"#f3f4f6",
          margin:0,
          fontFamily:"Arial, sans-serif"
        }}
      >
        {children}
      </body>
    </html>
  );
}
'@

Set-Content `
app/layout.tsx `
$layout

Write-Host ""
Write-Host "================================"
Write-Host "APP SHELL INSTALLED"
Write-Host "================================"
Write-Host ""
Write-Host "Next Step:"
Write-Host "Import Navbar into pages."
Write-Host ""