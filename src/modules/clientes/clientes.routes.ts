import { Router } from "express";
import {
  listarClientes,
  buscarPorDocumento,
  crearCliente
} from "./clientes.controller";

import { authMiddleware } from "../../middlewares/auth.middleware";

const router = Router();

router.get("/", authMiddleware, listarClientes);
router.get("/documento/:documento", authMiddleware, buscarPorDocumento);
router.post("/", authMiddleware, crearCliente);

export default router;
