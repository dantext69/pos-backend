import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

import { findUserByEmail, createUser } from "../users/users.service";

/**
 * Datos para registro
 */
export interface RegisterData {
  nombre: string;
  email: string;
  password: string;
  rolId: number;
}

/**
 * Registro de usuario
 */
export const register = async (data: RegisterData): Promise<void> => {
  const { nombre, email, password, rolId } = data;

  const existingUser = await findUserByEmail(email);
  if (existingUser) {
    throw new Error("El email ya está registrado");
  }

  const hash = await bcrypt.hash(password, 10);

  await createUser({
    nombre,
    email,
    password: hash,
    rolId,
  });
};

/**
 * Login de usuario
 */
export const login = async (
  email: string,
  password: string
): Promise<{ token: string }> => {
  const user = await findUserByEmail(email);

  if (!user) {
    throw new Error("Usuario no encontrado");
  }

  if (user.estado !== 1) {
    throw new Error("Usuario inactivo");
  }

  const validPassword = await bcrypt.compare(password, user.password);
  if (!validPassword) {
    throw new Error("Credenciales inválidas");
  }

  const token = jwt.sign(
    {
      id: user.id,
      rolId: user.rol_id,
      estado: user.estado,
    },
    process.env.JWT_SECRET || "secret",
    { expiresIn: "8h" }
  );

  return { token };
};
