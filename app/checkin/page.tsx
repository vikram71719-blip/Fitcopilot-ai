"use client";

import { useState } from "react";

export default function CheckInPage() {

  const [weight,setWeight] =
    useState(80);

  const [energy,setEnergy] =
    useState(5);

  const [sleep,setSleep] =
    useState(8);

  const [mood,setMood] =
    useState("Good");

  const [error,setError] =
    useState("");

  function saveCheckIn() {

    setError("");

    if(weight < 30 || weight > 350){

      setError(
        "Weight must be between 30 and 350 kg."
      );

      return;
    }

    if(energy < 1 || energy > 10){

      setError(
        "Energy must be between 1 and 10."
      );

      return;
    }

    if(sleep < 0 || sleep > 24){

      setError(
        "Sleep must be between 0 and 24."
      );

      return;
    }

    const history =
      JSON.parse(
        localStorage.getItem(
          "fitcopilot-checkins"
        ) || "[]"
      );

    history.push({

      weight,
      energy,
      sleep,
      mood,

      date:
        new Date()
        .toLocaleString()

    });

    localStorage.setItem(
      "fitcopilot-checkins",
      JSON.stringify(history)
    );

    alert(
      "Check-In Saved!"
    );
  }

  return (

    <main style={{
      padding:"40px",
      maxWidth:"700px"
    }}>

      <h1>
        Daily Check-In
      </h1>

      {
        error &&
        (
          <div style={{
            color:"red"
          }}>
            {error}
          </div>
        )
      }

      <p>Weight</p>

      <input
        type="number"
        value={weight}
        onChange={(e)=>
          setWeight(
            Number(e.target.value)
          )
        }
      />

      <p>Energy</p>

      <input
        type="number"
        value={energy}
        onChange={(e)=>
          setEnergy(
            Number(e.target.value)
          )
        }
      />

      <p>Sleep</p>

      <input
        type="number"
        value={sleep}
        onChange={(e)=>
          setSleep(
            Number(e.target.value)
          )
        }
      />

      <p>Mood</p>

      <select
        value={mood}
        onChange={(e)=>
          setMood(
            e.target.value
          )
        }
      >
        <option>
          Excellent
        </option>

        <option>
          Good
        </option>

        <option>
          Average
        </option>

        <option>
          Poor
        </option>
      </select>

      <br /><br />

      <button
        onClick={saveCheckIn}
      >
        Save Check-In
      </button>

    </main>
  );
}
