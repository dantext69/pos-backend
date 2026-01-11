import { pool } from "../../config/database";
import { RowDataPacket, ResultSetHeader } from "mysql2/promise";

export interface Cliente {
  id: number;
  nombre: string;
  cc: string;
  telefono: string | null;
  email: string | null;
  direccion: string | null;
  creado_en: Date;
}

/* ===============================
   OBTENER TODOS
   =============================== */
export const getClientes = async (): Promise<Cliente[]> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM clientes ORDER BY creado_en DESC`
  );
  return rows as Cliente[];
};

/* ===============================
   BUSCAR POR DOCUMENTO (CC)
   =============================== */
export const getClienteByDocumento = async (
  documento: string
): Promise<Cliente | null> => {
  const [rows] = await pool.query<RowDataPacket[]>(
    `SELECT * FROM clientes WHERE cc = ? LIMIT 1`,
    [documento]
  );

  if (rows.length === 0) return null;
  return rows[0] as Cliente;
};

/* ===============================
   CREAR CLIENTE
   =============================== */
export const createCliente = async (
  data: Omit<Cliente, "id" | "creado_en">
): Promise<Cliente> => {
  const [result] = await pool.query<ResultSetHeader>(
    `INSERT INTO clientes (nombre, cc, telefono, email, direccion, creado_en)
     VALUES (?, ?, ?, ?, ?, NOW())`,
    [data.nombre, data.cc, data.telefono,data.email, data.direccion]
  );

  return {
    id: result.insertId,
    ...data,
    creado_en: new Date()
  };
};
