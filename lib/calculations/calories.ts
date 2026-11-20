export function goalCalories(
  tdee: number,
  goal: string
) {

  switch (goal) {

    case "lose-fat":
      return tdee - 500;

    case "gain-muscle":
      return tdee + 300;

    default:
      return tdee;
  }
}
