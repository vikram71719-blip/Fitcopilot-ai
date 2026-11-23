# ==================================================
# FITCOPILOT MULTI PROFILE SYSTEM
# ==================================================

$page = @'
"use client";

import { useEffect,useState }
from "react";

export default function PersonalInfoPage() {

  const [profiles,setProfiles] =
    useState<any[]>([]);

  const [selectedId,setSelectedId] =
    useState("");

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

  useEffect(() => {

    const saved =
      JSON.parse(
        localStorage.getItem(
          "fitcopilot-profiles"
        ) || "[]"
      );

    setProfiles(saved);

    const active =
      localStorage.getItem(
        "fitcopilot-active-profile"
      );

    if(active){

      setSelectedId(active);

      const profile =
        saved.find(
          (p:any)=>
            p.id === active
        );

      if(profile){

        loadProfile(profile);
      }
    }

  }, []);

  function loadProfile(profile:any){

    setName(profile.name);
    setAge(profile.age);
    setHeight(profile.height);
    setWeight(profile.weight);
    setGoal(profile.goal);
    setActivity(
      profile.activity
    );
  }

  function saveProfile(){

    const id =
      selectedId ||
      Date.now().toString();

    const profile = {

      id,

      name,
      age,
      height,
      weight,
      goal,
      activity

    };

    let updated =
      [...profiles];

    const index =
      updated.findIndex(
        p =>
        p.id === id
      );

    if(index >= 0){

      updated[index] =
        profile;

    }
    else{

      updated.push(
        profile
      );

    }

    localStorage.setItem(
      "fitcopilot-profiles",
      JSON.stringify(
        updated
      )
    );

    localStorage.setItem(
      "fitcopilot-active-profile",
      id
    );

    setProfiles(updated);

    setSelectedId(id);

    alert(
      "Profile Saved"
    );
  }

  function newProfile(){

    setSelectedId("");

    setName("");

    setAge(25);

    setHeight(180);

    setWeight(80);

    setGoal("lose-fat");

    setActivity(
      "moderate"
    );
  }

  return (

    <main style={{
      padding:"40px"
    }}>

      <h1>
        Multi Profile Manager
      </h1>

      <hr />

      <h3>
        Profiles
      </h3>

      <select

        value={selectedId}

        onChange={(e)=>{

          const id =
            e.target.value;

          setSelectedId(id);

          localStorage.setItem(
            "fitcopilot-active-profile",
            id
          );

          const profile =
            profiles.find(
              p =>
              p.id === id
            );

          if(profile){

            loadProfile(
              profile
            );
          }

        }}

      >

        <option value="">
          Select Profile
        </option>

        {
          profiles.map(
            (p)=>(
              <option
                key={p.id}
                value={p.id}
              >
                {p.name}
              </option>
            )
          )
        }

      </select>

      <button
        onClick={
          newProfile
        }
      >
        New Profile
      </button>

      <hr />

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
            Number(
              e.target.value
            )
          )
        }
      />

      <p>Height</p>

      <input
        type="number"
        value={height}
        onChange={(e)=>
          setHeight(
            Number(
              e.target.value
            )
          )
        }
      />

      <p>Weight</p>

      <input
        type="number"
        value={weight}
        onChange={(e)=>
          setWeight(
            Number(
              e.target.value
            )
          )
        }
      />

      <br />
      <br />

      <button
        onClick={
          saveProfile
        }
      >
        Save Profile
      </button>

    </main>

  );
}
'@

Set-Content `
app/onboarding/personal-info/page.tsx `
$page

Write-Host ""
Write-Host "================================="
Write-Host "MULTI PROFILE SYSTEM INSTALLED"
Write-Host "================================="
Write-Host ""