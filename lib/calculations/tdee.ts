export function calculateTDEE(
  bmr: number,
  activityLevel: string
) {

  const multipliers = {
    sedentary: 1.2,
    light: 1.375,
    moderate: 1.55,
    active: 1.725,
    athlete: 1.9
  };

  return Math.round(
    bmr *
    (multipliers[
      activityLevel as keyof typeof multipliers
    ] || 1.2)
  );
}
