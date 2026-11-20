$code = @'
"use client";

import { useEffect, useState } from "react";

export default function Dashboard() {

  const [profile, setProfile] =
    useState<any>(null);

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

  if (!profile) {
    return (
      <main style={{
        padding:"40px"
      }}>
        No Profile Found
      </main>
    );
  }

  const bmi =
    (
      profile.weight /
      (
        (profile.height / 100) *
        (profile.height / 100)
      )
    ).toFixed(1);

  const bmr =
    Math.round(
      10 * profile.weight +
      6.25 * profile.height -
      5 * profile.age +
      5
    );

  const calories =
    Math.round(
      bmr * 1.55
    );

  const protein =
    Math.round(
      profile.weight * 2.2
    );

  return (
    <main style={{
      padding:"40px"
    }}>

      <h1>
        FitCopilot Dashboard
      </h1>

      <hr />

      <h2>
        {profile.name}
      </h2>

      <p>
        Goal:
        {" "}
        {profile.goal}
      </p>

      <p>
        Activity:
        {" "}
        {profile.activity}
      </p>

      <hr />

      <p>BMI: {bmi}</p>

      <p>BMR: {bmr}</p>

      <p>
        Calories:
        {" "}
        {calories}
      </p>

      <p>
        Protein:
        {" "}
        {protein}g
      </p>

    </main>
  );
}
'@

Set-Content `
app/dashboard/page.tsx `
$code

Write-Host "Dashboard Updated"