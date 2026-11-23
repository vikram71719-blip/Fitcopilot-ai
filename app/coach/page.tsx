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
