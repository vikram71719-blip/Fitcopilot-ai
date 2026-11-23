"use client";

import { useState } from "react";

const agents = [
  "Product Manager",
  "UI/UX Expert",
  "Fitness Expert",
  "Nutrition Expert",
  "Code Reviewer",
  "Growth Advisor"
];

export default function AdminCopilotPage() {

  const [agent, setAgent] =
    useState("Product Manager");

  const [question, setQuestion] =
    useState("");

  const [response, setResponse] =
    useState("");

  function runAgent() {

    const q =
      question.toLowerCase();

    if (agent === "Product Manager") {

      setResponse(
`Recommended Priorities

1. Add validation system
2. Improve dashboard UI
3. Create progress tracking
4. Build workout generator
5. Build nutrition planner
6. Integrate AI coach

Current bottleneck:
Users can enter invalid data.`
      );

      return;
    }

    if (agent === "UI/UX Expert") {

      setResponse(
`Dashboard Improvements

• KPI cards
• Sidebar navigation
• Dark mode
• Progress charts
• Goal progress ring
• Mobile responsive layout

Focus on reducing text-heavy screens.`
      );

      return;
    }

    if (agent === "Fitness Expert") {

      setResponse(
`Fitness Recommendations

• Add target weight tracking
• Add weekly progress
• Add body measurements
• Add calorie deficit tracking
• Add step goals

Primary goal should drive dashboard recommendations.`
      );

      return;
    }

    if (agent === "Nutrition Expert") {

      setResponse(
`Nutrition Improvements

• Macro calculator
• Meal suggestions
• Recipe generator
• Grocery list
• Water tracking

Add meal planning before AI recipes.`
      );

      return;
    }

    if (agent === "Code Reviewer") {

      setResponse(
`Code Review

• Add input validation
• Reduce duplicated calculations
• Move calculations to utilities
• Add loading states
• Add error handling
• Add TypeScript interfaces`
      );

      return;
    }

    if (agent === "Growth Advisor") {

      setResponse(
`Growth Suggestions

• Progress screenshots
• Share achievements
• SEO articles
• TikTok short clips
• YouTube fitness content

Focus on user retention before monetization.`
      );

      return;
    }
  }

  return (

    <main
      style={{
        padding:"40px",
        maxWidth:"1000px"
      }}
    >

      <h1>
        FitCopilot Founder Copilot
      </h1>

      <p>
        Internal AI assistant for improving the app.
      </p>

      <hr />

      <p>
        Select Agent
      </p>

      <select
        value={agent}
        onChange={(e)=>
          setAgent(
            e.target.value
          )
        }
      >
        {
          agents.map((a)=>(
            <option key={a}>
              {a}
            </option>
          ))
        }
      </select>

      <br />
      <br />

      <p>
        Question
      </p>

      <textarea
        rows={5}
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
        onClick={runAgent}
      >
        Run Agent
      </button>

      <hr />

      <pre
        style={{
          whiteSpace:"pre-wrap"
        }}
      >
        {response}
      </pre>

    </main>
  );
}
