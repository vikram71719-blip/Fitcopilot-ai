# ==================================================
# FITCOPILOT V5.5 PROFILE CORE
# ==================================================

New-Item `
-ItemType Directory `
-Force `
lib | Out-Null

$profile = @'
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
'@

Set-Content `
lib/profile.ts `
$profile

Write-Host ""
Write-Host "================================"
Write-Host "PROFILE CORE INSTALLED"
Write-Host "================================"
Write-Host ""
Write-Host "Created:"
Write-Host "lib/profile.ts"
Write-Host ""
Write-Host "Functions:"
Write-Host "- getProfiles()"
Write-Host "- saveProfiles()"
Write-Host "- getActiveProfile()"
Write-Host "- setActiveProfile()"
Write-Host ""