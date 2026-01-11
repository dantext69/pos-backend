// src/modules/products/products.service.ts
import { pool } from "../../config/database";
import { RowDataPacket, ResultSetHeader } from "mysql2/promise";

export interface Product {
  id: number;
  nombre: string;
  descripcion: string;
  precio: number;
  stock_unidades: number;
  peso_unitario: number;
  unidad_peso: "g" | "kg" | "lb";
  talla: string | null;
  imagen_url: string | null;
  estado: number;
  categoria_id: number;
  creado_en: Date;
  actualizado_en: Date;
}

/* ================== OBTENER ================== */
export const getProducts = async (): Promise<Product[]> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM productos ORDER BY creado_en DESC`
  );
  return rows as Product[];
};

/* ================== CREAR ================== */
export const createProduct = async (data: Omit<Product, "id" | "estado" | "creado_en" | "actualizado_en">) => {
  const [result] = await pool.query<ResultSetHeader>(
    `
    INSERT INTO productos
    (nombre, descripcion, precio, stock_unidades, peso_unitario, unidad_peso,
     talla, imagen_url, estado, categoria_id, creado_en, actualizado_en)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1, ?, NOW(), NOW())
    `,
    [
      data.nombre,
      data.descripcion,
      data.precio,
      data.stock_unidades,
      data.peso_unitario,
      data.unidad_peso,
      data.talla,
      data.imagen_url,
      data.categoria_id,
    ]
  );

  return {
    id: result.insertId,
    ...data,
    estado: 1,
    creado_en: new Date(),
    actualizado_en: new Date(),
  };
};

/* ================== ACTUALIZAR ================== */
export const updateProduct = async (
  id: number,
  data: Partial<Product>
): Promise<Product> => {
  const fields: string[] = [];
  const values: any[] = [];

  Object.entries(data).forEach(([key, value]) => {
    if (value !== undefined) {
      fields.push(`${key} = ?`);
      values.push(value);
    }
  });

  values.push(id);

  await pool.query<ResultSetHeader>(
    `UPDATE productos SET ${fields.join(", ")}, actualizado_en = NOW() WHERE id = ?`,
    values
  );

  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM productos WHERE id = ?`,
    [id]
  );

  return rows[0] as Product;
};

/* ================== ELIMINAR ================== */
export const deleteProduct = async (id: number): Promise<void> => {
  await pool.query<ResultSetHeader>(
    `UPDATE productos SET estado = 0 WHERE id = ?`,
    [id]
  );
};

export const getById = async (id: number): Promise<Product | null> => {
  const [rows]: any = await pool.query(
    "SELECT * FROM productos WHERE id = ? LIMIT 1",
    [id]
  );

  if (rows.length === 0) {
    return null;
  }

  return rows[0] as Product;
};
