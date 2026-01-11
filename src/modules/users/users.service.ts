import { pool } from "../../config/database";

/**
 * Representa el registro de la tabla usuarios
 */
export interface UsuarioDB {
  id: number;
  nombre: string;
  email: string;
  password: string;
  rol_id: number; // BD
  estado: number;
  creado_en: Date;
}

/**
 * Datos necesarios para crear un usuario (DOMINIO)
 */
export interface CreateUserData {
  nombre: string;
  email: string;
  password: string; // aquí irá el hash
  rolId: number; // CÓDIGO
}

/**
 * Busca un usuario por email
 */
export const findUserByEmail = async (
  email: string
): Promise<UsuarioDB | null> => {
  const [rows] = await pool.query(
    `SELECT *
     FROM usuarios
     WHERE email = ?
     LIMIT 1`,
    [email]
  );

  const result = rows as UsuarioDB[];
  return result.length ? result[0] : null;
};

/**
 * Crea un usuario activo por defecto (estado = 1)
 */
export const createUser = async (
  data: CreateUserData
): Promise<void> => {
  const { nombre, email, password, rolId } = data;

  await pool.query(
    `INSERT INTO usuarios (
      nombre,
      email,
      password,
      rol_id,
      estado
    ) VALUES (?, ?, ?, ?, 1)`,
    [nombre, email, password, rolId]
  );
};
