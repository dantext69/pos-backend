import { pool } from "../../config/database";
import { RowDataPacket, ResultSetHeader } from "mysql2/promise";

export interface Category {
  id: number;
  nombre: string;
  estado: "activo" | "inactivo";
  creado_en: Date;
  actualizado_en: Date;
}

// Obtener todas las categorías
export const getCategories = async (): Promise<Category[]> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    "SELECT id, nombre, estado, creado_en, actualizado_en FROM categorias"
  );
  return rows as Category[];
};

// Crear nueva categoría (solo recibe nombre, estado predeterminado en DB)
export const createCategory = async (data: { nombre: string }): Promise<Category> => {
  const [result] = await pool.query<ResultSetHeader>(
    "INSERT INTO categorias (nombre, creado_en, actualizado_en) VALUES (?, NOW(), NOW())",
    [data.nombre]
  );

  return {
    id: result.insertId,
    nombre: data.nombre,
    estado: "activo", // asumimos activo por defecto
    creado_en: new Date(),
    actualizado_en: new Date(),
  };
};

// Actualizar categoría
export const updateCategory = async (
  id: number,
  data: { nombre?: string; estado?: "activo" | "inactivo" }
): Promise<Category> => {
  const fields: string[] = [];
  const values: any[] = [];

  if (data.nombre) {
    fields.push("nombre = ?");
    values.push(data.nombre);
  }
  if (data.estado) {
    // Convertimos "activo"/"inactivo" a 1/0 para la DB
    const estadoNum = data.estado === "activo" ? 1 : 0;
    fields.push("estado = ?");
    values.push(estadoNum);
  }

  values.push(id);

  await pool.query<ResultSetHeader>(
    `UPDATE categorias SET ${fields.join(", ")}, actualizado_en = NOW() WHERE id = ?`,
    values
  );

  const [rows] = await pool.query<RowDataPacket[]>(
    "SELECT id, nombre, estado, creado_en, actualizado_en FROM categorias WHERE id = ?",
    [id]
  );

  return rows[0] as Category;
};

// Eliminar categoría
export const deleteCategory = async (id: number): Promise<void> => {
  await pool.query<ResultSetHeader>("UPDATE categorias SET estado = 0 WHERE id = ?", [id]);
};
