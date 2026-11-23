# ==================================================
# FITCOPILOT V5.3 PROGRESS ANALYTICS
# ==================================================

$progress = @'
"use client";

import { useEffect, useState } from "react";

export default function ProgressPage() {

  const [checkins,setCheckins] =
    useState<any[]>([]);

  useEffect(() => {

    const saved =
      localStorage.getItem(
        "fitcopilot-checkins"
      );

    if(saved){

      setCheckins(
        JSON.parse(saved)
      );
    }

  }, []);

  if(checkins.length < 1){

    return (
      <main style={{
        padding:"40px"
      }}>
        <h1>
          Progress
        </h1>

        <p>
          No check-ins available.
        </p>
      </main>
    );
  }

  const first =
    checkins[0];

  const latest =
    checkins[
      checkins.length - 1
    ];

  const startWeight =
    first.weight;

  const currentWeight =
    latest.weight;

  const weightLost =
    (
      startWeight -
      currentWeight
    ).toFixed(1);

  const targetWeight =
    Math.max(
      startWeight - 10,
      30
    );

  const remaining =
    (
      currentWeight -
      targetWeight
    ).toFixed(1);

  const totalDays =
    Math.max(
      checkins.length,
      1
    );

  const weeklyRate =
    (
      Number(weightLost) /
      totalDays
    ) * 7;

  const weeksRemaining =
    weeklyRate > 0
      ? (
          Number(
            remaining
          ) /
          weeklyRate
        ).toFixed(1)
      : "N/A";

  return (

    <main
      style={{
        padding:"40px",
        maxWidth:"1000px"
      }}
    >

      <h1>
        Progress Analytics
      </h1>

      <hr />

      <h2>
        Summary
      </h2>

      <p>
        Starting Weight:
        {" "}
        {startWeight} kg
      </p>

      <p>
        Current Weight:
        {" "}
        {currentWeight} kg
      </p>

      <p>
        Weight Lost:
        {" "}
        {weightLost} kg
      </p>

      <p>
        Target Weight:
        {" "}
        {targetWeight} kg
      </p>

      <p>
        Remaining:
        {" "}
        {remaining} kg
      </p>

      <hr />

      <h2>
        Goal Projection
      </h2>

      <p>
        Weekly Rate:
        {" "}
        {weeklyRate.toFixed(2)}
        {" "}
        kg/week
      </p>

      <p>
        Estimated Weeks Left:
        {" "}
        {weeksRemaining}
      </p>

      <hr />

      <h2>
        Weight Timeline
      </h2>

      {
        checkins.map(
          (
            item,
            index
          ) => (

            <div
              key={index}
              style={{
                padding:"12px",
                border:"1px solid #ddd",
                marginBottom:"10px"
              }}
            >

              <strong>
                Entry
                {" "}
                {index + 1}
              </strong>

              <p>
                Weight:
                {" "}
                {item.weight} kg
              </p>

              <p>
                Energy:
                {" "}
                {item.energy}/10
              </p>

              <p>
                Sleep:
                {" "}
                {item.sleep}
                {" "}
                hrs
              </p>

              <p>
                Mood:
                {" "}
                {item.mood}
              </p>

              <p>
                Date:
                {" "}
                {item.date}
              </p>

            </div>

          )
        )
      }

    </main>

  );
}
'@

Set-Content `
app/progress/page.tsx `
$progress

Write-Host ""
Write-Host "================================="
Write-Host "V5.3 ANALYTICS INSTALLED"
Write-Host "================================="
Write-Host ""
Write-Host "Route:"
Write-Host "/progress"
Write-Host ""
Write-Host "New Features:"
Write-Host "- Weight Lost"
Write-Host "- Goal Weight"
Write-Host "- Weekly Rate"
Write-Host "- ETA"
Write-Host "- Timeline"
Write-Host ""