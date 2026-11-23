# ==================================================
# FITCOPILOT AI COACH FIX V1
# ==================================================

Write-Host ""
Write-Host "Fixing AI Coach..."
Write-Host ""

# ==========================================
# API ROUTE
# ==========================================

New-Item `
-ItemType Directory `
-Force `
app\api\coach | Out-Null

$api = @'
export async function POST(
  req: Request
) {

  try {

    const body =
      await req.json();

    const prompt =
      body.prompt || "";

    const profile =
      body.profile || {};

    const finalPrompt = `
You are FitCopilot AI.

User:

Name:
${profile.name || "Unknown"}

Age:
${profile.age || "Unknown"}

Height:
${profile.height || "Unknown"}

Weight:
${profile.weight || "Unknown"}

Goal:
${profile.goal || "Unknown"}

Activity:
${profile.activity || "Unknown"}

Question:

${prompt}

Provide practical fitness advice.
`;

    const response =
      await fetch(
        "http://127.0.0.1:11434/api/generate",
        {
          method:"POST",

          headers:{
            "Content-Type":
              "application/json"
          },

          body:JSON.stringify({

            model:"phi3",

            prompt:finalPrompt,

            stream:false

          })
        }
      );

    if(!response.ok){

      return Response.json({
        answer:
          "Unable to reach Ollama."
      });

    }

    const data =
      await response.json();

    return Response.json({

      answer:
        data.response ||
        "No response."

    });

  }
  catch(error){

    console.error(error);

    return Response.json({

      answer:
        "Ollama is not running. Start ollama serve."

    });

  }

}
'@

Set-Content `
app/api/coach/route.ts `
$api

# ==========================================
# COACH PAGE
# ==========================================

$coach = @'
"use client";

import { useState } from "react";

export default function CoachPage() {

  const [question,setQuestion] =
    useState("");

  const [answer,setAnswer] =
    useState("");

  const [loading,setLoading] =
    useState(false);

  async function askCoach() {

    try {

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
              prompt:question,
              profile
            })
          }
        );

      if(!response.ok){

        throw new Error();

      }

      const text =
        await response.text();

      if(!text){

        throw new Error();

      }

      const data =
        JSON.parse(text);

      setAnswer(
        data.answer
      );

    }
    catch{

      setAnswer(
`AI Coach unavailable.

1. Run:

ollama serve

2. Install Phi3:

ollama pull phi3

3. Refresh page`
      );

    }
    finally{

      setLoading(false);

    }

  }

  return (

    <main style={{
      padding:"40px",
      maxWidth:"900px"
    }}>

      <h1>
        FitCopilot AI Coach
      </h1>

      <textarea

        rows={6}

        value={question}

        onChange={(e)=>
          setQuestion(
            e.target.value
          )
        }

        style={{
          width:"100%"
        }}

      />

      <br />
      <br />

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
          <pre style={{
            whiteSpace:"pre-wrap"
          }}>
            {answer}
          </pre>
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
Write-Host "================================="
Write-Host "AI COACH FIX INSTALLED"
Write-Host "================================="
Write-Host ""
Write-Host "NEXT:"
Write-Host ""
Write-Host "ollama pull phi3"
Write-Host "ollama serve"
Write-Host ""
Write-Host "npm run build"
Write-Host ""