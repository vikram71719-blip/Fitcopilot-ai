"use client";

import { useEffect, useState } from "react";

export default function Dashboard() {

  const [profile, setProfile] =
    useState<any>(null);

  const [checkIn, setCheckIn] =
    useState<any>(null);

  useEffect(() => {

    const savedProfile =
      localStorage.getItem(
        "fitcopilot-profile"
      );

    if (savedProfile) {
      setProfile(
        JSON.parse(savedProfile)
      );
    }

    const savedCheckIn =
      localStorage.getItem(
        "fitcopilot-checkin"
      );

    if (savedCheckIn) {
      setCheckIn(
        JSON.parse(savedCheckIn)
      );
    }

  }, []);

  if (!profile) {
    return (
      <main style={{ padding:"40px" }}>
        Create a profile first.
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

  return (
    <main style={{
      padding:"40px",
      maxWidth:"900px"
    }}>

      <h1>
        FitCopilot Dashboard
      </h1>

      <hr />

      <h2>
        {profile.name}
      </h2>

      <p>
        Goal: {profile.goal}
      </p>

      <p>
        Activity: {profile.activity}
      </p>

      <p>
        BMI: {bmi}
      </p>

      <hr />

      <h2>
        Latest Check-In
      </h2>

      {
        checkIn ? (
          <>
            <p>
              Weight:
              {" "}
              {checkIn.weight} kg
            </p>

            <p>
              Energy:
              {" "}
              {checkIn.energy}/10
            </p>

            <p>
              Sleep:
              {" "}
              {checkIn.sleep} hrs
            </p>

            <p>
              Mood:
              {" "}
              {checkIn.mood}
            </p>
          </>
        )
        :
        (
          <p>
            No check-in found.
          </p>
        )
      }

      <hr />

      <a href="/checkin">
        Daily Check-In
      </a>

    </main>
  );
}
