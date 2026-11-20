"use client";

import { useProfileStore }
from "@/store/userStore";

export default function GoalsPage() {

  const update =
    useProfileStore(
      (s) => s.updateProfile
    );

  return (

    <main style={{
      padding:"40px"
    }}>

      <h1>
        Choose Your Goal
      </h1>

      <button
      onClick={() =>
        update({
          goal:"lose-fat"
        })
      }>
        Lose Fat
      </button>

      <br /><br />

      <button
      onClick={() =>
        update({
          goal:"maintain"
        })
      }>
        Maintain
      </button>

      <br /><br />

      <button
      onClick={() =>
        update({
          goal:"gain-muscle"
        })
      }>
        Gain Muscle
      </button>

    </main>

  );
}
