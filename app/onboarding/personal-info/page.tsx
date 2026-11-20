"use client";

import { useEffect, useState } from "react";

export default function PersonalInfoPage() {

  const [name, setName] = useState("");
  const [age, setAge] = useState(25);
  const [height, setHeight] = useState(180);
  const [weight, setWeight] = useState(80);

  const [goal, setGoal] =
    useState("lose-fat");

  const [activity, setActivity] =
    useState("moderate");

  useEffect(() => {

    const saved =
      localStorage.getItem(
        "fitcopilot-profile"
      );

    if (saved) {

      const p =
        JSON.parse(saved);

      setName(p.name || "");
      setAge(p.age || 25);
      setHeight(p.height || 180);
      setWeight(p.weight || 80);
      setGoal(p.goal || "lose-fat");
      setActivity(
        p.activity || "moderate"
      );
    }

  }, []);

  function saveProfile() {

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

    alert("Profile Saved");
  }

  return (
    <main style={{
      padding:"40px",
      maxWidth:"600px"
    }}>

      <h1>
        Profile Setup
      </h1>

      <p>Name</p>

      <input
        value={name}
        onChange={(e)=>
          setName(e.target.value)
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

      <p>Height</p>

      <input
        type="number"
        value={height}
        onChange={(e)=>
          setHeight(
            Number(e.target.value)
          )
        }
      />

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

      <p>Goal</p>

      <select
        value={goal}
        onChange={(e)=>
          setGoal(
            e.target.value
          )
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
