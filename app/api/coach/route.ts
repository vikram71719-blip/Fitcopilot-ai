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
