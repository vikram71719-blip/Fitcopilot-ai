"use client";

import { useProfileStore }
from "@/store/userStore";

export default function ActivityLevel() {

  const update =
    useProfileStore(
      (s) => s.updateProfile
    );

  const levels = [
    "sedentary",
    "light",
    "moderate",
    "active",
    "athlete"
  ];

  return (

    <main style={{
      padding:"40px"
    }}>

      <h1>
        Activity Level
      </h1>

      {levels.map(level => (

        <div key={level}>

          <button
            onClick={() =>
              update({
                activityLevel: level
              })
            }
          >
            {level}
          </button>

          <br /><br />

        </div>

      ))}

    </main>

  );
}
