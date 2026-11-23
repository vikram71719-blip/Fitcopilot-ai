"use client";

import { useEffect, useState


 } from "react";

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
      <main style={{
        padding:"40px"
      }}>
        <h1>
          FitCopilot Dashboard
        </h1>

        <p>
          No profile found.
        </p>

        <a href="/onboarding/personal-info">
          Create Profile
        </a>
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

  let activityMultiplier = 1.2;

  switch(profile.activity) {

    case "light":
      activityMultiplier = 1.375;
      break;

    case "moderate":
      activityMultiplier = 1.55;
      break;

    case "active":
      activityMultiplier = 1.725;
      break;

    default:
      activityMultiplier = 1.2;
  }

  const maintenanceCalories =
    Math.round(
      bmr * activityMultiplier
    );

  const fatLossCalories =
    maintenanceCalories - 500;

  const protein =
    Math.round(
      profile.weight * 2.2
    );

  const carbs =
    Math.round(
      maintenanceCalories * 0.4 / 4
    );

  const fats =
    Math.round(
      maintenanceCalories * 0.25 / 9
    );

  const water =
    (
      profile.weight * 35 / 1000
    ).toFixed(1);

  const targetWeight =
    Math.max(
      profile.weight - 8,
      30
    );

  const remainingWeight =
    (
      profile.weight -
      targetWeight
    ).toFixed(1);

  return (

    <main style={{
      padding:"40px",
      maxWidth:"1000px",
      margin:"0 auto",
      fontFamily:"Arial"
    }}>

      <h1>
        FitCopilot Dashboard
      </h1>

      <hr />

      <h2>
        Profile
      </h2>

      <p>Name: {profile.name}</p>

      <p>Age: {profile.age}</p>

      <p>Height: {profile.height} cm</p>

      <p>Weight: {profile.weight} kg</p>

      <p>Goal: {profile.goal}</p>

      <p>Activity: {profile.activity}</p>

      <hr />

      <h2>
        Fitness Metrics
      </h2>

      <p>BMI: {bmi}</p>

      <p>BMR: {bmr}</p>

      <p>
        Maintenance Calories:
        {" "}
        {maintenanceCalories}
      </p>

      <p>
        Fat Loss Calories:
        {" "}
        {fatLossCalories}
      </p>

      <p>
        Protein Target:
        {" "}
        {protein}g
      </p>

      <hr />

      <h2>
        Nutrition Targets
      </h2>

      <p>
        Calories:
        {" "}
        {maintenanceCalories}
      </p>

      <p>
        Protein:
        {" "}
        {protein}g
      </p>

      <p>
        Carbs:
        {" "}
        {carbs}g
      </p>

      <p>
        Fat:
        {" "}
        {fats}g
      </p>

      <p>
        Water:
        {" "}
        {water}L
      </p>

      <hr />

      <h2>
        Progress
      </h2>

      <p>
        Current Weight:
        {" "}
        {profile.weight} kg
      </p>

      <p>
        Target Weight:
        {" "}
        {targetWeight} kg
      </p>

      <p>
        Remaining:
        {" "}
        {remainingWeight} kg
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

        ) : (

          <p>
            No Check-In Found
          </p>

        )
      }

      <hr />

      <h2>
        Quick Actions
      </h2>

      <div style={{
        display:"flex",
        gap:"10px",
        flexWrap:"wrap"
      }}>

        <a href="/onboarding/personal-info">
          <button>
            Edit Profile
          </button>
        </a>

        <a href="/checkin">
          <button>
            Daily Check-In
          </button>
        </a>

        <a href="/nutrition">
          <button>
            Nutrition
          </button>
        </a>

        <a href="/workouts">
          <button>
            Workouts
          </button>
        </a>

        <a href="/coach">
          <button>
            AI Coach
          </button>
        </a>

      </div>

    </main>
  );
}
