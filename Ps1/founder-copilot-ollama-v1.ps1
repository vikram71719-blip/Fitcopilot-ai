# ====================================================
# FITCOPILOT FOUNDER COPILOT + OLLAMA
# ====================================================

New-Item -ItemType Directory -Force app\api\founder-copilot | Out-Null
New-Item -ItemType Directory -Force app\admin\copilot | Out-Null

# ====================================================
# API ROUTE
# ====================================================

$api = @'
export async function POST(req: Request) {

  const body =
    await req.json();

  const question =
    body.question;

  const prompt = `

You are Founder Copilot.

You are helping build FitCopilot AI.

Current Status:

- Next.js 16
- Dashboard V5
- Profile Setup
- Check-In System
- Local Storage
- Workout Page
- Nutrition Page
- Coach Page
- GitHub Connected
- Build Passing

Current Priority:
1. Validation
2. Progress Tracking
3. Workout Generator
4. Nutrition Planner
5. AI Coach

Your job:

- Analyze product decisions
- Suggest improvements
- Prioritize features
- Identify bugs
- Recommend architecture
- Help design user experience

Founder Question:

${question}

`;

  try {

    const response =
      await fetch(
        "http://localhost:11434/api/generate",
        {
          method: "POST",

          headers: {
            "Content-Type":
              "application/json"
          },

          body: JSON.stringify({
            model: "phi3",
            prompt,
            stream: false
          })
        }
      );

    const data =
      await response.json();

    return Response.json({
      success: true,
      answer: data.response
    });

  } catch {

    return Response.json({
      success: false,
      answer:
        "Ollama is not running. Start 'ollama serve' first."
    });

  }

}
'@

Set-Content `
app/api/founder-copilot/route.ts `
$api

# ====================================================
# ADMIN COPILOT PAGE
# ====================================================

$page = @'
"use client";

import { useState } from "react";

export default function FounderCopilot() {

  const [question,setQuestion] =
    useState("");

  const [answer,setAnswer] =
    useState("");

  const [loading,setLoading] =
    useState(false);

  async function askCopilot() {

    setLoading(true);

    const response =
      await fetch(
        "/api/founder-copilot",
        {
          method:"POST",

          headers:{
            "Content-Type":
            "application/json"
          },

          body:JSON.stringify({
            question
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
        maxWidth:"1000px",
        margin:"0 auto"
      }}
    >

      <h1>
        Founder Copilot
      </h1>

      <p>
        Your internal product and development AI.
      </p>

      <hr />

      <div
        style={{
          display:"flex",
          gap:"10px",
          flexWrap:"wrap"
        }}
      >
        <button
          onClick={()=>
            setQuestion(
              "Analyze FitCopilot and tell me what to build next."
            )
          }
        >
          Product Audit
        </button>

        <button
          onClick={()=>
            setQuestion(
              "Review the dashboard UX."
            )
          }
        >
          UI Audit
        </button>

        <button
          onClick={()=>
            setQuestion(
              "Find weaknesses in the app architecture."
            )
          }
        >
          Architecture Review
        </button>

        <button
          onClick={()=>
            setQuestion(
              "Generate the next product roadmap."
            )
          }
        >
          Roadmap
        </button>
      </div>

      <br />

      <textarea

        rows={8}

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

      <br /><br />

      <button
        onClick={askCopilot}
      >
        Ask Founder Copilot
      </button>

      <hr />

      {
        loading &&
        <p>Thinking...</p>
      }

      {
        answer &&
        (
          <pre
            style={{
              whiteSpace:"pre-wrap"
            }}
          >
            {answer}
          </pre>
        )
      }

    </main>

  );
}
'@

Set-Content `
app/admin/copilot/page.tsx `
$page

Write-Host ""
Write-Host "===================================="
Write-Host "FOUNDER COPILOT INSTALLED"
Write-Host "===================================="
Write-Host ""
Write-Host "Start Ollama:"
Write-Host "ollama serve"
Write-Host ""
Write-Host "Pull Model:"
Write-Host "ollama pull phi3"
Write-Host ""
Write-Host "Open:"
Write-Host "http://localhost:3000/admin/copilot"
Write-Host ""
