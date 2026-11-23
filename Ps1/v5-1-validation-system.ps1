# ==================================================
# FITCOPILOT V5.1 VALIDATION SYSTEM
# ==================================================

Write-Host ""
Write-Host "Installing Validation System..."
Write-Host ""

# ==================================================
# PROFILE PAGE
# ==================================================

$profile = @'
"use client";

import { useEffect, useState } from "react";

export default function PersonalInfoPage() {

  const [name,setName] =
    useState("");

  const [age,setAge] =
    useState(25);

  const [height,setHeight] =
    useState(180);

  const [weight,setWeight] =
    useState(80);

  const [goal,setGoal] =
    useState("lose-fat");

  const [activity,setActivity] =
    useState("moderate");

  const [error,setError] =
    useState("");

  useEffect(() => {

    const saved =
      localStorage.getItem(
        "fitcopilot-profile"
      );

    if(saved){

      const profile =
        JSON.parse(saved);

      setName(profile.name || "");
      setAge(profile.age || 25);
      setHeight(profile.height || 180);
      setWeight(profile.weight || 80);
      setGoal(profile.goal || "lose-fat");
      setActivity(
        profile.activity ||
        "moderate"
      );
    }

  }, []);

  function saveProfile() {

    setError("");

    if(age < 13 || age > 100){

      setError(
        "Age must be between 13 and 100."
      );

      return;
    }

    if(height < 100 || height > 250){

      setError(
        "Height must be between 100 and 250 cm."
      );

      return;
    }

    if(weight < 30 || weight > 350){

      setError(
        "Weight must be between 30 and 350 kg."
      );

      return;
    }

    localStorage.setItem(
      "fitcopilot-profile",
      JSON.stringify({
        name,
        age,
        height,
        weight,
        goal,
        activity
      })
    );

    alert(
      "Profile Saved!"
    );
  }

  return (

    <main style={{
      padding:"40px",
      maxWidth:"700px"
    }}>

      <h1>
        Profile Setup
      </h1>

      {
        error &&
        (
          <div style={{
            color:"red",
            marginBottom:"20px"
          }}>
            {error}
          </div>
        )
      }

      <p>Name</p>

      <input
        value={name}
        onChange={(e)=>
          setName(
            e.target.value
          )
        }
      />

      <p>Age</p>

      <input
        type="number"
        value={age}
        onChange={(e)=>
          setAge(
            Number(e.target.value)
          )
        }
      />

      <p>Height (cm)</p>

      <input
        type="number"
        value={height}
        onChange={(e)=>
          setHeight(
            Number(e.target.value)
          )
        }
      />

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

      <p>Goal</p>

      <select
        value={goal}
        onChange={(e)=>
          setGoal(e.target.value)
        }
      >
        <option value="lose-fat">
          Lose Fat
        </option>

        <option value="maintain">
          Maintain
        </option>

        <option value="gain-muscle">
          Gain Muscle
        </option>
      </select>

      <p>Activity Level</p>

      <select
        value={activity}
        onChange={(e)=>
          setActivity(
            e.target.value
          )
        }
      >
        <option value="sedentary">
          Sedentary
        </option>

        <option value="light">
          Light
        </option>

        <option value="moderate">
          Moderate
        </option>

        <option value="active">
          Active
        </option>
      </select>

      <br /><br />

      <button
        onClick={saveProfile}
      >
        Save Profile
      </button>

    </main>
  );
}
'@

Set-Content `
app/onboarding/personal-info/page.tsx `
$profile

# ==================================================
# CHECKIN PAGE
# ==================================================

$checkin = @'
"use client";

import { useEffect, useState } from "react";

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

  useEffect(() => {

    const saved =
      localStorage.getItem(
        "fitcopilot-checkin"
      );

    if(saved){

      const checkin =
        JSON.parse(saved);

      setWeight(
        checkin.weight || 80
      );

      setEnergy(
        checkin.energy || 5
      );

      setSleep(
        checkin.sleep || 8
      );

      setMood(
        checkin.mood || "Good"
      );
    }

  }, []);

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
        "Sleep must be between 0 and 24 hours."
      );

      return;
    }

    localStorage.setItem(
      "fitcopilot-checkin",
      JSON.stringify({
        weight,
        energy,
        sleep,
        mood,
        date:
          new Date()
          .toISOString()
      })
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
            color:"red",
            marginBottom:"20px"
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
'@

Set-Content `
app/checkin/page.tsx `
$checkin

Write-Host ""
Write-Host "================================="
Write-Host "V5.1 VALIDATION INSTALLED"
Write-Host "================================="
Write-Host ""
Write-Host "Test:"
Write-Host ""
Write-Host "Weight = -500"
Write-Host "Height = 0"
Write-Host "Energy = 999"
Write-Host "Sleep = 100"
Write-Host ""
Write-Host "Should now be blocked."
Write-Host ""