"use client";

import { useEffect, useState } from "react";

import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer
} from "recharts";

export default function ProgressPage() {

  const [checkins,setCheckins] =
    useState<any[]>([]);

  useEffect(() => {

    const saved =
      localStorage.getItem(
        "fitcopilot-checkins"
      );

    if(saved){

      setCheckins(
        JSON.parse(saved)
      );
    }

  }, []);

  if(checkins.length === 0){

    return (
      <main style={{
        padding:"40px"
      }}>
        <h1>
          Progress Tracking
        </h1>

        <p>
          No check-ins found.
        </p>
      </main>
    );
  }

  const startWeight =
    checkins[0].weight;

  const currentWeight =
    checkins[
      checkins.length - 1
    ].weight;

  const lost =
    (
      startWeight -
      currentWeight
    ).toFixed(1);

  const chartData =
    checkins.map(
      (c,index) => ({
        name:
          `#${index+1}`,
        weight:
          c.weight
      })
    );

  return (

    <main style={{
      padding:"40px",
      maxWidth:"1100px"
    }}>

      <h1>
        Progress Tracking
      </h1>

      <hr />

      <h2>
        Weight Summary
      </h2>

      <p>
        Starting Weight:
        {" "}
        {startWeight} kg
      </p>

      <p>
        Current Weight:
        {" "}
        {currentWeight} kg
      </p>

      <p>
        Weight Lost:
        {" "}
        {lost} kg
      </p>

      <hr />

      <h2>
        Weight Progress Chart
      </h2>

      <div
        style={{
          width:"100%",
          height:"400px"
        }}
      >

        <ResponsiveContainer>

          <LineChart
            data={chartData}
          >

            <CartesianGrid
              strokeDasharray="3 3"
            />

            <XAxis
              dataKey="name"
            />

            <YAxis />

            <Tooltip />

            <Line
              type="monotone"
              dataKey="weight"
              stroke="#2563eb"
              strokeWidth={3}
            />

          </LineChart>

        </ResponsiveContainer>

      </div>

      <hr />

      <h2>
        History
      </h2>

      {
        checkins
        .slice()
        .reverse()
        .map((item,index)=>(

          <div
            key={index}
            style={{
              border:"1px solid #ddd",
              padding:"12px",
              marginBottom:"10px"
            }}
          >

            <p>
              Weight:
              {" "}
              {item.weight} kg
            </p>

            <p>
              Energy:
              {" "}
              {item.energy}
            </p>

            <p>
              Sleep:
              {" "}
              {item.sleep}
            </p>

            <p>
              Mood:
              {" "}
              {item.mood}
            </p>

            <p>
              Date:
              {" "}
              {item.date}
            </p>

          </div>

        ))
      }

    </main>

  );
}
