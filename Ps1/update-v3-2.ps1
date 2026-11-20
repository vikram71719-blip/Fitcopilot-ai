$dashboard = @'
"use client";

import { useEffect, useState } from "react";

export default function Dashboard() {

  const [profile, setProfile] =
    useState({
      name: "",
      age: 25,
      height: 180,
      weight: 80
    });

  useEffect(() => {

    const saved =
      localStorage.getItem(
        "fitcopilot-profile"
      );

    if (saved) {
      setProfile(
        JSON.parse(saved)
      );
    }

  }, []);

  const bmi =
    (
      profile.weight /
      (
        (profile.height / 100) *
        (profile.height / 100)
      )
    ).toFixed(1);

  const protein =
    Math.round(
      profile.weight * 2.2
    );

  return (
    <main
      style={{
        padding: "40px",
        fontFamily: "Arial",
        maxWidth: "900px"
      }}
    >
      <h1>FitCopilot Dashboard</h1>

      <hr />

      <h2>Profile</h2>

      <p>Name: {profile.name}</p>
      <p>Age: {profile.age}</p>
      <p>Height: {profile.height} cm</p>
      <p>Weight: {profile.weight} kg</p>

      <hr />

      <h2>Fitness Stats</h2>

      <p>BMI: {bmi}</p>

      <p>
        Protein Target:
        {" "}
        {protein}g
      </p>

      <hr />

      <a href="/onboarding/personal-info">
        Update Profile
      </a>
    </main>
  );
}
'@

Set-Content `
app/dashboard/page.tsx `
$dashboard

Write-Host ""
Write-Host "✅ V3.2 Installed"
Write-Host ""