export function calculateBMI(
  weightKg: number,
  heightCm: number
) {
  const heightM = heightCm / 100;

  return Number(
    (weightKg / (heightM * heightM))
    .toFixed(1)
  );
}
