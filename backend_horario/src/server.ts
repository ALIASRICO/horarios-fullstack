import express, { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";
import cors from "cors";

const app = express();
const prisma = new PrismaClient();

app.use(cors());
app.use(express.json());

// Ejemplo: CRUD para la tabla aulas
app.get("/aulas", async (req: Request, res: Response) => {
  const aulas = await prisma.aulas.findMany();
  res.json(aulas);
});

app.post("/aulas", async (req: Request, res: Response) => {
  try {
    const newAula = await prisma.aulas.create({
      data: req.body,
    });
    res.json(newAula);
  } catch (error) {
    res.status(400).json({ error: "Error al crear aula", details: error });
  }
});

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
  console.log(`🚀 Backend corriendo en http://localhost:${PORT}`);
});
