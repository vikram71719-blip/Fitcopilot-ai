export function calculateBMR(
  weightKg: number,
  heightCm: number,
  age: number,
  gender: string
) {

  if (gender === "female") {
    return (
      10 * weightKg +
      6.25 * heightCm -
      5 * age -
      161
    );
  }

  return (
    10 * weightKg +
    6.25 * heightCm -
    5 * age +
    5
  );
}
