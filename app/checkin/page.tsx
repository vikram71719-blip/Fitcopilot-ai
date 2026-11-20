"use client";

import { useEffect, useState } from "react";

export default function CheckInPage() {

  const [weight, setWeight] =
    useState(80);

  const [energy, setEnergy] =
    useState(5);

  const [sleep, setSleep] =
    useState(8);

  const [mood, setMood] =
    useState("Good");

  function saveCheckIn() {

    const checkIn = {
      date:
        new Date()
        .toISOString(),

      weight,
      energy,
      sleep,
      mood
    };

    localStorage.setItem(
      "fitcopilot-checkin",
      JSON.stringify(checkIn)
    );

    alert(
      "Check-In Saved!"
    );
  }

  useEffect(() => {

    const saved =
      localStorage.getItem(
        "fitcopilot-checkin"
      );

    if(saved){

      const checkin =
        JSON.parse(saved);

      setWeight(
        checkin.weight
      );

      setEnergy(
        checkin.energy
      );

      setSleep(
        checkin.sleep
      );

      setMood(
        checkin.mood
      );
    }

  }, []);

  return (
    <main style={{
      padding:"40px",
      maxWidth:"700px"
    }}>

      <h1>
        Daily Check-In
      </h1>

      <p>Weight (kg)</p>

      <input
        type="number"
        value={weight}
        onChange={(e)=>
          setWeight(
            Number(e.target.value)
          )
        }
      />

      <p>
        Energy (1-10)
      </p>

      <input
        type="number"
        value={energy}
        onChange={(e)=>
          setEnergy(
            Number(e.target.value)
          )
        }
      />

      <p>Sleep Hours</p>

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
