import { Request, Response } from "express";
import { login, register as registerService } from "./auth.service";

export const loginController = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const { email, password } = req.body;

    const result = await login(email, password);
    res.json(result);
  } catch (error: any) {
    res.status(401).json({
      message: error.message || "Error al iniciar sesión",
    });
  }
};

export const registerController = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    await registerService(req.body);
    res.status(201).json({ message: "Usuario creado correctamente" });
  } catch (error: any) {
    res.status(400).json({
      message: error.message || "Error al registrar usuario",
    });
  }
};
