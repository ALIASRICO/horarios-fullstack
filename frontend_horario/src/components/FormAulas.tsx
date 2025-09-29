import { useState, useEffect, FormEvent } from "react";

interface Aula {
  id: number;
  nombre: string;
}

export default function FormAulas() {
  const [aulas, setAulas] = useState<Aula[]>([]);
  const [nombre, setNombre] = useState<string>("");

  // cargar aulas existentes
  useEffect(() => {
    fetch("http://localhost:4000/aulas")
      .then((res) => res.json())
      .then((data) => setAulas(data));
  }, []);

  // manejar envío
  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault();
    const res = await fetch("http://localhost:4000/aulas", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ nombre }),
    });
    const newAula: Aula = await res.json();
    setAulas([...aulas, newAula]);
    setNombre("");
  };

  return (
    <div>
      <h2>Formulario de Aulas</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          placeholder="Nombre del aula"
          value={nombre}
          onChange={(e) => setNombre(e.target.value)}
        />
        <button type="submit">Guardar</button>
      </form>

      <h3>Listado de Aulas</h3>
      <ul>
        {aulas.map((aula) => (
          <li key={aula.id}>{aula.nombre}</li>
        ))}
      </ul>
    </div>
  );
}
