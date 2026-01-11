import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";

export const authMiddleware = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const authHeader = req.headers.authorization;

  if (!authHeader) {
    return res.status(401).json({ message: "Token no enviado" });
  }

  const token = authHeader.split(" ")[1];

  try {
    const decoded: any = jwt.verify(token, process.env.JWT_SECRET!);

    // 🔑 AQUÍ se inyecta el usuario

    console.log("JWT decoded:", decoded);
   

    (req as any).user = {
      id: decoded.id
    };

    next();
  } catch {
    return res.status(401).json({ message: "Token inválido" });
  }
};
