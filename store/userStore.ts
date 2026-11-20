"use client";

import { create } from "zustand";

interface UserProfile {
  age: number;
  height: number;
  weight: number;
  goal: string;
}

interface ProfileStore {
  profile: UserProfile;

  setProfile: (
    profile: UserProfile
  ) => void;
}

export const useProfileStore =
  create<ProfileStore>((set) => ({
    profile: {
      age: 25,
      height: 180,
      weight: 80,
      goal: "lose-fat",
    },

    setProfile: (profile) =>
      set({ profile }),
  }));
