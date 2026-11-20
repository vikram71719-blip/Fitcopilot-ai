export default function Home() {
  return (
    <main style={{
      padding: "40px",
      fontFamily: "Arial"
    }}>
      <h1>FitCopilot AI</h1>

      <p>
        Your personal AI fitness coach.
      </p>

      <hr />

      <ul>
        <li>
          <a href="/dashboard">
            Dashboard
          </a>
        </li>

        <li>
          <a href="/onboarding/personal-info">
            Personal Information
          </a>
        </li>

        <li>
          <a href="/coach">
            AI Coach
          </a>
        </li>
      </ul>
    </main>
  );
}
