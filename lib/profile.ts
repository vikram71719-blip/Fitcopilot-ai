export function getProfiles() {

  if (
    typeof window ===
    "undefined"
  ) {
    return [];
  }

  return JSON.parse(
    localStorage.getItem(
      "fitcopilot-profiles"
    ) || "[]"
  );
}

export function saveProfiles(
  profiles:any[]
) {

  localStorage.setItem(
    "fitcopilot-profiles",
    JSON.stringify(
      profiles
    )
  );
}

export function getActiveProfileId() {

  if (
    typeof window ===
    "undefined"
  ) {
    return null;
  }

  return localStorage.getItem(
    "fitcopilot-active-profile"
  );
}

export function setActiveProfile(
  id:string
) {

  localStorage.setItem(
    "fitcopilot-active-profile",
    id
  );
}

export function getActiveProfile() {

  if (
    typeof window ===
    "undefined"
  ) {
    return null;
  }

  const id =
    getActiveProfileId();

  const profiles =
    getProfiles();

  return (
    profiles.find(
      (p:any)=>
        p.id === id
    ) || null
  );
}
