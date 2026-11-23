# ==================================================
# FITCOPILOT AI COACH V1
# OLLAMA + PHI3
# ==================================================

New-Item `
-ItemType Directory `
-Force `
app\api\coach | Out-Null

# API ROUTE

$api = @'
export async function POST(req: Request) {

  const body =
    await req.json();

  const prompt =
    body.prompt;

  const profile =
    body.profile;

  const finalPrompt = `
You are FitCopilot AI.

User Profile:

Name: ${profile.name}
Age: ${profile.age}
Height: ${profile.height} cm
Weight: ${profile.weight} kg
Goal: ${profile.goal}
Activity: ${profile.activity}

Give fitness advice that is:
- Practical
- Safe
- Specific
- Goal focused

Question:
${prompt}
`;

  const response =
    await fetch(
      "http://localhost:11434/api/generate",
      {
        method: "POST",
        headers: {
          "Content-Type":
            "application/json",
        },
        body: JSON.stringify({
          model: "phi3",
          prompt: finalPrompt,
          stream: false
        })
      }
    );

  const data =
    await response.json();

  return Response.json({
    answer:
      data.response
  });
}
'@

Set-Content `
app/api/coach/route.ts `
$api


# COACH PAGE

$coach = @'
"use client";

import { useState } from "react";

export default function CoachPage() {

  const [question, setQuestion] =
    useState("");

  const [answer, setAnswer] =
    useState("");

  const [loading, setLoading] =
    useState(false);

  async function askCoach() {

    setLoading(true);

    const profile =
      JSON.parse(
        localStorage.getItem(
          "fitcopilot-profile"
        ) || "{}"
      );

    const response =
      await fetch(
        "/api/coach",
        {
          method:"POST",

          headers:{
            "Content-Type":
            "application/json"
          },

          body:JSON.stringify({
            prompt: question,
            profile
          })
        }
      );

    const data =
      await response.json();

    setAnswer(
      data.answer
    );

    setLoading(false);
  }

  return (

    <main
      style={{
        padding:"40px",
        maxWidth:"900px"
      }}
    >

      <h1>
        FitCopilot AI Coach
      </h1>

      <p>
        Ask anything about fat loss,
        nutrition, workouts or recovery.
      </p>

      <textarea

        value={question}

        onChange={(e)=>
          setQuestion(
            e.target.value
          )
        }

        rows={6}

        style={{
          width:"100%"
        }}
      />

      <br /><br />

      <button
        onClick={askCoach}
      >
        Ask Coach
      </button>

      <hr />

      {
        loading &&
        <p>
          Thinking...
        </p>
      }

      {
        answer &&
        (
          <div
            style={{
              whiteSpace:"pre-wrap"
            }}
          >
            {answer}
          </div>
        )
      }

    </main>

  );
}
'@

Set-Content `
app/coach/page.tsx `
$coach

Write-Host ""
Write-Host "================================"
Write-Host "AI COACH INSTALLED"
Write-Host "================================"
Write-Host ""
Write-Host "Run:"
Write-Host "ollama run phi3"
Write-Host ""
Write-Host "Then:"
Write-Host "npm run dev"
Write-Host ""