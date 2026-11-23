import "./globals.css";
import Sidebar from "../components/layout/Sidebar";

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>
        <div
          style={{
            display: "flex"
          }}
        >
          <Sidebar />

          <main
            style={{
              flex: 1,
              padding: "20px"
            }}
          >
            {children}
          </main>
        </div>
      </body>
    </html>
  );
}
