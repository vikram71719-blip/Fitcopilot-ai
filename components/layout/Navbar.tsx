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
